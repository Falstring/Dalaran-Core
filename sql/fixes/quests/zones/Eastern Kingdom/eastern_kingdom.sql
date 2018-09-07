-- -------------------------------------------
-- EASTERN KINGDOM
-- -------------------------------------------


-- Spawn creature ID 16399 Bloodsail Traitor

DELETE FROM `creature` WHERE `id` = 16399;
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`) VALUES
(4761, 16399, 0, 0, 0, 1, 1, 2557, 1, -14184.4, 192.764, 20.6905, 3.735, 300, 0, 0, 2059, 0, 0, 0, 0, 0, 0);

-- Traitor to the Bloodsail -- [A/H] http://wotlk.openwow.com/quest=9259
DELETE FROM `quest_template` WHERE `ID`=9259;
INSERT INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardMoney`, `RewardBonusMoney`, `RewardDisplaySpell`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `Flags`, `RequiredPlayerKills`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardTalents`, `RewardArenaPoints`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `TimeAllowed`, `AllowableRaces`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `QuestCompletionLog`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`, `RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`, `RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `VerifiedBuild`) VALUES 
(9259, 0, -1, 30, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 7, 0, 87, -7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Traitor to the Bloodsail', '', 'That mangy dog, Revilgaz, has offered to pardon any former Bloodsails willing to turn on their cap\'n! That bilge sucker asked me to go an\' off me ole\' mates and to bring back their bandannas as proof.', NULL, 'Return to Bloodsail Traitor in Stranglethorn Vale.', 0, 0, 0, 0, 0, 0, 0, 0, 4306, 2604, 0, 0, 0, 0, 40, 4, 0, 0, 0, 0, 0, '', '', '', '', 12340);

-- 
-- Quest Urok Doomhowl [A] - http://www.wowhead.com/quest=4867/urok-doomhowl
SET @MAGUS    = 10602;
SET @ENFORCER = 10601;
SET @UROK     = 10584;
SET @OGUID    = 21202;

UPDATE `creature_template` SET `faction`=40 WHERE  `entry`IN(10601,10602);

DELETE FROM `gameobject` WHERE `id` IN(175571,175584);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0, 175571, 229, 3, 1, -47.90947, -369.0891, 51.54253, 1.378809, 0, 0, 0, 1, -1, 255, 1), -- 175571 (Area: 0)
(@OGUID+1, 175571, 229, 3, 1, -27.88039, -385.8911, 48.50668, 3.700105, 0, 0, 0, 1, -1, 255, 1), -- 175571 (Area: 0)
(@OGUID+2, 175571, 229, 3, 1, -13.72754, -384.8161, 48.97457, 3.68265, 0, 0, 0, 1, -1, 255, 1), -- 175571 (Area: 0)
(@OGUID+3, 175571, 229, 3, 1, -12.36894, -376.4748, 49.335, 5.044002, 0, 0, 0, 1, -1, 255, 1), -- 175571 (Area: 0)
(@OGUID+4, 175571, 229, 3, 1, -24.88243, -369.6189, 49.70592, 3.403396, 0, 0, 0, 1, -1, 255, 1), -- 175571 (Area: 0)
(@OGUID+5, 175584, 229, 3, 1, -14.3415, -395.7287, 48.53813, 2.862335, 0, 0, 0, 1, -1, 255, 0), -- 175584 (Area: 0)
(@OGUID+6, 175571, 229, 3, 1, -34.54366, -370.2325, 50.3396, 5.358161, 0, 0, 0, 1, -1, 255, 1); -- 175571 (Area: 0)

UPDATE `gameobject` SET `position_y`=-395.729 WHERE  `guid`=99791;

DELETE FROM `event_scripts` WHERE `id`=4845;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(4845, 0, 9, @OGUID+0, 66, 0, 0, 0, 0, 0),
(4845, 0, 9, @OGUID+1, 66, 0, 0, 0, 0, 0),
(4845, 0, 9, @OGUID+2, 66, 0, 0, 0, 0, 0),
(4845, 0, 9, @OGUID+3, 66, 0, 0, 0, 0, 0),
(4845, 0, 9, @OGUID+4, 66, 0, 0, 0, 0, 0),
(4845, 0, 9, @OGUID+5, 66, 0, 0, 0, 0, 0),
(4845, 0, 9, @OGUID+6, 66, 0, 0, 0, 0, 0),

(4845, 5, 10, @MAGUS, 900000, 0, -33.04, -385.57, 48.60, 5.98),
(4845, 5, 10, @ENFORCER, 900000, 0, -16.12, -376.99, 49.20, 4.89),
(4845, 5, 10, @ENFORCER, 900000, 0, -25.13, -376.60, 48.94, 5.17),
(4845, 13, 10, @MAGUS, 900000, 0, -14.93, -381.99, 49.04, 4.70),
(4845, 28, 10, @MAGUS, 900000, 0, -35.47, -371.36, 50.22, 4.79),
(4845, 28, 10, @ENFORCER, 900000, 0, -47.54, -368.11, 51.67, 5.70),
(4845, 42, 10, @MAGUS, 900000, 0, -33.04, -385.57, 48.60, 5.98),
(4845, 42, 10, @MAGUS, 900000, 0, -14.58, -375.16, 49.31, 4.73),
(4845, 42, 10, @ENFORCER, 900000, 0, -24.91, -376.41, 48.95, 4.67),
(4845, 58, 10, @MAGUS, 900000, 0, -47.54, -368.11, 51.67, 5.70),
(4845, 66, 10, @UROK, 900000, 0, -23.97, -391.89, 48.58, 1.68);

-- Urok Ogre Magus SAI
SET @ENTRY := 10602;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,0,0,3400,4700,11,15979,64,0,0,0,0,2,0,0,0,0,0,0,0,"Urok Ogre Magus - In Combat - Cast 'Arcane Bolt' (Normal Dungeon)"),
(@ENTRY,0,1,2,2,0,100,3,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Urok Ogre Magus - Between 0-15% Health - Flee For Assist (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,2,0,61,0,100,3,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Urok Ogre Magus - Between 0-15% Health - Say Line 0 (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,3,0,16,0,100,2,6742,30,10000,15000,11,6742,0,0,0,0,0,7,0,0,0,0,0,0,0,"Urok Ogre Magus - On Friendly Unit Missing Buff 'Bloodlust' - Cast 'Bloodlust' (Normal Dungeon)"),
(@ENTRY,0,4,0,0,0,100,2,3000,4000,5000,8000,11,13747,1,0,0,0,0,2,0,0,0,0,0,0,0,"Urok Ogre Magus - In Combat - Cast 'Slow' (Normal Dungeon)"),
(@ENTRY,0,5,0,54,0,100,1,0,0,0,0,11,64195,2,0,0,0,0,1,0,0,0,0,0,0,0,"Urok Ogre Magus - On Just Summoned - Cast 'Simple Teleport' (No Repeat)"),
(@ENTRY,0,6,0,54,0,100,1,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"Urok Ogre Magus - On Just Summoned - Start Attacking (No Repeat)");

-- NPC talk text insert
SET @ENTRY := 10602;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`, `BroadcastTextId`) VALUES
(@ENTRY,0,0, '%s attempts to run away in fear!',16,0,100,0,0,0, 'combat Flee', 1150);

-- Urok Enforcer SAI
SET @ENTRY := 10601;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,3000,5000,3000,6000,11,16856,2,0,0,0,0,2,0,0,0,0,0,0,0,"Urok Enforcer - In Combat - Cast 'Mortal Strike' (Normal Dungeon)"),
(@ENTRY,0,1,0,0,0,100,1,0,1000,6000,7000,11,11084,2,0,0,0,0,2,0,0,0,0,0,0,0,"Urok Enforcer - In Combat - Cast 'Shock' (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,2,8000,8000,12000,17000,11,14516,2,0,0,0,0,2,0,0,0,0,0,0,0,"Urok Enforcer - In Combat - Cast 'Strike' (Normal Dungeon)"),
(@ENTRY,0,3,0,54,0,100,1,0,0,0,0,11,64195,2,0,0,0,0,1,0,0,0,0,0,0,0,"Urok Enforcer - On Just Summoned - Cast 'Simple Teleport' (No Repeat)"),
(@ENTRY,0,4,0,54,0,100,1,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"Urok Enforcer - On Just Summoned - Start Attacking (No Repeat)");

-- Beer Basted Boar Ribs -- [A] http://www.wowhead.com/quest=384/beer-basted-boar-ribsS

UPDATE `quest_template_addon` SET `RequiredSkillID`='0', `RequiredSkillPoints`='0' WHERE  `ID`=384;

-- Quest Fields of Grief - [H] - http://www.wowhead.com/quest=407/fields-of-grief
-- Captured Scarlet Zealot SAI
SET @ENTRY := 1931;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,407,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Quest '' Finished - Run Script"),
(@ENTRY,0,1,2,6,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Just Died - Despawn Instant"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Just Died - ACTION_SET_CORPSE_DELAY 2 sec"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,200,30,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Just Died - ACTION_SET_RESPAWN_TIME 2 sec");

-- Actionlist SAI
SET @ENTRY := 193100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,11,3287,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Script - Cast 'Ghoul Form'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,2292,239.481,27.0892,0.693878,"Captured Scarlet Zealot - On Script - Move To Position"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,69,0,0,0,0,0,0,8,0,0,0,2287.97,236.253,27.0892,2.6613,"Captured Scarlet Zealot - On Script - Move To Position"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Script - Say Line 1"),
(@ENTRY,9,5,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,2292.52,235.226,27.0892,4.8345,"Captured Scarlet Zealot - On Script - Move To Position"),
(@ENTRY,9,6,0,0,0,100,0,3000,3000,0,0,69,0,0,0,0,0,0,8,0,0,0,2288.96,237.96,27.0892,2.48773,"Captured Scarlet Zealot - On Script - Move To Position"),
(@ENTRY,9,7,0,0,0,100,0,6000,6000,0,0,51,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Scarlet Zealot - On Script - Kill Target");

-- [Q] Rumors for Kravel - http://www.wowhead.com/quest=1117/rumors-for-kravel
-- Kravel Koalbeard SAI
SET @ENTRY := 4452;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1117,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Quest 'Rumors for Kravel' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 445200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Remove Flag Standstate Kneel");

-- Actionlist SAI
SET @ENTRY := 445200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Remove Flag Standstate Kneel"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,21,200,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,5,94,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Play Emote 94"),
(@ENTRY,9,3,0,0,0,100,0,5000,5000,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Play Emote 0"),
(@ENTRY,9,4,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Say Line 1"),
(@ENTRY,9,5,0,0,0,100,0,0,0,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Play Emote 16"),
(@ENTRY,9,6,0,0,0,100,0,1000,1000,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Script - Set Flag Standstate Kneel");

DELETE FROM `creature_text` WHERE `entry`=4452;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4452, 0, 0, '%s listens to $N\'s plea.', 16, 0, 100, 0, 0, 0, 'Kravel Koalbeard'),
(4452, 1, 0, 'You were right to come. My wisdom will be yours.', 12, 0, 100, 0, 0, 0, 'Kravel Koalbeard');

-- [Q] Saving Sharpbeak - http://www.wowhead.com/quest=2994/saving-sharpbeak
-- Sharpbeak's Cage SAI
SET @ENTRY := 144070;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,70,0,100,0,2,0,0,0,45,1,0,0,0,0,0,19,8023,20,0,0,0,0,0,"Sharpbeak's Cage - On Gameobject State Changed - Set Data 1 0");
UPDATE `creature` SET `spawntimesecs`=60 WHERE  `guid`=92997;

-- Sharpbeak SAI
SET @ENTRY := 8023;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,38,0,100,0,1,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak - On Data Set 1 0 - Remove Flag Standstate Dead"),
(@ENTRY,0,1,0,61,0,100,0,1,8023,0,0,53,0,8023,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak - On Data Set 1 0 - Start Waypoint"),
(@ENTRY,0,2,0,61,0,100,0,1,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak - On Data Set 1 0 - Set Active On"),
(@ENTRY,0,3,0,40,0,100,0,1,8023,0,0,12,8024,3,120000,0,0,0,8,0,0,0,-150.362167,-3511.225830,274.172699,4.062795,"Sharpbeak - On Waypoint 1 Reached - Summon Creature 'Sharpbeak's Father'"),
(@ENTRY,0,4,0,38,0,100,0,2,0,0,0,29,2,270,0,0,0,0,19,8024,10,0,0,0,0,0,"Sharpbeak - On Data Set 2 0 - Start Follow Closest Creature 'Sharpbeak's Father'"),
(@ENTRY,0,5,0,38,0,100,0,3,0,0,0,1,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"Sharpbeak - On Data Set 3 0 - Say Line 0"),
(@ENTRY,0,6,0,38,0,100,0,4,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak - On Data Set 4 0 - Despawn Instant");

-- waypoints
DELETE FROM `waypoints` WHERE `entry` IN (8023, 8024);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(8023, 1, -229.494385, -3623.708740, 237.462433, 'Sharpbeak'),
(8024, 1, -230.034515, -3627.350098, 237.616638, 'Sharpbeak father'),
(8024, 2, -244.359818, -3638.187500, 236.659546, 'Sharpbeak father'),
(8024, 3, -227.883606, -3624.622314, 237.235733, 'Sharpbeak father'),
(8024, 4, -122.637520, -3502.211914, 256.078064, 'Sharpbeak father');

UPDATE `creature_template` SET `InhabitType`=4, `speed_walk`=2 WHERE  `entry` IN (8024, 8025, 8023);
UPDATE `creature_template` SET `faction`=250 WHERE  `entry` IN (8024, 8025);

-- Sharpbeak's Father SAI
SET @ENTRY := 8024;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak's Father - On Just Summoned - Set Active On"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,53,0,8024,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak's Father - On Just Summoned - Start Waypoint"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,12,8025,3,120000,0,0,0,8,0,0,0,-168.569000,-3509.420166,276.238770,4.320847,"Sharpbeak's Father - On Just Summoned - Summon Creature 'Sharpbeak's Mother'"),
(@ENTRY,0,3,0,40,0,100,0,1,8024,0,0,45,2,0,0,0,0,0,19,8023,20,0,0,0,0,0,"Sharpbeak's Father - On Waypoint 1 Reached - Set Data 2 0"),
(@ENTRY,0,4,0,40,0,100,0,2,8024,0,0,54,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak's Father - On Waypoint 2 Reached - Pause Waypoint"),
(@ENTRY,0,5,0,40,0,100,0,3,8024,0,0,45,3,0,0,0,0,0,19,8023,20,0,0,0,0,0,"Sharpbeak's Father - On Waypoint 3 Reached - Set Data 3 0"),
(@ENTRY,0,6,7,40,0,100,0,4,8024,0,0,45,4,0,0,0,0,0,9,0,0,100,0,0,0,0,"Sharpbeak's Father - On Waypoint 4 Reached - Set Data 4 0"),
(@ENTRY,0,7,0,61,0,100,0,4,8024,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak's Father - On Waypoint 4 Reached - Despawn Instant");

-- Sharpbeak's Mother SAI
SET @ENTRY := 8025;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak's Mother - On Just Summoned - Set Active On"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,29,2,90,0,0,0,0,19,8024,20,0,0,0,0,0,"Sharpbeak's Mother - On Just Summoned - Start Follow Closest Creature 'Sharpbeak's Father'"),
(@ENTRY,0,2,0,38,0,100,0,4,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sharpbeak's Mother - On Data Set 4 0 - Despawn Instant");

DELETE FROM `creature_text` WHERE `entry`=8023;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(8023, 0, 0, '%s chirps a goodbye to $n.', 16, 0, 100, 0, 0, 0, 'Sharpbeak');

-- A Terrible Purpose  - Reward - http://wotlk.openwow.com/quest=8287
DELETE FROM `quest_template_addon` WHERE `ID`=8287;
INSERT INTO `quest_template_addon` (`ID`, `RewardMailTemplateID`, `RewardMailDelay`, `PrevQuestID`, `ProvidedItemCount`) VALUES 
(8287, 110, 86400, 8279, 1);

DELETE FROM `mail_loot_template` WHERE `entry`=110;
INSERT INTO `mail_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(110, 20645, 0, 100, 0, 0, 0, 1, 1, NULL);

-- Suntara Stones (3367)
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id=8284);
UPDATE creature_template SET unit_flags=4096, ScriptName='' WHERE entry=8284;
-- Dorius Stonetender SAI
SET @ENTRY := 8284;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,10,11,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorius Stonetender - On Respawn - Set Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,1,2,19,0,100,0,3367,0,0,0,53,1,8284,0,3367,30000,1,7,0,0,0,0,0,0,0,"Dorius Stonetender - On Quest '' Taken - Start Waypoint"),
(@ENTRY,0,2,3,61,0,100,0,3367,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorius Stonetender - On Quest '' Taken - Remove Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,3,0,61,0,100,0,3367,0,0,0,91,255,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorius Stonetender - On Quest '' Taken - Remove Flag <Unknown bytes1 (UnitStandStateType)>"),
(@ENTRY,0,4,5,40,0,100,0,36,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorius Stonetender - On Waypoint 36 Reached - Pause Waypoint"),
(@ENTRY,0,5,6,61,0,100,0,36,0,0,0,12,5856,4,30000,0,1,0,8,0,0,0,-6753.4,-1790.25,256.8,2.81,"Dorius Stonetender - On Waypoint 36 Reached - Summon Creature 'Glassweb Spider'"),
(@ENTRY,0,6,0,61,0,100,0,36,0,0,0,12,5856,4,30000,0,1,0,8,0,0,0,-6760.36,-1812.86,256.69,1.57,"Dorius Stonetender - On Waypoint 36 Reached - Summon Creature 'Glassweb Spider'"),
(@ENTRY,0,7,8,40,0,100,0,61,0,0,0,12,8338,4,30000,0,1,0,8,0,0,0,-6370.26,-1974.93,256.79,3.55,"Dorius Stonetender - On Waypoint 61 Reached - Summon Creature 'Dark Iron Marksman'"),
(@ENTRY,0,8,0,61,0,100,0,61,0,0,0,45,1,1,0,0,0,0,19,8338,50,0,0,0,0,0,"Dorius Stonetender - On Waypoint 61 Reached - Set Data 1 1"),
(@ENTRY,0,9,11,8,0,100,0,61512,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorius Stonetender - On Spellhit 'Shoot' - Kill Self"),
(@ENTRY,0,10,0,61,0,100,0,0,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorius Stonetender - On Respawn - Set Flag Standstate Dead"),
(@ENTRY,0,11,0,61,0,100,0,61512,0,0,0,41,0,0,0,0,0,0,19,8284,50,0,0,0,0,0,"Dorius Stonetender - On Spellhit 'Shoot' - Despawn Instant"),
(@ENTRY,0,12,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorius Stonetender - On Aggro - Say Line 0");
UPDATE creature_template SET AIName='SmartAI' WHERE entry=8338;
DELETE FROM smart_scripts WHERE entryorguid=8338 AND source_type=0;
INSERT INTO smart_scripts VALUES (8338, 0, 0, 1, 38, 0, 100, 0, 1, 1, 0, 0, 11, 61512, 0, 0, 0, 0, 0, 19, 8284, 50, 0, 0, 0, 0, 0, 'On Data Set - Cast At Dorius');
DELETE FROM waypoints WHERE entry=8284;
INSERT INTO waypoints VALUES (8284, 1, -7006.92, -1744, 234.1, 'Dorius Stonetender'),(8284, 2, -7007.75, -1732.05, 234.099, 'Dorius Stonetender'),(8284, 3, -7005.47, -1724.57, 234.099, 'Dorius Stonetender'),(8284, 4, -7001.05, -1727.62, 235.274, 'Dorius Stonetender'),(8284, 5, -6991.56, -1734.18, 239.239, 'Dorius Stonetender'),(8284, 6, -6983.94, -1734.93, 241.622, 'Dorius Stonetender'),(8284, 7, -6976.7, -1724.36, 241.667, 'Dorius Stonetender'),(8284, 8, -6974.22, -1720.38, 243.028, 'Dorius Stonetender'),(8284, 9, -6973.37, -1715.84, 243.68, 'Dorius Stonetender'),(8284, 10, -6971.87, -1711.4, 241.999, 'Dorius Stonetender'),(8284, 11, -6961.39, -1700.4, 240.744, 'Dorius Stonetender'),(8284, 12, -6956.36, -1695.64, 241.267, 'Dorius Stonetender'),(8284, 13, -6952.62, -1692.92, 242.201, 'Dorius Stonetender'),(8284, 14, -6941.59, -1686.27, 243.609, 'Dorius Stonetender'),(8284, 15, -6931.58, -1680.24, 241.976, 'Dorius Stonetender'),(8284, 16, -6925.64, -1676.66, 241.205, 'Dorius Stonetender'),(8284, 17, -6916.67, -1671.26, 243.154, 'Dorius Stonetender'),
(8284, 18, -6906.39, -1669.08, 243.1, 'Dorius Stonetender'),(8284, 19, -6895.02, -1666.73, 244.364, 'Dorius Stonetender'),(8284, 20, -6888.45, -1671.61, 243.537, 'Dorius Stonetender'),(8284, 21, -6883.87, -1675.19, 243.67, 'Dorius Stonetender'),(8284, 22, -6878.07, -1679.1, 245.459, 'Dorius Stonetender'),(8284, 23, -6866.53, -1680.46, 251.159, 'Dorius Stonetender'),(8284, 24, -6847.84, -1680.24, 251.522, 'Dorius Stonetender'),(8284, 25, -6837.27, -1680.11, 251.522, 'Dorius Stonetender'),(8284, 26, -6824.46, -1679.9, 251.531, 'Dorius Stonetender'),(8284, 27, -6809.48, -1682.39, 250.33, 'Dorius Stonetender'),(8284, 28, -6807.54, -1685.24, 251.937, 'Dorius Stonetender'),(8284, 29, -6799.99, -1697.03, 259.171, 'Dorius Stonetender'),(8284, 30, -6791.55, -1705.01, 259.55, 'Dorius Stonetender'),(8284, 31, -6783.92, -1712.23, 259.55, 'Dorius Stonetender'),(8284, 32, -6779.7, -1724.39, 259.55, 'Dorius Stonetender'),(8284, 33, -6779.37, -1740.73, 259.574, 'Dorius Stonetender'),(8284, 34, -6778.38, -1749.98, 259.551, 'Dorius Stonetender'),
(8284, 35, -6776.43, -1761.44, 257.466, 'Dorius Stonetender'),(8284, 36, -6772.3, -1785.59, 256.858, 'Dorius Stonetender'),(8284, 37, -6761.17, -1794.08, 256.763, 'Dorius Stonetender'),(8284, 38, -6748.43, -1802.23, 255.501, 'Dorius Stonetender'),(8284, 39, -6731.69, -1812.94, 253.554, 'Dorius Stonetender'),(8284, 40, -6717.92, -1815.5, 252.284, 'Dorius Stonetender'),(8284, 41, -6700.58, -1817.83, 250.448, 'Dorius Stonetender'),(8284, 42, -6685.6, -1820.35, 249.568, 'Dorius Stonetender'),(8284, 43, -6675.33, -1831.45, 248.962, 'Dorius Stonetender'),(8284, 44, -6661.43, -1848.66, 246.148, 'Dorius Stonetender'),(8284, 45, -6654.52, -1859.53, 245.18, 'Dorius Stonetender'),(8284, 46, -6641.54, -1877.53, 244.144, 'Dorius Stonetender'),(8284, 47, -6628.57, -1895.53, 244.15, 'Dorius Stonetender'),(8284, 48, -6616.58, -1909.78, 244.72, 'Dorius Stonetender'),(8284, 49, -6603.96, -1915.83, 244.205, 'Dorius Stonetender'),(8284, 50, -6592.88, -1919.32, 244.152, 'Dorius Stonetender'),(8284, 51, -6572.35, -1923.48, 244.152, 'Dorius Stonetender'),(8284, 52, -6551.56, -1931.24, 244.151, 'Dorius Stonetender'),
(8284, 53, -6528.76, -1943.08, 244.151, 'Dorius Stonetender'),(8284, 54, -6509.06, -1953.3, 244.151, 'Dorius Stonetender'),(8284, 55, -6484.21, -1966.2, 244.151, 'Dorius Stonetender'),(8284, 56, -6461.49, -1975.08, 244.267, 'Dorius Stonetender'),(8284, 57, -6444.5, -1979.29, 244.423, 'Dorius Stonetender'),(8284, 58, -6432.82, -1979.66, 245.315, 'Dorius Stonetender'),(8284, 59, -6414.18, -1981.05, 247.111, 'Dorius Stonetender'),(8284, 60, -6401.38, -1981.34, 247.193, 'Dorius Stonetender'),(8284, 61, -6388.25, -1984.19, 246.733, 'Dorius Stonetender');
DELETE FROM `creature_text` WHERE `entry`=8284;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(8284, 0, 0, 'It\'s on! Enemy, meet my fists. Fists, say hello to enemy.', 12, 0, 100, 0, 0, 0, 0, 'Dorius Stonetender'),
(8284, 0, 1, 'I\'m about to open a can on this enemy.', 12, 0, 100, 0, 0, 0, 0, 'Dorius Stonetender');
-- A Sample of Slime... -- http://www.wowhead.com/quest=4293/a-sample-of-slime
UPDATE quest_template_addon SET NextQuestId=0, ExclusiveGroup=0 WHERE Id IN (4293, 4294);

-- The Gift That Keeps On Giving -- http://www.wowhead.com/quest=12698
UPDATE gameobject_template SET AIName='SmartGameObjectAI', ScriptName='' WHERE entry=190769;
DELETE FROM smart_scripts WHERE entryorguid=190769 AND source_type=1;
INSERT INTO smart_scripts VALUES (190769, 1, 0, 1, 60, 0, 100, 1, 2000, 2000, 0, 0, 93, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gift of the Harvester - On Update - SendCustomAnim');
INSERT INTO smart_scripts VALUES (190769, 1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 52479, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gift of the Harvester - On Update - Cast Spell');
DELETE FROM spell_script_names WHERE spell_id=52479;
UPDATE creature_template SET minlevel=56, maxlevel=56 WHERE entry=28845;
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=28846;
DELETE FROM smart_scripts WHERE entryorguid=28846 AND source_type=0;
INSERT INTO smart_scripts VALUES (28846, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Ghost - On Respawn - Attack Start');
-- [Q] A Fine Mess (2904)
UPDATE creature_template SET AIName='', ScriptName='npc_kernobee' WHERE entry=7850;

-- [Q] Sunken Temple - Support for quest 3447: Secret of the Circle 
SET @GO_GUID := 5521;
SET @ALTAR := 148836;
SET @LIGHT := 148883;
SET @ATAL_ALARION := 8580;
SET @ATALAI_IDOL := 148838;

-- Altar of Hakkar
UPDATE `gossip_menu_option` SET `action_menu_id`=1302 WHERE `menu_id`=1288;
-- SAI: Add Pattern of lights
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@ALTAR;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ALTAR AND `source_type`=1 AND `id`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ALTAR*100 AND `source_type`=9 AND `id` BETWEEN 0 AND 5;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ALTAR,1,0,0,62,0,100,0,1288,0,0,0,80,@ALTAR*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On gossip option select run script'),
(@ALTAR*100,9,0,0,1,0,100,0,0,0,0,0,50,@LIGHT,3,0,0,0,0,8,0,0,0,-515.553,95.25821,-148.7401,-1.500983, 'Script - Summon Temp GO'),
(@ALTAR*100,9,1,0,1,0,100,0,3000,3000,0,0,50,@LIGHT,3,0,0,0,0,8,0,0,0,-419.8487,94.48368,-148.7401,-1.500983, 'Script - Summon Temp GO'),
(@ALTAR*100,9,2,0,1,0,100,0,3000,3000,0,0,50,@LIGHT,3,0,0,0,0,8,0,0,0,-491.4003,135.9698,-148.7401,-1.500983, 'Script - Summon Temp GO'),
(@ALTAR*100,9,3,0,1,0,100,0,3000,3000,0,0,50,@LIGHT,3,0,0,0,0,8,0,0,0,-491.4909,53.48179,-148.7401,-1.500983, 'Script - Summon Temp GO'),
(@ALTAR*100,9,4,0,1,0,100,0,3000,3000,0,0,50,@LIGHT,3,0,0,0,0,8,0,0,0,-443.8549,136.1007,-148.7401,-1.500983, 'Script - Summon Temp GO'),
(@ALTAR*100,9,5,0,1,0,100,0,3000,3000,0,0,50,@LIGHT,3,0,0,0,0,8,0,0,0,-443.4171,53.83124,-148.7401,-1.500983, 'Script - Summon Temp GO');

-- Mini-boss Atal'alarion <Guardian of the Idol> and GameObject Idol of Hakkar
DELETE FROM `creature` WHERE `guid`=34521 AND `id`=@ATAL_ALARION; -- spawned by script

DELETE FROM `gameobject` WHERE `guid`=@GO_GUID AND `id`=@ATALAI_IDOL; -- spawned but hidden until creature die
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneid`,`areaid`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`VerifiedBuild`) VALUES
(@GO_GUID,@ATALAI_IDOL,109,0,0,3,1,-476.2693,94.41199,-189.7297,1.588249,0,0,0,1,-1,255,1,12340);

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ATAL_ALARION AND `source_type`=0 AND `id`=7;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ATAL_ALARION,0,7,0,6,0,100,0,0,0,0,0,70,7200,0,0,0,0,0,14,@GO_GUID,@ATALAI_IDOL,0,0,0,0,0, 'Atal''alarion - On Just Died - Respawn Idol of Hakkar');

-- DB/Quest: Matrix Punchograph quests http://www.wowhead.com/item=9327/security-delta-data-access-card#comments
/* remove corescript */
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI', `ScriptName`='' WHERE  `entry` IN (142345, 142475, 142476, 142696);

/* Matrix Punchograph 3005-A */
DELETE FROM `smart_scripts` WHERE `entryorguid`=142345 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(142345, 1, 0, 1, 62, 0, 100, 0, 1045, 0, 0, 0, 56, 9280, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip  - add yellow card'),
(142345, 1, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 57, 9279, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On link  - disadd white card'),
(142345, 1, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On link  - close gossip');

/* Matrix Punchograph 3005-C */
DELETE FROM `smart_scripts` WHERE `entryorguid`=142476 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(142476, 1, 0, 1, 62, 0, 100, 0, 1049, 0, 0, 0, 56, 9281, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip  - add red card'),
(142476, 1, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 57, 9282, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On link  - disadd blue card'),
(142476, 1, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On link  - close gossip');

DELETE FROM `gossip_menu_option` WHERE `menu_id`=1047 AND `id`=1;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(1047, 1, 0, 'Use engineering to access hidden schematics.', 1, 1, 0, 0, 0, 0, '');
     
-- Matrix Punchograph 3005-B SAI
SET @ENTRY := 142475;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,1,62,0,100,0,1047,0,0,0,56,9282,1,0,0,0,0,7,0,0,0,0,0,0,0,"Matrix Punchograph 3005-B - On Gossip Option 0 Selected - Add Item 'Blue Punch Card' 1 Time"),
(@ENTRY,1,1,2,61,0,100,0,1047,0,0,0,57,9280,1,0,0,0,0,7,0,0,0,0,0,0,0,"Matrix Punchograph 3005-B - On Gossip Option 0 Selected - Remove Item 'Yellow Punch Card' 1 Time"),
(@ENTRY,1,2,0,61,0,100,0,1047,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Matrix Punchograph 3005-B - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,1,4,5,62,0,100,0,1047,1,0,0,85,4011,2,0,0,0,0,7,0,0,0,0,0,0,0,"Matrix Punchograph 3005-B - On Gossip Option 1 Selected - Invoker Cast 'Minor Recombobulator'"),
(@ENTRY,1,5,0,61,0,100,0,1047,1,0,0,72,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matrix Punchograph 3005-B - On Gossip Option 1 Selected - Close Gossip");
     
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1050 AND `id`=1;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(1050, 1, 0, 'Use engineering to access hidden schematics.', 1, 1, 0, 0, 0, 0, '');
     
-- Matrix Punchograph 3005-D SAI
SET @ENTRY := 142696;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,1,62,0,100,0,1050,0,0,0,56,9316,1,0,0,0,0,7,0,0,0,0,0,0,0,"Matrix Punchograph 3005-D - On Gossip Option 0 Selected - Add Item 'Prismatic Punch Card' 1 Time"),
(@ENTRY,1,1,2,61,0,100,0,1050,0,0,0,57,9281,1,0,0,0,0,7,0,0,0,0,0,0,0,"Matrix Punchograph 3005-D - On Gossip Option 0 Selected - Remove Item 'Red Punch Card' 1 Time"),
(@ENTRY,1,2,0,61,0,100,0,1050,0,0,0,72,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matrix Punchograph 3005-D - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,1,4,5,62,0,100,0,1050,1,0,0,85,11595,2,0,0,0,0,7,0,0,0,0,0,0,0,"Matrix Punchograph 3005-D - On Gossip Option 1 Selected - Invoker Cast 'Discombobulator Ray'"),
(@ENTRY,1,5,0,61,0,100,0,1050,1,0,0,72,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Matrix Punchograph 3005-D - On Gossip Option 1 Selected - Close Gossip");
     
/* conditions for all gossips */
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (1045, 1047, 1049, 1050);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 1045, 0, 0, 0, 2, 0, 9279, 1, 0, 0, 0, 0, '', 'Show gossip option if player has White Punch Card'),
(15, 1047, 0, 0, 0, 2, 0, 9280, 1, 0, 0, 0, 0, '', 'Show gossip option if player has Yellow Punch Card'),
(15, 1049, 0, 0, 0, 2, 0, 9282, 1, 0, 0, 0, 0, '', 'Show gossip option if player has Blue Punch Card'),
(15, 1050, 0, 0, 0, 2, 0, 9281, 1, 0, 0, 0, 0, '', 'Show gossip option if player has Red Punch Card'),
(15, 1047, 1, 0, 0, 7, 0, 202, 140, 0, 0, 0, 0, '', 'Show gossip option if player has Engineering 140'),
(15, 1050, 1, 0, 0, 7, 0, 202, 140, 0, 0, 0, 0, '', 'Show gossip option if player has Engineering 140');

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


-- Vent Horizon - [A] http://www.wowhead.com/quest=25212/vent-horizon

SET @THUNDERFLASH := 39396;
SET @PROBE_TARGET_BUNNY := 39420;

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=11211;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES
    (15, 11211, 0, 0, 0, 9, 0, 25212, 0, 0, 0, 0, 0, '', 'Show gossip on quest active');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=73082;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES
    (13, 1, 73082, 0, 0, 31, 0, 3, @PROBE_TARGET_BUNNY, 0, 0, 0, 0, '', 'Radiageigatron target Probe Credit');

UPDATE creature_template SET minlevel=40, maxlevel=40, AIName='SmartAI' WHERE entry=@THUNDERFLASH;

DELETE FROM smart_scripts WHERE entryorguid=@THUNDERFLASH AND source_type=0;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment)
VALUES
    (@THUNDERFLASH, 0, 0, 0, 62, 0, 100, 0, 11211, 0, 0, 0, 11, 73896, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Cast Spell');

UPDATE creature_template SET scale=3, unit_flags=33554432, flags_extra=130, InhabitType=4, AIName='SmartAI' WHERE entry=@PROBE_TARGET_BUNNY;

DELETE FROM smart_scripts WHERE entryorguid=@PROBE_TARGET_BUNNY AND source_type=0;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment)
VALUES
    (@PROBE_TARGET_BUNNY, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 75779, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Cast Spell'),
    (@PROBE_TARGET_BUNNY, 0, 1, 0, 8, 0, 100, 0, 73082, 0, 0, 0, 33, @PROBE_TARGET_BUNNY, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Cast Spell');

SET @GUID := 1976206;
DELETE FROM creature WHERE id=@PROBE_TARGET_BUNNY AND guid IN(@GUID, @GUID+1, @GUID+2, @GUID+3, @GUID+4, @GUID+5);
INSERT INTO creature (guid, id, map, zoneId, areaId, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags, VerifiedBuild)
VALUES
    (@GUID, @PROBE_TARGET_BUNNY, 0, 0, 0, 1, 1, 0, 0, -5019.37, 544.06, 472.711, 4.05297, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
    (@GUID+1, @PROBE_TARGET_BUNNY, 0, 0, 0, 1, 1, 0, 0, -5125.03, 595.187, 459.885, 0.83284, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
    (@GUID+2, @PROBE_TARGET_BUNNY, 0, 0, 0, 1, 1, 0, 0, -5158.07, 629.349, 466.213, 1.76354, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
    (@GUID+3, @PROBE_TARGET_BUNNY, 0, 0, 0, 1, 1, 0, 0, -5223.95, 624.789, 455.977, 1.55938, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
    (@GUID+4, @PROBE_TARGET_BUNNY, 0, 0, 0, 1, 1, 0, 0, -5347.67, 647.579, 444.626, 3.16551, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
    (@GUID+5, @PROBE_TARGET_BUNNY, 0, 0, 0, 1, 1, 0, 0, -5303.11, 663.793, 448.898, 1.65362, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0);


-- In Dreams - [A] http://www.wowhead.com/quest=5944/in-dreams

REPLACE INTO creature_questender VALUES(12126, 5944);
DELETE FROM creature_text WHERE entry IN(1840, 1842, 12126);
INSERT INTO creature_text VALUES(1842, 0, 0, "I will lead us through Hearthglen to the forest's edge. From there, you will take me to my father.", 12, 0, 100, 0, 0, 0, 0, 0, 'Taelan Fordring');
INSERT INTO creature_text VALUES(1842, 1, 0, "Remove your disguise, lest you feel the bite of my blade when the fury has taken control.", 12, 0, 100, 0, 0, 0, 0, 0, 'Taelan Fordring');
INSERT INTO creature_text VALUES(1842, 2, 0, "Halt.", 12, 0, 100, 0, 0, 0, 0, 0, 'Taelan Fordring');
INSERT INTO creature_text VALUES(1842, 3, 0, "Highlord Taelan Fordring calls for his mount.", 16, 0, 100, 22, 0, 0, 0, 0, 'Taelan Fordring');
INSERT INTO creature_text VALUES(1842, 4, 0, "It's not much further. The main road is just up ahead.", 12, 0, 100, 0, 0, 0, 0, 0, 'Taelan Fordring');
INSERT INTO creature_text VALUES(1842, 5, 0, "Isillien!", 14, 0, 100, 0, 0, 0, 0, 0, 'Taelan Fordring');
INSERT INTO creature_text VALUES(1842, 6, 0, "This is not your fight, stranger. Protect yourself from the attacks of the Crimson Elite. I shall battle the Grand Inquisitor.", 12, 0, 100, 0, 0, 0, 0, 0, 'Taelan Fordring');
INSERT INTO creature_text VALUES(1840, 0, 0, "You will not make it to the forest's edge, Fordring.", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 1, 0, "You disappoint me, Taelan. I had plans for you... grand plans. Alas, it was only a matter of time before your filthy bloodline would catch up with you.", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 2, 0, "It is as they say; Like father, like son. You are as weak of will as Tirion... perhaps more so. I can only hope my assassins finally succeeded in ending his pitiful life.", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 3, 0, "The Grand Crusader has charged me with destroying you and your newfound friends, Taelan, but know this: I do this for pleasure, not of obligation or duty.", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 4, 0, "Grand Inquisitor Isillien calls for his guardsman.", 16, 0, 100, 22, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 5, 0, "The end is now, Fordring.", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 6, 0, "Enough!", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 7, 0, "Grand Inquisitor Isillien laughs.", 16, 0, 100, 11, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 8, 0, "Did you really believe that you could defeat me? Your friends are soon to join you, Taelan.", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 9, 0, "Tragic. The elder Fordring lives on... You are too late, old man. Retreat back to your cave, hermit, unless you wish to join your son in the Twisting Nether.", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 10, 0, "Then come, hermit!", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(12126, 0, 0, "What have you done, Isillien? You once fought with honor, for the good of our people... and now... you have murdered my boy...", 12, 0, 100, 1, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 1, 0, "May your soul burn in anguish, Isillien! Light give me strength to battle this fiend.", 12, 0, 100, 15, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 2, 0, "Face me, coward. Face the faith and strength that you once embodied.", 12, 0, 100, 25, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 3, 0, "A thousand more like him exist. Ten thousand. Should one fall, another will rise to take the seat of power.", 12, 0, 100, 0, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 4, 0, "Lord Tirion Fordring falls to one knee.", 16, 0, 100, 0, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 5, 0, "Look what they did to my boy.", 12, 0, 100, 5, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 6, 0, "Too long have I sat idle, gripped in this haze... this malaise, lamenting what could have been... what should have been.", 12, 0, 100, 0, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 7, 0, "Your death will not have been in vain, Taelan. A new Order is born on this day... an Order which will dedicate itself to extinguising the evil that plagues this world. An evil that cannot hide behind politics and pleasantries.", 12, 0, 100, 0, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 8, 0, "This I promise... This I vow...", 12, 0, 100, 0, 0, 0, 0, 0, 'Lord Tirion Fordring');

SET @ENTRY := 1842; -- Highlord Taelan Fordring SAI
UPDATE creature_template SET speed_walk=1, AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,0,34,0,100,0,8,16777215,0,0,43,0,2402,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Reached Point 16777215 - Mount To Model 2402"),
    (@ENTRY,0,1,2,19,0,100,0,5944,0,0,0,1,0,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Quest '' Taken - Say Line 0"),
    (@ENTRY,0,2,0,61,0,100,0,5944,0,0,0,53,0,1842,0,0,0,2,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Quest '' Taken - Start Waypoint"),
    (@ENTRY,0,3,15,11,0,100,0,0,0,0,0,2,67,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Respawn - Set Faction 67"),
    (@ENTRY,0,4,0,4,0,100,0,0,0,0,0,11,17232,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Aggro - Cast 'Devotion Aura'"),
    (@ENTRY,0,5,0,0,0,100,0,3000,3000,5000,5000,11,17281,0,0,0,0,0,2,0,0,0,0,0,0,0,"Highlord Taelan Fordring - In Combat - Cast 'Crusader Strike'"),
    (@ENTRY,0,6,0,2,0,100,0,0,20,120000,120000,11,17233,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - Between 0-20% Health - Cast 'Lay on Hands'"),
    (@ENTRY,0,7,8,40,0,100,0,1,0,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 1 Reached - Say Line 1"),
    (@ENTRY,0,8,0,61,0,100,0,1,0,0,0,2,42,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 1 Reached - Set Faction 42"),
    (@ENTRY,0,9,10,40,0,100,0,26,0,0,0,54,7000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 26 Reached - Pause Waypoint"),
    (@ENTRY,0,10,11,61,0,100,0,26,0,0,0,1,2,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 26 Reached - Say Line 2"),
    (@ENTRY,0,11,12,61,0,100,0,26,0,0,0,1,3,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 26 Reached - Say Line 3"),
    (@ENTRY,0,12,17,61,0,100,0,26,0,0,0,43,0,2402,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 26 Reached - Mount To Model 2402"),
    (@ENTRY,0,13,0,40,0,100,0,74,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 74 Reached - Run Script"),
    (@ENTRY,0,14,0,8,0,100,0,18969,0,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Spellhit 'Taelan Death' - Run Script"),
    (@ENTRY,0,15,16,61,0,100,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Respawn - Remove Flags Immune To Players & Immune To NPC's"),
    (@ENTRY,0,16,0,61,0,100,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Respawn - Remove Flag Standstate Dead"),
    (@ENTRY,0,17,0,61,0,100,0,26,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 26 Reached - Set Run On");

SET @ENTRY := 184200; -- Actionlist SAI
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Say Line 4"),
    (@ENTRY,9,1,0,0,0,100,0,100,100,0,0,66,0,0,0,0,0,0,21,40,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Set Orientation Closest Player"),
    (@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,12,1840,4,120000,0,0,0,8,0,0,0,2683.64,-1926.72,72.14,2,"Highlord Taelan Fordring - On Script - Summon Creature 'Grand Inquisitor Isillien'"),
    (@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Say Line 5"),
    (@ENTRY,9,4,0,0,0,100,0,4000,4000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Say Line 6"),
    (@ENTRY,9,5,0,0,0,100,0,0,0,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Dismount"),
    (@ENTRY,9,6,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Set Home Position"),
    (@ENTRY,9,7,0,0,0,100,0,0,0,0,0,19,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Remove Flag Pvp Attackable"),
    (@ENTRY,9,8,0,0,0,100,0,0,0,0,0,41,300000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Despawn In 300000 ms");

SET @ENTRY := 184201; -- Actionlist SAI
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,9,0,0,0,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Evade"),
    (@ENTRY,9,1,0,0,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Set Flags Immune To Players & Immune To NPC's"),
    (@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Set Flag Standstate Dead"),
    (@ENTRY,9,3,0,0,0,100,0,2000,2000,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Kill self");

SET @ENTRY := 1840; -- Grand Inquisitor Isillien SAI
UPDATE creature_template SET faction=16, AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,0,37,0,100,0,0,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Initialize - Run Script"),
    (@ENTRY,0,1,0,0,0,100,0,1000,1000,30000,30000,11,11647,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - In Combat - Cast 'Power Word: Shield'"),
    (@ENTRY,0,2,0,0,0,100,0,3000,3000,8000,9000,11,17287,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - In Combat - Cast 'Mind Blast'"),
    (@ENTRY,0,3,0,0,0,100,0,20000,20000,20000,20000,11,13639,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - In Combat - Cast 'Greater Health'"),
    (@ENTRY,0,4,0,0,0,100,0,7000,8000,15000,15000,11,17314,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - In Combat - Cast 'Mind Flay'");

SET @ENTRY := 184000; -- Actionlist SAI
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,9,0,0,0,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Set Flags Immune To Players & Immune To NPC's"),
    (@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 0"),
    (@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,69,0,0,0,0,0,0,8,0,0,0,2677,-1917,68,2.1,"Grand Inquisitor Isillien - On Script - Move To Position"),
    (@ENTRY,9,3,0,0,0,100,0,8000,8000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 1"),
    (@ENTRY,9,4,0,0,0,100,0,8000,8000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 2"),
    (@ENTRY,9,5,0,0,0,100,0,8000,8000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 3"),
    (@ENTRY,9,6,0,0,0,100,0,8000,8000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 4"),
    (@ENTRY,9,7,0,0,0,100,0,5000,5000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 5"),
    (@ENTRY,9,8,0,0,0,100,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,2674,-1920,68.41,1.8,"Grand Inquisitor Isillien - On Script - Summon Creature 'Crimson Elite'"),
    (@ENTRY,9,9,0,0,0,100,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,2684,-1918,69.52,2.2,"Grand Inquisitor Isillien - On Script - Summon Creature 'Crimson Elite'"),
    (@ENTRY,9,10,0,0,0,100,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,2694,-1875,66.86,3.8,"Grand Inquisitor Isillien - On Script - Summon Creature 'Crimson Elite'"),
    (@ENTRY,9,11,0,0,0,100,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,2693,-1869,66.87,3.9,"Grand Inquisitor Isillien - On Script - Summon Creature 'Crimson Elite'"),
    (@ENTRY,9,12,0,0,0,100,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,2697,-1879,66.8,3.8,"Grand Inquisitor Isillien - On Script - Summon Creature 'Crimson Elite'"),
    (@ENTRY,9,13,0,0,0,100,0,2000,2000,0,0,45,1,1,0,0,0,0,11,12128,100,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Set Data 1 1"),
    (@ENTRY,9,14,0,0,0,100,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Immune To NPC's"),
    (@ENTRY,9,15,0,0,0,100,0,0,0,0,0,49,0,0,0,0,0,0,19,1842,30,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Start Attacking"),
    (@ENTRY,9,16,0,0,0,100,0,45000,45000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 6"),
    (@ENTRY,9,17,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Set Home Position"),
    (@ENTRY,9,18,0,0,0,100,0,0,0,0,0,11,18969,2,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Cast 'Taelan Death'"),
    (@ENTRY,9,19,0,0,0,100,0,500,500,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Evade"),
    (@ENTRY,9,20,0,0,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Set Flags Immune To Players & Immune To NPC's"),
    (@ENTRY,9,21,0,0,0,100,0,6000,6000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 7"),
    (@ENTRY,9,22,0,0,0,100,0,3000,3000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 8"),
    (@ENTRY,9,23,0,0,0,100,0,5000,5000,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Remove Flags Immune To Players & Immune To NPC's"),
    (@ENTRY,9,24,0,0,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Start Attacking"),
    (@ENTRY,9,25,0,0,0,100,0,25000,25000,0,0,12,12126,4,180000,0,0,0,8,0,0,0,2642.8,-1913,71.2,0.4,"Grand Inquisitor Isillien - On Script - Summon Creature 'Lord Tirion Fordring'");

DELETE FROM waypoints WHERE entry=12126;
INSERT INTO waypoints VALUES (12126, 1, 2667, -1899, 66.81, 'Taelan Fordring');

SET @ENTRY := 12126; -- Lord Tirion Fordring SAI
UPDATE creature_template SET unit_flags=0, faction=35, flags_extra=2, AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,1,37,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Initialize - Set Reactstate Aggressive"),
    (@ENTRY,0,1,2,61,0,100,0,0,0,0,0,43,0,2402,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Initialize - Mount To Model 2402"),
    (@ENTRY,0,2,3,61,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Initialize - Set Run On"),
    (@ENTRY,0,3,4,61,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Initialize - Set Npc Flag "),
    (@ENTRY,0,4,0,61,0,100,0,0,0,0,0,53,1,12126,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Initialize - Start Waypoint"),
    (@ENTRY,0,5,0,40,0,100,0,1,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Waypoint 1 Reached - Run Script"),
    (@ENTRY,0,6,0,7,1,100,0,0,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Evade - Run Script (Phase 1)");

SET @ENTRY := 1212600; -- Actionlist SAI
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,9,0,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Set Home Position"),
    (@ENTRY,9,1,0,0,0,100,0,500,500,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Dismount"),
    (@ENTRY,9,2,0,0,0,100,0,500,500,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Set Flag Standstate Kneel"),
    (@ENTRY,9,3,0,0,0,100,0,5000,5000,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Remove Flag Standstate Kneel"),
    (@ENTRY,9,4,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,19,1840,50,0,0,0,0,0,"Lord Tirion Fordring - On Script - Set Orientation Closest Creature 'Grand Inquisitor Isillien'"),
    (@ENTRY,9,5,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 1"),
    (@ENTRY,9,6,0,0,0,100,0,4000,4000,0,0,1,9,0,0,0,0,0,19,1840,50,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 9"),
    (@ENTRY,9,7,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 2"),
    (@ENTRY,9,8,0,0,0,100,0,4000,4000,0,0,1,10,0,0,0,0,0,19,1840,50,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 10"),
    (@ENTRY,9,9,0,0,0,100,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Remove Flags Immune To Players & Immune To NPC's"),
    (@ENTRY,9,10,0,0,0,100,0,0,0,0,0,2,42,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Set Faction 42"),
    (@ENTRY,9,11,0,0,0,100,0,3000,3000,0,0,49,0,0,0,0,0,0,19,1840,50,0,0,0,0,0,"Lord Tirion Fordring - On Script - Start Attacking"),
    (@ENTRY,9,12,0,0,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Set Event Phase 1");

SET @ENTRY := 1212601; -- Actionlist SAI
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,9,0,0,0,0,100,0,3000,3000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 3"),
    (@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 4"),
    (@ENTRY,9,2,0,0,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Set Flag Standstate Kneel"),
    (@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 5"),
    (@ENTRY,9,4,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Remove Flag Standstate Kneel"),
    (@ENTRY,9,5,0,0,0,100,0,8000,8000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 6"),
    (@ENTRY,9,6,0,0,0,100,0,9000,9000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 7"),
    (@ENTRY,9,7,0,0,0,100,0,12000,12000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 8"),
    (@ENTRY,9,8,0,0,0,100,0,1000,1000,0,0,15,5944,0,0,0,0,0,18,50,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Quest Credit ''"),
    (@ENTRY,9,9,0,0,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Set Npc Flag Questgiver");

SET @ENTRY := 12128; -- Crimson Elite SAI
UPDATE creature_template SET DamageModifier=2, faction=16, AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,0,0,0,100,0,3000,5000,9000,10000,11,17143,0,0,0,0,0,2,0,0,0,0,0,0,0,"Crimson Elite - In Combat - Cast 'Holy Strike'"),
    (@ENTRY,0,1,0,0,0,100,0,8000,9000,20000,22000,11,14518,0,0,0,0,0,2,0,0,0,0,0,0,0,"Crimson Elite - In Combat - Cast 'Crusader Strike'"),
    (@ENTRY,0,2,0,38,0,100,0,1,1,0,0,69,0,0,0,0,0,0,8,0,0,0,2674,-1906,66.1,5.3,"Crimson Elite - On Data Set 1 1 - Move To Position");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceEntry=1842;
INSERT INTO conditions VALUES (22, 1, 1842, 0, 0, 23, 1, 203, 0, 0, 1, 0, 0, '', 'Dont run action in specific area');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=18969;
INSERT INTO conditions VALUES (13, 1, 18969, 0, 0, 31, 0, 3, 1842, 0, 0, 0, 0, '', 'Target Taelan');
DELETE FROM waypoints WHERE entry=1842;
INSERT INTO waypoints VALUES (1842, 1, 2941.47, -1391.79, 167.237, 'Taelan Fordring'),(1842, 2, 2940.59, -1393.34, 166.084, 'Taelan Fordring'),(1842, 3, 2934.76, -1403.63, 165.943, 'Taelan Fordring'),(1842, 4, 2932.09, -1408.34, 165.943, 'Taelan Fordring'),(1842, 5, 2917.95, -1402.97, 165.943, 'Taelan Fordring'),(1842, 6, 2919.7, -1398.38, 165.88, 'Taelan Fordring'),(1842, 7, 2922.96, -1389.76, 160.89, 'Taelan Fordring'),(1842, 8, 2925.9, -1386.68, 160.842, 'Taelan Fordring'),(1842, 9, 2946.78, -1396.55, 160.842, 'Taelan Fordring'),(1842, 10, 2948.71, -1392.82, 160.842, 'Taelan Fordring'),(1842, 11, 2951.88, -1386.69, 155.974, 'Taelan Fordring'),(1842, 12, 2953.8, -1383.23, 155.949, 'Taelan Fordring'),(1842, 13, 2951.18, -1381.97, 155.949, 'Taelan Fordring'),(1842, 14, 2946.54, -1379.57, 152.02, 'Taelan Fordring'),(1842, 15, 2943.02, -1377.76, 152.02, 'Taelan Fordring'),(1842, 16, 2935.55, -1392.66, 152.02, 'Taelan Fordring'),(1842, 17, 2920.61, -1385.01, 152.02, 'Taelan Fordring'),
(1842, 18, 2915.23, -1395.37, 152.02, 'Taelan Fordring'),(1842, 19, 2926.44, -1401.34, 152.03, 'Taelan Fordring'),(1842, 20, 2930.45, -1403.49, 150.521, 'Taelan Fordring'),(1842, 21, 2933.64, -1405.2, 150.521, 'Taelan Fordring'),(1842, 22, 2930.83, -1412.74, 150.504, 'Taelan Fordring'),(1842, 23, 2924.04, -1426.34, 150.781, 'Taelan Fordring'),(1842, 24, 2917.27, -1439.65, 150.664, 'Taelan Fordring'),(1842, 25, 2914.56, -1445.08, 149.505, 'Taelan Fordring'),(1842, 26, 2911.01, -1452.17, 147.891, 'Taelan Fordring'),(1842, 27, 2911.49, -1460.75, 147.348, 'Taelan Fordring'),(1842, 28, 2915.27, -1471.79, 146.082, 'Taelan Fordring'),(1842, 29, 2917.16, -1477.3, 146.179, 'Taelan Fordring'),(1842, 30, 2937.93, -1475.79, 146.786, 'Taelan Fordring'),(1842, 31, 2948.62, -1483.6, 146.287, 'Taelan Fordring'),(1842, 32, 2950.48, -1502.29, 146.109, 'Taelan Fordring'),(1842, 33, 2949.29, -1521.33, 146.274, 'Taelan Fordring'),(1842, 34, 2950.6, -1538.69, 146.082, 'Taelan Fordring'),
(1842, 35, 2930.13, -1562.47, 145.785, 'Taelan Fordring'),(1842, 36, 2916.36, -1578.33, 146.147, 'Taelan Fordring'),(1842, 37, 2909.48, -1586.26, 146.515, 'Taelan Fordring'),(1842, 38, 2902.06, -1590.55, 146.557, 'Taelan Fordring'),(1842, 39, 2888.13, -1591.98, 145.702, 'Taelan Fordring'),(1842, 40, 2876.43, -1591.6, 144.335, 'Taelan Fordring'),(1842, 41, 2862.5, -1593.03, 142.511, 'Taelan Fordring'),(1842, 42, 2846.46, -1603.03, 139.023, 'Taelan Fordring'),(1842, 43, 2836.07, -1612.41, 135.225, 'Taelan Fordring'),(1842, 44, 2827.58, -1620.07, 132.012, 'Taelan Fordring'),(1842, 45, 2820.52, -1623.16, 131.22, 'Taelan Fordring'),(1842, 46, 2804.83, -1620.19, 129.717, 'Taelan Fordring'),(1842, 47, 2791.11, -1617.4, 129.693, 'Taelan Fordring'),(1842, 48, 2780.39, -1615.9, 129.044, 'Taelan Fordring'),(1842, 49, 2773.01, -1623.84, 128.074, 'Taelan Fordring'),(1842, 50, 2766.04, -1631.69, 127.927, 'Taelan Fordring'),(1842, 51, 2759.06, -1639.54, 128.336, 'Taelan Fordring'),(1842, 52, 2752.08, -1647.38, 127.494, 'Taelan Fordring'),
(1842, 53, 2745.11, -1655.23, 126.277, 'Taelan Fordring'),(1842, 54, 2738.13, -1663.08, 126.679, 'Taelan Fordring'),(1842, 55, 2732.03, -1674.53, 126.673, 'Taelan Fordring'),(1842, 56, 2725.5, -1682.87, 126.414, 'Taelan Fordring'),(1842, 57, 2717.98, -1692.7, 126.476, 'Taelan Fordring'),(1842, 58, 2713.38, -1700, 125.79, 'Taelan Fordring'),(1842, 59, 2703.08, -1714.3, 122.214, 'Taelan Fordring'),(1842, 60, 2694.95, -1729.79, 117.559, 'Taelan Fordring'),(1842, 61, 2689.65, -1745.97, 112.656, 'Taelan Fordring'),(1842, 62, 2689.05, -1763.33, 106.147, 'Taelan Fordring'),(1842, 63, 2690.09, -1774.06, 102.238, 'Taelan Fordring'),(1842, 64, 2691.45, -1786.18, 97.3156, 'Taelan Fordring'),(1842, 65, 2692.17, -1800.16, 90.1386, 'Taelan Fordring'),(1842, 66, 2692.7, -1810.65, 85.387, 'Taelan Fordring'),(1842, 67, 2697.55, -1818.24, 81.7822, 'Taelan Fordring'),(1842, 68, 2700.73, -1829.26, 76.4334, 'Taelan Fordring'),(1842, 69, 2699.39, -1845.15, 71.4784, 'Taelan Fordring'),(1842, 70, 2696.58, -1856.38, 68.2104, 'Taelan Fordring'),(1842, 71, 2694.06, -1870.35, 66.9045, 'Taelan Fordring'),(1842, 72, 2693.26, -1873.62, 66.8413, 'Taelan Fordring'),
(1842, 73, 2675.36, -1891.94, 66.1742, 'Taelan Fordring'),(1842, 74, 2669.33, -1898.11, 66.7004, 'Taelan Fordring');


-- The Tome of Valor - [A] http://www.wowhead.com/quest=1649/the-tome-of-valor

UPDATE creature_template SET faction=14 WHERE entry=6180;
DELETE FROM smart_scripts WHERE entryorguid=6180 AND source_type=0 AND id=2;

SET @DAPHNE := 6182;
DELETE FROM smart_scripts WHERE entryorguid=@DAPHNE  AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN (@DAPHNE*100+00, @DAPHNE*100+01, @DAPHNE*100+02) AND source_type=9;

UPDATE creature_template SET ScriptName="npc_daphne_stilwell", AIName="" WHERE entry=@DAPHNE;
UPDATE creature SET spawntimesecs=10 WHERE guid=66979 AND id=@DAPHNE;

DELETE FROM waypoints WHERE entry=@DAPHNE;
DELETE FROM script_waypoint WHERE entry=@DAPHNE;
INSERT INTO script_waypoint (entry, pointid, location_x, location_y, location_z, waittime, point_comment)
VALUES
    (@DAPHNE, 0, -11480.7, 1545.09, 49.8986, 0, ''),
    (@DAPHNE, 1, -11466.8, 1530.15, 50.2636, 0, ''),
    (@DAPHNE, 2, -11465.2, 1528.34, 50.9544, 0, 'entrance hut'),
    (@DAPHNE, 3, -11463, 1525.24, 50.9385, 0, ''),
    (@DAPHNE, 4, -11461, 1526.61, 50.9385, 5000, 'pick up rifle'),
    (@DAPHNE, 5, -11463, 1525.24, 50.9385, 0, ''),
    (@DAPHNE, 6, -11465.2, 1528.34, 50.9544, 0, ''),
    (@DAPHNE, 7, -11468.4, 1535.08, 50.4009, 15000, 'hold, prepare for wave1'),
    (@DAPHNE, 8, -11468.4, 1535.08, 50.4009, 15000, 'hold, prepare for wave2'),
    (@DAPHNE, 9, -11468.4, 1535.08, 50.4009, 10000, 'hold, prepare for wave3'),
    (@DAPHNE, 10, -11467.9, 1532.46, 50.3489, 0, 'we are done'),
    (@DAPHNE, 11, -11466.1, 1529.86, 50.2094, 0, ''),
    (@DAPHNE, 12, -11463, 1525.24, 50.9385, 0, ''),
    (@DAPHNE, 13, -11461, 1526.61, 50.9385, 5000, 'deliver rifle'),
    (@DAPHNE, 14, -11463, 1525.24, 50.9385, 0, ''),
    (@DAPHNE, 15, -11465.2, 1528.34, 50.9544, 0, ''),
    (@DAPHNE, 16, -11470.3, 1537.28, 50.3785, 0, ''),
    (@DAPHNE, 17, -11475.6, 1548.68, 50.1844, 0, 'complete quest'),
    (@DAPHNE, 18, -11482.3, 1557.41, 48.6245, 0, '');


-- Gnogaine - [A] http://www.wowhead.com/quest=2926/gnogaine

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=11513;
INSERT INTO conditions VALUES (17, 0, 11513, 0, 0, 29, 0, 6213, 6, 0, 0, 0, 0, '', 'Must be near NPC to cast');
INSERT INTO conditions VALUES (17, 0, 11513, 0, 1, 29, 0, 6329, 6, 0, 0, 0, 0, '', 'Must be near NPC to cast');


-- The Only Cure is More Green Glow - [A] http://www.wowhead.com/quest=2962/the-only-cure-is-more-green-glow

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=12709;
INSERT INTO conditions VALUES (17, 0, 12709, 0, 0, 29, 0, 6218, 5, 0, 0, 0, 0, '', 'Must be near NPC to cast');
INSERT INTO conditions VALUES (17, 0, 12709, 0, 1, 29, 0, 6220, 5, 0, 0, 0, 0, '', 'Must be near NPC to cast');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=11637;
INSERT INTO conditions VALUES (13, 1, 11637, 0, 0, 31, 0, 3, 6218, 0, 0, 0, 0, '', 'Requires Entry');
INSERT INTO conditions VALUES (13, 1, 11637, 0, 1, 31, 0, 3, 6220, 0, 0, 0, 0, '', 'Requires Entry');


-- Mantles of the Dawn - [A][H]
-- http://www.wowhead.com/quest=5504/mantles-of-the-dawn
-- http://www.wowhead.com/quest=5524/mantles-of-the-dawn
-- http://www.wowhead.com/quest=5513/mantles-of-the-dawn
-- Chromatic Mantle of the Dawn - [A][H]
-- http://www.wowhead.com/quest=5517/chromatic-mantle-of-the-dawn
-- http://www.wowhead.com/quest=5521/chromatic-mantle-of-the-dawn
-- http://www.wowhead.com/quest=5524/chromatic-mantle-of-the-dawn

UPDATE quest_template_addon SET SpecialFlags=0 WHERE ID IN(5524, 5521, 5517);

DELETE FROM conditions WHERE SourceTypeOrReferenceId=23 AND SourceGroup=10856 AND SourceEntry IN(18169, 18170, 18171, 18172, 18173, 18182);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (23, 10856, 18169, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5504 quest is rewarded OR'),
    (23, 10856, 18169, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5507 quest is rewarded OR'),
    (23, 10856, 18169, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5513 quest is rewarded'),
    (23, 10856, 18170, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5504 quest is rewarded OR'),
    (23, 10856, 18170, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5507 quest is rewarded OR'),
    (23, 10856, 18170, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5513 quest is rewarded'),
    (23, 10856, 18171, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5504 quest is rewarded OR'),
    (23, 10856, 18171, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5507 quest is rewarded OR'),
    (23, 10856, 18171, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5513 quest is rewarded'),
    (23, 10856, 18172, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5504 quest is rewarded OR'),
    (23, 10856, 18172, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5507 quest is rewarded OR'),
    (23, 10856, 18172, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5513 quest is rewarded'),
    (23, 10856, 18173, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5504 quest is rewarded OR'),
    (23, 10856, 18173, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5507 quest is rewarded OR'),
    (23, 10856, 18173, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5513 quest is rewarded'),
    (23, 10856, 18182, 0, 0, 8, 0, 5524, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5524 quest is rewarded OR'),
    (23, 10856, 18182, 0, 1, 8, 0, 5521, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5521 quest is rewarded OR'),
    (23, 10856, 18182, 0, 2, 8, 0, 5517, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5517 quest is rewarded');


DELETE FROM conditions WHERE SourceTypeOrReferenceId=23 AND SourceGroup=10857 AND SourceEntry IN(18169, 18170, 18171, 18172, 18173, 18182);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (23, 10857, 18169, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 10857, 18169, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 10857, 18169, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 10857, 18170, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 10857, 18170, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 10857, 18170, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 10857, 18171, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 10857, 18171, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 10857, 18171, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 10857, 18172, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 10857, 18172, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 10857, 18172, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 10857, 18173, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 10857, 18173, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 10857, 18173, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 10857, 18182, 0, 0, 8, 0, 5524, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5524 quest is rewarded OR'),
    (23, 10857, 18182, 0, 1, 8, 0, 5521, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5521 quest is rewarded OR'),
    (23, 10857, 18182, 0, 2, 8, 0, 5517, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5517 quest is rewarded');


DELETE FROM conditions WHERE SourceTypeOrReferenceId=23 AND SourceGroup=11536 AND SourceEntry IN(18169, 18170, 18171, 18172, 18173, 18182);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (23, 11536, 18169, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 11536, 18169, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 11536, 18169, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 11536, 18170, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 11536, 18170, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 11536, 18170, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 11536, 18171, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 11536, 18171, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 11536, 18171, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 11536, 18172, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 11536, 18172, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 11536, 18172, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 11536, 18173, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 11536, 18173, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 11536, 18173, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 11536, 18182, 0, 0, 8, 0, 5524, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5524 quest is rewarded OR'),
    (23, 11536, 18182, 0, 1, 8, 0, 5521, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5521 quest is rewarded OR'),
    (23, 11536, 18182, 0, 2, 8, 0, 5517, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5517 quest is rewarded');


UPDATE quest_template_addon SET ExclusiveGroup=5504 WHERE ID IN(5504, 5507, 5513);
UPDATE quest_template_addon SET ExclusiveGroup=5517 WHERE ID IN(5517, 5521, 5524);


-- Kill 'em With Sleep Deprivation - [A][H] http://www.wowhead.com/quest=7702/kill-em-with-sleep-deprivation
-- Look at the Size of It! - [A][H] http://www.wowhead.com/quest=7704/look-at-the-size-of-it

SET @EVENTGENGUID := 2134531;
SET @DARK_IRON_PILLOW_EVENT_GENERATOR := 179829;
SET @DARK_IRON_PILLOW := 179828;
SET @SLEEPY_DARK_IRON_WORKER := 14635;
SET @CHAMBERMAID_PILLACLENCHER := 14636;

DELETE FROM gameobject WHERE guid=@EVENTGENGUID AND id=@DARK_IRON_PILLOW_EVENT_GENERATOR;
INSERT INTO gameobject (guid, id, map, zoneId, areaId, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state, VerifiedBuild)
VALUES
    (@EVENTGENGUID, @DARK_IRON_PILLOW_EVENT_GENERATOR, 0, 0, 0, 1, 1, -6550.48, -1347.64, 208.931, 0.982185, 0, 0, 0.47159, 0.881818, 300, 0, 1, 0);

DELETE FROM creature_text WHERE entry=@SLEEPY_DARK_IRON_WORKER;
INSERT INTO creature_text VALUES(@SLEEPY_DARK_IRON_WORKER, 0, 0, "Our pillas! Someone has stolen our pillas!", 14, 0, 100, 0, 0, 0, 9799, 0, 'Sleepy Dark Iron Worker');

DELETE FROM creature_text WHERE entry=@CHAMBERMAID_PILLACLENCHER;
INSERT INTO creature_text VALUES(@CHAMBERMAID_PILLACLENCHER, 0, 0, "Thieves! Scallywags! Rapscallions! Come face me gigantic pillas!", 14, 0, 100, 0, 0, 0, 9810, 0, 'Chambermaid Pillaclencher');

DELETE FROM creature_loot_template WHERE Entry=@CHAMBERMAID_PILLACLENCHER AND Item=18950;
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment)
VALUES
    (@CHAMBERMAID_PILLACLENCHER, 18950, 0, 100, 0, 1, 0, 1, 1, "Starts quest 28058");

UPDATE gameobject_template SET AIName="SmartGameObjectAI", flags=0 WHERE entry=@DARK_IRON_PILLOW; -- Dark Iron Pillow SAI
DELETE FROM smart_scripts WHERE entryorguid=@DARK_IRON_PILLOW AND source_type=1;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@DARK_IRON_PILLOW,1,0,1,70,0,100,0,2,0,0,0,45,1,1,0,0,0,0,14,@EVENTGENGUID,@DARK_IRON_PILLOW_EVENT_GENERATOR,0,0,0,0,0,"Dark Iron Pillow - On Gameobject State Changed - Set Data 1 1"),
    (@DARK_IRON_PILLOW,1,1,2,61,0,100,0,2,0,0,0,70,45,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Pillow - On Gameobject State Changed - Respawn Self in 45 secs");

UPDATE gameobject_template SET AIName="SmartGameObjectAI" WHERE entry=@DARK_IRON_PILLOW_EVENT_GENERATOR; -- Dark Iron Pillow Event Generator SAI
DELETE FROM smart_scripts WHERE entryorguid=@DARK_IRON_PILLOW_EVENT_GENERATOR AND source_type=1;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES    
    (@DARK_IRON_PILLOW_EVENT_GENERATOR,1,0,1,38,0,100,0,1,1,0,0,80,@DARK_IRON_PILLOW_EVENT_GENERATOR*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Run Script"),
    (@DARK_IRON_PILLOW_EVENT_GENERATOR,1,1,0,61,0,100,0,1,1,0,0,12,24110,1,300000,0,0,0,8,0,0,0,-6541.468262,-1352.773804,208.964294,5.211554,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Bunny'");

SET @ENTRY := @DARK_IRON_PILLOW_EVENT_GENERATOR*100+00; -- Actionlist SAI
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,9,0,0,0,0,100,0,30000,30000,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6576.413086,-1307.21350,208.633347,5.172282,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6574.531738,-1306.411987,208.677628,5.211554,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,2,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6573.533691,-1308.259644,208.610107,5.207627,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,3,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6574.955566,-1309.820923,208.577423,5.207627,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,4,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6573.238281,-1309.668701,208.623535,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,5,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6572.944336,-1307.367676,208.562149,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,6,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6571.871094,-1309.412842,208.659698,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,7,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6572.612793,-1311.513184,208.649902,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,8,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6574.156250,-1312.323364,208.611801,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,9,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6572.203125,-1312.584473,208.665710,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,10,0,0,0,100,0,0,0,0,0,1,0,4000,0,0,0,0,19,@SLEEPY_DARK_IRON_WORKER,100,0,0,0,0,0,"Dark Iron Pillow Event Generator - On Just Summoned - Say Line 0"),
    (@ENTRY,9,11,0,0,0,100,0,45000,45000,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6576.413086,-1307.21350,208.633347,5.172282,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,12,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6574.531738,-1306.411987,208.677628,5.211554,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,13,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6573.533691,-1308.259644,208.610107,5.207627,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,14,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6574.955566,-1309.820923,208.577423,5.207627,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,15,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6573.238281,-1309.668701,208.623535,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,16,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6572.944336,-1307.367676,208.562149,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,17,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6571.871094,-1309.412842,208.659698,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,18,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6572.612793,-1311.513184,208.649902,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,19,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6574.156250,-1312.323364,208.611801,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,20,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6572.203125,-1312.584473,208.665710,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,21,0,0,0,100,0,0,0,0,0,1,0,4000,0,0,0,0,19,@SLEEPY_DARK_IRON_WORKER,100,0,0,0,0,0,"Dark Iron Pillow Event Generator - On Just Summoned - Say Line 0"),
    (@ENTRY,9,22,0,0,0,100,0,60000,60000,0,0,12,@CHAMBERMAID_PILLACLENCHER,4,30000,0,0,0,8,0,0,0,-6572.203125,-1312.584473,208.665710,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,23,0,0,0,100,0,0,0,0,0,1,0,4000,0,0,0,0,19,@CHAMBERMAID_PILLACLENCHER,100,0,0,0,0,0,"Chambermaid Pillaclencher - On Just Summoned - Say Line 0");

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@SLEEPY_DARK_IRON_WORKER; -- Sleepy Dark Iron Worker SAI
DELETE FROM smart_scripts WHERE entryorguid=@SLEEPY_DARK_IRON_WORKER AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@SLEEPY_DARK_IRON_WORKER,0,0,0,1,0,100,1,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"Sleepy Dark Iron Worker - On Just Summoned - Attack start");

UPDATE creature_template SET AIName="SmartAI", lootid=@CHAMBERMAID_PILLACLENCHER WHERE entry=@CHAMBERMAID_PILLACLENCHER; -- Chambermaid Pillaclencher SAI
DELETE FROM smart_scripts WHERE entryorguid=@CHAMBERMAID_PILLACLENCHER AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@CHAMBERMAID_PILLACLENCHER,0,0,0,1,0,100,1,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"Chambermaid Pillaclencher - On Just Summoned - Attack start"),
    (@CHAMBERMAID_PILLACLENCHER,0,1,0,0,0,100,0,3000,3000,8000,9000,11,23417,0,0,0,0,0,2,0,0,0,0,0,0,0,"Chambermaid Pillaclencher - In Combat - Cast 'Smother'"),
    (@CHAMBERMAID_PILLACLENCHER,0,2,0,6,0,100,0,0,0,0,0,41,0,0,0,0,0,0,19,24110,100,0,0,0,0,0,"Chambermaid Pillaclencher - Just Died - Despawn Large Bunny");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceGroup IN(0, 1) AND SourceEntry=@DARK_IRON_PILLOW_EVENT_GENERATOR;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (22, 0, @DARK_IRON_PILLOW_EVENT_GENERATOR, 1, 0, 29, 1, 24110, 100, 0, 1, 0, 0, '', 'Dark Iron Pillow Event Generator only Trigger if there is no Large Bunny within 100 Yards'),
    (22, 1, @DARK_IRON_PILLOW_EVENT_GENERATOR, 1, 0, 29, 1, 24110, 100, 0, 1, 0, 0, '', 'Dark Iron Pillow Event Generator only Trigger if there is no Large Bunny within 100 Yards');


-- Broken Alliances - [H] http://www.wowhead.com/quest=782/broken-alliances

UPDATE gameobject_template SET flags=32 WHERE entry in(2842, 2848, 2858);
UPDATE gameobject SET spawntimesecs=0 WHERE guid IN(10830, 10644, 10643) AND id IN(2842, 2848, 2858);

-- Massacre At Light's Point - [A][H] http://www.wowhead.com/quest=12701/massacre-at-lights-point
UPDATE `creature` SET `spawntimesecs`=60 WHERE `id` IN (28834, 28856, 28850);

-- The Balance of Light and Shadow - [A][H] http://www.wowhead.com/quest=7622/the-balance-of-light-and-shadow
UPDATE `creature_template` SET `ScriptName`='npc_fleeing_peasant', `RegenHealth`=0 WHERE `entry` IN (14484,14485);
UPDATE `creature_template` SET `ScriptName`='npc_eris_havenfire' WHERE `entry`=14494;
UPDATE `creature_template` SET `AIName`='ArcherAI' WHERE `entry`=14489;

DELETE FROM `creature_text` WHERE `entry` IN (14484,14494);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(14484, 0, 0, 'Death take me! I cannot go on! I have nothing left...', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 0, 1, 'Should I live through this, I shall make it my live\'s sole ambition to destroy Arthas...', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 0, 2, 'The pain is unbearable!', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 0, 3, 'I won\'t make it... go... go on without me...', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 1, 0, 'The Scourge is uppon us! Run! Run for your lives!', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 2, 0, 'Please help us! The Prince has gone mad!', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 3, 0, 'Seek sanctuary in Hearthglen! It is our only hope!', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 4, 0, 'Thank you, kind stranger. May your heroism never be forgotten.', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 4, 1, 'The power of the light is truly great and merciful.', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 4, 2, 'Stranger, find the fallen Prince Menethil and end his reign of terror.', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),

(14494, 0, 0, 'Be healed!', 12, 0, 100, 0, 0, 0, 0, 0, 'Eris Havenfire'),
(14494, 1, 0, 'We are saved! The peasants have escaped the Scourge!', 12, 0, 100, 0, 0, 0, 0, 0, 'Eris Havenfire');

-- [Quest][Classic] Scarlet Diversions -- http://wotlk.openwow.com/quest=5096
SET @CREATURE_TEMPLATE_ID := 1010663;
SET @CREATURE_GUID := 3106806;

-- delete permanent spawned spellfocus GO
DELETE FROM `gameobject` WHERE `id` = 176088;

-- create Trigger NPC which handles the spawn of the spellfocus via core script
DELETE FROM `creature_template` WHERE `entry`= @CREATURE_TEMPLATE_ID;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES 
(@CREATURE_TEMPLATE_ID, 0, 0, 0, 0, 0, 10045, 0, 0, 0, 'Scarlet Diversions - Trigger NPC', '', '', 0, 75, 75, 2, 35, 0, 1, 1.71429, 1, 0, 0, 2000, 2000, 1, 1, 1, 33587968, 2048, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 1, 1, 0, 164, 1, 0, 130, 'npc_scarlet_diversions_trigger', 1);

DELETE FROM `creature` WHERE `guid` = @CREATURE_GUID;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CREATURE_GUID, @CREATURE_TEMPLATE_ID, 0, 1, 1, 0, 0, 1876.74, -1332.68, 59.9489, 0.160994, 300, 0, 0, 1, 0, 0, 0, 33554432, 0);

-- DB/gameobject: set positive spawntimesecs for 2 quest objects 
UPDATE `gameobject` SET `spawntimesecs`= 180 WHERE `id`= 176088;
UPDATE `gameobject` SET `spawntimesecs`= 150 WHERE `id`= 180659;

-- DB/Quest: Ogres droping Pure Un'Goro Samples -- http://wowwiki.wikia.com/wiki/Quest:..._and_a_Batch_of_Ooze
DELETE FROM `creature_loot_template` WHERE  `Entry`=7035 AND `Item`=12236;


-- [Quest] Distracting Jarven -- http://www.wowhead.com/quest=308
-- Jarven Thunderbrew SAI
SET @ENTRY := 1373;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,308,0,0,0,1,0,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Quest 'Distracting Jarven' Finished - Say Line 0"),
(@ENTRY,0,1,9,61,0,100,0,308,0,0,0,53,0,1373,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Quest 'Distracting Jarven' Finished - Start Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,2,1373,0,0,70,30,0,0,0,0,0,14,35875,270,0,0,0,0,0,"Jarven Thunderbrew - On Waypoint 2 Reached - Respawn Closest Gameobject 'Unguarded Thunder Ale Barrel'"),
(@ENTRY,0,3,6,40,0,100,0,8,1373,0,0,1,1,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Waypoint 8 Reached - Say Line 1"),
(@ENTRY,0,4,0,40,0,100,0,15,1373,0,0,1,2,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Waypoint 15 Reached - Say Line 2"),
(@ENTRY,0,5,7,40,0,100,0,17,1373,0,0,1,3,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Waypoint 17 Reached - Say Line 3"),
(@ENTRY,0,6,0,61,0,100,0,8,1373,0,0,54,11000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Waypoint 8 Reached - Pause Waypoint"),
(@ENTRY,0,7,8,61,0,100,0,17,1373,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.97738,"Jarven Thunderbrew - On Waypoint 17 Reached - Set Orientation 0,97738"),
(@ENTRY,0,8,0,61,0,100,0,17,1373,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Waypoint 17 Reached - Set Npc Flags Gossip & Questgiver"),
(@ENTRY,0,9,0,61,0,100,0,308,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Quest 'Distracting Jarven' Finished - Remove Npc Flags Gossip & Questgiver");

UPDATE `creature_text` SET `type`=16, `language`=7 WHERE  `entry`=1373 AND `groupid`=0 AND `id`=0;

DELETE FROM `waypoints` WHERE `entry`=1373;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(1373, 1, -5601.64,-541.38,392.42,"Jarven Thunderbrew"),
(1373, 2, -5597.94,-542.04,392.42,"Jarven Thunderbrew"), -- Respawn Closest Gameobject 'Unguarded Thunder Ale Barrel'
(1373, 3, -5597.95,-548.43,395.48,"Jarven Thunderbrew"),
(1373, 4, -5605.31,-549.33,399.09,"Jarven Thunderbrew"),
(1373, 5, -5607.55,-546.63,399.09,"Jarven Thunderbrew"),
(1373, 6, -5597.52,-538.75,399.09,"Jarven Thunderbrew"),
(1373, 7, -5597.62,-530.24,399.65,"Jarven Thunderbrew"),
(1373, 8, -5603.67,-529.91,399.65,"Jarven Thunderbrew"), -- On Script - Say Line 1
(1373, 9, -5603.67,-529.91,399.65,"Jarven Thunderbrew"),
(1373, 10, -5597.62,-530.24,399.65,"Jarven Thunderbrew"),
(1373, 11, -5597.52,-538.75,399.09,"Jarven Thunderbrew"),
(1373, 12, -5607.55,-546.63,399.09,"Jarven Thunderbrew"),
(1373, 13, -5605.31,-549.33,399.09,"Jarven Thunderbrew"),
(1373, 14, -5597.95,-548.43,395.48,"Jarven Thunderbrew"),
(1373, 15, -5597.94,-542.04,392.42,"Jarven Thunderbrew"), -- On Script - Say Line 2 
(1373, 16, -5601.64,-541.38,392.42,"Jarven Thunderbrew"),
(1373, 17, -5605.96,-544.45,392.43,"Jarven Thunderbrew"); -- On Script - Say Line 3

-- Delete Actionlist SAI
SET @ENTRY := 137300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;

-- Lokhtos Darkbargainer quests
-- Favor Amongst the Brotherhood, Core Leather - ID: 6645
-- Favor Amongst the Brotherhood, Blood of the Mountain - ID: 6646
-- Favor Amongst the Brotherhood, Fiery Core - ID: 6643
-- Favor Amongst the Brotherhood, Lava Core - ID: 6644
-- Favor Amongst the Brotherhood, Dark Iron Ore - ID: 6642
UPDATE `quest_template_addon` SET `RequiredMinRepValue` = 0 WHERE `ID` BETWEEN 6642 AND 6646;
UPDATE `quest_template_addon` SET `RequiredMaxRepFaction` = 59 , `RequiredMaxRepValue` = 9000 , `SpecialFlags` = 1 WHERE `ID` = 13662;



-- [NPC][Classic] Demetria - missing guards - update path
SET @CGUID := 5004778;
DELETE FROM `creature` WHERE `id` IN (12352, 12339);
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID + 0 AND @CGUID + 9;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID + 0, 12352, 0, 0, 0, 1, 1, 0, 0, 1640.14,-5467.21,97.83,1.15839, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 1, 12352, 0, 0, 0, 1, 1, 0, 0, 1638.76,-5466.3,97.7965,1.15839, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 2, 12352, 0, 0, 0, 1, 1, 0, 0, 1636.83,-5467.03,98.3487,1.37436, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 3, 12352, 0, 0, 0, 1, 1, 0, 0, 1640.8,-5468.42,98.0504,1.24477, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 4, 12352, 0, 0, 0, 1, 1, 0, 0, 1640.3,-5469.83,98.5054,1.0414, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 5, 12352, 0, 0, 0, 1, 1, 0, 0, 1636.94,-5468.06,98.5386,0.927513, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 6, 12352, 0, 0, 0, 1, 1, 0, 0, 1639.53,-5470.85,98.8409,1.12386, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 7, 12352, 0, 0, 0, 1, 1, 0, 0, 1637.89,-5470.61,98.9737,1.10815, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 8, 12352, 0, 0, 0, 1, 1, 0, 0, 1636.58,-5469.1,98.8369,1.09245, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 9, 12339, 0, 0, 0, 1, 1, 0, 0, 1638.35,-5469.5,98.6581,1.26412, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420);

-- add guard linking
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+9;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(@CGUID+9, @CGUID+9, 0, 0, 7, 0, 0),
(@CGUID+9, @CGUID + 0, 3, 360, 7, 0, 0),
(@CGUID+9, @CGUID + 1, 3, 320, 7, 0, 0),
(@CGUID+9, @CGUID + 2, 3, 280, 7, 0, 0),
(@CGUID+9, @CGUID + 3, 3, 240, 7, 0, 0),
(@CGUID+9, @CGUID + 4, 3, 200, 7, 0, 0),
(@CGUID+9, @CGUID + 5, 3, 160, 7, 0, 0),
(@CGUID+9, @CGUID + 6, 3, 120, 7, 0, 0),
(@CGUID+9, @CGUID + 7, 3, 80, 7, 0, 0),
(@CGUID+9, @CGUID + 8, 3, 40, 7, 0, 0);

DELETE FROM `creature_template_addon` WHERE  `entry`=12339;
DELETE FROM `waypoint_data` WHERE  `id`=12339;

-- Demetria <The Scarlet Oracle>
UPDATE `creature_template` SET `Speed_Walk` = 1 WHERE `entry`  IN (12339, 12352);
SET @NPC := @CGUID + 9;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`, `action`, `action_chance`) VALUES
(@PATH,1,1638.35,-5469.5,98.6581,0,0,100),
(@PATH,2,1645.41,-5450.02,92.1866,0,0,100),
(@PATH,3,1652.78,-5430.76,84.4578,0,0,100),
(@PATH,4,1657.93,-5416.62,79.8772,0,0,100),
(@PATH,5,1661.83,-5406.66,76.2934,0,0,100),
(@PATH,6,1669.8,-5383.78,73.6196,0,0,100),
(@PATH,7,1677.99,-5358.84,73.6117,0,0,100),
(@PATH,8,1695.25,-5350.09,73.6118,0,0,100),
(@PATH,9,1687.04,-5321.94,73.6112,0,0,100),
(@PATH,10,1688.58,-5304.51,73.6112,0,0,100),
(@PATH,11,1691,-5283.65,73.6122,0,0,100),
(@PATH,12,1691.91,-5262.08,73.6113,0,0,100),
(@PATH,13,1692.66,-5241.1,73.6185,0,0,100),
(@PATH,14,1692.85,-5206.13,74.6546,0,0,100),
(@PATH,15,1690.64,-5185.28,73.9301,0,0,100),
(@PATH,16,1688.08,-5167.96,73.9937,0,0,100),
(@PATH,17,1690.38,-5149.03,74.0396,0,0,100),
(@PATH,18,1697.51,-5118.86,73.6245,0,0,100),
(@PATH,19,1704.67,-5099.13,74.6873,0,0,100),
(@PATH,20,1711.01,-5080.54,77.301,0,0,100),
(@PATH,21,1718.55,-5057.22,80.1628,0,0,100),
(@PATH,22,1730.24,-5032.73,80.6236,0,0,100),
(@PATH,23,1742.91,-5011.79,79.9012,0,0,100),
(@PATH,24,1754.95,-4994.6,80.643,0,0,100),
(@PATH,25,1766.67,-4977.18,81.2274,0,0,100),
(@PATH,26,1773.03,-4950.42,81.449,0,0,100),
(@PATH,27,1777.47,-4922.77,81.5212,0,0,100),
(@PATH,28,1782.09,-4902.3,84.2517,0,0,100),
(@PATH,29,1788.34,-4877.56,87.4965,0,0,100),
(@PATH,30,1796.57,-4845.8,89.4469,0,0,100),
(@PATH,31,1809.45,-4798.58,91.0304,0,0,100),
(@PATH,32,1816.93,-4777.84,90.0115,0,0,100),
(@PATH,33,1831.75,-4734.83,90.0915,0,0,100),
(@PATH,34,1862.63,-4701.05,93.0158,0,0,100),
(@PATH,35,1889.08,-4684.05,92.355,0,0,100),
(@PATH,36,1910.74,-4672.59,91.1087,0,0,100),
(@PATH,37,1927.94,-4658.95,87.5957,0,0,100),
(@PATH,38,1935.76,-4647.33,84.3063,0,0,100),
(@PATH,39,1944.66,-4632.27,79.9795,0,0,100),
(@PATH,40,1954.98,-4609.24,74.7545,0,0,100),
(@PATH,41,1958.16,-4599.23,73.7161,0,0,100),
(@PATH,42,1968.46,-4572.57,73.6229,0,0,100),
(@PATH,43,1979.44,-4555.29,73.6229,0,0,100),
(@PATH,44,1984,-4549.99,73.6229,0,0,100),
(@PATH,45,1996.94,-4538.24,73.6229,0,0,100),
(@PATH,46,2005.36,-4531.97,73.6229,0,0,100),
(@PATH,47,2016.76,-4523.84,73.6213,0,0,100),
(@PATH,48,2027.83,-4517.97,73.6213,0,0,100),
(@PATH,49,2045.28,-4518.38,73.6213,0,0,100),
(@PATH,50,2061.31,-4534.8,73.6213,0,0,100),
(@PATH,51,2086.08,-4561.88,73.6213,0,0,100),
(@PATH,52,2105.32,-4580.45,73.6238,0,0,100),
(@PATH,53,2121.3,-4594.16,73.6238,0,0,100),
(@PATH,54,2146.73,-4612.71,73.6218,0,0,100),
(@PATH,55,2177.86,-4627.43,73.6067,0,0,100),
(@PATH,56,2197.77,-4633.93,73.6226,0,0,100),
(@PATH,57,2219.97,-4633.96,73.6226,0,0,100),
(@PATH,58,2250.74,-4627.66,73.6226,0,0,100),
(@PATH,59,2274.12,-4620.36,73.6226,0,0,100),
(@PATH,60,2304.25,-4611.22,73.6227,0,0,100),
(@PATH,61,2338.64,-4604.74,73.6227,0,0,100),
(@PATH,62,2389.36,-4603.99,73.6227,0,0,100),
(@PATH,63,2457.27,-4631.39,74.092,0,0,100),
(@PATH,64,2493.9,-4652.17,75.2848,0,0,100),
(@PATH,65,2535.82,-4654.52,77.3071,0,0,100),
(@PATH,66,2567.1,-4644.61,79.4072,0,0,100),
(@PATH,67,2594.36,-4628.84,81.876,0,0,100),
(@PATH,68,2617.07,-4615.06,84.1387,0,0,100),
(@PATH,69,2689.76,-4571.94,87.2045,0,0,100),
(@PATH,70,2745.8,-4539.07,88.764,0,0,100),
(@PATH,71,2839.33,-4436.83,89.7157,0,0,100),
(@PATH,72,2880.41,-4361.54,90.2576,0,0,100),
(@PATH,73,2923.76,-4110.16,96.3698,0,0,100),
(@PATH,74,2947.2,-4033.15,99.8002,0,0,100),
(@PATH,75,2968.64,-3982.02,104.423,0,0,100),
(@PATH,76,2976.9,-3964.26,107.058,0,0,100),
(@PATH,77,2983.54,-3937.96,111.717,0,0,100),
(@PATH,78,3000.21,-3877.74,118.93,0,0,100),
(@PATH,79,3011.92,-3842.22,119.306,0,0,100),
(@PATH,80,3021.88,-3813.28,118.955,0,0,100),
(@PATH,81,3028.71,-3797.17,120.17,0,0,100),
(@PATH,82,3042.19,-3764.47,119.971,0,0,100),
(@PATH,83,3057.23,-3724.98,119.568,0,0,100),
(@PATH,84,3062.31,-3690.16,121.125,0,0,100),
(@PATH,85,3048.16,-3659.65,122.811,0,0,100),
(@PATH,86,3041.49,-3641.07,125.02,0,0,100),
(@PATH,87,3039.91,-3617.72,123.977,0,0,100),
(@PATH,88,3040.67,-3597.35,124.377,0,0,100),
(@PATH,89,3042.45,-3556.22,126.571,0,0,100),
(@PATH,90,3046.02,-3530.23,129.898,0,0,100),
(@PATH,91,3057.06,-3493.26,131.601,0,0,100),
(@PATH,92,3076.38,-3462.24,134.709,0,0,100),
(@PATH,93,3086.02,-3451.18,136,0,0,100),
(@PATH,94,3097.45,-3438.57,136.842,0,0,100),
(@PATH,95,3133.22,-3404.77,139.345,0,0,100),
(@PATH,96,3150.28,-3401.16,140.105,0,0,100),
(@PATH,97,3172.46,-3393.09,142.015,0,0,100),
(@PATH,98,3191.09,-3389.1,143.607,0,0,100),
(@PATH,99,3210.72,-3387.02,144.24,0,0,100),
(@PATH,100,3250.95,-3382.95,143.581,0,0,100),
(@PATH,101,3269.06,-3382.33,143.195,0,0,100),
(@PATH,102,3286.95,-3382.42,142.377,0,0,100),
(@PATH,103,3307.89,-3382.95,144.951,0,0,100),
(@PATH,104,3329.2,-3382.28,144.845,0,0,100),
(@PATH,105,3347.55,-3381.64,144.779,0,0,100),
(@PATH,106,3361.09,-3380.75,144.781,0,0,100),
(@PATH,107,3339.81,-3380.58,144.774,0,0,100),
(@PATH,108,3311.44,-3380.27,145.017,0,0,100),
(@PATH,109,3296.01,-3380.1,143.741,0,0,100),
(@PATH,110,3274.59,-3380.86,142.727,0,0,100),
(@PATH,111,3274.59,-3380.86,142.727,0,0,100),
(@PATH,112,3251.44,-3382.31,143.585,0,0,100),
(@PATH,113,3217.38,-3385.87,144.301,0,0,100),
(@PATH,114,3189.08,-3389.3,143.545,0,0,100),
(@PATH,115,3168.36,-3392.69,141.758,0,0,100),
(@PATH,116,3128.73,-3405.3,139.154,0,0,100),
(@PATH,117,3104.29,-3429.73,137.697,0,0,100),
(@PATH,118,3079.44,-3458.29,135.39,0,0,100),
(@PATH,119,3062.03,-3484.05,132.59,0,0,100),
(@PATH,120,3051.15,-3508.73,131.122,0,0,100),
(@PATH,121,3044.5,-3543.07,128.53,0,0,100),
(@PATH,122,3040.58,-3585.59,124.369,0,0,100),
(@PATH,123,3040.05,-3618.85,124.055,0,0,100),
(@PATH,124,3041.87,-3636.23,125.378,0,0,100),
(@PATH,125,3048.01,-3656.25,122.83,0,0,100),
(@PATH,126,3059.89,-3685.41,121.254,0,0,100),
(@PATH,127,3063.62,-3704.59,120.885,0,0,100),
(@PATH,128,3049.97,-3743.53,120.437,0,0,100),
(@PATH,129,3038.77,-3773.26,119.728,0,0,100),
(@PATH,130,3029.37,-3797.56,120.123,0,0,100),
(@PATH,131,3017.78,-3822.93,118.882,0,0,100),
(@PATH,132,3011.9,-3841.29,119.307,0,0,100),
(@PATH,133,2999.1,-3881.4,118.595,0,0,100),
(@PATH,134,2992.82,-3899.77,116.742,0,0,100),
(@PATH,135,2987.35,-3919.01,114.686,0,0,100),
(@PATH,136,2979.54,-3951.23,108.575,0,0,100),
(@PATH,137,2974.35,-3965.01,106.582,0,0,100),
(@PATH,138,2965.39,-3989.01,103.564,0,0,100),
(@PATH,139,2947.58,-4032.49,99.8551,0,0,100),
(@PATH,140,2940.68,-4050.84,98.8149,0,0,100),
(@PATH,141,2927.47,-4095.16,96.9418,0,0,100),
(@PATH,142,2922.28,-4117.41,96.1034,0,0,100),
(@PATH,143,2916.91,-4141.33,95.1063,0,0,100),
(@PATH,144,2912.33,-4161.43,94.1942,0,0,100),
(@PATH,145,2906.67,-4194.05,92.8009,0,0,100),
(@PATH,146,2902.22,-4224.72,91.8676,0,0,100),
(@PATH,147,2898.62,-4254.12,91.3725,0,0,100),
(@PATH,148,2896.84,-4270.08,91.1643,0,0,100),
(@PATH,149,2892.88,-4300.96,90.6728,0,0,100),
(@PATH,150,2882.86,-4347.85,90.3236,0,0,100),
(@PATH,151,2875.88,-4369.2,90.0259,0,0,100),
(@PATH,152,2866.06,-4388.72,89.6369,0,0,100),
(@PATH,153,2855.15,-4407.04,89.3003,0,0,100),
(@PATH,154,2844.51,-4424.87,89.4741,0,0,100),
(@PATH,155,2835.01,-4439.19,89.6752,0,0,100),
(@PATH,156,2825.9,-4452.37,89.8312,0,0,100),
(@PATH,157,2781.37,-4503.54,89.6992,0,0,100),
(@PATH,158,2768.3,-4516.57,89.4068,0,0,100),
(@PATH,159,2751.64,-4531.98,88.9045,0,0,100),
(@PATH,160,2738.52,-4542.49,88.4996,0,0,100),
(@PATH,161,2714.09,-4557.62,87.6424,0,0,100),
(@PATH,162,2699.67,-4566.29,87.4294,0,0,100),
(@PATH,163,2684.52,-4575.58,87.001,0,0,100),
(@PATH,164,2667.22,-4586.17,85.7211,0,0,100),
(@PATH,165,2630.76,-4606.45,84.5909,0,0,100),
(@PATH,166,2618.07,-4614.37,84.1965,0,0,100),
(@PATH,167,2592.51,-4629.78,81.6831,0,0,100),
(@PATH,168,2570.53,-4643.56,79.6884,0,0,100),
(@PATH,169,2558.75,-4648.16,78.7332,0,0,100),
(@PATH,170,2544.22,-4651.95,77.8191,0,0,100),
(@PATH,171,2528.11,-4654.63,76.8986,0,0,100),
(@PATH,172,2511.76,-4655.66,76.0362,0,0,100),
(@PATH,173,2487.63,-4647.41,75.1608,0,0,100),
(@PATH,174,2467.38,-4636.04,74.6576,0,0,100),
(@PATH,175,2453.17,-4627.91,73.6226,0,0,100),
(@PATH,176,2437.83,-4620.44,73.6179,0,0,100),
(@PATH,177,2425.09,-4614.63,73.613,0,0,100),
(@PATH,178,2401.34,-4604.92,73.6229,0,0,100),
(@PATH,179,2367.28,-4602.14,73.6229,0,0,100),
(@PATH,180,2348.43,-4603.85,73.6229,0,0,100),
(@PATH,181,2312.07,-4610.25,73.6226,0,0,100),
(@PATH,182,2289.67,-4616.1,73.6237,0,0,100),
(@PATH,183,2270.18,-4621.81,73.6232,0,0,100),
(@PATH,184,2237.91,-4633.07,73.623,0,0,100),
(@PATH,185,2211.17,-4636.19,73.623,0,0,100),
(@PATH,186,2185.27,-4631.85,73.6238,0,0,100),
(@PATH,187,2161.67,-4621.89,73.6227,0,0,100),
(@PATH,188,2149.52,-4615.7,73.6227,0,0,100),
(@PATH,189,2128.18,-4600.53,73.6227,0,0,100),
(@PATH,190,2110.23,-4586.01,73.6227,0,0,100),
(@PATH,191,2094.4,-4570.16,73.6232,0,0,100),
(@PATH,192,2059.78,-4531.27,73.6232,0,0,100),
(@PATH,193,2025.92,-4515.28,73.6218,0,0,100),
(@PATH,194,1981.81,-4549.69,73.6228,0,0,100),
(@PATH,195,1968.69,-4574.04,73.6228,0,0,100),
(@PATH,196,1957.36,-4608.7,74.4979,0,0,100),
(@PATH,197,1948.95,-4627.72,78.4405,0,0,100),
(@PATH,198,1940.18,-4642.16,82.8813,0,0,100),
(@PATH,199,1932.32,-4651.64,85.6817,0,0,100),
(@PATH,200,1923.41,-4662.78,88.4994,0,0,100),
(@PATH,201,1912.89,-4671.55,90.7472,0,0,100),
(@PATH,202,1904.98,-4676.2,91.9429,0,0,100),
(@PATH,203,1880.51,-4687.26,92.3027,0,0,100),
(@PATH,204,1854.01,-4707.87,93.1035,0,0,100),
(@PATH,205,1840.53,-4719.99,92.1716,0,0,100),
(@PATH,206,1833.29,-4732.42,90.4734,0,0,100),
(@PATH,207,1825.75,-4748.92,88.8841,0,0,100),
(@PATH,208,1822.27,-4758.66,89.1826,0,0,100),
(@PATH,209,1817.98,-4771.4,89.7992,0,0,100),
(@PATH,210,1813.98,-4783.45,90.3784,0,0,100),
(@PATH,211,1810.56,-4794.25,91.0151,0,0,100),
(@PATH,212,1805.81,-4811.34,90.581,0,0,100),
(@PATH,213,1801.15,-4827.95,90.0279,0,0,100),
(@PATH,214,1791.34,-4861.33,88.9552,0,0,100),
(@PATH,215,1787.86,-4875.91,87.5166,0,0,100),
(@PATH,216,1780.76,-4905.48,84.0821,0,0,100),
(@PATH,217,1776.19,-4928.71,81.4626,0,0,100),
(@PATH,218,1774.3,-4938.49,81.4626,0,0,100),
(@PATH,219,1771.16,-4965.22,81.2126,0,0,100),
(@PATH,220,1757.6,-4990.9,80.8461,0,0,100),
(@PATH,221,1748.01,-5004.46,79.9039,0,0,100),
(@PATH,222,1738.94,-5016.73,79.9039,0,0,100),
(@PATH,223,1730.81,-5028.28,80.3151,0,0,100),
(@PATH,224,1720.51,-5053.17,80.4197,0,0,100),
(@PATH,225,1713.61,-5072.05,78.6081,0,0,100),
(@PATH,226,1704.71,-5094.96,75.245,0,0,100),
(@PATH,227,1692.75,-5131.78,73.8809,0,0,100),
(@PATH,228,1689.73,-5148.36,74.0206,0,0,100),
(@PATH,229,1688.35,-5178.24,73.7731,0,0,100),
(@PATH,230,1692.81,-5201.48,74.6409,0,0,100),
(@PATH,231,1690.74,-5274.98,73.6232,0,0,100),
(@PATH,232,1687.05,-5306.95,73.6112,0,0,100),
(@PATH,233,1686.21,-5322.85,73.6114,0,0,100),
(@PATH,234,1688.3,-5343.87,74.2449,0,0,100),
(@PATH,235,1672.16,-5377.38,73.6118,0,0,100),
(@PATH,236,1667.54,-5388.89,73.6137,0,0,100),
(@PATH,237,1664.18,-5398.35,74.3809,0,0,100),
(@PATH,238,1659.56,-5411.51,78.0987,0,0,100),
(@PATH,239,1657.63,-5416.96,80.0233,0,0,100),
(@PATH,240,1654.7,-5425.03,82.2941,0,0,100),
(@PATH,241,1652.04,-5432.05,84.9364,0,0,100),
(@PATH,242,1649.05,-5439.55,87.5085,0,0,100),
(@PATH,243,1646.61,-5446.01,90.2014,0,0,100),
(@PATH,244,1644.44,-5452.14,93.1195,0,0,100),
(@PATH,245,1641.84,-5459.95,95.4057,0,0,100),
(@PATH,246,1639.43,-5466.45,97.7334,0,0,100),
(@PATH,247,1635.2,-5476.15,100.195,0,0,100),
(@PATH,248,1631.56,-5485.27,100.73,0,0,100),
(@PATH,249,1627.96,-5493.81,100.73,0,0,100),
(@PATH,250,1623.74,-5501.82,102.308,0,0,100),
(@PATH,251,1621.54,-5506.67,104.154,0,0,100),
(@PATH,252,1619.31,-5510.5,105.706,0,0,100),
(@PATH,253,1617.2,-5514.39,107.478,0,0,100),
(@PATH,254,1615.11,-5518.38,108.951,0,0,100),
(@PATH,255,1613.27,-5521.97,110.422,0,0,100),
(@PATH,256,1610.31,-5527.82,111.163,0,0,100),
(@PATH,257,1606.59,-5535.3,111.171,0,0,100),
(@PATH,258,1596.95,-5537.16,111.171,0,0,100),
(@PATH,259,1591.5,-5546.99,111.171,0,0,100),
(@PATH,260,1594.64,-5559.12,111.171,0,0,100),
(@PATH,261,1587.05,-5573.4,111.171,0,0,100),
(@PATH,262,1576.47,-5592.38,111.171,0,0,100),
(@PATH,263,1569.09,-5606.81,114.19,5000,0,100);

-- The Defias Traitor -- http://wotlk.openwow.com/npc=467
UPDATE `creature` SET `spawntimesecs` = 30 WHERE `guid` = 90214; 
UPDATE `creature_text` SET `language` = 7 WHERE `entry` = 467 AND `groupid` = 3 AND `id` = 1; 

-- The Defias Traitor SAI
SET @ENTRY := 467;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,155,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Quest 'The Defias Traitor' Taken - Run Script"),
(@ENTRY,0,1,0,40,0,100,0,36,467,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Waypoint 36 Reached - Set Run Off"),
(@ENTRY,0,2,0,40,0,100,0,37,467,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Waypoint 37 Reached - Say Line 1"),
(@ENTRY,0,3,0,40,0,100,0,45,467,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Waypoint 45 Reached - Run Script"),
(@ENTRY,0,4,0,4,0,100,0,0,0,0,0,1,3,0,0,0,0,0,12,0,10,0,0,0,0,0,"The Defias Traitor - On Aggro - Say Line 3"),
(@ENTRY,0,5,0,11,0,100,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Respawn - Set Active Off");

-- Actionlist SAI
SET @ENTRY := 46700;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,64,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Store Targetlist"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Remove Npc Flag Questgiver"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Set Active On"),
(@ENTRY,9,3,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Say Line 0"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,53,1,467,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Start Waypoint");

-- Actionlist SAI
SET @ENTRY := 46701;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,100,100,0,0,66,0,0,0,0,0,0,12,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Set Orientation stored target"),
(@ENTRY,9,1,0,0,0,100,0,100,100,0,0,1,2,0,0,0,0,0,12,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Say Line 2"),
(@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,15,155,0,0,0,0,0,17,0,150,0,0,0,0,0,"The Defias Traitor - On Script - Quest Credit 'The Defias Traitor'"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Despawn In 3000 ms");

UPDATE `creature_template` SET `ScriptName`='npc_the_defias_traitor' WHERE  `entry`=467;


-- Bragor Bloodfist must be the questender for the quest "An Unholy Alliance"
UPDATE `creature_questender` SET `id`=36273 WHERE `id`=2425 AND `quest` IN(6521, 6522);

-- [Q] Eitrigg's Wisdom -- http://wotlk.openwow.com/quest=4941
SET @GOSSIP =2901;
SET @NPC = 3144;
SET @QUEST =4941;
-- Add gossip options for each menu id
DELETE FROM `gossip_menu_option` WHERE `menu_id` BETWEEN @GOSSIP AND @GOSSIP+7;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES 
(@GOSSIP, 0, 0, 'Hello, Eitrigg. I bring news from Blackrock Spire.', 1, 1, @GOSSIP+1, 0, 0, 0, ''),
(@GOSSIP+1, 0, 0, 'There is only one Warchief, Eitrigg!', 1, 1, @GOSSIP+2, 0, 0, 0, ''),
(@GOSSIP+2, 0, 0, 'What do you mean?', 1, 1, @GOSSIP+3, 0, 0, 0, ''),
(@GOSSIP+3, 0, 0, 'Hearthglen? But...', 1, 1, @GOSSIP+4, 0, 0, 0, ''),
(@GOSSIP+4, 0, 0, 'I will take you up on that offer, Eitrigg.', 1, 1, @GOSSIP+5, 0, 0, 0, ''),
(@GOSSIP+5, 0, 0, 'Ah, so that is how they pushed the Dark Iron to the lower parts of the Spire.', 1, 1, @GOSSIP+6, 0, 0, 0, ''),
(@GOSSIP+6, 0, 0, 'Perhaps there exists a way?', 1, 1, @GOSSIP+7, 0, 0, 0, ''),
(@GOSSIP+7, 0, 0, 'As you wish, Eitrigg.', 1, 1, 0, 0, 0, 0, '');
-- Add gossip menus (text values already in db)
DELETE FROM `gossip_menu` WHERE `entry`BETWEEN @GOSSIP+1 AND @GOSSIP+7;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
(@GOSSIP+1, 3574),
(@GOSSIP+2, 3575),
(@GOSSIP+3, 3576),
(@GOSSIP+4, 3577),
(@GOSSIP+5, 3578),
(@GOSSIP+6, 3579),
(@GOSSIP+7, 3580);
-- Add Condtion so gossip only shows when on quest
DELETE FROM `conditions` WHERE `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, @GOSSIP, 0, 0, 9, 4941, 0, 0, 0, '', NULL);
-- Add SAI for quest complete and close of gossip when last option selected
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@NPC;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC,0,0,1,62,0,100,0,@GOSSIP+7,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,'Eitrigg - Select As you wish, Eitrigg. - Close gossip'),
(@NPC,0,1,0,61,0,100,0,0,0,0,0,15,@QUEST,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,'Eitrigg - on link - give credit quest(4941)');

-- [Q] What Is Going On? -- http://wotlk.openwow.com/quest=3982
UPDATE `creature_template` SET `ScriptName` = 'npc_commander_gorshak' WHERE `entry` =9020;

-- Precarious Predicament (4121)
UPDATE creature_template SET gossip_menu_id=30200, AIName='SmartAI' WHERE entry=9080;
DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=30200;
INSERT INTO conditions VALUES (15, 30200, 0, 0, 0, 14, 0, 4122, 0, 0, 1, 0, 0, '', 'First Quest Any state');
INSERT INTO conditions VALUES (15, 30200, 0, 0, 0, 2, 0, 11286, 1, 0, 1, 0, 0, '', 'No Item 11286');
INSERT INTO conditions VALUES (15, 30200, 0, 0, 0, 8, 0, 4121, 0, 0, 1, 0, 0, '', 'Second Quest not rewarded');
DELETE FROM smart_scripts WHERE entryorguid=9080 AND source_type=0;
INSERT INTO smart_scripts VALUES (9080, 0, 0, 1, 62, 0, 100, 0, 30200, 0, 0, 0, 56, 11286, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Add Item');
INSERT INTO smart_scripts VALUES (9080, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Close Gossip');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=14250;
INSERT INTO conditions VALUES (13, 1, 14250, 0, 0, 31, 0, 3, 9520, 0, 0, 0, 0, '', 'Target Grark');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=9520;
DELETE FROM smart_scripts WHERE entryorguid=9520 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(9520*100, 9520*100+1) AND source_type=9;
INSERT INTO smart_scripts VALUES (9520, 0, 0, 1, 19, 0, 100, 0, 4121, 0, 0, 0, 2, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set Faction Hostile');
INSERT INTO smart_scripts VALUES (9520, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Attack Start');
INSERT INTO smart_scripts VALUES (9520, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set Event Phase');
INSERT INTO smart_scripts VALUES (9520, 0, 4, 5, 2, 1, 100, 0, 0, 30, 0, 0, 80, 9520*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On HP - Run Script');
INSERT INTO smart_scripts VALUES (9520, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On HP - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On HP - Enter Evade');
INSERT INTO smart_scripts VALUES (9520, 0, 7, 27, 8, 2, 100, 0, 14250, 0, 0, 0, 1, 2, 4000, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 8, 0, 52, 0, 100, 0, 2, 9520, 0, 0, 53, 0, 9520, 0, 4121, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Text Over - Start WP');
INSERT INTO smart_scripts VALUES (9520, 0, 9, 0, 40, 0, 100, 0, 4, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 10, 11, 40, 0, 100, 0, 11, 0, 0, 0, 54, 30000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - WP Pause');
INSERT INTO smart_scripts VALUES (9520, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 107, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Summon Creature Group');
INSERT INTO smart_scripts VALUES (9520, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 13, 0, 56, 0, 100, 0, 11, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Resumed - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 14, 15, 40, 0, 100, 0, 32, 0, 0, 0, 54, 30000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - WP Pause');
INSERT INTO smart_scripts VALUES (9520, 0, 15, 16, 61, 0, 100, 0, 0, 0, 0, 0, 107, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Summon Creature Group');
INSERT INTO smart_scripts VALUES (9520, 0, 16, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 17, 0, 56, 0, 100, 0, 32, 0, 0, 0, 1, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Resumed - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 18, 19, 40, 0, 100, 0, 59, 0, 0, 0, 54, 40000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - WP Pause');
INSERT INTO smart_scripts VALUES (9520, 0, 19, 20, 61, 0, 100, 0, 0, 0, 0, 0, 107, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Summon Creature Group');
INSERT INTO smart_scripts VALUES (9520, 0, 20, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 21, 0, 56, 0, 100, 0, 59, 0, 0, 0, 1, 9, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Resumed - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 22, 23, 40, 0, 100, 0, 69, 0, 0, 0, 107, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Summon Creature Group');
INSERT INTO smart_scripts VALUES (9520, 0, 23, 24, 61, 0, 100, 0, 0, 0, 0, 0, 1, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 24, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 9520*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Run Script');
INSERT INTO smart_scripts VALUES (9520, 0, 25, 26, 11, 0, 100, 0, 0, 0, 0, 0, 91, 255, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Respawn - Remove Bytes1');
INSERT INTO smart_scripts VALUES (9520, 0, 26, 0, 61, 0, 100, 0, 0, 0, 0, 0, 94, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Respawn - Set Dynflag');
INSERT INTO smart_scripts VALUES (9520, 0, 27, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Set Event Phase');
INSERT INTO smart_scripts VALUES (9520*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Faction');
INSERT INTO smart_scripts VALUES (9520*100, 9, 1, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Event Phase');
INSERT INTO smart_scripts VALUES (9520*100, 9, 2, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Event Phase');
INSERT INTO smart_scripts VALUES (9520*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Faction');
INSERT INTO smart_scripts VALUES (9520*100, 9, 4, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Event Phase');
INSERT INTO smart_scripts VALUES (9520*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Faction');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 0, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, 9539, 15, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 90, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Bytes1');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 2, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, 9539, 15, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 3, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, 9538, 15, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 4, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, 9539, 15, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 37, 0, 0, 0, 0, 0, 19, 9538, 15, 0, 0, 0, 0, 0, 'Script9 - Play Emote');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 6, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, 9539, 15, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 7, 0, 0, 0, 100, 0, 500, 500, 0, 0, 94, 32, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Dynamic Flag');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 255, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Remove Bytes1');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 90, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Bytes1');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 10, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 19, 9539, 15, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 11, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Despawn');
DELETE FROM creature_summon_groups WHERE summonerId=9520;
INSERT INTO creature_summon_groups VALUES (9520, 0, 1, 7027, -7728.03, -1507.43, 132.84, 0.45, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 1, 7027, -7745.39, -1511.42, 131.82, 0.43, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 1, 7027, -7738.19, -1517.31, 132.64, 1.25, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 1, 7027, -7731.36, -1516.09, 133.15, 1.85, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 2, 7027, -8018.37, -1234.22, 135.76, 4.45, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 2, 7027, -8028.86, -1234.06, 134.50, 4.80, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 2, 7043, -8035.70, -1244.65, 133.53, 6.09, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 2, 7043, -8017.37, -1244.61, 134.45, 3.05, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 3, 7042, -7394.30, -1099.77, 278.08, 3.23, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 3, 7042, -7394.24, -1106.84, 278.08, 3.04, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 3, 7042, -7399.23, -1111.12, 278.08, 2.07, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 4, 9539, -7184.77, -1078.76, 240.76, 2.87, 3, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 4, 9538, -7189.04, -1082.20, 240.76, 2.24, 3, 30000);
DELETE FROM waypoints WHERE entry=9520;
INSERT INTO waypoints VALUES (9520, 1, -7694.87, -1446.16, 139.788, 'Grark Lorkrub'),(9520, 2, -7693.1, -1447.1, 140.936, 'Grark Lorkrub'),(9520, 3, -7670.1, -1458.41, 140.742, 'Grark Lorkrub'),(9520, 4, -7675.08, -1464.91, 140.743, 'Grark Lorkrub'),(9520, 5, -7682.24, -1470.96, 140.732, 'Grark Lorkrub'),(9520, 6, -7695.94, -1473.56, 140.794, 'Grark Lorkrub'),(9520, 7, -7708.68, -1472.19, 140.795, 'Grark Lorkrub'),(9520, 8, -7711.3, -1470.41, 140.792, 'Grark Lorkrub'),(9520, 9, -7718.34, -1483.8, 140.127, 'Grark Lorkrub'),(9520, 10, -7726.4, -1499.25, 133.572, 'Grark Lorkrub'),(9520, 11, -7738.77, -1502.96, 131.835, 'Grark Lorkrub'),(9520, 12, -7752.84, -1497.24, 133.278, 'Grark Lorkrub'),(9520, 13, -7768.01, -1491.07, 133.465, 'Grark Lorkrub'),(9520, 14, -7788.9, -1488.91, 133.549, 'Grark Lorkrub'),(9520, 15, -7819.76, -1484.64, 133.606, 'Grark Lorkrub'),(9520, 16, -7828.02, -1480.21, 137.011, 'Grark Lorkrub'),
(9520, 17, -7839.92, -1470.88, 137.256, 'Grark Lorkrub'),(9520, 18, -7849.8, -1470.22, 141.082, 'Grark Lorkrub'),(9520, 19, -7855.2, -1476.25, 143.78, 'Grark Lorkrub'),(9520, 20, -7868.73, -1461.69, 144.758, 'Grark Lorkrub'),(9520, 21, -7888.35, -1431.28, 145.097, 'Grark Lorkrub'),(9520, 22, -7900.4, -1426.93, 150.278, 'Grark Lorkrub'),(9520, 23, -7907.22, -1425.34, 148.423, 'Grark Lorkrub'),(9520, 24, -7922.01, -1421.89, 139.826, 'Grark Lorkrub'),(9520, 25, -7939.55, -1410.33, 134.285, 'Grark Lorkrub'),(9520, 26, -7953.69, -1383.53, 133.842, 'Grark Lorkrub'),(9520, 27, -7970.54, -1358.25, 132.992, 'Grark Lorkrub'),(9520, 28, -7994.28, -1337.43, 133.873, 'Grark Lorkrub'),(9520, 29, -8003.57, -1325.42, 133.722, 'Grark Lorkrub'),(9520, 30, -8006.93, -1297.62, 132.471, 'Grark Lorkrub'),(9520, 31, -8010.01, -1272.19, 133.315, 'Grark Lorkrub'),(9520, 32, -8022.81, -1248.63, 133.66, 'Grark Lorkrub'),
(9520, 33, -8024.27, -1233.51, 135.164, 'Grark Lorkrub'),(9520, 34, -8016.06, -1199.49, 145.809, 'Grark Lorkrub'),(9520, 35, -7998.59, -1162.87, 156.517, 'Grark Lorkrub'),(9520, 36, -7971.62, -1137.03, 169.253, 'Grark Lorkrub'),(9520, 37, -7947.76, -1131.43, 179.178, 'Grark Lorkrub'),(9520, 38, -7916.3, -1132.39, 189.363, 'Grark Lorkrub'),(9520, 39, -7882.57, -1132.1, 198.428, 'Grark Lorkrub'),(9520, 40, -7846.45, -1132.55, 207.448, 'Grark Lorkrub'),(9520, 41, -7817.44, -1129.96, 213.355, 'Grark Lorkrub'),(9520, 42, -7807.09, -1128.75, 214.848, 'Grark Lorkrub'),(9520, 43, -7751.64, -1121.82, 215.085, 'Grark Lorkrub'),(9520, 44, -7743.69, -1097.45, 216.133, 'Grark Lorkrub'),(9520, 45, -7731.51, -1088.48, 217.094, 'Grark Lorkrub'),(9520, 46, -7696.8, -1084.28, 217.778, 'Grark Lorkrub'),(9520, 47, -7677.24, -1058.08, 220.442, 'Grark Lorkrub'),(9520, 48, -7651.64, -1034.11, 228.715, 'Grark Lorkrub'),
(9520, 49, -7620.58, -1020.57, 237.609, 'Grark Lorkrub'),(9520, 50, -7593.13, -1015.04, 244.696, 'Grark Lorkrub'),(9520, 51, -7564.18, -1017.93, 251.451, 'Grark Lorkrub'),(9520, 52, -7541.23, -1031.78, 256.662, 'Grark Lorkrub'),(9520, 53, -7513.8, -1051.44, 262.202, 'Grark Lorkrub'),(9520, 54, -7496.54, -1073.58, 264.806, 'Grark Lorkrub'),(9520, 55, -7476.06, -1068.61, 264.993, 'Grark Lorkrub'),(9520, 56, -7451.15, -1062.45, 268.264, 'Grark Lorkrub'),(9520, 57, -7431.29, -1061.54, 272.873, 'Grark Lorkrub'),(9520, 58, -7415.51, -1073.52, 276.363, 'Grark Lorkrub'),(9520, 59, -7408.22, -1101.78, 278.077, 'Grark Lorkrub'),(9520, 60, -7383.85, -1099.22, 278.076, 'Grark Lorkrub'),(9520, 61, -7359.44, -1101.27, 277.84, 'Grark Lorkrub'),(9520, 62, -7335.16, -1089.9, 277.07, 'Grark Lorkrub'),(9520, 63, -7310.58, -1070.2, 277.07, 'Grark Lorkrub'),
(9520, 64, -7296.4, -1064.74, 277.027, 'Grark Lorkrub'),(9520, 65, -7274.71, -1073.46, 269.059, 'Grark Lorkrub'),(9520, 66, -7263.12, -1072.97, 265.053, 'Grark Lorkrub'),(9520, 67, -7239.82, -1072.43, 251.404, 'Grark Lorkrub'),(9520, 68, -7214.73, -1071.87, 243.273, 'Grark Lorkrub'),(9520, 69, -7190.93, -1078.66, 240.987, 'Grark Lorkrub');

DELETE FROM creature_text WHERE entry IN(9520, 9539, 9538);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(9520, 0, 0, 'You have come to play? Then let us play!', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 1, 0, 'Grark Lorkrub submits.', 16, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 2, 0, 'I know the way, insect. There is no need to prod me as if I were cattle.', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 3, 0, 'Surely you do not think that you will get away with this incursion. They will come for me and you shall pay for your insolence.', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 4, 0, 'RUN THEM THROUGH BROTHERS!', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 5, 0, 'I doubt you will be so lucky the next time you encounter my brethren.', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 6, 0, 'They come for you, fool!', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 7, 0, 'What do you think you accomplish from this, fool? Even now, the Blackrock armies make preparations to destroy your world.', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 8, 0, 'On darkest wing they fly. Prepare to meet your end!', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 9, 0, 'The worst is yet to come!', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 10, 0, 'Time to make your final stand, insect.', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9538, 0, 0, 'High Executioner Nuzrak raises his massive axe over Grark.', 16, 0, 100, 0, 0, 0, 'High Executioner Nuzrak'),
(9539, 0, 0, 'Kneel, Grark.', 12, 0, 100, 0, 0, 0, 'Shadow of Lexlort'),
(9539, 1, 0, 'Grark Lorkrub, you have been charged and found guilty of treason against the Horde. How you plead is unimportant. High Executioner Nuzrak, step forward.', 12, 0, 100, 0, 0, 0, 'Shadow of Lexlort'),
(9539, 2, 0, 'Shadow of Lexlort raises his hand and then lowers it.', 16, 0, 100, 0, 0, 0, 'Shadow of Lexlort'),
(9539, 3, 0, 'End him...', 12, 0, 100, 0, 0, 0, 'Shadow of Lexlort'),
(9539, 4, 0, 'You, soldier, report back to Kargath at once!', 12, 0, 100, 0, 0, 0, 'Shadow of Lexlort');
DELETE FROM gossip_menu_option WHERE menu_id=30200;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES (30200, 0, 0, 'I need another Thorium Shackles.', 1, 1, 0, 0, 0, 0, '');

-- Fix for quest chain for The Monogrammed Sash -> The Captain's Cutlass -> Facing Negolash
DELETE FROM `quest_template_addon` WHERE `ID` IN (8553, 8554);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
(8553,0,0,0,8552,0,0,0,0,0,0,0,0,0,0,0,0),
(8554,0,0,0,8553,0,0,0,0,0,0,0,0,0,0,0,0);
