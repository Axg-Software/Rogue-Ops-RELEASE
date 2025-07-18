// INTRODUCING: RE
// RE is an engine similar to IW, designed exclusively for Rogue Ops games and updates.
// It will never be released to the public like AXE Engine; instead, it will remain a proprietary engine like Source, IW, and others.
// Im sorry for the shit u are about to see in this code
package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.gamepad.FlxGamepad;
import flixel.sound.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends TestLevelState // yo past ethan.. why the fuck did you made it extend TestLevelState what the fuck even is that???
{
	var whatLevel:Int;
	// Plr stuff
	var plr:FlxSprite;
	var plrHealth:Int = 50; // gonna do sum with this eventually

	// just have to make the npc have guns n stuff
	// Npcs
	var npc1:FlxSprite;

	// Guns
	var gunPickedUp:Int = 0;
	var assaultRifle_ScarH:FlxSprite = new FlxSprite(0, 0, AssetPaths.assaultRifle_ScarH__png);
	var pistol_Berretta:FlxSprite = new FlxSprite(0, 0, AssetPaths.pistol_Beretta__png);
	var shotgun_Pump:FlxSprite = new FlxSprite(0, 0, AssetPaths.shotGun_Pump__png);
	var sniper_Kar98:FlxSprite = new FlxSprite(0, 0, AssetPaths.sniper_KAR98__png);

	var bullet:FlxSprite = new FlxSprite(0, 0, AssetPaths.bullet__png);
	var gunNbulletDIR:Bool;
	var gunNbulletUD:Int = 0;
	var bulletActive:Bool = false;
	var shot:Bool = false;

	// Guns NPC (plr2)
	var gunPickedUp2:Int = 0;
	var assaultRifle_ScarH_2:FlxSprite = new FlxSprite(0, 0, AssetPaths.assaultRifle_ScarH__png);
	var pistol_Berretta_2:FlxSprite = new FlxSprite(0, 0, AssetPaths.pistol_Beretta__png);
	var shotgun_Pump_2:FlxSprite = new FlxSprite(0, 0, AssetPaths.shotGun_Pump__png);
	var sniper_Kar98_2:FlxSprite = new FlxSprite(0, 0, AssetPaths.sniper_KAR98__png);

	var bullet_2:FlxSprite = new FlxSprite(0, 0, AssetPaths.bullet__png);
	var gunNbulletDIR2:Bool;
	var gunNbulletUD2:Int = 0;
	var bulletActive2:Bool = false;
	var shot2:Bool = false;

	// sadasd
	private var CMPGN_COOP:Int;
	var whatThisIs:FlxText = new FlxText(0, 0, FlxG.width, null, 32); // 1 = campaign, 2 = co op

	var cpL1C1:FlxSprite = new FlxSprite(469, 0, null);
	var cpL1C2:FlxSprite = new FlxSprite(490, 0, null);
	var cpL1C3:FlxSprite = new FlxSprite(635, 14, null);
	var cpL1C4:FlxSprite = new FlxSprite(464, 532, null);
	var cpL1C5:FlxSprite = new FlxSprite(491, 715, null);
	var cpL1C6:FlxSprite = new FlxSprite(630, 530, null);

	// capture the flag
	var blueFlag:FlxSprite = new FlxSprite(537, 606, AssetPaths.blueFlag__png);
	var redFlag:FlxSprite = new FlxSprite(533, 80, AssetPaths.redFlag__png);

	var blueFlagPU:Bool = false;
	var redFlagPU:Bool = false;
	var redFlagCollider:FlxSprite = new FlxSprite(489, 661);
	var blueFlagCollider:FlxSprite = new FlxSprite(489, 13);
	var whoWon:Bool;

	// campaign levels
	var bg:FlxSprite = new FlxSprite(0, 0, AssetPaths.bgPLS__png);
	var cmpgnL1:FlxSprite = new FlxSprite(0, 0, AssetPaths.forestMap__png);
	var cmpgnL2:FlxSprite = new FlxSprite(0, 0, AssetPaths.cityMap__png);
	var cmpgnL3:FlxSprite = new FlxSprite(0, 0, AssetPaths.subwayMap__png);
	var cmpgnL4:FlxSprite = new FlxSprite(0, 0, AssetPaths.cite16Map__png);
	var cmpgnl42:FlxSprite = new FlxSprite(0, 0, AssetPaths.cite16Layer2__png);

	// sounds (I have to redo this shit since I fucked up) // 3-8-25
	var arSHOOT:FlxSound;
	var pistolSHOOT:FlxSound;
	var shotgunSHOOT:FlxSound;
	var sniperShOOT:FlxSound;

	// FINALLY FUCKING DOIN THE CAMPAIN AND HOPE TO DO THIS FUCKING GAME SOOOOOOOOOOOOOOOOOOOOOOOOOON 3-10-25
	var npcFollowers:FlxSprite = new FlxSprite(0, 0, AssetPaths.npc__png);
	var fade:FlxSprite = new FlxSprite(0, 0, AssetPaths.fade2__png);
	var rocket:FlxSprite = new FlxSprite(594, 85, AssetPaths.rocket__png);

	// campaign vars
	var rocketTouching:Bool = false;
	var paperNote:FlxSprite = new FlxSprite(829, 316, AssetPaths.paperNote__png);

	// level 2
	var p2Collision1:FlxSprite = new FlxSprite(8, 6);
	var p2Collision2:FlxSprite = new FlxSprite(808, 8);
	var p2Collision3:FlxSprite = new FlxSprite(983, -2);

	// level 3
	var p3Collision1:FlxSprite = new FlxSprite(0, 0);
	var p3Collision2:FlxSprite = new FlxSprite(0, 641);
	var npcAlive:Bool = true;

	// level 4
	var npcLevel4:FlxSprite;
	var gateopen:Bool = false;
	// building
	var p4Collision1:FlxSprite = new FlxSprite(297, 159);
	var p4Collision2:FlxSprite = new FlxSprite(297, 125);
	var p4Collision3:FlxSprite = new FlxSprite(952, 202);
	var p4Collision4:FlxSprite = new FlxSprite(899, 482);
	var p4Collision5:FlxSprite = new FlxSprite(386, 447);
	var npcAlive2:Bool = true;
	// gates
	var p4CollisionGate1:FlxSprite = new FlxSprite(-28, 159);
	var p4CollisionGate2:FlxSprite = new FlxSprite(975, 159);

	var gateClickable:FlxSprite = new FlxSprite(538, 10);

	// V1.2 vars
	var totalKills:Int = 0;

	public function new(cmppgnOcoop:Int, level:Int)
	{
		super();
		CMPGN_COOP = cmppgnOcoop;
		whatLevel = level;
	}

	override public function create()
	{
		super.create();

		FlxG.camera.fade(FlxColor.BLACK, 0.5, true, null, false);

		arSHOOT = FlxG.sound.load(AssetPaths.assaultRifle_Shoot__ogg);
		pistolSHOOT = FlxG.sound.load(AssetPaths.pistol_Shoot__ogg);
		shotgunSHOOT = FlxG.sound.load(AssetPaths.shotgun_Shoot__ogg);
		sniperShOOT = FlxG.sound.load(AssetPaths.sniper_Shoot__ogg);

		redFlagCollider.makeGraphic(140, 49);
		blueFlagCollider.makeGraphic(140, 49);

		// campaign level 2 collisions
		p2Collision1.makeGraphic(755, 282, FlxColor.GREEN);
		p2Collision2.makeGraphic(154, 154, FlxColor.GREEN);
		p2Collision3.makeGraphic(297, 297, FlxColor.GREEN);

		// level 3 collisions
		p3Collision1.makeGraphic(1280, 35, FlxColor.GREEN);
		p3Collision2.makeGraphic(1278, 78, FlxColor.GREEN);

		// level 4 Collisions
		p4Collision1.makeGraphic(75, 359, FlxColor.GREEN);
		p4Collision2.makeGraphic(675, 25, FlxColor.GREEN);
		p4Collision3.makeGraphic(29, 302, FlxColor.GREEN);
		p4Collision4.makeGraphic(41, 28, FlxColor.GREEN);
		p4Collision5.makeGraphic(511, 20, FlxColor.GREEN);

		p4CollisionGate1.makeGraphic(307, 33);
		gateClickable.makeGraphic(427, 91);
		p4CollisionGate2.makeGraphic(307, 33);

		blueFlag.scale.x = 2;
		blueFlag.scale.y = 2;
		redFlag.scale.x = 2;
		redFlag.scale.y = 2;
		// co-op level one collisions
		cpL1C1.makeGraphic(18, 192, FlxColor.GREEN);
		cpL1C2.makeGraphic(143, 9, FlxColor.GREEN);
		cpL1C3.makeGraphic(12, 179, FlxColor.GREEN);
		cpL1C4.makeGraphic(18, 192, FlxColor.GREEN);
		cpL1C5.makeGraphic(143, 9, FlxColor.GREEN);
		cpL1C6.makeGraphic(12, 179, FlxColor.GREEN);

		if (CMPGN_COOP == 1)
		{
			FlxG.mouse.visible = true;
			if (FlxG.save.data.level == 1)
			{
				addLevelL1();
			}
			else if (FlxG.save.data.level == 2)
			{
				add(p2Collision1);
				add(p2Collision2);
				add(p2Collision3);
				addLevelL2();
			}
			else if (FlxG.save.data.level == 3)
			{
				addLevelL3();
				add(npc1);
			}
			else if (FlxG.save.data.level == 4)
			{
				addLevelL4();
				add(npcLevel4);
			}
			else if (FlxG.save.data.level == 5)
			{
				addLevelL5();
			}
		}
		else if (CMPGN_COOP == 2)
		{
			add(redFlagCollider);
			add(blueFlagCollider);
			add(cpL1C1);
			add(cpL1C2);
			add(cpL1C3);
			add(cpL1C4);
			add(cpL1C5);
			add(cpL1C6);
			createCoOpL1(whatLevel);
			add(redFlag);
			add(blueFlag);
		}

		npcFollowers.scale.x = 2;
		npcFollowers.scale.y = 2;

		rocket.scale.x = 2;
		rocket.scale.y = 2;

		plr = new Player();
		plr.x = 537;
		plr.y = 547;
		add(plr);

		npc1 = new Npc(2);
		npc1.x = 537;
		npc1.y = 127;
		if (CMPGN_COOP == 2)
		{
			add(npc1);
		}
		npcLevel4 = new Npc(1);
		npcLevel4.x = 1113;
		npcLevel4.y = 227;

		bullet.scale.x = 2;
		bullet.scale.y = 2;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		var pad:FlxGamepad = FlxG.gamepads.firstActive;

		if (pad != null)
		{
			var pauseMenu = new PauseMenuSubstate();
			pauseMenu.quitToMenuCallback = function()
			{
				trace("Quitting to menu...");
				FlxG.switchState(new MenuState());
			};
			if (FlxG.save.data.controllerSupport == "yes")
			{
				if (pad.justPressed.START)
				{
					openSubState(new PauseMenuSubstate());
				}
			}
		}

		if (FlxG.keys.justPressed.ESCAPE)
		{
			openSubState(new PauseMenuSubstate());
		}

		if (CMPGN_COOP == 1) // getting prepared to make 2 games in one script lmao
		{
			whatThisIs.text = "Campaign";

			if (FlxG.save.data.level == 1)
			{
				if (rocketTouching == false)
				{
					npcFollowers.x = plr.x - 90;
					npcFollowers.y = plr.y + 70;
				}

				if (FlxG.keys.justPressed.A)
				{
					npcFollowers.flipX = true;
				}
				else if (FlxG.keys.justPressed.D)
				{
					npcFollowers.flipX = false;
				}

				if (FlxG.mouse.overlaps(rocket) && FlxG.mouse.justPressed)
				{
					rocketTouching = true;
				}
				if (rocketTouching == true)
				{
					npcFollowers.x = rocket.x - 90;
					npcFollowers.y = rocket.y + 70;
					rocket.y = rocket.y - 20;
					if (rocket.y <= 0)
					{
						// FlxG.save.data.level = 2;
						// FlxG.save.flush();
						FlxG.switchState(new CampaignTransitionState());
					}
				}

				if (FlxG.save.data.controllerSupport == "yes")
				{
					if (pad != null)
					{
						if (plr.overlaps(rocket) && pad.justPressed.A)
						{
							rocketTouching = true;
						}
						if (rocketTouching == true)
						{
							npcFollowers.x = rocket.x - 90;
							npcFollowers.y = rocket.y + 70;
							rocket.y = rocket.y - 20;
							if (rocket.y <= 0)
							{
								// FlxG.save.data.level = 2;
								// FlxG.save.flush();
								FlxG.switchState(new CampaignTransitionState());
							}
						}
					}
				}
			}
			else if (FlxG.save.data.level == 2)
			{
				var collisionObjects = [p2Collision1, p2Collision2, p2Collision3];

				for (collision in collisionObjects)
				{
					if (plr.overlaps(collision))
					{
						plr.x = 537;
						plr.y = 547;
						break; // Stops checking once one collision is detected
					}
				}

				if (FlxG.mouse.overlaps(paperNote) && FlxG.mouse.justPressed)
				{
					// FlxG.save.data.level = 3;
					// FlxG.save.flush();
					FlxG.switchState(new CampaignTransitionState());
				}

				if (FlxG.save.data.controllerSupport == "yes")
				{
					if (pad != null)
					{
						if (plr.overlaps(paperNote) && pad.justPressed.A)
						{
							// FlxG.save.data.level = 3;
							// FlxG.save.flush();
							FlxG.switchState(new CampaignTransitionState());
						}
					}
				}
			}
			else if (FlxG.save.data.level == 3)
			{
				var collisionObjects = [p3Collision1, p3Collision2];

				for (collision in collisionObjects)
				{
					if (plr.overlaps(collision))
					{
						plr.x = 537;
						plr.y = 547;
						break; // Stops checking once one collision is detected
					}
				}

				if (FlxG.mouse.overlaps(npc1) && FlxG.mouse.justPressed)
				{
					// FlxG.save.data.level = 4;
					// FlxG.save.flush();
					FlxG.switchState(new CampaignTransitionState());
				}

				if (FlxG.save.data.controllerSupport == "yes")
				{
					if (pad != null)
					{
						if (plr.overlaps(npc1) && pad.justPressed.A)
						{
							// FlxG.save.data.level = 4;
							// FlxG.save.flush();
							FlxG.switchState(new CampaignTransitionState());
						}
					}
				}

				if (npcAlive == true)
				{
					add(npc1);
				}
			}
			else if (FlxG.save.data.level == 4)
			{
				var collisionObjects = [
					p4Collision1,
					p4Collision2,
					p4Collision3,
					p4Collision4,
					p4Collision5,
					p4CollisionGate1,
					p4CollisionGate2
				];

				for (collision in collisionObjects)
				{
					if (plr.overlaps(collision))
					{
						plr.x = 537;
						plr.y = 547;
						break; // Stops checking once one collision is detected
					}
				}

				if (FlxG.mouse.overlaps(gateClickable) && FlxG.mouse.justPressed && gateopen == true)
				{
					FlxG.switchState(new CampaignTransitionState());
				}

				if (FlxG.save.data.controllerSupport == "yes")
				{
					if (pad != null)
					{
						if (plr.overlaps(gateClickable) && pad.justPressed.A && gateopen == true)
						{
							FlxG.switchState(new CampaignTransitionState());
						}
					}
				}

				if (bullet.overlaps(npcLevel4))
				{
					npcLevel4.x = 1000;
					gateopen = true;
					remove(npcLevel4);
					npcAlive2 = false;
				}

				if (gateopen == false)
				{
					// add(p4CollisionGate1);
				}
				else if (gateopen == true)
				{
					remove(p4CollisionGate1);
					remove(cmpgnl42);
					p4CollisionGate1.x = -1000;
				}

				if (npcAlive2 == true)
				{
					add(npcLevel4);
				}
				else if (npcAlive2 == false)
				{
					remove(npcLevel4);
				}
			}
		}
		else if (CMPGN_COOP == 2)
		{
			FlxG.mouse.visible = false;

			whatThisIs.text = "CO-OP";
			if (FlxG.keys.pressed.UP)
			{
				npc1.y = npc1.y - 4;
			}
			if (FlxG.keys.pressed.DOWN)
			{
				npc1.y = npc1.y + 4;
			}
			if (FlxG.keys.pressed.LEFT)
			{
				npc1.x = npc1.x - 4;
				npc1.flipX = true;
			}
			if (FlxG.keys.pressed.RIGHT)
			{
				npc1.x = npc1.x + 4;
				npc1.flipX = false;
			}

			var collisionObjects = [cpL1C1, cpL1C2, cpL1C3, cpL1C4, cpL1C5, cpL1C6];

			for (collision in collisionObjects)
			{
				if (plr.overlaps(collision))
				{
					plr.x = 537;
					plr.y = 547;
					break; // Stops checking once one collision is detected
				}

				if (npc1.overlaps(collision))
				{
					npc1.x = 537;
					npc1.y = 127;
					break; // Stops checking once one collision is detected
				}
			}

			if (npc1.overlaps(blueFlag))
			{
				blueFlagPU = true;
			}
			else
			{
				blueFlagPU = false; // Ensure it gets reset if no longer overlapping
			}

			if (blueFlagPU)
			{
				blueFlag.x = npc1.x;
				blueFlag.y = npc1.y;
			}

			if (plr.overlaps(redFlag))
			{
				redFlagPU = true; // Assuming you want to pick it up
			}
			else
			{
				redFlagPU = false;
			}

			if (redFlagPU)
			{
				redFlag.x = plr.x;
				redFlag.y = plr.y;
			}

			if (redFlag.overlaps(redFlagCollider))
			{
				whoWon = true;
				FlxG.switchState(new LevelXPState(totalKills, whoWon));
			}
			else if (blueFlag.overlaps(blueFlagCollider))
			{
				whoWon = false;
				FlxG.switchState(new LevelXPState(totalKills, whoWon));
			}
		}

		if (gunPickedUp == 1)
		{
			if (gunNbulletDIR == false && gunNbulletUD == 0)
			{
				assaultRifle_ScarH.x = plr.x - 20;
				assaultRifle_ScarH.y = plr.y;
				assaultRifle_ScarH.angle = 0;
			}
			else if (gunNbulletDIR == true && gunNbulletUD == 0)
			{
				assaultRifle_ScarH.x = plr.x - 55;
				assaultRifle_ScarH.y = plr.y;
				assaultRifle_ScarH.angle = 0;
			}

			if (gunNbulletUD == 1)
			{
				assaultRifle_ScarH.angle = -90;
				assaultRifle_ScarH.x = plr.x - 40;
				assaultRifle_ScarH.y = plr.y - 15;
			}
			else if (gunNbulletUD == 2)
			{
				assaultRifle_ScarH.angle = 90;
				assaultRifle_ScarH.x = plr.x - 40;
				assaultRifle_ScarH.y = plr.y + 15;
			}
			add(assaultRifle_ScarH);
			shootBullet(1, 1);
		}
		else if (gunPickedUp == 2)
		{
			if (gunNbulletDIR == false)
			{
				pistol_Berretta.x = plr.x + 20;
				pistol_Berretta.y = plr.y;
				pistol_Berretta.angle = 0;
			}
			else if (gunNbulletDIR == true)
			{
				pistol_Berretta.x = plr.x - 20;
				pistol_Berretta.y = plr.y;
				pistol_Berretta.angle = 0;
			}

			if (gunNbulletUD == 1)
			{
				pistol_Berretta.angle = -90;
				pistol_Berretta.x = plr.x + 10;
				pistol_Berretta.y = plr.y;
			}
			else if (gunNbulletUD == 2)
			{
				pistol_Berretta.angle = 90;
				pistol_Berretta.x = plr.x + 10;
				pistol_Berretta.y = plr.y;
			}
			add(pistol_Berretta);
			shootBullet(2, 1);
		}
		else if (gunPickedUp == 3)
		{
			if (gunNbulletDIR == false)
			{
				shotgun_Pump.x = plr.x - 20;
				shotgun_Pump.y = plr.y;
				shotgun_Pump.angle = 0;
			}
			else if (gunNbulletDIR == true)
			{
				shotgun_Pump.x = plr.x - 20;
				shotgun_Pump.y = plr.y;
				shotgun_Pump.angle = 0;
			}

			if (gunNbulletUD == 1)
			{
				shotgun_Pump.angle = -90;
				shotgun_Pump.x = plr.x - 20;
				shotgun_Pump.y = plr.y;
			}
			else if (gunNbulletUD == 2)
			{
				shotgun_Pump.angle = 90;
				shotgun_Pump.x = plr.x - 20;
				shotgun_Pump.y = plr.y;
			}
			add(shotgun_Pump);
			shootBullet(3, 1);
		}
		else if (gunPickedUp == 4)
		{
			if (gunNbulletDIR == false)
			{
				sniper_Kar98.x = plr.x - 20;
				sniper_Kar98.y = plr.y;
				sniper_Kar98.angle = 0;
			}
			else if (gunNbulletDIR == true)
			{
				sniper_Kar98.x = plr.x - 40;
				sniper_Kar98.y = plr.y;
				sniper_Kar98.angle = 0;
			}

			if (gunNbulletUD == 1)
			{
				sniper_Kar98.angle = -90;
				sniper_Kar98.x = plr.x - 40;
				sniper_Kar98.y = plr.y;
			}
			else if (gunNbulletUD == 2)
			{
				sniper_Kar98.angle = 90;
				sniper_Kar98.x = plr.x - 40;
				sniper_Kar98.y = plr.y;
			}
			add(sniper_Kar98);
			shootBullet(4, 1);
		}

		if (FlxG.keys.justPressed.ONE)
		{
			gunPickedUp = 1;
			remove(pistol_Berretta);
			remove(shotgun_Pump);
			remove(sniper_Kar98);
		}
		else if (FlxG.keys.justPressed.TWO)
		{
			gunPickedUp = 2;
			remove(assaultRifle_ScarH);
			remove(shotgun_Pump);
			remove(sniper_Kar98);
		}
		else if (FlxG.keys.justPressed.THREE)
		{
			gunPickedUp = 3;
			remove(assaultRifle_ScarH);
			remove(pistol_Berretta);
			remove(sniper_Kar98);
		}
		else if (FlxG.keys.justPressed.FOUR)
		{
			gunPickedUp = 4;
			remove(assaultRifle_ScarH);
			remove(pistol_Berretta);
			remove(shotgun_Pump);
		}

		if (FlxG.save.data.controllerSupport == "yes")
		{
			if (pad != null)
			{
				if (gunPickedUp >= 4)
				{
					gunPickedUp = 4;
				}
				else if (gunPickedUp <= 1)
				{
					gunPickedUp = 1;
				}

				if (pad.justPressed.LEFT_SHOULDER)
				{
					gunPickedUp = gunPickedUp - 1;
				}
				else if (pad.justPressed.RIGHT_SHOULDER)
				{
					gunPickedUp = gunPickedUp + 1;
				}

				if (gunPickedUp == 1)
				{
					remove(pistol_Berretta);
					remove(shotgun_Pump);
					remove(sniper_Kar98);
				}
				else if (gunPickedUp == 2)
				{
					remove(assaultRifle_ScarH);
					remove(shotgun_Pump);
					remove(sniper_Kar98);
				}
				else if (gunPickedUp == 3)
				{
					remove(assaultRifle_ScarH);
					remove(pistol_Berretta);
					remove(sniper_Kar98);
				}
				else if (gunPickedUp == 4)
				{
					remove(assaultRifle_ScarH);
					remove(pistol_Berretta);
					remove(shotgun_Pump);
				}

				if (pad.justPressed.DPAD_LEFT)
				{
					gunNbulletUD = 0;
					gunNbulletDIR = true;
					assaultRifle_ScarH.flipX = true;
					pistol_Berretta.flipX = true;
					shotgun_Pump.flipX = true;
					sniper_Kar98.flipX = true;
				}
				else if (pad.justPressed.DPAD_RIGHT)
				{
					gunNbulletUD = 0;
					gunNbulletDIR = false;
					assaultRifle_ScarH.flipX = false;
					pistol_Berretta.flipX = false;
					shotgun_Pump.flipX = false;
					sniper_Kar98.flipX = false;
				}
				else if (pad.justPressed.DPAD_UP)
				{
					gunNbulletUD = 1;
					gunNbulletDIR = false;
					assaultRifle_ScarH.flipX = false;
					pistol_Berretta.flipX = false;
					shotgun_Pump.flipX = false;
					sniper_Kar98.flipX = false;
				}
				else if (pad.justPressed.DPAD_DOWN)
				{
					gunNbulletUD = 2;
					gunNbulletDIR = false;
					assaultRifle_ScarH.flipX = false;
					pistol_Berretta.flipX = false;
					shotgun_Pump.flipX = false;
					sniper_Kar98.flipX = false;
				}
			}
		}

		if (FlxG.keys.justPressed.A)
		{
			gunNbulletUD = 0;
			gunNbulletDIR = true;
			assaultRifle_ScarH.flipX = true;
			pistol_Berretta.flipX = true;
			shotgun_Pump.flipX = true;
			sniper_Kar98.flipX = true;
		}
		else if (FlxG.keys.justPressed.D)
		{
			gunNbulletUD = 0;
			gunNbulletDIR = false;
			assaultRifle_ScarH.flipX = false;
			pistol_Berretta.flipX = false;
			shotgun_Pump.flipX = false;
			sniper_Kar98.flipX = false;
		}
		else if (FlxG.keys.justPressed.W)
		{
			gunNbulletUD = 1;
			gunNbulletDIR = false;
			assaultRifle_ScarH.flipX = false;
			pistol_Berretta.flipX = false;
			shotgun_Pump.flipX = false;
			sniper_Kar98.flipX = false;
		}
		else if (FlxG.keys.justPressed.S)
		{
			gunNbulletUD = 2;
			gunNbulletDIR = false;
			assaultRifle_ScarH.flipX = false;
			pistol_Berretta.flipX = false;
			shotgun_Pump.flipX = false;
			sniper_Kar98.flipX = false;
		}

		if (gunPickedUp2 == 1)
		{
			if (gunNbulletDIR2 == false && gunNbulletUD2 == 0)
			{
				assaultRifle_ScarH_2.x = npc1.x - 20;
				assaultRifle_ScarH_2.y = npc1.y;
				assaultRifle_ScarH_2.angle = 0;
			}
			else if (gunNbulletDIR2 == true && gunNbulletUD2 == 0)
			{
				assaultRifle_ScarH_2.x = npc1.x - 55;
				assaultRifle_ScarH_2.y = npc1.y;
				assaultRifle_ScarH_2.angle = 0;
			}

			if (gunNbulletUD2 == 1)
			{
				assaultRifle_ScarH_2.angle = -90;
				assaultRifle_ScarH_2.x = npc1.x - 40;
				assaultRifle_ScarH_2.y = npc1.y - 15;
			}
			else if (gunNbulletUD2 == 2)
			{
				assaultRifle_ScarH_2.angle = 90;
				assaultRifle_ScarH_2.x = npc1.x - 40;
				assaultRifle_ScarH_2.y = npc1.y + 15;
			}
			add(assaultRifle_ScarH_2);
			shootBullet(1, 2);
		}
		else if (gunPickedUp2 == 2)
		{
			if (gunNbulletDIR2 == false)
			{
				pistol_Berretta_2.x = npc1.x + 20;
				pistol_Berretta_2.y = npc1.y;
				pistol_Berretta_2.angle = 0;
			}
			else if (gunNbulletDIR2 == true)
			{
				pistol_Berretta_2.x = npc1.x - 20;
				pistol_Berretta_2.y = npc1.y;
				pistol_Berretta_2.angle = 0;
			}

			if (gunNbulletUD2 == 1)
			{
				pistol_Berretta_2.angle = -90;
				pistol_Berretta_2.x = npc1.x + 10;
				pistol_Berretta_2.y = npc1.y;
			}
			else if (gunNbulletUD2 == 2)
			{
				pistol_Berretta_2.angle = 90;
				pistol_Berretta_2.x = npc1.x + 10;
				pistol_Berretta_2.y = npc1.y;
			}
			add(pistol_Berretta_2);
			shootBullet(2, 2);
		}
		else if (gunPickedUp2 == 3)
		{
			if (gunNbulletDIR2 == false)
			{
				shotgun_Pump_2.x = npc1.x - 20;
				shotgun_Pump_2.y = npc1.y;
				shotgun_Pump_2.angle = 0;
			}
			else if (gunNbulletDIR2 == true)
			{
				shotgun_Pump_2.x = npc1.x - 20;
				shotgun_Pump_2.y = npc1.y;
				shotgun_Pump_2.angle = 0;
			}

			if (gunNbulletUD2 == 1)
			{
				shotgun_Pump_2.angle = -90;
				shotgun_Pump_2.x = npc1.x - 20;
				shotgun_Pump_2.y = npc1.y;
			}
			else if (gunNbulletUD2 == 2)
			{
				shotgun_Pump_2.angle = 90;
				shotgun_Pump_2.x = npc1.x - 20;
				shotgun_Pump_2.y = npc1.y;
			}
			add(shotgun_Pump_2);
			shootBullet(3, 2);
		}
		else if (gunPickedUp2 == 4)
		{
			if (gunNbulletDIR2 == false)
			{
				sniper_Kar98_2.x = npc1.x - 20;
				sniper_Kar98_2.y = npc1.y;
				sniper_Kar98_2.angle = 0;
			}
			else if (gunNbulletDIR2 == true)
			{
				sniper_Kar98_2.x = npc1.x - 40;
				sniper_Kar98_2.y = npc1.y;
				sniper_Kar98_2.angle = 0;
			}

			if (gunNbulletUD2 == 1)
			{
				sniper_Kar98_2.angle = -90;
				sniper_Kar98_2.x = npc1.x - 40;
				sniper_Kar98_2.y = npc1.y;
			}
			else if (gunNbulletUD2 == 2)
			{
				sniper_Kar98_2.angle = 90;
				sniper_Kar98_2.x = npc1.x - 40;
				sniper_Kar98_2.y = npc1.y;
			}
			add(sniper_Kar98_2);
			shootBullet(4, 2);
		}

		if (CMPGN_COOP == 2)
		{
			if (FlxG.keys.justPressed.M)
			{
				gunPickedUp2 = 1;
				remove(pistol_Berretta_2);
				remove(shotgun_Pump_2);
				remove(sniper_Kar98_2);
			}
			else if (FlxG.keys.justPressed.COMMA)
			{
				gunPickedUp2 = 2;
				remove(assaultRifle_ScarH_2);
				remove(shotgun_Pump_2);
				remove(sniper_Kar98_2);
			}
			else if (FlxG.keys.justPressed.PERIOD)
			{
				gunPickedUp2 = 3;
				remove(assaultRifle_ScarH_2);
				remove(pistol_Berretta_2);
				remove(sniper_Kar98_2);
			}
			else if (FlxG.keys.justPressed.SLASH)
			{
				gunPickedUp2 = 4;
				remove(assaultRifle_ScarH_2);
				remove(pistol_Berretta_2);
				remove(shotgun_Pump_2);
			}
		}

		if (FlxG.keys.justPressed.LEFT)
		{
			gunNbulletUD2 = 0;
			gunNbulletDIR2 = true;
			assaultRifle_ScarH_2.flipX = true;
			pistol_Berretta_2.flipX = true;
			shotgun_Pump_2.flipX = true;
			sniper_Kar98_2.flipX = true;
		}
		else if (FlxG.keys.justPressed.RIGHT)
		{
			gunNbulletUD2 = 0;
			gunNbulletDIR2 = false;
			assaultRifle_ScarH_2.flipX = false;
			pistol_Berretta_2.flipX = false;
			shotgun_Pump_2.flipX = false;
			sniper_Kar98_2.flipX = false;
		}
		else if (FlxG.keys.justPressed.UP)
		{
			gunNbulletUD2 = 1;
			assaultRifle_ScarH_2.flipX = false;
			pistol_Berretta_2.flipX = false;
			shotgun_Pump_2.flipX = false;
			sniper_Kar98_2.flipX = false;
		}
		else if (FlxG.keys.justPressed.DOWN)
		{
			gunNbulletUD2 = 2;
			assaultRifle_ScarH_2.flipX = false;
			pistol_Berretta_2.flipX = false;
			shotgun_Pump_2.flipX = false;
			sniper_Kar98_2.flipX = false;
		}

		if (bullet.overlaps(npc1) && active == true)
		{
			remove(npc1);
			add(npc1);
			npc1.x = 537; // change this shi l8r
			npc1.y = 127;
			bullet_2.x = -1000;
			bullet_2.y = -1000;
			remove(bullet);
			totalKills = totalKills + 1;
		}

		if (bullet_2.overlaps(plr) && active == true)
		{
			remove(plr);
			add(plr);
			plr.x = 537; // change this shi l8r
			plr.y = 547;
			bullet.x = -1000;
			bullet.y = -1000;
			remove(bullet_2);
			totalKills = totalKills + 1;
		}
	}

	function shootBullet(gun:Int, plrr:Int) // 1 = plr 1, 2 = plr 2
	{
		if (FlxG.keys.justPressed.SHIFT) // the bullet stuff was taken from ghost clash lmao (I lowkey wanna update ghost clash soon)
		{
			shot = true;
		}

		var pad2:FlxGamepad = FlxG.gamepads.firstActive;

		if (FlxG.save.data.controllerSupport == "yes")
		{
			if (pad2 != null)
			{
				if (pad2.justPressed.RIGHT_TRIGGER)
				{
					shot = true;
				}

				if (pad2.justPressed.RIGHT_TRIGGER && gun == 1) // the bullet stuff was taken from ghost clash lmao
				{
					arSHOOT.play();
				}
				else if (pad2.justPressed.RIGHT_TRIGGER && gun == 2) // the bullet stuff was taken from ghost clash lmao
				{
					pistolSHOOT.play();
				}
				else if (pad2.justPressed.RIGHT_TRIGGER && gun == 3) // the bullet stuff was taken from ghost clash lmao
				{
					shotgunSHOOT.play();
				}
				else if (pad2.justPressed.RIGHT_TRIGGER && gun == 4) // the bullet stuff was taken from ghost clash lmao
				{
					sniperShOOT.play();
				}
			}
		}

		if (FlxG.keys.justPressed.SHIFT || FlxG.keys.justPressed.ENTER && gun == 1) // the bullet stuff was taken from ghost clash lmao
		{
			arSHOOT.play();
		}
		else if (FlxG.keys.justPressed.SHIFT || FlxG.keys.justPressed.ENTER && gun == 2) // the bullet stuff was taken from ghost clash lmao
		{
			pistolSHOOT.play();
		}
		else if (FlxG.keys.justPressed.SHIFT || FlxG.keys.justPressed.ENTER && gun == 3) // the bullet stuff was taken from ghost clash lmao
		{
			shotgunSHOOT.play();
		}
		else if (FlxG.keys.justPressed.SHIFT || FlxG.keys.justPressed.ENTER && gun == 4) // the bullet stuff was taken from ghost clash lmao
		{
			sniperShOOT.play();
		}

		if (FlxG.keys.justPressed.ENTER) // the bullet stuff was taken from ghost clash lmao
		{
			shot2 = true;
		}

		if (shot == true)
		{
			if (plrr == 1)
			{
				bulletActive = true;
				add(bullet);
				if (gunNbulletDIR == true && gunNbulletUD == 0)
				{
					if (active == true)
					{
						if (gun == 1)
						{
							bullet.x = bullet.x - 20;
							bullet.angle = 0;
							add(bullet);
						}
						else if (gun == 2)
						{
							bullet.x = bullet.x - 12;
							bullet.angle = 0;
							add(bullet);
						}
						else if (gun == 3)
						{
							bullet.x = bullet.x - 10;
							bullet.angle = 0;
							add(bullet);
						}
						else if (gun == 4)
						{
							bullet.x = bullet.x - 40;
							bullet.angle = 0;
							add(bullet);
						}
					}
				}
				else if (gunNbulletDIR == false && gunNbulletUD == 0)
				{
					if (active == true)
					{
						if (gun == 1)
						{
							bullet.x = bullet.x + 20;
							bullet.angle = 0;
							add(bullet);
						}
						else if (gun == 2)
						{
							bullet.x = bullet.x + 12;
							bullet.angle = 0;
							add(bullet);
						}
						else if (gun == 3)
						{
							bullet.x = bullet.x + 10;
							bullet.angle = 0;
							add(bullet);
						}
						else if (gun == 4)
						{
							bullet.x = bullet.x + 40;
							bullet.angle = 0;
							add(bullet);
						}
					}
				}
				else if (gunNbulletUD == 1)
				{
					if (active == true)
					{
						if (gun == 1)
						{
							bullet.y = bullet.y - 20;
							bullet.angle = 90;
							add(bullet);
						}
						else if (gun == 2)
						{
							bullet.y = bullet.y - 12;
							bullet.angle = 90;
							add(bullet);
						}
						else if (gun == 3)
						{
							bullet.y = bullet.y - 10;
							bullet.angle = 90;
							add(bullet);
						}
						else if (gun == 4)
						{
							bullet.y = bullet.y - 40;
							bullet.angle = 90;
							add(bullet);
						}
					}
				}
				else if (gunNbulletUD == 2)
				{
					if (active == true)
					{
						if (gun == 1)
						{
							bullet.y = bullet.y + 20;
							bullet.angle = 90;
							add(bullet);
						}
						else if (gun == 2)
						{
							bullet.y = bullet.y + 12;
							bullet.angle = 90;
							add(bullet);
						}
						else if (gun == 3)
						{
							bullet.y = bullet.y + 10;
							bullet.angle = 90;
							add(bullet);
						}
						else if (gun == 4)
						{
							bullet.y = bullet.y + 40;
							bullet.angle = 90;
							add(bullet);
						}
					}
				}

				if (bullet.x > 1280)
				{
					remove(bullet);
					bullet.x = plr.x + 15;
					bullet.y = plr.y + 10;
					shot = false;
				}
				else if (bullet.x < 0)
				{
					remove(bullet);
					bullet.x = plr.x + 15;
					bullet.y = plr.y + 10;
					shot = false;
				}

				if (bullet.y < 0)
				{
					remove(bullet);
					bullet.x = plr.x + 15;
					bullet.y = plr.y + 10;
					shot = false;
				}
				else if (bullet.y > 720)
				{
					remove(bullet);
					bullet.x = plr.x + 15;
					bullet.y = plr.y + 10;
					shot = false;
				}
			}
		}

		if (shot2 == true)
		{
			if (plrr == 2)
			{
				bulletActive2 = true;
				add(bullet_2);
				if (gunNbulletDIR2 == true && gunNbulletUD2 == 0)
				{
					if (active == true)
					{
						if (gun == 1)
						{
							bullet_2.x = bullet_2.x - 20;
							bullet_2.angle = 0;
							add(bullet_2);
						}
						else if (gun == 2)
						{
							bullet_2.x = bullet_2.x - 12;
							bullet_2.angle = 0;
							add(bullet_2);
						}
						else if (gun == 3)
						{
							bullet_2.x = bullet_2.x - 10;
							bullet_2.angle = 0;
							add(bullet_2);
						}
						else if (gun == 4)
						{
							bullet_2.x = bullet_2.x - 40;
							bullet_2.angle = 0;
							add(bullet_2);
						}
					}
				}
				else if (gunNbulletDIR2 == false && gunNbulletUD2 == 0)
				{
					if (active == true)
					{
						if (gun == 1)
						{
							bullet_2.x = bullet_2.x + 20;
							bullet_2.angle = 0;
							add(bullet_2);
						}
						else if (gun == 2)
						{
							bullet_2.x = bullet_2.x + 12;
							bullet_2.angle = 0;
							add(bullet_2);
						}
						else if (gun == 3)
						{
							bullet_2.x = bullet_2.x + 10;
							bullet_2.angle = 0;
							add(bullet_2);
						}
						else if (gun == 4)
						{
							bullet_2.x = bullet_2.x + 40;
							bullet_2.angle = 0;
							add(bullet_2);
						}
					}
				}
				else if (gunNbulletUD2 == 1)
				{
					if (active == true)
					{
						if (gun == 1)
						{
							bullet_2.y = bullet_2.y - 20;
							bullet_2.angle = 90;
							add(bullet_2);
						}
						else if (gun == 2)
						{
							bullet_2.y = bullet_2.y - 12;
							bullet_2.angle = 90;
							add(bullet_2);
						}
						else if (gun == 3)
						{
							bullet_2.y = bullet_2.y - 10;
							bullet_2.angle = 90;
							add(bullet_2);
						}
						else if (gun == 4)
						{
							bullet_2.y = bullet_2.y - 40;
							bullet_2.angle = 90;
							add(bullet_2);
						}
					}
				}
				else if (gunNbulletUD2 == 2)
				{
					if (bulletActive2 == true)
					{
						if (gun == 1)
						{
							bullet_2.y = bullet_2.y + 20;
							bullet_2.angle = 90;
							add(bullet_2);
						}
						else if (gun == 2)
						{
							bullet_2.y = bullet_2.y + 12;
							bullet_2.angle = 90;
							add(bullet_2);
						}
						else if (gun == 3)
						{
							bullet_2.y = bullet_2.y + 10;
							bullet_2.angle = 90;
							add(bullet_2);
						}
						else if (gun == 4)
						{
							bullet_2.y = bullet_2.y + 40;
							bullet_2.angle = 90;
							add(bullet_2);
						}
					}
				}

				if (bullet_2.x > 1280)
				{
					remove(bullet_2);
					bullet_2.x = npc1.x + 15;
					bullet_2.y = npc1.y + 10;
					shot2 = false;
				}
				else if (bullet_2.x < 0)
				{
					remove(bullet_2);
					bullet_2.x = npc1.x + 15;
					bullet_2.y = npc1.y + 10;
					shot2 = false;
				}

				if (bullet_2.y < 0)
				{
					remove(bullet_2);
					bullet_2.x = npc1.x + 15;
					bullet_2.y = npc1.y + 10;
					shot2 = false;
				}
				else if (bullet_2.y > 720)
				{
					remove(bullet_2);
					bullet_2.x = npc1.x + 15;
					bullet_2.y = npc1.y + 10;
					shot2 = false;
				}
			}
		}
	}

	function addLevelL1()
	{
		add(bg);
		add(rocket);
		add(cmpgnL1);
		add(npcFollowers);
		add(fade);
	}

	function addLevelL2()
	{
		add(bg);
		add(cmpgnL2);
		add(fade);
		add(paperNote);
	}

	function addLevelL3()
	{
		add(cmpgnL3);
		add(fade);
	}

	function addLevelL4()
	{
		add(cmpgnL4);
		add(cmpgnl42);
		add(fade);
	}

	function addLevelL5()
	{
		add(bg);
		add(cmpgnL1);
	}
}
