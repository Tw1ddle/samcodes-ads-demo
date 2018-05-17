package states;

import ads.AdsWrapper;
import ads.SimpleAdMobListener;
import ads.SimpleChartboostListener;
import flixel.FlxState;
import flixel.util.FlxColor;
import openfl.Lib;
import openfl.events.Event;
import states.SampleSubState;

#if admobads
import extension.admob.AdMobGravity;
#end

#if chartboostads
import extension.chartboost.Chartboost;
#end

class PlayState extends FlxState {
	private var adEventText:TextItem;
	public var adFocusSubState:AdFocusSubState;
	public var sampleSubState:SampleSubState;
	
	override public function create():Void {
		super.create();
		destroySubStates = false;
		
		bgColor = FlxColor.BLACK;
		
		adEventText = new TextItem(0, 0, "Initializing...", 12);
		add(adEventText);
		
		addText("Will setup bindings...");
		AdsWrapper.init();
		addText("Setup bindings...");
		
		#if chartboostads
		addText("Using Chartboost SDK version: " + Chartboost.getSDKVersion());
		#end
		
		// Note that since the listener is set up after the AdsWrapper init call, an initialization callback might be missed by our Haxe code
		#if chartboostads
		AdsWrapper.setListener(new SimpleChartboostListener(this));
		addText("Set Chartboost listener");
		#end
		#if admobads
		AdsWrapper.setListener(new SimpleAdMobListener(this));
		addText("Set AdMob listener");
		#end
		
		#if admobads
		AdsWrapper.setBannerPosition(AdMobHorizontalGravity.CENTER, AdMobVerticalGravity.BOTTOM);
		#end
		
		sampleSubState = new SampleSubState(this);
		adFocusSubState = new AdFocusSubState(this);
		
		Lib.current.stage.addEventListener(Event.ACTIVATE, function(p:Dynamic):Void {
			addText("App received ACTIVATE event");
		});
		Lib.current.stage.addEventListener(Event.DEACTIVATE, function(p:Dynamic):Void {
			addText("App received DEACTIVATE event");
		});
		
		openSubState(sampleSubState);
	}
	
	public function addText(text:String):Void {
		adEventText.text = text + "\n" + adEventText.text;
	}
	
	public function clearLog():Void {
		adEventText.text = "Waiting...";
	}
}