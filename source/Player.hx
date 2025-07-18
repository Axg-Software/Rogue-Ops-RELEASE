package; // 12/17/24 START OF DEVELOPMENT.. Movement taken from Project: FTS

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.gamepad.FlxGamepad;

class Player extends FlxSprite
{
	public function new()
	{
		super();
		this.loadGraphic(AssetPaths.player13NEW__png, true, 48, 48);
		this.animation.add("idle", [0, 1, 2, 3, 4], 6, true, false, false);
		this.animation.add("run", [5, 6, 7, 8, 9, 10], 6, true, false, false);
		this.scale.y = 2;
		this.scale.x = 2;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		var pad:FlxGamepad = FlxG.gamepads.firstActive;

		if (FlxG.keys.pressed.W)
		{
			this.animation.play("run");
			this.y = this.y - 4;
		}
		if (FlxG.keys.pressed.S)
		{
			this.animation.play("run");
			this.y = this.y + 4;
		}
		if (FlxG.keys.pressed.A)
		{
			this.animation.play("run");
			this.x = this.x - 4;
			this.flipX = true;
		}
		if (FlxG.keys.pressed.D)
		{
			this.animation.play("run");
			this.x = this.x + 4;
			this.flipX = false;
		}

		if (!FlxG.keys.pressed.D && !FlxG.keys.pressed.A && !FlxG.keys.pressed.S && !FlxG.keys.pressed.W)
		{
			this.animation.play("idle");
		}

		if (FlxG.save.data.controllerSupport == "yes")
		{
			if (pad != null)
			{
				if (pad.pressed.DPAD_UP)
				{
					this.animation.play("run");
					this.y = this.y - 4;
				}
				if (pad.pressed.DPAD_DOWN)
				{
					this.animation.play("run");
					this.y = this.y + 4;
				}
				if (pad.pressed.DPAD_LEFT)
				{
					this.animation.play("run");
					this.x = this.x - 4;
					this.flipX = true;
				}
				if (pad.pressed.DPAD_RIGHT)
				{
					this.animation.play("run");
					this.x = this.x + 4;
					this.flipX = false;
				}

				if (!pad.pressed.DPAD_RIGHT && !pad.pressed.DPAD_LEFT && !pad.pressed.DPAD_DOWN && !pad.pressed.DPAD_UP)
				{
					this.animation.play("idle");
				}
			}
		}
	}
}
