package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.sound.FlxSound;

class PauseMenuSubstate extends FlxSubState
{
	// bg and header
	var bg:FlxSprite = new FlxSprite(0, 0, AssetPaths.pauseBG__png);
	var pauseHeader:FlxSprite = new FlxSprite(409, 63, AssetPaths.pauseTITLE__png);

	// buttons
	var continueButton:FlxSprite = new FlxSprite(455, 214, AssetPaths.Continue__png);
	var saveButton:FlxSprite = new FlxSprite(531, 262, AssetPaths.save__png);
	var quitButton:FlxSprite = new FlxSprite(545, 317, AssetPaths.quit__png);

	// rank vars
	var rank:FlxSprite = new FlxSprite(1080, 663, AssetPaths.rank__png);

	// shotgun
	var shotgunSelect:FlxSprite = new FlxSprite(0, 0, AssetPaths.shotGun_Pump__png);

	var clickSound:FlxSound;

	public function new()
	{
		super();
	}

	override function create()
	{
		super.create();
		add(bg);
		clickSound = FlxG.sound.load(AssetPaths.mouse_Click__ogg);

		add(pauseHeader);
		add(continueButton);
		add(saveButton);
		add(quitButton);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		// if the mouse is overlapping AND selects
		if (FlxG.keys.justPressed.ESCAPE || FlxG.mouse.overlaps(continueButton))
		{
			add(shotgunSelect);
			shotgunSelect.x = 360;
			shotgunSelect.y = 230;
			if (FlxG.mouse.justPressed)
			{
				clickSound.play();
				close();
			}
		}
		else if (FlxG.mouse.overlaps(quitButton))
		{
			add(shotgunSelect);
			shotgunSelect.x = 449;
			shotgunSelect.y = 281;
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
	}
}
