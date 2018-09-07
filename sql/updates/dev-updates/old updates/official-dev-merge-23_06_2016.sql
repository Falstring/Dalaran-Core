-- Tethis http://wotlk.openwow.com/npc=730
UPDATE `creature` SET `spawntimesecs`='300' WHERE  `id`=730;

-- King Bangalash http://www.wowhead.com/npc=731/king-bangalash
UPDATE `creature` SET `spawntimesecs`='300' WHERE  `id`=731;

-- Stormscale Sorceress SAI -- http://wotlk.openwow.com/npc=2182
SET @ENTRY := 2182;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,1800000,1800000,11,12544,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormscale Sorceress - Out of Combat - Cast 'Frost Armor'"),
(@ENTRY,0,2,0,0,0,100,0,0,0,2300,3900,11,20792,64,0,0,0,0,2,0,0,0,0,0,0,0,"Stormscale Sorceress - In Combat - Cast 'Frostbolt'");

-- DB/Creature: Restless Spirit of Earth - http://wotlk.openwow.com/npc=17179
UPDATE `creature` SET `spawntimesecs`=240 WHERE  `id`=17179;

-- Crafty Wobblesprocket SAI
SET @ENTRY := 25477;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=6;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,6,0,64,0,100,0,0,0,0,0,54,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Crafty Wobblesprocket - On Gossip Hello - Pause Waypoint");


-- Converted Hero -- http://www.wowhead.com/npc=32255
UPDATE `creature_template` SET `mingold`=900, `maxgold`=1000 WHERE `entry`=32255;

-- [Q] The Prodigal Lich Returns -- http://wotlk.openwow.com/?quest=411
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN(1498, 5666);
DELETE FROM `creature_text` WHERE `entry` IN(1498, 5666);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(1498, 0, 0, 'Farewell, my friend.', 12, 0, 100, 0, 0, 0, 'Bethor Iceshard'),
(5666, 0, 0, 'It has been a long time, Bethor, my friend.', 12, 0, 100, 0, 0, 0, 'Gunthers Visage'),
(5666, 1, 0, 'When time permits, we must speak at length.  For we have much to discuss.', 12, 0, 100, 0, 0, 0, 'Gunthers Visage'),
(5666, 2, 0, 'And thank you, $n.  Without your aid I may never have found my way to the Forsaken.', 12, 0, 100, 0, 0, 0, 'Gunthers Visage');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=1498;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22, 1, 1498, 0, 0, 29, 1, 5666, 10, 0, 1, 0, 0, '', 'Only run SAI if no Gunther''s Visage near');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN(1498, 5666, 149800, 566600) AND `source_type` IN(0, 9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1498, 0, 0, 0, 20, 0, 100, 0, 411, 0, 0, 0, 80, 149800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bethor Iceshard - On Quest ''The Prodigal Lich Returns'' Finished - Run Script'),
(5666, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, 566600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gunther''s Visage - On Just Summoned - Run Script'),
(149800, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 11, 7762, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bethor Iceshard - On Script - Cast ''Summon Gunther''s Visage'''),
(149800, 9, 1, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 12, 5666, 3, 23000, 0, 0, 0, 8, 0, 0, 0, 1768.58, 55.4891, -46.3198, 2.28248, 'Bethor Iceshard - On Script - Summon Creature ''Gunther''s Visage'''),
(149800, 9, 2, 0, 0, 0, 100, 0, 23000, 23000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bethor Iceshard - On Script - Say Line 0'),
(566600, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gunther''s Visage - On Script - Set Run Off'),
(566600, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 1766.39, 65.0166, -46.3214, 1.51672, 'Gunther''s Visage - On Script - Move To Position'),
(566600, 9, 2, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gunther''s Visage - On Script - Say Line 0'),
(566600, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gunther''s Visage - On Script - Say Line 1'),
(566600, 9, 4, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 21, 60, 0, 0, 0, 0, 0, 0, 'Gunther''s Visage - On Script - Set Orientation Closest Player'),
(566600, 9, 5, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 21, 60, 0, 0, 0, 0, 0, 0, 'Gunther''s Visage - On Script - Say Line 2 Closest Player');

-- DB/Quest: Elixir of Agony - Endevent -- http://wotlk.openwow.com/?quest=524
-- Dusty Rug SAI
SET @ENTRY := 1728;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,20,0,100,0,524,0,0,0,45,1,0,0,0,0,0,11,2284,50,0,0,0,0,0,"Dusty Rug - On Quest 'Elixir of Agony' Finished - Set Data 1 0");

-- npc 1
-- Captured Farmer SAI
SET @GUID := -15893;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=2284;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,38,0,100,0,1,0,0,0,80,1589300,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Farmer - On Data Set 1 0 - Run Script");

-- Actionlist SAI
SET @ENTRY := 1589300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,0.439,-940.84,61.93,4.94,"On Script - Move To Position"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Kill Target");

-- npc 2
-- Captured Farmer SAI
SET @GUID := -15891;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=2284;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,38,0,100,0,1,0,0,0,80,1589100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Farmer - On Data Set 1 0 - Run Script");

-- Actionlist SAI
SET @ENTRY := 1589100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,0.524,-944.41,61.93,1.66,"On Script - Move To Position"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Kill Target");

-- npc 3
-- Captured Farmer SAI
SET @GUID := -15892;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=2284;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,38,0,100,0,1,0,0,0,80,1589200,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Farmer - On Data Set 1 0 - Run Script");

-- Actionlist SAI
SET @ENTRY := 1589200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,-1.632,-942.43,61.93,6.14,"On Script - Move To Position"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Kill Target");

-- [Q] Stranglethorn Fever -- http://wotlk.openwow.com/quest=349
-- Actionlist SAI
SET @ENTRY := 144900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,12,1511,3,300000,0,0,0,8,0,0,0,-13834.451172,10.406610,18.501738,5.986651,"Witch Doctor Unbagwa - On Script - Summon Creature 'Enraged Silverback Gorilla'"),
(@ENTRY,9,1,0,0,0,100,0,28000,28000,0,0,12,1516,3,300000,0,0,0,8,0,0,0,-13834.451172,10.406610,18.501738,5.986651,"Witch Doctor Unbagwa - On Script - Summon Creature 'Konda'"),
(@ENTRY,9,2,0,0,0,100,0,20000,20000,0,0,12,1514,3,300000,0,0,0,8,0,0,0,-13834.451172,10.406610,18.501738,5.986651,"Witch Doctor Unbagwa - On Script - Summon Creature 'Mokk the Savage'");

-- Enraged Silverback Gorilla SAI
SET @ENTRY := 1511;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Enraged Silverback Gorilla - On Just Summoned - Set Active On"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,53,1,151100,0,0,0,2,0,0,0,0,0,0,0,0,"Enraged Silverback Gorilla - On Just Summoned - Start Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,12,@ENTRY*100+00,0,0,101,0,0,0,0,0,0,1,10,0,0,0,0,0,0,"Mokk the Savage - On Waypoint 12 Reached - Set Home Position");

-- Konda SAI
SET @ENTRY := 1516;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Konda - On Just Summoned - Set Active On"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,53,1,151100,0,0,0,2,0,0,0,0,0,0,0,0,"Konda - On Just Summoned - Start Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,12,@ENTRY*100+00,0,0,101,0,0,0,0,0,0,1,10,0,0,0,0,0,0,"Mokk the Savage - On Waypoint 12 Reached - Set Home Position");

-- Mokk the Savage SAI
SET @ENTRY := 1514;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mokk the Savage - On Just Summoned - Set Active On"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,53,1,151100,0,0,0,2,0,0,0,0,0,0,0,0,"Mokk the Savage - On Just Summoned - Start Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,12,@ENTRY*100+00,0,0,101,0,0,0,0,0,0,1,10,0,0,0,0,0,0,"Mokk the Savage - On Waypoint 12 Reached - Set Home Position");

DELETE FROM `waypoints` WHERE `entry`=151100;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`) VALUES 
(151100, 1, -13827.2, 8.52635, 20.5824),
(151100, 2, -13813.6, 5.66898, 26.1583),
(151100, 3, -13802.9, 6.12354, 30.2606),
(151100, 4, -13793.4, 5.90325, 32.4506),
(151100, 5, -13784.7, 3.8825, 36.0005),
(151100, 6, -13777.5, -0.0832987, 39.5015),
(151100, 7, -13769, -6.19992, 43.0507),
(151100, 8, -13764, -11.6944, 44.8876),
(151100, 9, -13757.9, -15.1257, 45.1735),
(151100, 10, -13751.8, -18.5569, 44.0262),
(151100, 11, -13745.9, -22.2345, 44.7542),
(151100, 12, -13738.1, -27.4341, 44.5899);
UPDATE `creature_template` SET `speed_walk`=1.16 WHERE  `entry`=1511;

-- [Q] Brothers In Death(q.12725) -- http://wotlk.openwow.com/quest=12725
-- Thassarian SAI
SET @ENTRY := 28913;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,12725,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thassarian - On Quest 'Brothers In Death' Taken - Run Script");

-- Actionlist SAI
SET @ENTRY := 2891300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thassarian - On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Say Line 1"),
(@ENTRY,9,2,0,0,0,100,0,7000,7000,0,0,17,0,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Set Emote State 0"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,45,1,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Set Data 1 0"),
(@ENTRY,9,4,0,0,0,100,0,3000,3000,0,0,1,2,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Say Line 2"),
(@ENTRY,9,5,0,0,0,100,0,4000,4000,0,0,1,3,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Say Line 3"),
(@ENTRY,9,6,0,0,0,100,0,3000,3000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.0962126,"Thassarian - On Script - Set Orientation 0,0962126"),
(@ENTRY,9,7,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thassarian - On Script - Say Line 0"),
(@ENTRY,9,8,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thassarian - On Script - Say Line 1"),
(@ENTRY,9,9,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thassarian - On Script - Say Line 2"),
(@ENTRY,9,10,0,0,0,100,0,7000,7000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thassarian - On Script - Say Line 3"),
(@ENTRY,9,11,0,0,0,100,0,3000,3000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5000,"Thassarian - On Script - Set Orientation 5000"),
(@ENTRY,9,12,0,0,0,100,0,1000,1000,0,0,1,4,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Say Line 4"),
(@ENTRY,9,13,0,0,0,100,0,3000,3000,0,0,45,2,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Set Data 2 0"),
(@ENTRY,9,14,0,0,0,100,0,2000,2000,0,0,17,8,0,0,0,0,0,19,28914,20,0,0,0,0,0,"Thassarian - On Script - Set Emote State 8"),
(@ENTRY,9,15,0,0,0,100,0,2000,2000,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thassarian - On Script - Set Active Off");

-- Orbaz Bloodbane SAI
SET @ENTRY := 28914;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,12757,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Orbaz Bloodbane - On Quest 'Scarlet Armies Approach...' Taken - Run Script"),
(@ENTRY,0,1,3,38,0,100,0,1,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.00062,"Orbaz Bloodbane - On Data Set 1 0 - Set Orientation 3,00062"),
(@ENTRY,0,2,4,38,0,100,0,2,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.23599,"Orbaz Bloodbane - On Data Set 2 0 - Set Orientation 5,23599"),
(@ENTRY,0,3,0,61,0,100,0,1,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orbaz Bloodbane - On Data Set 1 0 - Remove Flag Standstate Kneel"),
(@ENTRY,0,4,0,61,0,100,0,2,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orbaz Bloodbane - On Data Set 2 0 - Set Flag Standstate Kneel");

DELETE FROM `creature_text` WHERE `entry`=28913;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(28913, 0, 0, 'What, Orbaz? That he\'s a blood elf?', 12, 0, 100, 6, 0, 0, ''), 
(28913, 1, 0, 'In life we were hated enemies - this is true...', 12, 0, 100, 1, 0, 0, ''), 
(28913, 2, 0, 'But in death... We are the children of the damned. The orphaned sons and daughters of the Scourge.', 12, 0, 100, 1, 0, 0, ''), 
(28913, 3, 0, 'In death we are brothers.', 12, 0, 100, 0, 0, 0, ''); 
 
DELETE FROM `creature_text` WHERE `entry`=28914 AND `groupid`>=1;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(28914, 1, 0, 'Why do you care, Thassarian?', 12, 0, 100, 6, 0, 0, ''), 
(28914, 2, 0, 'His weakness led to his capture.', 12, 0, 100, 1, 0, 0, ''), 
(28914, 3, 0, 'Only the strong should survive. Not to mention...', 12, 0, 100, 1, 0, 0, ''), 
(28914, 4, 0, 'To hell with you, Thassarian.', 12, 0, 100, 25, 0, 0, ''); 

-- DB/Quest: Translation to Ello -- http://wotlk.openwow.com/quest=252
DELETE FROM `waypoints` WHERE `entry`=412;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`) VALUES 
(412, 1, -10290.1, 73.7148, 38.849),
(412, 2, -10290.4, 81.547, 38.7702),
(412, 3, -10283.2, 86.6661, 38.7694),
(412, 4, -10271.1, 83.5772, 39.1122),
(412, 5, -10266, 76.0585, 39.4047),
(412, 6, -10272.4, 65.7703, 39.524),
(412, 7, -10283.4, 59.1681, 40.6902),
(412, 8, -10300.2, 45.8306, 47.3053),
(412, 9, -10315.3, 45.1015, 48.0097),
(412, 10, -10324.4, 38.7441, 47.3935),
(412, 11, -10330.2, 27.0829, 50.5753),
(412, 12, -10335.3, 13.4164, 50.1259),
(412, 13, -10342.2, 3.3501, 51.1675),
(412, 14, -10354.6, -13.0266, 47.1154),
(412, 15, -10379.4, -27.1456, 49.2841),
(412, 16, -10401, -30.8108, 48.1353),
(412, 17, -10416.5, -28.4794, 48.4772),
(412, 18, -10436.4, -34.2376, 46.5064),
(412, 19, -10468.7, -38.8985, 48.7035),
(412, 20, -10500.2, -44.6662, 45.882),
(412, 21, -10539.1, -39.3422, 43.0622),
(412, 22, -10568, -35.1434, 37.2048),
(412, 23, -10585.6, -37.5056, 37.4296),
(412, 24, -10606.3, -51.7202, 36.0713),
(412, 25, -10629.2, -64.211, 32.6163),
(412, 26, -10645.9, -73.4561, 32.7337),
(412, 27, -10671, -81.8316, 35.6535),
(412, 28, -10687.6, -85.57, 34.1549),
(412, 29, -10702.8, -89.2772, 37.9242),
(412, 30, -10709.1, -97.5837, 37.892),
(412, 31, -10725.6, -101.348, 34.5892),
(412, 32, -10748, -99.1517, 38.2323),
(412, 33, -10759.9, -93.0657, 38.5876),
(412, 34, -10774.9, -89.8001, 34.8007),
(412, 35, -10788.6, -86.7376, 33.4988),
(412, 36, -10802.7, -88.6347, 29.0679),
(412, 37, -10811.5, -97.1736, 29.2451),
(412, 38, -10821.4, -121.335, 30.142),
(412, 39, -10826.2, -134.391, 31.7845),
(412, 40, -10830.6, -148.284, 31.7985),
(412, 41, -10835.3, -164.201, 33.8299),
(412, 42, -10840.4, -182.63, 34.0254),
(412, 43, -10843.3, -193.104, 35.8227),
(412, 44, -10848.7, -215.175, 37.7986),
(412, 45, -10851.7, -235.779, 38.6853),
(412, 46, -10857.4, -264.019, 38.0974),
(412, 47, -10866.6, -293.454, 37.9429),
(412, 48, -10882.9, -332.562, 37.9688),
(412, 49, -10900, -365.26, 39.4542),
(412, 50, -10904.1, -393.833, 41.0451),
(412, 51, -10905.7, -431.964, 42.7237),
(412, 52, -10908, -461.901, 46.7191),
(412, 53, -10911.2, -510.492, 52.0594),
(412, 54, -10915.1, -533.78, 53.8047),
(412, 55, -10927, -565.685, 54.042),
(412, 56, -10936.5, -581.62, 53.8887),
(412, 57, -10950.1, -597.371, 55.177),
(412, 58, -10957.9, -619.554, 55.0689),
(412, 59, -10958.8, -637.183, 55.2047),
(412, 60, -10954.3, -652.46, 55.4423),
(412, 61, -10931.8, -681.568, 55.3955),
(412, 62, -10916.9, -710.733, 55.6988),
(412, 63, -10902.9, -734.1, 55.1313),
(412, 64, -10878.3, -760.091, 55.5638),
(412, 65, -10851.1, -787.76, 56.1885),
(412, 66, -10831.9, -818.655, 56.2795),
(412, 67, -10825.2, -833.223, 55.5758),
(412, 68, -10808.3, -873.497, 55.9567),
(412, 69, -10796.7, -912.719, 55.8731),
(412, 70, -10796.1, -934.562, 56.2303),
(412, 71, -10800.5, -949.721, 56.5614),
(412, 72, -10807.1, -969.027, 56.2941),
(412, 73, -10806.8, -992.166, 53.8349),
(412, 74, -10804.6, -1030.41, 47.0768),
(412, 75, -10801.3, -1047.26, 44.0233),
(412, 76, -10787.8, -1074.49, 37.7652),
(412, 77, -10783.3, -1095.07, 33.6488),
(412, 78, -10781.2, -1112.66, 30.3863),
(412, 79, -10763.6, -1138.91, 27.0977),
(412, 80, -10738, -1158.02, 26.4475),
(412, 81, -10705.3, -1179.29, 26.3723),
(412, 82, -10682.3, -1190.45, 27.2793),
(412, 83, -10662.5, -1193.06, 28.2884),
(412, 84, -10641.6, -1189.92, 28.5594),
(412, 85, -10615.7, -1182.78, 28.5022),
(412, 86, -10586.8, -1177.32, 28.3931),
(412, 87, -10576.4, -1179.26, 28.1946),
(412, 88, -10566.7, -1189.27, 27.8756),
(412, 89, -10557, -1192.38, 28.0606),
(412, 90, -10550.4, -1185.71, 27.8428),
(412, 91, -10554.4, -1167.97, 27.5984);

-- Lord Ello Ebonlocke SAI
SET @ENTRY := 263;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,20000,30000,120000,120000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Ello Ebonlocke - Out of Combat - Say Line 0"),
(@ENTRY,0,1,0,20,0,100,0,252,0,0,0,12,412,3,3600000,0,0,0,8,0,0,0,-10290.171875,72.781136,38.881119,4.801499,"Lord Ello Ebonlocke - On Quest 'Translation to Ello' Finished - Summon Creature 'Stitches'");

-- Stitches SAI
SET @ENTRY := 412;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6900,12100,3500,11300,11,3106,0,0,0,0,0,2,0,0,0,0,0,0,0,"Stitches - In Combat - Cast 'Aura of Rot'"),
(@ENTRY,0,1,2,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stitches - On Just Summoned - Set Active On"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,53,1,412,0,0,0,2,0,0,0,0,0,0,0,0,"Stitches - On Just Summoned - Start Waypoint"),
(@ENTRY,0,3,0,40,0,100,0,47,412,0,0,1,0,0,0,0,0,0,19,468,200,0,0,0,0,0,"Stitches - On Waypoint 47 Reached - Say Line 0"),
(@ENTRY,0,5,6,40,0,100,0,50,412,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stitches - On Waypoint 50 Reached - Say Line 0"),
(@ENTRY,0,6,0,61,0,100,0,50,412,0,0,1,1,0,0,0,0,0,19,468,200,0,0,0,0,0,"Stitches - On Waypoint 50 Reached - Say Line 1"),
(@ENTRY,0,7,8,40,0,100,0,91,412,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stitches - On Waypoint 91 Reached - Set Home Position"),
(@ENTRY,0,8,0,61,0,100,0,91,412,0,0,89,20,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stitches - On Waypoint 91 Reached - Start Random Movement");

DELETE FROM `creature_text` WHERE `entry` IN (468, 412);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(468, 0, 0, 'An abomination of the undead is approaching!', 14, 0, 100, 0, 0, 0, 'Guard'),
(468, 1, 0, 'The abomination has overrun the Night Watch camp! Quickly, we must intercept it before it reaches town!', 14, 0, 100, 0, 0, 0, 'Guard'),
(412, 0, 0, 'ROARRRRR!!', 14, 0, 100, 0, 0, 0, 'Stitches'),
(412, 0, 1, 'DARKSHIRE... I HUNGER!!', 14, 0, 100, 0, 0, 0, 'Stitches');

-- DB/Quest: Harlan Needs a Resupply -- http://wotlk.openwow.com/quest=333
-- Rema Schneider SAI
SET @ENTRY := 1428;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,333,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rema Schneider - On Quest 'Harlan Needs a Resupply' Finished - Say Line 0"),
(@ENTRY,0,1,0,61,0,100,0,333,0,0,0,12,1433,3,600000,0,0,0,8,0,0,0,-8765.4,717.344,99.5342,3.88159,"Rema Schneider - On Quest 'Harlan Needs a Resupply' Finished - Summon Creature 'Corbett Schneider'");

DELETE FROM `creature_text` WHERE `entry` In (1428, 1433, 1427, 483);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(1428, 0, 0, 'Corbett, dear. Harlan needs a load of knitted shirts and pants as soon as we can manage.', 12, 0, 100, 0, 0, 0, 'Rema Schneider'), 
(1428, 0, 1, 'Corbett, you there? Harlan needs another load of knitted goods. Can you take it to him?', 12, 0, 100, 0, 0, 0, 'Rema Schneider'), 
-- 
(1433, 0, 0, 'My pleasure, sugar drop. I''ll be back soon...', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 0, 1, 'Business must be good down at the bazaar. I''ll get him resupplied right away!', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 1, 0, 'Hm... after dropping this off, I think I''ll head to that cheese shop for a snack.', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 1, 1, 'I should have a few extra coins from this sale. Maybe I''ll buy myself some lunch...', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 2, 0, 'Glad to see you''re doing so well, Harlan. And I hope to see you again soon?', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'),
(1433, 2, 1, 'Well, I am off than. Take care, Harlan!', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'),
(1433, 3, 0, 'Now for that snack...', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 4, 0, 'Hullo, Trias clan! A ball of your smoked mozzarella, if you please!', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 4, 1, 'Good day. Elling! Hullo Elaine! Let me have a wheel of blue cheese, eh?', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'),
(1433, 5, 0, 'Yes ma''am, business is brisk!', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'),
(1433, 6, 0, 'Thanks for the cheese!', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 7, 0, 'Time to get back to the shop...', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
(1433, 8, 0, 'I''m back!', 12, 0, 100, 0, 0, 0, 'Corbett Schneider'), 
-- 
(1427, 0, 0, 'Hey Harlan. Here''s a load of knitted cloth for you.', 12, 0, 100, 0, 0, 0, 'Harlan Bagley'), 
(1427, 0, 1, 'Oomph! Here''s a load of supplies. It must be selling fast!', 12, 0, 100, 0, 0, 0, 'Harlan Bagley'), 
(1427, 1, 0, 'Ah yes, and promptly delivered. As always, it''s a pleasure doing business with you, Corbett.', 12, 0, 100, 0, 0, 0, 'Harlan Bagley'), 
(1427, 1, 1, 'Ahh, much appreciated, Corbett. We''ll get these on the racks immediately.', 12, 0, 100, 0, 0, 0, 'Harlan Bagley'), 
-- 
(483, 0, 0, 'Good day, Corbett. Here''s your cheese, fresh made this morning! And how are things at your shop?', 12, 0, 100, 0, 0, 0, 'Elaine Trias'), 
(483, 0, 1, 'Hi Corbett! Here, you go! I trust business is faring well at your clothier shop...?', 12, 0, 100, 0, 0, 0, 'Elaine Trias'); 

DELETE FROM `waypoints` WHERE `entry`=1433;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`) VALUES 
(1433, 1, -8768.19, 715.132, 99.5343),
(1433, 2, -8776.53, 714.943, 99.5343),
(1433, 3, -8764.02, 718.846, 99.5343),
(1433, 4, -8756.49, 726.23, 98.1827),
(1433, 5, -8737.77, 700.301, 98.7146),
(1433, 6, -8776.04, 669.29, 103.093),
(1433, 7, -8760.53, 646.648, 103.862),
(1433, 8, -8759.42, 624.292, 101.056),
(1433, 9, -8770.38, 609.041, 97.2165),
(1433, 10, -8797.7, 588.021, 97.3042),
(1433, 11, -8818.46, 616.102, 94.9164),
(1433, 12, -8818.67, 626.67, 93.9437),
(1433, 13, -8791.16, 634.711, 94.5033),
(1433, 14, -8779.68, 637.628, 97.2233),
(1433, 15, -8781.26, 638.974, 97.2233),
(1433, 16, -8781.68, 637.128, 97.2233),
(1433, 17, -8825.46, 624.483, 93.8268),
(1433, 18, -8849.64, 602.755, 92.1315),
(1433, 19, -8864.55, 585.043, 92.84),
(1433, 20, -8856.92, 577.403, 95.375),
(1433, 21, -8849.48, 570.495, 94.68),
(1433, 22, -8856.92, 577.403, 95.375),
(1433, 23, -8864.55, 585.043, 92.84),
(1433, 24, -8837.26, 611.555, 93.3786),
(1433, 25, -8843.4, 642.051, 95.825),
(1433, 26, -8850.36, 660.501, 97.1423),
(1433, 27, -8825.86, 677.315, 97.6257),
(1433, 28, -8843.57, 720.188, 97.4082),
(1433, 29, -8801.84, 745.453, 97.5976),
(1433, 30, -8773.15, 740.631, 99.4496),
(1433, 31, -8757.46, 725.815, 98.2184),
(1433, 32, -8769.03, 714.77, 99.5337),
(1433, 33, -8778.93, 715.753, 99.5337),
(1433, 34, -8775.91, 719.409, 101.569),
(1433, 35, -8770.39, 724.865, 105.913),
(1433, 36, -8765.45, 721.19, 105.913);

-- Corbett Schneider SAI
SET @ENTRY := 1433;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Just Summoned - Set Active On"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,53,0,1433,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Just Summoned - Start Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,1,1433,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Waypoint 1 Reached - Run Script"),
(@ENTRY,0,3,0,40,0,100,0,7,1433,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Waypoint 7 Reached - Run Script"),
(@ENTRY,0,4,0,40,0,100,0,15,1433,0,0,80,@ENTRY*100+02,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Waypoint 15 Reached - Run Script"),
(@ENTRY,0,5,0,40,0,100,0,21,1433,0,0,80,@ENTRY*100+03,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Waypoint 21 Reached - Run Script"),
(@ENTRY,0,6,0,40,0,100,0,32,1433,0,0,80,@ENTRY*100+04,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Waypoint 32 Reached - Run Script"),
(@ENTRY,0,7,0,40,0,100,0,36,1433,0,0,80,@ENTRY*100+05,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Waypoint 36 Reached - Run Script");

-- Actionlist SAI
SET @ENTRY := 143300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,2500,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 0");

-- Actionlist SAI
SET @ENTRY := 143301;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 1");

-- Actionlist SAI
SET @ENTRY := 143302;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,19,1427,20,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,19,1427,20,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 1"),
(@ENTRY,9,3,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 2"),
(@ENTRY,9,4,0,0,0,100,0,30000,30000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 3");

-- Actionlist SAI
SET @ENTRY := 143303;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 4"),
(@ENTRY,9,2,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,19,483,20,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,5000,5000,0,0,1,5,0,0,0,0,0,0,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 5"),
(@ENTRY,9,4,0,0,0,100,0,5000,5000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 6"),
(@ENTRY,9,5,0,0,0,100,0,25000,25000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 7");

-- Actionlist SAI
SET @ENTRY := 143304;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Say Line 8");

-- Actionlist SAI
SET @ENTRY := 143305;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Corbett Schneider - On Script - Despawn In 2000 ms");

-- DB/Quest: Arugal Must Die -- http://wotlk.openwow.com/quest=1014
-- Dalar Dawnweaver SAI
SET @ENTRY := 1938;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=5;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,5,0,20,0,100,0,1014,0,0,0,75,8097,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dalar Dawnweaver - On Quest 'Arugal Must Die' Finished - Add Aura 'Intellect'");

-- DB/Quest: The Plaguebringer's Request -- http://wotlk.openwow.com/quest=12716
-- Noth the Plaguebringer SAI
SET @ENTRY := 28919;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,12716,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Noth the Plaguebringer - On Quest 'The Plaguebringer's Request' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 2891900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,11,52706,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Create Plague Cauldron'");

DELETE FROM `creature_text` WHERE `entry`=28919;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(28919, 0, 0, 'My task is done!', 12, 0, 100, 0, 0, 0, 'Noth the Plaguebringer');

-- Set Them Ablaze! -- http://wotlk.openwow.com/quest=3463
-- Squire Maltrake SAI
SET @ENTRY := 8509;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,3463,0,0,0,41,1,0,0,0,0,0,19,8479,20,0,0,0,0,0,"Squire Maltrake - On Quest 'Set Them Ablaze!' Finished - Despawn Instant"),
(@ENTRY,0,1,0,61,0,100,0,3463,0,0,0,12,8480,3,54000,0,0,0,8,0,0,0,-6679.93,-1194.36,240.297,2.96706,"Squire Maltrake - On Quest 'Set Them Ablaze!' Finished - Summon Creature 'Kalaran the Deceiver'");

-- factionchange 
UPDATE `creature_template` SET `faction`=35, `InhabitType`=4 WHERE  `entry`=8480;
UPDATE `creature` SET `spawntimesecs`=120 WHERE `id`=8479;

-- Kalaran the Deceiver SAI
SET @ENTRY := 8480;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Kalaran the Deceiver - On Just Summoned - Run Script");

-- Actionlist SAI
SET @ENTRY := 848000;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,4,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,19,8509,20,0,0,0,0,0,"On Script - Say Line 0"), -- 
(@ENTRY,9,5,0,0,0,100,0,2000,2000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.65994,"On Script - Set Orientation 4,65994"),
(@ENTRY,9,6,0,0,0,100,0,3000,3000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,7,0,0,0,100,0,4000,4000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 4"),
(@ENTRY,9,8,0,0,0,100,0,5000,5000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 5"),
(@ENTRY,9,9,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,19,8509,20,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,10,0,0,0,100,0,3000,3000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 6"),
(@ENTRY,9,11,0,0,0,100,0,3000,3000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 7"),
(@ENTRY,9,12,0,0,0,100,0,5000,5000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 8"),
(@ENTRY,9,13,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-6879.3,-1187.34,253.384,3.10877,"On Script - Move To Position");

DELETE FROM `creature_text` WHERE `entry`=8480;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(8480, 0, 0, 'Glorious, indeed, Maltrake. It looks as if my plan worked perfectly. Wouldn\'t you say so, mortal?', 12, 0, 100, 0, 0, 0,'Kalaran the Deceiver'),
(8480, 1, 0, '%s lets loose a reptilian laugh... at least you think it\'s a laugh.', 16, 0, 100, 0, 0, 0,'Kalaran the Deceiver'),
(8480, 2, 0, 'You would not have helped the legion of Blackrock had we just asked for your assistance, now would you?', 12, 0, 100, 0, 0, 0,'Kalaran the Deceiver'),
(8480, 3, 0, 'SILENCE FOOL!', 12, 0, 100, 0, 0, 0,'Kalaran the Deceiver'),
(8480, 4, 0, 'They will live of only to see the fruits of their labor: the destruction and chaos that will surely ensue as the legion of Blackrock invade the gorge.', 12, 0, 100, 0, 0, 0, 'Kalaran the Deceiver'),
(8480, 5, 0, 'I leave you now, mortals. Alive and with these trinkets. Maltrake! Present them with the trinkets!', 12, 0, 100, 0, 0, 0, 'Kalaran the Deceiver'),
(8480, 6, 0, '%s begins to flap his massive wings faster. He is preparing for flight.', 16, 0, 100, 0, 0, 0, 'Kalaran the Deceiver'),
(8480, 7, 0, 'Oh yes, the molt - do not lose it. There are those of my kin in the Burning Steppes that would craft items that only the molt of the black dragonflight could fortify.', 12, 0, 100, 0, 0, 0, 'Kalaran the Deceiver'),
(8480, 8, 0, 'The legion of Blackrock comes, dwarflings! We shall scorch the earth and set fire to the heavens. None shall survive...', 12, 0, 100, 0, 0, 0, 'Kalaran the Deceiver');

DELETE FROM `creature_text` WHERE `entry`=8509;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(8509, 0, 0, 'What will we do with them, master? They are of no use to us anymore.', 12, 0, 100, 1, 0, 0, 'Squire Maltrake'),
(8509, 1, 0, 'Right away, master!', 12, 0, 100, 0, 0, 0, 'Squire Maltrake');


DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=15033;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`,`NegativeCondition`) VALUES
(17,0,15033,0,0,29,0,9598,100,0,0,"","Cannot cast Summon Ancient Spirits near Arei",1);


-- [Q] Stop the Plague -- http://www.wowhead.com/quest=11677
-- Stop the Plague Kill Credit Bunny SAI
SET @ENTRY := 25654;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,2,8,0,100,0,45835,0,0,0,11,45837,0,0,0,0,0,7,0,0,0,0,0,0,0,"Stop the Plague Kill Credit Bunny - On Spellhit 'Bixie's Inhibiting Powder' - Cast 'Stop the Plague/There's Something...: Kill Credit'"),
(@ENTRY,0,1,3,8,0,100,0,45834,0,0,0,11,45837,0,0,0,0,0,7,0,0,0,0,0,0,0,"Stop the Plague Kill Credit Bunny - On Spellhit 'Highmesa's Cleansing Seeds' - Cast 'Stop the Plague/There's Something...: Kill Credit'"),
(@ENTRY,0,2,0,61,0,100,0,45835,0,0,0,45,2,2,0,0,0,0,19,23837,10,0,0,0,0,0,"Stop the Plague Kill Credit Bunny - On Spellhit 'Bixie's Inhibiting Powder' - Set Data 2 2"),
(@ENTRY,0,3,0,61,0,100,0,45834,0,0,0,45,2,2,0,0,0,0,19,23837,10,0,0,0,0,0,"Stop the Plague Kill Credit Bunny - On Spellhit 'Highmesa's Cleansing Seeds' - Set Data 2 2");

-- ELM General Purpose Bunny SAI
SET @ENTRY := 23837;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,11,52388,0,0,0,0,0,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Just Summoned - Cast 'You Reap What You Sow: Ritual Bunny Channel'"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,28671,30,0,0,0,0,0,"ELM General Purpose Bunny - On Just Summoned - Set Data 0 1"),
(@ENTRY,0,2,0,38,0,100,1,32,32,0,0,11,9010,0,0,0,0,0,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Data Set 32 32 - Cast 'Create Filled Containment Coffer' (No Repeat)"),
(@ENTRY,0,3,0,38,0,100,0,31,31,0,0,87,1636401,1636403,1636404,1636406,1636407,1636408,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Data Set 31 31 - Run Random Script"),
(@ENTRY,0,4,0,38,0,100,0,30,30,0,0,87,1636401,1636402,1636403,1636405,1636406,1636408,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Data Set 30 30 - Run Random Script"),
(@ENTRY,0,6,0,11,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,27249,0,0,0,0,0,0,"ELM General Purpose Bunny - On Respawn - Set Data 1 1"),
(@ENTRY,0,7,0,38,0,100,0,2,2,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"ELM General Purpose Bunny - On Data Set 2 2 - Despawn Instant"); 


-- [Q] Flown the Coop! -- http://wotlk.openwow.com/quest=12532
-- Chicken Escapee SAI
SET @ENTRY := 28161;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,51959,0,0,0,28,51846,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Spellhit 'Chicken Net' - Remove Aura 'Scared Chicken'"),
(@ENTRY,0,1,0,61,0,100,0,51959,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Spellhit 'Chicken Net' - Despawn In 4000 ms"),
(@ENTRY,0,2,3,64,0,100,0,0,0,0,0,85,51037,2,0,0,0,0,7,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Invoker Cast 'Capture Chicken Escapee'"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Close Gossip"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Set Npc Flag "),
(@ENTRY,0,5,6,61,0,100,0,0,0,0,0,28,51846,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Remove Aura 'Scared Chicken'"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Despawn In 500 ms"),
(@ENTRY,0,7,0,1,0,100,0,1000,1000,10000,10000,11,50734,1,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - Out of Combat - Cast 'Frenzyheart Chicken: Invisibility'"),
(@ENTRY,0,8,0,1,0,100,0,2500,2500,25000,25000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - Out of Combat - Run Script");

-- Actionlist SAI
SET @ENTRY := 2816100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,75,51846,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Script - Add Aura 'Scared Chicken'"),
(@ENTRY,9,1,0,0,0,100,0,25000,25000,0,0,24,51846,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Script - Evade");

DELETE FROM `spell_area` WHERE `spell`=50735;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(50735, 3711, 12532, 12532, 0, 0, 2, 1, 74, 11),
(50735, 3711, 12702, 12702, 0, 0, 2, 1, 74, 11),
(50735, 4292, 12532, 12532, 0, 0, 2, 1, 74, 11),
(50735, 4292, 12702, 12702, 0, 0, 2, 1, 74, 11);


UPDATE quest_template_addon SET ExclusiveGroup=0 WHERE ID=12598;

-- Natural Remedies - [A][H] http://www.wowhead.com/quest=10351/natural-remedies

SET @PATHALEON := 21504;
SET @SEEDTRIGGER := 20781;
SET @REDCRYSTAL := 20617;
SET @GOLIATHON := 19305;
DELETE FROM event_scripts WHERE id=13256;

DELETE FROM creature_text WHERE entry=@PATHALEON AND groupid IN(20, 21, 22, 23);
INSERT INTO creature_text VALUES (@PATHALEON, 20, 0, "And just what do you think you are doing? You dare to interfere with my master's experiment? ", 12, 0, 100, 0, 0, 0, 0, 0, "Pathaleon the Calculator's Image");
INSERT INTO creature_text VALUES (@PATHALEON, 21, 0, "Do you like what we've done here? Perhaps we will drop these crystals from the sky all over Outland.", 12, 0, 100, 0, 0, 0, 0, 0, "Pathaleon the Calculator's Image");
INSERT INTO creature_text VALUES (@PATHALEON, 22, 0, "I grow bored with your attempt to heal the land and quell the energies summoning and driving the colossi mad. Goliathon, King of the Colossi, Prince Kael'thas and I demand that you defend the crystal!", 12, 0, 100, 0, 0, 0, 0, 0, "Pathaleon the Calculator's Image");
INSERT INTO creature_text VALUES (@PATHALEON, 23, 0, "We will meet again soon.", 12, 0, 100, 0, 0, 0, 0, 0, "Pathaleon the Calculator's Image");

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@SEEDTRIGGER;
DELETE FROM smart_scripts WHERE entryorguid=@SEEDTRIGGER AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@SEEDTRIGGER*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Respawned - Set Phase');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER, 0, 1, 2, 8, 1, 100, 0, 35413, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Set Phase');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @SEEDTRIGGER*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Start Script');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 0, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 45, 1, 1, 0, 0, 0, 0, 11, @REDCRYSTAL, 80, 0, 0, 0, 0, 0, 'Script9 - Set Data');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 1, 0, 0, 0, 100, 0, 9000, 9000, 0, 0, 86, 35468, 0, 10, 72893, @REDCRYSTAL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cross Cast Spell Entangling Roots Visual');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, @PATHALEON, 3, 80000, 0, 0, 0, 8, 0, 0, 0, 127.82, 4835.76, 75.92, 6.15, 'Script9 - Summon Creature');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 3, 0, 0, 0, 100, 0, 500, 500, 0, 0, 86, 34776, 2, 19, @PATHALEON, 50, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cross Cast');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 4, 0, 0, 0, 100, 0, 500, 500, 0, 0, 1, 20, 0, 0, 0, 0, 0, 19, @PATHALEON, 50, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 5, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 86, 35471, 2, 10, 72891, @REDCRYSTAL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cross Cast Spell Insect Swarm');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 21, 0, 0, 0, 0, 0, 19, @PATHALEON, 50, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 7, 0, 0, 0, 100, 0, 12000, 12000, 0, 0, 86, 32783, 2, 19, @PATHALEON, 50, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cross Cast');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 22, 0, 0, 0, 0, 0, 19, @PATHALEON, 50, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 9, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 28, 32783, 0, 0, 0, 0, 0, 19, @PATHALEON, 50, 0, 0, 0, 0, 0, 'Script9 - Remove Aura 32783');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 10, 0, 0, 0, 100, 0, 9000, 9000, 0, 0, 86, 34776, 2, 19, @PATHALEON, 50, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cross Cast');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 11, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 23, 0, 0, 0, 0, 0, 19, @PATHALEON, 50, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 12, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 2000, 0, 0, 0, 0, 0, 19, @PATHALEON, 50, 0, 0, 0, 0, 0, 'Script9 - Despawn Target');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 13, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, @GOLIATHON, 4, 40000, 0, 0, 0, 8, 0, 0, 0, 114.35, 4841.9, 76.2, 5.9, 'Script9 - Summon Creature');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 14, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 45, 2, 2, 0, 0, 0, 0, 11, @REDCRYSTAL, 80, 0, 0, 0, 0, 0, 'Script9 - Set Data');
INSERT INTO smart_scripts VALUES (@SEEDTRIGGER*100, 9, 15, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Phase');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@REDCRYSTAL;
DELETE FROM smart_scripts WHERE entryorguid=@REDCRYSTAL AND source_type=0;
INSERT INTO smart_scripts VALUES (@REDCRYSTAL, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Data Set - Set Phase');
INSERT INTO smart_scripts VALUES (@REDCRYSTAL, 0, 1, 3, 38, 0, 100, 0, 2, 2, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Data Set - Set Phase');
INSERT INTO smart_scripts VALUES (@REDCRYSTAL, 0, 2, 0, 60, 1, 100, 0, 0, 0, 2500, 2500, 11, 35487, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Cast Spell');
INSERT INTO smart_scripts VALUES (@REDCRYSTAL, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 28, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Data Set - Remove all auras');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@GOLIATHON;
DELETE FROM smart_scripts WHERE entryorguid=@GOLIATHON AND source_type=0;
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 2, 0, 0, 0, 50, 0, 9000, 9000, 10000, 10000, 11, 5568, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Goliathon - In Combat - Cast 'Trample' (No Repeat)");
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 0, 0, 0, 0, 50, 0, 6000, 6000, 10000, 10000, 11, 32959, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Goliathon - In Combat - Cast 'Knock Away' (No Repeat)");
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 1, 0, 0, 0, 50, 0, 8000, 8000, 10000, 10000, 11, 33688, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Goliathon - In Combat - Cast 'Crystal Strike' (No Repeat)");
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 3, 0, 2, 0, 100, 1, 0, 90, 0, 0, 11, 33904, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goliathon - Between 0-90% Health - Cast 'Summon Goliathon Shardling' (No Repeat)");
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 4, 0, 2, 0, 100, 1, 0, 60, 0, 0, 11, 33905, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goliathon - Between 0-60% Health - Cast 'Summon Goliathon Shardling' (No Repeat)");
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 5, 0, 2, 0, 100, 1, 0, 30, 0, 0, 11, 33906, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goliathon - Between 0-30% Health - Cast 'Summon Goliathon Shardling' (No Repeat)");
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 6, 7, 60, 0, 100, 1, 200, 200, 0, 0, 11, 34776, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Goliathon - On Update - Cast 'Teleport' (No Repeat)");
INSERT INTO smart_scripts VALUES (@GOLIATHON, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 40, 0, 0, 0, 0, 0, 0, "Goliathon - On Update - Attack Start");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=35413;
INSERT INTO conditions VALUES(17, 0, 35413, 0, 0, 29, 0, @GOLIATHON, 150, 0, 1, 22, 0, '', 'Require no Goliathon nearby');


-- Escape from the Staging Grounds - [A][H] http://www.wowhead.com/quest=10425/escape-from-the-staging-grounds

SET @ENTRY := 20763;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
UPDATE creature SET spawntimesecs=300 WHERE id=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,1,19,0,100,0,10425,0,0,0,1,0,0,0,0,0,0,21,10,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Quest '' Taken - Say Line 0"),
    (@ENTRY,0,1,2,61,0,100,0,10425,0,0,0,53,0,20763,0,0,0,2,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Quest '' Taken - Start Waypoint"),
    (@ENTRY,0,2,14,61,0,100,0,10425,0,0,0,64,1,0,0,0,0,0,21,10,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Quest '' Taken - Store Targetlist"),
    (@ENTRY,0,7,0,40,0,100,0,16,20763,0,0,54,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 16 Reached - Pause Waypoint"),
    (@ENTRY,0,8,10,40,0,100,0,17,20763,0,0,15,10425,0,0,0,0,0,12,1,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 17 Reached - Quest Credit ''"),
    (@ENTRY,0,9,0,6,0,100,0,0,0,0,0,6,10425,0,0,0,0,0,12,1,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Just Died - Fail Quest ''"),
    (@ENTRY,0,10,0,61,0,100,0,17,20763,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 17 Reached - Say Line 1"),
    (@ENTRY,0,11,12,40,0,100,0,18,20763,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 18 Reached - Say Line 2"),
    (@ENTRY,0,12,13,61,0,100,0,18,20763,0,0,11,35517,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 18 Reached - Cast 'Teleport'"),
    (@ENTRY,0,13,0,61,0,100,0,18,20763,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 18 Reached - Despawn In 3000 ms"),
    (@ENTRY,0,14,0,61,0,100,0,10425,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Quest '' Taken - Set Npc Flag "),
    (@ENTRY,0,15,0,11,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Respawn - Set Npc Flag Questgiver"),
    (@ENTRY,0,16,0,0,0,100,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - In Combat - Remove Npc Flag Questgiver"),
    (@ENTRY,0,17,0,1,0,100,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - Out of Combat - Add Npc Flag Questgiver");


-- Delivering the Message - [A][H] http://www.wowhead.com/quest=10406/delivering-the-message

SET @DEMOLITIONIST := 20802;
SET @COMMANDER := 20482;
SET @ENERGYCELL := 20755;
UPDATE creature_template_addon SET bytes2=0, auras=35681 WHERE entry=@ENERGYCELL;
DELETE FROM creature_text WHERE entry IN(@DEMOLITIONIST, 20474);
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 0, 0, 'Let''s do this... Just keep me covered and I''ll deliver the package.', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 1, 0, 'I''m under attack! I repeat, I am under attack!', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 2, 0, 'By the second sun of K''aresh, look at this place! I can only imagine what Salhadaar is planning. Come on, let''s keep going.', 12, 0, 100, 5, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 3, 0, 'Look there, fleshling! Salhadaar''s conduits! He''s keeping well fed...', 12, 0, 100, 25, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 4, 0, 'Alright, keep me protected while I plant this disruptor. This shouldn''t take very long...', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 5, 0, 'Done! Back up! Back up!', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 6, 0, 'Looks like my work here is done. Report to the holo-image of Ameer over at the transporter.', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (20474, 0, 0, 'Protect the conduit! Stop the intruders!', 12, 0, 100, 0, 0, 0, 0, 0, 'Ethereum Nexus-Stalker');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry IN(@COMMANDER, @DEMOLITIONIST, @ENERGYCELL);
UPDATE creature_template SET speed_walk=1.5, speed_run=1, RegenHealth=0 WHERE entry=@DEMOLITIONIST;
UPDATE creature_template SET scale=2 WHERE entry=@ENERGYCELL;
DELETE FROM smart_scripts WHERE entryorguid IN(@COMMANDER, @DEMOLITIONIST, @ENERGYCELL) AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@DEMOLITIONIST*100 AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES 
    (@COMMANDER, 0, 0, 0, 19, 0, 100, 0, 10406, 0, 0, 0, 85, 35679, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On Quest Accept - Invoker Cast'),
    (@DEMOLITIONIST, 0, 0, 1, 37, 0, 100, 0, 0, 0, 0, 0, 53, 0, @DEMOLITIONIST, 0, 10406, 5000, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On AI Init - Start WP'),
    (@DEMOLITIONIST, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On AI Init - Talk'),
    (@DEMOLITIONIST, 0, 2, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On Aggro - Talk'),
    (@DEMOLITIONIST, 0, 3, 0, 40, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reach - Set Home Pos'),
    (@DEMOLITIONIST, 0, 4, 5, 40, 0, 100, 0, 6, 0, 0, 0, 54, 6000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - WP Pause'),
    (@DEMOLITIONIST, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Talk'),
    (@DEMOLITIONIST, 0, 6, 7, 40, 0, 100, 0, 11, 0, 0, 0, 54, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - WP Pause'),
    (@DEMOLITIONIST, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Talk'),
    (@DEMOLITIONIST, 0, 8, 9, 40, 0, 100, 0, 14, 0, 0, 0, 54, 30000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - WP Pause'),
    (@DEMOLITIONIST, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @DEMOLITIONIST*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Script9'),
    (@DEMOLITIONIST, 0, 10, 11, 56, 0, 100, 0, 14, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Resume - Talk'),
    (@DEMOLITIONIST, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Resume - Remove Emote State'),
    (@DEMOLITIONIST, 0, 12, 13, 40, 0, 100, 0, 15, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Talk'),
    (@DEMOLITIONIST, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 11, @ENERGYCELL, 50, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Set Data'),
    (@DEMOLITIONIST, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, 11, 35682, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Cast Spell'),
    (@DEMOLITIONIST, 0, 15, 0, 61, 0, 100, 0, 0, 0, 0, 0, 15, 10406, 0, 0, 0, 0, 0, 17, 0, 50, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Complete quest'),
    (@DEMOLITIONIST*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 469, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - Script9 - Set Emote State'),
    (@DEMOLITIONIST*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - Script9 - Talk'),
    (@DEMOLITIONIST*100, 9, 2, 0, 0, 0, 100, 1, 2000, 2000, 0, 0, 12, 20474, 4, 40000, 0, 1, 0, 8, 0, 0, 0, 3864, 2341.1, 115.4, 4.9, 'Protectorate Demolitionist - Script9 - Summon Creature'),
    (@DEMOLITIONIST*100, 9, 3, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 12, 20474, 4, 40000, 0, 1, 0, 8, 0, 0, 0, 3867, 2341.1, 115.4, 4.9, 'Protectorate Demolitionist - Script9 - Summon Creature'),
    (@DEMOLITIONIST*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, 20474, 50, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - Script9 - Talk'),
    (@DEMOLITIONIST*100, 9, 5, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 12, 20474, 4, 40000, 0, 1, 0, 8, 0, 0, 0, 3870, 2341.1, 115.4, 4.9, 'Protectorate Demolitionist - Script9 - Summon Creature'),
    (@ENERGYCELL, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 11, 40799, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On Spell Hit - Cast Spell');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceEntry=@COMMANDER;
INSERT INTO conditions VALUES (22, 1, @COMMANDER, 0, 0, 1, 0, 35679, 1, 0, 1, 0, 0, '', 'Requires Player without aura');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=35682;
INSERT INTO conditions VALUES (13, 1, 35682, 0, 0, 31, 0, 3, @ENERGYCELL, 0, 0, 0, 0, '', 'Target Ethereum Energy Cell');
INSERT INTO conditions VALUES (13, 1, 35682, 0, 1, 31, 0, 3, 20769, 0, 0, 0, 0, '', 'Target Salaadin Energy Ball');

DELETE FROM waypoints WHERE entry=@DEMOLITIONIST;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@DEMOLITIONIST, 1, 4015.68, 2322.49, 113.825, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 2, 4007.63, 2323.53, 111.428, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 3, 3998.41, 2324.73, 113.084, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 4, 3973, 2328.02, 114.082, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 5, 3951.87, 2328.36, 113.983, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 6, 3939.16, 2330.01, 112.224, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 7, 3931.58, 2332.9, 110.878, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 8, 3922.88, 2336.22, 112.603, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 9, 3910.8, 2345.43, 114.132, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 10, 3885.74, 2364.52, 114.827, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 11, 3874.4, 2383.68, 113.784, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 12, 3871.9, 2360.65, 114.97, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 13, 3866.8, 2341.7, 115.65, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 14, 3872.97, 2321.61, 114.52, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 15, 3866.8, 2341.7, 115.65, 'Protectorate Demolitionist');


-- The Big Bone Worm - [A][H] http://www.wowhead.com/quest=10930/the-big-bone-worm

DELETE FROM spell_script_names WHERE spell_id=39238;
INSERT INTO spell_script_names VALUES (39238, 'spell_q10929_fumping');

DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(13, 17) AND SourceEntry=39246;
INSERT INTO conditions VALUES (17, 0, 39246, 0, 0, 29, 0, 22105, 5, 1, 0, 0, 0, '', 'Requires Dead Clefthoof');
INSERT INTO conditions VALUES (13, 4, 39246, 0, 0, 31, 0, 3, 22105, 0, 0, 0, 0, '', 'Target Dead Clefthoof');
DELETE FROM spell_script_names WHERE spell_id=39246;
INSERT INTO spell_script_names VALUES (39246, 'spell_q10930_big_bone_worm');
DELETE FROM creature_template_addon WHERE entry IN(22038, 22482);
INSERT INTO creature_template_addon
VALUES
    (22038, 0, 0, 9, 0, 0, ''),
    (22482, 0, 0, 9, 0, 0, '');

UPDATE creature_template SET modelid1=11686, mechanic_immune_mask=mechanic_immune_mask|0x20, flags_extra=0x200000, AIName='SmartAI', ScriptName='' WHERE entry IN(22038, 22482);
DELETE FROM smart_scripts WHERE entryorguid IN(22038, 22482) AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (22038, 0, 0, 1, 37, 0, 100, 0, 0, 0, 0, 0, 18, 33554432, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On AI Init - Set Unit Flag'),
    (22038, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 19, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On AI Init - Remove Unit Flag'),
    (22038, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 37989, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On AI Init - Cast Tunnel Bore Passive'),
    (22038, 0, 4, 5, 4, 0, 100, 0, 0, 0, 0, 0, 19, 33554432, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Aggro - Remove Unit Flag'),
    (22038, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 18, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Aggro - Set Unit Flag'),
    (22038, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 28, 37989, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Aggro - Remove Aura Tunnel Bore Passive'),
    (22038, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 147, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Aggro - Stop Motion'),
    (22038, 0, 8, 0, 0, 0, 100, 1, 0, 0, 0, 0, 3, 0, 20746, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - In Combat - Change Model'),
    (22038, 0, 9, 0, 0, 0, 100, 1, 500, 500, 0, 0, 91, 9, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - In Combat - Remove Bytes0'),
    (22038, 0, 10, 0, 0, 0, 100, 0, 1000, 6000, 8000, 11000, 11, 32738, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - In Combat - Cast Bore'),
    (22038, 0, 11, 0, 9, 0, 100, 0, 4, 50, 2000, 3500, 11, 31747, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - Within Range 5-50yd - Cast Poison'),
    (22038, 0, 12, 0, 7, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Evade - Despawn'),
    (22482, 0, 0, 1, 37, 0, 100, 0, 0, 0, 0, 0, 18, 33554432, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On AI Init - Set Unit Flag'),
    (22482, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 19, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On AI Init - Remove Unit Flag'),
    (22482, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 37989, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On AI Init - Cast Tunnel Bore Passive'),
    (22482, 0, 4, 5, 4, 0, 100, 0, 0, 0, 0, 0, 19, 33554432, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Aggro - Remove Unit Flag'),
    (22482, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 18, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Aggro - Set Unit Flag'),
    (22482, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 28, 37989, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Aggro - Remove Aura Tunnel Bore Passive'),
    (22482, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 147, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Aggro - Stop Motion'),
    (22482, 0, 8, 0, 0, 0, 100, 1, 0, 0, 0, 0, 3, 0, 20617, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - In Combat - Change Model'),
    (22482, 0, 9, 0, 0, 0, 100, 1, 500, 500, 0, 0, 91, 9, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - In Combat - Remove Bytes0'),
    (22482, 0, 10, 0, 0, 0, 100, 0, 1000, 6000, 8000, 11000, 11, 32738, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - In Combat - Cast Bore'),
    (22482, 0, 11, 0, 9, 0, 100, 0, 4, 50, 2000, 3500, 11, 31747, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - Within Range 5-50yd - Cast Poison'),
    (22482, 0, 12, 0, 7, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Evade - Despawn');

DELETE FROM creature_text WHERE entry=22483;
INSERT INTO creature_text VALUES (22483, 0, 0, 'AHHHHHH-YAAA-YAAA-YAAA!!!!', 12, 0, 100, 0, 0, 0, 0, 0, 'Sand Gnome');
INSERT INTO creature_text VALUES (22483, 0, 1, 'AYYAYAAYAA!', 12, 0, 100, 0, 0, 0, 0, 0, 'Sand Gnome');
INSERT INTO creature_text VALUES (22483, 0, 2, 'AAAAAAAAEEEEEEEEEE!!!!!!!!', 12, 0, 100, 0, 0, 0, 0, 0, 'Sand Gnome');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=22483;
DELETE FROM smart_scripts WHERE entryorguid=22483 AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (22483, 0, 0, 1, 25, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sand Gnome - On Reset - Say Line 0'),
    (22483, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 30, 0, 0, 0, 0, 0, 0, 'Sand Gnome - On Reset - Attack Start');


-- Terokk's Downfall - [A][H] http://www.wowhead.com/quest=11073/terokks-downfall

SET @TEROKK := 21838;
SET @SKYGUARD := 23377;
SET @TARGET := 23277;
SET @SKULLPIE := 185928;

UPDATE gameobject_template SET AIName="SmartGameObjectAI" WHERE entry=@SKULLPIE;
DELETE FROM gossip_menu_option WHERE menu_id=8687;
INSERT INTO gossip_menu_option VALUES(8687, 1, 0, "<Call forth Terokk.>", 0, 1, 1, 0, 0, 0, 0, "", 0);

DELETE FROM event_scripts WHERE id=15014;
INSERT INTO event_scripts VALUES(15014, 4, 10, @TEROKK, 600000, 1, -3788, 3509, 287, 5.7);

DELETE FROM smart_scripts WHERE entryorguid=@SKULLPIE AND source_type=1;
INSERT INTO smart_scripts VALUES (@SKULLPIE, 1, 0, 1, 62, 0, 100, 0, 8687, 1, 0, 0, 85, 41004, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Terokk summon');
INSERT INTO smart_scripts VALUES (@SKULLPIE, 1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Terokk summon - linked close gossip');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup IN(8687);

DELETE FROM creature_text WHERE entry=@TEROKK;
INSERT INTO creature_text VALUES (@TEROKK, 0, 0, "Who calls me to this world? The stars are not yet aligned... my powers fail me! You will pay for this!", 12, 0, 100, 0, 0, 0, 0, 0, 'Terokk');
INSERT INTO creature_text VALUES (@TEROKK, 1, 0, "You cannot kill me, I am immortal!", 14, 0, 100, 0, 0, 0, 0, 0, 'Terokk');
INSERT INTO creature_text VALUES (@TEROKK, 2, 0, "%s becomes enraged as his shield shatters.", 41, 0, 100, 0, 0, 0, 0, 0, 'Terokk');

DELETE FROM smart_scripts WHERE entryorguid=@TEROKK AND source_type=0;
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 0, 0, 0, 0, 100, 0, 4000, 7000, 10000, 15000, 11, 40721, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Terokk - In Combat - Cast 'Shadow Bolt Volley'");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 1, 0, 0, 0, 100, 0, 6000, 9000, 7000, 9000, 11, 15284, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Terokk - In Combat - Cast 'Cleave'");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 2, 3, 2, 0, 100, 1, 0, 30, 120000, 120000, 11, 40733, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Between 0-30% Health - Cast 'Divine Shield' (No Repeat)");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Between 0-30% Health - Say Line 0 (No Repeat)");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, @SKYGUARD, 90, 0, 0, 0, 0, 0, "Terokk - Between 0-30% Health - Set Data");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 5, 6, 23, 0, 100, 0, 40657, 1, 600000, 600000, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Has Aura - Talk 2");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 11, 28747, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Has Aura - Cast Frenzy");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 28, 40733, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Has Aura - Remove Aura Divine Shield");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 8, 0, 6, 0, 100, 1, 0, 0, 0, 0, 11, 40722, 7, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Terokk - On Just Died - Cast 'Will of the Arakkoa God' (No Repeat)");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 9, 10, 4, 0, 100, 1, 0, 0, 0, 0, 12, @SKYGUARD, 3, 240000, 0, 0, 0, 8, 0, 0, 0, -3771.60, 3499.32, 317.88, 2.5, "Terokk - On Aggro - Summon Creature");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @SKYGUARD, 90, 0, 0, 0, 0, 0, "Terokk - On Aggro - Talk Target 0");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 11, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - On Respawn - Talk 0");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 12, 13, 7, 0, 100, 0, 0, 0, 0, 0, 28, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - On Evade - Remove All Auras");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 13, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, @SKYGUARD, 90, 0, 0, 0, 0, 0, "Terokk - On Evade - Despawn Target");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 14, 0, 60, 0, 100, 1, 0, 0, 0, 0, 11, 39579, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - On Update - Cast Shadowform");

DELETE FROM creature_text WHERE entry=@SKYGUARD;
INSERT INTO creature_text VALUES (@SKYGUARD, 0, 0, "Enemy sighted! Fall into formation and prepare for bombing maneuvers!", 14, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Ace');
INSERT INTO creature_text VALUES (@SKYGUARD, 1, 0, "Quickly! Use the flames and support ground troops. Its ancient magic should cleanse Terokk's shield.", 14, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Ace');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=40657;
INSERT INTO conditions VALUES(13, 6, 40657, 0, 0, 31, 0, 3, @TARGET, 0, 0, 0, 0, '', 'Requires Skyguard Target');

DELETE FROM creature_template_addon WHERE entry IN(@SKYGUARD,@TARGET);
INSERT INTO creature_template_addon VALUES (@SKYGUARD, 0, 21152, 0, 1, 0, '');
INSERT INTO creature_template_addon VALUES (@TARGET, 0, 0, 0, 1, 0, '40656');

UPDATE creature_template SET InhabitType=4, AIName='NullCreatureAI', ScriptName='', flags_extra=128 WHERE entry=@TARGET;
UPDATE creature_template SET faction=1856, InhabitType=4, AIName='SmartAI', ScriptName='' WHERE entry=@SKYGUARD;
DELETE FROM smart_scripts WHERE entryorguid=@SKYGUARD AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@SKYGUARD*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (@SKYGUARD, 0, 0, 0, 60, 0, 100, 0, 5000, 5000, 5000, 5000, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Update - Despawn");
INSERT INTO smart_scripts VALUES (@SKYGUARD, 0, 1, 2, 38, 0, 100, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Data Set - Talk 1");
INSERT INTO smart_scripts VALUES (@SKYGUARD, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @SKYGUARD*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Data Set - Start Script");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 0, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3805, 3515, 287.2, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 1, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 2, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3797, 3489, 287.1, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 3, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 4, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3770, 3501, 287.1, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 5, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 6, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3805, 3515, 287.2, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 7, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 8, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3797, 3489, 287.1, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 9, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 10, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3770, 3501, 287.1, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 11, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceEntry=@SKYGUARD;
INSERT INTO conditions VALUES(22, 1, @SKYGUARD, 0, 0, 29, 1, @TEROKK, 100, 0, 1, 0, 0, '', 'Run action if no npc nearby');


-- Discovering Your Roots - [A][H] http://www.wowhead.com/quest=11520/discovering-your-roots
-- Rediscovering Your Roots - [A][H] http://www.wowhead.com/quest=11521/rediscovering-your-roots

DELETE FROM spell_script_names WHERE spell_id=44935;
INSERT INTO spell_script_names (spell_id, ScriptName)
VALUES
    (44935, 'spell_q11520_discovering_your_roots');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=44941;
INSERT INTO conditions VALUES (13, 1, 44941, 0, 0, 31, 0, 5, 187073, 0, 0, 0, 0, '', 'Target Razorthorn Dirt Mound'); 

-- Escape from Skettis - [A][H] http://www.wowhead.com/quest=11085/escape-from-skettis

SET @PRISONER := 23383;
UPDATE quest_template_addon SET SpecialFlags=3 WHERE Id=11085;

DELETE FROM creature WHERE id=@PRISONER;
DELETE FROM creature WHERE id=@PRISONER and guid=12548;
INSERT INTO creature VALUES (12548, @PRISONER, 530, 0, 0, 1, 1, 0, 0, -4106.62, 3029.94, 344.877, 0.827394, 300, 0, 0, 6986, 0, 0, 0, 0, 0, 0);

DELETE FROM creature_text WHERE entry=@PRISONER;
INSERT INTO creature_text VALUES(@PRISONER, 0, 0, "Thanks for your help. Let's get out of here!", 12, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Prisoner');
INSERT INTO creature_text VALUES(@PRISONER, 1, 0, "Let's keep moving. I don't like this place.", 12, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Prisoner');
INSERT INTO creature_text VALUES(@PRISONER, 2, 0, "Thanks again. Sergeant Doryn will be glad to hear he has one less scout to replace this week.", 12, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Prisoner');

UPDATE creature_template SET speed_run=1, AIName='SmartAI' WHERE entry=@PRISONER;
DELETE FROM smart_scripts WHERE entryorguid=@PRISONER AND source_type=0;
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 0, 1, 19, 0, 100, 0, 11085, 0, 0, 0, 53, 0, @PRISONER, 0, 11085, 5000, 2, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Start WP');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 15, 185952, 10, 0, 0, 0, 0, 0, 'On Quest Accept - Activate GO');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 2, 3, 40, 0, 100, 0, 1, 0, 0, 0, 54, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Pause Path');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Talk');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 4, 0, 25, 0, 30, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Talk');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 5, 6, 40, 0, 100, 0, 22, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Talk');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Despawn');

DELETE FROM waypoints WHERE entry=@PRISONER;
INSERT INTO waypoints 
VALUES 
    (@PRISONER, 1, -4108.06, 3031.46, 344.879, 'Skyguard Prisoner'),
    (@PRISONER, 2, -4110.58, 3034.34, 344.121, 'Skyguard Prisoner'),
    (@PRISONER, 3, -4116.37, 3033.79, 344.083, 'Skyguard Prisoner'),
    (@PRISONER, 4, -4122.83, 3027.09, 344.149, 'Skyguard Prisoner'),
    (@PRISONER, 5, -4126.33, 3027.21, 344.158, 'Skyguard Prisoner'),
    (@PRISONER, 6, -4128.94, 3026.88, 344.021, 'Skyguard Prisoner'),
    (@PRISONER, 7, -4135.6, 3028.52, 339.992, 'Skyguard Prisoner'),
    (@PRISONER, 8, -4144.75, 3030.27, 337.474, 'Skyguard Prisoner'),
    (@PRISONER, 9, -4157.26, 3032.66, 337.446, 'Skyguard Prisoner'),
    (@PRISONER, 10, -4171.01, 3035.29, 342.801, 'Skyguard Prisoner'),
    (@PRISONER, 11, -4172.98, 3035.67, 343.267, 'Skyguard Prisoner'),
    (@PRISONER, 12, -4175.09, 3039.7, 343.64, 'Skyguard Prisoner'),
    (@PRISONER, 13, -4176.68, 3049.94, 344.072, 'Skyguard Prisoner'),
    (@PRISONER, 14, -4182.15, 3056.03, 344.146, 'Skyguard Prisoner'),
    (@PRISONER, 15, -4185.25, 3060.86, 344.157, 'Skyguard Prisoner'),
    (@PRISONER, 16, -4184.97, 3062.4, 344.152, 'Skyguard Prisoner'),
    (@PRISONER, 17, -4183.71, 3065.44, 342.625, 'Skyguard Prisoner'),
    (@PRISONER, 18, -4181.35, 3071.13, 336.977, 'Skyguard Prisoner'),
    (@PRISONER, 19, -4179.91, 3079.19, 329.741, 'Skyguard Prisoner'),
    (@PRISONER, 20, -4178.71, 3085.91, 325.563, 'Skyguard Prisoner'),
    (@PRISONER, 21, -4178.18, 3088.9, 324.177, 'Skyguard Prisoner'),
    (@PRISONER, 22, -4175.07, 3094.67, 323.426, 'Skyguard Prisoner');



-- DB/Quest: The summoning Chamber http://www.wowhead.com/quest=10602 (H) http://www.wowhead.com/quest=10585 (A)
UPDATE `event_scripts` SET `x`=-3367.8251, `y`=2143.94848, `z`=-8.2855, `o`=0.1641 WHERE  `id`=13980;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=37285;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`, `NegativeCondition`) VALUES
(17,0,37285,0,0,29,0,21735,100,0,0,"","Do not cast 'Disrupt Summoning Ritual' near Infernal Oversoul", 1),
(17,0,37285,0,0,29,0,21210,50,0,0,"","Cast 'Disrupt Summoning Ritual' only near Invis Deathforge Caster", 0);


-- Anatoly Will Talk - [A][H] http://www.wowhead.com/quest=12330/anatoly-will-talk

SET @HORSE := 27626;
SET @TATJANA := 27627;

DELETE FROM creature WHERE id=@TATJANA; -- I wan't to be sure that there aren't any other Tatjanas out there.
DELETE FROM creature WHERE guid=3110519 AND id=@TATJANA;
INSERT INTO creature (guid, id, map, zoneId, areaId, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags, VerifiedBuild)
VALUES
    (3110519, @TATJANA, 571, 0, 0, 1, 1, 0, 1, 4034.35, -4376.06, 262.11, 4.31, 300, 0, 0, 10282, 0, 0, 0, 0, 0, 0);

UPDATE creature_template SET unit_flags=256 where entry=@HORSE;
UPDATE creature SET unit_flags=256 WHERE id=@HORSE and guid=118047;

DELETE FROM smart_scripts WHERE entryorguid IN(@HORSE, @TATJANA) AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@HORSE*100 AND source_type=9;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment)
VALUES
    (@HORSE, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 28, 49138, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana''s Horse - On spawn - Remove aura Mount Tatjana''s Horse'),
    (@HORSE, 0, 1, 2, 8, 0, 100, 0, 49135, 0, 0, 0, 2, 1812, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana''s Horse - On spellhit Tatjana Ping - Set faction'),
    (@HORSE, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana''s Horse - On spellhit Tatjana Ping - Stop autoattack'),
    (@HORSE, 0, 4, 0, 8, 0, 100, 0, 49138, 0, 0, 0, 80, @HORSE*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana''s Horse - On spellhit Mount Tatjana''s Horse (phase 1) - Run script'),
    (@HORSE, 0, 5, 6, 40, 0, 100, 0, 19, 0, 0, 0, 28, 49138, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana''s Horse - On WP 19 reached - Remove aura Mount Tatjana''s Horse'),
    (@HORSE, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 15, 12330, 0, 0, 0, 0, 0, 21, 2, 0, 0, 0, 0, 0, 0, 'Tatjana''s Horse - On WP 19 reached - Quest credit'),
    (@HORSE, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 9, 26971, 0, 30, 0, 0, 0, 0, 'Tatjana''s Horse - On WP 19 reached - Set data 0 1'),
    (@HORSE, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana''s Horse - On WP 19 reached - Despawn'),
    (@HORSE, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 2, 0, 0, 0, 0, 9, @TATJANA, 0, 30, 0, 0, 0, 0, 'Tatjana''s Horse - On WP 19 reached - Set data 0 1'),
    (@TATJANA, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 19, 256+512+131072+262144, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana - On respawn - Remove unit_flags'),
    (@TATJANA, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 43671, 0, 0, 0, 0, 0, 9, @HORSE, 0, 5, 0, 0, 0, 0, 'Tatjana - On respawn - Spellcast Ride Vehicle'),
    (@TATJANA, 0, 2, 3, 8, 0, 100, 0, 49134, 0, 0, 0, 11, 49135, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana - On spellhit Tranquilizer Dart - Spellcast Tatjana Ping'),
    (@TATJANA, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 18, 256+512+131072+262144, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana - On spellhit Tranquilizer Dart - Set unit_flags'),
    (@TATJANA, 0, 4, 0, 0, 0, 100, 0, 2000, 6000, 9000, 12000, 11, 32009, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Tatjana - On update IC - Spellcast Cutdown'),
    (@TATJANA, 0, 5, 0, 38, 0, 100, 0, 0, 1, 0, 0, 41, 15000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana - On data set 0 1 - Despawn after 15 seconds'),
    (@TATJANA, 0, 6, 0, 38, 0, 100, 0, 0, 2, 0, 0, 101, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tatjana - On data set 0 2 - Set home position'),
    (@HORSE*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 19, 524288, 0, 0, 0, 0, 0, 9, 0, 0, 50, 0, 0, 0, 0, "Tatjana's Horse - On Script - Remove Flag In Combat"),
    (@HORSE*100, 9, 1, 0, 0, 0, 100, 0, 500, 500, 0, 0, 53, 1, 27626, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Tatjana's Horse - On Script - Start Waypoint"),
    (@HORSE*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Tatjana's Horse - On Script - Set Faction 35");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceEntry=@HORSE;
INSERT INTO conditions VALUES (22, 5, @HORSE, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', 'Run action if invoker is player');


-- Battling the Elements -- [A][H] http://www.wowhead.com/quest=12967/battling-the-elements
DELETE FROM `spell_linked_spell` WHERE (`spell_trigger`='56753');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `comment`) VALUES ('56753', '-56750', 'Remove Gather Snow aura on Throw Snowball cast');
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`='17') AND (`SourceEntry`='56753');
INSERT INTO conditions VALUES
(17, 0, 56753, 0, 0, 31, 1, 3, 30120, 0, 0, 0, 0, '', 'Throw Snowball requires Seething Revenants'),
(17, 0, 56753, 0, 1, 31, 1, 3, 30121, 0, 0, 0, 0, '', 'Throw Snowball requires Seething Revenants');



--  DB/Quest: There Exists No Honor Among Birds -- http://www.wowhead.com/quest=11470
DELETE FROM `creature_template_addon` WHERE `entry`=24783;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(24783, 0, 0, 0, 1, 0, 43775);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN(13,17) AND `SourceEntry`=44422;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,44422,0,0,30,0,186946,5,0,0,0,0,'',"Spell 'Scavenge' target GameObject 'Fjord Hawk Egg'"),
(13,1,44422,0,0,31,0,5,186946,0,0,0,0,'',"Spell 'Scavenge' target GameObject 'Fjord Hawk Egg'");

-- Fjord Hawk Matriarch
UPDATE `creature_template` SET `InhabitType`='5' WHERE  `entry`=24787;
-- Pathing for Entry: 24787 'TDB FORMAT' 
SET @NPC := 115835;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=491.5974,`position_y`=-6158.39,`position_z`=144.1042 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '43775');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,491.5974,-6158.39,144.1042,0,0,1,0,100,0),
(@PATH,2,509.5939,-6162.629,111.2709,0,0,1,0,100,0),
(@PATH,3,526.574,-6162.785,95.60418,0,0,1,0,100,0),
(@PATH,4,574.4791,-6163.997,95.60418,0,0,1,0,100,0),
(@PATH,5,603.0228,-6169.135,135.1598,0,0,1,0,100,0),
(@PATH,6,621.6965,-6158.342,152.5963,0,0,1,0,100,0),
(@PATH,7,637.6,-6155.499,154.6354,0,0,1,0,100,0),
(@PATH,8,663.0421,-6125.693,179.4132,0,0,1,0,100,0),
(@PATH,9,656.72,-6138.115,215.4652,0,0,1,0,100,0),
(@PATH,10,639.1322,-6143.215,215.4652,0,0,1,0,100,0),
(@PATH,11,618.7733,-6150.35,208.0208,0,0,1,0,100,0),
(@PATH,12,588.9388,-6145.327,208.0208,0,0,1,0,100,0),
(@PATH,13,554.6487,-6152.367,187.5208,0,0,1,0,100,0),
(@PATH,14,528.2413,-6138.124,166.6597,0,0,1,0,100,0),
(@PATH,15,497.937,-6157.058,187.5208,0,0,1,0,100,0),
(@PATH,16,482.7061,-6146.376,174.6875,0,0,1,0,100,0),
(@PATH,17,491.5974,-6158.39,144.1042,0,0,1,0,100,0);

-- Pathing for Entry: 24787 'TDB FORMAT' 
SET @NPC := 115836;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=520.6224,`position_y`=-6137.84,`position_z`=169.3022 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '43775');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,520.6224,-6137.84,169.3022,0,0,1,0,100,0),
(@PATH,2,539.8384,-6131.232,149.1912,0,0,1,0,100,0),
(@PATH,3,520.709,-6158.917,160.4134,0,0,1,0,100,0),
(@PATH,4,485.8767,-6155.685,160.4134,0,0,1,0,100,0),
(@PATH,5,438.8145,-6158.287,160.4134,0,0,1,0,100,0),
(@PATH,6,419.3206,-6156.742,160.4134,0,0,1,0,100,0),
(@PATH,7,390.6546,-6143.165,160.4134,0,0,1,0,100,0),
(@PATH,8,377.2733,-6114.98,160.4134,0,0,1,0,100,0),
(@PATH,9,383.0898,-6128.999,185.83,0,0,0,1,100,0),
(@PATH,10,417.4906,-6154.904,185.83,0,0,1,0,100,0),
(@PATH,11,452.2428,-6147.803,185.83,0,0,1,0,100,0),
(@PATH,12,497.4655,-6150.674,185.83,0,0,1,0,100,0),
(@PATH,13,520.6224,-6137.84,169.3022,0,0,1,0,100,0);

-- Pathing for Entry: 24787 'TDB FORMAT' 
SET @NPC := 115837;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=596.8774,`position_y`=-6114.975,`position_z`=271.1343 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '43775');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,596.8774,-6114.975,271.1343,0,0,1,0,100,0),
(@PATH,2,595.4591,-6109.405,278.3748,0,0,1,0,100,0),
(@PATH,3,571.2776,-6109.743,290.4025,0,0,1,0,100,0),
(@PATH,4,556.7193,-6108.814,297.3566,0,0,1,0,100,0),
(@PATH,5,517.0029,-6104.844,297.3566,0,0,1,0,100,0),
(@PATH,6,503.9214,-6117.692,297.3566,0,0,1,0,100,0),
(@PATH,7,466.3313,-6107.801,271.1343,0,0,1,0,100,0),
(@PATH,8,475.6375,-6120.523,271.1343,0,0,1,0,100,0),
(@PATH,9,500.4033,-6130.543,271.1343,0,0,1,0,100,0),
(@PATH,10,542.1522,-6114.92,271.1343,0,0,1,0,100,0),
(@PATH,11,567.1166,-6129.524,271.1343,0,0,1,0,100,0),
(@PATH,12,596.8774,-6114.975,271.1343,0,0,1,0,100,0);

-- Pathing for Entry: 24787 'TDB FORMAT' 
SET @NPC := 115843;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=290.8945,`position_y`=-6070.151,`position_z`=84.36917 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '43775');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,290.8945,-6070.151,84.36917,0,0,1,0,100,0),
(@PATH,2,273.076,-6034.628,84.36917,0,0,1,0,100,0),
(@PATH,3,268.3575,-6009.71,121.8221,0,0,1,0,100,0),
(@PATH,4,282.7736,-6034.701,150.6469,0,0,1,0,100,0),
(@PATH,5,297.921,-6060.3,111.1191,0,0,1,0,100,0),
(@PATH,6,324.4433,-6101.173,115.008,0,0,1,0,100,0),
(@PATH,7,351.7174,-6115.625,115.008,0,0,1,0,100,0),
(@PATH,8,380.059,-6146.51,102.4525,0,0,1,0,100,0),
(@PATH,9,381.592,-6162.233,80.36916,0,0,1,0,100,0),
(@PATH,10,363.2276,-6145.913,80.36916,0,0,1,0,100,0),
(@PATH,11,338.3981,-6105.44,80.36916,0,0,1,0,100,0),
(@PATH,12,319.2164,-6096.714,84.36917,0,0,1,0,100,0),
(@PATH,13,290.8945,-6070.151,84.36917,0,0,1,0,100,0);

-- Pathing for Entry: 24787 'TDB FORMAT' 
SET @NPC := 115845;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=360.9156,`position_y`=-6061.682,`position_z`=302.8403 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '43775');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,360.9156,-6061.682,302.8403,0,0,1,0,100,0),
(@PATH,2,389.247,-6078.495,302.8403,0,0,1,0,100,0),
(@PATH,3,392.2037,-6094.839,296.007,0,0,1,0,100,0),
(@PATH,4,374.589,-6096.534,288.5903,0,0,1,0,100,0),
(@PATH,5,358.6935,-6082.393,274.9237,0,0,1,0,100,0),
(@PATH,6,338.8949,-6049.761,274.9237,0,0,1,0,100,0),
(@PATH,7,320.3495,-6021.407,274.9237,0,0,1,0,100,0),
(@PATH,8,306.0276,-5998.132,285.257,0,0,1,0,100,0),
(@PATH,9,313.4884,-5983.751,285.2291,0,0,1,0,100,0),
(@PATH,10,320.7385,-5972.151,286.1277,0,0,1,0,100,0),
(@PATH,11,330.6828,-6007.996,302.8403,0,0,1,0,100,0),
(@PATH,12,349.4529,-6033.62,302.8403,0,0,1,0,100,0),
(@PATH,13,360.9156,-6061.682,302.8403,0,0,1,0,100,0);

-- Pathing for Entry: 24787 'TDB FORMAT' 
SET @NPC := 115844;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=389.949,`position_y`=-6113.926,`position_z`=217.1557 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '43775');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,389.949,-6113.926,217.1557,0,0,1,0,100,0),
(@PATH,2,365.9727,-6083.048,249.1279,0,0,1,0,100,0),
(@PATH,3,348.9503,-6058.797,249.1279,0,0,1,0,100,0),
(@PATH,4,334.4755,-6041.239,249.1279,0,0,1,0,100,0),
(@PATH,5,306.4679,-6010.077,240.8223,0,0,1,0,100,0),
(@PATH,6,305.4742,-6011.148,217.1557,0,0,1,0,100,0),
(@PATH,7,308.0244,-6019.713,217.1557,0,0,1,0,100,0),
(@PATH,8,331.7084,-6052.974,217.1557,0,0,1,0,100,0),
(@PATH,9,350.9348,-6071.563,217.1557,0,0,1,0,100,0),
(@PATH,10,371.7133,-6102.678,217.1557,0,0,1,0,100,0),
(@PATH,11,389.949,-6113.926,217.1557,0,0,1,0,100,0);

-- The Shining Light - [A] - http://www.wowhead.com/quest=11288/the-shining-light
DELETE FROM `conditions` WHERE `SourceEntry`=43203;
INSERT INTO `conditions` VALUES (17, 0, 43203, 0, 0, 28, 0, 11288, 0, 0, 0, 0, 0, '', 'Shinning Light can only hit targets on the quest');
INSERT INTO `conditions` VALUES (13, 1, 43203, 0, 0, 31, 0, 3, 24177, 0, 0, 0, 0, '', 'Shinning Light can only hit Decomposing Ghouls');
INSERT INTO `conditions` VALUES (17, 0, 43203, 0, 1, 9, 0, 11288, 0, 0, 0, 0, 0, '', 'Shinning Light can also hit targets with the quest completed and not rewarded.');


-- DB/Creature: Morin Cloudstalker -- http://wotlk.openwow.com/npc=2988
DELETE FROM `creature_addon` WHERE `guid`=26577;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (26577, 265770, 0, 0, 1, 0, '');
UPDATE `creature` SET `MovementType`=2 WHERE  `guid`=26577;
DELETE FROM `waypoint_data` WHERE `id`=265770;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES 
(265770, 1, -2369.16, -876.936, -9.42208, 0, 0, 0, 0, 100, 0),
(265770, 2, -2366.53, -856.691, -9.36085, 0, 0, 0, 0, 100, 0),
(265770, 3, -2357.15, -811.864, -9.42138, 0, 0, 0, 0, 100, 0),
(265770, 4, -2345.23, -748.967, -9.42454, 0, 0, 0, 0, 100, 0),
(265770, 5, -2341.13, -700.582, -9.29519, 0, 0, 0, 0, 100, 0),
(265770, 6, -2335.57, -673.555, -9.41523, 0, 0, 0, 0, 100, 0),
(265770, 7, -2323.8, -641.711, -9.34184, 0, 0, 0, 0, 100, 0),
(265770, 8, -2310.09, -613.217, -9.42431, 0, 0, 0, 0, 100, 0),
(265770, 9, -2295.38, -586.808, -9.4231, 2.39676, 21600, 0, 0, 100, 0),
(265770, 10, -2323.09, -595.375, -9.42242, 0, 0, 0, 0, 100, 0),
(265770, 11, -2312.27, -614.66, -9.42405, 0, 0, 0, 0, 100, 0),
(265770, 12, -2326.41, -645.536, -9.34993, 0, 0, 0, 0, 100, 0),
(265770, 13, -2336.51, -676.214, -9.40864, 0, 0, 0, 0, 100, 0),
(265770, 14, -2344.05, -723.843, -9.42353, 0, 0, 0, 0, 100, 0),
(265770, 15, -2346.75, -760.367, -9.42353, 0, 0, 0, 0, 100, 0),
(265770, 16, -2357.56, -811.652, -9.42353, 0, 0, 0, 0, 100, 0),
(265770, 17, -2366.12, -855.675, -9.32695, 0, 0, 0, 0, 100, 0),
(265770, 18, -2376.83, -896.428, -9.39643, 6.2165, 21600, 0, 0, 100, 0);


-- Into Hostile Territory - [A] http://www.wowhead.com/quest=12325/into-hostile-territory

SET @GRYPHON := 27661;

DELETE FROM creature_text WHERE entry=@GRYPHON;
INSERT INTO creature_text VALUES (@GRYPHON, 0, 0, 'Hang on your hat, pal! We\'re in for a bumpy ride', 12, 0, 100, 0, 0, 0, 0, 0, 'Gryphon text');
INSERT INTO creature_text VALUES (@GRYPHON, 1, 0, 'This is your stop, pal. Safe landing!', 12, 0, 100, 0, 0, 0, 0, 0, 'Gryphon text');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=18 AND SourceGroup=27661;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES
    (18, 27661, 48365, 0, 0, 28, 0, 12325, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick');

DELETE FROM vehicle_template_accessory WHERE entry=@GRYPHON;

UPDATE creature_template SET AIName="SmartAI", InhabitType=5, speed_run=2.5 WHERE entry=@GRYPHON;
DELETE FROM smart_scripts WHERE entryorguid=@GRYPHON AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@GRYPHON,0,0,1,27,0,100,0,0,0,0,0,1,0,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Passenger Boarded - Say Line 0"),
    (@GRYPHON,0,1,0,61,0,100,0,0,0,0,0,53,1,27661,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Passenger Boarded - Start Waypoint"),
    (@GRYPHON,0,2,3,40,0,100,0,10,27661,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Waypoint 10 Reached - Say Line 1"),
    (@GRYPHON,0,3,4,61,0,100,0,10,27661,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Waypoint 10 Reached - Remove Aura"),
    (@GRYPHON,0,4,0,61,0,100,0,10,27661,0,0,75,44795,0,0,0,0,0,17,0,30,0,0,0,0,0,"Wintergarde Gryphon - On Waypoint 10 Reached - Add Aura 'Parachute'"),
    (@GRYPHON,0,5,0,40,0,100,0,11,27661,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Waypoint 11 Reached - Despawn In 3000 ms"),
    (@GRYPHON,0,6,0,11,0,100,0,0,0,0,0,81,16777216,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wintergarde Gryphon - On Respawn - Set Npc Flag Spellclick");


DELETE FROM waypoints WHERE entry=@GRYPHON;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@GRYPHON, 1, 3706.73, -700.82, 218.26, 'Wintergarde Gryphon'),
    (@GRYPHON, 2, 3697.71, -724.01, 225.27, 'Wintergarde Gryphon'),
    (@GRYPHON, 3, 3717.61, -752.09, 225.80, 'Wintergarde Gryphon'),
    (@GRYPHON, 4, 3716.85, -779.71, 224.46, 'Wintergarde Gryphon'),
    (@GRYPHON, 5, 3739.56, -906.24, 199.36, 'Wintergarde Gryphon'),
    (@GRYPHON, 6, 3749.59, -1011.11, 184.11, 'Wintergarde Gryphon'),
    (@GRYPHON, 7, 3743.17, -1146.54, 175.47, 'Wintergarde Gryphon'),
    (@GRYPHON, 8, 3725.03, -1276.72, 163.01, 'Wintergarde Gryphon'),
    (@GRYPHON, 9, 3738.50, -1345.91, 161.58, 'Wintergarde Gryphon'),
    (@GRYPHON, 10, 3832.16, -1395.51, 178.19, 'Wintergarde Gryphon'),
    (@GRYPHON, 11, 3846.49, -1416.90, 163.93, 'Wintergarde Gryphon');