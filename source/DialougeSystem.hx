package;

import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class DialougeBox extends FlxSprite
{
	public function new()
	{
		// Create Text box
		super();
		this.makeGraphic(480, 128, FlxColor.BLUE);
	}
}

class Text extends FlxText
{
	public function new()
	{
		super();
		this.setFormat(null, 20, FlxColor.WHITE, null);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}

class TextFunctions extends FlxBasic
{
	public static function nextPage(_FlxText:FlxText, NewText:String)
	{
		_FlxText.text = NewText;
	}
}
