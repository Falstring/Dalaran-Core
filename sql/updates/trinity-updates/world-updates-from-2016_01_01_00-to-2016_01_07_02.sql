/* 
* sql\updates\world\2016_01_01_00_world.sql 
*/ 
-- Wretched Captive
UPDATE `waypoint_data` SET `orientation`=4.212851 WHERE `id`=586910;
UPDATE `creature` SET `orientation`=4.212851 WHERE `guid`=58691;
 
 
/* 
* sql\updates\world\2016_01_01_01_world.sql 
*/ 
-- 
DELETE FROM `spell_area` WHERE `spell` IN(46023);
 
 
/* 
* sql\updates\world\2016_01_02_00_world335.sql 
*/ 
-- Move EPL tower gryphon master to SAI
DELETE FROM `gossip_menu_option` WHERE menu_id = 7379;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(7379, 0, 0, 'Take me to Northpass Tower.',13562,1,1,0,0,0,0,NULL,0),
(7379, 1, 0, 'Take me to Eastwall Tower.',13563,1,1,0,0,0,0,NULL,0),
(7379, 2, 0, 'Take me to Crown Guard Tower.',13564,1,1,0,0,0,0,NULL,0);

-- Creating a new SmartAI script for [Creature] ENTRY 17209 (name: William Kielar)

-- Table creature_template
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 17209;

-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 17209);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(17209, 0, 0, 3, 62, 0, 100, 0, 7379, 0, 0, 0, 52, 494, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'William Kielar - On Gossip Option 0 Selected - Activate Taxi Path 494'),
(17209, 0, 1, 3, 62, 0, 100, 0, 7379, 1, 0, 0, 52, 495, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'William Kielar - On Gossip Option 1 Selected - Activate Taxi Path 495'),
(17209, 0, 2, 3, 62, 0, 100, 0, 7379, 2, 0, 0, 52, 496, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'William Kielar - On Gossip Option 2 Selected - Activate Taxi Path 496'),
(17209, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'William Kielar - On Gossip Option 0 Selected - Close Gossip');

 
 
/* 
* sql\updates\world\2016_01_02_01_world.sql 
*/ 
--
-- SAI script for Wyrmrest Temple taxi Flight Paths

SET @Tariolstrasz := 26443;
SET @Torastrasza  := 26949;
SET @Afrasastrasz := 27575;

-- Ground ----> Top: 878 (@Tariolstrasz,9455,0)
-- Ground -> Middle: 883 (@Tariolstrasz,9455,1)
-- Top ----> Ground: 879 (@Torastrasza, 9457,0)
-- Top ----> Middle: 880 (@Torastrasza, 9457,1)
-- Middle ----> Top: 881 (@Afrasastrasz,9563,0)
-- Middle -> Ground: 882 (@Afrasastrasz,9563,1)

-- Set AIName and remove old ScriptName in creature_template for all 3 NPCs
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName`= '' WHERE `entry` IN (@Tariolstrasz,@Torastrasza,@Afrasastrasz);

-- Tariolstrasz (Steward of Wyrmrest Temple)
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = @Tariolstrasz);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Tariolstrasz, 0, 0, 2, 62, 0, 100, 0, 9455, 0, 0, 0, 52, 878, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Tariolstrasz - On Gossip Option 0 Selected - Activate Taxi Path 878'),
(@Tariolstrasz, 0, 1, 2, 62, 0, 100, 0, 9455, 1, 0, 0, 52, 883, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Tariolstrasz - On Gossip Option 1 Selected - Activate Taxi Path 883'),
(@Tariolstrasz, 0, 2, 0, 61, 0, 100, 0,    0, 0, 0, 0, 72,   0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Tariolstrasz - On Gossip Options Selected  - Close Gossip');

-- Torastrasza (Majordomo to the Ruling Council)
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = @Torastrasza);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Torastrasza, 0, 0, 2, 62, 0, 100, 0, 9457, 0, 0, 0, 52, 879, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Torastrasza - On Gossip Option 0 Selected - Activate Taxi Path 879'),
(@Torastrasza, 0, 1, 2, 62, 0, 100, 0, 9457, 1, 0, 0, 52, 880, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Torastrasza - On Gossip Option 1 Selected - Activate Taxi Path 880'),
(@Torastrasza, 0, 2, 0, 61, 0, 100, 0,    0, 0, 0, 0, 72,   0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Torastrasza - On Gossip Options Selected  - Close Gossip');

-- Lord Afrasastrasz (Commander of Wyrmrest Temple Defenses)
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = @Afrasastrasz);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Afrasastrasz, 0, 0, 2, 62, 0, 100, 0, 9563, 0, 0, 0, 52, 881, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lord Afrasastrasz - On Gossip Option 0 Selected - Activate Taxi Path 881'),
(@Afrasastrasz, 0, 1, 2, 62, 0, 100, 0, 9563, 1, 0, 0, 52, 882, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lord Afrasastrasz - On Gossip Option 1 Selected - Activate Taxi Path 882'),
(@Afrasastrasz, 0, 2, 0, 61, 0, 100, 0,    0, 0, 0, 0, 72,   0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lord Afrasastrasz - On Gossip Options Selected  - Close Gossip');
 
 
/* 
* sql\updates\world\2016_01_03_00_world_335.sql 
*/ 
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dru_bear_form_passive';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(1178,'spell_dru_bear_form_passive'),
(9635,'spell_dru_bear_form_passive');
 
 
/* 
* sql\updates\world\2016_01_03_01_world.sql 
*/ 
-- 
-- Sergeant Kan'ren, Wretched Captive and Novice Ranger SAI
SET @Sergeant := 16924;
SET @Captive := 16916;
SET @Ranger := 16923;

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` in (@Sergeant, @Captive, @Ranger);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@Sergeant, @Ranger, @Captive) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Sergeant*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@Sergeant,0,0,0,1,0,100,0,60000,100000,100000,120000,80,@Sergeant*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sergeant Kan'ren - Out of Combat - Action list"),
(@Sergeant*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sergeant Kan'ren - Action list - Say Line 0"),
(@Sergeant*100,9,1,0,0,0,100,0,5000,5000,0,0,5,18,0,0,0,0,0,19,@Captive,10,0,0,0,0,0,"Sergeant Kan'ren - Action list - Captive Play Emote 18"),
(@Sergeant*100,9,2,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,19,@Captive,10,0,0,0,0,0,"Sergeant Kan'ren - Action list - Captive Say Line 0"),
(@Sergeant*100,9,3,0,0,0,100,0,8000,8000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sergeant Kan'ren - Action list - Say Line 1"),
(@Captive,0,0,0,1,0,100,0,14000,14000,14000,14000,5,20,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wretched Captive - Out of Combat - Play Emote 20"),
(@Ranger,0,0,0,1,0,100,0,50000,70000,70000,80000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ranger - Out of Combat - Say text");

UPDATE `creature` SET `movementtype`=0 WHERE `guid`=58691;
UPDATE `creature_addon` SET `path_id`=0 WHERE `guid`=58691;
DELETE FROM `waypoint_data` WHERE `id`=586910;
DELETE FROM `waypoint_scripts` WHERE `id` IN (66, 67, 68, 69, 70);

DELETE FROM `creature_text` WHERE `entry`=@Ranger;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextID`) VALUES
(@Ranger,0,0, 'I might just have to go hunting for that Wretched beast now that there''s a bounty on his head.',12,1,100,0,0,0, 'Ranger', 12832);
 
 
/* 
* sql\updates\world\2016_01_03_02_world.sql 
*/ 
-- Issue #16168
-- Orbaz Bloodbane: Fix incorrect creature texts
-- By: dr-j
UPDATE `creature_text` SET `BroadcastTextId`=31961 WHERE  `entry`=31283 AND `groupid`=1 AND `id`=0;
UPDATE `creature_text` SET `BroadcastTextId`=31962 WHERE  `entry`=31283 AND `groupid`=2 AND `id`=0;
UPDATE `creature_text` SET `BroadcastTextId`=31963 WHERE  `entry`=31283 AND `groupid`=3 AND `id`=0;
UPDATE `creature_text` SET `BroadcastTextId`=31966 WHERE  `entry`=31283 AND `groupid`=4 AND `id`=0;
UPDATE `creature_text` SET `BroadcastTextId`=31967 WHERE  `entry`=31283 AND `groupid`=5 AND `id`=0;
UPDATE `creature_text` SET `BroadcastTextId`=31964 WHERE  `entry`=31283 AND `groupid`=6 AND `id`=0;
 
 
/* 
* sql\updates\world\2016_01_03_03_world.sql 
*/ 
-- Betrayal (Drakuru) fixes:
-- Fix "Blight Fog" cast behavior
-- Fix "Throw Blight Crystal" cast timing
-- By: dr-j
UPDATE `smart_scripts` SET `event_param2`=7500, `event_param3`=10000, `event_param4`=20000 WHERE  `entryorguid`=28998 AND `source_type`=0 AND `id`=5 AND `link`=0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=28998 AND `source_type`=0 AND `id` in(13,14);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(28998, 0, 13, 0, 0, 0, 100, 0, 0, 0, 60000, 60000, 28, 54104, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - IC - Remove Aura (Blight Fog'),
(28998, 0, 14, 0, 0, 0, 100, 0, 45000, 45000, 60000, 60000, 11, 54104, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Drakuru - IC - Cast Blight Fog');
 
 
/* 
* sql\updates\world\2016_01_03_04_world.sql 
*/ 
UPDATE `creature_template` SET `faction`=2109 WHERE  `entry`=30012;
 
 
/* 
* sql\updates\world\2016_01_03_05_world.sql 
*/ 
-- Add sniffed gossip texts to menu
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8095, 8096, 8100);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(8095, 0, 2, 'Show me where I can fly.',12271,1,1,0,0,0,0,'',0),
(8096, 0, 0, 'Send me to Honor Point!',18200,1,1,0,0,0,0,'',0),
(8096, 1, 0, 'Send me to the Abyssal Shelf!',17936,1,1,0,0,0,0,'',0),
(8100, 0, 0, 'Send me to Shatter Point!',17937,1,1,0,0,0,0,'',0);

-- Migrate NPC to use SmartAI
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '', `gossip_menu_id` = 8096 WHERE `entry` = 20235;

-- Condition: Gossip menu ID 0 needs either quest ID 10163 or quest ID 10346 to be incomplete.
-- Condition: Gossip menu ID 1 needs quest ID 10382 to be complete
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 15 AND `SourceGroup` = 8096 AND `SourceEntry`IN (0,1);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,8096,0,0,0,9,0,10163,0,0,0,0,'','Gryphoneer Windbellow - Show gossip option 0 if player has taken quest ID 10163'),
(15,8096,0,0,1,9,0,10346,0,0,0,0,'','Gryphoneer Windbellow - Show gossip option 0 if player has taken quest ID 10346'),
(15,8096,1,0,0,28,0,10382,0,0,0,0,'','Gryphoneer Windbellow - Show gossip option 1 if quest ID 10382 is completed');

-- Create SmartAI for Gryphoneer Windbellow
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 20235);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(20235,0,0,2,62,0,100,0,8096,0,0,0,11,33899,0,0,0,0,0,7,0,0,0,0,0,0,0,'Gryphoneer Windbellow - On Gossip Option 0 Selected - Cast Spell 33899'),
(20235,0,1,2,62,0,100,0,8096,1,0,0,11,35065,0,0,0,0,0,7,0,0,0,0,0,0,0,'Gryphoneer Windbellow - On Gossip Option 1 Selected - Cast Spell 35065'),
(20235,0,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Gryphoneer Windbellow - On Linked Actions - Close Gossip');
 
 
/* 
* sql\updates\world\2016_01_04_00_world.sql 
*/ 
-- Vyragosa (32630) & Time-Lost Proto-Drake (32491) band-aid fix by nelegalno
SET @POOL := 60002;
SET @VYRA := 32630;
SET @TLPD := 32491;

-- TLPD & Vyragosa set respawn to 6h (current 25 sec)
UPDATE `creature` SET `spawntimesecs`=21600 WHERE `id` IN (@VYRA,@TLPD);

-- Remove old pool data
DELETE FROM `pool_template` WHERE `entry` IN (@VYRA,@TLPD,@POOL);
DELETE FROM `pool_creature` WHERE `pool_entry` IN (@VYRA,@TLPD,@POOL);
DELETE FROM `pool_pool` WHERE `mother_pool`=@POOL OR `pool_id` IN (@VYRA,@TLPD);

-- Insert new pool structure
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@POOL,1,"Vyragosa (32630) & Time-Lost Proto Drake (32491)"),
(@VYRA,1,"Vyragosa (32630)"),
(@TLPD,1,"Time-Lost Proto Drake (32491)");

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES
(@VYRA,@POOL,80,"Vyragosa (32630)"),
(@TLPD,@POOL,20,"Time-Lost Proto Drake (32491)");

INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
-- spawns 1-20 for both NPCs are from old pool
(202461,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 1"),
(202462,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 2"),
(202463,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 3"),
(202464,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 4"),
(202465,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 5"),
(202466,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 6"),
(202467,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 7"),
(202468,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 8"),
(202469,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 9"),
(202470,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 10"),
(202471,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 11"),
(202472,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 12"),
(202473,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 13"),
(202474,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 14"),
(202475,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 15"),
(202476,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 16"),
(202477,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 17"),
(202478,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 18"),
(202479,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 19"),
(202480,@TLPD,0,"Time-Lost Proto Drake (32491) - Spawn 20"),
(202441,@VYRA,0,"Vyragosa (32630) - Spawn 1"),
(202442,@VYRA,0,"Vyragosa (32630) - Spawn 2"),
(202443,@VYRA,0,"Vyragosa (32630) - Spawn 3"),
(202444,@VYRA,0,"Vyragosa (32630) - Spawn 4"),
(202445,@VYRA,0,"Vyragosa (32630) - Spawn 5"),
(202446,@VYRA,0,"Vyragosa (32630) - Spawn 6"),
(202447,@VYRA,0,"Vyragosa (32630) - Spawn 7"),
(202448,@VYRA,0,"Vyragosa (32630) - Spawn 8"),
(202449,@VYRA,0,"Vyragosa (32630) - Spawn 9"),
(202450,@VYRA,0,"Vyragosa (32630) - Spawn 10"),
(202451,@VYRA,0,"Vyragosa (32630) - Spawn 11"),
(202452,@VYRA,0,"Vyragosa (32630) - Spawn 12"),
(202453,@VYRA,0,"Vyragosa (32630) - Spawn 13"),
(202454,@VYRA,0,"Vyragosa (32630) - Spawn 14"),
(202455,@VYRA,0,"Vyragosa (32630) - Spawn 15"),
(202456,@VYRA,0,"Vyragosa (32630) - Spawn 16"),
(202457,@VYRA,0,"Vyragosa (32630) - Spawn 17"),
(202458,@VYRA,0,"Vyragosa (32630) - Spawn 18"),
(202459,@VYRA,0,"Vyragosa (32630) - Spawn 19"),
(202460,@VYRA,0,"Vyragosa (32630) - Spawn 20"),
-- spawned in TDB but not in the old pool
(202602,@VYRA,0,"Vyragosa (32630) - Spawn 21");
 
 
/* 
* sql\updates\world\2016_01_05_00_world.sql 
*/ 
DELETE FROM `spell_area` WHERE `spell` IN(52214,50735);

INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(52214, 3711, 12572, 12572, 0, 0, 2, 1, 74, 11), -- Gods Like Shiny Things 
(52214, 3711, 12704, 12704, 0, 0, 2, 1, 74, 11), -- Appeasing the Great Rainstone 
(50735, 3711, 12532, 12532, 0, 0, 2, 1, 74, 11), -- Flown the Coop! 
(50735, 3711, 12702, 12702, 0, 0, 2, 1, 74, 11); -- Chicken Party! 

DELETE FROM `smart_scripts` WHERE  `entryorguid`=28138 AND `source_type`=0 AND `id`=3 AND `link`=0;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=28138 AND `source_type`=0 AND `id`=1 AND `link`=0;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=28138 AND `source_type`=0 AND `id`=2 AND `link`=0;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=28138 AND `source_type`=0 AND `id`=0 AND `link`=0;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=28027 AND `source_type`=0 AND `id`=9 AND `link`=0;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=28027 AND `source_type`=0 AND `id`=10 AND `link`=0;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=28027 AND `source_type`=0 AND `id`=11 AND `link`=0;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=28120 AND `source_type`=0 AND `id`=13 AND `link`=0;

UPDATE `smart_scripts` SET `event_flags`=0 WHERE  `entryorguid` IN(28214,28215,28216, 28120, 28121,28122,28362) AND `source_type`=0;
UPDATE `smart_scripts` SET `event_param3`=60000, `event_param4`=60000 WHERE  `entryorguid`=28362 AND `source_type`=0 AND `id`=0 AND `link`=0;

 
 
/* 
* sql\updates\world\2016_01_05_01_world.sql 
*/ 
-- Add gossip texts to menu
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 8718;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(8718, 0, 0, 'Yes, I''d love a ride to Blackwind Landing.',21550,1,1,0,0,0,0,'',0);

DELETE FROM `npc_text` WHERE `ID` = 10977;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`) VALUES
(10977, '', 'Hey, comrade.  If you get yourself in good with the Skyguard, I can offer you a direct flight to our base, Blackwind Landing, in the Skethyl Mountains.$B$BDo you like my beautiful nether ray?  It is lovely.', 21547, 0, 1, 0, 1, 0, 6, 0, 0);
-- Other npc_text (10978) is already set in DB

-- Migrate NPC to use SmartAI
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 23413;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14, 15) AND `SourceGroup` = 8718;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,8718,10977,0,0,5,0,1031,224,0,1,0,'','Skyguard Handler Irena - Show gossip menu text below Honored reputation with faction 1031'),
(14,8718,10978,0,0,5,0,1031,224,0,0,0,'','Skyguard Handler Irena - Show gossip menu text above Honored reputation with faction 1031'),
(15,8718,0,0,0,5,0,1031,224,0,0,0,'','Skyguard Handler Irena - Show gossip option 0 if player has reputation Honored or above with faction 1031');

-- Create SmartAI for Skyguard Handler Irena
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 23413);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(23413,0,0,1,62,0,100,0,8718,0,0,0,11,41278,0,0,0,0,0,7,0,0,0,0,0,0,0,'Skyguard Handler Irena - On Gossip Option 0 Selected - Cast Spell 41278'),
(23413,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Skyguard Handler Irena - On Linked Actions - Close Gossip');
 
 
/* 
* sql\updates\world\2016_01_05_02_world.sql 
*/ 
-- Add gossip texts to menu
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 8719;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(8719,0,0,'Absolutely!  Send me to the Skyguard Outpost.',21553,1,1,0,0,0,0,'',0);
-- This was already here but I think rather enumerate from 0 than 1 in gossip_menu_option

-- Migrate NPC to use SmartAI
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 23415;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14, 15) AND `SourceGroup` = 8719;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,8719,10980,0,0,5,0,1031,224,0,1,0,'','Skyguard Handler Deesak - Show gossip menu text below Honored reputation with faction 1031'),
(14,8719,10979,0,0,5,0,1031,224,0,0,0,'','Skyguard Handler Deesak - Show gossip menu text above Honored reputation with faction 1031'),
(15,8719,0,0,0,5,0,1031,224,0,0,0,'','Skyguard Handler Deesak - Show gossip option 0 if player has reputation Honored or above with faction 1031');
-- Not sure if the missing condition is necessary, but it makes things a lot clearer when looking at the table.

-- Create SmartAI for Skyguard Handler Deesak
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 23415);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(23415,0,0,1,62,0,100,0,8719,0,0,0,11,41279,0,0,0,0,0,7,0,0,0,0,0,0,0,'Skyguard Handler Deesak - On Gossip Option 0 Selected - Cast Spell 41279'),
(23415,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Skyguard Handler Deesak - On Linked Actions - Close Gossip');
 
 
/* 
* sql\updates\world\2016_01_07_00_world.sql 
*/ 
-- Add sniffed gossip texts to menu
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 7970;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(7970, 0, 0, 'I''m on a bombing mission for Forward Commander Kingston.  I need a gryphon destroyer!',18198,1,1,0,0,0,0,'',0),
(7970, 1, 0, 'Send me to Shatter Point!',17935,1,1,0,0,0,0,'',0);

-- Migrate NPC to use SmartAI
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '', `gossip_menu_id` = 7970 WHERE `entry` = 19409;

-- Condition: Gossip menu ID 0 needs either quest ID 10146 to be incomplete.
-- Condition: Gossip menu ID 1 needs quest ID 10340 to not be rewarded
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 15 AND `SourceGroup` = 7970 AND `SourceEntry`IN (0,1);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,7970,0,0,0,9,0,10146,0,0,0,0,'','Wing Commander Dabir''ee - Show gossip option 0 if player has taken quest ID 10146'),
(15,7970,1,0,0,8,0,10340,0,0,1,0,'','Wing Commander Dabir''ee - Show gossip option 1 if quest ID 10340 is not rewarded');

-- Create SmartAI for Wing Commander Dabir'ee
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 19409);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(19409,0,0,2,62,0,100,0,7970,0,0,0,11,33768,0,0,0,0,0,7,0,0,0,0,0,0,0,'Wing Commander Dabir''ee - On Gossip Option 0 Selected - Cast Spell 33768'),
(19409,0,1,2,62,0,100,0,7970,1,0,0,11,35069,0,0,0,0,0,7,0,0,0,0,0,0,0,'Wing Commander Dabir''ee - On Gossip Option 1 Selected - Cast Spell 35069'),
(19409,0,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Wing Commander Dabir''ee - On Linked Actions - Close Gossip');

-- Misc creature fixes
UPDATE `creature` SET `MovementType` = 0 WHERE id = 22987 AND guid IN (79007, 79008, 79009);
 
 
/* 
* sql\updates\world\2016_01_07_01_world.sql 
*/ 
-- 
DELETE FROM `creature` WHERE `id`=22972;
 
 
/* 
* sql\updates\world\2016_01_07_02_world.sql 
*/ 
-- fix a start-up warning
UPDATE `creature` SET `spawndist`=0 WHERE `guid` IN (79007,79008,79009);
 
 
