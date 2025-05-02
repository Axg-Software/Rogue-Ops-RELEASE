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
		add(level1Card);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(level1Card))
		{
			if (FlxG.mouse.justPressed)
			{
				levelFINAL = 1;
				clickSound.play();
				FlxG.switchState(new PlayState(CMPGCO, levelFINAL));
			}
		}

		if (FlxG.keys.justPressed.BACKSPACE)
		{
			FlxG.switchState(new MenuState());
		}
	}
}
