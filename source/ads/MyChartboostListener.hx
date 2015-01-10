package ads;

import ads.Chartboost.ChartboostLocations;
import extension.haxeChartboost.ChartboostListener;
import flixel.FlxState;
import flixel.util.FlxTimer;
import openfl.Lib;
import states.PlayState;

class MyChartboostListener extends ChartboostListener
{
	private var game:PlayState;
	
	public function new(game:PlayState) {
		this.game = game;
	}
	
	private function resumeGame(location:String):Void {
		#if debug
		trace("Resuming game after interstitial at location[" + location + "]");
		#end
		
		var state:FlxState = game;
		
		while (state.subState != null) {
			if (state.subState != null) {
				state = game.subState;
			}
		}
		
		if (state == game.interstitialSubState) {
			if (location == ChartboostLocations.GAME_CLICK_PLAY || location == ChartboostLocations.GAME_CLICK_REPLAY) {
				game.interstitialSubState.switchState(game.nightSubState);
			}
			
			#if android
			if (location == ChartboostLocations.GAME_QUIT) {
				game.interstitialSubState.onExit();
				game.interstitialSubState.close();
			}
			#end
		}
	}
	
	private function quitGame(location:String):Void {
		new FlxTimer(1.0, function(t:FlxTimer):Void {
			Lib.exit();
		});
	}
	
	override public function shouldRequestInterstitial(location:String):Void {
		
	}
	
	override public function shouldDisplayInterstitial(location:String):Void {
		
	}
	
	override public function didCacheInterstitial(location:String):Void {
		
	}
	
	override public function didFailToLoadInterstitial(location:String):Void {
		#if android
		if (location == ChartboostLocations.GAME_QUIT) {
			quitGame(location);
		} else {
			resumeGame(location);
		}
		#else
		resumeGame(location);
		#end
	}
	
	override public function didDismissInterstitial(location:String):Void {
		
	}
	
	override public function didCloseInterstitial(location:String):Void {
		#if android
		if (location == ChartboostLocations.GAME_QUIT) {
			quitGame(location);
		} else {
			resumeGame(location);
		}
		#else
		resumeGame(location);
		#end
	}
	
	override public function didClickInterstitial(location:String):Void {
		#if android
		if (location == ChartboostLocations.GAME_QUIT) {
			quitGame(location);
		} else {
			resumeGame(location);
		}
		#else
		resumeGame(location);
		#end
	}
	
	override public function didDisplayInterstitial(location:String):Void {
		
	}
	
	override public function shouldRequestMoreApps(location:String):Void {
		
	}
	
	override public function shouldDisplayMoreApps(location:String):Void {
		
	}
	
	override public function didFailToLoadMoreApps(location:String):Void {
		
	}
	
	override public function didCacheMoreApps(location:String):Void {
		
	}
	
	override public function didDismissMoreApps(location:String):Void {
		
	}
	
	override public function didCloseMoreApps(location:String):Void {
		
	}
	
	override public function didClickMoreApps(location:String):Void {
		
	}
	
	override public function didDisplayMoreApps(location:String):Void {
		
	}
	
	override public function didFailToRecordClick(uri:String):Void {
		
	}
	
	override public function shouldDisplayRewardedVideo(location:String):Void {
		
	}
	
	override public function didCacheRewardedVideo(location:String):Void {
		
	}
	
	override public function didFailToLoadRewardedVideo(location:String):Void {
		
	}
	
	override public function didDismissRewardedVideo(location:String):Void {
		
	}
	
	override public function didCloseRewardedVideo(location:String):Void {
		
	}
	
	override public function didClickRewardedVideo(location:String):Void {
		
	}
	
	override public function didCompleteRewardedVideo(location:String):Void {
		
	}
	
	override public function didDisplayRewardedVideo(location:String):Void {
		
	}
	
	override public function willDisplayVideo(location:String):Void {
		
	}
}