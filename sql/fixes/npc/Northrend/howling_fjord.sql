-- Frostwing Chimaera
UPDATE creature SET spawndist=15 WHERE id=24673;

-- Big Roy
SET @NPC := 203496;
SET @PATH := @NPC * 10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
DELETE FROM `creature` WHERE `guid`=@NPC;

-- Necrolord SAI
SET @ENTRY := 24014;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Necrolord - On Aggro - Say Line 0"),
(@ENTRY,0,1,0,0,0,100,0,1000,1000,1000,1000,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,"Necrolord - In Combat - Cast 'Shadow Bolt'"),
(@ENTRY,0,2,0,0,0,100,0,5000,7000,10000,15000,11,17173,1,0,0,0,0,2,0,0,0,0,0,0,0,"Necrolord - In Combat - Cast 'Drain Life'"),
(@ENTRY,0,3,0,0,0,100,0,500,500,15000,20000,11,18267,33,0,0,0,0,2,0,0,0,0,0,0,0,"Necrolord - In Combat - Cast 'Curse of Weakness'");

-- Fearsome Horror SAI
SET @ENTRY := 24073;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,"Fearsome Horror - On Just Summoned - Start Attacking"),
(@ENTRY,0,1,0,9,0,100,0,0,5,8000,10000,11,49861,0,0,0,0,0,2,0,0,0,0,0,0,0,"Fearsome Horror - Within 0-5 Range - Cast 'Infected Bite'");

DELETE FROM `creature_text` WHERE `Entry` = 24014;
INSERT INTO `creature_text` (`Entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(24014,0,0,'You too will serve the Lich King.',12,0,100,0,0,0,0,0,'Necrolord'),
(24014,0,1,'There\'s always room for one more.',12,0,100,0,0,0,0,0,'Necrolord'),
(24014,0,2,'Your life for the Lich King!',12,0,100,0,0,0,0,0,'Necrolord'),
(24014,0,3,'So eager to die are we?',12,0,100,0,0,0,0,0,'Necrolord'),
(24014,0,4,'Hello, little one. Come to play?',12,0,100,0,0,0,0,0,'Necrolord'),
(24014,0,5,'I have so many wonders to show you.',12,0,100,0,0,0,0,0,'Necrolord'),
(24014,0,6,'Excellent, another sacrificial lamb.',12,0,100,0,0,0,0,0,'Necrolord'),
(24014,0,7,'There\'s always room for one more.',12,0,100,0,0,0,0,0,'Necrolord'),
(24014,0,8,'Plucked ripe off the vine.',12,0,100,0,0,0,0,0,'Necrolord');

-- Gjalerbron Sleep-Watcher SAI
SET @ENTRY := 23989;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gjalerbron Sleep-Watcher - On Aggro - Say Line 0 (No Repeat)"),
(@ENTRY,0,1,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,"Gjalerbron Sleep-Watcher - On Just Summoned - Start Attacking"),
(@ENTRY,0,2,0,0,0,100,0,8000,10000,15000,20000,11,15970,0,0,0,0,0,2,0,0,0,0,0,0,0,"Gjalerbron Sleep-Watcher - In Combat - Cast 'Sleep'");

-- Gjalerbron Rune-Caster SAI
SET @ENTRY := 23990;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gjalerbron Rune-Caster - On Aggro - Say Line 0 (No Repeat)"),
(@ENTRY,0,1,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,"Gjalerbron Rune-Caster - On Just Summoned - Start Attacking"),
(@ENTRY,0,2,0,0,0,100,0,0,0,5000,5000,11,43453,33,0,0,0,0,1,0,0,0,0,0,0,0,"Gjalerbron Rune-Caster - In Combat - Cast 'Rune Ward'"),
(@ENTRY,0,3,0,0,0,100,0,500,500,1000,1000,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,"Gjalerbron Rune-Caster - In Combat - Cast 'Frostbolt'"),
(@ENTRY,0,4,0,0,0,100,0,6000,8000,10000,12000,11,34787,1,0,0,0,0,2,0,0,0,0,0,0,0,"Gjalerbron Rune-Caster - In Combat - Cast 'Freezing Circle'");

-- Gjalerbron Warrior SAI
SET @ENTRY := 23991;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gjalerbron Warrior - On Aggro - Say Line 0 (No Repeat)"),
(@ENTRY,0,1,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,"Gjalerbron Warrior - On Just Summoned - Start Attacking"),
(@ENTRY,0,2,0,0,0,100,0,4000,5000,15000,20000,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gjalerbron Warrior - In Combat - Cast 'Demoralizing Shout'"),
(@ENTRY,0,3,0,9,0,100,0,0,10,8000,10000,11,10966,0,0,0,0,0,2,0,0,0,0,0,0,0,"Gjalerbron Warrior - Within 0-10 Range - Cast 'Uppercut'");

-- Sepulchral Overseer SAI
SET @ENTRY := 23993;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,1000,60000,60000,11,43556,33,0,0,0,0,2,0,0,0,0,0,0,0,"Sepulchral Overseer - In Combat - Cast 'Curse of the Sepulcher'"),
(@ENTRY,0,1,0,0,0,100,0,1500,1500,15000,20000,11,22744,1,0,0,0,0,2,0,0,0,0,0,0,0,"Sepulchral Overseer - In Combat - Cast 'Chains of Ice'"),
(@ENTRY,0,2,0,0,0,100,0,4000,5000,8000,10000,11,12737,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sepulchral Overseer - In Combat - Cast 'Frostbolt'");

DELETE FROM `creature_text` WHERE `Entry` IN (23989, 23990, 23991);
INSERT INTO `creature_text` (`Entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(23989,0,0,'I\'ll eat your heart!',12,0,100,0,0,13542,0,0,'Gjalerbron Sleep-Watcher'),
(23989,0,1,'YAAARRRGH!',12,0,100,0,0,0,0,0,'Gjalerbron Sleep-Watcher'),
(23989,0,2,'I will take pleasure in gutting you!',12,0,100,0,0,13533,0,0,'Gjalerbron Sleep-Watcher'),
(23989,0,3,'There will be no everlasting life for you!',12,0,100,0,0,0,0,0,'Gjalerbron Sleep-Watcher'),
(23989,0,4,'Sniveling pig!',12,0,100,0,0,0,0,0,'Gjalerbron Sleep-Watcher'),
(23989,0,5,'Haraak foln!',12,0,100,0,0,0,0,0,'Gjalerbron Sleep-Watcher'),
(23990,0,0,'I spit on you!',12,0,100,0,0,13538,0,0,'Gjalerbron Rune-Caster'),
(23990,0,1,'YAAARRRGH!',12,0,100,0,0,0,0,0,'Gjalerbron Rune-Caster'),
(23990,0,2,'Look what\'s come to play.',12,0,100,0,0,0,0,0,'Gjalerbron Rune-Caster'),
(23990,0,3,'Your entrails will make a fine necklace.',12,0,100,0,0,13535,0,0,'Gjalerbron Rune-Caster'),
(23991,0,0,'I will feed you to the dogs!',12,0,100,0,0,13534,0,0,'Gjalerbron Warrior'),
(23991,0,1,'I\'ll eat your heart!',12,0,100,0,0,13542,0,0,'Gjalerbron Warrior'),
(23991,0,2,'Look what\'s come to play.',12,0,100,0,0,0,0,0,'Gjalerbron Warrior'),
(23991,0,3,'My life for Ymiron!',12,0,100,0,0,0,0,0,'Gjalerbron Warrior'),
(23991,0,4,'I spit on you!',12,0,100,0,0,13538,0,0,'Gjalerbron Warrior'),
(23991,0,5,'You tiny creatures disgust me!',12,0,100,0,0,0,0,0,'Gjalerbron Warrior'),
(23991,0,6,'Your entrails will make a fine necklace.',12,0,100,0,0,13535,0,0,'Gjalerbron Warrior'),
(23991,0,7,'YAAARRRGH!',12,0,100,0,0,0,0,0,'Gjalerbron Warrior'),
(23991,0,8,'For Ymiron!',12,0,100,0,0,0,0,0,'Gjalerbron Warrior');

-- North Fleet Sailor SAI
SET @ENTRY := 23866;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,10000,10000,10000,10000,49,0,0,0,0,0,0,19,23865,10,0,0,0,0,0,"North Fleet Sailor - Out of Combat - Start Attacking"),
(@ENTRY,0,1,0,9,0,100,0,0,5,4000,5000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,"North Fleet Sailor - Within 0-5 Range - Cast 'Cleave'"),
(@ENTRY,0,2,0,9,0,100,0,0,5,6000,10000,11,49863,0,0,0,0,0,2,0,0,0,0,0,0,0,"North Fleet Sailor - Within 0-5 Range - Cast 'Shield Slam'");

-- North Fleet Medic SAI
SET @ENTRY := 23794;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,500,500,11,9734,64,0,0,0,0,2,0,0,0,0,0,0,0,"North Fleet Medic - In Combat - Cast 'Holy Smite'"),
(@ENTRY,0,1,0,2,0,100,0,0,75,8000,9000,11,11640,33,0,0,0,0,1,0,0,0,0,0,0,0,"North Fleet Medic - Between 0-75% Health - Cast 'Renew'"),
(@ENTRY,0,2,0,74,0,100,0,0,75,8000,9000,11,11640,33,0,0,0,0,11,0,15,0,0,0,0,0,"North Fleet Medic - On Friendly Between 0-75% Health - Cast 'Renew'");

-- North Fleet Marksman SAI
SET @ENTRY := 23946;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,5,40,15000,20000,11,38370,1,0,0,0,0,2,0,0,0,0,0,0,0,"North Fleet Marksman - Within 5-40 Range - Cast 'Aimed Shot'"),
(@ENTRY,0,1,0,9,0,100,0,5,30,2000,2200,11,15547,64,0,0,0,0,2,0,0,0,0,0,0,0,"North Fleet Marksman - Within 5-30 Range - Cast 'Shoot'"),
(@ENTRY,0,2,0,0,0,100,0,8000,10000,25000,30000,11,30933,1,0,0,0,0,2,0,0,0,0,0,0,0,"North Fleet Marksman - In Combat - Cast 'Volley'");