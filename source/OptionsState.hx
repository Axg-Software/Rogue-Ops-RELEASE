package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class OptionsState extends FlxState
{
	var bg:FlxSprite = new FlxSprite(-23, -10, AssetPaths.menuBG__png);
	var fade:FlxSprite = new FlxSprite(0, 0, AssetPaths.fade2__png);
	var quitbutton:FlxSprite = new FlxSprite(1104, 631, AssetPaths.quit__png);
	var optionsHeader:FlxSprite = new FlxSprite(365, 15, AssetPaths.optionsHeader__png);
	var noOptionsYet:FlxSprite = new FlxSprite(460, 349, AssetPaths.noOptionsYet__png);

	var shotgunSelect:FlxSprite = new FlxSprite(1009, 647, AssetPaths.shotGun_Pump__png);

	override function create()
	{
		super.create();
		FlxG.camera.fade(FlxColor.BLACK, 0.5, true, null, false);

		add(bg);
		add(fade);
		add(quitbutton);
		add(optionsHeader);
		add(noOptionsYet);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(quitbutton))
		{
			add(shotgunSelect);
			if (FlxG.mouse.justPressed)
			{
				FlxG.switchState(new MenuState());
			}
		}
		else
		{
			remove(shotgunSelect);
		}
	}
}
