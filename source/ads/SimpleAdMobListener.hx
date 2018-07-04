package ads;

#if admobads

import extension.admob.AdMobListener;
import flixel.FlxState;
import states.PlayState;

class SimpleAdMobListener extends AdMobListener {
	private var game:PlayState;
	
	public function new(game:PlayState) {
		super();
	
		this.game = game;
	}
	
	private function resumeGame():Void {
		game.addText("Calling resumeGame");
		if (game.subState == game.adFocusSubState) {
			game.addText("Closing ad focus substate");
			game.openSubState(game.sampleSubState); // Note this works fine for now but won't work if there were nested substates
		}
	}
	
	override private function log(text:String):Void {
		trace(text);
		game.addText(text);
	}
	
	override public function onBannerClosed(unitId:String):Void {
		log("onBannerClosed " + unitId);
	}
	
	override public function onBannerFailedToLoad(unitId:String):Void {
		log("onBannerFailedToLoad " + unitId);
	}
	
	override public function onBannerLeftApplication(unitId:String):Void {
		log("onBannerLeftApplication " + unitId);
	}
	
	override public function onBannerOpened(unitId:String):Void {
		log("onBannerOpened " + unitId);
	}
	
	override public function onBannerLoaded(unitId:String):Void {
		log("onBannerLoaded " + unitId);
	}
	
	override public function onInterstitialClosed(unitId:String):Void {
		log("onInterstitialClosed " + unitId);
		resumeGame();
	}
	
	override public function onInterstitialFailedToLoad(unitId:String):Void {
		log("onInterstitialFailedToLoad " + unitId);
		resumeGame();
	}
	
	override public function onInterstitialLeftApplication(unitId:String):Void {
		log("onInterstitialLeftApplication " + unitId);
		resumeGame();
	}
	
	override public function onInterstitialOpened(unitId:String):Void {
		log("onInterstitialOpened " + unitId);
	}
	
	override public function onInterstitialLoaded(unitId:String):Void {
		log("onInterstitialLoaded " + unitId);
	}
}

#end