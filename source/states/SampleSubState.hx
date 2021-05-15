package states;

import ads.AdLocations;
import ads.AdsWrapper;
import flixel.FlxG;
import flixel.FlxSubState;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.util.FlxAxes;
import states.AdFocusSubState.FocusStealingAdType;
import states.PlayState;

#if chartboostads
import extension.chartboost.Chartboost;
import extension.chartboost.ChartboostConsent;
#end

class SampleSubState extends FlxSubState {
	private var created: Bool = false;
	private var game: PlayState;
	
	private var buttonsGroup: FlxTypedSpriteGroup<TextButton>;
	private var cacheInterstitialButton:TextButton;
	private var showInterstitialButton:TextButton;
	private var cacheRewardedVideoButton:TextButton;
	private var showRewardedVideoButton:TextButton;
	private var getGDPRConsentStateButton:TextButton;
	private var setGDPRConsentStateButton:TextButton;
	private var clearTextLogButton:TextButton;
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
			cacheRewardedVideoButton = new TextButton(0, 0, "Cache Video", onCacheRewardedVideoClick);
			showRewardedVideoButton = new TextButton(0, 0, "Show Video", onShowRewardedVideoClick);
			getGDPRConsentStateButton = new TextButton(0, 0, "Get GDPR Consent", onGetGDPRConsentButtonClick);
			setGDPRConsentStateButton = new TextButton(0, 0, "Set GDPR Coonsent", onSetGDPRConsentButtonClick);
			
			clearTextLogButton = new TextButton(0, 0, "Clear Text Log", onClearTextLogClick);
			
			var buttons:Array<TextButton> = [];
			
			#if chartboostads
			buttons = [cacheInterstitialButton, showInterstitialButton, cacheRewardedVideoButton, showRewardedVideoButton, getGDPRConsentStateButton, setGDPRConsentStateButton, clearTextLogButton];
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
			
			#if ((ios || android) && (chartboostads))
			var msg:String = "Game Substate";
			#else
			var msg:String = "Usage instructions:\n1) Set the ad SDK to use at the top of Project.xml\n2) Build against Android or iOS targets\n3) Set ad ids in AdLocations.hx";
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
	
	private function onCacheRewardedVideoClick():Void {
		AdsWrapper.cacheRewardedVideo(AdLocations.SAMPLE_REWARDED_VIDEO_LOCATION);
	}
	
	private function onShowRewardedVideoClick():Void {
		game.adFocusSubState.adType = FocusStealingAdType.VIDEO_INTERSTITIAL;
		game.adFocusSubState.location = AdLocations.SAMPLE_REWARDED_VIDEO_LOCATION;
		game.adFocusSubState.init();
		game.openSubState(game.adFocusSubState);
	}
	
	private function onGetGDPRConsentButtonClick():Void {
		#if chartboostads
		var consent = Chartboost.getPIDataUseConsent();
		switch(consent) {
			case ChartboostConsent.UNKNOWN:
				game.addText("Got UNKNOWN Chartboost GDPR consent state");
			case ChartboostConsent.NO_BEHAVIORAL:
				game.addText("Got NO BEHAVIORAL Chartboost GDPR consent state");
			case ChartboostConsent.YES_BEHAVIORAL:
				game.addText("Got YES BEHAVIORAL Chartboost GDPR consent state");
			default:
				game.addText("Got invalid Chartboost GDPR consent state");
		}
		#end
	}
	
	#if chartboostads
	private var lastSetConsentState:ChartboostConsent = ChartboostConsent.NO_BEHAVIORAL;
	#end
	private function onSetGDPRConsentButtonClick():Void {
		#if chartboostads
		Chartboost.setPIDataUseConsent(lastSetConsentState);
		game.addText("Set consent state to: " + lastSetConsentState);
		lastSetConsentState = (lastSetConsentState == ChartboostConsent.NO_BEHAVIORAL) ? ChartboostConsent.YES_BEHAVIORAL : ChartboostConsent.NO_BEHAVIORAL;
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