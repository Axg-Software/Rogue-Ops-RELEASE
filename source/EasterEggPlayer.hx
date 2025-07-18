package; // if u see this dw that isnt the final sprite for the player in the next game

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.gamepad.FlxGamepad;
import flixel.util.FlxColor;

class EasterEggPlayer extends FlxSprite
{
	public function new()
	{
		super();
		this.loadGraphic(AssetPaths.tehe__png, true, 32, 32);
		this.animation.add("idle", [0], 1, true, false, false);
		this.animation.add("runDown", [0, 1, 2, 3], 4, true, false, false);
		this.animation.add("runUp", [4, 5, 6, 7], 4, true, false, false);
		this.animation.add("runSIDE", [8, 9], 4, true, false, false);
		this.scale.y = 2;
		this.scale.x = 2;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		var pad:FlxGamepad = FlxG.gamepads.firstActive;

		if (FlxG.keys.pressed.W || FlxG.keys.pressed.UP)
		{
			this.animation.play("runUp");
			this.y = this.y - 4;
		}
		if (FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN)
		{
			this.animation.play("runDown");
			this.y = this.y + 4;
		}
		if (FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT)
		{
			this.animation.play("runSIDE");
			this.x = this.x - 4;
			this.flipX = true;
		}
		if (FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT)
		{
			this.animation.play("runSIDE");
			this.x = this.x + 4;
			this.flipX = false;
		}

		if (!FlxG.keys.pressed.D && !FlxG.keys.pressed.A && !FlxG.keys.pressed.S && !FlxG.keys.pressed.W)
		{
			this.animation.play("idle");
		}
	}
}
