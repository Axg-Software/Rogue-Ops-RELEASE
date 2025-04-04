package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
#if cpp
import sys.FileSystem;
import sys.io.File;
#end

class PauseMenuSubstate extends FlxSubState
{
	// bg and header
	var bg:FlxSprite = new FlxSprite(0, 0, AssetPaths.pauseBG__png);
	var pauseHeader:FlxSprite = new FlxSprite(409, 63, AssetPaths.pauseTITLE__png);

	// buttons
	var continueButton:FlxSprite = new FlxSprite(455, 214, AssetPaths.Continue__png);
	var saveButton:FlxSprite = new FlxSprite(531, 262, AssetPaths.save__png);
	var quitButton:FlxSprite = new FlxSprite(545, 317, AssetPaths.quit__png);

	// level vars
	var level:FlxSprite = new FlxSprite(22, 663, AssetPaths.level__png);
	var p1L1:FlxSprite = new FlxSprite(0, 0, AssetPaths.p1L1__png);
	var p1L2:FlxSprite = new FlxSprite(0, 0, AssetPaths.p1L2__png);
	var p1L3:FlxSprite = new FlxSprite(0, 0, AssetPaths.p1L3__png);
	var p1L4:FlxSprite = new FlxSprite(0, 0, AssetPaths.p1L4__png);

	// rank vars
	var rank:FlxSprite = new FlxSprite(1080, 663, AssetPaths.rank__png);

	// shotgun
	var shotgunSelect:FlxSprite = new FlxSprite(0, 0, AssetPaths.shotGun_Pump__png);

	public function new()
	{
		super();
	}

	override function create()
	{
		super.create();
		add(bg);

		add(pauseHeader);
		add(continueButton);
		add(saveButton);
		add(quitButton);

		add(level);
		// add(rank);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		#if cpp
		var level = 'assets\\data\\rankStuff\\level.axh';
		if (FileSystem.exists(level))
		{
			var fileContents = File.getContent(level);

			if (fileContents.indexOf("P1L1") != -1)
			{
				addLevelP1L1();
			}
			if (fileContents.indexOf("P1L2") != -1)
			{
				addLevelP1L2();
			}
			if (fileContents.indexOf("P1L3") != -1)
			{
				addLevelP1L3();
			}
			if (fileContents.indexOf("P1L4") != -1)
			{
				addLevelP1L4();
			}
		}
		#end

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
		else if (FlxG.mouse.overlaps(saveButton))
		{
			add(shotgunSelect);
			shotgunSelect.x = 435;
			shotgunSelect.y = 281;
			if (FlxG.mouse.justPressed)
			{
				close();
			}
		}
		else if (FlxG.mouse.overlaps(quitButton))
		{
			add(shotgunSelect);
			shotgunSelect.x = 449;
			shotgunSelect.y = 334;
			if (FlxG.mouse.justPressed)
			{
				FlxG.switchState(new MenuState());
			}
		}
		else
		{
			remove(shotgunSelect);
		}
	}

	// level stuff
	function addLevelP1L1()
	{
		p1L1.x = 145;
		p1L1.y = 656;
		add(p1L1);
	}

	function addLevelP1L2()
	{
		p1L2.x = 145;
		p1L2.y = 656;
		add(p1L2);
	}

	function addLevelP1L3()
	{
		p1L3.x = 145;
		p1L3.y = 656;
		add(p1L3);
	}

	function addLevelP1L4()
	{
		p1L4.x = 145;
		p1L4.y = 656;
		add(p1L4);
	}
}
