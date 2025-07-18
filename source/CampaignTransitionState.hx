package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import haxe.Timer;

class CampaignTransitionState extends FlxState
{
	var transStateText1:FlxSprite = new FlxSprite(49, 206, AssetPaths.text11__png);
	var transStateText2:FlxSprite = new FlxSprite(410, 411, AssetPaths.text12__png);

	var transStateText3:FlxSprite = new FlxSprite(145, 239, AssetPaths.text21__png);

	var transStateText4:FlxSprite = new FlxSprite(86, 239, AssetPaths.text31__png);

	var transStateText5:FlxSprite = new FlxSprite(112, 282, AssetPaths.text41__png);

	public function new()
	{
		super();
	}

	override function create()
	{
		super.create();
		FlxG.mouse.visible = false;

		if (FlxG.save.data.level == 1)
		{
			add(transStateText1);
			add(transStateText2);
		}
		else if (FlxG.save.data.level == 2)
		{
			add(transStateText3);
		}
		else if (FlxG.save.data.level == 3)
		{
			add(transStateText4);
		}
		else if (FlxG.save.data.level == 4)
		{
			add(transStateText5);
		}

		wait(10000, function()
		{
			if (FlxG.save.data.level == 1)
			{
				FlxG.switchState(new PlayState(1, 2));
				FlxG.save.data.level = 2;
				FlxG.save.flush();
			}
			else if (FlxG.save.data.level == 2)
			{
				FlxG.switchState(new PlayState(1, 3));
				FlxG.save.data.level = 3;
				FlxG.save.flush();
			}
			else if (FlxG.save.data.level == 3)
			{
				FlxG.switchState(new PlayState(1, 4));
				FlxG.save.data.level = 4;
				FlxG.save.flush();
			}
			else if (FlxG.save.data.level == 4)
			{
				FlxG.switchState(new MenuState());
				FlxG.save.data.level = 5;
				FlxG.save.flush();
			}
		});
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	function wait(milliseconds:Int, callback:Void->Void)
	{
		Timer.delay(callback, milliseconds);
	}
}
