package ads;

#if chartboostads

import extension.chartboost.ChartboostListener;
import extension.chartboost.ChartboostError;
import flixel.FlxState;
import states.PlayState;

class SimpleChartboostListener extends ChartboostListener {
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
			game.openSubState(game.sampleSubState); // Note this works fine for now but won't work if there were nested substates
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
	
	override public function didFailToLoadInterstitial(location:String, error:Int):Void {
		log("didFailToLoadInterstitial: [" + location + "] [" + ChartboostError.descriptionForImpressionError(error) + "]");
		resumeGame();
	}
	
	override public function willDisplayInterstitial(location:String):Void {
		log("willDisplayInterstitial: [" + location + "]");
	}
	
	override public function didDismissInterstitial(location:String):Void {
		log("didDismissInterstitial: [" + location + "]");
		resumeGame(); // Note that both didDismissInterstitial and didCloseInterstitial get called when closing an ad normally
	}
	
	// NOTE there may be some cases where you can get stuck if it's possible to close an ad e.g. a video by pressing the "hardware back" button on Android without receiving these events
	// You'll need to find places where that kind of thing can happen and add workarounds in your game
	// In this demo, the AdFocusSubState is exited and the game resumes if the user taps enough times - which might be an OK workaround where this issue is a rare edge case...
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
	
	override public function didFailToRecordClick(uri:String, error:Int):Void {
		log("didFailToRecordClick: [" + uri + "] [" + ChartboostError.descriptionForClickError(error) + "]");
	}
	
	override public function shouldDisplayRewardedVideo(location:String):Void {
		log("shouldDisplayRewardedVideo: [" + location + "]");
	}
	
	override public function didCacheRewardedVideo(location:String):Void {
		log("didCacheRewardedVideo: [" + location + "]");
	}
	
	override public function didFailToLoadRewardedVideo(location:String, error:Int):Void {
		log("didFailToLoadRewardedVideo: [" + location + "] [" + ChartboostError.descriptionForImpressionError(error) + "]");
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
	
	override public function didInitialize(status:Bool):Void {
		log("didInitialize: [" + status + "]");
	}
}

#end