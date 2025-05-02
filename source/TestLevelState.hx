package;

import flixel.FlxSprite;
import flixel.FlxState;

class TestLevelState extends FlxState
{
	function createCoOpL1(level:Int)
	{
		// Co-op LV1 collisions
		// other stuff
		var fade:FlxSprite = new FlxSprite(0, 0, AssetPaths.fade2__png);
		add(fade);
		if (level == 1)
		{
			var coOpL1:FlxSprite = new FlxSprite(0, 0, AssetPaths.cpL2IMAGE__png);
			add(coOpL1);
		}
	}
}
