package;

import flixel.text.FlxText;

class TextItem extends FlxText {
	public function new(x:Float = 0, y:Float = 0, text:String = "-", size:Int = 12) {
		super(x, y, 0, text, size);
		this.font = "westa_seven";
	}
}