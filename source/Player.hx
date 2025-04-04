package; // 12/17/24 START OF DEVELOPMENT.. Movement taken from Project: FTS

import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite
{
	public function new()
	{
		super();
		this.loadGraphic(AssetPaths.gunner_Black_Idle__png, true, 48, 48);
		this.animation.add("idle", [0, 1, 2, 3, 4], 6, true, false, false);
		this.scale.y = 2;
		this.scale.x = 2;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		this.animation.play("idle");
		if (FlxG.keys.pressed.W)
		{
			this.y = this.y - 4;
		}
		if (FlxG.keys.pressed.S)
		{
			this.y = this.y + 4;
		}
		if (FlxG.keys.pressed.A)
		{
			this.x = this.x - 4;
			this.flipX = true;
		}
		if (FlxG.keys.pressed.D)
		{
			this.x = this.x + 4;
			this.flipX = false;
		}
	}
}
