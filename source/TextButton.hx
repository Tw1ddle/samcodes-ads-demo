package;

import flixel.ui.FlxButton;

class TextButton extends FlxButton {
	public function new(x:Float=0, y:Float=0, ?text:String, ?onClick:Void->Void) {
		super(x, y, text, onClick);
		this.label.font = "westa_seven";
		this.label.size = 10;
	}
}