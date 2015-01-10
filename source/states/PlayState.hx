package states ;

import ads.MyChartboostListener;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;
import source.states.SampleSubState;

class PlayState extends FlxState {
	public var uiCamera:FlxCamera;
	
	public var interstitialSubState:InterstitialSubState;
	public var sampleSubState:SampleSubState;
	
	public function showInterstitial(id:String):Void {
		Chartboost.showInterstitial(id);
	}
	
	override public function create():Void {
		super.create();
		
		persistentDraw = true;
		persistentUpdate = true;
		destroySubStates = false;
		
		uiCamera = new FlxCamera(0, 0, Std.int(FlxG.width), Std.int(FlxG.height));
		uiCamera.bgColor = FlxColor.TRANSPARENT;
		FlxG.cameras.add(uiCamera);
		FlxCamera.defaultCameras = [uiCamera];
		
		sampleSubState = new SampleSubState(this);
		interstitialSubState = new InterstitialSubState(this);
		
		openSubState(sampleSubState);
		
		Chartboost.setListener(new MyChartboostListener(this));
	}
	
	override public function update(dt:Float):Void {		
		super.update(dt);
	}
	
	override public function draw():Void {
		super.draw();
	}
}