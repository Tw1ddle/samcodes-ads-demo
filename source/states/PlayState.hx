package states;

import ads.AdsWrapper;
import ads.SimpleChartboostListener;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;
import states.SampleSubState;

class PlayState extends FlxState {
	private var uiCamera:FlxCamera;	
	private var adEventText:TextItem;
	
	public var adFocusSubState:AdFocusSubState;
	public var sampleSubState:SampleSubState;
	
	public function addText(text:String):Void {
		adEventText.text = text + "\n" + adEventText.text;
	}
	
	public function clearLog():Void {
		adEventText.text = "Waiting...";
	}
	
	public function new():Void {
		super();
		destroySubStates = false;
		
		adEventText = new TextItem(0, 0, "Initializing...", 12);
		add(adEventText);
		
		uiCamera = new FlxCamera(0, 0, Std.int(FlxG.width), Std.int(FlxG.height));
		uiCamera.bgColor = FlxColor.TRANSPARENT;
		FlxG.cameras.add(uiCamera);
		FlxCamera.defaultCameras = [uiCamera];
		
		AdsWrapper.init();
		addText("Setup bindings...");
		
		#if chartboostads
		AdsWrapper.setListener(new SimpleChartboostListener(this));
		addText("Set listener");
		#end
		
		sampleSubState = new SampleSubState(this);
		adFocusSubState = new AdFocusSubState(this);
		
		openSubState(sampleSubState);
	}
}