package;

import flixel.FlxG;
import flixel.FlxState;

class InitState extends FlxState
{
	override public function create()
	{
		super.create();

		if (FlxG.save.data.name != null || FlxG.save.data.skipIntro == "yes")
		{
			FlxG.switchState(new MenuState());
		}
		else if (FlxG.save.data.skipIntro == null || FlxG.save.data.skipIntro == "no")
		{
			FlxG.switchState(new SplashScreenState());
		}
	}
}
