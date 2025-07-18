package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class EasterEggState extends FlxState
{
	var dialogue:Dialogue;
	var plr:FlxSprite;

	override function create()
	{
		super.create();

		plr = new EasterEggPlayer();
		plr.x = 100;
		plr.y = 100;

		dialogue = new Dialogue();
		add(dialogue);

		dialogue.startDialogue([
			"To help, or to stay silent.",
			"You can choose.",
			"You can make a difference",
			"A new city.",
			"...........",
			"2026."
		]);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.BACKSPACE)
		{
			FlxG.switchState(new MenuState());
		}

		if (FlxG.keys.pressed.N && FlxG.keys.pressed.P)
		{
			add(plr);
		}
	}
}
