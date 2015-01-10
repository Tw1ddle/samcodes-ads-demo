package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import source.ads.ChartboostLocations;

class InterstitialSubState extends FlxSubState
{
	public var overlay:FlxSprite;
	public var game:PlayState;
	
	public var created:Bool = false;
	
	public var uiGroup:FlxSpriteGroup = new FlxSpriteGroup();
	
	public var interstitialId:String = ChartboostLocations.GAME_CLICK_PLAY;
	
	public function new(game:PlayState) {
		this.game = game;
		
		super();
	}
	
	override public function create():Void {
		super.create();
		
		if (!created) {
			uiGroup.scrollFactor.set(0, 0);
			uiGroup.cameras = [game.uiCamera];
			
			overlay = new FlxSprite();
			var clr:FlxColor = new FlxColor(0x000000);
			clr.alphaFloat = 0.4;
			overlay.makeGraphic(FlxG.width, FlxG.height, clr, true, "cancelscreenblackoverlay");
			
			uiGroup.add(overlay);
			add(uiGroup);
			
			created = true;
		}
	}
	
	public function init():Void {
		game.persistentUpdate = false;
		persistentDraw = true;
		
		game.showInterstitial(interstitialId);
	}
	
	public function onExit():Void {
		game.persistentUpdate = true;
	}
}