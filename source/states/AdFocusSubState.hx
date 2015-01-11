package states;

import ads.AdsWrapper;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxSpriteUtil;

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
		
		switch(adType) {
			case STATIC_INTERSTITIAL:
				AdsWrapper.showInterstitial(location);
			case VIDEO_INTERSTITIAL:
				AdsWrapper.showRewardedVideo(location);
			case MORE_APPS_PAGE:
				AdsWrapper.showMoreApps(location);
		}
	}
}