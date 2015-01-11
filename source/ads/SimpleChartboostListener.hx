package ads;

#if chartboostads

import extension.chartboost.ChartboostListener;
import flixel.FlxState;
import states.PlayState;

class SimpleChartboostListener extends ChartboostListener
{
	private var game:PlayState;
	
	public function new(game:PlayState) {
		this.game = game;
	}
	
	private function log(text:String):Void {
		trace(text);
		game.addText(text);
	}
	
	private function resumeGame():Void {
		if (game.subState == game.adFocusSubState) {
			game.openSubState(game.sampleSubState); // Note this works fine here but won't work once there are nested substates
		}
	}
	
	override public function shouldRequestInterstitial(location:String):Void {
		log("shouldRequestInterstitial: [" + location + "]");
	}
	
	override public function shouldDisplayInterstitial(location:String):Void {
		log("shouldDisplayInterstitial: [" + location + "]");
	}
	
	override public function didCacheInterstitial(location:String):Void {
		log("didCacheInterstitial: [" + location + "]");
	}
	
	override public function didFailToLoadInterstitial(location:String):Void {
		log("didFailToLoadInterstitial: [" + location + "]");
		resumeGame();
	}
	
	override public function didDismissInterstitial(location:String):Void {
		log("didDismissInterstitial: [" + location + "]");
		resumeGame(); // Note that both didDismissInterstitial and didCloseInterstitial get called when closing an ad normally
	}
	
	override public function didCloseInterstitial(location:String):Void {
		log("didCloseInterstitial: [" + location + "]");
		resumeGame();
	}
	
	override public function didClickInterstitial(location:String):Void {
		log("didClickInterstitial: [" + location + "]");
		resumeGame();
	}
	
	override public function didDisplayInterstitial(location:String):Void {
		log("didDisplayInterstitial: [" + location + "]");
	}
	
	override public function shouldRequestMoreApps(location:String):Void {
		log("shouldRequestMoreApps: [" + location + "]");
	}
	
	override public function shouldDisplayMoreApps(location:String):Void {
		log("shouldDisplayMoreApps: [" + location + "]");
	}
	
	override public function didFailToLoadMoreApps(location:String):Void {
		log("didFailToLoadMoreApps: [" + location + "]");
		resumeGame();
	}
	
	override public function didCacheMoreApps(location:String):Void {
		log("didCacheMoreApps: [" + location + "]");
	}
	
	override public function didDismissMoreApps(location:String):Void {
		log("didDismissMoreApps: [" + location + "]");
		resumeGame();
	}
	
	override public function didCloseMoreApps(location:String):Void {
		log("didCloseMoreApps: [" + location + "]");
		resumeGame();
	}
	
	override public function didClickMoreApps(location:String):Void {
		log("didClickMoreApps: [" + location + "]");
		resumeGame();
	}
	
	override public function didDisplayMoreApps(location:String):Void {
		log("didDisplayMoreApps: [" + location + "]");
	}
	
	override public function didFailToRecordClick(uri:String):Void {
		log("didFailToRecordClick: [" + uri + "]");
	}
	
	override public function shouldDisplayRewardedVideo(location:String):Void {
		log("shouldDisplayRewardedVideo: [" + location + "]");
	}
	
	override public function didCacheRewardedVideo(location:String):Void {
		log("didCacheRewardedVideo: [" + location + "]");
	}
	
	override public function didFailToLoadRewardedVideo(location:String):Void {
		log("didFailToLoadRewardedVideo: [" + location + "]");
		resumeGame();
	}
	
	override public function didDismissRewardedVideo(location:String):Void {
		log("didDismissRewardedVideo: [" + location + "]");
		resumeGame();
	}
	
	override public function didCloseRewardedVideo(location:String):Void {
		log("didCloseRewardedVideo: [" + location + "]");
		resumeGame();
	}
	
	override public function didClickRewardedVideo(location:String):Void {
		log("didClickRewardedVideo: [" + location + "]");
		resumeGame();
	}
	
	override public function didCompleteRewardedVideo(location:String, reward:Int):Void {
		log("didCompleteRewardedVideo: [" + location + "]");
	}
	
	override public function didDisplayRewardedVideo(location:String):Void {
		log("didDisplayRewardedVideo: [" + location + "]");
	}
	
	override public function willDisplayVideo(location:String):Void {
		log("willDisplayVideo: [" + location + "]");
	}
}

#end