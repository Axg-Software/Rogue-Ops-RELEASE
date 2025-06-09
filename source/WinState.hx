package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class WinState extends FlxState // TODO: make it fade into and out of the state
{
	var bg:FlxSprite = new FlxSprite(0, 0, AssetPaths.winbg__png);
	var plr1wins:FlxSprite = new FlxSprite(162, 103, AssetPaths.plr1wins__png);
	var plr2wins:FlxSprite = new FlxSprite(140, 467, AssetPaths.plr2wins__png);
	var sda:FlxSprite = new FlxSprite(15, 680, AssetPaths.enterTOReplat__png);
	var fade:FlxSprite = new FlxSprite(0, 0, AssetPaths.fade2__png);
	var cmmpgnORcoop:Int;

	var www:Bool;

	public function new(WW:Bool) // true = player 1, false = player 2 won
	{
		super();
		www = WW;
	}

	override function create()
	{
		super.create();
		FlxG.camera.fade(FlxColor.BLACK, 0.5, true, null, false);

		add(bg);
		if (www == true)
		{
			add(plr1wins);
		}
		else if (www == false)
		{
			add(plr2wins);
		}
		add(fade);
		add(sda);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER)
		{
			cmmpgnORcoop = 2;
			FlxG.switchState(new LevelSelectState(cmmpgnORcoop, 0));
		}
		else if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MenuState());
		}
	}
}
