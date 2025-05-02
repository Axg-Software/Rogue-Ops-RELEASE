package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.sound.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class SplashScreenState extends FlxState
{
	var introText:FlxText = new FlxText(0, 300, FlxG.width, "AXG Software", 64);
	var sToSkip:FlxText = new FlxText(0, 0, FlxG.width, "S to skip", 16);

	var dundun:FlxSound;

	override function create()
	{
		super.create();

		dundun = FlxG.sound.load(AssetPaths.dundun__ogg);

		DiscordHandler.init();

		dundun.play();
		introText.setFormat(AssetPaths.Bruce_Forever__ttf, 64, FlxColor.WHITE, FlxTextAlign.CENTER);
		add(introText);

		sToSkip.setFormat(AssetPaths.Bruce_Forever__ttf, 16, FlxColor.WHITE, FlxTextAlign.RIGHT);
		add(sToSkip);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.camera.fade(FlxColor.BLACK, 3, false, onComplete, false);

		if (FlxG.keys.justPressed.S)
		{
			FlxG.switchState(new MenuState());
		}
	}

	function onComplete()
	{
		introText.text = "Introduces";
		dundun.play();
		FlxG.camera.fade(FlxColor.BLACK, 3, false, onComplete2, false);
	}

	function onComplete2()
	{
		introText.text = "Rogue Ops";
		dundun.play();
		FlxG.camera.fade(FlxColor.BLACK, 3, false, onComplete3, false);
	}

	function onComplete3()
	{
		FlxG.switchState(new MenuState());
	}
}
