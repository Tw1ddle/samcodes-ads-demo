package states;

import ads.AdsWrapper;
import flixel.FlxG;
import flixel.FlxSubState;
import flixel.util.FlxAxes;
import flixel.util.FlxTimer;

enum FocusStealingAdType {
	STATIC_INTERSTITIAL;
	VIDEO_INTERSTITIAL;
	MORE_APPS_PAGE;
}

class AdFocusSubState extends FlxSubState {
	public var game:PlayState;
	public var created:Bool = false;
	
	public var adType:FocusStealingAdType = null;
	public var location:String = null;
	
	public var substateText:TextItem;
	
	private var presentingTimer:FlxTimer = null;
	
	private static inline var tapsToExit:Int = 4;
	private var currentTaps:Int;
	
	public function new(game:PlayState) {
		super();
		this.game = game;
		presentingTimer = new FlxTimer();
	}
	
	override public function create():Void {
		super.create();
		destroySubStates = false;
		currentTaps = 0;
		
		if (!created) {
			substateText = new TextItem(0, 0, "Ad Focused Substate", 24);
			substateText.screenCenter(FlxAxes.X);
			substateText.y = 10;
			add(substateText);
			
			created = true;
		}
	}
	
	override public function update(dt:Float):Void {
		// Lets a user manually exit the state by tapping the screen multiple times. For when there is an ad SDK error that might otherwise trap the user
		if (FlxG.touches.justStarted() != null && FlxG.touches.justStarted().length != 0) {
			currentTaps++;
			game.addText("Ad focus substate got tap " + currentTaps);
		}
		if (currentTaps >= tapsToExit) {
			game.addText("Closing ad focus substate because user is probably stuck.");
			AdsWrapper.closeImpression();
			presentingTimer.cancel();
			close();
			game.openSubState(game.sampleSubState);
		}
	}
	
	public function init():Void {
		if (adType == null || location == null) {
			return;
		}
		
		// This is a bit of a hack: if an ad is shown instantaneously and is a type that causes the game to stop updating,
		// the game will only change to the ad focus substate after the interstitial has been dismissed.
		// If an ad listener is set to close the ad substate on interstitial dismissal, it would get stuck because of this.
		// Therefore wait until the game has definitely changed the current substate to the ad focus substate before requesting to display the interstitial.
		var timer = new FlxTimer();
		presentingTimer.start(0.05, function(t:FlxTimer):Void {
			game.addText("Waiting for ad focus substate (loops: " + t.elapsedLoops + ")");
			
			if (game.subState == game.adFocusSubState) { // Note this will break with nested substates
				t.cancel();
				
				game.addText("Ad Focus Substate entered. Waiting for ad...");
				
				switch(adType) {
					case STATIC_INTERSTITIAL:
						if(AdsWrapper.hasInterstitial(location)) {
							AdsWrapper.showInterstitial(location);
						} else {
							closeDueToNoCaching();
						}
					case VIDEO_INTERSTITIAL:
						if (AdsWrapper.hasRewardedVideo(location)) {
							AdsWrapper.showRewardedVideo(location);
						} else {
							closeDueToNoCaching();
						}
					case MORE_APPS_PAGE:
						if (AdsWrapper.hasMoreApps(location)) {
							AdsWrapper.showMoreApps(location);
						} else {
							closeDueToNoCaching();
						}
				}
			}
		}, 0);
	}
	
	private function closeDueToNoCaching():Void {
		game.addText("Closing ad focus substate because the requested ad had not been cached.");
		presentingTimer.cancel();
		close();
		game.openSubState(game.sampleSubState);
	}
}