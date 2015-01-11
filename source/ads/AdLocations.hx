package ads;

class AdLocations
{
	#if chartboostads
	public static inline var SAMPLE_INTERSTITIAL_LOCATION:String = "cb_interstitial";
	public static inline var SAMPLE_MORE_APPS_LOCATION:String = "cb_more_apps";
	public static inline var SAMPLE_REWARDED_VIDEO_LOCATION:String = "cb_rewarded_video";
	#else
	public static inline var SAMPLE_INTERSTITIAL_LOCATION:String = "n/a";
	public static inline var SAMPLE_MORE_APPS_LOCATION:String = "n/a";
	public static inline var SAMPLE_REWARDED_VIDEO_LOCATION:String = "n/a";
	#end
}