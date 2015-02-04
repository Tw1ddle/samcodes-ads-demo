package states;

import ads.AdsWrapper;
import flixel.FlxSubState;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;

enum FocusStealingAdType {
	STATIC_INTERSTITIAL;
	VIDEO_INTERSTITIAL;
	MORE_APPS_PAGE;
}

class AdFocusSubState extends FlxSubState
{
	public var game:PlayState;
	public var created:Bool = false;
	
	public var adType:FocusStealingAdType = null;
	public var location:String = null;
	
	public var substateText:TextItem;
	
	public function new(game:PlayState) {
		super();
		this.game = game;
	}
	
	override public function create():Void {
		super.create();
		destroySubStates = false;
		
		if (!created) {			
			substateText = new TextItem(0, 0, "Ad Focused Substate", 24);
			FlxSpriteUtil.screenCenter(substateText, true, false);
			substateText.y = 10;
			add(substateText);
			created = true;
		}
	}
	
	public function init():Void {
		if (adType == null || location == null) {
			return;
		}
		
		// This is a bit of a hack: if an ad is shown instantaneously and it a type that causes the engine to stop updating,
		// the engine will only change to the ad focus substate after the interstitial has been dismissed. 
		// If an ad listener is set to close the ad substate on interstitial dismissal, it would get stuck because of this.
		// Therefore wait until the engine has definitely changed the game substate to the ad focus substate before requesting to display the interstitial.
		var timer = new FlxTimer();
		timer.start(0.05, function(t:FlxTimer):Void {
			game.addText("Waiting for ad focus substate (loops: " + t.elapsedLoops + ")");
			
			if (game.subState == game.adFocusSubState) { // Note this will break with nested substates
				t.cancel();
				
				game.addText("Ad Focus Substate entered. Requesting ad...");
				
				switch(adType) {
					case STATIC_INTERSTITIAL:
						if(AdsWrapper.hasCachedInterstitial(location)) {
							AdsWrapper.showInterstitial(location);
						} else {
							closeDueToNoCaching();
						}
					case VIDEO_INTERSTITIAL:
						if (AdsWrapper.hasCachedMoreApps(location)) {
							AdsWrapper.showRewardedVideo(location);
						} else {
							closeDueToNoCaching();
						}
						
					case MORE_APPS_PAGE:
						if (AdsWrapper.hasCachedRewardedVideo(location)) {
							AdsWrapper.showMoreApps(location);
						} else {
							closeDueToNoCaching();
						}
				}
			}
		}, 0);
	}
	
	private function closeDueToNoCaching():Void {
		game.addText("Closing ad focus substate because the requested ad has not been cached.");
		close();
		game.openSubState(game.sampleSubState);
	}
}