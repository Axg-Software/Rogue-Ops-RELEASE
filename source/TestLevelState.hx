package;

import flixel.FlxSprite;
import flixel.FlxState;

class TestLevelState extends FlxState
{
	function createCoOpL1()
	{
		// Co-op LV1 collisions
		// other stuff
		var coOpL1:FlxSprite = new FlxSprite(0, 0, AssetPaths.cpL2IMAGE__png);
		var fade:FlxSprite = new FlxSprite(0, 0, AssetPaths.fade2__png);
		add(fade);
		add(coOpL1);
	}
}
