package;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import openfl.system.Capabilities;
import states.PlayState;

class Main extends Sprite {
	var gameWidth:Int = 800; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var gameHeight:Int = 500; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
	
	var initialState:Class<FlxState> = PlayState;
	
	var zoom:Float = -1; // If -1, zoom is automatically calculated to fit the window dimensions.
	var framerate:Int = 60; // How many frames per second the game should run at.
	var skipSplash:Bool = true; // Whether to skip the flixel splash screen that appears in release mode.
	var startFullscreen:Bool = false; // Whether to start the game in fullscreen on desktop targets
	
	static public function main():Void {
		Lib.current.addChild(new Main());
	}
	
	public function new() {
		super();
		
		if (stage != null) {
			init();
		} else {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}
	
	private function init(?E:Event):Void  {
		if (hasEventListener(Event.ADDED_TO_STAGE)) {
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
#if ios
		// Workaround touch issue on iPhone 6 Plus and iPad Air, iPad Air 2 (tablet retina devices)
		var stageWidth:Int = Std.int(Math.max(Capabilities.screenResolutionX, Capabilities.screenResolutionY));
		var stageHeight:Int = Std.int(Math.min(Capabilities.screenResolutionX, Capabilities.screenResolutionY));
#else
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;
#end
		
		if (zoom == -1) {
			var ratioX:Float = stageWidth / gameWidth;
			var ratioY:Float = stageHeight / gameHeight;
			zoom = Math.min(ratioX, ratioY);
			gameWidth = Math.ceil(stageWidth / zoom);
			gameHeight = Math.ceil(stageHeight / zoom);
		}
		
		addChild(new FlxGame(gameWidth, gameHeight, initialState, zoom,
		                     framerate, framerate, skipSplash, startFullscreen));
							 
		FlxG.fixedTimestep = false;
	}
}