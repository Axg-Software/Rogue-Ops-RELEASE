package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.sound.FlxSound;
import flixel.util.FlxColor;

class OptionsState extends FlxState
{
	var bg:FlxSprite = new FlxSprite(-23, -10, AssetPaths.menuBG__png);
	var fade:FlxSprite = new FlxSprite(0, 0, AssetPaths.fade2__png);
	var quitbutton:FlxSprite = new FlxSprite(1104, 631, AssetPaths.quit__png);
	var optionsHeader:FlxSprite = new FlxSprite(365, 15, AssetPaths.optionsHeader__png);
	var noOptionsYet:FlxSprite = new FlxSprite(460, 349, AssetPaths.noOptionsYet__png);

	var shotgunSelect:FlxSprite = new FlxSprite(1009, 647, AssetPaths.shotGun_Pump__png);

	// skip intro vars
	var skipIntroHEADER:FlxSprite = new FlxSprite(53, 176, AssetPaths.skipIntro__png);
	var skipIntroYes:FlxSprite = new FlxSprite(502, 176, AssetPaths.yesOption__png);
	var skipIntroNo:FlxSprite = new FlxSprite(502, 176, AssetPaths.noOption__png);
	var skipIntroSelected:Bool;

	// start fullscreen vars -- UN-USED RIGHT NOW
	var startFullscreenHEADER:FlxSprite = new FlxSprite(53, 221, AssetPaths.startFullscreen__png);
	var startfullscreenYes:FlxSprite = new FlxSprite(662, 221, AssetPaths.yesOption__png);
	var startfullscreenNo:FlxSprite = new FlxSprite(662, 221, AssetPaths.noOption__png);
	var startfullscreenSelected:Bool; // this is for v1.3 tehehe

	var clickSound:FlxSound;

	// Controller support vars
	var controllerSupportHeader:FlxSprite = new FlxSprite(54, 222, AssetPaths.controllerSupport__png);
	var controllerSupportYes:FlxSprite = new FlxSprite(544, 221, AssetPaths.yesOption__png);
	var controllerSupportNo:FlxSprite = new FlxSprite(544, 221, AssetPaths.noOption__png);
	var controllerSupportSelected:Bool;

	override function create()
	{
		super.create();
		FlxG.camera.fade(FlxColor.BLACK, 0.5, true, null, false);
		clickSound = FlxG.sound.load(AssetPaths.mouse_Click__ogg);

		add(bg);
		add(fade);
		add(quitbutton);
		add(optionsHeader);
		add(skipIntroHEADER);
		add(controllerSupportHeader);

		if (FlxG.save.data.name != null || FlxG.save.data.skipIntro == "yes")
		{
			add(skipIntroYes);
			skipIntroSelected = true;
		}
		else if (FlxG.save.data.skipIntro == null || FlxG.save.data.skipIntro == "no")
		{
			add(skipIntroNo);
			skipIntroSelected = false;
		}

		if (FlxG.save.data.name != null || FlxG.save.data.controllerSupport == "yes")
		{
			add(controllerSupportYes);
			controllerSupportSelected = true;
		}
		else if (FlxG.save.data.controllerSupport == null || FlxG.save.data.controllerSupport == "no")
		{
			add(controllerSupportNo);
			controllerSupportSelected = false;
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.justPressed)
		{
			clickSound.play();
		}

		if (FlxG.mouse.overlaps(skipIntroYes) && skipIntroSelected == true)
		{
			if (FlxG.mouse.justPressed)
			{
				skipIntroSelected = false;
			}
		}

		if (FlxG.mouse.overlaps(skipIntroNo) && skipIntroSelected == false)
		{
			if (FlxG.mouse.justPressed)
			{
				skipIntroSelected = true;
			}
		}

		if (skipIntroSelected == true)
		{
			remove(skipIntroNo);
			add(skipIntroYes);
		}

		if (skipIntroSelected == false)
		{
			remove(skipIntroYes);
			add(skipIntroNo);
		}

		// -------------------------------------------------------------------

		if (FlxG.mouse.overlaps(controllerSupportYes) && controllerSupportSelected == true)
		{
			if (FlxG.mouse.justPressed)
			{
				controllerSupportSelected = false;
			}
		}

		if (FlxG.mouse.overlaps(controllerSupportNo) && controllerSupportSelected == false)
		{
			if (FlxG.mouse.justPressed)
			{
				controllerSupportSelected = true;
			}
		}

		if (controllerSupportSelected == true)
		{
			remove(controllerSupportNo);
			add(controllerSupportYes);
		}

		if (controllerSupportSelected == false)
		{
			remove(controllerSupportYes);
			add(controllerSupportNo);
		}

		if (FlxG.mouse.overlaps(quitbutton))
		{
			add(shotgunSelect);
			if (FlxG.mouse.justPressed)
			{
				clickSound.play();
				if (skipIntroSelected == true)
				{
					add(skipIntroYes);
					FlxG.save.data.skipIntro = "yes";
					FlxG.save.flush();
				}
				else if (skipIntroSelected == false)
				{
					add(skipIntroNo);
					FlxG.save.data.skipIntro = "no";
					FlxG.save.flush();
				}

				if (controllerSupportSelected == true)
				{
					add(controllerSupportYes);
					FlxG.save.data.controllerSupport = "yes";
					FlxG.save.flush();
				}
				else if (controllerSupportSelected == false)
				{
					add(controllerSupportNo);
					FlxG.save.data.controllerSupport = "no";
					FlxG.save.flush();
				}
				FlxG.switchState(new MenuState());
			}
		}
		else
		{
			remove(shotgunSelect);
		}
	}
}
