package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import haxe.Timer;
#if cpp
import sys.FileSystem;
import sys.io.File;
#end

class CampaignTransitionState extends FlxState
{
	var transStateText1:FlxSprite = new FlxSprite(49, 206, AssetPaths.text11__png);
	var transStateText2:FlxSprite = new FlxSprite(410, 411, AssetPaths.text12__png);

	var transStateText3:FlxSprite = new FlxSprite(145, 239, AssetPaths.text21__png);

	var transStateText4:FlxSprite = new FlxSprite(86, 239, AssetPaths.text31__png);

	var transStateText5:FlxSprite = new FlxSprite(112, 282, AssetPaths.text41__png);
	var levelLEVEL:Int;

	public function new(level:Int)
	{
		super();
		levelLEVEL = level;
	}

	override function create()
	{
		super.create();
		if (levelLEVEL == 1)
		{
			add(transStateText1);
			add(transStateText2);
		}
		else if (levelLEVEL == 2)
		{
			add(transStateText3);
		}
		else if (levelLEVEL == 3)
		{
			add(transStateText4);
		}
		else if (levelLEVEL == 4)
		{
			add(transStateText5);
		}
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		wait(10000, function()
		{
			if (levelLEVEL == 1)
			{
				#if cpp
				var dir = 'assets\\data\\campaignSave.axh';
				File.write(dir, false);

				var options:haxe.ds.List<String> = new List<String>();
				options.add("L2");

				var output;

				for (i in options)
				{
					output = File.append(dir, false);
					output.writeString(i + "\n");
					output.close();
				}
				#end
				FlxG.switchState(new PlayState(1, 2));
			}
			else if (levelLEVEL == 2)
			{
				#if cpp
				var dir = 'assets\\data\\campaignSave.axh';
				File.write(dir, false);

				var options:haxe.ds.List<String> = new List<String>();
				options.add("L3");

				var output;

				for (i in options)
				{
					output = File.append(dir, false);
					output.writeString(i + "\n");
					output.close();
				}
				#end
				FlxG.switchState(new PlayState(1, 3));
			}
			else if (levelLEVEL == 3)
			{
				#if cpp
				var dir = 'assets\\data\\campaignSave.axh';
				File.write(dir, false);

				var options:haxe.ds.List<String> = new List<String>();
				options.add("L4");

				var output;

				for (i in options)
				{
					output = File.append(dir, false);
					output.writeString(i + "\n");
					output.close();
				}
				#end
				FlxG.switchState(new PlayState(1, 4));
			}
			else if (levelLEVEL == 4)
			{
				#if cpp
				var dir = 'assets\\data\\campaignSave.axh';
				File.write(dir, false);

				var options:haxe.ds.List<String> = new List<String>();
				options.add("L5");

				var output;

				for (i in options)
				{
					output = File.append(dir, false);
					output.writeString(i + "\n");
					output.close();
				}
				#end
				FlxG.switchState(new MenuState());
			}
		});
	}

	function wait(milliseconds:Int, callback:Void->Void)
	{
		Timer.delay(callback, milliseconds);
	}
}
