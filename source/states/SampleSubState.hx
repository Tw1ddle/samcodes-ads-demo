package states;

import ads.AdLocations;
import ads.AdsWrapper;
import flixel.FlxG;
import flixel.FlxSubState;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxSpriteUtil;
import states.AdFocusSubState.FocusStealingAdType;
import states.PlayState;
import TextItem;

class SampleSubState extends FlxSubState
{
	private var created: Bool = false;
	private var game: PlayState;
	
	private var buttonsGroup: FlxTypedSpriteGroup<TextButton>;
	private var cacheInterstitialButton: TextButton;
	private var showInterstitialButton: TextButton;
	private var cacheMoreAppsButton: TextButton;
	private var showMoreAppsButton: TextButton;
	private var cacheRewardedVideoButton: TextButton;
	private var showRewardedVideoButton: TextButton;
	private var clearTextLogButton: TextButton;
	
	public function new(game:PlayState) {
		super();
		this.game = game;
	}
	
	override public function create():Void {
		super.create();
		
		destroySubStates = false;
		
		if(!created) {			
			buttonsGroup = new FlxTypedSpriteGroup<TextButton>();
			
			cacheInterstitialButton = new TextButton(0, 0, "Cache Interstitial", onCacheInterstitialClick);
			showInterstitialButton = new TextButton(0, 0, "Show Interstitial", onShowInterstitialClick);
			cacheMoreAppsButton = new TextButton(0, 0, "Cache More Apps", onCacheMoreAppsClick);
			showMoreAppsButton = new TextButton(0, 0, "Show More Apps", onShowMoreAppsClick);
			cacheRewardedVideoButton = new TextButton(0, 0, "Cache Video", onCacheRewardedVideoClick);
			showRewardedVideoButton = new TextButton(0, 0, "Show Video", onShowRewardedVideoClick);
			clearTextLogButton = new TextButton(0, 0, "Clear Text Log", onClearTextLogClick);
			
			var x = 0;
			for (button in [cacheInterstitialButton, showInterstitialButton, cacheMoreAppsButton, showMoreAppsButton, cacheRewardedVideoButton, showRewardedVideoButton, clearTextLogButton]) {
				button.x = x;
				button.scale.set(1, 4);
				button.updateHitbox();
				button.label.offset.y = -20;
				x += cast button.width + 30;
				buttonsGroup.add(button);
			}
			
			FlxSpriteUtil.screenCenter(buttonsGroup, true, false);
			buttonsGroup.y = FlxG.height * 0.75;
			add(buttonsGroup);
			
			#if (ios || android)
			var msg:String = "Game Substate";
			#else
			var msg:String = "Build against Android or iOS targets!";
			#end
			
			var substateText:TextItem = new TextItem(0, 0, msg, 24);
			FlxSpriteUtil.screenCenter(substateText);
			add(substateText);
			
			created = true;
		}
	}
	
	private function onCacheInterstitialClick():Void {
		AdsWrapper.cacheInterstitial(AdLocations.SAMPLE_INTERSTITIAL_LOCATION);
	}
	
	private function onShowInterstitialClick():Void {
		game.adFocusSubState.adType = FocusStealingAdType.STATIC_INTERSTITIAL;
		game.adFocusSubState.location = AdLocations.SAMPLE_INTERSTITIAL_LOCATION;
		game.adFocusSubState.init();
		game.openSubState(game.adFocusSubState);
	}
	
	private function onCacheMoreAppsClick():Void {
		AdsWrapper.cacheMoreApps(AdLocations.SAMPLE_MORE_APPS_LOCATION);
	}
	
	private function onShowMoreAppsClick():Void {
		game.adFocusSubState.adType = FocusStealingAdType.MORE_APPS_PAGE;
		game.adFocusSubState.location = AdLocations.SAMPLE_MORE_APPS_LOCATION;
		game.adFocusSubState.init();
		game.openSubState(game.adFocusSubState);
	}
	
	private function onCacheRewardedVideoClick():Void {
		AdsWrapper.cacheRewardedVideo(AdLocations.SAMPLE_REWARDED_VIDEO_LOCATION);
	}
	
	private function onShowRewardedVideoClick():Void {
		game.adFocusSubState.adType = FocusStealingAdType.VIDEO_INTERSTITIAL;
		game.adFocusSubState.location = AdLocations.SAMPLE_REWARDED_VIDEO_LOCATION;
		game.adFocusSubState.init();
		game.openSubState(game.adFocusSubState);
	}
	
	private function onClearTextLogClick():Void {
		this.game.clearLog();
	}
}