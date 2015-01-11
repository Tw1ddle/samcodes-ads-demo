package ads;

#if chartboostads
import extension.chartboost.Chartboost;
import extension.chartboost.ChartboostListener;
#end

// A wrapper in case I want to switch to another ads service easily in the future
class AdsWrapper
{
	public static function init():Void {
		#if chartboostads
		
		#if android
		Chartboost.init(); // For Android you need to set the appID and appSignature in your Project.xml
		#end
		#if ios
		Chartboost.init("54b1d0990d602560ebed4cfa", "c35707ef61c1b3525e478b9ff6ec2fe97aaaf36c");
		#end
		
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

	public static function hasCachedInterstitial(id:String):Bool {
		#if chartboostads
		return Chartboost.hasCachedInterstitial(id);
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
	
	public static function hasCachedMoreApps(id:String):Bool {
		#if chartboostads
		Chartboost.hasCachedMoreApps(id);
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
	
	public static function hasCachedRewardedVideo(id:String):Bool {
		#if chartboostads
		return Chartboost.hasCachedRewardedVideo(id);
		#end
		
		return false;
	}
}