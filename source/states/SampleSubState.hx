package states;

import ads.AdLocations;
import ads.AdsWrapper;
import flixel.FlxG;
import flixel.FlxSubState;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.util.FlxAxes;
import states.AdFocusSubState.FocusStealingAdType;
import states.PlayState;

#if admobads
import extension.admob.AdMobGravity;
#end

class SampleSubState extends FlxSubState {
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
	private var refreshBannerButton:TextButton;
	private var showBannerButton:TextButton;
	private var hideBannerButton:TextButton;
	private var changeBannerPositionButton:TextButton;
	
	public function new(game:PlayState) {
		super();
		this.game = game;
	}
	
	override public function create():Void {
		super.create();
		
		destroySubStates = false;
		
		if(!created) {
			buttonsGroup = new FlxTypedSpriteGroup<TextButton>();
			
			refreshBannerButton = new TextButton(0, 0, "Refresh Banner", onRefreshBannerClick);
			showBannerButton = new TextButton(0, 0, "Show Banner", onShowBannerClick);
			hideBannerButton = new TextButton(0, 0, "Hide Banner", onHideBannerClick);
			changeBannerPositionButton = new TextButton(0, 0, "Random Banner Position", onChangeBannerPositionClick);
			cacheInterstitialButton = new TextButton(0, 0, "Cache Interstitial", onCacheInterstitialClick);
			showInterstitialButton = new TextButton(0, 0, "Show Interstitial", onShowInterstitialClick);
			cacheMoreAppsButton = new TextButton(0, 0, "Cache More Apps", onCacheMoreAppsClick);
			showMoreAppsButton = new TextButton(0, 0, "Show More Apps", onShowMoreAppsClick);
			cacheRewardedVideoButton = new TextButton(0, 0, "Cache Video", onCacheRewardedVideoClick);
			showRewardedVideoButton = new TextButton(0, 0, "Show Video", onShowRewardedVideoClick);
			clearTextLogButton = new TextButton(0, 0, "Clear Text Log", onClearTextLogClick);
			
			var buttons:Array<TextButton> = [];
			
			#if chartboostads
			buttons = [cacheInterstitialButton, showInterstitialButton, cacheMoreAppsButton, showMoreAppsButton, cacheRewardedVideoButton, showRewardedVideoButton, clearTextLogButton];
			#elseif admobads
			buttons = [cacheInterstitialButton, showInterstitialButton, refreshBannerButton, showBannerButton, hideBannerButton, changeBannerPositionButton, clearTextLogButton];
			#end
			
			var x:Float = 0;
			for (button in buttons) {
				button.x = x;
				button.scale.set(1, 4);
				button.updateHitbox();
				button.label.offset.y = -20;
				x += button.width + 30;
				buttonsGroup.add(button);
			}

			buttonsGroup.screenCenter(FlxAxes.X);
			buttonsGroup.y = FlxG.height * 0.75;
			add(buttonsGroup);
			
			#if (ios || android)
			var msg:String = "Game Substate";
			#else
			var msg:String = "Build against Android or iOS targets! Set ad ids in AdLocations.hx!";
			#end
			
			var substateText:TextItem = new TextItem(0, 0, msg, 16);
			substateText.screenCenter(FlxAxes.XY);
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
	
	private function onChangeBannerPositionClick():Void {
		#if admobads
		var horizontals = [ AdMobHorizontalGravity.LEFT, AdMobHorizontalGravity.CENTER, AdMobHorizontalGravity.RIGHT ];
		var verticals = [ AdMobVerticalGravity.BOTTOM, AdMobVerticalGravity.CENTER, AdMobVerticalGravity.TOP ];
		AdsWrapper.setBannerPosition(horizontals[Std.int(Math.random() * horizontals.length) - 1], verticals[Std.int(Math.random() * verticals.length) - 1]);
		#end
	}
	
	private function onShowBannerClick():Void {
		AdsWrapper.showBanner(AdLocations.DEMO_BANNER_LOCATION);
	}
	
	private function onHideBannerClick():Void {
		AdsWrapper.hideBanner(AdLocations.DEMO_BANNER_LOCATION);
	}
	
	private function onRefreshBannerClick():Void {
		AdsWrapper.refreshBanner(AdLocations.DEMO_BANNER_LOCATION);
	}
	
	private function onClearTextLogClick():Void {
		this.game.clearLog();
	}
}