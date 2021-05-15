package ads;

#if chartboostads
import extension.chartboost.Chartboost;
import extension.chartboost.ChartboostConsent;
import extension.chartboost.ChartboostListener;
#end

// A wrapper so I can switch between ads services easily
class AdsWrapper {
	public static function init():Void {
		#if chartboostads
		
		var appId:String = "YOUR_APP_ID_HERE";
		var appSignature:String = "YOUR_APP_SIGNATURE_HERE";
		
		if (appId == "YOUR_APP_ID_HERE" || appSignature == "YOUR_APP_SIGNATURE_HERE") {
			throw "Enter your Chartboost app id and signature in AdsWrapper.hx!";
		}
		
		Chartboost.initChartboost(appId, appSignature);
		
		// Configure the Chartboost SDK
		var shouldRequestInterstitials = true;
		var willPrefetchVideos = true;
		var willHideSystemUI = true;
		var customPostId = "HAXEFLIXEL_DEMO_APP";
		trace("Will show interstitials in first session: " + shouldRequestInterstitials);
		trace("Will prefetch video content: " + willPrefetchVideos);
		trace("Will hide system UI for ads: " + willHideSystemUI);
		trace("Will use custom POST id: " + customPostId);
		Chartboost.setShouldRequestInterstitialsInFirstSession(shouldRequestInterstitials);
		Chartboost.setShouldPrefetchVideoContent(willPrefetchVideos);
		Chartboost.setShouldHideSystemUI(willHideSystemUI);
		Chartboost.setCustomId(customPostId);
		Chartboost.setPIDataUseConsent(ChartboostConsent.YES_BEHAVIORAL);
		
		#end
	}
	
	#if chartboostads
	public static function setListener(listener:ChartboostListener):Void {
		Chartboost.setListener(listener);
	}
	#end
	
	public static function showInterstitial(id:String):Void {
		#if chartboostads
		Chartboost.showInterstitial(id);
		#end
	}

	public static function cacheInterstitial(id:String):Void {
		#if chartboostads
		Chartboost.cacheInterstitial(id);
		#end
	}

	public static function hasInterstitial(id:String):Bool {
		#if chartboostads
		return Chartboost.hasInterstitial(id);
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
		#if (chartboostads)
		Chartboost.closeImpression();
		#end
	}
}