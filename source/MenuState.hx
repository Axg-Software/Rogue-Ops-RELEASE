package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.sound.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	var menuBG:FlxSprite = new FlxSprite(-23, -10, AssetPaths.menuBG__png);
	var title:FlxSprite = new FlxSprite(22, 128, AssetPaths.title__png);
	var campaignButton:FlxSprite = new FlxSprite(22, 239, AssetPaths.campaign__png);
	var coOpButton:FlxSprite = new FlxSprite(22, 298, AssetPaths.coOp__png);
	var optionsButton:FlxSprite = new FlxSprite(22, 352, AssetPaths.options__png);
	var creditsButton:FlxSprite = new FlxSprite(22, 418, AssetPaths.credits__png);

	var shotgunSelect:FlxSprite = new FlxSprite(22, 0, AssetPaths.shotGun_Pump__png);

	var music:FlxSound;
	var clickSound:FlxSound;
	var cmmpgnORcoop:Int;

	var fade:FlxSprite = new FlxSprite(0, 0, AssetPaths.fade2__png);

	// version shit
	var gameV:FlxText = new FlxText(546, 531, FlxG.width, "Rouge Ops version: 1.1.0", 46);
	var engineV:FlxText = new FlxText(591, 606, FlxG.width, "RE 1.0", 46);

	override function create()
	{
		super.create();

		FlxG.camera.fade(FlxColor.BLACK, 1, true, null, false);
		music = FlxG.sound.load(AssetPaths.mainMenuMusicEffect__ogg);
		clickSound = FlxG.sound.load(AssetPaths.mouse_Click__ogg);

		add(menuBG);
		add(fade);
		add(title);
		add(campaignButton);
		add(coOpButton);
		add(optionsButton);
		add(creditsButton);
		music.play();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		// for debugging
		/*if (FlxG.keys.justPressed.R)
			{
				FlxG.save.erase();
				System.exit(999); // RIP
		}*/

		if (FlxG.mouse.overlaps(campaignButton))
		{
			shotgunSelect.y = 254;
			campaignButton.x = 126;
			add(shotgunSelect);
			if (FlxG.mouse.justPressed)
			{
				clickSound.play();
				cmmpgnORcoop = 1;
				if (FlxG.save.data.level != null)
				{
					music.stop();
					FlxG.switchState(new PlayState(cmmpgnORcoop, FlxG.save.data.level));
				}
				else if (FlxG.save.data.level == null)
				{
					music.stop();
					FlxG.save.data.level = 1;
					FlxG.save.flush();
					FlxG.switchState(new PlayState(cmmpgnORcoop, FlxG.save.data.level));
				}
			}
		}
		else if (!FlxG.mouse.overlaps(campaignButton))
		{
			campaignButton.x = 22;
		}

		if (FlxG.mouse.overlaps(coOpButton))
		{
			shotgunSelect.y = 314;
			coOpButton.x = 126;
			add(shotgunSelect);
			if (FlxG.mouse.justPressed)
			{
				music.stop();
				clickSound.play();
				cmmpgnORcoop = 2;
				FlxG.switchState(new LevelSelectState(cmmpgnORcoop, 0));
			}
		}
		else if (!FlxG.mouse.overlaps(coOpButton))
		{
			coOpButton.x = 22;
		}

		if (FlxG.mouse.overlaps(optionsButton))
		{
			shotgunSelect.y = 374;
			optionsButton.x = 126;
			add(shotgunSelect);
			if (FlxG.mouse.justPressed)
			{
				clickSound.play();
				FlxG.switchState(new OptionsState());
			}
		}
		else if (!FlxG.mouse.overlaps(optionsButton))
		{
			optionsButton.x = 22;
		}

		if (FlxG.mouse.overlaps(creditsButton))
		{
			shotgunSelect.y = 434;
			creditsButton.x = 126;
			add(shotgunSelect);
			if (FlxG.mouse.justPressed)
			{
				clickSound.play();
				FlxG.switchState(new CreditsState());
			}
		}
		else if (!FlxG.mouse.overlaps(creditsButton))
		{
			creditsButton.x = 22;
		}

		if (!FlxG.mouse.overlaps(creditsButton) && !FlxG.mouse.overlaps(optionsButton) && !FlxG.mouse.overlaps(coOpButton)
			&& !FlxG.mouse.overlaps(campaignButton))
		{
			remove(shotgunSelect);
		}

		if (FlxG.keys.pressed.V) // Just adding sum random stuff till release lmao
		{
			add(gameV);
			add(engineV);
		}
		else
		{
			remove(gameV);
			remove(engineV);
		}
	}
}
