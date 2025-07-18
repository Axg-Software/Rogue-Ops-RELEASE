package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.input.gamepad.FlxGamepad;
import flixel.sound.FlxSound;

class PauseMenuSubstate extends FlxSubState
{
	// bg and header
	var bg:FlxSprite = new FlxSprite(0, 0, AssetPaths.pauseBG__png);
	var pauseHeader:FlxSprite = new FlxSprite(409, 63, AssetPaths.pauseTITLE__png);

	// buttons
	var continueButton:FlxSprite = new FlxSprite(455, 214, AssetPaths.Continue__png);
	var saveButton:FlxSprite = new FlxSprite(531, 262, AssetPaths.save__png);
	var quitButton:FlxSprite = new FlxSprite(545, 262, AssetPaths.quit__png);

	// rank vars
	var rank:FlxSprite = new FlxSprite(1080, 663, AssetPaths.rank__png);

	// shotgun
	var shotgunSelect:FlxSprite = new FlxSprite(0, 0, AssetPaths.shotGun_Pump__png);

	var clickSound:FlxSound;

	var selected:Int = 0;

	// other thing
	public var quitToMenuCallback:Void->Void;

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
		// add(saveButton);
		add(quitButton);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		FlxG.mouse.visible = true;

		if (FlxG.mouse.justPressed)
		{
			clickSound.play();
		}

		// if the mouse is overlapping AND selects
		if (FlxG.keys.justPressed.ESCAPE || FlxG.mouse.overlaps(continueButton))
		{
			add(shotgunSelect);
			shotgunSelect.x = 360;
			shotgunSelect.y = 230;
			if (FlxG.mouse.justPressed)
			{
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
				FlxG.switchState(new MenuState());
			}
		}
		else
		{
			remove(shotgunSelect);
		}

		if (FlxG.save.data.controllerSupport == "yes")
		{
			var pad:FlxGamepad = FlxG.gamepads.firstActive;

			if (pad != null) // TODO: FIX THE QUIT BUTTON NOT WORKING
			{
				if (selected <= 1)
				{
					selected = 1;
				}
				else if (selected >= 2)
				{
					selected = 2;
				}

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
					add(shotgunSelect);
					shotgunSelect.x = 360;
					shotgunSelect.y = 230;
					if (pad.justPressed.A)
					{
						close();
					}
				}
				else if (selected >= 2)
				{
					add(shotgunSelect);
					shotgunSelect.x = 449;
					shotgunSelect.y = 281;
					if (pad.justPressed.A)
					{
						FlxG.switchState(new MenuState()); // still need to do this
					}
				}
			}
		}
	}
}
