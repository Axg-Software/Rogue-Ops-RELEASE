package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.sound.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;
#if cpp
import sys.FileSystem;
import sys.io.File;
#end

class MenuState extends FlxState
{
	var menuBG:FlxSprite = new FlxSprite(-23, -10, AssetPaths.menuBG__png);
	var title:FlxSprite = new FlxSprite(22, 128, AssetPaths.title__png);
	var campaignButton:FlxSprite = new FlxSprite(22, 239, AssetPaths.campaign__png);
	var coOpButton:FlxSprite = new FlxSprite(22, 298, AssetPaths.coOp__png);
	var optionsButton:FlxSprite = new FlxSprite(22, 352, AssetPaths.options__png);
	var creditsButton:FlxSprite = new FlxSprite(22, 418, AssetPaths.credits__png);

	var level:FlxSprite = new FlxSprite(22, 663, AssetPaths.level__png);
	var rank:FlxSprite = new FlxSprite(1080, 663, AssetPaths.rank__png);

	var shotgunSelect:FlxSprite = new FlxSprite(22, 0, AssetPaths.shotGun_Pump__png);

	// levels
	var p1L1:FlxSprite = new FlxSprite(0, 0, AssetPaths.p1L1__png);
	var p1L2:FlxSprite = new FlxSprite(0, 0, AssetPaths.p1L2__png);
	var p1L3:FlxSprite = new FlxSprite(0, 0, AssetPaths.p1L3__png);
	var p1L4:FlxSprite = new FlxSprite(0, 0, AssetPaths.p1L4__png);

	var music:FlxSound;
	var cmmpgnORcoop:Int;

	var fade:FlxSprite = new FlxSprite(0, 0, AssetPaths.fade2__png);

	// version shit
	var gameV:FlxText = new FlxText(546, 531, FlxG.width, "Rouge Ops version: 1.0.0", 46);
	var engineV:FlxText = new FlxText(591, 606, FlxG.width, "RE Version: 1.0", 46);

	override function create()
	{
		super.create();

		FlxG.camera.fade(FlxColor.BLACK, 1, true, null, false);

		add(menuBG);
		add(fade);
		add(title);
		add(campaignButton);
		add(coOpButton);
		add(optionsButton);
		add(creditsButton);
		add(level);
		// add(rank);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(campaignButton))
		{
			shotgunSelect.y = 254;
			campaignButton.x = 126;
			add(shotgunSelect);
			if (FlxG.mouse.justPressed)
			{
				cmmpgnORcoop = 1;
				FlxG.switchState(new PlayState(cmmpgnORcoop, 1));
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
				cmmpgnORcoop = 2;
				FlxG.switchState(new PlayState(cmmpgnORcoop, 0));
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

		#if cpp
		var level = 'assets\\data\\rankStuff\\level.axh';
		if (FileSystem.exists(level))
		{
			var fileContents = File.getContent(level);

			if (fileContents.indexOf("P1L1") != -1)
			{
				addLevelP1L1();
			}
			if (fileContents.indexOf("P1L2") != -1)
			{
				addLevelP1L2();
			}
			if (fileContents.indexOf("P1L3") != -1)
			{
				addLevelP1L3();
			}
			if (fileContents.indexOf("P1L4") != -1)
			{
				addLevelP1L4();
			}
		}
		#end

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

	function addLevelP1L1()
	{
		p1L1.x = 145;
		p1L1.y = 656;
		add(p1L1);
	}

	function addLevelP1L2()
	{
		p1L2.x = 145;
		p1L2.y = 656;
		add(p1L2);
	}

	function addLevelP1L3()
	{
		p1L3.x = 145;
		p1L3.y = 656;
		add(p1L3);
	}

	function addLevelP1L4()
	{
		p1L4.x = 145;
		p1L4.y = 656;
		add(p1L4);
	}
}
