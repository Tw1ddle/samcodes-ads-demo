package ads;

#if chartboostads
import extension.chartboost.Chartboost;
import extension.chartboost.ChartboostListener;
#end

#if admobads
import extension.admob.AdMob;
import extension.admob.AdMobListener;
import extension.admob.AdMobGravity;
#end

// A wrapper so I can switch between ads services easily
class AdsWrapper {
	public static function init():Void {
		#if chartboostads
		#if android
		Chartboost.init(); // For Android you set the appID and appSignature in your Project.xml
		#end
		#if ios
		// Enter your app id and app signature here for iOS! Enter your ids in your Project.xml for Android
		var appId: String = "YOUR_ID";
		var appSignature:String = "YOUR_SIG";
		if (appId == "YOUR_ID" || appSignature == "YOUR_SIG") {
			throw "You have not added your Chartboost iOS app id or app signature. Add them in AdsWrapper.hx!";
		}
		Chartboost.init(appId, appSignature);
		#end
		// Configure the Chartboost SDK
		var shouldRequestInterstitials = true;
		var willPrefetchVideos = true;
		var willHideSystemUI = true;
		var willDisplayLoadingView = false;
		var customPostId = "HAXEFLIXEL_DEMO_APP";
		trace("Will show interstitials in first session: " + shouldRequestInterstitials);
		trace("Will prefetch video content: " + willPrefetchVideos);
		trace("Will hide system UI for ads: " + willHideSystemUI);
		trace("Will display loading view for more apps: " + willDisplayLoadingView);
		trace("Will use custom POST id: " + customPostId);
		Chartboost.setShouldRequestInterstitialsInFirstSession(shouldRequestInterstitials);
		Chartboost.setShouldPrefetchVideoContent(willPrefetchVideos);
		Chartboost.setShouldHideSystemUI(willHideSystemUI);
		Chartboost.setShouldDisplayLoadingViewForMoreApps(willDisplayLoadingView);
		Chartboost.setCustomId(customPostId);
		#end
		
		#if admobads
		#if android
		AdMob.init();
		#end
		#if ios
		AdMob.init("YOUR_HASHED_TEST_DEVICE_ID");
		#end
		#end
	}
	
	#if chartboostads
	public static function setListener(listener:ChartboostListener):Void {
		Chartboost.setListener(listener);
	}
	#end
	
	#if admobads
	public static function setListener(listener:AdMobListener):Void {
		AdMob.setListener(listener);
	}
	#end
	
	public static function refreshBanner(id:String):Void {
		#if admobads
		AdMob.refreshBanner(id);
		#end
	}
	
	public static function showBanner(id:String):Void {
		#if admobads
		AdMob.showBanner(id);
		#end
	}
	
	public static function hideBanner(id:String):Void {
		#if admobads
		AdMob.hideBanner(id);
		#end
	}
	
	#if admobads
	public static function setBannerPosition(horizontal:AdMobHorizontalGravity, vertical:AdMobVerticalGravity):Void {
		AdMob.setBannerPosition(horizontal, vertical);
	}
	#end
	
	public static function showInterstitial(id:String):Void {
		#if chartboostads
		Chartboost.showInterstitial(id);
		#end
		
		#if admobads
		AdMob.showInterstitial(id);
		#end
	}

	public static function cacheInterstitial(id:String):Void {
		#if chartboostads
		Chartboost.cacheInterstitial(id);
		#end
		
		#if admobads
		AdMob.cacheInterstitial(id);
		#end
	}

	public static function hasInterstitial(id:String):Bool {
		#if chartboostads
		return Chartboost.hasInterstitial(id);
		#end
		
		#if admobads
		return AdMob.hasInterstitial(id);
		#end
		
		return false;
	}
	
	public static function showMoreApps(id:String):Void {
		#if chartboostads
		Chartboost.showMoreApps(id);
		#end
	}
	
	public static function cacheMoreApps(id:String):Void {
		#if chartboostads
		Chartboost.cacheMoreApps(id);
		#end
	}
	
	public static function hasMoreApps(id:String):Bool {
		#if chartboostads
		return Chartboost.hasMoreApps(id);
		#end
		
		return false;
	}
	
	public static function showRewardedVideo(id:String):Void {
		#if chartboostads
		Chartboost.showRewardedVideo(id);
		#end
	}
	
	public static function cacheRewardedVideo(id:String):Void {
		#if chartboostads
		Chartboost.cacheRewardedVideo(id);
		#end
	}
	
	public static function hasRewardedVideo(id:String):Bool {
		#if chartboostads
		return Chartboost.hasRewardedVideo(id);
		#end
		
		return false;
	}
	
	public static function closeImpression():Void {
		#if (chartboostads && android) // Unfortunately this is Android-only as of iOS SDK 6.5.0
		Chartboost.closeImpression();
		#end
		
		#if admobads
		// TODO
		#end
	}
}