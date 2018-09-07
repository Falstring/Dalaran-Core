-- Ango'rosh Shaman SAI
SET @ENTRY := 18118;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,1000,1200,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,"Ango'rosh Shaman - In Combat - Cast 'Lightning Bolt'"),
(@ENTRY,0,1,0,0,0,100,1,18000,25000,0,0,11,32062,1,0,0,0,0,1,0,0,0,0,0,0,0,"Ango'rosh Shaman - In Combat - Cast 'Fire Nova Totem' (No Repeat)"),
(@ENTRY,0,2,0,2,0,100,0,0,50,15000,20000,11,23381,1,0,0,0,0,1,0,0,0,0,0,0,0,"Ango'rosh Shaman - Between 0-50% Health - Cast 'Healing Touch'"),
(@ENTRY,0,3,0,2,0,100,0,0,75,10000,15000,11,6742,1,0,0,0,0,1,0,0,0,0,0,0,0,"Ango'rosh Shaman - Between 0-75% Health - Cast 'Bloodlust'"),
(@ENTRY,0,4,0,74,0,100,0,0,50,15000,20000,11,23381,1,0,0,0,0,11,0,15,0,0,0,0,0,"Ango'rosh Shaman - On Friendly Between 0-50% Health - Cast 'Healing Touch'"),
(@ENTRY,0,5,0,74,0,100,0,0,75,10000,15000,11,6742,1,0,0,0,0,11,0,15,0,0,0,0,0,"Ango'rosh Shaman - On Friendly Between 0-75% Health - Cast 'Bloodlust'");


-- Ango'rosh Ogre SAI
SET @ENTRY := 18117;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,13,0,100,0,8000,10000,0,0,11,11978,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ango'rosh Ogre - On Victim Casting - Cast 'Kick'"),
(@ENTRY,0,1,2,2,0,100,1,0,25,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ango'rosh Ogre - Between 0-25% Health - Cast 'Enrage' (No Repeat)"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ango'rosh Ogre - Between 0-25% Health - Say Line 0 (No Repeat)"),
(@ENTRY,0,3,0,4,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ango'rosh Ogre - On Aggro - Say Line 1");

DELETE FROM `creature_text` WHERE `Entry` = 18117;
INSERT INTO `creature_text` (`Entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(18117,0,0,'%s becomes enraged!',16,0,100,0,0,0,0,0,'Ango\'rosh Ogre'),
(18117,1,0,' You take no mushroom!',12,0,100,0,4000,0,0,0,'Ango\'rosh Ogre');

-- Boss Grog'ak SAI
SET @ENTRY := 18159;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,6000,8000,11,35473,0,0,0,0,0,2,0,0,0,0,0,0,0,"Boss Grog'ak - Within 0-5 Range - Cast 'Forceful Cleave'"),
(@ENTRY,0,1,0,0,0,100,0,3000,3000,15000,20000,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,"Boss Grog'ak - In Combat - Cast 'Demoralizing Shout'");

-- Path for Boss Grog'ak
SET @NPC := 64956;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `position_x`=819.3, `position_y`=7737.21, `position_z`=23.761, `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH,1,819.3,7737.21,23.761,0,30000,0,0,100,0),
(@PATH,2,783.834,7732.42,23.2434,0,0,0,0,100,0),
(@PATH,3,768.138,7724.52,22.0622,0,30000,0,0,100,0);

-- Remove exp from imps
UPDATE `creature_template` SET `flags_extra` = 64 WHERE `entry` = 12922; 

-- Warmaul Warlock SAI
SET @ENTRY := 18037;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,11,11939,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warmaul Warlock - On Reset - Cast 'Summon Imp'"),
(@ENTRY,0,1,0,0,0,100,0,0,0,1000,1200,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,"Warmaul Warlock - In Combat - Cast 'Shadow Bolt'");

-- Warmaul Brute SAI
SET @ENTRY := 18065;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,10,6000,8000,11,10966,0,0,0,0,0,2,0,0,0,0,0,0,0,"Warmaul Brute - Within 0-10 Range - Cast 'Uppercut'");

-- Screeching Spirit SAI
SET @ENTRY := 21200;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,17327,0,0,0,0,0,1,0,0,0,0,0,0,0,"Screeching Spirit - On Respawn - Cast 'Spirit Particles' (No Repeat)"),
(@ENTRY,0,4,0,9,0,100,0,0,40,1000,1200,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,"Screeching Spirit - Within 0-40 Range - Cast 'Shadow Bolt'"),
(@ENTRY,0,11,0,0,0,100,0,10000,15000,10000,15000,11,22678,1,0,0,0,0,6,0,0,0,0,0,0,0,"Screeching Spirit - In Combat - Cast 'Fear'"),
(@ENTRY,0,12,0,2,0,100,0,0,30,22000,32000,11,16588,1,0,0,0,0,1,0,0,0,0,0,0,0,"Screeching Spirit - Between 0-30% Health - Cast 'Dark Mending'");

-- Spirit Raven SAI
SET @ENTRY := 21324;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,17327,0,0,0,0,0,1,0,0,0,0,0,0,0,"Spirit Raven - On Respawn - Cast 'Spirit Particles' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,1000,3000,12000,15000,11,38021,0,0,0,0,0,1,0,0,0,0,0,0,0,"Spirit Raven - In Combat - Cast 'Terrifying Screech'"),
(@ENTRY,0,2,0,2,0,100,0,0,30,5000,8000,11,38254,33,0,0,0,0,2,0,0,0,0,0,0,0,"Spirit Raven - Between 0-30% Health - Cast 'Festering Wound'");

-- Deathtalon Spirit SAI
SET @ENTRY := 21198;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,17327,0,0,0,0,0,1,0,0,0,0,0,0,0,"Deathtalon Spirit - On Respawn - Cast 'Spirit Particles'"),
(@ENTRY,0,1,0,9,0,100,0,0,5,7000,9000,11,36093,0,0,0,0,0,2,0,0,0,0,0,0,0,"Deathtalon Spirit - Within 0-5 Range - Cast 'Ghost Strike'"),
(@ENTRY,0,2,0,2,0,100,0,0,30,5000,8000,11,38254,33,0,0,0,0,2,0,0,0,0,0,0,0,"Deathtalon Spirit - Between 0-30% Health - Cast 'Festering Wound'");

-- Deathforge Summoner SAI
SET @ENTRY := 20872;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,1000,1200,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,"Deathforge Summoner - In Combat - Cast 'Shadow Bolt'"),
(@ENTRY,0,1,0,0,0,100,0,7000,9000,17000,24000,11,37628,1,0,0,0,0,2,0,0,0,0,0,0,0,"Deathforge Summoner - In Combat - Cast 'Fel Immolate'");