package ads;

import extension.haxeChartboost.ChartboostListener;
import extension.haxeChartboost.HaxeChartboost;

class Chartboost
{
	#if ios
	public static function init():Void {
		HaxeChartboost.start("5489b75e04b0162569f9bf45", "882d59d38a33a2682c2896ece799196944ad380e");
	}
	#end
	
	public static function setListener(listener:ChartboostListener):Void {
		HaxeChartboost.setListener(listener);
	}
	
	public static function showInterstitial(id:String):Void {
		HaxeChartboost.showInterstitial(id);
	}

	public static function cacheInterstitial(id:String):Void {
		HaxeChartboost.cacheInterstitial(id);
	}

	public static function hasCachedInterstitial(id:String):Bool {
		return HaxeChartboost.hasCachedInterstitial(id);
	}
}