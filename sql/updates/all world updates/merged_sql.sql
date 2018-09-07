-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\achievements\leeeeroy jenkins.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	UPDATE `gameobject_template` SET data7 = 2 WHERE entry = "175124";
	DELETE FROM `gameobject_template` WHERE entry = "175622";
	INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, 
	`flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, 
	`data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, 
	`data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, 
	`VerifiedBuild`) VALUES('175622','22','0','Rookery Whelp Summoner','','','','0','4','1','0','0','0','0','0','0','15745','1','0','0','0','0','-1','0',
	'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1');
	UPDATE `creature_template` SET unit_flags = "8" WHERE entry = "10161";
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\instances\ahn kahet the old kingdom\old kingdom.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Correct Twisted Visage NPCs
	
	UPDATE creature_template SET damagemodifier=1 where entry IN (30625, 31480, 30621);
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\instances\obsidian sanctum\obsidianSanctumAdaptation.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	
	-- Hitbox.
	UPDATE creature_model_info SET bounding_radius=3.5, combat_reach=8 WHERE modelid=27035;
	
	
	-- Portals.
	
	DELETE FROM gameobject_template WHERE entry=193988;
	INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (193988, 10, 1327, 'Twilight Portal', '', '', '', 35, 32, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 57620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340);
	
	-- Portal spawns.
	
	DELETE FROM gameobject WHERE id=193988;
	INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (1034768, 193988, 615, 3, 1, 3137.26, 501.08, 87.9118, 0.846795, 0, 0, 0.41086, 0.911698, -20, 0, 1);
	INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (1034769, 193988, 615, 3, 1, 3238.37, 518.595, 58.9057, 0.739184, 0, 0, 0.361235, 0.932475, -20, 0, 1);
	INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (1034770, 193988, 615, 3, 1, 3362.01, 553.726, 95.7068, 4.56818, 0, 0, 0.756211, -0.654328, -20, 0, 1);
	INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (1034771, 193988, 615, 3, 1, 3219.67, 656.795, 87.2898, 5.92596, 0, 0, 0.177664, -0.984091, -20, 0, 1);
	
	
	
	-- Trigger controller:
	DELETE FROM creature WHERE guid=256901;
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (256901, 22515, 615, 3, 1, 0, 0, 3249.02, 534.955, 58.9436, 1.6132, 300, 0, 0, 4121, 0, 0, 0, 0, 0);
	
	
	
	-- Twilight Shift removes Twilight Torment from Vesperon.
	
	DELETE FROM `spell_linked_spell` WHERE spell_trigger=57874;
	INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (57874, -57935, 1, 'Twilight Shift removes Twilight Torment');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\instances\obsidian sanctum\Trash SAI.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	  /* Raid Normal for 10 & 25 people */
	 /* Trash Mobs */
	
	-- Onyx Blaze Mistress
	SET @ENTRY := 30681;
	UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,0,0,100,2,5000,5000,12000,13000,11,39529,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Shock'),
	(@ENTRY,0,1,0,0,0,100,4,5000,5000,12000,13000,11,58940,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Shock'),
	(@ENTRY,0,2,0,0,0,100,2,8000,8000,26000,29000,11,57757,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Rain of Fire'),
	(@ENTRY,0,3,0,0,0,100,4,8000,8000,26000,29000,11,58936,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Rain of Fire'),
	(@ENTRY,0,4,0,0,0,100,6,3000,11000,8000,17000,11,57753,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Conjure Flame Orb');
	
	-- Onyx Brood General
	SET @ENTRY := 30680;
	UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,4,0,100,3,0,0,0,0,11,57740,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Devotion Aura on Aggro'),
	(@ENTRY,0,1,0,4,0,100,5,0,0,0,0,11,58944,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Devotion Aura on Aggro'),
	(@ENTRY,0,2,0,0,0,100,6,4500,4500,11500,13500,11,13737,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mortal Strike Shock'),
	(@ENTRY,0,3,0,0,0,100,7,6000,6000,0,0,11,57742,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Avenging Fury Shock'),
	(@ENTRY,0,4,0,2,0,100,3,0,30,0,0,11,57733,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Draconic Rage at 30% HP'),
	(@ENTRY,0,5,0,2,0,100,5,0,30,0,0,11,58942,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Draconic Rage at 30% HP');
	
	-- Onyx Flight Captain
	SET @ENTRY := 30682;
	UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,0,0,100,6,5000,5000,12000,14000,11,58953,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Pummel'),
	(@ENTRY,0,1,0,0,0,100,6,8000,9000,28000,34000,11,57759,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Hammer Drop');
	
	-- Onyx Sanctum Guardian
	SET @ENTRY := 30453;
	UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,0,0,100,2,4000,5500,35000,41000,11,58948,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Curse of Mending'),
	(@ENTRY,0,1,0,0,0,100,4,4000,5500,35000,41000,11,39647,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Curse of Mending'),
	(@ENTRY,0,2,0,0,0,100,2,9000,9000,17800,19300,11,57728,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shockwave'),
	(@ENTRY,0,3,0,0,0,100,4,9000,9000,17800,19300,11,58947,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shockwave'),
	(@ENTRY,0,4,0,2,0,100,7,0,30,0,0,11,53801,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Frenzy at 30% HP'),
	(@ENTRY,0,5,0,2,0,100,7,0,30,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text at 30% HP');
	-- NPC talk text insert
	SET @ENTRY := 30453;
	DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
	INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
	(@ENTRY,0,0, '%s goes into a frenzy!',16,0,100,0,0,0, 'combat Frenzy');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\instances\obsidian sanctum\trash waypoints.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\instances\oculus\drakes exploit.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	
	
	-- Searing Wrath can only be used on Ley Guardian Eregos and Azure Ring Guardian.
	
	DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=50232;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
	(13, 1, 50232, 0, 0, 31, 0, 3, 27656, 0, 0, 0, 0, '', 'Searing Wrath bounce implicit target can be Eregos'),
	(13, 1, 50232, 0, 1, 31, 0, 3, 28276, 0, 0, 0, 0, '', 'Searing Wrath bounce implicit target can be Greater Lay Whelp'),
	(13, 1, 50232, 0, 2, 31, 0, 3, 28236, 0, 0, 0, 0, '', 'Searing Wrath bounce implicit target can be Azure Ring Captain'),
	(13, 1, 50232, 0, 3, 31, 0, 3, 27638, 0, 0, 0, 0, '', 'Searing Wrath bounce implicit target can be Azure Ring Guardian');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\instances\utgarde\pinnacle.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	
	-- Despawn one Grauf and set Inhabittype
	
	DELETE FROM creature WHERE guid=126052;
	
	UPDATE creature_template SET Inhabittype=4 WHERE entry=26893;
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\instances\vault of archavon\bosses.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	
	-- Despawn Koralon / Toravon. 
	
	DELETE FROM creature WHERE id IN(35013, 38433);
	
	
	
	-- Emalon's Lightning Nova
	
	DELETE FROM spell_script_names WHERE spell_id=65279;
	INSERT INTO spell_script_names (spell_id, scriptname) VALUES (65279, "spell_emalon_lightning_nova");
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\miscelaneous\battlegrounds.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	UPDATE battleground_template SET MinPlayersPerTeam=7 WHERE id IN(3, 7, 9);
	
	UPDATE battleground_template SET MinPlayersPerTeam=6 WHERE id IN(32);
	
	
	
	UPDATE battleground_template SET weight=0 WHERE id=30;
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\miscelaneous\Dalaran Forges.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Dalaran Melting Forges
	-- Forge of Fate Forge
	INSERT into `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values
	('999997','1685','571','1','1','5929.644','687.669','640.154','2.67735','0','0','-0.333807','0.942641','100','100','1');
	-- Tanks for Everything right side Forge
	INSERT into `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values
	('999996','1685','571','1','1','5901.305','670.987','641.3','2.67735','0','0','-0.333807','0.942641','100','100','1');
	-- Tanks for Everything left side Forge
	INSERT into `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values
	('999995','1685','571','1','1','5913.004','684.869','641.367','2.67735','0','0','-0.333807','0.942641','100','100','1');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\miscelaneous\dalaran.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	DELETE FROM gameobject WHERE id=193772;
	
	DELETE FROM creature_text WHERE entry IN(32169, 32170);
	INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
	(32169, 0, 0, "Reinforcements are needed on the Wintergrasp battlefield! I have opened a portal for quick travel to the battle at The Silver Enclave.", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP BATTLE START"),
	(32169, 1, 0, "The battle for control of Wintergrasp will begin in 5 minutes! Prepare yourselves for battle!", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP 5 minutes"),
	(32169, 2, 0, "The battle for control of Wintergrasp will begin in 10 minutes! Prepare yourselves for battle!", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP 10 minutes"),
	(32169, 3, 0, "The battle for control of Wintergrasp will begin in 15 minutes! Prepare yourselves for battle!", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP 15 minutes"),
	(32170, 0, 0, "Reinforcements are needed on the Wintergrasp battlefield! I have opened a portal for quick travel to the battle at The Sunreaver's Sanctuary.", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP BATTLE START"),
	(32170, 1, 0, "The battle for control of Wintergrasp will begin in 5 minutes! Prepare yourselves for battle!", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP 5 minutes"),
	(32170, 2, 0, "The battle for control of Wintergrasp will begin in 10 minutes! Prepare yourselves for battle!", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP 10 minutes"),
	(32170, 3, 0, "The battle for control of Wintergrasp will begin in 15 minutes! Prepare yourselves for battle!", 14, 0, 0, 2, 0, 0, "SAY WINTERGRASP 15 minutes");
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\miscelaneous\flypaths.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	DELETE FROM spell_dbc WHERE `Effect1`=123 AND `comment` LIKE '%Flight%Path%' AND `EffectMiscValue1`>0;
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\miscelaneous\item exploits.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Fix Exploits.
	DELETE FROM spell_bonus_data WHERE entry IN(7712, 7714);
	INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES 
	(7712, 0, 0, 0, 0, 'Item - Fiery Retributer | Blazefury Medallion'),
	(7714, 0, 0, 0, 0, 'Fiery Plate Gauntlets (Fire Strike)');
	
	
	
	-- Correct Hakkari 
	
	UPDATE item_template SET RequiredLevel=60 WHERE entry IN (22968, 22967, 22699, 22700, 22701, 22702, 22707);
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\miscelaneous\NPC.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Correct the aura to the Converted Heroes.
	DELETE FROM creature_template_addon WHERE entry=32255;
	INSERT INTO creature_template_addon (entry, auras) VALUES (32255,45631);
	
	
	
	-- Trolls from Grizzly Hills experience removal.
	
	UPDATE creature_template SET ExperienceModifier=0 WHERE entry IN(26570, 26458, 26583, 26582);
	
	
	
	
	-- Fix eternal chasing minions:
	
	-- Voidwalker minion from Tanaris.
	UPDATE `creature_template` SET `ainame`='GuardAI' WHERE `entry`=8996;
	
	
	
	
	
	-- Thrallmar's gryph master should talk in orcish.
	
	UPDATE creature_text SET language=1 WHERE entry=16587;
	
	
	
	-- Grunt Kor'ja for the Garments of Spiritualy quest.
	
	UPDATE creature_template SET faction=85 WHERE entry=12430;
	
	
	
	
	DELETE FROM creature_template WHERE entry IN (12429,12423,12427,12430,12428, 17551);
	
	INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (12423, 0, 0, 0, 0, 0, 3258, 0, 0, 0, 'Guard Roberts', NULL, NULL, 0, 7, 7, 0, 11, 0, 1, 1.14286, 1, 0, 0, 2000, 0, 1, 0, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2, 'npc_garments_of_quests', 12340);
	INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (12427, 0, 0, 0, 0, 0, 12474, 0, 0, 0, 'Mountaineer Dolf', NULL, NULL, 0, 7, 7, 0, 55, 0, 1, 1.14286, 1, 0, 0, 2000, 0, 1, 4104, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'npc_garments_of_quests', 12340);
	INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (12428, 0, 0, 0, 0, 0, 12475, 0, 0, 0, 'Deathguard Kel', NULL, NULL, 0, 7, 7, 0, 71, 0, 1, 1.14286, 1, 0, 0, 2000, 0, 1, 36872, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'npc_garments_of_quests', 12340);
	INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (12429, 0, 0, 0, 0, 0, 12476, 0, 0, 0, 'Sentinel Shaya', NULL, NULL, 0, 7, 7, 0, 80, 0, 1, 1.14286, 1, 0, 0, 2000, 0, 1, 4104, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'npc_garments_of_quests', 12340);
	INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (12430, 0, 0, 0, 0, 0, 12477, 0, 0, 0, 'Grunt Kor\'ja', NULL, NULL, 0, 7, 7, 0, 85, 0, 0.92, 1.14286, 1, 0, 0, 2000, 2134, 1, 4096, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'npc_garments_of_quests', 12340);
	INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (17551, 0, 0, 0, 0, 0, 17082, 0, 0, 0, 'Tavara', '', NULL, 0, 5, 5, 0, 1647, 0, 1.5, 1.14286, 1, 0, 0, 2000, 0, 1, 4096, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 1, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, '', 12340);
	
	UPDATE creature_template SET scriptname="npc_garments_of_quests" WHERE entry=17551;
	
	
	
	
	-- TEMPORAL HERE, ITS FROM ULDUAR:
	
	-- IMPORTANT: Harpoon fix. Razorscale Controller faction in order it to work properly, Harpoons activables by the players.
	
	UPDATE creature_template SET faction = 35 WHERE entry = 33233;
	
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\miscelaneous\rdf item level requirement.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Correct the item level for the heroic dungeons
	
	UPDATE access_requirement SET item_level=100 WHERE difficulty=1 AND mapId IN(574,575,576,578,595,599,600,601,602,604,608,619);
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\miscelaneous\restrictions and disables Algalon.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Northrend Dungeons, normal and heroic bosses.
	
	UPDATE creature_loot_template SET item=40752 WHERE item=47241 and entry IN(
	30810, 
	30774, 
	30807, 
	30788, 
	30748, 
	31656, 
	31679, 
	31673, 
	30510, 
	30529, 
	30532,
	30540,
	30398,
	26798,
	31612,
	31611,
	31610,
	31456,
	31469,
	31465,
	31463,  
	30258,
	31464,
	31362,
	31350,
	31349,
	31360,
	31507,
	31510,
	31508,
	31511,
	31509,
	31512,
	31506,
	31370,
	31365, 
	31367,
	30530,
	31368,
	29932,
	31384,
	31381,
	28234,
	31386,
	31211,
	31212,
	31215,
	31217,
	32313,
	31533,
	31536,
	31537,
	31538,
	31558,
	31559,
	31560,
	31561,
	28860,
	
	31311, -- Sartharion, 10 and 25 Man.
	
	26731, -- The Nexus / Grand Magus Telestra. 
	26763, -- The Nexus / Anomalus.
	26794, -- The Nexus / Ormorok the Tree-Shaper.
	26723, -- The Nexus / Keristrasza.
	26796, -- The Nexus / Commander Stoutbeard.
	26798, -- The Nexus / Commander Kolurg.
	
	28923, -- Halls of Lightning / Loken.
	28586, -- Halls of Lightning / General Bjarngrim.
	28587, -- Halls of Lightning / Volkhan.
	28546, -- Halls of Lightning / Ionar.
	
	36502, -- The Forge of Souls / Devourer of Souls.
	36497, -- The Forge of Souls / Bronjahm.
	
	36658, -- The Pit of Saron / Scourgelord Tyrannus.
	36494, -- The Pit of Saron / Forgemaster Garfrost.
	36476, -- The Pit of Saron / Ick.
	
	27975, -- Halls of Stone / Maiden of Grief.
	27977, -- Halls of Stone / Krystallus.
	27978, -- Halls of Stone / Sjonnir The Ironshaper.
	
	26529, -- The Culling of Stratholme / Meathook.
	26530, -- The Culling of Stratholme / Salramm the Fleshcrafter.
	26532, -- The Culling of Stratholme / Chrono-Lord Epoch.
	26533, -- The Culling of Stratholme / Mal'Ganis.
	
	27654, -- The Oculus / Drakos the Interrogator
	27447, -- The Oculus / Varos Cloudstrider.
	27655, -- The Oculus / Mage-Lord Urom.
	27656, -- The Oculus / Ley-Guardian Eregos.
	
	29315, -- The Violet Hold / Erekem.
	29316, -- The Violet Hold / Moragg
	29313, -- The Violet Hold / Ichoron.
	29266, -- The Violet Hold / Xevozz.
	29312, -- The Violet Hold / Lavanthor.
	29314, -- The Violet Hold / Zuramat the Obliterator.
	31134, -- The Violet Hold / Cyanigosa.
	
	29304, -- Gundrak / Slad'Ran.
	29932, -- Gundrak / Eck the Ferocious.
	29307, -- Gundrak / Drakkari Colossus.
	29573, -- Gundrak / Drakkari Elemental.
	29306, -- Gundrak / Gal'darah.
	
	26630, -- Drak'Tharon / Trollgore.
	27483, -- Drak'Tharon / King Dred.
	26632, -- Drak'Tharon / The Prophet Tharon'ja.
	
	29311, -- Ahn'kahet / Heralz Volazj. 
	30258, -- Ahn'kahet / Amanitar.
	29309, -- Ahn'kahet / Elder Nadox. 
	29308, -- Ahn'kahet / Prince Taldaram
	29310, -- Ahn'kahet / Jedoga Shadowseeker
	
	23953, -- Utgarde Keep / Prince Keleseth.
	24200, -- Utgarde Keep / Skarvald The Constructor.
	24201, -- Utgarde Keep / Dalronn the Controller.
	23954, -- Utgarde Keep / Ingvar the Plunderer.
	
	26668, -- Utgarde Pinnacle / Svala Sorrowgrave.
	26687, -- Utgarde Pinnacle / Gortok Palehoof.
	26693, -- Utgarde Pinnacle / Skadi the Ruthless.
	26861  -- Utgarde Pinnacle / King Ymiron.
	);
	
	
	-- Valor Ulduar 10
	
	UPDATE creature_loot_template SET item=40753 WHERE item=47241 and entry  IN (
	33113, 
	33118, 
	33186, 
	33293, 
	32867, 
	32927, 
	33271, 
	33288
	);
	
	
	-- Conquest Ulduar 25
	UPDATE creature_loot_template SET item=45624 WHERE item=47241 and entry  IN (
	34003, -- Flame Leviathan
	33190, -- Ignis the Furnace Master
	33724, -- Razorscale
	33885, -- XT002
	33693, -- Steelbreaker
	33692, -- Runemaster Molgeim
	33449, -- General Vezax
	33955 -- Yogg-Saron
	);
	
	-- Valor Ulduar 10 chests.
	
	UPDATE gameobject_loot_template SET item=40753 WHERE item=47241 AND entry  IN(
	27068, 27069, -- Hodir 10
	27073, 27074, -- Thorim 10
	27085, 27086, -- Mimiron 10
	27080, 27081 -- Freya 10
	);
	
	
	UPDATE gameobject_loot_template SET item=45624 WHERE item=47241 and entry  IN(
	27061, 26929, -- Kologarn
	
	26946, 26950, -- Hodir 25
	
	26956, 26955, -- Thorim 25 
	
	26963, 26967, -- Mimiron 255
	
	27079, 26962, -- Freya 25 
	27030, 26974 -- Algalon 10/25
	);
	
	
	
	-- Heroism Naxx 10 - OS (Drakes + Sartharion)
	
	UPDATE creature_loot_template SET item=40752 WHERE item=47241 and entry IN(16028,15931,15932,15928,15956,15953,15952,15954,15936,16011,16061,16060,15989,15990, 28860, 30452, 30449, 30451);
	
	-- Valor Naxx 25 - OS (Drakes + Sartharion)
	
	UPDATE creature_loot_template SET item=40753 WHERE item=47241 and entry IN(29448,29373,29417,29701,29278,29268,29615,29249,29991,30061,29718,29324,29955,29940, 31311, 31535, 31520, 31534);
	
	
	-- Cambiar el Phase Mask a 2 del gameobject 202278
	
	-- UPDATE gameobject SET phaseMask=2 WHERE id=202278;
	
	
	-- FH 10 Man.
	
	UPDATE gameobject_loot_template SET item=40752 WHERE item=47241 AND entry=25192; 
	
	
	-- FH 25 MAN.
	
	UPDATE gameobject_loot_template SET item=40753 WHERE item=47241 AND entry=25193; 
	
	
	-- Malygos 10
	
	UPDATE gameobject_loot_template SET item=40752 WHERE item=47241 AND entry=26094;
	
	
	
	-- Malygos 25
	UPDATE gameobject_loot_template SET item=40753 WHERE item=47241 AND entry=26097;
	
	
	--
	DELETE FROM creature_loot_template where entry=31311 AND item=43346; -- Large satchel of Spoils
	
	-- Disables, AGREGAR ISLE OF CONQUEST.
	DELETE FROM disables WHERE sourcetype=2 AND entry IN(249, 649, 631, 724, 632, 658, 668, 628, 615);
	INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 615, 3, '', '', 'TEMPORAL - Obsidian Sanctum');
	INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 249, 3, '', '', 'Onyxia');
	INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 649, 15, '', '', 'Trial of the Crusader');
	INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 631, 15, '', '', '10/25HC Icecrown Citadel Modes');
	INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 724, 15, '', '', 'Ruby Sanctum, 10/25 man normal and heroic modes.');
	
	INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (3, 628, 0, '', '', 'Disable Isle of Conquest Battleground.');
	INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 632, 3, '', '', 'The Forge of Souls');
	INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 658, 3, '', '', 'The Pit of Saron');
	INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (2, 668, 3, '', '', 'Halls of Reflection');
	
	
	
	
	-- Dalaran daily quests for the instances
	
	-- Achievement: http://www.wowhead.com/achievement=2018/timear-foresees
	
	-- http://www.wowhead.com/npc=31439/archmage-timear + quest http://www.wowhead.com/quest=13241/timear-foresees-ymirjar-berserkers-in-your-future
	
	-- Change triumph for heroism
	
	UPDATE quest_template SET RewardItemId1=40752 WHERE id IN(13244, 13241, 13240, 13243);
	-- UPDATE quest_template SET RewardItemId1=40752 WHERE id=13241;
	
	DELETE FROM creature_queststarter WHERE id=31439 AND quest IN(13244, 13241, 13240, 13243);
	DELETE FROM creature_questender WHERE id=31439 AND quest IN(13244, 13241, 13240, 13243);
	
	INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES 
	(31439, 13244),
	(31439, 13241),
	(31439, 13240),
	(31439, 13243);
	
	
	INSERT INTO `creature_questender` (`id`, `quest`) VALUES
	(31439, 13244),
	(31439, 13241),
	(31439, 13240),
	(31439, 13243);
	
	
	-- Pool Quest for Timear foresees achievement.
	
	DELETE FROM pool_quest WHERE pool_entry=5800 AND entry IN(13244, 13241, 13240, 13243);
	INSERT INTO pool_quest (entry, pool_entry, description) VALUES
	(13244, 5800, "Timear Foresees Titanium Vanguards in your Future!"),
	(13241, 5800, "Timear Foresees Ymirjar Berserkers in your Future!"),
	(13240, 5800, "Timear Foresees Centrifuge Constructs in your Future!"),
	(13243, 5800, "Timear Foresees Infinite Agents in your Future!");
	
	
	DELETE FROM pool_template WHERE entry=5800;
	INSERT INTO pool_template(entry, max_limit) VALUES
	(5800, 1);
	
	
	
	
	-- Daily heroic dungeons quests.
	
	DELETE FROM pool_quest WHERE pool_entry=5801 AND entry IN(13245, 13247, 13249, 13251, 13253, 13255, 13246, 13248, 13250, 13252, 13254, 13256);
	INSERT INTO pool_quest (entry, pool_entry, description) VALUES
	(13245, 5801, ""),
	(13247, 5801, ""),
	(13249, 5801, ""),
	(13251, 5801, ""),
	(13253, 5801, ""),
	(13255, 5801, ""),
	(13246, 5801, ""),
	(13248, 5801, ""),
	(13250, 5801, ""),
	(13252, 5801, ""),
	(13254, 5801, ""),
	(13256, 5801, "");
	
	
	DELETE FROM pool_template WHERE entry=5801;
	INSERT INTO pool_template(entry, max_limit) VALUES
	(5801, 1);
	
	
	-- Archmages script.
	
	UPDATE creature_template SET ScriptName="npc_archmage_timear" WHERE entry=31439;
	UPDATE creature_template SET ScriptName="npc_archmage_landalock" WHERE entry=20735;
	
	-- Delete Dalaran's weekly quests and add the others.
	DELETE FROM creature_queststarter WHERE id=20735;
	DELETE FROM creature_questender WHERE id=20735;
	INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES 
	(20735,13245),
	(20735,13247),
	(20735,13249),
	(20735,13251),
	(20735,13253),
	(20735,13255),
	(20735,13246),
	(20735,13248),
	(20735,13250),
	(20735,13252),
	(20735,13254),
	(20735,13256)
	;
	
	
	INSERT INTO `creature_questender` (`id`, `quest`) VALUES
	(20735,13245),
	(20735,13247),
	(20735,13249),
	(20735,13251),
	(20735,13253),
	(20735,13255),
	(20735,13246),
	(20735,13248),
	(20735,13250),
	(20735,13252),
	(20735,13254),
	(20735,13256)
	;
	
	
	
	/*UPDATE creature_template SET InhabitType=4 WHERE entry IN(31619, 31625);
	UPDATE creature_template SET Scale=1.4 WHERE entry IN(31623, 31627, 31622, 31624, 31626, 31633); -- Malganis
	
	UPDATE creature_template SET scale=1.7 WHERE entry IN(31619,31618); -- Eregos, Keris
	
	-- Correct Emblems from the daily questes.
	
	UPDATE quest_template SET RewardItemId1=40752 WHERE id IN(13245, 13247, 13249, 13251, 13253, 13255, 13246, 13248, 13250, 13252, 13254, 13256);
	
	
	
	-- Archmage Lan'dalock, Images and quests.
	
	-- Auras for some images.  Levitate
	DELETE FROM creature_template_addon WHERE entry IN(31620, 31619, 31584, 31618, 31622, 31624, 31629, 31634);
	INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31620, 0, 0, 0, 0, 0, 52970);
	INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31619, 0, 0, 0, 0, 0, 27986);
	INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31618, 0, 0, 0, 0, 0, 27986);
	INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31584, 0, 0, 0, 0, 0, 52970);
	INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31622, 0, 0, 0, 0, 0, 52970);
	INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31624, 0, 0, 0, 0, 0, 52970);
	INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31629, 0, 0, 0, 0, 0, 52970);
	INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (31634, 0, 0, 0, 0, 0, 52970);
	
	
	
	-- Conditions for the questes.
	
	
	-- Malganis/Eregos chache already in db.
	
	-- Ingvar
	
	SET @QUEST := 13245;
	SET @ITEM := 43662;
	SET @REFERENCE_ENTRY := 31674;
	
	DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
	INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
	(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);
	
	DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
	(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);
	
	
	
	
	-- Prophet Tharonja
	
	SET @QUEST := 13249;
	SET @ITEM := 43670;
	SET @REFERENCE_ENTRY := 31360;
	
	DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
	INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
	(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);
	
	DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
	(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);
	
	
	
	-- Loken
	
	SET @QUEST := 13253;
	SET @ITEM := 43724;
	SET @REFERENCE_ENTRY := 31538;
	
	DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
	INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
	(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);
	
	DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
	(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);
	
	
	
	-- Herald Volazj
	
	SET @QUEST := 13255;
	SET @ITEM := 43821;
	SET @REFERENCE_ENTRY := 31464;
	
	DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
	INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
	(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);
	
	DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
	(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);
	
	
	
	
	-- Keristrasza
	
	SET @QUEST := 13246;
	SET @ITEM := 43665;
	SET @REFERENCE_ENTRY := 30540;
	
	DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
	INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
	(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);
	
	DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
	(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);
	
	
	
	
	-- Ymiron
	
	SET @QUEST := 13248;
	SET @ITEM := 43669;
	SET @REFERENCE_ENTRY := 30788;
	
	DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
	INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
	(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);
	
	DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
	(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);
	
	
	-- Galdarah
	
	SET @QUEST := 13250;
	SET @ITEM := 43693;
	SET @REFERENCE_ENTRY := 31368;
	
	DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
	INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
	(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);
	
	DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
	(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);
	
	
	
	-- Sjonnir
	
	SET @QUEST := 13252;
	SET @ITEM := 43699;
	SET @REFERENCE_ENTRY := 31386;
	
	DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
	INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
	(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);
	
	DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
	(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);
	
	
	
	
	-- Anubarak
	
	SET @QUEST := 13254;
	SET @ITEM := 43726;
	SET @REFERENCE_ENTRY := 31610;
	
	DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
	INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
	(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);
	
	DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
	(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);
	
	
	-- Cyanigosa
	
	SET @QUEST := 13256;
	SET @ITEM := 43823;
	SET @REFERENCE_ENTRY := 31506;
	
	DELETE FROM creature_loot_template WHERE entry=@REFERENCE_ENTRY AND item=@ITEM;
	INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
	(@REFERENCE_ENTRY, @ITEM, 0, 100, 1, 1, 0, 1, 1, NULL);
	
	DELETE FROM conditions WHERE sourcegroup=@REFERENCE_ENTRY AND sourceentry=@ITEM;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
	(10, @REFERENCE_ENTRY, @ITEM, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, 0, '', NULL);
	
	
	
	*/
	
	
	
	
	
	
	
	-- Access requirements
	
	-- Access Requirement for Ulduar, for player not leader.
	
	DELETE FROM access_requirement WHERE mapId IN(603);
	
	INSERT INTO `access_requirement` (`mapId`, `difficulty`, `level_min`, `level_max`, `item_level`, `item`, `item2`, `quest_done_A`, `quest_done_H`, `completed_achievement`, `quest_failed_text`, `comment`) VALUES 
	(603, 0, 80, 0, 0, 0, 0, 0, 0, 576, "You must complete The Fall of Naxxramas 10 players first.", 'Ulduar 10 players - The Fall of Naxxramas 10 requirement.');
	
	INSERT INTO `access_requirement` (`mapId`, `difficulty`, `level_min`, `level_max`, `item_level`, `item`, `item2`, `quest_done_A`, `quest_done_H`, `completed_achievement`, `quest_failed_text`, `comment`) VALUES 
	(603, 1, 80, 0, 0, 0, 0, 0, 0, 577, "You must complete The Fall of Naxxramas 25 players first.", 'Ulduar 10 players - The Fall of Naxxramas 25 requirement.');
	
	
	
	-- Inside the Frozen Citadel quest.
	
	DELETE FROM creature_queststarter WHERE quest IN(24510, 24506);
	
	
	
	
	UPDATE quest_template SET rewardItemid1=0 WHERE id IN(24788, 24789, 24790, 24791);
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\miscelaneous\trinity strings.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Broadcasts 
	
	UPDATE trinity_string SET content_default="|cff99CCFF%s|r" WHERE entry=11000;
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\miscelaneous\vehicles_root_movement.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	UPDATE creature_template SET `unit_flags`=`unit_flags` |4 WHERE entry IN(27714, 28850, 28366, 27894, 32795);
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\A mammoth Undertaking.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Quest: A Mammoth Undertaking (12607)
	UPDATE `creature_template` SET `VehicleId`=206,`AIName`='SmartAI',`spell1`=51660,`speed_run`=0.95238 WHERE `entry`=28379;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=28379 AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(28379,0,0,0,31,0,100,0,51660,0,0,0,41,0,0,0,0,0,0,22,0,0,0,0,0,0,0, 'Shattertusk Mammoth - On Spell Hit - Despawn');
	
	DELETE FROM `npc_spellclick_spells` where `npc_entry`=28379;
	INSERT INTO `npc_spellclick_spells`(`npc_entry`,`spell_id`,`cast_flags`,`user_type`) values 
	(28379,51658,0,0);
	
	DELETE FROM `creature_template_addon` WHERE `entry`=28379;
	INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
	(28379,0,0,1,0, NULL); -- Shattertusk Mammoth
	
	
	-- Shattertusk Mammoth SAI
	SET @ENTRY := 28379;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,31,0,100,0,51660,0,0,0,41,0,0,0,0,0,0,22,0,0,0,0,0,0,0,"Shattertusk Mammoth - On Target Spellhit 'Hand Over Mammoth' - Despawn Instant"),
	(@ENTRY,0,1,0,8,0,100,0,51659,0,0,0,33,28374,0,0,0,0,0,7,0,0,0,0,0,0,0,"Shattertusk Mammoth - On Spellhit 'Apply Harness' - Quest Credit 'A Mammoth Undertaking'");
	
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\A Race Against Time.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- A Race Against Time (11671)
	
	SET @NPC_SALRAND                := 25584; -- Inquisitor Salrand
	SET @NPC_BERYL_INVISMAN         := 25594; -- Beryl Point InvisMan
	SET @GOB_BERYL_SHIELD           := 187773; -- Beryl Shield
	SET @GOB_BERYL_SHIELD_FOCUS     := 187849; -- Beryl Force Shield
	SET @SPELL_BEAM                 := 45777; -- Salrand's Beam
	SET @SPELL_THROW_DETONATOR      := 45780; -- Throw Beryl Shield Detonator
	SET @SPELL_SUMMON_DETONATOR     := 45791; -- Summon Beryl Detonator
	SET @SPELL_EXPLOSION            := 45796; -- Beryl Shield Explosion
	SET @SPELL_LOCKBOX              := 45809; -- Summon Salrand's Lockbox
	SET @GUID                       := 60441; -- used for a wrong go spawn,will reuse
	
	UPDATE `gameobject_template` SET `data1`=80 WHERE  `entry`=300176; -- spell focus radius
	UPDATE `gameobject_template` SET `flags`=32 WHERE  `entry`=187773; -- shield:nodespawn flag
	
	-- missing spell focus
	DELETE FROM `gameobject` WHERE `guid`=@GUID;
	INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
	(@GUID,@GOB_BERYL_SHIELD_FOCUS,571,1,1,3392.85,6161.089,79.8313,0,0,0,0,0,300,0,1);
	
	UPDATE `creature_template` SET `InhabitType`=0x4,`unit_flags`=0x100,`AIName`='SmartAI' WHERE `entry`=@NPC_SALRAND;
	UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPC_BERYL_INVISMAN;
	
	DELETE FROM `creature_template_addon` WHERE `entry`=@NPC_SALRAND;
	INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
	(@NPC_SALRAND,0,0x0,0x1,'45775');
	
	
	DELETE FROM `smart_scripts` WHERE (`source_type`=0 AND `entryorguid` IN (@NPC_SALRAND,@NPC_BERYL_INVISMAN)) OR (`source_type`=9 AND `entryorguid` IN (@NPC_SALRAND*100,@NPC_BERYL_INVISMAN*100));
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@NPC_SALRAND,0,0,0,38,0,100,0,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On data 1 1 - Say'),
	(@NPC_SALRAND,0,1,2,38,0,100,0,1,2,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'On data 1 2 - Say'),
	(@NPC_SALRAND,0,2,0,61,0,100,0,0,0,0,0,80,@NPC_SALRAND*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'On link - Run script'),
	(@NPC_SALRAND,0,3,4,6,0,100,0,0,0,0,0,11,@SPELL_LOCKBOX,0,0,0,0,0,1,0,0,0,0,0,0,0,'On death - Cast spell'),
	(@NPC_SALRAND,0,4,0,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'On death - Say'),
	(@NPC_SALRAND*100,9,0,0,0,0,100,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On script - set fly off'),
	(@NPC_SALRAND*100,9,1,0,0,0,100,0,3000,3000,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'On script - Set unit flags'),
	--
	(@NPC_BERYL_INVISMAN,0,0,0,8,0,100,0,@SPELL_THROW_DETONATOR,0,0,0,80,@NPC_BERYL_INVISMAN*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'On spellhit - Run Script'),
	(@NPC_BERYL_INVISMAN*100,9,0,0,0,0,100,0,0,0,0,0,11,@SPELL_SUMMON_DETONATOR,0,0,0,0,0,1,0,0,0,0,0,0,0,'On script - Cast Spell'),
	(@NPC_BERYL_INVISMAN*100,9,1,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,@NPC_SALRAND,100,0,0,0,0,0,'On script - Set Data'),
	(@NPC_BERYL_INVISMAN*100,9,2,0,0,0,100,0,8000,8000,0,0,45,1,2,0,0,0,0,19,@NPC_SALRAND,100,0,0,0,0,0,'On script - Set Data'),
	(@NPC_BERYL_INVISMAN*100,9,3,0,0,0,100,0,2000,2000,0,0,11,@SPELL_EXPLOSION,0,0,0,0,0,1,0,0,0,0,0,0,0,'On script - Cast Spell');
	
	DELETE FROM `creature_text` WHERE `entry`=@NPC_SALRAND;
	INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
	(@NPC_SALRAND,0,0,'What is the meaning of this disturbance?!',14,0,100,0,0,0,'Inquisitor Salrand to Beryl Point InvisMan'),
	(@NPC_SALRAND,1,0,'Who dares interrupt my work!? Show yourself, coward!',14,0,100,0,0,0,'Inquisitor Salrand to Beryl Point InvisMan'),
	(@NPC_SALRAND,2,0,'I''ve destroyed the key! Your cherished archmage belongs to Malygos!',12,0,100,0,0,0,'Inquisitor Salrand');
	
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@SPELL_THROW_DETONATOR;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
	(13,1,@SPELL_THROW_DETONATOR,0,0,31,0,3,@NPC_BERYL_INVISMAN,0,0,0,'','Throw Beryl Shield Detonator target npc');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Absholutely... Thish Will Work!.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Dragonflayer Vrykul Prisoner SAI
	SET @ENTRY := 24284;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,8,0,100,0,43386,0,0,0,33,24284,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dragonflayer Vrykul Prisoner - On Spellhit 'Peppy's Special Mix' - Quest Credit 'Absholutely... Thish Will Work!'");
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\anatoly will talk.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Issue 8401: Anatoly will talk
	SET @SASHA := 26935;
	SET @ANATOLY := 26971;
	SET @HORSE := 27626;
	SET @TATJANA := 27627;
	SET @SPELL_SHOOT := 48815;
	SET @SPELL_DART := 49134;
	SET @SPELL_PING := 49135;
	SET @SPELL_MOUNT_HORSE := 49138;
	DELETE FROM `creature` WHERE `guid` IN (118152,118160);
	DELETE FROM `creature_text` WHERE `entry` IN (@SASHA,@ANATOLY);
	INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
	(@SASHA,0,0,'I''m old enough to shoot beasts like you right between the eyes... at twice this distance.',12,0,100,0,0,0,'Sasha'),
	(@SASHA,1,0,'Don''t you dare talk about my father, monster. He was twice the man you''ll ever be.',12,0,100,0,0,0,'Sasha'),
	(@SASHA,2,0,'I''d rather be dead than be one of you! You think you''re still human? You''re... animals!',12,0,100,0,0,0,'Sasha'),
	(@SASHA,3,0,'Surprise, you scum!  You''re going to tell me where my sister is or I''ll put a bucketful of truesilver bullets through your wife''s heart.',12,0,100,0,0,0,'Sasha'),
	(@SASHA,4,0,'Where is Anya?',12,0,100,0,0,0,'Sasha'),
	(@SASHA,5,0,'There is one last thing.  I need to know where Arugal is.',12,0,100,0,0,0,'Sasha'),
	(@ANATOLY,0,0,'How old are you, lass?',12,0,100,0,0,0,'Anatoly'),
	(@ANATOLY,1,0,'You won''t get away with this, you know? You''re just a kid.',12,0,100,0,0,0,'Anatoly'),
	(@ANATOLY,2,0,'Your father was weak, Sasha... he didn''t have the guts to do what had to be done.',12,0,100,0,0,0,'Anatoly'),
	(@ANATOLY,3,0,'We''ll all end up serving the Lich King, kid. Better this way than becoming a rotten corpse.',12,0,100,0,0,0,'Anatoly'),
	(@ANATOLY,4,0,'Stop!  Do not shoot!  Do not hurt Tatjana!',12,0,100,0,0,0,'Anatoly'),
	(@ANATOLY,5,0,'The brat''s held prisoner in the wolf den on the other side of the mountain.  She was to be taken to Arugal.  Are we free to go now?',12,0,100,0,0,0,'Anatoly'),
	(@ANATOLY,6,0,'Forgive me, Tatjana... ',12,0,100,0,0,0,'Anatoly'),
	(@ANATOLY,7,0,'Nothing you can do can compare to what Arugal can do to us!  I will tear you apart myself!',12,0,100,0,0,0,'Anatoly');
	DELETE FROM `vehicle_template_accessory` WHERE `entry`=@HORSE;
	INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`,`summontimer`) VALUES
	(@HORSE,@TATJANA,0,0,'Tatjana''s Horse',8,30000);
	DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@HORSE;
	INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
	(@HORSE,@SPELL_MOUNT_HORSE,1,0);
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (@SPELL_DART,@SPELL_PING);
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=@SPELL_SHOOT;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
	(17,0,@SPELL_SHOOT,0,0,31,0,3,@ANATOLY,0,0,0,'','Spell Shoot targets Anatoly'),
	(13,1,@SPELL_DART,0,0,31,0,3,@TATJANA,0,0,0,'','Spell Tranquilizer Dart targets Tatjana'),
	(13,1,@SPELL_PING,0,0,31,0,3,@HORSE,0,0,0,'','Spell Tatjana Ping effect0 targets Tatjana''s Horse');
	UPDATE `creature` SET `spawntimesecs`=60 WHERE `id`=@ANATOLY;
	UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@SASHA,@ANATOLY,@TATJANA);
	
	UPDATE `creature_template` SET `speed_run`=1.28571, `AIName`='SmartAI' WHERE `entry`=@HORSE;
	DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@SASHA,@ANATOLY,@HORSE,@TATJANA) AND `source_type`=0;
	DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@SASHA*100,@ANATOLY*100,@ANATOLY*100+1,@ANATOLY*100+2,@ANATOLY*100+3,@ANATOLY*100+4,@HORSE*100) AND `source_type`=9;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@SASHA,0,0,3,38,1,100,0,0,1,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha - On data set 0 1 (phase 1) - Say line'),
	(@SASHA,0,1,3,38,1,100,0,0,2,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha - On data set 0 2 (phase 1) - Say line'),
	(@SASHA,0,2,3,38,1,100,0,0,3,0,0,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha - On data set 0 3 (phase 1) - Say line'),
	(@SASHA,0,3,0,61,1,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha - Linked with events 0,1,2 (phase 1) - Set data 0 0'),
	(@SASHA,0,4,5,38,0,100,0,0,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha - On data set 0 4 - Set event phase 0'),
	(@SASHA,0,5,0,61,0,100,0,0,0,0,0,80,@SASHA*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha - On data set 0 4 - Run script'),
	(@SASHA,0,6,0,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha - On reset - Set event phase 1'),
	(@ANATOLY,0,0,0,1,1,100,0,10000,20000,45000,60000,87,@ANATOLY*100+1,@ANATOLY*100+2,@ANATOLY*100+3,@ANATOLY*100+4,0,0,1,0,0,0,0,0,0,0,'Anatoly - On update OOC (phase 1) - Run random script'),
	(@ANATOLY,0,1,2,38,0,100,0,0,1,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On data set 0 1 - Set event phase 0'),
	(@ANATOLY,0,2,3,61,0,100,0,0,1,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On data set 0 1 - Set run'),
	(@ANATOLY,0,3,0,61,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,4057.442,-4140.824,211.1911,0,'Anatoly - On data set 0 1 - Move to position'),
	(@ANATOLY,0,4,5,34,0,100,0,0,1,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On movement inform - Set unit_field_bytes1 (kneel)'),
	(@ANATOLY,0,5,0,61,0,100,0,0,0,0,0,80,@ANATOLY*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On movement inform - Run script'),
	(@ANATOLY,0,6,0,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly - On reset - Set event phase 1'),
	(@HORSE,0,0,0,11,0,100,0,0,0,0,0,28,@SPELL_MOUNT_HORSE,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spawn - Remove aura Mount Tatjana''s Horse'),
	(@HORSE,0,1,2,8,0,100,0,@SPELL_PING,0,0,0,2,1812,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spellhit Tatjana Ping - Set faction'),
	(@HORSE,0,2,3,61,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spellhit Tatjana Ping - Stop autoattack'),
	(@HORSE,0,3,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spellhit Tatjana Ping - Set eventphase 1'),
	(@HORSE,0,4,0,8,1,100,0,@SPELL_MOUNT_HORSE,0,0,0,80,@HORSE*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On spellhit Mount Tatjana''s Horse (phase 1) - Run script'),
	(@HORSE,0,5,6,40,0,100,0,19,0,0,0,28,@SPELL_MOUNT_HORSE,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On WP 19 reached - Remove aura Mount Tatjana''s Horse'),
	(@HORSE,0,6,7,61,0,100,0,0,0,0,0,15,12330,0,0,0,0,0,21,2,0,0,0,0,0,0,'Tatjana''s Horse - On WP 19 reached - Quest credit'),
	(@HORSE,0,7,8,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,9,@ANATOLY,0,30,0,0,0,0,'Tatjana''s Horse - On WP 19 reached - Set data 0 1'),
	(@HORSE,0,8,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse - On WP 19 reached - Despawn'),
	(@TATJANA,0,0,0,11,0,100,0,0,0,0,0,11,43671,0,0,0,0,0,9,@HORSE,0,5,0,0,0,0,'Tatjana - On respawn - Spellcast Ride Vehicle'),
	(@TATJANA,0,1,2,8,0,100,0,@SPELL_DART,0,0,0,11,@SPELL_PING,2,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana - On spellhit Tranquilizer Dart - Spellcast Tatjana Ping'),
	(@TATJANA,0,2,3,61,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana - On spellhit Tranquilizer Dart - Set faction'),
	(@TATJANA,0,3,0,61,0,100,0,0,0,0,0,18,33024,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana - On spellhit Tranquilizer Dart - Set unit_flags'),
	(@TATJANA,0,4,0,0,0,100,0,2000,6000,9000,12000,11,32009,0,0,0,0,0,2,0,0,0,0,0,0,0,'Tatjana - On update IC - Spellcast Cutdown'),
	(@TATJANA,0,5,0,38,0,100,0,0,1,0,0,41,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana - On data set 0 1 - Despawn after 15 seconds'),
	(@SASHA*100,9,0,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha script - Say line'),
	(@SASHA*100,9,1,0,0,0,100,0,17000,17000,0,0,1,4,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha script - Say line'),
	(@SASHA*100,9,2,0,0,0,100,0,16700,16700,0,0,1,5,0,0,0,0,0,7,0,0,0,0,0,0,0,'Sasha script - Say line'),
	(@SASHA*100,9,3,0,0,0,100,0,10700,10700,0,0,11,@SPELL_SHOOT,0,0,0,0,0,9,@ANATOLY,0,30,0,0,0,0,'Sasha script - Say line'),
	(@SASHA*100,9,4,0,0,0,100,0,60000,60000,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha script - Set event phase 1'),
	(@SASHA*100,9,5,0,0,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sasha script - Set data 0 0'),
	(@ANATOLY*100,9,0,0,0,0,100,0,2400,2400,0,0,45,0,4,0,0,0,0,9,@SASHA,0,30,0,0,0,0,'Anatoly script 0 - Set data 0 4'),
	(@ANATOLY*100,9,1,0,0,0,100,0,5000,5000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Say line'),
	(@ANATOLY*100,9,2,0,0,0,100,0,16800,16800,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Say line'),
	(@ANATOLY*100,9,3,0,0,0,100,0,16800,16800,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Say line'),
	(@ANATOLY*100,9,4,0,0,0,100,0,5000,5000,0,0,11,47457,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Spellcast Worgen Transform - Male'),
	(@ANATOLY*100,9,5,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Reset unit_field_bytes1'),
	(@ANATOLY*100,9,6,0,0,0,100,0,500,500,0,0,5,53,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Play emote'),
	(@ANATOLY*100,9,7,0,0,0,100,0,150,150,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Say line'),
	(@ANATOLY*100,9,8,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,9,@TATJANA,0,10,0,0,0,0,'Anatoly script 0 - Set data 0 1'),
	(@ANATOLY*100,9,9,0,0,0,100,0,1200,1200,0,0,69,0,0,0,0,0,0,8,0,0,0,4069.991,-4130.805,211.464,0,'Anatoly script 0 - Move to position'),
	(@ANATOLY*100,9,10,0,0,0,100,0,15000,15000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 0 - Despawn'),
	(@ANATOLY*100+1,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 1 - Say line'),
	(@ANATOLY*100+1,9,1,0,0,0,100,0,2000,2000,0,0,45,0,1,0,0,0,0,9,@SASHA,0,20,0,0,0,0,'Anatoly script 1 - Set data 0 1'),
	(@ANATOLY*100+2,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 2 - Say line'),
	(@ANATOLY*100+2,9,1,0,0,0,100,0,3500,3500,0,0,45,0,1,0,0,0,0,9,@SASHA,0,20,0,0,0,0,'Anatoly script 2 - Set data 0 1'),
	(@ANATOLY*100+3,9,0,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 3 - Say line'),
	(@ANATOLY*100+3,9,1,0,0,0,100,0,5000,5000,0,0,45,0,2,0,0,0,0,9,@SASHA,0,20,0,0,0,0,'Anatoly script 3 - Set data 0 1'),
	(@ANATOLY*100+4,9,0,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Anatoly script 4 - Say line'),
	(@ANATOLY*100+4,9,1,0,0,0,100,0,5000,5000,0,0,45,0,3,0,0,0,0,9,@SASHA,0,20,0,0,0,0,'Anatoly script 4 - Set data 0 1'),
	(@HORSE*100,9,0,0,0,0,100,0,500,500,0,0,53,1,@HORSE,0,0,0,0,1,0,0,0,0,0,0,0,'Tatjana''s Horse script - Start WP movement');
	
	
	-- Tatjana SAI
	SET @ENTRY := 27627;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,43671,0,0,0,0,0,9,27626,0,5,0,0,0,0,"Tatjana - On Respawn - Cast 'Ride Vehicle'"),
	(@ENTRY,0,1,2,8,0,100,0,49134,0,0,0,11,49135,2,0,0,0,0,1,0,0,0,0,0,0,0,"Tatjana - On Spellhit 'Tranquilizer Dart' - Cast 'Tatjana Ping'"),
	(@ENTRY,0,2,3,61,0,100,0,49134,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tatjana - On Spellhit 'Tranquilizer Dart' - Set Faction 35"),
	(@ENTRY,0,3,5,61,0,100,0,49134,0,0,0,18,33024,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tatjana - On Spellhit 'Tranquilizer Dart' - Set Flag Immune To Players"),
	(@ENTRY,0,4,0,0,0,100,0,2000,6000,9000,12000,11,32009,0,0,0,0,0,2,0,0,0,0,0,0,0,"Tatjana - In Combat - Cast 'Cutdown'"),
	(@ENTRY,0,5,0,61,0,100,0,49134,0,0,0,41,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tatjana - On Spellhit 'Tranquilizer Dart' - Despawn In 15000 ms");
	
	
	UPDATE creature_template SET npcflag=16777216 WHERE entry=27626;
	
	
	UPDATE creature_template SET faction=188, flags_extra=2 WHERE entry IN (27626, 27627);
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\auto completed quests.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	
	-- Banshee's Revente
	UPDATE quest_template SET Method=0 WHERE id IN(13142);
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Chasing Icestorm Thelzans Phylactery.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Quest 12467: Chasing Icestorm: Thel'zan's Phylactery
	-- Icestorm SAI
	SET @ENTRY  := 26287;
	SET @SPELL1 := 47425; -- Frost Breath
	SET @SPELL2 := 49695; -- Summon Thel'zan's Phylactery
	
	UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
	
	DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@ENTRY*100;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,1,11,0,100,0,0,0,0,0,3,0,24165,0,0,0,0,1,0,0,0,0,0,0,0,'Icestorm - Just created - set model'),
	(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Icestorm - Just created - turn fly on'), 
	(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,53,1,@ENTRY*100,0,0,0,0,1,0,0,0,0,0,0,0,'Icestorm - Just created - load path'),
	(@ENTRY,0,3,0,0,0,100,0,1000,3000,3000,5000,11,@SPELL1,0,0,0,0,0,5,0,0,0,0,0,0,0,'Icestorm - Combat - Cast Frost Breath'),
	(@ENTRY,0,4,11,6,0,100,0,0,0,0,0,11,@SPELL2,3,0,0,0,0,1,0,0,0,0,0,0,0,'Icestorm - On death - Cast Summon Thel''zan''s Phylactery'),
	(@ENTRY,0,5,6,4,0,100,0,0,0,0,0,45,0,1,0,0,0,0,11,27843,100,0,0,0,0,0,'Wyrmbait - reach waypoint path 1 wp 5 - set data'),
	(@ENTRY,0,6,7,61,0,100,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - reach waypoint path 1 wp 5 - Run Script'),
	(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,80,@ENTRY*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - reach waypoint path 1 wp 5 - Run Script'),
	(@ENTRY,0,8,0,4,0,100,0,0,0,0,0,91,50331648,0,0,0,0,0,1,0,0,0,0,0,0,0,'Icestorm - Just created - turn fly on'),
	(@ENTRY,0,9,0,40,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Icestorm - On WP - Set Home Position'),
	(@ENTRY,0,10,0,40,0,100,0,5,@ENTRY*100,0,0,1,0,0,0,0,0,0,19,27844,0,0,0,0,0,0,'Wyrmbait - reach waypoint path 1 wp 5 - Say'),
	(@ENTRY,0,11,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Icestorm - On Death - Say'),
	(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - reach waypoint path 2 wp 1 - turn fly off'),
	(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,53,0,@ENTRY*100+1,2,0,0,0,1,0,0,0,0,0,0,0,'Icestorm - script - load path');
	
	-- waypoints for Icestorm
	DELETE FROM `waypoints` WHERE `entry` IN (@ENTRY*100,@ENTRY*100+1); 
	INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
	(@ENTRY*100,5,4543.821,45.72195,104.5742, 'Icestorm'),
	(@ENTRY*100,4,4551.378,94.04321,127.0742, 'Icestorm'),
	(@ENTRY*100,3,4561.495,200.4222,139.8242, 'Icestorm'),
	(@ENTRY*100,2,4560.903,224.9135,135.4687, 'Icestorm'),
	(@ENTRY*100,1,4561.007,225.9081,135.4687, 'Icestorm'),
	(@ENTRY*100+1,1,4543.458,46.66932,82.14817, 'Icestorm');
	
	-- Update Model info for Icestorm
	UPDATE `creature_model_info` SET `bounding_radius`=1.5,`combat_reach`=7.5 WHERE `modelid`=16919;
	
	DELETE FROM `creature_model_info` WHERE `modelid`=24165;
	INSERT INTO `creature_model_info` (`modelid`,`bounding_radius`,`combat_reach`,`gender`) VALUES
	(24165,1.5,7.5,2);
	
	-- Add creature_template_addon for Icestorm
	DELETE FROM `creature_template_addon` WHERE `entry`=26287;
	INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`) VALUES (26287,50331648,1);
	
	-- 7th Legion Harpoon Gun SAI
	SET @ENTRY  := 27839;
	SET @SPELL1 := 49679; -- Harpoon Chain
	SET @SPELL2 := 49682; -- Harpoon Chain
	SET @SPELL3 := 49683; -- Harpoon Chain
	SET @SPELL4 := 49684; -- Harpoon Chain
	
	UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
	
	DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,1,1,100,0,2000,2000,2000,2000,11,@SPELL1,0,0,0,0,0,11,26287,100,0,0,0,0,0,'7th Legion Harpoon Gun - OOC - Cast spell (phase 1)'),
	(@ENTRY,0,1,0,38,0,100,0,0,1,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'7th Legion Harpoon Gun - on dataset 0 1 - set phase 1');
	
	-- Spell Conditions
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (49679,49682,49683,49684);
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
	(13,1,49679,0,31,3,26287,0,0,'','Spell 49679 can only target Icestorm'),
	(13,1,49682,0,31,3,26287,0,0,'','Spell 49682 can only target Icestorm'),
	(13,1,49683,0,31,3,26287,0,0,'','Spell 49683 can only target Icestorm'),
	(13,1,49684,0,31,3,26287,0,0,'','Spell 49684 can only target Icestorm');
	
	-- Gossip option
	DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9603);
	INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES 
	(9603, 0, 0, 'Wyrmbait, eh? Welp, go fetch us Icestorm!', 27137, 1, 1, 0, 0, 0, 0, '', 0);
	
	-- Conditions for the gossip options
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (9603);
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`comment`) VALUES
	(15,9603,0,0,9,12467,'Gossip option 0 requires quest 12467 active');
	
	-- Wyrmbait SAI
	SET @ENTRY  := 27843;
	SET @SPELL1 := 15620; -- Shoot
	
	UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
	
	DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY AND `id`>13;
	DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@ENTRY*100,@ENTRY*100+1);
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,14,0,62,0,100,0,9603,0,0,0,80,@ENTRY*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - gossip option select - Run Script'),
	(@ENTRY,0,15,0,0,0,100,1,0,0,0,0,39,100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - combat - call for help'),
	(@ENTRY,0,17,0,7,0,100,0,0,0,0,0,81,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - on reset - add npcflag'),
	(@ENTRY,0,18,0,40,0,100,0,5,@ENTRY*100,0,0,12,26287,6,14000,0,1,0,8,0,0,0,4561.007,225.9081,135.4687,4.939622,'Wyrmbait - reach waypoint path 0 wp 4 - spawn Icestorm'),
	(@ENTRY,0,19,0,40,0,100,0,8,@ENTRY*100,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - reach waypoint path 1 wp 4 - turn fly off'),
	(@ENTRY,0,20,0,40,0,100,0,9,@ENTRY*100,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.67552,'Wyrmbait - reach waypoint path 1 wp 9 - turn to'),
	(@ENTRY,0,21,0,38,0,100,0,0,1,0,0,80,@ENTRY*100+1,2,0,0,0,0,1,0,0,0,0,0,0,0,'7th Legion Harpoon Gun - on dataset 0 1 - run script'),
	(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Wyrmbait - script - close gossip'),
	(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,18,33280,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - script - set unit flags'),
	(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - script - remove npc flag'),
	(@ENTRY*100,9,3,0,0,0,100,0,500,500,0,0,5,66,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - script - emote'),
	(@ENTRY*100,9,4,0,0,0,100,0,4000,4000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - script - say 0'),
	(@ENTRY*100,9,5,0,0,0,100,0,5000,5000,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - script - turn fly on'),
	(@ENTRY*100,9,6,0,0,0,100,0,0,0,0,0,53,1,@ENTRY*100,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - script - load path'),
	(@ENTRY*100,9,7,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,11,27839,100,0,0,0,0,0,'Wyrmbait - script - set data on 7th Legion Harpoon Gun'),
	(@ENTRY*100+1,9,0,0,0,0,100,0,0,0,0,0,18,32768,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - script - set unit flags'),
	(@ENTRY*100+1,9,1,0,0,0,100,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - script - set unit flags'),
	(@ENTRY*100+1,9,2,0,0,0,100,0,0,0,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - script - Dismount'),
	(@ENTRY*100+1,9,3,0,0,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wyrmbait - script - Set Agressive'),
	(@ENTRY*100+1,9,6,0,0,0,100,0,0,0,0,0,49,0,0,0,0,0,0,11,26287,100,0,0,0,0,0,'Wyrmbait - script - attack start');
	
	-- waypoints for Wyrmbait
	DELETE FROM `waypoints` WHERE `entry` IN (@ENTRY*100,@ENTRY*100+1,@ENTRY*100+2); 
	INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
	(@ENTRY*100,1,4534.954,32.78271,88.17386, 'Wyrmbait'),
	(@ENTRY*100,2,4537.267,76.02501,97.88784, 'Wyrmbait'),
	(@ENTRY*100,3,4544.147,147.8844,108.8601, 'Wyrmbait'),
	(@ENTRY*100,4,4549.169,196.2009,121.7767, 'Wyrmbait'),
	(@ENTRY*100,5,4568.908,150.4734,113.5349, 'Wyrmbait'),
	(@ENTRY*100,6,4552.6,67.66856,92.95158, 'Wyrmbait'),
	(@ENTRY*100,7,4541.015,34.2519,88.31277, 'Wyrmbait'),
	(@ENTRY*100,8,4548.401,3.602159,71.40673, 'Wyrmbait'),
	(@ENTRY*100,9,4548.401,3.60216,70.40673, 'Wyrmbait'),
	(@ENTRY*100+1,1,4545.04,34.41992,80.48003, 'Wyrmbait');
	
	DELETE FROM `creature_text` WHERE `entry`IN(27843,27844,26287);
	INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES 
	(26287, 0, 0, 'Thel\'zan\'s phylactery drops to the ground beneath Icestorm', 41, 0, 100, 0, 0, 0, 'Icestorm', 27125),
	(27843, 0, 0, 'I\'ll flush her out, $N! You just be ready for her when she comes in!', 12, 0, 100, 1, 0, 0, 'Wyrmbait', 27120),
	(27844, 0, 0, 'FIRE! FIRE! BRING HER DOWN!', 14, 0, 100, 0, 0, 0, 'Legion Commander Tyralion', 27123);
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Corrosion prevention.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Just scriptname for the Zeppeling power core.
	
	UPDATE creature_template SET AIName="", Scriptname="npc_zeppeling_power_core" WHERE entry=23832;
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Counterattack.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	UPDATE `creature_template` SET `gossip_menu_id`=1882 WHERE  `entry`=3389;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=3389 AND  `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
	(3389, 0, 1, 0, 11, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - On Spawn  - Set Phase 1 '),
	(3389, 0, 2, 3, 19, 1, 100, 0, 4021, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - On quest accept  - say text 0 '),
	(3389, 0, 3, 4, 61, 1, 100, 0, 0, 0, 0, 0, 80, 338900, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Linked with Previous Event -  Run script'),
	(3389, 0, 4, 0, 61, 1, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Linked with Previous Event -  Set Phase 2'),
	(3389, 0, 5, 0, 1, 0, 100, 0, 300000, 300000, 300000, 300000, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - OOC (P2)  - Set Phase 1 '),
	(3389, 0, 6, 0, 20, 0, 100, 0, 4021, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - On quest Reward  - Set Phase 1 '),
	(3389, 0, 7, 8, 62, 1, 100, 0, 1882, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - On Gossip Option Select  - say text 0 '),
	(3389, 0, 8, 9, 61, 1, 100, 0, 0, 0, 0, 0, 80, 338900, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Linked with Previous Event -  Run script'),
	(3389, 0, 9, 0, 61, 1, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Linked with Previous Event -  Set Phase 2'),
	(3389, 0, 10, 0, 62, 0, 100, 0, 1882, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - On Gossip Option Select  - Close Gossip ');
	
	DELETE FROM `gossip_menu` WHERE `entry`=1882;
	INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
	(1882, 2533);
	
	DELETE FROM `gossip_menu_option` WHERE `menu_id`=1882;
	INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES 
	(1882, 0, 0, 'Where is Warlord Krom''zar?', 4793, 1, 1, 0, 0, 0, 0, '', 0);
	
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=1882;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
	(15, 1882, 0, 0, 0, 9, 0, 4021, 0, 0, 0, 0, 0, '', 'Regthar Deathgate show gossip only if player on counterattack');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Curing the sick.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Sickly Gazelle SAI
	SET @ENTRY := 12296;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,8,0,100,0,19512,0,0,0,33,12297,0,0,0,0,0,7,0,0,0,0,0,0,0,"Sickly Gazelle - On Spellhit 'Apply Salve' - Quest Credit 'Curing the Sick'");
	
	
	
	-- Sicked Deer SAI
	SET @ENTRY := 12298;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,8,0,100,0,19512,0,0,0,33,12299,0,0,0,0,0,7,0,0,0,0,0,0,0,"Cured Deer - On Spellhit 'Apply Salve' - Quest Credit 'Curing the Sick'");
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Dark Hearth.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Edana Hatetalon SAI
	SET @ENTRY := 8075;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,35,0,0,0,0,0,0,"Edana Hatetalon - On Respawn - Start Attacking");
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Divination Gorefiends Truncheon.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	--
	UPDATE `smart_scripts` SET `event_type`=25, `event_flags`=0 WHERE `entryorguid` IN (21784,21815, 21801) AND `source_type`=0 AND `id`=0;
	
	DELETE FROM `creature_formations` WHERE `leaderGUID`=76082;
	INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
	(76082,76082,0,0,2),
	(76082,76083,7,360,2),
	(76082,76084,14,360,2),
	(76082,76085,21,360,2);
	
	UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `guid` IN (76083, 76084, 76085);
	UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (76082);
	DELETE FROM `creature_addon` WHERE `guid` IN (76082);
	INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes1`,`bytes2`, `emote`, `auras`) VALUES
	(76082,760820,16777216,4097,0,"");
	DELETE FROM `creature` WHERE `id`=21998; -- wrong spawn, must be summoned by quest item only
	
	DELETE FROM `waypoint_data` WHERE (`id`=760820);
	INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
	(760820, 1, -3116.419922, 821.828979, -21.856766, 0, 0, 1, 0, 100, 0),
	(760820, 2, -3127.299561, 795.134766, -22.401117, 0, 0, 1, 0, 100, 0),
	(760820, 3, -3150.103027, 782.489380, -21.864737, 0, 0, 1, 0, 100, 0),
	(760820, 4, -3219.880615, 780.314880, -19.754417, 0, 0, 1, 0, 100, 0),
	(760820, 5, -3251.568604, 783.067688, -19.069899, 0, 0, 1, 0, 100, 0),
	(760820, 6, -3295.924072, 767.111877, -21.192102, 0, 0, 1, 0, 100, 0),
	(760820, 7, -3403.222656, 752.732056, -35.531361, 0, 0, 1, 0, 100, 0),
	(760820, 8, -3617.548828, 732.945862, -8.339263, 0, 0, 1, 0, 100, 0),
	(760820, 9, -3631.188965, 727.337463, -5.722647, 0, 0, 1, 0, 100, 0),
	(760820, 10, -3733.907471, 751.174744, 7.209823, 0, 0, 1, 0, 100, 0),
	(760820, 11, -3782.882813, 746.945984, 9.761057, 0, 0, 1, 0, 100, 0),
	(760820, 12, -3859.570068, 752.093506, 10.382468, 0, 0, 1, 0, 100, 0),
	(760820, 13, -3879.040283, 773.671936, 9.449715, 0, 0, 1, 0, 100, 0),
	(760820, 14, -3888.581787, 854.766663, 15.828053, 0, 0, 1, 0, 100, 0),
	(760820, 15, -3880.752930, 897.569763, 19.081347, 0, 0, 1, 0, 100, 0),
	(760820, 16, -3886.515137, 944.770691, 21.956785, 0, 0, 1, 0, 100, 0),
	(760820, 17, -3880.704834, 985.264221, 23.311592, 0, 0, 1, 0, 100, 0),
	(760820, 18, -3883.812012, 1007.772705, 23.589699, 0, 0, 1, 0, 100, 0),
	(760820, 19, -3975.737061, 1099.026733, 30.213566, 0, 0, 1, 0, 100, 0),
	(760820, 20, -4000.627197, 1143.911499, 41.125046, 0, 0, 1, 0, 100, 0),
	(760820, 21, -4036.700928, 1163.023804, 51.072033, 0, 0, 1, 0, 100, 0),
	(760820, 22, -4052.043457, 1183.807129, 57.569439, 0, 0, 1, 0, 100, 0),
	(760820, 23, -4053.111816, 1202.003784, 62.920666, 0, 0, 1, 0, 100, 0),
	(760820, 24, -4037.213623, 1261.900757, 78.336632, 0, 0, 1, 0, 100, 0),
	(760820, 25, -4038.152588, 1296.390991, 83.919540, 0, 0, 1, 0, 100, 0),
	(760820, 26, -4053.791504, 1370.539185, 84.908981, 0, 0, 1, 0, 100, 0),
	(760820, 27, -4054.700439, 1618.686279, 93.997330, 0, 0, 1, 0, 100, 0),
	(760820, 28, -4045.018799, 1643.987061, 94.251122, 0, 0, 1, 0, 100, 0),
	(760820, 29, -3983.812988, 1705.642944, 97.803833, 0, 0, 1, 0, 100, 0),
	(760820, 30, -3938.369141, 1738.914917, 98.837524, 0, 0, 1, 0, 100, 0),
	(760820, 31, -3900.309814, 1758.672363, 97.922089, 0, 0, 1, 0, 100, 0),
	(760820, 32, -3867.449707, 1786.059937, 94.361740, 0, 0, 1, 0, 100, 0),
	(760820, 33, -3850.530273, 1826.876221, 90.358040, 0, 0, 1, 0, 100, 0),
	(760820, 34, -3847.338867, 1880.751831, 86.640762, 0, 0, 1, 0, 100, 0),
	(760820, 35, -3814.812988, 1960.993286, 85.844566, 0, 0, 1, 0, 100, 0),
	(760820, 36, -3756.163574, 2030.727905, 84.516495, 0, 0, 1, 0, 100, 0),
	(760820, 37, -3752.126221, 2094.629395, 78.208092, 0, 0, 1, 0, 100, 0),
	(760820, 38, -3755.360352, 2146.251221, 75.892380, 0, 0, 1, 0, 100, 0),
	(760820, 39, -3743.547119, 2204.366699, 76.086136, 0, 0, 1, 0, 100, 0),
	(760820, 40, -3744.448975, 2262.760742, 76.763046, 0, 0, 1, 0, 100, 0),
	(760820, 41, -3714.628662, 2328.074219, 76.275826, 0, 0, 1, 0, 100, 0),
	(760820, 42, -3688.062256, 2347.847168, 76.348412, 0, 0, 1, 0, 100, 0),
	(760820, 43, -3674.596680, 2318.612061, 75.835876, 0, 0, 1, 0, 100, 0),
	(760820, 44, -3624.145264, 2310.810791, 74.901398, 0, 0, 1, 0, 100, 0),
	(760820, 45, -3596.897217, 2321.221191, 73.494583, 0, 0, 1, 0, 100, 0),
	(760820, 46, -3570.569824, 2315.111572, 71.091606, 0, 0, 1, 0, 100, 0),
	(760820, 47, -3505.514648, 2275.580811, 66.201355, 0, 0, 1, 0, 100, 0),
	(760820, 48, -3444.574219, 2289.437500, 63.707752, 0, 0, 1, 0, 100, 0),
	(760820, 49, -3402.431396, 2291.413818, 62.819668, 0, 0, 1, 0, 100, 0),
	(760820, 50, -3344.245605, 2280.061523, 61.217396, 0, 0, 1, 0, 100, 0),
	(760820, 51, -3266.743164, 2283.391113, 60.007225, 0, 0, 1, 0, 100, 0),
	(760820, 52, -3233.561279, 2292.924561, 59.882648, 0, 0, 1, 0, 100, 0),
	(760820, 53, -3221.570313, 2250.202393, 61.123081, 0, 0, 1, 0, 100, 0),
	(760820, 54, -3189.590088, 2199.339844, 64.705276, 0, 0, 1, 0, 100, 0),
	(760820, 55, -3175.489502, 2098.237549, 75.678909, 0, 0, 1, 0, 100, 0),
	(760820, 56, -3160.424316, 2081.004150, 80.764908, 0, 0, 1, 0, 100, 0),
	(760820, 57, -3141.073242, 2027.865112, 92.255219, 0, 0, 1, 0, 100, 0),
	(760820, 58, -3100.545654, 1987.315796, 100.928787, 0, 0, 1, 0, 100, 0),
	(760820, 59, -3079.955811, 1952.478638, 109.271744, 0, 0, 1, 0, 100, 0),
	(760820, 60, -3043.312744, 1921.660156, 112.361816, 0, 0, 1, 0, 100, 0),
	(760820, 61, -2973.852539, 1910.639648, 104.475471, 0, 0, 1, 0, 100, 0),
	(760820, 62, -2956.038086, 1893.901855, 99.170197, 0, 0, 1, 0, 100, 0),
	(760820, 63, -2950.733643, 1858.555664, 88.703011, 0, 0, 1, 0, 100, 0),
	(760820, 64, -2923.169678, 1824.131348, 70.827278, 0, 0, 1, 0, 100, 0),
	(760820, 65, -2889.111816, 1758.524658, 47.417206, 0, 0, 1, 0, 100, 0),
	(760820, 66, -2879.456299, 1722.608887, 39.589905, 0, 0, 1, 0, 100, 0),
	(760820, 67, -2865.740723, 1710.794922, 36.381069, 0, 0, 1, 0, 100, 0),
	(760820, 68, -2848.158691, 1707.713623, 32.244236, 0, 0, 1, 0, 100, 0),
	(760820, 69, -2824.067383, 1685.606934, 23.045313, 0, 0, 1, 0, 100, 0),
	(760820, 70, -2819.241943, 1641.792847, 13.334887, 0, 0, 1, 0, 100, 0),
	(760820, 71, -2871.091064, 1569.277466, 15.303233, 0, 0, 1, 0, 100, 0),
	(760820, 72, -2893.539063, 1492.087402, 14.836093, 0, 0, 1, 0, 100, 0),
	(760820, 73, -2981.375000, 1436.377686, 11.891064, 0, 0, 1, 0, 100, 0),
	(760820, 74, -2987.835693, 1401.822510, 11.926711, 0, 0, 1, 0, 100, 0),
	(760820, 75, -2988.486572, 1347.793457, 9.330483, 0, 0, 1, 0, 100, 0),
	(760820, 76, -3078.444580, 1254.076050, 10.399191, 0, 0, 1, 0, 100, 0),
	(760820, 77, -3090.341797, 1206.203125, 18.388882, 0, 0, 1, 0, 100, 0),
	(760820, 78, -3114.885986, 1174.320313, 25.699680, 0, 0, 1, 0, 100, 0),
	(760820, 79, -3112.093506, 1126.753174, 24.259985, 0, 0, 1, 0, 100, 0),
	(760820, 80, -3120.531982, 1096.862549, 19.402412, 0, 0, 1, 0, 100, 0),
	(760820, 81, -3113.394287, 1034.310425, 4.188662, 0, 0, 1, 0, 100, 0),
	(760820, 82, -3117.856445, 982.948914, -7.988031, 0, 0, 1, 0, 100, 0),
	(760820, 83, -3091.906494, 930.465881, -17.414244, 0, 0, 1, 0, 100, 0),
	(760820, 84, -3116.419922, 821.828979, -21.856766, 0, 0, 1, 0, 100, 0);
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Fallen Sisters.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Quest - The Fallen Sisters
	SET @ENTRY := 23678;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
	INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
	(@ENTRY,0,0,0,11,0,100,0,0,571,495,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chill Nymph - Respawn - reset faction'),
	(@ENTRY,0,1,0,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chill Nymph - Reset - set phase 1'),
	(@ENTRY,0,2,3,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chill Nymph - On health 30% - Do text emote'),
	(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chill Nymph - On health 30% - set phase 2'),
	(@ENTRY,0,4,0,0,0,75,0,2000,3000,2000,2000,11,9739,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Chill Nymph - In Combat - Cast Wrath on victim'),
	(@ENTRY,0,5,6,8,2,100,0,43340,0,30000,30000,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Chill Nymph - On Spell hit 43340 - Face invoker'),
	(@ENTRY,0,6,7,61,0,100,0,0,0,0,0,33,24117,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Chill Nymph - On Spell hit 43340 - Give Quest credit'),
	(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,80,2367800,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Chill Nymph - On Spell hit 43340 - Load script'),
	(@ENTRY,0,8,0,40,0,100,0,1,23678,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chill Nymph - On reach waypoint 1 - Despawn'),
	(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chill Nymph - Script 2 - Evade'),
	(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chill Nymph - Script 3 - Set faction 35'),
	(@ENTRY*100,9,2,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chill Nymph - Script 4 - Say text 1'),
	(@ENTRY*100,9,3,0,0,0,100,0,1000,1000,0,0,53,1,23678,0,0,0,0,1,0,0,0,0,0,0,0, 'Chill Nymph - Script 5 - Start waypoint movement');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Fel Reaver, no thanks!.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	SET @FELREAVER      :=22293; -- Inactive Fel Reaver
	SET @Q_FELREAVER    :=10855; -- Quest: Fel Reavers, No Thanks!
	SET @Q_NETHERGAS    :=10850; -- Quest: Nether Gas In a Fel Fire Engine
	UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `id`=@Q_FELREAVER;
	UPDATE `quest_template` SET `method`=2,prevquestid=0 WHERE `id`=@Q_NETHERGAS;
	-- revert old custom spell from spell_dbc
	UPDATE `spell_dbc` SET `Effect1`=0,`EffectMiscValue1`=0 WHERE `id`=38758;
	
	-- update wrong value which causes that you can not turn in Quest
	
	-- give Quest Credit by SAI
	UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@FELREAVER ;
	DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@FELREAVER ;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@FELREAVER ,0,0,0,20,0,100,0,@Q_NETHERGAS,0,0,0,33,@FELREAVER ,0,0,0,0,0,7,0,0,0,0,0,0,0,'Inactive Fel Reaver - On Quest Reward: Fel Reavers, No Thanks! - Give Quest Credit');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Freedom for all creatures.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	UPDATE `creature_template` SET `unit_flags`=0 WHERE  `entry`=7956;
	UPDATE creature_template SET speed_walk=0.6, speed_run=0.6 WHERE entry=7997;
	DELETE FROM `creature_addon` WHERE  `guid`=50005; -- removed because of bad interactionbehaviour while creature follows player
	UPDATE `creature` SET `spawntimesecs`=1 WHERE `guid`=50005;
	UPDATE `gameobject` SET `state`=1 WHERE `guid`=50029 and `id`=143979;
	
	-- Kindal Moonweaver SAI
	SET @ENTRY := 7956;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,1,19,0,100,0,2969,0,0,0,29,4,0,0,0,0,0,7,0,0,0,0,0,0,0,"Kindal Moonweaver - On Quest 'Freedom for All Creatures' Taken - Start Follow Invoker"),
	(@ENTRY,0,1,2,61,0,100,0,2969,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Quest 'Freedom for All Creatures' Taken - Remove Flag Standstate Kneel"),
	(@ENTRY,0,2,7,61,0,100,0,2969,0,0,0,2,774,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Quest 'Freedom for All Creatures' Taken - Set Faction 774"),
	(@ENTRY,0,3,0,4,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Aggro - Say Line 1"),
	(@ENTRY,0,4,0,38,0,100,0,1,1,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Data Set 1 1 - Increment Phase"),
	(@ENTRY,0,5,0,0,32,100,1,0,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - In Combat - Run Script (Phase 32) (No Repeat)"),
	(@ENTRY,0,6,0,1,32,100,1,0,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - Out of Combat - Run Script (Phase 32) (No Repeat)"),
	(@ENTRY,0,7,9,61,0,100,0,2969,0,0,0,41,360000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Quest 'Freedom for All Creatures' Taken - Despawn In 360000 ms"),
	(@ENTRY,0,8,0,11,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Respawn - Set Event Phase 0"),
	(@ENTRY,0,9,0,61,0,100,0,2969,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Quest 'Freedom for All Creatures' Taken - Say Line 0");
	
	-- Actionlist SAI
	SET @ENTRY := 795600;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Script - Say Line 2"),
	(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,15,2969,0,0,0,0,0,17,0,5000,0,0,0,0,0,"Kindal Moonweaver - On Script - Quest Credit 'Freedom for All Creatures'"),
	(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kindal Moonweaver - On Script - Despawn In 3000 ms");
	
	/* Script for the Door, it will start the event for the creatures */
	UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=143979;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=143979;
	INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
	(143979, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 80, 143979*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'bambus door - On activate - start script');
	-- Actionlist SAI
	SET @ENTRY := 14397900;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,9,7997,0,50,0,0,0,0,"On Script - Set Data 1 1");
	
	-- Captured Sprite Darter SAI 
	SET @ENTRY := 7997;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,38,0,100,0,1,1,0,0,88,@ENTRY*100+00,@ENTRY*100+01,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Sprite Darter - On Data Set 1 1 - Run Random Script"),
	(@ENTRY,0,1,2,40,0,100,0,13,7997,0,0,45,1,1,0,0,0,0,10,50005,7956,0,0,0,0,0,"Captured Sprite Darter - On Waypoint 13 Reached - Set Data 1 1"),
	(@ENTRY,0,2,0,61,0,100,0,13,7997,0,0,41,100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Sprite Darter - On Waypoint 13 Reached - Despawn In 100 ms"),
	(@ENTRY,0,3,0,11,0,100,0,0,0,0,0,2,534,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Sprite Darter - On Respawn - Set Faction 534");
	
	/* Call two different script for delayed waypoint-start */
	-- Actionlist SAI
	SET @ENTRY := 799700;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,53,1,7997,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Sprite Darter - On Script - Start Waypoint"),
	(@ENTRY,9,1,0,0,0,100,0,100,100,0,0,2,774,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Sprite Darter - On Script - Set Faction 774");
	
	-- Actionlist SAI
	SET @ENTRY := 799701;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,53,1,7997,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Start Waypoint"),
	(@ENTRY,9,1,0,0,0,100,0,100,100,0,0,2,774,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Sprite Darter - On Script - Set Faction 774");
	
	/* Texts for Kindal Moonweaver */
	DELETE FROM `creature_text` WHERE `entry`=7956;
	INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
	(7956, 0, 0, 'I\'am ready, when you are, $n. Lead the way!', 12, 0, 100, 0, 0, 0, 'Kindal Moonweaver'),
	(7956, 1, 0, 'Die, Grimtotem. Elune will not have you harm her creatures any longer!', 12, 0, 100, 0, 0, 0, 'Kindal Moonweaver'),
	(7956, 1, 1, 'You dare touch me?!', 12, 0, 100, 0, 0, 0, 'Kindal Moonweaver'),
	(7956, 1, 2, 'Death to you, Grimtotem. How dare you come within a bow\'s shot of me!', 12, 0, 100, 0, 0, 0, 'Kindal Moonweaver'),
	(7956, 2, 0, 'We\'ve done it! Meet me back by Jer\'kai above the Grim Totem camp.', 12, 0, 100, 0, 0, 0, 'Kindal Moonweaver');
	
	DELETE FROM `locales_creature_text` WHERE `entry`=7956;
	INSERT INTO `locales_creature_text` (`entry`, `groupid`, `id`, `text_loc3`) VALUES 
	(7956, 0, 0, 'Ich bin bereit, wenn Ihr es seid, $n. Geht vorraus!'),
	(7956, 1, 0, 'Sterbt, Grimmtotem. Elune möchte nicht länger, dass ihren Geschöpfen Schaden zugefügt wird!'),
	(7956, 1, 1, 'Ihr wagt es mich anzufassen?!'),
	(7956, 1, 2, 'Sterbt, Grimmtotem. Wie könnt Ihr es wagen mich anzugreifen!'),
	(7956, 2, 0, 'Wir haben es geschafft! Trefft mich bei Jer\'kai über dem Camp wieder.');
	
	/* Waypoints for Captured Sprite Darter */
	DELETE FROM `waypoints` WHERE `entry`=7997;
	INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
	(7997, 1, -4532.19, 807.833, 59.9749, 'Captured Sprite Darter'),
	(7997, 2, -4526.04, 799.328, 59.4271, 'Captured Sprite Darter'),
	(7997, 3, -4518.87, 786.24, 59.9261, 'Captured Sprite Darter'),
	(7997, 4, -4516.6, 766.617, 60.6654, 'Captured Sprite Darter'),
	(7997, 5, -4516.79, 749.124, 60.4805, 'Captured Sprite Darter'),
	(7997, 6, -4517.52, 731.643, 60.9822, 'Captured Sprite Darter'),
	(7997, 7, -4522.3, 710.707, 60.8061, 'Captured Sprite Darter'),
	(7997, 8, -4530.08, 695.036, 60.6917, 'Captured Sprite Darter'),
	(7997, 9, -4537.26, 679.979, 60.5726, 'Captured Sprite Darter'),
	(7997, 10, -4541.54, 655.429, 58.551, 'Captured Sprite Darter'),
	(7997, 11, -4539.33, 649.443, 57.9488, 'Captured Sprite Darter'),
	(7997, 12, -4526.54, 639.678, 56.2069, 'Captured Sprite Darter'),
	(7997, 13, -4507.92, 627.417, 55.6034, 'Captured Sprite Darter');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Get Me Out of Here!.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- 
	-- Melizza Brimbuzzle SAI
	SET @ENTRY := 12277;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,1,19,0,100,0,6132,0,0,0,53,0,@ENTRY*100+00,0,0,0,1,1,0,0,0,0,0,0,0,"Melizza Brimbuzzle - On Quest 'Get Me Out of Here!' Taken - Start Waypoint"),
	(@ENTRY,0,1,12,61,0,100,0,6132,0,0,0,81,0,0,0,0,0,0,10,0,0,0,0,0,0,0,"Melizza Brimbuzzle - On Quest 'Get Me Out of Here!' Taken - Set Npc Flag "),
	(@ENTRY,0,2,0,40,0,100,0,3,@ENTRY*100+00,0,0,1,0,0,0,0,0,0,21,20,0,0,0,0,0,0,"Melizza Brimbuzzle - On Waypoint 3 Reached - Say Line 0"),
	(@ENTRY,0,3,4,40,0,100,0,58,@ENTRY*100+00,0,0,15,6132,0,0,0,0,0,17,0,30,0,0,0,0,0,"Melizza Brimbuzzle - On Waypoint 58 Reached - Quest Credit 'Get Me Out of Here!'"),
	(@ENTRY,0,4,5,61,0,100,0,58,@ENTRY*100+00,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Melizza Brimbuzzle - On Waypoint 58 Reached - Say Line 1"),
	(@ENTRY,0,5,6,61,0,100,0,58,@ENTRY*100+00,0,0,53,1,@ENTRY*100+01,0,0,0,0,1,0,0,0,0,0,0,0,"Melizza Brimbuzzle - On Waypoint 58 Reached - Start Waypoint"),
	(@ENTRY,0,6,0,61,0,100,0,58,@ENTRY*100+00,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Melizza Brimbuzzle - On Waypoint 58 Reached - Set Active On"),
	(@ENTRY,0,7,8,40,0,100,0,69,@ENTRY*100+01,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Melizza Brimbuzzle - On Waypoint 69 Reached - Pause Waypoint"),
	(@ENTRY,0,8,0,61,0,100,0,69,@ENTRY*100+01,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Melizza Brimbuzzle - On Waypoint 69 Reached - Run Script"),
	(@ENTRY,0,9,0,40,0,100,0,93,@ENTRY*100+01,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Melizza Brimbuzzle - On Waypoint 93 Reached - Despawn In 3000 ms"),
	(@ENTRY,0,10,13,11,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Melizza Brimbuzzle - On Respawn - Set Npc Flag Questgiver"),
	(@ENTRY,0,11,0,40,0,100,1,57,@ENTRY*100+00,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Melizza Brimbuzzle - On Waypoint 57 Reached - Run Script (No Repeat)"),
	(@ENTRY,0,12,0,61,0,100,0,6132,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,"Melizza Brimbuzzle - On Quest 'Get Me Out of Here!' Taken - Set Faction 250"),
	(@ENTRY,0,13,0,61,0,100,0,0,0,0,0,2,474,0,0,0,0,0,1,0,0,0,0,0,0,0,"Melizza Brimbuzzle - On Respawn - Set Faction 474");
	
	-- Actionlist SAI
	SET @ENTRY := 1227700;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,9,0,0,0,0,100,0,3000,3000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
	(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 3"),
	(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 4");
	
	-- Actionlist SAI
	SET @ENTRY := 1227701;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,4655,7,0,0,0,0,8,0,0,0,-1382.56,2417.06,88.9714,2.46091,"Melizza Brimbuzzle - On Script - Summon Creature 'Maraudine Wrangler'"),
	(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,4655,7,0,0,0,0,8,0,0,0,-1406.39,2423.48,88.5732,0.20944,"Melizza Brimbuzzle - On Script - Summon Creature 'Maraudine Wrangler'"),
	(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,12,4655,7,0,0,0,0,8,0,0,0,-1394.38,2417.12,88.7675,0.959931,"Melizza Brimbuzzle - On Script - Summon Creature 'Maraudine Wrangler'");
	
	DELETE FROM `creature_text` WHERE `entry`=12277;
	INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
	(12277, 0, 0, 'Thanks $n.  Now let''s get out of here!', 12, 0, 100, 0, 0, 0, 7540, 'Melizza Brimbuzzle'),
	(12277, 1, 0, 'We made it!  Thanks again!  I''m going to run ahead!', 12, 0, 100, 0, 0, 0, 7544, 'Melizza Brimbuzzle'),
	(12277, 2, 0, 'Hey Hornizz!  I''m back!  And there are some people behind me who helped me out of a jam.', 12, 0, 100, 0, 0, 0, 7550, 'Melizza Brimbuzzle'),
	(12277, 3, 0, 'We''re going to have to scratch the Maraudines off our list.  Too hard to work with...', 12, 0, 100, 0, 0, 0, 7551, 'Melizza Brimbuzzle'),
	(12277, 4, 0, 'Well, I''m off to the Gelkis.  They''re not as dumb as the Maraudines, but they''re more reasonable.', 12, 0, 100, 0, 0, 0, 7552, 'Melizza Brimbuzzle');
	
	SET @PATH := 1227700;
	SET @PATH_TWO := 1227701;
	DELETE FROM `waypoints` WHERE `entry` IN (@PATH, @PATH_TWO);
	INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
	(@PATH,1,-1155.146,2709.409,111.2361,'Melizza Brimbuzzle'),
	(@PATH,2,-1155.146,2709.409,111.2361,'Melizza Brimbuzzle'),
	(@PATH,3,-1162.785,2712.464,111.5828,'Melizza Brimbuzzle'),
	(@PATH,4,-1162.752,2712.397,111.6417,'Melizza Brimbuzzle'),
	(@PATH,5,-1169.502,2711.397,112.3917,'Melizza Brimbuzzle'),
	(@PATH,6,-1177.48,2710.258,112.1255,'Melizza Brimbuzzle'),
	(@PATH,7,-1199.98,2702.508,111.6255,'Melizza Brimbuzzle'),
	(@PATH,8,-1206.389,2700.128,111.496,'Melizza Brimbuzzle'),
	(@PATH,9,-1248.919,2680.271,111.8919,'Melizza Brimbuzzle'),
	(@PATH,10,-1272.489,2666.548,111.8956,'Melizza Brimbuzzle'),
	(@PATH,11,-1288.82,2646.104,111.7111,'Melizza Brimbuzzle'),
	(@PATH,12,-1290.413,2644.388,111.6542,'Melizza Brimbuzzle'),
	(@PATH,13,-1290.413,2644.388,111.6542,'Melizza Brimbuzzle'),
	(@PATH,14,-1290.413,2644.388,111.6542,'Melizza Brimbuzzle'),
	(@PATH,15,-1309.874,2622.18,111.7776,'Melizza Brimbuzzle'),
	(@PATH,16,-1309.908,2622.186,111.9743,'Melizza Brimbuzzle'),
	(@PATH,17,-1323.898,2605.008,111.8986,'Melizza Brimbuzzle'),
	(@PATH,18,-1336.769,2591.199,111.8607,'Melizza Brimbuzzle'),
	(@PATH,19,-1349.322,2578.486,111.7647,'Melizza Brimbuzzle'),
	(@PATH,20,-1359.602,2564.017,111.4906,'Melizza Brimbuzzle'),
	(@PATH,21,-1361.852,2559.517,110.7406,'Melizza Brimbuzzle'),
	(@PATH,22,-1362.352,2557.767,109.9906,'Melizza Brimbuzzle'),
	(@PATH,23,-1363.102,2556.267,109.4906,'Melizza Brimbuzzle'),
	(@PATH,24,-1364.602,2553.517,108.9906,'Melizza Brimbuzzle'),
	(@PATH,25,-1365.352,2551.767,108.2406,'Melizza Brimbuzzle'),
	(@PATH,26,-1366.102,2550.017,107.7406,'Melizza Brimbuzzle'),
	(@PATH,27,-1366.477,2549.685,107.5719,'Melizza Brimbuzzle'),
	(@PATH,28,-1366.727,2549.185,107.0719,'Melizza Brimbuzzle'),
	(@PATH,29,-1367.227,2547.185,106.8219,'Melizza Brimbuzzle'),
	(@PATH,30,-1367.727,2545.185,106.0719,'Melizza Brimbuzzle'),
	(@PATH,31,-1368.477,2543.435,105.3219,'Melizza Brimbuzzle'),
	(@PATH,32,-1368.977,2541.435,104.5719,'Melizza Brimbuzzle'),
	(@PATH,33,-1369.477,2539.435,103.8219,'Melizza Brimbuzzle'),
	(@PATH,34,-1370.227,2536.685,103.3219,'Melizza Brimbuzzle'),
	(@PATH,35,-1370.977,2534.685,102.5719,'Melizza Brimbuzzle'),
	(@PATH,36,-1371.227,2532.935,102.0719,'Melizza Brimbuzzle'),
	(@PATH,37,-1371.727,2531.185,101.3219,'Melizza Brimbuzzle'),
	(@PATH,38,-1372.227,2529.185,100.8219,'Melizza Brimbuzzle'),
	(@PATH,39,-1372.977,2527.185,100.0719,'Melizza Brimbuzzle'),
	(@PATH,40,-1373.727,2524.435,99.32188,'Melizza Brimbuzzle'),
	(@PATH,41,-1374.227,2522.435,98.57188,'Melizza Brimbuzzle'),
	(@PATH,42,-1374.727,2520.685,97.82188,'Melizza Brimbuzzle'),
	(@PATH,43,-1375.477,2518.685,97.32188,'Melizza Brimbuzzle'),
	(@PATH,44,-1375.639,2518.402,97.00177,'Melizza Brimbuzzle'),
	(@PATH,45,-1375.889,2517.152,96.75177,'Melizza Brimbuzzle'),
	(@PATH,46,-1376.389,2515.152,96.00177,'Melizza Brimbuzzle'),
	(@PATH,47,-1376.889,2513.402,95.25177,'Melizza Brimbuzzle'),
	(@PATH,48,-1378.139,2509.402,93.75177,'Melizza Brimbuzzle'),
	(@PATH,49,-1378.389,2507.652,93.00177,'Melizza Brimbuzzle'),
	(@PATH,50,-1379.139,2504.902,92.50177,'Melizza Brimbuzzle'),
	(@PATH,51,-1379.889,2501.902,91.75177,'Melizza Brimbuzzle'),
	(@PATH,52,-1380.389,2500.152,91.25177,'Melizza Brimbuzzle'),
	(@PATH,53,-1381.389,2496.152,90.50177,'Melizza Brimbuzzle'),
	(@PATH,54,-1381.559,2495.931,90.14986,'Melizza Brimbuzzle'),
	(@PATH,55,-1381.809,2495.431,90.14986,'Melizza Brimbuzzle'),
	(@PATH,56,-1382.309,2491.431,89.64986,'Melizza Brimbuzzle'),
	(@PATH,57,-1385.493,2471.513,89.11208,'Melizza Brimbuzzle'),
	(@PATH,58,-1386.618,2405.71,89.767,'Melizza Brimbuzzle'),
	(@PATH_TWO,1,-1385.368,2401.21,90.267,'Melizza Brimbuzzle'),
	(@PATH_TWO,2,-1383.618,2395.46,90.767,'Melizza Brimbuzzle'),
	(@PATH_TWO,3,-1382.118,2390.71,91.517,'Melizza Brimbuzzle'),
	(@PATH_TWO,4,-1377.252,2375.137,91.91622,'Melizza Brimbuzzle'),
	(@PATH_TWO,5,-1373.759,2355.208,92.06256,'Melizza Brimbuzzle'),
	(@PATH_TWO,6,-1366.36,2323.406,91.9967,'Melizza Brimbuzzle'),
	(@PATH_TWO,7,-1362.618,2277.267,91.79288,'Melizza Brimbuzzle'),
	(@PATH_TWO,8,-1358.118,2257.017,91.54288,'Melizza Brimbuzzle'),
	(@PATH_TWO,9,-1354.14,2239.229,91.62033,'Melizza Brimbuzzle'),
	(@PATH_TWO,10,-1352.89,2229.729,92.12033,'Melizza Brimbuzzle'),
	(@PATH_TWO,11,-1350.869,2214.848,91.63843,'Melizza Brimbuzzle'),
	(@PATH_TWO,12,-1351.869,2210.848,90.88843,'Melizza Brimbuzzle'),
	(@PATH_TWO,13,-1352.119,2209.848,90.13843,'Melizza Brimbuzzle'),
	(@PATH_TWO,14,-1352.619,2208.098,89.13843,'Melizza Brimbuzzle'),
	(@PATH_TWO,15,-1352.869,2207.098,87.88843,'Melizza Brimbuzzle'),
	(@PATH_TWO,16,-1353.119,2206.098,86.38843,'Melizza Brimbuzzle'),
	(@PATH_TWO,17,-1353.369,2205.348,85.38843,'Melizza Brimbuzzle'),
	(@PATH_TWO,18,-1353.619,2204.348,84.38843,'Melizza Brimbuzzle'),
	(@PATH_TWO,19,-1354.119,2202.348,83.63843,'Melizza Brimbuzzle'),
	(@PATH_TWO,20,-1354.369,2201.348,82.88843,'Melizza Brimbuzzle'),
	(@PATH_TWO,21,-1354.619,2200.598,82.13843,'Melizza Brimbuzzle'),
	(@PATH_TWO,22,-1354.869,2199.598,81.38843,'Melizza Brimbuzzle'),
	(@PATH_TWO,23,-1355.119,2198.598,80.63843,'Melizza Brimbuzzle'),
	(@PATH_TWO,24,-1355.119,2197.598,79.88843,'Melizza Brimbuzzle'),
	(@PATH_TWO,25,-1355.619,2195.598,78.88843,'Melizza Brimbuzzle'),
	(@PATH_TWO,26,-1356.119,2193.848,77.88843,'Melizza Brimbuzzle'),
	(@PATH_TWO,27,-1356.619,2191.848,77.13843,'Melizza Brimbuzzle'),
	(@PATH_TWO,28,-1357.619,2188.848,76.38843,'Melizza Brimbuzzle'),
	(@PATH_TWO,29,-1355.239,2198.246,80.43513,'Melizza Brimbuzzle'),
	(@PATH_TWO,30,-1355.489,2197.246,79.68513,'Melizza Brimbuzzle'),
	(@PATH_TWO,31,-1355.989,2195.496,78.68513,'Melizza Brimbuzzle'),
	(@PATH_TWO,32,-1356.489,2193.496,77.68513,'Melizza Brimbuzzle'),
	(@PATH_TWO,33,-1356.989,2191.496,76.93513,'Melizza Brimbuzzle'),
	(@PATH_TWO,34,-1357.739,2188.746,76.18513,'Melizza Brimbuzzle'),
	(@PATH_TWO,35,-1357.989,2187.496,75.68513,'Melizza Brimbuzzle'),
	(@PATH_TWO,36,-1358.739,2185.746,75.18513,'Melizza Brimbuzzle'),
	(@PATH_TWO,37,-1359.239,2183.746,74.43513,'Melizza Brimbuzzle'),
	(@PATH_TWO,38,-1359.989,2181.996,73.68513,'Melizza Brimbuzzle'),
	(@PATH_TWO,39,-1360.489,2179.996,72.93513,'Melizza Brimbuzzle'),
	(@PATH_TWO,40,-1361.489,2177.246,72.18513,'Melizza Brimbuzzle'),
	(@PATH_TWO,41,-1362.239,2175.246,71.68513,'Melizza Brimbuzzle'),
	(@PATH_TWO,42,-1362.739,2173.496,70.93513,'Melizza Brimbuzzle'),
	(@PATH_TWO,43,-1363.239,2171.746,70.43513,'Melizza Brimbuzzle'),
	(@PATH_TWO,44,-1363.739,2169.746,69.68513,'Melizza Brimbuzzle'),
	(@PATH_TWO,45,-1364.739,2166.996,68.68513,'Melizza Brimbuzzle'),
	(@PATH_TWO,46,-1365.489,2164.996,67.68513,'Melizza Brimbuzzle'),
	(@PATH_TWO,47,-1365.989,2163.246,66.68513,'Melizza Brimbuzzle'),
	(@PATH_TWO,48,-1366.739,2161.246,65.93513,'Melizza Brimbuzzle'),
	(@PATH_TWO,49,-1367.489,2159.496,64.68513,'Melizza Brimbuzzle'),
	(@PATH_TWO,50,-1367.989,2157.496,63.93513,'Melizza Brimbuzzle'),
	(@PATH_TWO,51,-1368.989,2154.746,63.18513,'Melizza Brimbuzzle'),
	(@PATH_TWO,52,-1369.739,2152.746,62.43513,'Melizza Brimbuzzle'),
	(@PATH_TWO,53,-1370.239,2150.996,61.68513,'Melizza Brimbuzzle'),
	(@PATH_TWO,54,-1370.989,2148.996,60.93513,'Melizza Brimbuzzle'),
	(@PATH_TWO,55,-1369.163,2154.362,62.88633,'Melizza Brimbuzzle'),
	(@PATH_TWO,56,-1369.913,2152.612,62.63633,'Melizza Brimbuzzle'),
	(@PATH_TWO,57,-1370.413,2150.612,61.63633,'Melizza Brimbuzzle'),
	(@PATH_TWO,58,-1371.163,2148.862,61.13633,'Melizza Brimbuzzle'),
	(@PATH_TWO,59,-1371.663,2147.612,60.63633,'Melizza Brimbuzzle'),
	(@PATH_TWO,60,-1374.663,2142.362,60.13633,'Melizza Brimbuzzle'),
	(@PATH_TWO,61,-1381.413,2131.612,60.88633,'Melizza Brimbuzzle'),
	(@PATH_TWO,62,-1387.413,2121.362,61.38633,'Melizza Brimbuzzle'),
	(@PATH_TWO,63,-1391.413,2114.362,62.13633,'Melizza Brimbuzzle'),
	(@PATH_TWO,64,-1395.163,2108.362,62.63633,'Melizza Brimbuzzle'),
	(@PATH_TWO,65,-1391.807,2114.246,61.76419,'Melizza Brimbuzzle'),
	(@PATH_TWO,66,-1395.307,2108.246,62.26419,'Melizza Brimbuzzle'),
	(@PATH_TWO,67,-1396.307,2106.496,62.51419,'Melizza Brimbuzzle'),
	(@PATH_TWO,68,-1404.391,2088.967,62.0089,'Melizza Brimbuzzle'),
	(@PATH_TWO,69,-1405.748,2087.39,62.09642,'Melizza Brimbuzzle'),
	(@PATH_TWO,70,-1407.248,2086.89,62.09642,'Melizza Brimbuzzle'),
	(@PATH_TWO,71,-1408.248,2086.89,62.34642,'Melizza Brimbuzzle'),
	(@PATH_TWO,72,-1410.498,2086.39,62.34642,'Melizza Brimbuzzle'),
	(@PATH_TWO,73,-1412.498,2086.39,62.59642,'Melizza Brimbuzzle'),
	(@PATH_TWO,74,-1413.998,2085.39,62.59642,'Melizza Brimbuzzle'),
	(@PATH_TWO,75,-1415.498,2083.39,62.59642,'Melizza Brimbuzzle'),
	(@PATH_TWO,76,-1416.498,2082.39,62.59642,'Melizza Brimbuzzle'),
	(@PATH_TWO,77,-1417.498,2079.39,62.59642,'Melizza Brimbuzzle'),
	(@PATH_TWO,78,-1417.998,2077.39,62.59642,'Melizza Brimbuzzle'),
	(@PATH_TWO,79,-1419.998,2075.14,62.59642,'Melizza Brimbuzzle'),
	(@PATH_TWO,80,-1424.748,2073.14,62.34642,'Melizza Brimbuzzle'),
	(@PATH_TWO,81,-1418.114,2077.1,62.59175,'Melizza Brimbuzzle'),
	(@PATH_TWO,82,-1420.364,2075.35,62.59175,'Melizza Brimbuzzle'),
	(@PATH_TWO,83,-1425.114,2073.1,62.34175,'Melizza Brimbuzzle'),
	(@PATH_TWO,84,-1425.114,2075.1,62.34175,'Melizza Brimbuzzle'),
	(@PATH_TWO,85,-1436.864,2074.35,62.84175,'Melizza Brimbuzzle'),
	(@PATH_TWO,86,-1451.277,2073.542,62.70998,'Melizza Brimbuzzle'),
	(@PATH_TWO,87,-1464.777,2075.542,62.95998,'Melizza Brimbuzzle'),
	(@PATH_TWO,88,-1465.031,2075.661,62.89689,'Melizza Brimbuzzle'),
	(@PATH_TWO,89,-1473.031,2077.161,63.14689,'Melizza Brimbuzzle'),
	(@PATH_TWO,90,-1480.031,2086.411,62.39689,'Melizza Brimbuzzle'),
	(@PATH_TWO,91,-1485.531,2093.411,61.89689,'Melizza Brimbuzzle'),
	(@PATH_TWO,92,-1485.639,2093.875,61.82396,'Melizza Brimbuzzle'),
	(@PATH_TWO,93,-1487.889,2096.375,61.82396,'Melizza Brimbuzzle');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Get The Kraken.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	UPDATE creature SET spawntimesecs=60 WHERE id=34925;
	
	
	
	-- North Sea Kraken SAI
	SET @ENTRY := 34925;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,0,0,100,0,6000,9000,7000,9000,11,66514,0,0,0,0,0,1,0,0,0,0,0,0,0,"North Sea Kraken - In Combat - Cast 'Frost Breath'"),
	(@ENTRY,0,2,0,1,0,100,0,30000,30000,30000,30000,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"North Sea Kraken - Out of Combat - Set Visibility On"),
	(@ENTRY,0,3,4,2,0,100,1,1,6,0,0,11,66994,0,0,0,0,0,2,0,0,0,0,0,0,0,"North Sea Kraken - Between 1-6% Health - Cast 'Kraken Death Tooth Explosion - Create Tooth' (No Repeat)"),
	(@ENTRY,0,4,5,61,0,100,0,1,6,0,0,11,66717,0,0,0,0,0,2,0,0,0,0,0,0,0,"North Sea Kraken - Between 1-6% Health - Cast 'Kraken Spear Quest Credit' (No Repeat)"),
	(@ENTRY,0,5,0,61,0,100,0,1,6,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"North Sea Kraken - Between 1-6% Health - Kill Self (No Repeat)"),
	(@ENTRY,0,6,0,1,0,100,0,30000,30000,30000,30000,11,68909,0,0,0,0,0,1,0,0,0,0,0,0,0,"North Sea Kraken - Out of Combat - Cast 'Submerge Visual'"),
	(@ENTRY,0,7,0,0,0,100,0,15000,20000,15000,20000,11,66511,0,0,0,0,0,2,0,0,0,0,0,0,0,"North Sea Kraken - In Combat - Cast 'Whirl'"),
	(@ENTRY,0,8,9,8,0,100,0,66588,0,0,0,33,35009,0,0,0,0,0,7,0,0,0,0,0,0,0,"North Sea Kraken - On Spellhit 'Flaming Spear' - Quest Credit 'Get Kraken!'"),
	(@ENTRY,0,9,0,61,0,50,0,66588,0,0,0,11,50142,0,0,0,0,0,1,0,0,0,0,0,0,0,"North Sea Kraken - On Spellhit 'Flaming Spear' - Cast 'Emerge Visual'");
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Matis the cruel correction.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Matis the Cruel SAI
	SET @ENTRY := 17664;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,1,38,0,100,0,1,1,0,0,66,0,0,0,0,0,0,19,17853,0,0,0,0,0,0,"Matis the Cruel - On Data Set 1 1 - Set Orientation Closest Creature 'Tracker of the Hand'"),
	(@ENTRY,0,1,2,61,0,100,0,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 1 1 - Say Line 0"),
	(@ENTRY,0,2,12,61,0,100,0,1,1,0,0,49,0,0,0,0,0,0,19,17853,0,0,0,0,0,0,"Matis the Cruel - On Data Set 1 1 - Start Attacking"),
	(@ENTRY,0,3,0,9,0,100,0,5,30,25,40,11,6660,2,0,0,0,0,2,0,0,0,0,0,0,0,"Matis the Cruel - Within 5-30 Range - Cast 'Shoot'"),
	(@ENTRY,0,4,0,2,0,100,1,25,50,0,0,45,1,1,0,0,0,0,19,17853,0,0,0,0,0,0,"Matis the Cruel - Between 25-50% Health - Set Data 1 1 (No Repeat)"),
	(@ENTRY,0,5,6,38,0,100,0,2,2,0,0,90,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 2 2 - Set Flag Standstate Sleep"),
	(@ENTRY,0,6,7,61,0,100,0,2,2,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 2 2 - Stop Attacking"),
	(@ENTRY,0,7,8,61,0,100,0,2,2,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 2 2 - Disable Combat Movement"),
	(@ENTRY,0,8,9,61,0,100,0,2,2,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 2 2 - Say Line 1"),
	(@ENTRY,0,9,10,61,0,100,0,2,2,0,0,45,2,2,0,0,0,0,19,17853,0,0,0,0,0,0,"Matis the Cruel - On Data Set 2 2 - Set Data 2 2"),
	(@ENTRY,0,10,11,61,0,100,0,2,2,0,0,11,31336,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 2 2 - Cast 'Matis Captured DND'"),
	(@ENTRY,0,11,0,61,0,100,0,2,2,0,0,41,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 2 2 - Despawn In 15000 ms"),
	(@ENTRY,0,12,0,61,0,100,0,1,1,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matis the Cruel - On Data Set 1 1 - Set Flags Immune To Players & Immune To NPC's");
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Mission plage this.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- New Agamand Plague Tank Bunny SAI
	SET @ENTRY := 24290;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,8,0,100,0,43404,0,0,0,33,24290,0,0,0,0,0,7,0,0,0,0,0,0,0,"New Agamand Plague Tank Bunny - On Spellhit 'Mission: Plague This!: Orehammer's Precision Bombs Dummy' - Quest Credit 'Mission: Plague This!'");
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Return to Earth.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Ruby Keeper SAI
	SET @ENTRY := 27530;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,8,0,100,0,49349,0,0,0,11,49364,2,0,0,0,0,7,0,0,0,0,0,0,0,"Ruby Keeper - On Spellhit 'Planting Ruby Acorn' - Cast 'Return to Earth'");
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Springing the trap.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	SET @CGUID := 45823; -- need 5
	SET @OGUID := 5514; -- need 1
	
	SET @SOLDIER           := 24769;
	SET @KERISTRASZA       := 26237;
	SET @SARAGOSA          := 26299;
	SET @MALYGOS           := 26310;
	SET @COLDARRA_INVISMAN := 26373;
	SET @MALYGOS2          := 29655;
	SET @INVISMAN          := 33087;
	SET @SIGNALFIRE        := 194151;
	
	UPDATE `creature_template` SET `inhabitType`=4 WHERE `entry`=@SOLDIER;
	UPDATE `creature_template` SET `speed_walk`=3.6, `speed_run`=2.857143, `faction`=1816, `unit_flags`=832, `inhabitType`=5 WHERE `entry`=@KERISTRASZA;
	UPDATE `creature_template` SET `speed_walk`=2, `speed_run`=1.714286, `unit_flags`=768 WHERE `entry`=@SARAGOSA;
	UPDATE `creature_template` SET `speed_walk`=8, `speed_run`=4.714286, `unit_flags`=832, `inhabitType`=4 WHERE `entry`=@MALYGOS;
	
	DELETE FROM `creature_template_addon` WHERE `entry` IN (@KERISTRASZA,@SARAGOSA,@MALYGOS);
	INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
	(@KERISTRASZA,0,0,50331648,1,0,''),
	(@SARAGOSA,0,0,0,1,0,'29266'),
	(@MALYGOS,0,0,50331648,1,0,'65137');
	
	DELETE FROM `creature_addon` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+2;
	INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
	(@CGUID+0,(@CGUID+0)*10,0,50331648,1,0,'65185'),
	(@CGUID+1,(@CGUID+1)*10,0,50331648,1,0,'65185'),
	(@CGUID+2,(@CGUID+2)*10,0,50331648,1,0,'65185');
	
	UPDATE `creature` SET `spawntimesecs`=60 WHERE `guid`=72773;
	DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+4;
	INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`) VALUES
	(@CGUID+0, @SOLDIER, 571, 1, 1, 24737, 0, 3780.585, 6961.891, 615.3891, 0, 300, 0, 0, 0, 0, 2, 0, 0, 0, 0),
	(@CGUID+1, @SOLDIER, 571, 1, 1, 24737, 0, 3694.591, 6905.624, 588.2004, 0, 300, 0, 0, 0, 0, 2, 0, 0, 0, 0),
	(@CGUID+2, @SOLDIER, 571, 1, 1, 24737, 0, 3715.599, 6790.909, 576.1764, 0, 300, 0, 0, 0, 0, 2, 0, 0, 0, 0),
	(@CGUID+3, @MALYGOS, 571, 1, 1, 27176, 0, 3767.673, 6843.96, 544.4875, 4.066617, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(@CGUID+4, @INVISMAN, 571, 1, 1, 15435, 0, 4062.013, 7108.927, 170.0696, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	
	DELETE FROM `gameobject` WHERE `guid`=@OGUID;
	INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
	(@OGUID, 194152, 571, 1, 1, 4061.978, 7109.135, 170.0001, 0, 0, 0, 0, 1, -60, 255, 1, 0);
	
	UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@KERISTRASZA,@SARAGOSA,@MALYGOS,@COLDARRA_INVISMAN,@MALYGOS2,@INVISMAN);
	UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@SIGNALFIRE;
	DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@KERISTRASZA,@SARAGOSA,@MALYGOS,@COLDARRA_INVISMAN,@MALYGOS2,@INVISMAN) AND `source_type`=0;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@SIGNALFIRE AND `source_type`=1;
	DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@KERISTRASZA*100+0,@KERISTRASZA*100+1,@KERISTRASZA*100+2,@MALYGOS*100,@MALYGOS2*100,@SIGNALFIRE*100) AND `source_type`=9;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@KERISTRASZA,0,0,0,38,0,100,0,0,1,0,0,53,0,@KERISTRASZA,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On data 0 1 set - Start WP movement'),
	(@KERISTRASZA,0,1,2,40,0,100,0,4,@KERISTRASZA,0,0,54,16000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On WP 4 reached - Pause WP movement 16 seconds'),
	(@KERISTRASZA,0,2,0,61,0,100,0,0,0,0,0,80,@KERISTRASZA*100+0,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On WP 4 reached - Start script 0'),
	(@KERISTRASZA,0,3,4,40,0,100,0,6,0,0,0,12,@SARAGOSA,3,40000,0,0,0,8,0,0,0,4032.4,7086.208,166.6852,4.328416, 'Keristrasza - On WP 6 reached - Summon Corpse of Saragosa'),
	(@KERISTRASZA,0,4,5,61,0,100,0,0,0,0,0,55,40000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On WP 6 reached - Pause WP movement 40 seconds'),
	(@KERISTRASZA,0,5,0,61,0,100,0,0,0,0,0,80,@KERISTRASZA*100+1,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On WP 6 reached - Start script 1'),
	(@KERISTRASZA,0,6,0,38,0,100,0,0,2,0,0,69,7,0,0,0,0,0,8,0,0,0,3908.273,6578.861,170.5382,0, 'Keristrasza - On data 0 1 set - Move to position'),
	(@KERISTRASZA,0,7,0,34,0,100,0,0,7,0,0,80,@KERISTRASZA*100+2,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On movement inform - Run script'),
	(@KERISTRASZA,0,8,9,8,0,100,0,46886,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On spellhit Frost Breath - Say line'),
	(@KERISTRASZA,0,9,0,61,0,100,0,0,0,0,0,11,46882,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On spellhit Frost Breath - Spellcast Ice Block'),
	(@KERISTRASZA,0,10,0,8,0,100,0,46902,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On spellhit Malygos Teleport - Despawn after 1 second'),
	-- (@KERISTRASZA,0,10,0,11,0,100,0,0,0,0,0,28,46882,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza - On spawn - Remove aura Ice Block'),
	
	(@SARAGOSA,0,0,0,38,0,100,0,0,1,0,0,11,42726,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Corpse of Saragosa - On data 0 1 set - Spellcast Cosmetic - Immolation (Whole Body)'),
	(@SARAGOSA,0,1,0,11,0,100,0,0,0,0,0,28,42726,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Corpse of Saragosa - On spawn - Remove aura Cosmetic - Immolation (Whole Body)'),
	
	(@MALYGOS,0,0,1,10,0,100,1,1,30,0,0,28,65137,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Maylgos - On LOS OOC - Remove aura Malygos Periodic Aura'),
	(@MALYGOS,0,1,0,61,0,100,0,0,0,0,0,53,0,@MALYGOS,0,0,0,0,1,0,0,0,0,0,0,0, 'Maylgos - On LOS OOC - Start WP movement'),
	(@MALYGOS,0,2,0,40,0,100,0,10,@MALYGOS,0,0,80,@MALYGOS*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Maylgos - On WP 10 reached - Run script'),
	
	(@COLDARRA_INVISMAN,0,0,1,10,0,100,1,1,50,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Coldarra Spell FX InvisMan - On LOS OOC - Store targetlist'),
	(@COLDARRA_INVISMAN,0,1,2,61,0,100,0,0,0,0,0,12,@KERISTRASZA,8,0,0,0,0,8,0,0,0,3908.273,6578.861,178.8921,0.5235988, 'Coldarra Spell FX InvisMan - On LOS OOC - Summon Keristrasza'),
	(@COLDARRA_INVISMAN,0,2,3,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,19,@KERISTRASZA,50,0,0,0,0,0, 'Coldarra Spell FX InvisMan - On LOS OOC - Send targetlist to Keristrasza'),
	(@COLDARRA_INVISMAN,0,3,0,61,0,100,0,0,0,0,0,45,0,2,0,0,0,0,19,@KERISTRASZA,50,0,0,0,0,0, 'Coldarra Spell FX InvisMan - On LOS OOC - Send data 0 2 Keristrasza'),
	
	(@MALYGOS2,0,0,0,38,0,100,0,0,1,0,0,80,@MALYGOS2*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Maylgos - On data 0 1 set - Run script'),
	
	(@INVISMAN,0,0,1,8,0,100,0,62272,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Signal Fire Invisman - On spellhit Raelorasz'' Spark - Store target'),
	(@INVISMAN,0,1,2,61,0,100,0,0,0,0,0,12,@KERISTRASZA,8,60000,0,0,0,8,0,0,0,4098.674,7064.292,198.7698,0, 'Signal Fire Invisman - On spellhit Raelorasz'' Spark - Summon Keristrasza'),
	(@INVISMAN,0,2,3,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,19,@KERISTRASZA,100,0,0,0,0,0, 'Signal Fire Invisman - On spellhit Raelorasz'' Spark - Send targetlist'),
	(@INVISMAN,0,3,4,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,20,@SIGNALFIRE,5,0,0,0,0,0, 'Signal Fire Invisman - On spellhit Raelorasz'' Spark - Set data 0 1 Signal Fire'),
	(@INVISMAN,0,4,0,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,@KERISTRASZA,100,0,0,0,0,0, 'Signal Fire Invisman - On spellhit Raelorasz'' Spark - Set data 0 1 Keristrasza'),
	
	(@SIGNALFIRE,1,0,1,38,0,100,0,0,1,0,0,44,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Signal Fire - On data 0 1 set - Set phasemask 2'),
	(@SIGNALFIRE,1,1,0,61,0,100,0,0,0,0,0,80,@SIGNALFIRE*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Signal Fire - On data 0 1 set - Run script'),
	
	(@KERISTRASZA*100+0,9,0,0,0,0,100,0,0,0,0,0,90,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 0 - Remove unit_field_bytes1 (flying + hovering)'),
	(@KERISTRASZA*100+0,9,1,0,0,0,100,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 0 - Disable fly'),
	(@KERISTRASZA*100+0,9,2,0,0,0,100,0,4000,4000,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Keristrasza script 0 - Turn to'),
	(@KERISTRASZA*100+0,9,3,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Keristrasza script 0 - Say line'),
	(@KERISTRASZA*100+0,9,4,0,0,0,100,0,10000,10000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 0 - Say line'),
	
	(@KERISTRASZA*100+1,9,0,0,0,0,100,0,6000,6000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 1 - Say line'),
	(@KERISTRASZA*100+1,9,1,0,0,0,100,0,4000,4000,0,0,11,45852,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Keristrasza script 1 - Spellcast Cosmetic - Dragon''s Breath'),
	(@KERISTRASZA*100+1,9,2,0,0,0,100,0,3500,3500,0,0,45,0,1,0,0,0,0,19,@SARAGOSA,20,0,0,0,0,0, 'Keristrasza script 1 - Say line'),
	(@KERISTRASZA*100+1,9,3,0,0,0,100,0,1500,1500,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 1 - Say line'),
	(@KERISTRASZA*100+1,9,4,0,0,0,100,0,10000,10000,0,0,11,46853,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 1 - Spellcast Malygos in Coldarra'),
	(@KERISTRASZA*100+1,9,5,0,0,0,100,0,5000,5000,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Keristrasza script 1 - Turn to'),
	(@KERISTRASZA*100+1,9,6,0,0,0,100,0,0,0,0,0,1,4,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Keristrasza script 1 - Say line'),
	(@KERISTRASZA*100+1,9,7,0,0,0,100,0,4000,4000,0,0,11,46813,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Keristrasza script 1 - Spellcast Taxi - Coldarra Ledge to Transitus Shield'),
	(@KERISTRASZA*100+1,9,8,0,0,0,100,0,1000,1000,0,0,45,0,1,0,0,0,0,19,@MALYGOS2,20,0,0,0,0,0, 'Keristrasza script 1 - Set data 0 1 Malygos'),
	(@KERISTRASZA*100+1,9,9,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 1 - Despawn'),
	
	(@KERISTRASZA*100+2,9,0,0,0,0,100,0,0,0,0,0,91,50331648,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 2 - Remove unit_field_bytes1 (flying + hovering)'),
	(@KERISTRASZA*100+2,9,1,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Keristrasza script 2 - Turn to'),
	(@KERISTRASZA*100+2,9,2,0,0,0,100,0,500,500,0,0,5,293,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 2 - Play emote'),
	(@KERISTRASZA*100+2,9,3,0,0,0,100,0,4000,4000,0,0,11,37712,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keristrasza script 2 - Spellcast Keristrasza Kill Credit'),
	(@KERISTRASZA*100+2,9,4,0,0,0,100,0,0,0,0,0,1,5,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Keristrasza script 2 - Say line'),
	
	(@MALYGOS*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Malygos script - Say line'),
	(@MALYGOS*100,9,1,0,0,0,100,0,7000,7000,0,0,66,0,0,0,0,0,0,19,@KERISTRASZA,50,0,0,0,0,0, 'Malygos script - Turn to'),
	(@MALYGOS*100,9,2,0,0,0,100,0,0,0,0,0,11,46886,0,0,0,0,0,19,@KERISTRASZA,50,0,0,0,0,0, 'Malygos script - Spellcast Frost Breath'),
	(@MALYGOS*100,9,3,0,0,0,100,0,7000,7000,0,0,11,46902,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Malygos script - Spellcast Malygos Teleport'),
	(@MALYGOS*100,9,4,0,0,0,100,0,1000,1000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Malygos script - Despawn'),
	
	(@MALYGOS2*100,9,0,0,0,0,100,0,4000,4000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Malygos script - Say line'),
	
	(@SIGNALFIRE*100,9,0,0,0,0,100,0,60000,60000,0,0,44,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Signal Fire script - Set phasemask 1');
	
	DELETE FROM `event_scripts` WHERE `id`=17491;
	INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
	(17491,0,9,@OGUID,60,0,0,0,0,0); -- Spawn burning Signal Fire
	
	DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=-46813;
	INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
	(-46813,46814,0,'On spellfade Taxi - Coldarra Ledge to Transitus Shield - Spellcast Coldarra to Transitus');
	
	DELETE FROM `disables` WHERE `sourceType`=0 AND `entry`=62272;
	INSERT INTO `disables` (`sourceType`,`entry`,`flags`,`params_0`,`params_1`,`comment`) VALUES
	(0,62272,64,0,0,'Disable LOS for spell Raelorasz'' Spark');
	
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (46886,46900,46902,62272);
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
	(13,1,46886,0,0,31,0,3,@SOLDIER,0,0,0,0,'','Spell Frost Breath targets Red Dragon Soldier'),
	(13,1,46886,0,1,31,0,3,@KERISTRASZA,0,0,0,0,'','Spell Frost Breath targets Keristrasza'),
	(13,1,46900,0,0,31,0,3,@MALYGOS,0,0,0,0,'','Spell Dragon Fireball targets Malygos'),
	(13,1,46902,0,0,31,0,3,@KERISTRASZA,0,0,0,0,'','Spell Malygos Teleport effect0 targets Keristrasza'),
	(13,1,62272,0,0,31,0,3,@INVISMAN,0,0,0,0,'','Spell Raelorasz'' Spark targets Signal Fire Invisman');
	
	DELETE FROM `creature_text` WHERE `entry` IN (@KERISTRASZA,@MALYGOS,@MALYGOS2,@INVISMAN);
	INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
	(@KERISTRASZA,0,0,'Stay close to me, $n. I could not bear for any harm to come to you.',12,0,100,1,0,0,0,0,'Keristrasza'),
	(@KERISTRASZA,1,0,'MALYGOS!!',14,0,100,15,0,7274,0,0,'Keristrasza'),
	(@KERISTRASZA,2,0,'Come, Lord of Magic, and recover your precious consort....',14,0,100,1,0,0,0,0,'Keristrasza'),
	(@KERISTRASZA,3,0,'...what remains of her!',14,0,100,0,0,0,0,0,'Keristrasza'),
	(@KERISTRASZA,4,0,'Come, $n. Let us see the fruits of our efforts.',12,0,100,0,0,0,0,0,'Keristrasza'),
	(@KERISTRASZA,5,0,'Hurry, $n! Flee! Live to finish what we''ve begun here....',12,0,100,0,0,0,0,0,'Keristrasza'),
	(@KERISTRASZA,6,0,'Never!',14,0,100,0,0,0,0,0,'Keristrasza'),
	(@MALYGOS,0,0,'Keristrasza! You''ve bested my consort... and now YOU shall take her place!',14,0,100,0,0,0,0,0,'Malygos'),
	(@MALYGOS2,0,0,'Saragosa! What has become of you?',14,0,100,0,0,0,0,0,'Malygos');
	
	DELETE FROM `waypoints` WHERE `entry` IN (@KERISTRASZA,@MALYGOS);
	INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
	(@KERISTRASZA, 1, 4098.674, 7064.292, 198.7698, 'Keristrasza'),
	(@KERISTRASZA, 2, 4092.762, 7067.315, 193.3262, 'Keristrasza'),
	(@KERISTRASZA, 3, 4079.077, 7074.162, 176.2149, 'Keristrasza'),
	(@KERISTRASZA, 4, 4063.685, 7083.67, 167.8817, 'Keristrasza'),
	(@KERISTRASZA, 5, 4045.307, 7083.389, 168.241, 'Keristrasza'),
	(@KERISTRASZA, 6, 4040.892, 7083.875, 168.116, 'Keristrasza'),
	
	(@MALYGOS, 1, 3736.729, 6813.358, 533.4736, 'Malygos'),
	(@MALYGOS, 2, 3732.188, 6794.312, 487.0847, 'Malygos'),
	(@MALYGOS, 3, 3730.688, 6769.336, 444.0849, 'Malygos'),
	(@MALYGOS, 4, 3726.533, 6750.502, 398.3348, 'Malygos'),
	(@MALYGOS, 5, 3725.144, 6735.662, 351.0848, 'Malygos'),
	(@MALYGOS, 6, 3733.896, 6705.199, 312.0294, 'Malygos'),
	(@MALYGOS, 7, 3735.563, 6692.039, 264.474, 'Malygos'),
	(@MALYGOS, 8, 3739.076, 6675.249, 218.3628, 'Malygos'),
	(@MALYGOS, 9, 3746.836, 6657.269, 186.8073, 'Malygos'),
	(@MALYGOS,10, 3751.5, 6635.882, 186.8073, 'Malygos'),
	(@MALYGOS,11, 3766.236, 6622.118, 186.8073, 'Malygos'),
	(@MALYGOS,12, 3794.761, 6612.983, 186.8073, 'Malygos'),
	(@MALYGOS,13, 3826.566, 6605.694, 195.7795, 'Malygos'),
	(@MALYGOS,14, 3838.386, 6601.479, 199.7516, 'Malygos');
	
	DELETE FROM `waypoint_data` WHERE `id` IN ((@CGUID+0)*10,(@CGUID+1)*10,(@CGUID+2)*10,(@CGUID+3)*10,(@CGUID+4)*10);
	INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
	((@CGUID+0)*10, 1,3780.585,6961.891,615.3891,0,0,0,0,100,0),
	((@CGUID+0)*10, 2,3781.443,6961.375,615.3891,0,0,0,0,100,0),
	((@CGUID+0)*10, 3,3788.726,6952.882,619.7848,0,0,0,0,100,0),
	((@CGUID+0)*10, 4,3809.698,6939.206,609.7292,0,0,0,0,100,0),
	((@CGUID+0)*10, 5,3829.648,6917.982,597.0071,0,0,0,0,100,0),
	((@CGUID+0)*10, 6,3845.798,6899.093,586.6738,0,0,0,0,100,0),
	((@CGUID+0)*10, 7,3864.757,6857.222,572.757,0,0,0,0,100,0),
	((@CGUID+0)*10, 8,3862.349,6824.601,561.4517,0,0,0,0,100,0),
	((@CGUID+0)*10, 9,3850.486,6797.143,559.7294,0,0,0,0,100,0),
	((@CGUID+0)*10,10,3828.732,6772.135,562.8682,0,0,0,0,100,0),
	((@CGUID+0)*10,11,3795.058,6761.407,568.9792,0,0,0,0,100,0),
	((@CGUID+0)*10,12,3760.513,6774.492,581.5349,0,0,0,0,100,0),
	((@CGUID+0)*10,13,3720.332,6799.233,597.9792,0,0,0,0,100,0),
	((@CGUID+0)*10,14,3697.16,6835.938,619.7848,0,0,0,0,100,0),
	((@CGUID+0)*10,15,3681.756,6872.03,619.7848,0,0,0,0,100,0),
	((@CGUID+0)*10,16,3672.802,6901.496,619.7848,0,0,0,0,100,0),
	((@CGUID+0)*10,17,3672.081,6921.473,619.7848,0,0,0,0,100,0),
	((@CGUID+0)*10,18,3675.869,6947.217,619.7848,0,0,0,0,100,0),
	((@CGUID+0)*10,19,3696.144,6973.719,619.7848,0,0,0,0,100,0),
	((@CGUID+0)*10,20,3723.596,6980.155,619.7848,0,0,0,0,100,0),
	((@CGUID+0)*10,21,3761.115,6971.517,619.7848,0,0,0,0,100,0),
	((@CGUID+0)*10,22,3788.726,6952.882,619.7848,0,0,0,0,100,0),
	((@CGUID+0)*10,23,3809.698,6939.206,609.7292,0,0,0,0,100,0),
	
	((@CGUID+1)*10, 1,3694.591,6905.624,588.2004,0,0,0,0,100,0),
	((@CGUID+1)*10, 2,3694.486,6904.629,588.2004,0,0,0,0,100,0),
	((@CGUID+1)*10, 3,3687.71,6887.773,599.449,0,0,0,0,100,0),
	((@CGUID+1)*10, 4,3681.292,6860.081,599.449,0,0,0,0,100,0),
	((@CGUID+1)*10, 5,3684.588,6828.854,601.2267,0,0,0,0,100,0),
	((@CGUID+1)*10, 6,3702.324,6800.028,602.0601,0,0,0,0,100,0),
	((@CGUID+1)*10, 7,3742.879,6774.088,612.5878,0,0,0,0,100,0),
	((@CGUID+1)*10, 8,3786.845,6777.308,626.338,0,0,0,0,100,0),
	((@CGUID+1)*10, 9,3803.426,6793.12,641.338,0,0,0,0,100,0),
	((@CGUID+1)*10,10,3818.26,6820.016,651.0602,0,0,0,0,100,0),
	((@CGUID+1)*10,11,3824.966,6848.016,656.3936,0,0,0,0,100,0),
	((@CGUID+1)*10,12,3813.837,6884.006,649.3936,0,0,0,0,100,0),
	((@CGUID+1)*10,13,3787.394,6910.689,636.1436,0,0,0,0,100,0),
	((@CGUID+1)*10,14,3762.704,6925.763,628.9214,0,0,0,0,100,0),
	((@CGUID+1)*10,15,3741.792,6934.354,621.9214,0,0,0,0,100,0),
	((@CGUID+1)*10,16,3720.52,6935.709,615.1437,0,0,0,0,100,0),
	((@CGUID+1)*10,17,3702.77,6929.314,607.838,0,0,0,0,100,0),
	((@CGUID+1)*10,18,3692.661,6917.933,604.2271,0,0,0,0,100,0),
	((@CGUID+1)*10,19,3689.077,6901.22,601.1439,0,0,0,0,100,0),
	((@CGUID+1)*10,20,3687.71,6887.773,599.449,0,0,0,0,100,0),
	((@CGUID+1)*10,21,3681.292,6860.081,599.449,0,0,0,0,100,0),
	
	((@CGUID+2)*10, 1,3715.599,6790.909,576.1764,0,0,0,0,100,0),
	((@CGUID+2)*10, 2,3733.311,6795.495,575.6484,0,0,0,0,100,0),
	((@CGUID+2)*10, 3,3746.552,6797.681,571.1484,0,0,0,0,100,0),
	((@CGUID+2)*10, 4,3758.14,6796.333,567.8428,0,0,0,0,100,0),
	((@CGUID+2)*10, 5,3769.744,6788.941,566.5097,0,0,0,0,100,0),
	((@CGUID+2)*10, 6,3774.698,6775.426,565.4541,0,0,0,0,100,0),
	((@CGUID+2)*10, 7,3772.478,6758.345,564.0373,0,0,0,0,100,0),
	((@CGUID+2)*10, 8,3761.064,6744.284,561.3151,0,0,0,0,100,0),
	((@CGUID+2)*10, 9,3742.062,6734.352,558.0375,0,0,0,0,100,0),
	((@CGUID+2)*10,10,3722.155,6732.545,558.4818,0,0,0,0,100,0),
	((@CGUID+2)*10,11,3710.604,6738.485,558.4818,0,0,0,0,100,0),
	((@CGUID+2)*10,12,3702.351,6755.943,553.5372,0,0,0,0,100,0),
	((@CGUID+2)*10,13,3702.623,6781.31,558.315,0,0,0,0,100,0),
	((@CGUID+2)*10,14,3710.322,6803.959,558.4818,0,0,0,0,100,0),
	((@CGUID+2)*10,15,3707.133,6828.621,558.4818,0,0,0,0,100,0),
	((@CGUID+2)*10,16,3694.577,6842.447,558.4818,0,0,0,0,100,0),
	((@CGUID+2)*10,17,3677.345,6846.772,558.4818,0,0,0,0,100,0),
	((@CGUID+2)*10,18,3658.489,6838.999,562.2039,0,0,0,0,100,0),
	((@CGUID+2)*10,19,3643.681,6818.719,570.5095,0,0,0,0,100,0),
	((@CGUID+2)*10,20,3640.345,6800.429,574.6765,0,0,0,0,100,0),
	((@CGUID+2)*10,21,3649.234,6780.53,576.1764,0,0,0,0,100,0),
	((@CGUID+2)*10,22,3662.512,6771.815,576.1764,0,0,0,0,100,0),
	((@CGUID+2)*10,23,3689.853,6776.469,576.1764,0,0,0,0,100,0),
	((@CGUID+2)*10,24,3715.599,6790.909,576.1764,0,0,0,0,100,0),
	((@CGUID+2)*10,25,3733.311,6795.495,575.6484,0,0,0,0,100,0),
	((@CGUID+2)*10,26,3746.552,6797.681,571.1484,0,0,0,0,100,0);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	-- Signal Fire Invisman SAI
	SET @ENTRY := 33087;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,1,8,0,100,0,62272,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Signal Fire Invisman - On Spellhit 'Raelorasz' Spark' - Store Targetlist"),
	(@ENTRY,0,1,2,61,0,100,0,62272,0,0,0,12,26237,8,60000,0,0,0,8,0,0,0,4098.67,7064.29,198.77,0,"Signal Fire Invisman - On Spellhit 'Raelorasz' Spark' - Summon Creature 'Keristrasza'"),
	(@ENTRY,0,2,3,61,0,100,0,62272,0,0,0,100,1,0,0,0,0,0,19,26237,100,0,0,0,0,0,"Signal Fire Invisman - On Spellhit 'Raelorasz' Spark' - Send Target 1"),
	(@ENTRY,0,3,4,61,0,100,0,62272,0,0,0,45,0,1,0,0,0,0,20,194151,5,0,0,0,0,0,"Signal Fire Invisman - On Spellhit 'Raelorasz' Spark' - Set Data 0 1"),
	(@ENTRY,0,4,5,61,0,100,0,62272,0,0,0,45,0,1,0,0,0,0,19,26237,100,0,0,0,0,0,"Signal Fire Invisman - On Spellhit 'Raelorasz' Spark' - Set Data 0 1"),
	(@ENTRY,0,5,0,61,0,100,0,62272,0,0,0,33,26237,0,0,0,0,0,7,0,0,0,0,0,0,0,"Signal Fire Invisman - On Spellhit 'Raelorasz' Spark' - Quest Credit 'Springing the Trap'");
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Steamtank Surpirse.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	SET @OGUID     := 5596; -- 1 free guid set by TC
	SET @QUEST     := 12326;
	SET @TANK      := 27587; -- Alliance Steam Tank
	SET @ELITE     := 27588; -- 7th Legion Elite
	SET @ENGI      := 27163; -- 7th Legion Siege Engineer
	SET @SPELL_1   := 49315; -- Ice Cannon
	SET @SPELL_2   := 49333; -- Ice Prison
	SET @SPELL_3   := 49109; -- Drop Off Gnome
	SET @SPELL_4   := 49081; -- Drop Off Soldier
	
	DELETE FROM `gameobject` WHERE `guid` = @OGUID;
	INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
	(@OGUID+0, 189331, 571, 1, 1, 3707.753418, -1182.235840, 120.745689, 1.24532, 0, 0, 0, 1, 120, 0, 1);
	
	UPDATE `creature_template` SET `npcflag`=16777216, `unit_flags`=32768, `spell1`=49315, `spell2`=49333, `spell3`=49109, `spell4`=49081 WHERE `entry`=@TANK;
	UPDATE `creature_template` SET `faction` = 1975 WHERE `entry`=27335;
	UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@ENGI, 27607, @TANK);
	
	DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@TANK;
	INSERT INTO `npc_spellclick_spells`(`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
	(@TANK,49078,1,0), -- player
	(@TANK,46598,1,1); -- npc
	
	DELETE FROM `vehicle_template_accessory` WHERE `entry`=@TANK;
	INSERT INTO `vehicle_template_accessory`(`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`,`summontimer`) VALUES
	(@TANK,@ENGI,1,1,"7th Legion Siege Engineer Rides Alliance Steam Tank",5,0),
	(@TANK,@ELITE,2,1,"7th Legion Elite Rides Alliance Steam Tank",5,0),
	(@TANK,@ELITE,3,1,"7th Legion Elite Rides Alliance Steam Tank",5,0);
	DELETE FROM `creature` WHERE `id` IN (27163,27588);
	
	DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`=16 AND `SourceEntry`=@TANK) OR (`SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (@SPELL_2,@SPELL_3))  OR (`SourceTypeOrReferenceId`=18 AND `SourceEntry` IN (46598,49078));
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
	(16,0,@TANK,0,0,23,0,4246,0,0,0,0,'','Dismount player when not in intended zone'),
	(16,0,@TANK,0,1,23,0,4190,0,0,0,0,'','Dismount player when not in intended zone'),
	(16,0,@TANK,0,2,23,0,4188,0,0,0,0,'','Dismount player when not in intended zone'),
	(13,1,@SPELL_2,0,0,31,0,3,27288,0,0,0,'','Ice Prison can target Death Knight Champion'),
	(13,1,@SPELL_2,0,1,31,0,3,27410,0,0,0,'','Ice Prison can target Scourge SeigeSmith'),
	(13,1,@SPELL_2,0,2,31,0,3,27286,0,0,0,'','Ice Prison can target Dreadbone Invader'),
	(13,1,@SPELL_2,0,3,31,0,3,27283,0,0,0,'','Ice Prison can target Risen Winterguarde Mage'),
	(13,2,@SPELL_3,0,0,31,0,3,@ENGI,0,0,0,'','Drop Off Gnome target 7th Legion Siege Engineer'),
	(18,@TANK,46598,0,0,31,0,3,0,0,0,0,'','Only npc for spellclick'),
	(18,@TANK,49078,0,0,9,0,@QUEST,0,0,0,0,'','Required quest active for spellclick');
	
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=3 AND `SourceEntry`=@TANK;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`, `ConditionTarget`, `ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`, `ErrorTextId`,`ScriptName`,`Comment`) VALUES
	(22,3,@TANK,0,1,1,49078,0,0,0,'','event require aura 49078');
	
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=1 AND `SourceEntry`=@ENGI;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`, `ConditionTarget`, `ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`, `ErrorTextId`,`ScriptName`,`Comment`) VALUES
	(22,1,@ENGI,0,1,29,27607,14,0,0,'','event require creature distance');
	
	DELETE FROM `creature_template_addon` WHERE `entry` IN (@ENGI,@ELITE);
	INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
	(@ENGI,0,0,0,257,133,NULL),
	(@ELITE,0,0,0,257,333,NULL);
	
	DELETE FROM `smart_scripts` WHERE `entryorguid` = 27607  AND `source_type` = 0;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = 27607*100  AND `source_type` = 9;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @TANK  AND `source_type` = 0;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @TANK*100  AND `source_type` = 9;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @ENGI  AND `source_type` = 0;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @ENGI*100  AND `source_type` = 9;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @ENGI*100+1  AND `source_type` = 9;
	INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
	(@ENGI, 0, 0, 0, 8, 0, 100, 0, @SPELL_3, 0, 0, 0, 80, @ENGI*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - On spell hit - action list'),
	(@ENGI*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - action list - Set visible off'),
	(@ENGI*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, @ENGI, 3, 18000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - action list - Summon'),
	(@ENGI*100, 9, 2, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 47, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - action list - Set visible on'),
	(@ENGI, 0, 1, 0, 23, 0, 100, 1, 46598, 0, 0, 0, 80, @ENGI*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - Has aura - action list'),
	(@ENGI*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - action list - Talk'),
	(@ENGI*100+1, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - action list - React passif'),
	(@ENGI*100+1, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 29, 3, 0, 0, 0, 0, 0, 19, 27607, 15, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - action list - follow'),
	(@ENGI*100+1, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 11, 49114, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - action list - Cast to summon a GO'),
	(@ENGI*100+1, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - action list - Talk'),
	(@ENGI*100+1, 9, 5, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 75, 49215, 0, 0, 0, 0, 0, 19, 27607, 15, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - action list - Add aura'),
	(@ENGI*100+1, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - action list - Talk'),
	(@ENGI*100+1, 9, 7, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 29, 1, 0, 0, 0, 0, 0, 19, @TANK, 15, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - action list - follow'),
	(@TANK,0,0,0,38,0,100,0,0,1,0,0,11,49122,0,0,0,0,0,23,0,0,0,0,0,0,0,"Tank - On data set- cast spell credit"),
	(@TANK,0,1,0,25,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tank - On reset- react passif"),
	(@TANK,0,2,0,1,0,100,0,30000,30000,50000,50000,1,1,0,0,0,0,0,19,@ELITE,10,0,0,0,0,0,'Tank - OOC - Talk'),
	(@TANK,0,4,0,25,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tank - On reset- Set Run on"),
	(@TANK, 0, 3, 0, 8, 0, 100, 0, @SPELL_4, 0, 0, 0, 80, @TANK*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - On spell hit - action list'),
	(@TANK*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, @ELITE, 10, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - action list - Set visible off'),
	(@TANK*100, 9, 1, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 11, @ELITE, 10, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - action list - Summon'),
	(@TANK*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '7th Legion Siege Engineer - action list - Set visible on'),
	(27607, 0, 1, 0, 23, 0, 100, 1, 49215, 1, 0, 0, 80, 27607*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Plague Wagon - Has aura - action list'),
	(27607*100, 9, 0, 0, 0, 0, 100, 0, 11000, 11000, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, @TANK, 30, 0, 0, 0, 0, 0, 'Plague Wagon - action list - Set data'),
	(27607*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Plague Wagon - action list - despawn');
	
	DELETE FROM `creature_text` WHERE `entry` IN (@ELITE, @ENGI);
	INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
	(@ELITE, 0, 0, 'Without you we''d be lost. Thanks for the ride!', 12, 7, 100, 0, 0, 0, 26844, 0, '7th Legion Elite'),
	(@ELITE, 0, 1, 'For the Alliance and Lord Fordragon!', 12, 7, 100, 0, 0, 0, 26841, 0, '7th Legion Elite'),
	(@ELITE, 0, 2, 'HOO-WAH! The cavalry has arrived!', 12, 7, 100, 0, 0, 0, 26842, 0, '7th Legion Elite'),
	(@ELITE, 0, 3, 'Great driving, soldier! Not a scratch on us!', 12, 7, 100, 0, 0, 0, 26843, 0, '7th Legion Elite'),
	(@ELITE, 1, 0, 'I think I see one of their plague wagons!', 12, 0, 100, 0, 0, 0, 26971, 0, '7th Legion Elite'),
	(@ELITE, 1, 1, 'Did I ever tell you soldiers about the time I destroyed the Thandol Span? Yep, weren''t no dark irons destroyed that bridge! Was me!', 12, 7, 100, 0, 0, 0, 26972, 0, '7th Legion Elite'),
	(@ELITE, 1, 2, 'It doesn''t make any sense. Why don''t they just fly Naxxramas over Wintergarde Keep and blow it up? I mean, that''s what I would do if I were Kel''Thuzad.', 12, 7, 100, 0, 0, 0, 26973, 0, '7th Legion Elite'),
	(@ELITE, 1, 3, 'I wonder if we''ll ever solve the mystery of the strange ore. There''s gotta be some use for it!', 12, 0, 100, 0, 0, 0, 26974, 0, '7th Legion Elite'),
	(@ELITE, 1, 4, 'Hey, do any of you know McGoyver over at Valgarde? He''s my uncle. You know what his title is? Pro. Yea, just "Pro." I want to be a pro too.', 12, 0, 100, 0, 0, 0, 26975, 0, '7th Legion Elite'),
	(@ELITE, 1, 5, 'Something straight up stinks in here! It''s definitely not me. Gnomes smell like butter and sunshine. Not like those dwarves that smell like they were born from a trogg''s armpit! None of you are dwarves, are you?', 12, 0, 100, 0, 0, 0, 26976, 0, '7th Legion Elite'),
	(@ELITE, 1, 6, 'I used to know a dwarf that claimed gnomes evolved from beneath the earth. That we all started out as sand gnomes. What a load of nonsense! Sand gnomes? PUH-LEASE!', 12, 0, 100, 0, 0, 0, 26977, 0, '7th Legion Elite'),
	(@ELITE, 1, 7, 'I''ve never seen destruction like this...', 12, 0, 100, 0, 0, 0, 26978, 0, '7th Legion Elite'),
	(@ELITE, 1, 8, 'Keep the chatter down, people. We need to stay alert!', 12, 0, 100, 0, 0, 0, 26979, 0, '7th Legion Elite'),
	(@ELITE, 1, 9, 'The smell of death covers every inch of this place.', 12, 0, 100, 0, 0, 0, 26980, 0, '7th Legion Elite'),
	(@ELITE, 1, 10, 'Driver, I hear you single handedly airlifted our villagers out of this hell-hole. Is that true?', 12, 0, 100, 0, 0, 0, 26981, 0, '7th Legion Elite'),
	(@ELITE, 1, 11, 'So does anyone know anything about Thel''zan? Who is he? How did he come to leading the Scourge armies on the ground?', 12, 0, 100, 0, 0, 0, 26982, 0, '7th Legion Elite'),
	(@ELITE, 1, 12, 'Look at this mess... The Scourge will pay for this!', 12, 0, 100, 0, 0, 0, 26983, 0, '7th Legion Elite'),
	(@ELITE, 1, 13, 'Where are all the corpses? What have they done to our people?', 12, 0, 100, 0, 0, 0, 26984, 0, '7th Legion Elite'),
	(@ELITE, 1, 14, 'I hope I''m alive to see Arthas get what''s coming to him.', 12, 0, 100, 0, 0, 0, 26985, 0, '7th Legion Elite'),
	(@ELITE, 2, 0, 'Reporting for duty, sir!', 12, 7, 100, 0, 0, 0, 26954, 0, '7th Legion Elite'),
	(@ENGI, 0, 1, 'Keep ''em off me for about 15 seconds and this thing is as good as dead.', 12, 7, 100, 0, 0, 0, 26854, 0, '7th Legion Siege Engineer'),
	(@ENGI, 0, 2, 'Cover me!', 12, 7, 100, 0, 0, 0, 26852, 0, '7th Legion Siege Engineer'),
	(@ENGI, 0, 3, 'When I''m done with this plague wagon it''ll look like a goblin built it! Keep me safe!', 12, 7, 100, 0, 0, 0, 26855, 0, '7th Legion Siege Engineer'),
	(@ENGI, 0, 4, 'Keep the bad guys off me!', 12, 7, 100, 0, 0, 0, 26853, 0, '7th Legion Siege Engineer'),
	(@ENGI, 1, 0, '%s deftly assembles a strange machine.', 16, 7, 100, 0, 0, 0, 26856, 0, '7th Legion Siege Engineer'),
	(@ENGI, 2, 0, 'That oughta do it! Just a few more seconds now.', 12, 7, 100, 0, 0, 0, 26858, 0, '7th Legion Siege Engineer');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Tails up!.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	UPDATE creature_template SET faction=1990 WHERE entry IN(33007, 33008);
	
	-- Female Frost Leopard SAI
	SET @ENTRY := 33010;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,1,0,100,0,0,0,0,0,41,60000,0,0,0,0,0,0,0,0,0,0,0,0,0,"Female Frost Leopard - Out of Combat - Despawn In 60000 ms");
	
	
	-- Female Icepaw Bear SAI
	SET @ENTRY := 33011;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,1,0,100,0,0,0,0,0,41,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Female Icepaw Bear - Out of Combat - Despawn In 60000 ms");
	
	
	
	
	-- Male Frost Leopard SAI
	SET @ENTRY := 33007;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,0,0,100,0,3000,4000,9000,11000,11,54668,0,0,0,0,0,2,0,0,0,0,0,0,0,"Male Frost Leopard - In Combat - Cast 'Rake'"),
	(@ENTRY,0,1,0,1,0,100,0,0,0,0,0,41,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Male Frost Leopard - Out of Combat - Despawn In 20000 ms");
	
	
	-- Male Icepaw Bear SAI
	SET @ENTRY := 33008;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,0,0,100,0,3000,4000,9000,11000,11,54632,0,0,0,0,0,2,0,0,0,0,0,0,0,"Male Icepaw Bear - In Combat - Cast 'Claws of Ice'"),
	(@ENTRY,0,1,0,1,0,100,0,0,0,0,0,41,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Male Icepaw Bear - Out of Combat - Despawn In 20000 ms");
	
	
	
	
	
	
	-- Frost Leopard SAI
	SET @ENTRY := 29327;
	SET @QUEST := 13549;
	SET @GossipLeopard := 54000;
	SET @SPELL_RAKE := 54668;
	SET @SPELL_BLOWGUN := 62105;
	SET @SPELL_SLEEP := 42386; -- Sleeping Sleep
	
	DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100,@ENTRY*100+1,@ENTRY*100+2);
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,0,0,100,0,1000,1000,8000,11000,11,@SPELL_RAKE,0,0,0,0,0,2,0,0,0,0,0,0,0,"Frost Leopard - In Combat - Cast Rake"),
	(@ENTRY,0,1,0,25,0,100,0,0,0,0,0,2,1990,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Reset - Set Faction Back"),
	(@ENTRY,0,2,0,8,0,100,1,@SPELL_BLOWGUN,0,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Spellhit - Run Script"),
	--
	(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script - Set Faction Friendly"),
	(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,11,@SPELL_SLEEP,2,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script - Cast Sleep"),
	(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,81,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script - Set npc_flag Gossip"),
	--
	(@ENTRY,0,3,0,62,0,100,0,@GossipLeopard,0,0,0,88,@ENTRY*100+1,@ENTRY*100+2,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Gossip Select - Run Random Script"),
	--
	(@ENTRY*100+1,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Frost Leopard - Script 1 - Say Line 0"),
	(@ENTRY*100+1,9,1,0,0,0,100,0,1000,1000,0,0,36,33007,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script 1 - Update Template Male"),
	(@ENTRY*100+1,9,2,0,0,0,100,0,0,0,0,0,28,@SPELL_SLEEP,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script 1 - Remove Sleep"),
	(@ENTRY*100+1,9,3,0,0,0,100,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script 1 - Remove OOC Flag"),
	(@ENTRY*100+1,9,4,0,0,0,100,0,0,0,0,0,41,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script 1 - Despawn"),
	--
	(@ENTRY*100+2,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Frost Leopard - Script 2 - Say Line 1"),
	(@ENTRY*100+2,9,1,0,0,0,100,0,0,0,0,0,36,33010,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script 2 - Update Template Female"),
	(@ENTRY*100+2,9,2,0,0,0,100,0,0,0,0,0,28,@SPELL_SLEEP,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script 2 - Remove Sleep"),
	(@ENTRY*100+2,9,3,0,0,0,100,0,0,0,0,0,2,190,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard - On Script 2 - Set Faction 190"),
	(@ENTRY*100+2,9,4,0,0,0,100,0,0,0,0,0,33,33005,0,0,0,0,0,7,0,0,0,0,0,0,0,"Frost Leopard - On Script 2 - Quest Credit"),
	(@ENTRY*100+2,9,5,0,0,0,100,0,0,0,0,0,29,0,0,28527,0,0,0,7,0,0,0,0,0,0,0,"Frost Leopard - On Script 2 - Follow Player"),
	(@ENTRY*100+2,9,6,0,0,0,100,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frost Leopard  - On Script 2 - Despawn");
	
	-- Text
	DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
	INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
	(@ENTRY,0,0,"It's an angry male!",42,0,100,0,0,0,33191,0,"Male Frost Leopard"),
	(@ENTRY,1,0,"It's a female!",     42,0,100,0,0,0,33192,0,"Female Frost Leopard");
	
	-- Male Frost Leopard SAI
	SET @ENTRY := 33007;
	SET @SPELL_RAKE := 54668;
	UPDATE `creature_template` SET faction=1990 WHERE entry=@entry;
	DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100);
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,0,0,100,0,3000,4000,9000,11000,11,@SPELL_RAKE,0,0,0,0,0,2,0,0,0,0,0,0,0,"Male Frost Leopard - In Combat - Cast Rake");
	
	-- Female Frost Leopard
	SET @ENTRY := 33010;
	UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
	
	
	-- Icepaw Bear SAI
	SET @ENTRY := 29319;
	SET @QUEST := 13549;
	SET @GossipBear := 55000;
	SET @SPELL_CLAWS_OF_ICE := 54632;
	SET @SPELL_BLOWGUN := 62105;
	SET @SPELL_SLEEP := 42386; -- Sleeping Sleep
	
	DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100,@ENTRY*100+1,@ENTRY*100+2);
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,0,0,100,0,1000,1000,8000,11000,11,@SPELL_CLAWS_OF_ICE,0,0,0,0,0,2,0,0,0,0,0,0,0,"Icepaw Bear - In Combat - Cast Claws of Ice"),
	(@ENTRY,0,1,0,25,0,100,0,0,0,0,0,2,1990,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Reset - Set Faction Back"),
	(@ENTRY,0,2,0,8,0,100,1,@SPELL_BLOWGUN,0,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Spellhit - Run Script"),
	--
	(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script - Set Faction Friendly"),
	(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,11,@SPELL_SLEEP,2,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script - Cast Sleep"),
	(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,81,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script - Set npc_flag Gossip"),
	--
	(@ENTRY,0,3,0,62,0,100,0,@GossipBear,0,0,0,88,@ENTRY*100+1,@ENTRY*100+2,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Gossip Select - Run Random Script"),
	--
	(@ENTRY*100+1,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Icepaw Bear - Script 1 - Say Line 0"),
	(@ENTRY*100+1,9,1,0,0,0,100,0,1000,1000,0,0,36,33008,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script 1 - Update Template Male"),
	(@ENTRY*100+1,9,2,0,0,0,100,0,0,0,0,0,28,@SPELL_SLEEP,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script 1 - Remove Sleep"),
	(@ENTRY*100+1,9,3,0,0,0,100,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script 1 - Remove OOC Flag"),
	(@ENTRY*100+1,9,4,0,0,0,100,0,0,0,0,0,41,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script 1 - Despawn"),
	--
	(@ENTRY*100+2,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Icepaw Bear - Script 2 - Say Line 1"),
	(@ENTRY*100+2,9,1,0,0,0,100,0,0,0,0,0,36,33011,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script 2 - Update Template Female"),
	(@ENTRY*100+2,9,2,0,0,0,100,0,0,0,0,0,28,@SPELL_SLEEP,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script 2 - Remove Sleep"),
	(@ENTRY*100+2,9,3,0,0,0,100,0,0,0,0,0,2,190,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script 2 - Set faction 190"),
	(@ENTRY*100+2,9,4,0,0,0,100,0,0,0,0,0,33,33006,0,0,0,0,0,7,0,0,0,0,0,0,0,"Icepaw Bear - On Script 2 - Quest Credit"),
	(@ENTRY*100+2,9,5,0,0,0,100,0,0,0,0,0,29,0,0,28527,0,0,0,7,0,0,0,0,0,0,0,"Icepaw Bear - On Script 2 - Follow Player"), 
	(@ENTRY*100+2,9,6,0,0,0,100,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Icepaw Bear - On Script 2 - Despawn");
	
	-- Text
	DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
	INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
	(@ENTRY,0,0,"It's an angry male!",42,0,100,0,0,0,33191,0,"Male Icepaw Bear"),
	(@ENTRY,1,0,"It's a female!",     42,0,100,0,0,0,33192,0,"Female Icepaw Bear"); 
	
	-- Male Icepaw Bear SAI
	SET @ENTRY := 33008;
	SET @SPELL_CLAWS_OF_ICE := 54632;
	UPDATE `creature_template` SET faction=1990 WHERE entry=@entry;
	DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100);
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,0,0,100,0,3000,4000,9000,11000,11,@SPELL_CLAWS_OF_ICE,0,0,0,0,0,2,0,0,0,0,0,0,0,"Male Icepaw Bear - In Combat - Cast Claws of Ice");
	
	-- Female Frost Leopard
	SET @ENTRY := 33011;
	UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
	
	-- Only show gossip if player is on quest Tails Up
	DELETE FROM `conditions` WHERE `SourceGroup` IN (@GossipBear,@GossipLeopard) AND `ConditionValue1`=@QUEST;
	DELETE FROM `conditions` WHERE `SourceEntry` IN (@SPELL_BLOWGUN) AND `ConditionValue1` IN (29327,29319);
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
	(15,@GossipBear,0,0,9,@QUEST,0,0,0,'',"Only show gossip if player is on quest Tails Up"),
	(15,@GossipLeopard,0,0,9,@QUEST,0,0,0,'',"Only show gossip if player is on quest Tails Up");
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Test at the sea.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	SET @ENTRY := 24120;
	UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
	DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
	INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
	(@ENTRY,0,0,1,8,0,100,0,43115,0,25000,25000,33,24121,0,0,0,0,0,7,0,0,0,0,0,0,0,'North Fleet Reservist - On Spellhit ''Plague Vial'' - Quest Credit ''Test at Sea'''),
	(@ENTRY,0,1,0,61,0,80,0,43115,0,25000,25000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'North Fleet Reservist - On Spellhit ''Plague Vial'' - Say Line 0');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Thane of Voldrune.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	UPDATE creature_template SET DamageModifier=1 WHERE entry=27377;
	
	DELETE FROM `smart_scripts` WHERE `entryorguid`=27292 AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
	(27292,0,0,1,62,0,100,0,9512,0,0,0,11,48606,0,0,0,0,0,7,0,0,0,0,0,0,0,'Flamebringer - On gossip select - Spellcast'),
	(27292,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Flamebringer - On gossip select - Close gossip'),
	(27292,0,2,3,54,0,100,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flamebringer - On summon - Remove npcflag'),
	(27292,0,3,4,61,0,100,0,0,0,0,0,85,46598,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flamebringer - On summon - Spellcast'),
	(27292,0,4,0,61,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flamebringer - Linked with previous Event -Set Passive'),
	(27292,0,5,0,28,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flamebringer - On passenger removed - Despawn'); 
	DELETE FROM `creature_template_addon` WHERE `entry`=27292;
	INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
	(27292, 0, 0, 33554432, 0, 0, '55971');
	DELETE FROM `creature_addon` WHERE `guid`=110538;
	INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
	(110538,0,0,0,1,0,'');
	UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=27292;
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\The brothers Bronzebeard.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	SET @CGUID := 200014; -- 80 free guid set by TC
	DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+79;
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
	(@CGUID+0, 30136, 571, 1, 2, 7443.688, -997.967, 791.5563, 5.77704, 0, 0, 0),
	(@CGUID+1, 30136, 571, 1, 2, 7464.026, -982.6368, 796.7954, 5.445427, 0, 0, 0),
	(@CGUID+2, 30136, 571, 1, 2, 7439.698, -1004.994, 791.5581, 5.88176, 0, 0, 0),
	(@CGUID+3, 30136, 571, 1, 2, 7432.88, -996.9908, 538.754, 5.8294, 0, 0, 0),
	(@CGUID+4, 30136, 571, 1, 2, 7440.099, -971.4941, 596.7019, 5.5676, 0, 0, 0),
	(@CGUID+5, 30136, 571, 1, 2, 7443.239, -957.6465, 704.6074, 5.445427, 0, 0, 0),
	(@CGUID+6, 30136, 571, 1, 2, 7436.259, -995.6957, 538.7682, 5.794493, 0, 0, 0),
	(@CGUID+7, 30136, 571, 1, 2, 7453.724, -975.0106, 538.7589, 5.480334, 0, 0, 0),
	(@CGUID+8, 30136, 571, 1, 2, 7453.564, -978.4579, 538.7731, 5.51524, 0, 0, 0),
	(@CGUID+9, 30136, 571, 1, 2, 7432.952, -993.7203, 594.6988, 5.794493, 0, 0, 0),
	(@CGUID+10, 30136, 571, 1, 2, 7470.03, -953.4771, 538.7057, 5.183628, 0, 0, 0),
	(@CGUID+11, 30136, 571, 1, 2, 7509.529, -942.8323, 596.5732, 4.747295, 0, 0, 0),
	(@CGUID+12, 30136, 571, 1, 2, 7512.031, -952.4295, 793.3883, 4.729842, 0, 0, 0),
	(@CGUID+13, 30136, 571, 1, 2, 7522.184, -944.5262, 538.7827, 4.590216, 0, 0, 0),
	(@CGUID+14, 30136, 571, 1, 2, 7567.444, -977.0383, 595.8424, 3.944444, 0, 0, 0),
	(@CGUID+15, 30136, 571, 1, 2, 7587.854, -1034.644, 711.9574, 3.159046, 0, 0, 0),
	(@CGUID+16, 30136, 571, 1, 2, 7496.645, -940.393, 538.7007, 4.886922, 0, 0, 0),
	(@CGUID+17, 30136, 571, 1, 2, 7530.056, -967.2031, 689.8135, 4.45059, 0, 0, 0),
	(@CGUID+18, 30136, 571, 1, 2, 7536.476, -957.3798, 594.0485, 4.39823, 0, 0, 0),
	(@CGUID+19, 30136, 571, 1, 2, 7518.525, -943.5374, 538.7671, 4.642576, 0, 0, 0),
	(@CGUID+20, 30136, 571, 1, 2, 7524.424, -965.8981, 688.9619, 4.537856, 0, 0, 0),
	(@CGUID+21, 30136, 571, 1, 2, 7480.429, -1015.052, 738.4304, 5.707227, 0, 0, 0),
	(@CGUID+22, 30136, 571, 1, 2, 7562.215, -946.9121, 816.2698, 4.18879, 0, 0, 0),
	(@CGUID+23, 30136, 571, 1, 2, 7493.477, -944.535, 596.1667, 4.921828, 0, 0, 0),
	(@CGUID+24, 30136, 571, 1, 2, 7594.04, -1016.391, 710.2169, 3.368485, 0, 0, 0),
	(@CGUID+25, 30136, 571, 1, 2, 7561.688, -985.4562, 696.1497, 3.926991, 0, 0, 0),
	(@CGUID+26, 30493, 571, 1, 2, 7258.688, -865.7031, 924.9865, 5.602507, 0, 0, 0),
	(@CGUID+27, 30502, 571, 1, 2, 7246.357, -866.1553, 924.8257, 0.03490658, 0, 0, 0),
	(@CGUID+28, 30502, 571, 1, 2, 7329.806, -1027.244, 908.9823, 1.902409, 0, 0, 0),
	(@CGUID+29, 30502, 571, 1, 2, 7258.124, -851.6719, 926.1149, 4.869469, 0, 0, 0),
	(@CGUID+30, 30502, 571, 1, 2, 7379.61, -910.0995, 908.1426, 2.670354, 0, 0, 0),
	(@CGUID+31, 30502, 571, 1, 2, 7360.499, -1137.121, 907.58, 1.937315, 0, 0, 0),
	(@CGUID+32, 30502, 571, 1, 2, 7518.664, -1240.335, 913.9808, 3.822271, 0, 0, 0),
	(@CGUID+33, 30502, 571, 1, 2, 7369.898, -1214.435, 904.9849, 0.2268928, 0, 0, 0),
	(@CGUID+34, 30502, 571, 1, 2, 7283.155, -1084.717, 939.2233, 1.762783, 0, 0, 0),
	(@CGUID+35, 30502, 571, 1, 2, 7451.647, -843.4373, 917.2958, 3.246312, 0, 0, 0),
	(@CGUID+36, 30502, 571, 1, 2, 7261.373, -1013.67, 918.5519, 1.413717, 0, 0, 0),
	(@CGUID+37, 30502, 571, 1, 2, 7606.527, -1225.569, 929.4883, 4.29351, 0, 0, 0),
	(@CGUID+38, 30502, 571, 1, 2, 7554.601, -1320.671, 930.3687, 4.660029, 0, 0, 0),
	(@CGUID+39, 30502, 571, 1, 2, 7430.659, -1318.579, 911.7595, 4.468043, 0, 0, 0),
	(@CGUID+40, 30502, 571, 1, 2, 7283.702, -1305.297, 909.7721, 5.88176, 0, 0, 0),
	(@CGUID+41, 30064, 571, 1, 2, 7260.882, -1363.916, 911.7665, 0.4014257, 0, 0, 0),
	(@CGUID+42, 30064, 571, 1, 2, 7294.543, -1239.342, 910.2243, 6.126106, 0, 0, 0),
	(@CGUID+43, 30064, 571, 1, 2, 7447.73, -1222.154, 906.4549, 3.979351, 0, 0, 0),
	(@CGUID+44, 30064, 571, 1, 2, 7021.103, -1281.485, 925.2195, 5.751715, 0, 0, 0),
	(@CGUID+45, 30064, 571, 1, 2, 7366.789, -921.5516, 908.176, 1.151917, 0, 0, 0),
	(@CGUID+46, 30064, 571, 1, 2, 7366.549, -1167.878, 907.7737, 4.276057, 0, 0, 0),
	(@CGUID+47, 30064, 571, 1, 2, 7266.572, -1061.63, 941.623, 3.45743, 0, 0, 0),
	(@CGUID+48, 30064, 571, 1, 2, 7274.531, -973.0413, 919.6902, 3.892084, 0, 0, 0),
	(@CGUID+49, 30064, 571, 1, 2, 7344.521, -1002.784, 907.9092, 1.370535, 0, 0, 0),
	(@CGUID+50, 30504, 571, 1, 2, 7264.177, -1064.293, 941.6094, 1.58825, 0, 0, 0),
	(@CGUID+51, 30504, 571, 1, 2, 7261.539, -1060.268, 942.1428, 1.58825, 0, 0, 0),
	(@CGUID+52, 30504, 571, 1, 2, 7258.846, -1064.966, 941.6843, 1.570796, 0, 0, 0),
	(@CGUID+53, 30504, 571, 1, 2, 7285.515, -995.3761, 915.2917, 1.780236, 0, 0, 0),
	(@CGUID+54, 30504, 571, 1, 2, 7291.571, -993.6209, 915.0613, 1.832596, 0, 0, 0),
	(@CGUID+55, 30504, 571, 1, 2, 7284.015, -942.5671, 919.7255, 1.884956, 0, 0, 0),
	(@CGUID+56, 30504, 571, 1, 2, 7295.979, -986.884, 915.3113, 1.867502, 0, 0, 0),
	(@CGUID+57, 30504, 571, 1, 2, 7297.396, -992.0636, 914.5924, 1.867502, 0, 0, 0),
	(@CGUID+58, 30504, 571, 1, 2, 7290.535, -988.4466, 915.6047, 1.832596, 0, 0, 0),
	(@CGUID+59, 30504, 571, 1, 2, 7288.845, -939.8006, 919.2185, 1.954769, 0, 0, 0),
	(@CGUID+60, 30504, 571, 1, 2, 7284.822, -936.735, 920.152, 1.919862, 0, 0, 0),
	(@CGUID+61, 30504, 571, 1, 2, 7284.391, -990.1196, 915.7115, 1.780236, 0, 0, 0),
	(@CGUID+62, 30504, 571, 1, 2, 7347.897, -934.4936, 908.6702, 2.478368, 0, 0, 0),
	(@CGUID+63, 30504, 571, 1, 2, 7352.746, -928.9537, 908.5024, 2.548181, 0, 0, 0),
	(@CGUID+64, 30504, 571, 1, 2, 7345.77, -927.7479, 909.7731, 2.513274, 0, 0, 0),
	(@CGUID+65, 30504, 571, 1, 2, 7278.971, -906.7933, 926.6701, 2.042035, 0, 0, 0),
	(@CGUID+66, 30504, 571, 1, 2, 7328.465, -894.0953, 920.5985, 2.75762, 0, 0, 0),
	(@CGUID+67, 30504, 571, 1, 2, 7271.211, -905.6917, 927.1619, 1.902409, 0, 0, 0),
	(@CGUID+68, 30504, 571, 1, 2, 7326.755, -908.373, 917.7892, 2.583087, 0, 0, 0),
	(@CGUID+69, 30504, 571, 1, 2, 7330.237, -902.4053, 918.4761, 2.670354, 0, 0, 0),
	(@CGUID+70, 30504, 571, 1, 2, 7281.855, -898.8499, 926.4277, 2.199115, 0, 0, 0),
	(@CGUID+71, 30504, 571, 1, 2, 7284.128, -903.6423, 926.1991, 2.181662, 0, 0, 0),
	(@CGUID+72, 30504, 571, 1, 2, 7273.202, -910.2079, 927.0142, 1.902409, 0, 0, 0),
	(@CGUID+73, 30504, 571, 1, 2, 7321.779, -905.3262, 919.6216, 2.583087, 0, 0, 0),
	(@CGUID+74, 30504, 571, 1, 2, 7276.896, -902.2155, 926.9134, 2.059489, 0, 0, 0),
	(@CGUID+75, 30504, 571, 1, 2, 7333.466, -896.3923, 918.7648, 2.75762, 0, 0, 0),
	(@CGUID+76, 30382, 571, 1, 1, 7525.702, -971.7235, 478.799, 5.637414, 0, 0, 0),
	(@CGUID+77, 30383, 571, 1, 1, 7515.811, -975.2843, 467.4983, 3.857178, 0, 0, 0),
	(@CGUID+78, 30401, 571, 1, 1, 6647.1733, -310.2567, 989.5303, 1.2511, 0, 0, 0),
	(@CGUID+79, 30504, 571, 1, 2, 7325.687, -899.111, 920.3403, 2.758484, 0, 0, 0);
	
	DELETE FROM `creature_template_addon` WHERE `entry`=30493;
	INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
	(30493, 0, 0, 0, 0, 0, '29266');
	
	DELETE FROM `creature_addon` WHERE `guid`=@CGUID+78;
	INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
	(@CGUID+78, 0, 0, 0, 0, 0, '54503'); -- quest invisibility
	
	DELETE FROM `spell_area` WHERE `spell`=55782 AND `area`=4432;
	INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
	(55782, 4432, 12973, 0, 0, 0, 2, 1, 74, 0);
	
	DELETE FROM `spell_area` WHERE `spell`=54504 AND `area`=4428;
	INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
	(54504, 4428, 12973, 0, 0, 0, 2, 1, 10, 0);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	SET @Brann          := 30107; 
	SET @Brann1         := 30382; -- Brann   60888 cosmetic movement
	SET @Brann2         := 30405;
	SET @Machine        := 30134; -- Machine
	SET @Soldier        := 30136; -- Stormforged Soldier  
	Set @Yorg           := 30408; -- Yorg Stormheart spell to summon=56676
	Set @Magni          := 30411; -- Magni Bronzebeard spell to summon=56697
	SET @SPELL1         := 56603;
	SET @Machine2       := 30383; -- Machine static
	
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Soldier AND `source_type` = 0;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann1 AND `source_type` = 0;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann1*100 AND `source_type` = 9;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann2 AND `source_type` = 0;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann2*100 AND `source_type` = 9;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann AND `source_type` = 0;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann*100 AND `source_type` = 9;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann*100+1 AND `source_type` = 9;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Machine AND `source_type` = 0;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Machine*100 AND `source_type` = 9;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Machine2 AND `source_type` = 0;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Yorg AND `source_type` = 0;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Yorg*100 AND `source_type` = 9;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Yorg*100+1 AND `source_type` = 9;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Magni AND `source_type` = 0;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Magni*100 AND `source_type` = 9;
	DELETE FROM `smart_scripts` WHERE `entryorguid` = @Magni*100+1 AND `source_type` = 9;
	INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
	(@Brann1, 0, 0, 0, 19, 0, 100, 0, 12973, 0, 0, 0, 80, @Brann1*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann - On Quest Accept - action list'),
	(@Brann1*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 56558, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann - action liste - cast spell to invoque'),
	(@brann1*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, @Machine2, 20, 0, 0, 0, 0, 0, 'Brann  - On ActionList - despawn'),
	(@brann1*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 44, 3, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Brann  - On ActionList - Set phase 3'),
	(@brann1*100, 9, 3, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann  - On ActionList - despawn'),
	(@Machine, 0, 16, 0, 63, 0, 100, 0, 0, 0, 0, 0, 44, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - Just created - Set phase 3'),
	(@Machine, 0, 0, 0, 27, 0, 100, 0, 0, 0, 0, 0, 80, @Machine*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - On passeger boarded - action list'),
	(@Machine*100, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 53, 1, @Machine, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - action list - start wp'),
	(@Machine*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 19, @Brann, 10, 0, 0, 0, 0, 0, 'Brann - On Script - Set React Passive'),
	(@Machine*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - On Script - Set React Passive'), 
	(@Machine*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 131072, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - On Script - set PACIFIED'),
	(@Soldier, 0, 0, 0, 0, 0, 100, 0, 3000, 3000, 4000, 4000, 11, 56621, 1, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0,0,'Stormforged Soldier - In Combat - Cast Thunder Orb'),
	(@Machine, 0, 1, 0, 40, 0, 100, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
	(@Machine, 0, 2, 0, 40, 0, 100, 0, 4, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
	(@Machine, 0, 3, 0, 40, 0, 100, 0, 7, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
	(@Machine, 0, 4, 0, 40, 0, 100, 0, 22, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
	(@Machine, 0, 5, 0, 40, 0, 100, 0, 27, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
	(@Machine, 0, 6, 0, 40, 0, 100, 0, 31, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
	(@Machine, 0, 7, 0, 40, 0, 100, 0, 35, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
	(@Machine, 0, 8, 0, 40, 0, 100, 0, 36, 0, 0, 0, 1, 7, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
	(@Machine, 0, 9, 0, 40, 0, 100, 0, 41, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
	(@Machine, 0, 10, 11, 40, 0, 100, 0, 42, 0, 0, 0, 11, 68576, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - On waypoint - Eject passengenrs'),
	(@Machine, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 85, 56675, 0, 0, 0, 0, 0, 21, 20, 0, 0, 0, 0, 0, 0, 'Machine - On waypoint - Invoker cast to Spawn Brann'),
	(@Machine, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine  - On waypoint - Despawn'),
	(@Machine, 0, 13, 0, 1, 0, 100, 0, 3000, 3000, 3000, 3000, 86, 56622, 1, 9, @Soldier, 5, 50, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine  - OOC - CROSSCAST'),
	(@Machine, 0, 14, 0, 1, 0, 100, 0, 3000, 3000, 3000, 3000, 86, 55089, 1, 19, @Soldier, 40, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - OOC - CROSSCAST'),
	(@brann2, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 83, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - Just created - Remove npcflag'),
	(@brann2, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @brann2*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - Has aura - action list'),
	(@brann2*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - set run off'),
	(@brann2*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6696.584473, -301.435760, 989.392761, 3.094404, 'brann - ActionList - move to pos'),
	(@brann2*100, 9, 2, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 11, 56676, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList- spawn Yorg'),
	(@brann2*100, 9, 3, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 4, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 5, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 6, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 7, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 8, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 9, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 10, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 11, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 5, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 12, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 13, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 14, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 56697, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - spawn Magni'),
	(@brann2*100, 9, 15, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 16, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 66, 2.662433, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6696.584473, -301.435760, 989.392761, 2.662433, 'brann - ActionList - Set orientation'),
	(@brann2*100, 9, 17, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 6, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 18, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 19, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 7, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 20, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 21, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 8, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 22, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 9, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 23, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 24, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 5, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 25, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 10, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 26, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 27, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 11, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 28, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 6, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 29, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 12, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 30, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 7, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 31, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 32, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 13, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 33, 0, 0, 0, 100, 0, 0, 0, 0, 0, 75, 71385, 0, 0, 0, 0, 0, 11, @Yorg, 20, 0, 0, 0, 0, 0, 'brann - ActionList - add aura'),
	(@brann2*100, 9, 34, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 1, 8, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
	(@brann2*100, 9, 35, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 75, 71385, 0, 0, 0, 0, 0, 11, @Magni, 20, 0, 0, 0, 0, 0, 'brann - ActionList - add aura'),  
	(@brann2*100, 9, 36, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 56742, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - Cast credit spell'),
	(@brann2*100, 9, 37, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6740.549316, -293.961212, 993.427979, 3.559861, 'brann - ActionList - move to pos'),
	(@brann2*100, 9, 38, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann  - On ActionList - despawn'),
	(@Yorg, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @Yorg*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yorg - On spawn - ActionList'),
	(@Yorg*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yorg - ActionList - set run off'),
	(@Yorg*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6692.118164, -301.678192, 989.427734, 6.194374, 'Yorg - ActionList - go to pos'),
	(@Yorg*100, 9, 2, 0, 0, 0, 100, 0, 90000, 90000, 0, 0, 66, 0.579558, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6692.118164, -301.678192, 989.427734, 0.579558, 'Yorg - ActionList - Set orientation'),
	(@Yorg, 0, 1, 0, 23, 0, 100, 1, 71385, 1, 0, 0, 80, @Yorg*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yorg - call timed actionlist when has aura'),
	(@Yorg*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6608.733887, -282.180756, 986.123230, 3.491027, 'Yorg - ActionList - move to pos'),
	(@Yorg*100+1, 9, 1, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yorg  - ActionList - despawn'),
	(@Magni, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @Magni*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni - On Spawn - ActionList'),
	(@Magni*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6694.134766, -297.678925, 989.207092, 4.757878, 'Magni - ActionList - Go to pos'),
	(@Magni*100, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni - ActionList - talk'),
	(@Magni*100, 9, 2, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni - ActionList - talk'),
	(@Magni*100, 9, 3, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 66, 4.757878, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6694.134766, -297.678925, 989.207092, 4.757878, 'Magni - ActionList - Set orientation'),
	(@Magni, 0, 1, 0, 23, 0, 100, 1, 71385, 1, 0, 0, 80, @Magni*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni - call timed actionlist when has aura'),
	(@Magni*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni - ActionList - Set run off'),
	(@Magni*100+1, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6740.549316, -293.961212, 993.427979, 3.559861, 'Magni - ActionList - Go to pos'),
	(@Magni*100+1, 9, 2, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni  - ActionList - despawn');
	
	UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`in (@Brann, @Brann1, @Brann2, @Magni, @Yorg, @Machine, @Machine2);
	UPDATE `creature_template` SET `faction`=2102, `AIName`='SmartAI' WHERE `entry`=@Soldier;
	UPDATE `creature_template` SET `faction`=35, `npcflag`=16777216, `type_flags`=2048, `speed_run`=2.14, `VehicleId`=219, `InhabitType`=4, `RegenHealth`=0 WHERE `entry`=@Machine;
	UPDATE `creature_template` SET `unit_flags`=537166144, `dynamicflags`=32 WHERE  `entry`=30493;
	
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=56621;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
	(13,1,56621,0,0,31,0,3,@Soldier,0,1,0,0,'','Only the Machine is a target for the spell.');
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=56622;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
	(13,1,56622,0,0,31,0,3,@Soldier,0,1,0,0,'','Only the Machine is a target for the spell.');
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@Machine;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
	(22,1,@Machine,0,0,9,0,12973,0,0,0,0,'','Vehicle flying machine require quest 12973');
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=55089;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
	(13,1,55089,0,0,31,0,3,@Machine,0,0,0,0,'','Only the flying machine is a target for the spell.');
	
	DELETE FROM `vehicle_template_accessory` where `entry`= @Machine;
	INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`,`summontimer`)
	VALUES(@Machine,@Brann,0,1,'Brann flying machine',8,0);
	
	DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = @Machine;
	INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
	(@Machine, 43671, 1, 1),
	(@Machine, @SPELL1, 1, 0);
	
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry` IN  (@SPELL1, 43671);
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
	(18,@Machine,@SPELL1,0,0,9,0,12973,0,0,0,0,'','Required quest active for spellclick'),
	(18,@Machine,43671,0,0,31,0,3,0,0,0,0,'','Only npc for spellclick');
	
	DELETE FROM `spell_target_position` WHERE `id`=56558; 
	INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
	(56558, 571, 7515.810059, -975.283997, 478.508027, 3.883507);
	DELETE FROM `spell_target_position` WHERE `id`=56676;
	INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
	(56676, 571, 6668.243164, -300.716309, 989.048035, 0.049131);  
	DELETE FROM `spell_target_position` WHERE `id`=56697;
	INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
	(56697, 571, 6646.655762, -292.56268, 982.318909, 6.077349); 
	
	DELETE FROM `waypoints` WHERE entry=@Machine;
	INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
	(@Machine,1,7482.256, -1010.183, 480.4727,'Brann flying machine'),
	(@Machine,2,7487.624, -1073.279, 486.6947,'Brann flying machine'),
	(@Machine,3,7554.068, -1073.744, 504.4724,'Brann flying machine'),
	(@Machine,4,7540.521, -994.4729, 521.6666,'Brann flying machine'),
	(@Machine,5,7476.892, -979.5384, 539.4715,'Brann flying machine'),
	(@Machine,6,7441.698, -1035.954, 552.1108,'Brann flying machine'),
	(@Machine,7,7471.937, -1091.025, 565.5829,'Brann flying machine'),
	(@Machine,8,7510.604, -1098.736, 585.0275,'Brann flying machine'),
	(@Machine,9,7560.741, -1064.01, 596.1101,'Brann flying machine'),
	(@Machine,10,7558.652, -991.4143, 606.4708,'Brann flying machine'),
	(@Machine,11,7481.208, -966.8239, 614.276,'Brann flying machine'),
	(@Machine,12,7430.998, -1039.164, 622.7203,'Brann flying machine'),
	(@Machine,13,7464.418, -1092.93, 634.8871,'Brann flying machine'),
	(@Machine,14,7535.688, -1088.016, 651.7204,'Brann flying machine'),
	(@Machine,15,7563.452, -1036.534, 661.0538,'Brann flying machine'),
	(@Machine,16,7516.293, -977.355, 676.6924,'Brann flying machine'),
	(@Machine,17,7455.716, -999.9194, 689.1921,'Brann flying machine'),
	(@Machine,18,7447.983, -1050.863, 710.22,'Brann flying machine'),
	(@Machine,19,7518.54, -1090.449, 733.2756,'Brann flying machine'),
	(@Machine,20,7565.333, -1038.004, 745.6921,'Brann flying machine'),
	(@Machine,21,7532.994, -979.3826, 757.9145,'Brann flying machine'),
	(@Machine,22,7434.272, -1013.309, 756.1094,'Brann flying machine'),
	(@Machine,23,7460.686, -1081.453, 775.8036,'Brann flying machine'),
	(@Machine,24,7518.524, -1091.506, 800.887,'Brann flying machine'),
	(@Machine,25,7563.83, -1015.821, 824.6927,'Brann flying machine'),
	(@Machine,26,7485.566, -970.3575, 842.8317,'Brann flying machine'),
	(@Machine,27,7446.667, -1061.756, 867.8871,'Brann flying machine'),
	(@Machine,28,7479.346, -1108.014, 896.2759,'Brann flying machine'),
	(@Machine,29,7534.174, -1115.574, 932.2327,'Brann flying machine'),
	(@Machine,30,7583.952, -1166.912, 949.7326,'Brann flying machine'),
	(@Machine,31,7569.052, -1238.047, 949.7327,'Brann flying machine'),
	(@Machine,32,7505.558, -1260.738, 959.0381,'Brann flying machine'),
	(@Machine,33,7425.231, -1227.18, 965.1213,'Brann flying machine'),
	(@Machine,34,7358.262, -1154.908, 965.1213,'Brann flying machine'),
	(@Machine,35,7316.554, -1004.713, 969.5936,'Brann flying machine'),
	(@Machine,36,7273.263, -897.3846, 973.7048,'Brann flying machine'),
	(@Machine,37,7216.268, -811.6398, 984.3438,'Brann flying machine'),
	(@Machine,38,7148.946, -634.7748, 984.3438,'Brann flying machine'),
	(@Machine,39,7051.731, -506.0969, 984.3438,'Brann flying machine'),
	(@Machine,40,6928.087, -372.7923, 1013.677,'Brann flying machine'),
	(@Machine,41,6820.645, -310.3642, 1017.538,'Brann flying machine'),
	(@Machine,42,6741.966, -291.7396, 996.2623,'Brann flying machine'); 
	
	DELETE FROM `creature_text` WHERE `entry` IN (@Brann, @Yorg, @Magni, @Brann2) ;
	INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES
	(@Brann, 0, 0, 'I can''t thank you enough for all of your help in putting together the keystone. Great things will come of this, I assure you.', 12, 0, 100, 0, 0, 0, 'Brann', 31023),
	(@Brann, 1, 0, 'Iron dwarves... everywhere.... they''re making their way down from the top. They certainly are persistent.', 12, 0, 100, 0, 0, 0, 'Brann', 31024),
	(@Brann, 2, 0, 'They''re trying to take down the plane! I can''t pull up any steeper... you need to keep them off of us!', 12, 0, 100, 0, 0, 0, 'Brann', 31025),
	(@Brann, 3, 0, 'There are more just ahead - keep at it!', 12, 0, 100, 0, 0, 0, 'Brann', 31026),
	(@Brann, 4, 0, 'We''re almost out... just a little bit further.', 12, 0, 100, 0, 0, 0, 'Brann', 31027),
	(@Brann, 5, 0, 'Barring stray boulders from those giants, we should be clear... it seems a mess from down there though.', 12, 0, 100, 0, 0, 0, 'Brann', 31028),
	(@Brann, 6, 0, 'Their numbers are unbelievable... I''m glad to hear King Stormheart came to your aid. I only hear good things of him - I think it''s high time we meet.', 12, 0, 100, 0, 0, 0, 'Brann', 31029),
	(@Brann, 7, 0, 'Poor Creteus. He was a good keeper... I''m glad he at least got to see his task to completion, I imagine that''s all that really mattered to him.', 12, 0, 100, 0, 0, 0, 'Brann', 31030),
	(@Brann, 8, 0, 'We''re coming up on Frosthold. I would be very appreciative if you would introduce me to King Stormeheart before you go. I believe we are both very much in his debt.', 12, 0, 100, 0, 0, 0, 'Brann', 31031),
	(@Brann2, 0, 0, 'By all the gods... it can''t be... Muradin?', 12, 0, 100, 0, 0, 0, 'Brann', 31032),
	(@Brann2, 1, 0, 'Come on boy, there''s no mistak''n it - it''s definately you. Don''t ya recognize your younger brother?', 12, 0, 100, 0, 0, 0, 'Brann', 31033),
	(@Brann2, 2, 0, 'I can''t believe this! You were dead! All accounts said so... what happened, Muradin. How did you get here?', 12, 0, 100, 0, 0, 0, 'Brann', 31034),
	(@Brann2, 3, 0, 'Indeed! Magni will be so happy to see you too! He''s gotten nothing but bad news for a long time now, but this changes everything!', 12, 0, 100, 0, 0, 0, 'Brann', 31035),
	(@Brann2, 4, 0, 'He''s here in Northrend, brother, looking for you. A seer in Wintergarde brought word that you were not dead, and he left Ironforge immediately to come find you.', 12, 0, 100, 0, 0, 0, 'Brann', 31036),
	(@Brann2, 5, 0, 'Speaking of which...', 12, 0, 100, 0, 0, 0, 'Brann', 31087),
	(@Brann2, 6, 0, 'That''s in the past, Muradin. Regrets won''t change anything.', 12, 0, 100, 0, 0, 0, 'Brann', 31096),
	(@Brann2, 7, 0, 'Aye, be safe Muradin. I''d join you, but I''m on top of the most amazing discovery the world has yet seen. I can''t abandon it now.', 12, 0, 100, 0, 0, 0, 'Brann', 31102),
	(@Yorg, 0, 0, 'What''s that? You talkin'' to me, lad?', 12, 0, 100, 0, 0, 0, 'Yorg', 31037),
	(@Yorg, 1, 0, 'My brother... yes... I do have brothers...', 12, 0, 100, 0, 0, 0, 'Yorg', 31038),
	(@Yorg, 2, 0, 'Muradin clutches his head and reels for a moment as the memories rush back to him.', 16, 0, 100, 0, 0, 0, 'Yorg', 31039),
	(@Yorg, 3, 0, '...Brann?', 12, 0, 100, 0, 0, 0, 'Yorg', 31040),
	(@Yorg, 4, 0, 'I... I dunno, Brann. I''ve been ''ere a long time... all I ''ave of me life before this place are flashes and nightmares.', 12, 0, 100, 0, 0, 0, 'Yorg', 31042),
	(@Yorg, 5, 0, 'It''s good te see you though, brother. More than words can say.', 12, 0, 100, 0, 0, 0, 'Yorg', 31043),
	(@Yorg, 6, 0, 'Magn! Forgive me, the memories are comin'' back slowly, brother.', 12, 0, 100, 0, 0, 0, 'Yorg', 31045),
	(@Yorg, 7, 0, 'The frostborn have been very good to me. They''re strong people.', 12, 0, 100, 0, 0, 0, 'Yorg', 31048),
	(@Yorg, 8, 0, 'Not much, Magni. I''ve had nightmares of a human... tall... light hair... death black armor. His name rests on the tip of me tongue, but...', 12, 0, 100, 0, 0, 0, 'Yorg', 31089),
	(@Yorg, 9, 0, '...Arthas.', 12, 0, 100, 0, 0, 0, 'Yorg', 31091),
	(@Yorg, 10, 0, 'Aye, I know. I watched him turn... I watched him give up all that was right and I didn''t lift a hand... I didn''t even consider it until it was too late.', 12, 0, 100, 0, 0, 0, 'Yorg', 31094),
	(@Yorg, 11, 0, 'No... no they won''t. But I can make this right. I have te. I''m goin'' after the boy. I''ll make''m answer for everything he''s done.', 12, 0, 100, 0, 0, 0, 'Yorg', 31097),
	(@Yorg, 12, 0, 'I''m sure, Magni. I''ll see this through, don''t ya worry.', 12, 0, 100, 0, 0, 0, 'Yorg', 31100),
	(@Yorg, 13, 0, 'Go Brann. Bring back an epic tale when we meet again. Farewell for now, brothers...', 12, 0, 100, 0, 0, 0, 'Yorg', 31103),
	(@Magni, 0, 0, 'Look, Lagnus, I consider you a capable man, but my patience is wearing thin. I know that Muradin is here, can you point me to him or not?', 14, 0, 100, 0, 0, 0, 'Magni', 31084),
	(@Magni, 1, 0, 'Brother! There you are! I can barely believe my eyes... you''re alive!', 14, 0, 100, 0, 0, 0, 'Magni', 31085),
	(@Magni, 2, 0, 'It''s so good to see you again, Muradin. And what''s this I heard about you being a King in your own right now? The Bronzebeards were always destined to greatness.', 12, 0, 100, 0, 0, 0, 'Magni', 31086),
	(@Magni, 3, 0, 'So it seems! And you haven''t lost any muscle yourself. Do you remember anything of what happened, Muradin? Fate as turned ill in your absence.', 12, 0, 100, 0, 0, 0, 'Magni', 31088),
	(@Magni, 4, 0, 'Magni nods.', 16, 0, 100, 0, 0, 0, 'Magni', 31092),
	(@Magni, 5, 0, 'He''s not the boy of your memories anymore, Muradin. He''s become something else entirely.', 12, 0, 100, 0, 0, 0, 'Magni', 31093),
	(@Magni, 6, 0, 'Are you sure Muradin? I just got you back after years of thinking you were dead. I do not want to lose you again.', 12, 0, 100, 0, 0, 0, 'Magni', 31099),
	(@Magni, 7, 0, 'So be it then. I have to return to my people, brothers. Come back to me in one piece.', 12, 0, 100, 0, 0, 0, 'Magni', 31101),
	(@Magni, 8, 0, '...farewell brother.', 12, 0, 100, 0, 0, 0, 'Magni', 31129);
	
	UPDATE `gameobject` SET `phaseMask`=7 WHERE id=195308;
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\The Drakkensryd.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- assign core-script to drake riders and delete EventAI
	UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_hyldsmeet_drakerider' WHERE `entry` =29694;
	 
	-- prevent ornaments from falling down
	UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` =29754;
	 
	-- drake riders despawn immediately after death
	UPDATE `vehicle_template_accessory` SET `summontype` = 5 WHERE `entry` =29625 AND `seat_id` =1;
	 
	-- there are problems with fights on moving vehicles, so disbale movement of drakes
	UPDATE `creature` SET `MovementType` = 0 WHERE `id` =29625;
	
	
	
	UPDATE creature_template SET scriptname="npc_gretta_the_arbiter" WHERE entry=29796;
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\The Earthbinder.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- 
	-- DB/Quest: The Earthbinder
	-- Tola'thion SAI
	SET @ENTRY := 19293;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,19,0,100,0,10349,0,0,0,45,1,0,0,0,0,0,19,19294,50,0,0,0,0,0,"Tola'thion - On Quest 'The Earthbinder' Taken - Set Data 1 0");
	
	-- Earthbinder Galandria Nightbreeze SAI
	SET @ENTRY := 19294;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,38,0,100,0,1,0,0,0,1,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Data Set 1 0 - Say Line 0"),
	(@ENTRY,0,1,2,20,0,100,0,10349,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Quest 'The Earthbinder' Finished - Run Script"),
	(@ENTRY,0,2,5,61,0,100,0,10349,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Quest 'The Earthbinder' Finished - Set Active On"),
	(@ENTRY,0,3,0,38,0,100,0,2,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Data Set 2 0 - Run Script"),
	(@ENTRY,0,4,0,11,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Respawn - Set Npc Flags Gossip & Questgiver"),
	(@ENTRY,0,5,0,61,0,100,0,10349,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Quest 'The Earthbinder' Finished - Set Run Off");
	
	-- Actionlist SAI
	SET @ENTRY := 1929400;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,9,0,0,0,0,100,0,3000,3000,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Set Npc Flag "),
	(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Set Orientation Closest Player"),
	(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Say Line 1"),
	(@ENTRY,9,3,0,0,0,100,0,6000,6000,0,0,69,0,0,0,0,0,0,8,0,0,0,-286.7666,4729.429,18.4418,1.727876,"Earthbinder Galandria Nightbreeze - On Script - Move To Position"),
	(@ENTRY,9,4,0,0,0,100,0,11000,11000,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Play Emote 16"),
	(@ENTRY,9,5,0,0,0,100,0,3000,3000,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Play Emote 0"),
	(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,50,184450,60,0,0,0,0,8,0,0,0,-287.0193,4731.628,18.21704,2.583081,"Earthbinder Galandria Nightbreeze - On Script - Summon Gameobject 'Crimson Crystal Shard'"),
	(@ENTRY,9,7,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Earthbinder Galandria Nightbreeze - On Script - Say Line 2"),
	(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,12,20599,3,60000,1,0,0,8,0,0,0,-288.1897,4733.63,18.29823,5.044002,"Earthbinder Galandria Nightbreeze - On Script - Summon Creature 'Lured Colossus'");
	
	-- Actionlist SAI
	SET @ENTRY := 1929401;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-294.765991,4715.080078,28.186199,0.209440,"On Script - Move To Position"),
	(@ENTRY,9,1,0,0,0,100,0,13000,13000,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0.209440,"On Script - Set Orientation Home Position"),
	(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Npc Flags Gossip & Questgiver");
	
	-- Lured Colossus SAI
	SET @ENTRY := 20599;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,0,6,0,100,0,0,0,0,0,45,2,0,0,0,0,0,19,19294,50,0,0,0,0,0,"Lured Colossus - On Just Died - Set Data 2 0");
	
	DELETE FROM `creature_text` WHERE `entry`=19294;
	INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
	(19294, 0, 0, 'Up here on the hill, $n.', 15, 0, 100, 0, 0, 0, 18293, 0, 'Earthbinder Galandria Nightbreeze'),
	(19294, 1, 0, 'I have an idea.  Let\'s plant this shard in the ground and see what happens', 12, 0, 100, 0, 0, 0, 18289, 0, 'Earthbinder Galandria Nightbreeze'),
	(19294, 2, 0, 'The evil emanating from the crystal shard has lured one of the colossi.  Put it down quick!', 12, 0, 100, 0, 0, 0, 18291, 0, 'Earthbinder Galandria Nightbreeze');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\Thrusting Hodir's Spear Daily.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Quest: Thrusting Hodir's Spear - 13003
	SET @entry := 30275;
	
	UPDATE `creature_template` SET `unit_flags` = '32896', `ScriptName` = 'npc_wild_wyrm' WHERE `entry` =@entry;
	
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN(13,17) AND `SourceEntry` IN(56673,56671);
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
	('13', '1', '56673', '0', '0', '31', '0', '3', @entry, '0', '0', '0', '0', '', 'Fight Wyrm can be casted on Wild Wyrm'),
	('17', '0', '56671', '0', '0', '31', '1', '3', @entry, '0', '0', '0', '0', '', 'Spear of Hodir can only casted on Wild Wyrm');
	
	DELETE FROM `spell_script_names` WHERE `spell_id` IN (56689, 60533, 56690, 60586, 60864, 60776, 56705, 60881);
	INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
	('56689', 'spell_grip'),
	('60533', 'spell_grab_on'),
	('56690', 'spell_thrust_spear'),
	('60586', 'spell_mighty_spear_thrust'),
	('60864', 'spell_jaws_of_death_and_spell_claw_swipe_damage'),
	('60776', 'spell_jaws_of_death_and_spell_claw_swipe_damage'),
	('56705', 'spell_claw_swipe_check'),
	('60881', 'spell_fatal_strike');
	
	DELETE FROM `creature_text` WHERE `entry` =@entry;
	INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES
	(@entry, '0', '0', '%s swipes at you with his claws!', '42', '0', '100', '0', '0', '0', '', '32763'),
	(@entry, '1', '0', 'DODGED!', '42', '0', '100', '0', '0', '0', '', '32794'),
	(@entry, '2', '0', '%s shrieks in pain and twists around, grabbing you with his mouth!', '42', '0', '100', '0', '0', '0', '', '32813'),
	(@entry, '3', '0', 'Your Grip is Failing!', '42', '0', '100', '0', '0', '0', '', '32784'),
	(@entry, '4', '0', 'FATAL STRIKE MISSED! KEEP PRYING!', '42', '0', '100', '0', '0', '0', '', '32795');
	
	DELETE FROM `waypoint_data` WHERE `id`=@entry;
	INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
	(@entry, '1', '7318.73', '-2526.11', '1017.82', '0', '0', '0', '0', '100', '0'),
	(@entry, '2', '7232.49', '-2807.07', '1152.16', '0', '0', '0', '0', '100', '0'),
	(@entry, '3', '6875.99', '-3078.42', '1092.29', '0', '0', '0', '0', '100', '0'),
	(@entry, '4', '7126.63', '-3304.31', '1002.14', '0', '0', '0', '0', '100', '0'),
	(@entry, '5', '7303.03', '-3031.33', '1006.74', '0', '0', '0', '0', '100', '0'),
	(@entry, '6', '7297.66', '-2765.56', '886.85', '0', '0', '0', '0', '100', '0');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\We call him Steelfeather.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Steelfeather SAI
	SET @ENTRY := 24514;
	UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
	DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
	INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
	(@ENTRY,0,0,1,8,0,100,0,43969,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - On Spellhit 'Feathered Charm' - Set Faction 35"),
	(@ENTRY,0,1,2,61,0,100,0,43969,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - On Spellhit 'Feathered Charm' - Set Reactstate Passive"),
	(@ENTRY,0,2,3,61,0,100,0,43969,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - On Spellhit 'Feathered Charm' - Stop Attacking"),
	(@ENTRY,0,3,4,61,0,100,0,43969,0,0,0,69,0,0,0,0,0,0,8,0,0,0,2574.59,-5223.03,380.069,3.52568,"Steelfeather - On Spellhit 'Feathered Charm' - Move To Position"),
	(@ENTRY,0,4,0,61,0,100,0,43969,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - On Spellhit 'Feathered Charm' - Set Event Phase 1"),
	(@ENTRY,0,5,6,0,1,100,1,8000,8000,0,0,33,24515,0,0,0,0,0,7,0,0,0,0,0,0,0,"Steelfeather - In Combat - Quest Credit 'We Call Him Steelfeather' (Phase 1) (No Repeat)"),
	(@ENTRY,0,6,0,61,1,100,1,8000,8000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Steelfeather - In Combat - Despawn Instant (Phase 1) (No Repeat)"),
	(@ENTRY,0,7,0,0,0,100,0,3400,500,12400,14500,11,49865,0,0,0,0,0,2,0,0,0,0,0,0,0,"Steelfeather - In Combat - Cast 'Eye Peck'"),
	(@ENTRY,0,8,0,0,0,100,0,2400,4000,8000,11400,11,18144,0,0,0,0,0,2,0,0,0,0,0,0,0,"Steelfeather - In Combat - Cast 'Swoop'");
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\quests\What Do You Feed a Yeti Anyway.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	--
	DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=66741;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
	(17,0,66741,0,0,40,0,0,0,0,0,0,0,'','Chum the Water can only be used in water');
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\vendors\pvp_vendors_season6.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Season 6 capital cities configuration for both horde and alliance.
	
	-- Stormwind 
	
	-- 34082 Moonstrike (Hatefull)
	-- 34073 Captain dirgehammer (Deadly Gladiator)
	-- 34076 Lieutenant Tristia (Furious)
	
	
	
	-- Orgrimmar
	
	-- 34061 Blood guard (Hatefull)
	-- 34036 Sergeant Thunderhorn (Deadly Gladiator)
	-- 34058 Doris Volanthius. (Furious)
	
	
	-- Horde needs to have the items added, alliance does not.
	
	-- Add to Blood Guard Zar'Shi Hatefull gear.
	DELETE FROM npc_vendor WHERE entry=34061;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40781, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40782, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40783, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40801, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40802, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40803, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40819, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40820, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40821, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40840, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40841, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40842, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40859, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40860, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40861, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40904, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40925, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40931, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40937, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40961, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40988, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40989, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 40999, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41005, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41011, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41017, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41025, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41031, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41036, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41042, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41079, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41085, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41135, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41141, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41149, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41155, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41162, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41203, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41209, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41215, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41273, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41279, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41284, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41291, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41296, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41302, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41308, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41314, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41319, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41325, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41648, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41653, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41659, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41665, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41670, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41676, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41681, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41713, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41765, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41771, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41852, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41857, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41862, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41867, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41872, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41913, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41919, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41925, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41931, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41938, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41944, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41950, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41957, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41963, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41969, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 41991, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 42001, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 42003, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 42009, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34061, 0, 42015, 0, 0, 2560);
	
	
	
	
	
	
	
	
	
	-- Add Deadly Gladiator to Sergean Thunderhorn.
	DELETE FROM npc_vendor WHERE entry=34036;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 40879, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 40880, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 40888, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 40974, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 40975, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 40982, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41048, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41054, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41059, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41064, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41069, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41074, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41224, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41229, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41234, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41616, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41620, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41624, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41629, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41634, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41639, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41831, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41835, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41839, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41880, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41884, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41892, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41897, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41902, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 41908, 0, 0, 2560);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42027, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42028, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42029, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42030, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42031, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42032, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42033, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42062, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42063, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42064, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42065, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42066, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42067, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42068, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42110, 0, 0, 2605);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42112, 0, 0, 2605);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42114, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42115, 0, 0, 2561);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42123, 0, 0, 2605);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42128, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42129, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42130, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42131, 0, 0, 2559);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42132, 0, 0, 2559);
	
	
	
	
	
	-- Add Furious to Doris Volanthius.
	
	DELETE FROM npc_vendor WHERE entry=34058;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 40881, 0, 0, 2615);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 40882, 0, 0, 2616);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 40889, 0, 0, 2614);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 40976, 0, 0, 2615);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 40977, 0, 0, 2616);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 40983, 0, 0, 2614);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41051, 0, 0, 2615);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41055, 0, 0, 2616);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41060, 0, 0, 2614);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41065, 0, 0, 2614);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41070, 0, 0, 2615);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41075, 0, 0, 2616);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41225, 0, 0, 2614);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41230, 0, 0, 2616);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41235, 0, 0, 2615);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41617, 0, 0, 2615);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41621, 0, 0, 2616);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41625, 0, 0, 2614);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41630, 0, 0, 2615);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41635, 0, 0, 2616);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41640, 0, 0, 2614);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41832, 0, 0, 2615);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41836, 0, 0, 2616);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41840, 0, 0, 2614);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41881, 0, 0, 2615);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41885, 0, 0, 2616);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41893, 0, 0, 2614);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41898, 0, 0, 2615);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41903, 0, 0, 2616);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41909, 0, 0, 2614);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42034, 0, 0, 2617);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42035, 0, 0, 2617);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42036, 0, 0, 2617);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42037, 0, 0, 2617);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42038, 0, 0, 2617);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42039, 0, 0, 2617);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42040, 0, 0, 2617);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42069, 0, 0, 2619);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42070, 0, 0, 2619);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42071, 0, 0, 2619);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42072, 0, 0, 2619);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42073, 0, 0, 2619);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42074, 0, 0, 2619);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42075, 0, 0, 2619);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42116, 0, 0, 2618);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42117, 0, 0, 2618);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42124, 0, 0, 2568);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 46373, 0, 0, 2617);
	
	
	
	-- select * from creature where ID IN (34082, 34073, 34076,34061, 34036, 34058)
	
	DELETE FROM creature WHERE ID IN (34082, 34073, 34076,34061, 34036, 34058);
	DELETE FROM creature WHERE guid BETWEEN 73491 AND 73496;
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (73491, 34036, 1, 1, 1, 0, 1, 1669.07, -4196.91, 56.3827, 3.88096, 300, 0, 0, 11828, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (73492, 34058, 1, 1, 1, 0, 0, 1673.14, -4201.82, 56.3827, 3.70533, 300, 0, 0, 8100, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (73493, 34061, 1, 1, 1, 0, 1, 1670.29, -4199.28, 56.3827, 3.88096, 300, 0, 0, 11828, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (73494, 34073, 0, 1, 1, 0, 1, -8781.22, 419.851, 105.233, 6.08929, 300, 0, 0, 11828, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (73495, 34076, 0, 1, 1, 0, 0, -8773.77, 425.704, 105.233, 5.14594, 300, 0, 0, 7048, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (73496, 34082, 0, 1, 1, 0, 1, -8775.67, 423.958, 105.233, 5.36716, 300, 0, 0, 11828, 0, 0, 0, 0, 0);
	
	
	-- Attach the A/H capital vendors to the arena season 6, event entry 58. Only spawn them if this event is active.
	DELETE FROM game_event_creature WHERE guid BETWEEN 73491 AND 73496;
	INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES (58, 73491);
	INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES (58, 73492);
	INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES (58, 73493);
	INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES (58, 73494);
	INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES (58, 73495);
	INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES (58, 73496);
	
	
	
	
	
	
	-- Medalion of the Horde 
	
	
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34036, 0, 42122, 0, 0, 2605);
	
	DELETE FROM npc_vendor WHERE entry=34058 AND item=42126;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42126, 0, 0, 2965);
	
	
	UPDATE npc_vendor SET ExtendedCost=2965 WHERE entry=34076 AND item=42124;
	
	
	
	-- Wintergrasp.
	
	
	
	-- Stone Guard Mukar [H]
	
	DELETE FROM npc_vendor WHERE entry=32296;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41727, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41728, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41730, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41732, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41733, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41734, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41735, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41736, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41737, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41738, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41739, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41740, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41742, 0, 0, 2482);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41743, 0, 0, 2482);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 41744, 0, 0, 2482);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44066, 0, 0, 2545);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44067, 0, 0, 2546);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44068, 0, 0, 2546);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44069, 0, 0, 2549);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44075, 0, 0, 2549);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44076, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44077, 0, 0, 2552);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44078, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44081, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44082, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44084, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44087, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44088, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44089, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44091, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44092, 0, 0, 2543);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44093, 0, 0, 2543);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44094, 0, 0, 2544);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44095, 0, 0, 2543);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44096, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44097, 0, 0, 2544);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44099, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44100, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44101, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44102, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44103, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44105, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44107, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44115, 0, 0, 2546);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44891, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44892, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44893, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44894, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44895, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44896, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44897, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44898, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44899, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44900, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44901, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44902, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44903, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44904, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44905, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44906, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44907, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44908, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44909, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44910, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44912, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 44914, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46057, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46058, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46059, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46060, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46061, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46062, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46063, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46064, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46065, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46066, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46071, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46072, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46073, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46074, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46075, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46076, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46077, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46078, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46079, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46080, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46081, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46082, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46083, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46084, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46085, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46086, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46087, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 46088, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48974, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48975, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48976, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48977, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48978, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48979, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48980, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48981, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48982, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48983, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48987, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48988, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48990, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48991, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48992, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48993, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48994, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48997, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48998, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 48999, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32296, 0, 49000, 0, 0, 2577);
	
	
	
	
	
	
	
	
	
	
	
	-- Knight Dameron [A]
	
	DELETE FROM npc_vendor WHERE entry=32294;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41727, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41728, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41730, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41732, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41733, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41734, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41735, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41736, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41737, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41738, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41739, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41740, 0, 0, 2481);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41742, 0, 0, 2482);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41743, 0, 0, 2482);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 41744, 0, 0, 2482);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 43956, 0, 0, 2552);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44066, 0, 0, 2545);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44067, 0, 0, 2546);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44068, 0, 0, 2546);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44069, 0, 0, 2549);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44075, 0, 0, 2549);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44076, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44078, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44081, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44082, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44084, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44087, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44088, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44089, 0, 0, 2547);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44091, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44092, 0, 0, 2543);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44093, 0, 0, 2543);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44094, 0, 0, 2544);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44095, 0, 0, 2543);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44096, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44098, 0, 0, 2544);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44099, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44100, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44101, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44102, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44103, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44105, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44107, 0, 0, 2542);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44115, 0, 0, 2546);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44891, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44892, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44893, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44894, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44895, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44896, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44897, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44898, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44899, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44900, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44901, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44902, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44903, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44904, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44905, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44906, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44907, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44908, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44909, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44910, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44912, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 44914, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46057, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46058, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46059, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46060, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46061, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46062, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46063, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46064, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46065, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46066, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46071, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46072, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46073, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46074, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46075, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46076, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46077, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46078, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46079, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46080, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46081, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46082, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46083, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46084, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46085, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46086, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46087, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 46088, 0, 0, 2578);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48974, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48975, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48976, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48977, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48978, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48979, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48980, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48981, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48982, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48983, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48987, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48988, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48990, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48991, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48992, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48993, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48994, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48997, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48998, 0, 0, 2579);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 48999, 0, 0, 2577);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32294, 0, 49000, 0, 0, 2577);
	
	
	
	
	-- [A] Arcanist Firael <Legacy Justice Quartermaster>
	
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33964, 0, 40864, 0, 0, 2631);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33964, 0, 41216, 0, 0, 2631);
	
	
	-- [H] Magister Sarien <Legacy Justice Quartermaster>
	
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33963, 0, 40864, 0, 0, 2631);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33963, 0, 41216, 0, 0, 2631);
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\vendors\vendors_progression_tier8.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	-- Tier 8
	
	-- Paladesse, Dalaran - Cloth.
	
	-- SELECT * FROM npc_vendor WHERE entry=28995 AND item=46190;
	
	DELETE FROM npc_vendor WHERE entry=28995 AND item IN (45365,45367,45368,45369,45386,45387,45388,45389,45390,45391,45392,45393,45394,45395,45417,45419,45420,45421,45422,45831,45840,45848,46129,46130,46131,46132,46133,46134,46135,46136,46137,46139,46140,46163,46165,46168,46170,46172,46188,46190,46193,46195,46197);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45365, 0, 0, 2668);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45367, 0, 0, 2664);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45368, 0, 0, 2666);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45369, 0, 0, 2662);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45386, 0, 0, 2648);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45387, 0, 0, 2640);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45388, 0, 0, 2644);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45389, 0, 0, 2646);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45390, 0, 0, 2642);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45391, 0, 0, 2648);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45392, 0, 0, 2640);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45393, 0, 0, 2642);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45394, 0, 0, 2644);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45395, 0, 0, 2646);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45417, 0, 0, 2648);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45419, 0, 0, 2640);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45420, 0, 0, 2644);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45421, 0, 0, 2646);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45422, 0, 0, 2642);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45831, 0, 0, 2607);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45840, 0, 0, 2607);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 45848, 0, 0, 2630);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46129, 0, 0, 2669);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46130, 0, 0, 2667);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46131, 0, 0, 2660);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46132, 0, 0, 2661);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46133, 0, 0, 2665);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46134, 0, 0, 2663);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46135, 0, 0, 2641);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46136, 0, 0, 2643);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46137, 0, 0, 2647);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46139, 0, 0, 2645);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46140, 0, 0, 2649);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46163, 0, 0, 2641);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46165, 0, 0, 2643);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46168, 0, 0, 2647);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46170, 0, 0, 2645);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46172, 0, 0, 2649);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46188, 0, 0, 2641);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46190, 0, 0, 2643);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46193, 0, 0, 2647);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46195, 0, 0, 2645);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28995, 0, 46197, 0, 0, 2649);
	
	
	
	-- Bragund Brightlink, Dalaran. Leather and mail.
	
	DELETE FROM npc_vendor WHERE entry=29523 AND item IN (45360,45361,45362,45363,45364,45401,45402,45403,45404,45405,45406,45408,45409,45410,45411,45412,45413,45414,45415,45416,45827,45828,45836,45837,45844,45845,46141,46142,46143,46144,46145,46198,46199,46200,46201,46202,46203,46204,46205,46206,46207,46208,46209,46210,46211,46212);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45360, 0, 0, 2650);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45361, 0, 0, 2658);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45362, 0, 0, 2654);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45363, 0, 0, 2652);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45364, 0, 0, 2656);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45401, 0, 0, 2650);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45402, 0, 0, 2658);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45403, 0, 0, 2654);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45404, 0, 0, 2652);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45405, 0, 0, 2656);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45406, 0, 0, 2650);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45408, 0, 0, 2658);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45409, 0, 0, 2654);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45410, 0, 0, 2652);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45411, 0, 0, 2656);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45412, 0, 0, 2658);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45413, 0, 0, 2656);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45414, 0, 0, 2650);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45415, 0, 0, 2652);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45416, 0, 0, 2654);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45827, 0, 0, 2607);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45828, 0, 0, 2607);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45836, 0, 0, 2607);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45837, 0, 0, 2607);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45844, 0, 0, 2630);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 45845, 0, 0, 2630);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46141, 0, 0, 2657);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46142, 0, 0, 2651);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46143, 0, 0, 2659);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46144, 0, 0, 2655);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46145, 0, 0, 2653);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46198, 0, 0, 2657);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46199, 0, 0, 2651);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46200, 0, 0, 2651);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46201, 0, 0, 2659);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46202, 0, 0, 2655);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46203, 0, 0, 2653);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46204, 0, 0, 2653);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46205, 0, 0, 2657);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46206, 0, 0, 2657);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46207, 0, 0, 2651);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46208, 0, 0, 2655);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46209, 0, 0, 2659);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46210, 0, 0, 2655);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46211, 0, 0, 2653);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (29523, 0, 46212, 0, 0, 2659);
	
	
	-- Dubin Clay, Dalaran. Plate.
	
	-- Spawn him.
	DELETE FROM creature WHERE id=34252;
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
	(85237, 34252, 571, 1, 1, 29145, 0, 5917.98, 670.213, 643.579, 3.94444, 180, 0, 0, 1, 0, 0, 0, 0, 0);
	
	DELETE FROM npc_vendor WHERE entry=34252;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45335, 0, 0, 2666);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45336, 0, 0, 2668);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45337, 0, 0, 2660);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45338, 0, 0, 2664);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45339, 0, 0, 2662);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45340, 0, 0, 2666);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45341, 0, 0, 2660);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45342, 0, 0, 2668);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45343, 0, 0, 2664);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45344, 0, 0, 2662);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45370, 0, 0, 2640);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45371, 0, 0, 2644);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45372, 0, 0, 2648);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45373, 0, 0, 2642);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45374, 0, 0, 2646);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45375, 0, 0, 2646);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45376, 0, 0, 2640);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45377, 0, 0, 2648);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45379, 0, 0, 2644);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45380, 0, 0, 2642);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45381, 0, 0, 2646);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45382, 0, 0, 2648);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45383, 0, 0, 2640);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45384, 0, 0, 2644);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45385, 0, 0, 2642);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45424, 0, 0, 2656);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45425, 0, 0, 2658);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45426, 0, 0, 2650);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45427, 0, 0, 2654);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45428, 0, 0, 2652);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45429, 0, 0, 2656);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45430, 0, 0, 2650);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45431, 0, 0, 2658);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45432, 0, 0, 2654);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 45433, 0, 0, 2652);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46111, 0, 0, 2667);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46113, 0, 0, 2661);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46115, 0, 0, 2669);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46116, 0, 0, 2665);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46117, 0, 0, 2663);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46118, 0, 0, 2667);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46119, 0, 0, 2661);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46120, 0, 0, 2669);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46121, 0, 0, 2665);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46122, 0, 0, 2663);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46146, 0, 0, 2657);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46148, 0, 0, 2651);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46149, 0, 0, 2653);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46150, 0, 0, 2655);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46151, 0, 0, 2659);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46152, 0, 0, 2643);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46153, 0, 0, 2645);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46154, 0, 0, 2647);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46155, 0, 0, 2641);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46156, 0, 0, 2649);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46162, 0, 0, 2657);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46164, 0, 0, 2651);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46166, 0, 0, 2659);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46167, 0, 0, 2653);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46169, 0, 0, 2655);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46173, 0, 0, 2647);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46174, 0, 0, 2641);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46175, 0, 0, 2649);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46176, 0, 0, 2645);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46177, 0, 0, 2643);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46178, 0, 0, 2647);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46179, 0, 0, 2641);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46180, 0, 0, 2649);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46181, 0, 0, 2645);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34252, 0, 46182, 0, 0, 2643);
	
	--  Valerie Langrom, Dalaran. Leather.
	
	DELETE FROM npc_vendor WHERE entry=28992 AND item IN (45345,45346,45347,45348,45349,45351,45352,45353,45354,45355,45356,45357,45358,45359,45396,45397,45398,45399,45400,45829,45830,45838,45839,45846,45847,46123,46124,46125,46126,46127,46157,46158,46159,46160,46161,46183,46184,46185,46186,46187,46189,46191,46192,46194,46196,46313);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45345, 0, 0, 2660);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45346, 0, 0, 2668);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45347, 0, 0, 2664);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45348, 0, 0, 2666);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45349, 0, 0, 2662);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45351, 0, 0, 2660);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45352, 0, 0, 2662);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45353, 0, 0, 2664);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45354, 0, 0, 2666);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45355, 0, 0, 2660);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45356, 0, 0, 2668);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45357, 0, 0, 2664);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45358, 0, 0, 2666);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45359, 0, 0, 2662);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45396, 0, 0, 2666);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45397, 0, 0, 2660);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45398, 0, 0, 2668);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45399, 0, 0, 2664);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45400, 0, 0, 2662);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45829, 0, 0, 2607);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45830, 0, 0, 2607);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45838, 0, 0, 2607);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45839, 0, 0, 2607);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45846, 0, 0, 2630);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 45847, 0, 0, 2630);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46123, 0, 0, 2667);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46124, 0, 0, 2661);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46125, 0, 0, 2669);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46126, 0, 0, 2665);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46127, 0, 0, 2663);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46157, 0, 0, 2663);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46158, 0, 0, 2661);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46159, 0, 0, 2667);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46160, 0, 0, 2665);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46161, 0, 0, 2669);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46183, 0, 0, 2661);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46184, 0, 0, 2669);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46185, 0, 0, 2665);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46186, 0, 0, 2667);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46187, 0, 0, 2663);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46189, 0, 0, 2661);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46191, 0, 0, 2669);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46192, 0, 0, 2665);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46194, 0, 0, 2667);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46196, 0, 0, 2663);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (28992, 0, 46313, 0, 0, 2668);
	
	
	-- Arcanist Firael, Dalaran. Emblem of Conquest vendor.
	
	DELETE FROM creature WHERE id=33964;
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
	(85224, 33964, 571, 1, 1, 28987, 1, 5762.13, 731.637, 653.748, 2.47837, 180, 0, 0, 1, 0, 0, 0, 0, 0);
	
	
	-- Harold Winston Dalaran, Jewelry.
	
	DELETE FROM npc_vendor WHERE entry=32172 AND item IN (48954,48955,48956,48957);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 48954, 0, 0, 2702);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 48955, 0, 0, 2703);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 48956, 0, 0, 2704);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 48957, 0, 0, 2705);
	
	
	
	
	-- Delete the items from Marshal Magruder and Champion Ros'slai in Wintergrasp. They have high gear.
	
	DELETE FROM npc_vendor WHERE entry IN(39173, 39172);
	
	
	
	
	-- Delete some of the npcs with ToC and ICC gear.
	DELETE FROM creature WHERE id IN(35497, 35500, 37942, 35494, 35496, 35498, 35495, 37941);
	
	
	-- Kirin Tor Ring
	DELETE FROM npc_vendor WHERE entry=32172;
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 36919, 0, 0, 2706);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 36922, 0, 0, 2706);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 36925, 0, 0, 2706);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 36928, 0, 0, 2484);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 36931, 0, 0, 2484);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 36934, 0, 0, 2484);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 40585, 0, 0, 0);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 40586, 0, 0, 0);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 40678, 0, 0, 2523);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 40679, 0, 0, 2523);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 40680, 0, 0, 2523);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 40681, 0, 0, 2523);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 40717, 0, 0, 2534);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 40718, 0, 0, 2534);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 40719, 0, 0, 2534);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 40720, 0, 0, 2534);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 44934, 0, 0, 0);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 44935, 0, 0, 0);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 45688, 0, 0, 2592);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 45689, 0, 0, 2593);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 45690, 0, 0, 2594);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 45691, 0, 0, 2595);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 48954, 0, 0, 2702);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 48955, 0, 0, 2703);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 48956, 0, 0, 2704);
	INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (32172, 0, 48957, 0, 0, 2705);
	
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
-- 'C:\Users\Lothloryen\Desktop\SQL Temp\Official Merge temp\wintergrasp\wintergrasp.sql'
-- - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	
	
	-- Proper Spirit Guide spawns.
	
	DELETE FROM creature WHERE id IN(31841, 31842);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (88314, 31841, 571, 1, 64, 0, 1, 5537.48, 2898.91, 517.259, 4.86947, 120, 0, 0, 1, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (88312, 31841, 571, 1, 16, 0, 1, 5104.75, 2300.95, 368.568, 0.733038, 120, 0, 0, 1, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (88315, 31841, 571, 1, 1, 0, 1, 5031.84, 3710.75, 372.483, 3.3827, 120, 0, 0, 1, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (88313, 31841, 571, 1, 64, 0, 1, 5103.13, 3462.13, 368.568, 5.2709, 120, 0, 0, 1, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (88311, 31841, 571, 1, 16, 0, 1, 4336.25, 3235.52, 390.334, 0.628319, 120, 0, 0, 1, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (88310, 31841, 571, 1, 16, 0, 1, 4318.44, 2408.07, 392.676, 6.23083, 120, 0, 0, 1, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (88317, 31842, 571, 1, 32, 0, 1, 4336.25, 3235.52, 390.334, 0.628319, 120, 0, 0, 1, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (88320, 31842, 571, 1, 128, 0, 1, 5537.48, 2898.91, 517.259, 4.86947, 120, 0, 0, 1, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (88319, 31842, 571, 1, 129, 0, 1, 5103.13, 3462.13, 368.568, 5.2709, 120, 0, 0, 1, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (88318, 31842, 571, 1, 32, 0, 1, 5104.75, 2300.95, 368.568, 0.733038, 120, 0, 0, 1, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (88321, 31842, 571, 1, 1, 0, 1, 5140.79, 2179.12, 390.951, 1.97222, 120, 0, 0, 1, 0, 0, 0, 0, 0);
	INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (88316, 31842, 571, 1, 32, 0, 1, 4318.44, 2408.07, 392.676, 6.23083, 120, 0, 0, 1, 0, 0, 0, 0, 0);
	
	
	
	
	
	-- 
	DELETE FROM gameobject_template WHERE entry IN (305205, 305206);
	INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES 
	(305205, 22, 8506, 'Portal to Wintergrasp', '', '', '', 35, 0, 1, 0, 0, 0, 0, 0, 0, 58632, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340),
	(305206, 22, 8506, 'Portal to Wintergrasp', '', '', '', 35, 0, 1, 0, 0, 0, 0, 0, 0, 58633, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340);
	
	
	-- Spells
	DELETE FROM spell_target_position WHERE id IN(58632, 58633);
	INSERT INTO `spell_target_position` (`id`, `effIndex`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `VerifiedBuild`) VALUES 
	(58632, 0, 571, 5100.49, 2181.34, 365.63, 2.77, 0),
	(58633, 0, 571, 5026.01, 3676.98, 362.61, 4.254, 0)
	;
	
	-- Siege engine correction - for both alliance and horde.
	DELETE FROM conditions where sourcegroup IN(28312, 32627);
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (18, 28312, 60968, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', 'Require player for spellclick');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (18, 28312, 46598, 0, 0, 31, 0, 3, 0, 0, 0, 0, 0, '', 'Require unit for spellclick');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (18, 32627, 60968, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', 'Require player for spellclick');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (18, 32627, 46598, 0, 0, 31, 0, 3, 0, 0, 0, 0, 0, '', 'Require unit for spellclick');
	
	
	DELETE FROM gameobject_template WHERE entry IN(192829);
	INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES (192829, 10, 7967, 'Titan Relic', '', 'Activating', '', 0, 0, 0.7, 0, 0, 0, 0, 0, 0, 1634, 0, 22097, 3000, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 27700, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340);
	
	
	UPDATE `gameobject_template` SET `flags`=32 WHERE `entry`=192834; -- Titan Relic
	UPDATE `gameobject_template` SET `flags`=32 WHERE `entry`=194083; -- Titan Relic
	UPDATE `gameobject_template` SET `flags`=32 WHERE `entry`=194082; -- Titan Relic
	
	
	
	-- Delete from DB the double spawns.
	
	DELETE FROM creature WHERE id IN(31036, 31091, 31151, 30739, 32296, 39173, 31101, 31107, 31109, 31051, 30740, 32294, 39172, 31153, 31052, 31108, 31054, 31102, 31106, 31053);
