package ads;

class AdLocations {
	#if chartboostads
	public static inline var DEMO_BANNER_LOCATION:String = "n/a";
	
	public static inline var SAMPLE_INTERSTITIAL_LOCATION:String = "cb_interstitial";
	public static inline var SAMPLE_MORE_APPS_LOCATION:String = "cb_more_apps";
	public static inline var SAMPLE_REWARDED_VIDEO_LOCATION:String = "cb_rewarded_video";
	#elseif admobads
	public static inline var DEMO_BANNER_LOCATION:String = "YOUR_ADMOB_BANNER_ID";
	
	public static inline var SAMPLE_INTERSTITIAL_LOCATION:String = "YOUR_ADMOB_INTERSTITIAL_ID";
	public static inline var SAMPLE_MORE_APPS_LOCATION:String = "n/a";
	public static inline var SAMPLE_REWARDED_VIDEO_LOCATION:String = "n/a";
	#else
	public static inline var DEMO_BANNER_LOCATION:String = "n/a";
	
	public static inline var SAMPLE_INTERSTITIAL_LOCATION:String = "n/a";
	public static inline var SAMPLE_MORE_APPS_LOCATION:String = "n/a";
	public static inline var SAMPLE_REWARDED_VIDEO_LOCATION:String = "n/a";
	#end
}