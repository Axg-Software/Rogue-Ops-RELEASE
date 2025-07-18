package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.gamepad.FlxGamepad;
import flixel.sound.FlxSound;
import flixel.util.FlxColor;

class CreditsState extends FlxState
{
	var creditsBG:FlxSprite = new FlxSprite(0, 0, AssetPaths.creditsBG__png);
	var creditsCredits:FlxSprite = new FlxSprite(21, 71, AssetPaths.creditsCREDITS__png);
	var rougeopsTITLE:FlxSprite = new FlxSprite(694, 285, AssetPaths.title__png);
	var quitbutton:FlxSprite = new FlxSprite(1104, 631, AssetPaths.quit__png);

	var shotgunSelect:FlxSprite = new FlxSprite(1009, 647, AssetPaths.shotGun_Pump__png);
	var fade:FlxSprite = new FlxSprite(0, 0, AssetPaths.fade2__png);

	var clickSound:FlxSound;

	var selected:Int = 1;

	override public function create()
	{
		super.create();
		FlxG.camera.fade(FlxColor.BLACK, 0.5, true, null, false);
		clickSound = FlxG.sound.load(AssetPaths.mouse_Click__ogg);

		add(creditsBG);
		add(fade);
		add(creditsCredits);
		add(rougeopsTITLE);
		add(quitbutton);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.justPressed)
		{
			clickSound.play();
		}

		if (FlxG.save.data.controllerSupport == "yes")
		{
			var pad:FlxGamepad = FlxG.gamepads.firstActive;

			if (pad != null)
			{
				if (pad.justPressed.DPAD_DOWN)
				{
					selected = selected + 1;
				}
				else if (pad.justPressed.DPAD_UP)
				{
					selected = selected - 1;
				}

				if (selected <= 1)
				{
					selected = 1;
				}
				else if (selected >= 1)
				{
					selected = 2;
				}

				if (selected == 1)
				{
					// Nothing lolll
				}
				else if (selected == 2)
				{
					add(shotgunSelect);
					if (pad.justPressed.A)
					{
						FlxG.switchState(new MenuState());
					}
				}
			}
		}
		else if (FlxG.save.data.controllerSupport == "no" || FlxG.save.data.controllerSupport == null)
		{
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
}
