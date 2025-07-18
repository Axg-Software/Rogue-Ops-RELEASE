package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.gamepad.FlxGamepad;
import flixel.sound.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class LevelXPState extends FlxState
{
	var bg1:FlxSprite = new FlxSprite(0, 0, AssetPaths.bgLevelSelect__png);
	var fade:FlxSprite = new FlxSprite(0, 0, AssetPaths.fade2__png);
	var bg2:FlxSprite = new FlxSprite(153, 171, AssetPaths.bgLevelSelect2__png);

	var clickSound:FlxSound;

	var l1BIG:FlxSprite = new FlxSprite(400, 246, AssetPaths.level1BIG__png);
	var l2BIG:FlxSprite = new FlxSprite(400, 246, AssetPaths.level2BIG__png);
	var l3BIG:FlxSprite = new FlxSprite(400, 246, AssetPaths.level3BIG__png);
	var l4BIG:FlxSprite = new FlxSprite(400, 246, AssetPaths.level4BIG__png);

	var xpText:FlxText = new FlxText(440, 371, FlxG.width, null, 72);

	var killsFINAL:Int;
	var xp:Int = 0;
	var xpTOTAL:Int = 0;
	var whoWon:Bool;

	public function new(kills:Int, WW:Bool) // true = player 1, false = player 2 won
	{
		super();
		whoWon = WW;
		killsFINAL = kills;
	}

	override function create()
	{
		super.create();
		FlxG.mouse.visible = true;
		FlxG.camera.fade(FlxColor.BLACK, 0.5, true, null, false);
		clickSound = FlxG.sound.load(AssetPaths.mouse_Click__ogg);

		xpText.setFormat(AssetPaths.Bruce_Forever__ttf, 72, FlxColor.WHITE);

		for (i in 0...killsFINAL)
		{
			xp += 100;
		}

		xpTOTAL = xp + xpTOTAL;
		FlxG.save.data.xpTotal = xpTOTAL;
		FlxG.save.flush();

		add(bg1);
		add(bg2);
		add(fade);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		xpText.text = "+" + Std.string(xp) + "xp";

		if (xpTOTAL >= 1000) // if your xp bank has more or equal to enough xp you will level up
		{
			FlxG.save.data.levelXP = FlxG.save.data.levelXP + 1;
			xpTOTAL = 0;
			FlxG.save.data.xpTotal = xpTOTAL;
			FlxG.save.flush();
		}

		if (FlxG.save.data.levelXP >= 4) // makes it so you cant get past level 4
		{
			FlxG.save.data.levelXP = 4;
		}

		// adds what level you have to the screen
		if (FlxG.save.data.levelXP == 1)
		{
			add(l1BIG);
		}
		else if (FlxG.save.data.levelXP == 2)
		{
			add(l2BIG);
		}
		else if (FlxG.save.data.levelXP == 3)
		{
			add(l3BIG);
		}
		else if (FlxG.save.data.levelXP == 4)
		{
			add(l4BIG);
		}

		// if you pressed enter it will take you to the win state
		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new WinState(whoWon));
		}

		if (FlxG.save.data.controllerSupport == "yes")
		{
			var pad:FlxGamepad = FlxG.gamepads.firstActive;
			if (pad != null)
			{
				if (pad.justPressed.A)
				{
					FlxG.switchState(new WinState(whoWon));
				}
			}
		}

		add(xpText);
	}
}
