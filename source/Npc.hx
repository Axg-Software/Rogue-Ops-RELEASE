package;

import flixel.FlxSprite;

class Npc extends FlxSprite
{
	public function new(cmpgnCOOP:Int)
	{
		super();
		if (cmpgnCOOP == 1) // 1 = campaign 2 = co-op
		{
			this.loadGraphic(AssetPaths.npc__png, true, 48, 48);
		}
		else if (cmpgnCOOP == 2)
		{
			this.loadGraphic(AssetPaths.gunner_Red_Idle__png, true, 48, 48);
		}
		this.animation.add("idle", [0, 1, 2, 3, 4], 6, true, false, false);
		this.scale.y = 2;
		this.scale.x = 2;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		this.animation.play("idle");
	}
}
