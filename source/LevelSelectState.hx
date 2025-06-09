package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.sound.FlxSound;
import flixel.util.FlxColor;

class LevelSelectState extends FlxState
{
	var bg1:FlxSprite = new FlxSprite(0, 0, AssetPaths.bgLevelSelect__png);
	var fade:FlxSprite = new FlxSprite(0, 0, AssetPaths.fade2__png);
	var bg2:FlxSprite = new FlxSprite(153, 171, AssetPaths.bgLevelSelect2__png);
	var level1Card:FlxSprite = new FlxSprite(544, 237, AssetPaths.level1Card__png);

	var quitbutton:FlxSprite = new FlxSprite(1104, 631, AssetPaths.quit__png);
	var shotgunSelect:FlxSprite = new FlxSprite(1009, 647, AssetPaths.shotGun_Pump__png);

	var CMPGCO:Int;
	var levelFINAL:Int;

	var clickSound:FlxSound;

	public function new(campaignCOOP:Int, level:Int)
	{
		super();
		CMPGCO = campaignCOOP;
		level = levelFINAL;
	}

	override function create()
	{
		super.create();
		FlxG.camera.fade(FlxColor.BLACK, 0.5, true, null, false);
		clickSound = FlxG.sound.load(AssetPaths.mouse_Click__ogg);

		add(bg1);
		add(bg2);
		add(fade);
		add(quitbutton);
		add(level1Card);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.justPressed)
		{
			clickSound.play();
		}

		if (FlxG.mouse.overlaps(level1Card))
		{
			if (FlxG.mouse.justPressed)
			{
				levelFINAL = 1;
				FlxG.switchState(new PlayState(CMPGCO, levelFINAL));
			}
		}

		if (FlxG.keys.justPressed.BACKSPACE)
		{
			FlxG.switchState(new MenuState());
		}

		if (FlxG.mouse.overlaps(quitbutton))
		{
			add(shotgunSelect);
			if (FlxG.mouse.justPressed)
			{
				clickSound.play();
				FlxG.switchState(new MenuState());
			}
		}
		else
		{
			remove(shotgunSelect);
		}

		expandCart(level1Card);
	}

	function expandCart(cart:FlxSprite)
	{
		if (FlxG.mouse.overlaps(cart))
		{
			cart.scale.x = 1.2;
			cart.scale.y = 1.2;
		}
		else
		{
			cart.scale.x = 1;
			cart.scale.y = 1;
		}
	}
}
