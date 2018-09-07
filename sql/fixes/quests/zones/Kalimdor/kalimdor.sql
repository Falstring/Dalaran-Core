-- Hunting for Ectoplasm - http://www.wowhead.com/quest=8924/hunting-for-ectoplasm
-- Ectoplasmic Distiller SAI
SET @ENTRY := 181057;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,1,0,100,0,1000,1000,1000,1000,75,27420,0,0,0,0,0,17,0,20,0,0,0,0,0,"Ectoplasmic Distiller - Out of Combat - Add Aura 'Ectoplasmic Distiller'");

DELETE FROM `conditions` WHERE `ConditionValue1`=27420;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(1, 8538, 21935, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Stable Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
(1, 8539, 21935, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Stable Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
(1, 8540, 21935, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Stable Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
(1, 8541, 21935, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Stable Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
(1, 8542, 21935, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Stable Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
-- 
(1, 7523, 21936, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Frozen Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
(1, 7524, 21936, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Frozen Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
-- 
(1, 12178, 21937, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Scorched Ectoplasm - only lootable if player has aura Ectoplasmic Distiller'),
(1, 12179, 21937, 0, 0, 1, 0, 27420, 0, 0, 0, 0, 0, '', 'Scorched Ectoplasm - only lootable if player has aura Ectoplasmic Distiller');

-- [Q] Report to Orgnil - http://www.wowhead.com/quest=823/report-to-orgnil
-- Orgnil Soulscar SAI
SET @ENTRY := 3142;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,806,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Orgnil Soulscar - On Quest 'Dark Storms' Finished - Say Line 0"),
(@ENTRY,0,1,0,20,0,100,0,823,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgnil Soulscar - On Quest 'Report to Orgnil' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 314200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2");

DELETE FROM `creature_text` WHERE `entry`=3142 AND `groupid` IN (1, 2);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3142, 1, 0, '%s listens to $N report...', 16, 0, 100, 0, 0, 0, 'Orgnil Soulscar'),
(3142, 2, 0, 'What?? The Burning Blade is spreading! We must investigate!', 12, 0, 100, 0, 0, 0, 'Orgnil Soulscar');

-- [Q] The Tear of the Moons - http://www.wowhead.com/quest=857/the-tear-of-the-moons
-- Feegly the Exiled SAI
SET @ENTRY := 3421;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,0,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Feegly the Exiled - On Quest Finished - Run Script"),
(@ENTRY,0,1,0,11,0,100,0,0,0,0,0,3,3421,0,0,0,0,0,1,0,0,0,0,0,0,0,"Feegly the Exiled - On Respawn - Morph To Creature Feegly the Exiled");

-- Actionlist SAI
SET @ENTRY := 342100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 4"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.13708,"On Script - Set Orientation 5,13708"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,4,0,0,0,100,0,3000,3000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,5,0,0,0,100,0,3000,3000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,6,0,0,0,100,0,2000,2000,0,0,3,724,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Morph To Creature Burly Rockjaw Trogg"),
(@ENTRY,9,7,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,-4217.93,-2343.5,91.6918,4.6415,"On Script - Move To Position"),
(@ENTRY,9,8,0,0,0,100,0,2000,2000,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Kill Target");

DELETE FROM `creature_text` WHERE `entry`=3421;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3421, 0, 0, 'The power of the Tear of the Moons is mine! Mine I say!', 14, 0, 100, 5, 0, 0, 'Feegly the Exiled'),
(3421, 1, 0, '%s begins to rub the Tear of the Moons.', 16, 0, 100, 0, 0, 0, 'Feegly the Exiled'),
(3421, 2, 0, 'Power! Glorious power!', 12, 0, 100, 15, 0, 0, 'Feegly the Exiled'),
(3421, 3, 0, '%s begins to make strange grunting noises. The Tear of the Moons drops to the ground and shatters.', 16, 0, 100, 0, 0, 0, 'Feegly the Exiled');
UPDATE `creature` SET position_x = -4218.656250, position_y = -2339.575684, position_z = 91.730965, orientation = 1.864294, spawntimesecs = 60 WHERE guid = 14138;

-- [Q] Zanzil's Secret - http://www.wowhead.com/quest=621/zanzils-secret
-- Crank Fizzlebub SAI
SET @ENTRY := 2498;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,621,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Crank Fizzlebub - On Quest 'Zanzil's Secret' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 249800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=2498;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2498, 0, 0, 'Thank you, $N.', 12, 0, 100, 0, 0, 0, 'Crank Fizzlebub'),
(2498, 1, 0, 'I\'m sure I can find a use for this mixture...', 12, 0, 100, 0, 0, 0, 'Crank Fizzlebub');

-- [Q] Message in a Bottle - http://www.wowhead.com/quest=630/message-in-a-bottle
-- Princess Poobah SAI
SET @ENTRY := 2634;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,630,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Princess Poobah - On Quest 'Message in a Bottle' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 263400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,5,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 3"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=2634;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2634, 0, 0, 'Thank you again for your aid. May the wind always be at your back during your travels.', 12, 0, 100, 0, 0, 0, 'Princess Poobah');

-- [Q] The Broken Sigil - http://www.wowhead.com/quest=640/the-broken-sigil
-- Tor'gan SAI
SET @ENTRY := 2706;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,10,0,100,0,0,8,5000,5000,39,30,1,0,0,0,0,1,0,0,0,0,0,0,0,"Tor'gan - Within 0-8 Range Out of Combat LoS - Call For Help"),
(@ENTRY,0,1,0,20,0,100,0,640,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tor'gan - On Quest 'Das zerbrochene Siegel' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 270600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,5,15,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 15"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=2706;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2706, 0, 0, 'Easier than I expected... the sigil of Thoradin is whole, once again.', 12, 0, 100, 0, 0, 0, 'Tor\'gan');

-- [Q] Sunken Treasure - http://www.wowhead.com/quest=670/sunken-treasure
-- Shakes O'Breen SAI
SET @ENTRY := 2610;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=5;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,5,0,20,0,100,0,670,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shakes O'Breen - On Quest 'Sunken Treasure' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 261001;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 2");

DELETE FROM `creature_text` WHERE `entry`=2610 AND `groupid`=2;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2610, 2, 0, 'Wait, $N!!! It looks like we\'re going to need some help here...', 12, 0, 100, 0, 0, 0, 'Shakes');

-- [Q] Guile of the Raptor - http://www.wowhead.com/quest=702/guile-of-the-raptor
-- Gor'mul SAI
SET @ENTRY := 2792;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1500,4900,39000,46000,11,4153,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gor'mul - In Combat - Cast 'Guile of the Raptor'"),
(@ENTRY,0,1,0,20,0,100,0,702,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gor'mul - On Quest 'Guile of the Raptor' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 279200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,4153,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Guile of the Raptor'"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,5,15,0,0,0,0,0,0,0,0,0,0,0,0,0,"On Script - Play Emote 15"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2");

DELETE FROM `creature_text` WHERE `entry`=2792;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2792, 0, 0, '%s watches as his blood begins to stir, and the guile of the raptor slips through him.', 16, 0, 100, 0, 0, 0, 'Gor\'mul'),
(2792, 1, 0, 'What is this power that flows through me? Is this the power of shamanism that Tor\'gan spoke of...?', 12, 0, 100, 0, 0, 0, 'Gor\'mul'),
(2792, 2, 0, 'Amazing! I feel... renewed. My strength returns!', 12, 0, 100, 0, 0, 0, 'Gor\'mul');

-- Mull Thunderhorn Questrewardscripts - [H] - http://www.wowhead.com/npc=2948/mull-thunderhorn
SET @ENTRY := 2948;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,748,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mull Thunderhorn - On Quest 'Poison Water' Finished - Run Script"),
(@ENTRY,0,1,0,20,0,100,0,756,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mull Thunderhorn - On Quest 'Thunderhorn Totem' Finished - Run Script"),
(@ENTRY,0,2,0,20,0,100,0,759,0,0,0,80,@ENTRY*100+02,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mull Thunderhorn - On Quest 'Thunderhorn TotemWildmane Totem' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 294800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,4983,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mull Thunderhorn - On Script - Cast 'Create Cleansing Totem'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mull Thunderhorn - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,8000,8000,0,0,1,1,0,0,0,0,0,21,50,0,0,0,0,0,0,"Mull Thunderhorn - On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=2948;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2948, 0, 0, '%s begins a rite of creation...', 16, 0, 100, 0, 0, 0, 'Mull Thunderhorn'),
(2948, 1, 0, 'I have created the totem. You, $N, must cleanse the well.', 12, 0, 100, 0, 0, 0, 'Mull Thunderhorn'),
(2948, 2, 0, '%s creates a new totem...', 16, 0, 100, 0, 0, 0, 'Mull Thunderhorn'),
(2948, 3, 0, 'The totem is made, $N.', 12, 0, 100, 0, 0, 0, 'Mull Thunderhorn'),
(2948, 4, 0, '%s transforms the items $N gave him into a totem of cleansing...', 16, 0, 100, 0, 0, 0, 'Mull Thunderhorn'),
(2948, 5, 0, 'The totem is made. The well may now be cleansed.', 12, 0, 100, 0, 0, 0, 'Mull Thunderhorn');

-- 2
-- Actionlist SAI
SET @ENTRY := 294801;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,4983,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Create Cleansing Totem'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,2,0,0,0,100,0,8000,8000,0,0,1,3,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 3");

-- 3
-- Actionlist SAI
SET @ENTRY := 294802;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,4983,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Create Cleansing Totem'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 4"),
(@ENTRY,9,2,0,0,0,100,0,8000,8000,0,0,1,5,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 5");

-- [Q] The Elder Crone - http://www.wowhead.com/quest=1063/deprecated-the-elder-crone
-- Magatha Grimtotem SAI
SET @ENTRY := 4046;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1063,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Magatha Grimtotem - On Quest 'The Elder Crone' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 404600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=4046;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4046, 0, 0, '%s listens to $N\'s plea.', 16, 0, 100, 0, 0, 0, 'Magatha Grimtotem'),
(4046, 1, 0, 'You were right to come. My wisdom will be yours.', 12, 0, 100, 0, 0, 0, 'Magatha Grimtotem');

-- [Q] Blood of Innocents - http://www.wowhead.com/quest=1066/deprecated-blood-of-innocents
-- Apothecary Lydon SAI
SET @ENTRY := 2216;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1066,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Apothecary Lydon - On Quest 'Blood of Innocents' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 221600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=2216;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(2216, 0, 0, '%s creates his toxin...', 16, 0, 100, 0, 0, 0, 'Apothecary Lydon'),
(2216, 1, 0, 'There we are, $N. The toxin is ready.', 12, 0, 100, 0, 0, 0, 'Apothecary Lydon');

-- [Q] Return to Thunder Bluff - http://www.wowhead.com/quest=1067/deprecated-return-to-thunder-bluff
-- Apothecary Zamah SAI
SET @ENTRY := 3419;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1067,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Apothecary Zamah - On Quest 'Return to Thunder Bluff' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 341900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=3419;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3419, 0, 0, '%s fills a container with the toxin.', 16, 0, 100, 0, 0, 0, 'Apothecary Zamah'),
(3419, 1, 0, 'The toxin is ready, $N.', 12, 0, 100, 0, 0, 0, 'Apothecary Zamah');

-- [Q] Rumors for Kravel + Parts for Kravel
-- Kravel Koalbeard SAI
SET @ENTRY := 4452;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1117,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Quest 'Rumors for Kravel' Finished - Run Script"),
(@ENTRY,0,1,0,20,0,100,0,1112,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kravel Koalbeard - On Quest 'Parts for Kravel' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 445201;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,50,19878,0,0,0,0,0,8,0,0,0,-6232.038574,-3854.885986,-58.749821,3.866077,"On Script - Summon Gameobject 'Parts Crate'"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 4");

DELETE FROM `creature_text` WHERE `entry`=4452 AND `groupid` IN (2,3,4);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4452, 2, 0, '%s places the crate of parts on the ground.', 16, 0, 100, 0, 0, 0, 'Kravel Koalbeard'),
(4452, 3, 0, '%s grabs a part and puts it in his pocket...', 16, 0, 100, 0, 0, 0, 'Kravel Koalbeard'),
(4452, 4, 0, 'There, that should do it...', 12, 0, 100, 0, 0, 0, 'Kravel Koalbeard');

-- [Q] Dream Dust in the Swamp - http://www.wowhead.com/quest=1116/dream-dust-in-the-swamp
-- Krazek SAI
SET @ENTRY := 773;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1116,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Krazek - On Quest 'Dream Dust in the Swamp' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 77300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,11,6903,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Krazek's Drug'"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,1,3,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 3");

DELETE FROM `creature_text` WHERE `entry`=773;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(773, 0, 0, '%s snorts a speck of dream dust up his nose...', 16, 0, 100, 0, 0, 0, 'Krazek'),
(773, 1, 0, '%s is dazed...', 16, 0, 100, 0, 0, 0, 'Krazek'),
(773, 2, 0, 'ACHOO!', 12, 0, 100, 0, 0, 0, 'Krazek'),
(773, 3, 0, 'Wow! $N, that dream dust is powerful stuff!', 12, 0, 100, 0, 0, 0, 'Krazek');

-- [Q] Identifying the Brood - http://www.wowhead.com/quest=1169/deprecated-identifying-the-brood
-- Draz'Zilb SAI
SET @ENTRY := 4501;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1169,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Draz'Zilb - On Quest 'Identifying the Brood' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 450100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,11,6741,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Identify Brood'"),
(@ENTRY,9,2,0,0,0,100,0,10000,10000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=4501;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4501, 0, 0, '%s begins to cast a spell over the hearts and tongues.', 16, 0, 100, 0, 0, 0, 'Draz\'Zilb'),
(4501, 1, 0, 'The brood of Onyxia!', 14, 0, 100, 0, 0, 0, 'Draz\'Zilb');

-- [Q] Load Lightening - http://www.wowhead.com/quest=1176/load-lightening
-- Pozzik SAI
SET @ENTRY := 4630;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1176,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Pozzik - On Quest 'Load Lightening' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 463000;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=4630;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4630, 0, 0, 'Okay, crew. Get to work on getting these bones installed.', 12, 0, 100, 0, 0, 0, 'Pozzik');

-- [Q] Nothing But The Truth - http://www.wowhead.com/quest=1383/nothing-but-the-truth
-- Apothecary Faustin SAI
SET @ENTRY := 5414;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1383,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Apothecary Faustin - On Quest 'Nothing But The Truth' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 541400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,5088,0,180000,0,0,0,8,0,0,0,-3837.25,-4548.3,9.29486,0.786911,"On Script - Summon Creature 'Falgran Hastil'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Npc Flag "),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,6.23291,"On Script - Set Orientation 6,23291"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,5,69,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 69"),
(@ENTRY,9,5,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 0"),
(@ENTRY,9,7,0,0,0,100,0,5000,5000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.14159,"On Script - Set Orientation 3,14159"),
(@ENTRY,9,8,0,0,0,100,0,1000,1000,0,0,1,2,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,9,0,0,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Npc Flag Questgiver");

DELETE FROM `creature_text` WHERE `entry`=5414;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(5414, 0, 0, 'The serum will only take a few seconds to prepare, $N.', 12, 0, 100, 0, 0, 0, 'Apothecary Faustin'),
(5414, 1, 0, 'Almost done...', 12, 0, 100, 0, 0, 0, 'Apothecary Faustin'),
(5414, 2, 0, 'At last, the serum is complete, $N. Now, come closer. We must talk.', 12, 0, 100, 0, 0, 0, 'Apothecary Faustin');

-- [Q] The Temple of Atal'Hakkar - http://www.wowhead.com/quest=1445/deprecated-the-temple-of-atalhakkar
-- Fel'zerul SAI
SET @ENTRY := 1443;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,1062,0,0,0,1,0,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Fel'zerul - On Quest 'Goblin Invaders' Finished - Say Line 0"),
(@ENTRY,0,1,0,61,0,100,0,1062,0,0,0,11,7437,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fel'zerul - On Quest 'Goblin Invaders' Finished - Cast 'Break Stuff'"),
(@ENTRY,0,2,0,20,0,100,0,1445,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fel'zerul - On Quest 'The Temple of Atal'Hakkar' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 144300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,11,7437,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Break Stuff'");

DELETE FROM `creature_text` WHERE `entry`=1443;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(1443, 1, 0, 'I hereby destroy these instruments of evil! For the Horde!', 14, 0, 100, 0, 0, 0, 'Fel\'zerul');

-- [Q] Barov Family Fortune - http://www.wowhead.com/quest=5341/barov-family-fortune
-- Alexi Barov SAI
SET @ENTRY := 11022;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,5341,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Alexi Barov - On Quest 'Barov Family Fortune' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 1102200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 1");

DELETE FROM `creature_text` WHERE `entry`=11022;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(11022, 0, 0, 'The deeds are mine, brother! Soon you shall be out of my way for good!', 12, 0, 100, 0, 0, 0, 'Alexi Barov');

-- Therylune's Escape - http://www.wowhead.com/quest=945/therylunes-escape
-- Therylune SAI
SET @ENTRY := 3584;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,945,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Therylune - On Quest 'Therylune's Escape' Taken - Say Line 0"),
(@ENTRY,0,1,5,61,0,100,0,945,0,0,0,53,0,3584,0,0,0,2,1,0,0,0,0,0,0,0,"Therylune - On Quest 'Therylune's Escape' Taken - Start Waypoint"),
(@ENTRY,0,2,3,40,0,100,0,20,3584,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Therylune - On Waypoint 20 Reached - Say Line 1"),
(@ENTRY,0,3,0,61,0,100,0,20,3584,0,0,15,945,0,0,0,0,0,18,50,0,0,0,0,0,0,"Therylune - On Waypoint 20 Reached - Quest Credit 'Therylune's Escape'"),
(@ENTRY,0,4,0,40,0,100,0,21,3584,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Therylune - On Waypoint 21 Reached - Despawn In 5000 ms"),
(@ENTRY,0,5,7,61,0,100,0,945,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,"Therylune - On Quest 'Therylune's Escape' Taken - Set Faction 250"),
(@ENTRY,0,6,8,11,0,100,0,0,0,0,0,2,124,0,0,0,0,0,1,0,0,0,0,0,0,0,"Therylune - On Respawn - Set Faction 124"),
(@ENTRY,0,7,9,61,0,100,0,945,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,"Therylune - On Quest 'Therylune's Escape' Taken - Remove Flag Immune To NPC's"),
(@ENTRY,0,8,0,61,0,100,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,"Therylune - On Respawn - Set Flag Immune To NPC's"),
(@ENTRY,0,9,0,61,0,100,0,945,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Therylune - On Quest 'Therylune's Escape' Taken - Remove Npc Flag Questgiver");

-- Celebras Scepter Event - http://www.wowhead.com/quest=7046/the-scepter-of-celebras
DELETE FROM `waypoints` WHERE `entry`=13716;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(13716, 1, 654.905, 87.382, -86.8597, 'Celebras Scepter Event'),
(13716, 2, 657.207, 80.8004, -86.8318, 'Celebras Scepter Event'),
(13716, 3, 656.58, 73.1467, -86.8285, 'Celebras Scepter Event'),
(13716, 4, 652.437, 73.9764, -85.3354, 'Celebras Scepter Event'),
(13716, 5, 656.595, 73.5683, -86.8284, 'Celebras Scepter Event'),
(13716, 6, 655.724, 67.3549, -86.828, 'Celebras Scepter Event'),
(13716, 7, 650.08, 65.0115, -86.7745, 'Celebras Scepter Event'),
(13716, 8, 655.445, 67.6601, -86.8283, 'Celebras Scepter Event'),
(13716, 9, 657.399, 78.0873, -86.8283, 'Celebras Scepter Event'),
(13716, 10, 652.611, 86.3702, -86.8453, 'Celebras Scepter Event');

-- Celebras the Redeemed SAI
SET @ENTRY := 13716;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,7046,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Celebras the Redeemed - On Quest 'The Scepter of Celebras' Started - Run Script"),
(@ENTRY,0,1,0,40,0,100,0,3,13716,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Celebras the Redeemed - On Waypoint 3 Reached - Run Script"),
(@ENTRY,0,2,0,40,0,100,0,4,13716,0,0,80,@ENTRY*100+02,2,0,0,0,0,1,0,0,0,0,0,0,0,"Celebras the Redeemed - On Waypoint 4 Reached - Run Script"),
(@ENTRY,0,3,0,40,0,100,0,7,13716,0,0,54,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Celebras the Redeemed - On Waypoint 7 Reached - Pause Waypoint"),
(@ENTRY,0,4,0,40,0,100,0,10,13716,0,0,80,@ENTRY*100+03,2,0,0,0,0,1,0,0,0,0,0,0,0,"Celebras the Redeemed - On Waypoint 10 Reached - Run Script");

-- Actionlist SAI
SET @ENTRY := 1371600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Remove Npc Flag Questgiver"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Run Off"),
(@ENTRY,9,3,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,654.905,87.382,-86.8597,5.06689,"On Script - Move To Position"),
(@ENTRY,9,4,0,0,0,100,0,5000,5000,0,0,53,0,13716,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Start Waypoint"),
(@ENTRY,9,5,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,6,0,0,0,100,0,3000,3000,0,0,1,2,0,0,0,0,0,21,100,0,0,0,0,0,0,"On Script - Say Line 2");

-- Actionlist SAI
SET @ENTRY := 1371601;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,11,21916,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Celebras Waiting'"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 4"),
(@ENTRY,9,4,0,0,0,100,0,1000,1000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 5");

-- Actionlist SAI
SET @ENTRY := 1371602;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 6"),
(@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 7"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,11,21950,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Recite Words of Celebras'"),
(@ENTRY,9,4,0,0,0,100,0,3000,3000,0,0,50,178964,60,0,0,0,0,8,0,0,0,652.263,74.0125,-85.3354,6.10288,"On Script - Summon Gameobject 'Celebras Blue Aura'");

-- Actionlist SAI
SET @ENTRY := 1371603;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,10000,10000,0,0,0,0,1,0,0,0,0,0,0,0,"Celebras the Redeemed - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,15,7046,0,0,0,0,0,17,0,100,0,0,0,0,0,"Celebras the Redeemed - On Script - Quest Credit 'The Scepter of Celebras'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Celebras the Redeemed - On Script - Add Npc Flag Questgiver");

DELETE FROM `creature_text` WHERE `entry`=13716;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(13716, 0, 0, 'You wish to learn of the stone? Follow me.', 12, 0, 100, 0, 0, 0, 8952, 'Celebras Scepter Event'),
(13716, 1, 0, 'For so long I have drifted in my cursed form. You have freed me... Your hard work shall be repaid.', 12, 0, 100, 0, 0, 0, 8953, 'Celebras Scepter Event'),
(13716, 2, 0, 'Please do as I instruct you, $N.', 12, 0, 100, 0, 0, 0, 8954, 'Celebras Scepter Event'),
(13716, 3, 0, 'Read this tome I have placed before you, and speak the words aloud.', 12, 0, 100, 0, 0, 0, 8950, 'Celebras Scepter Event'),
(13716, 4, 0, '%s begins to channel his energy, focusing on the stone.', 16, 0, 100, 0, 0, 0, 8951, 'Celebras Scepter Event'),
(13716, 5, 0, 'Together, the two parts shall become one, once again.', 12, 0, 100, 0, 0, 0, 8948, 'Celebras Scepter Event'),
(13716, 6, 0, 'Shal myrinan ishnu daldorah...', 12, 0, 100, 0, 0, 0, 8949, 'Celebras Scepter Event'),
(13716, 7, 0, 'My scepter will once again become whole!', 12, 0, 100, 0, 0, 0, 8955, 'Celebras Scepter Event');

-- [Q] The Videre Elixir - http://www.wowhead.com/quest=4041
UPDATE `creature_template` SET `ScriptName` = 'npc_miblon_snarltooth' WHERE `entry` =9467;
DELETE FROM `gameobject` WHERE `guid` = 17428;

-- [Q] One Shot. One Kill. (5713) - http://www.wowhead.com/quest=5713
-- Blackwood Tracker SAI
SET @ENTRY := 11713;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,5000,60000,60000,11,6950,64,0,0,0,0,2,0,0,0,0,0,0,0,"Blackwood Tracker - In Combat - Cast 'Faerie Fire'");

-- Marosh the Devious SAI
SET @ENTRY := 11714;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,5000,60000,60000,11,6950,64,0,0,0,0,2,0,0,0,0,0,0,0,"Marosh the Devious - In Combat - Cast 'Faerie Fire'");

UPDATE `creature_template` SET `ScriptName`='npc_aynasha' WHERE  `entry`=11711;

DELETE FROM `creature_text` WHERE `entry`=11711;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(11711, 0, 0, 'Wait... did you hear that? Something approaches from the west!', 12, 0, 100, 0, 0, 0, 'npc_aynasha'),
(11711, 1, 0, 'I\'ve run out of arrows! I\'m afraid if any more come you will need to take them on by yourself my friend.', 12, 0, 100, 0, 0, 0, 'npc_aynasha'),
(11711, 2, 0, 'Praise Elune! I don\'t know if I could have survived the day without you, friend.', 12, 0, 100, 0, 0, 0, 'npc_aynasha'),
(11711, 3, 0, 'My legs feels much better now, the remedy must be working. If you will excuse me, I must go report to my superiors about what has transpired here.', 12, 0, 100, 0, 0, 0, 'npc_aynasha'),
(11711, 4, 0, 'Please speak with Sentinel Onaeya at Maestra\'s Post in Ashenvale, she will see to it that you are properly rewarded for your bravery this day.', 12, 0, 100, 0, 0, 0, 'npc_aynasha');

DELETE FROM `script_waypoint` WHERE entry=11711;
INSERT INTO `script_waypoint` (entry, pointid, location_x, location_y, location_z, waittime, point_comment) VALUES
(11711, 0, 4389.716309, -66.750832, 86.549103, 0, 'npc_aynasha'); 

-- [Q] Sathrah's Sacrifice - http://www.wowhead.com/item=8155/sathrahs-sacrifice
-- Sathrah's Sacrifice
DELETE FROM `event_scripts` WHERE `id`=2313;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(2313, 0, 10, 7411, 3000000, 0, 9639.5,2528.97,1331.72,5.28395);

-- Spirit of Sathrah SAI
SET @ENTRY := 7411;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,0,7411,0,0,0,0,1,0,0,0,0,0,0,0,"Spirit of Sathrah - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,0,40,0,100,0,9,7411,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Spirit of Sathrah - On Waypoint 9 Reached - Despawn In 3000 ms");

DELETE FROM `waypoints` WHERE `entry`=7411;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(7411, 1, 9642.47,2523.25,1331.54, 'Spirit of Sathrah'),
(7411, 2, 9640.32,2517.43,1331.57, 'Spirit of Sathrah'),
(7411, 3, 9635.62,2514.35,1331.4, 'Spirit of Sathrah'),
(7411, 4, 9630.91,2515.59,1331.72, 'Spirit of Sathrah'),
(7411, 5, 9626.52,2520.1,1331.73, 'Spirit of Sathrah'),
(7411, 6, 9625.02,2526.36,1331.61, 'Spirit of Sathrah'),
(7411, 7, 9630.56,2532.58,1331.39, 'Spirit of Sathrah'),
(7411, 8, 9636.59,2532.65,1331.73, 'Spirit of Sathrah'),
(7411, 9, 9640.05,2529.06,1331.77, 'Spirit of Sathrah');

-- [Q] Trek to Ashenvale - http://www.wowhead.com/quest=990/trek-to-ashenvale
-- Senetil Selarin spawn after completition of quest=995 or quest=994
UPDATE `creature_template` SET `speed_walk`=1 WHERE  `entry`=3694;
-- Terenthis SAI
SET @ENTRY := 3693;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,995,0,0,0,12,3694,6,180000,0,0,0,8,0,0,0,6339.14,341.764,24.3387,0.498114,"Terenthis - On Quest 'Escape Through Stealth' Finished - Summon Creature 'Sentinel Selarin'"),
(@ENTRY,0,1,0,20,0,100,0,994,0,0,0,12,3694,6,180000,0,0,0,8,0,0,0,6339.14,341.764,24.3387,0.498114,"Terenthis - On Quest 'Escape Through Force' Finished - Summon Creature 'Sentinel Selarin'");

-- Sentinel Selarin SAI
SET @ENTRY := 3694;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,2,54,0,100,0,0,0,0,0,53,1,3694,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Selarin - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,0,40,0,100,0,23,3694,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Selarin - On Waypoint 23 Reached - Despawn Instant"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Selarin - On Just Summoned - Set Active On"),
(@ENTRY,0,3,0,40,0,100,0,1,3694,0,0,54,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Selarin - On Waypoint 1 Reached - Pause Waypoint"),
(@ENTRY,0,4,0,40,0,100,0,12,3694,0,0,54,120000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Selarin - On Waypoint 12 Reached - Pause Waypoint");

DELETE FROM `waypoints` WHERE `entry`=3694;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(3694, 1, 6339.14,341.764,24.3387, 'Sentinel Selarin'),
(3694, 2, 6353.39,354.557,22.3779, 'Sentinel Selarin'),
(3694, 3, 6368.99,357.894,21.5712, 'Sentinel Selarin'),
(3694, 4, 6387.81,359.455,18.9899, 'Sentinel Selarin'),
(3694, 5, 6398.12,363.588,17.366, 'Sentinel Selarin'),
(3694, 6, 6403.68,370.92,15.6815, 'Sentinel Selarin'),
(3694, 7, 6416.57,392.998,12.0215, 'Sentinel Selarin'),
(3694, 8, 6424.95,399.193,10.9586, 'Sentinel Selarin'),
(3694, 9, 6428.93,396.971,11.1736, 'Sentinel Selarin'),
(3694, 10, 6432,388.708,13.7662, 'Sentinel Selarin'),
(3694, 11, 6436.71,375.264,13.9403, 'Sentinel Selarin'),
(3694, 12, 6434.92,367.203,13.9403, 'Sentinel Selarin'), 
(3694, 13, 6436.9,374.833,13.9403, 'Sentinel Selarin'),
(3694, 14, 6431.63,389.723,13.5875, 'Sentinel Selarin'),
(3694, 15, 6428.84,397.45,11.0941, 'Sentinel Selarin'),
(3694, 16, 6424,400.084,10.9784, 'Sentinel Selarin'),
(3694, 17, 6413.76,392.804,12.2825, 'Sentinel Selarin'),
(3694, 18, 6401.4,368.195,16.4249, 'Sentinel Selarin'),
(3694, 19, 6393.69,360.887,18.1549, 'Sentinel Selarin'),
(3694, 20, 6377.21,357.731,20.6589, 'Sentinel Selarin'),
(3694, 21, 6358.35,357.353,22.2106, 'Sentinel Selarin'),
(3694, 22, 6348.45,352.662,22.6056, 'Sentinel Selarin'),
(3694, 23, 6322.42,326.649,25.3338, 'Sentinel Selarin');

-- [Q] Mana Surges - http://www.wowhead.com/quest=1957/mana-surges
-- 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=2 AND `SourceEntry`=6550;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 2, 6550, 0, 0, 9, 0, 1957, 0, 0, 0, 0, 0, '', 'Mana Surge - Allow sai action only if quest has been taken');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=3 AND `SourceEntry`=6546;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 3, 6546, 0, 0, 29, 0, 6550, 100, 0, 1, 0, 0, '', 'Mana Surge - Allow sai action only if not Mana Surge nearby');

-- Tabetha SAI
SET @ENTRY := 6546;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,4961,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Quest 'Cleansing of the Orb of Orahil' Taken - Run Script"),
(@ENTRY,0,1,0,20,0,100,0,1957,0,0,0,9,0,0,0,0,0,0,14,28294,103680,0,0,0,0,0,"Tabetha - On Quest 'Mana Surges' Finished - Activate Gameobject"),
(@ENTRY,0,2,3,19,0,100,0,1957,0,0,0,9,0,0,0,0,0,0,14,28294,103680,0,0,0,0,0,"Tabetha - On Quest 'Mana Surges' Taken - Activate Gameobject"),
(@ENTRY,0,3,6,61,0,100,0,1957,0,0,0,87,@ENTRY*100+01,@ENTRY*100+02,@ENTRY*100+03,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Quest 'Mana Surges' Taken - Run Random Script"),
(@ENTRY,0,4,0,38,1,100,0,1,1,0,0,87,@ENTRY*100+01,@ENTRY*100+02,@ENTRY*100+03,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Data Set 1 1 - Run Random Script (Phase 1)"),
(@ENTRY,0,5,0,19,0,100,0,1955,0,0,0,12,6549,4,180000,0,0,0,8,0,0,0,-4042.29,-3372.32,35.1924,5.2417,"Tabetha - On Quest 'The Exorcism' Taken - Summon Creature 'Demon of the Orb'"),
(@ENTRY,0,6,0,61,0,100,0,1957,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Quest 'Mana Surges' Taken - Set Event Phase 1"),
(@ENTRY,0,7,8,20,0,100,0,1957,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Quest 'Mana Surges' Finished - Set Event Phase 0"),
(@ENTRY,0,8,0,61,0,100,0,1957,0,0,0,45,2,2,0,0,0,0,9,6550,0,200,0,0,0,0,"Tabetha - On Quest 'Mana Surges' Finished - Set Data 2 2");

-- Actionlist SAI
SET @ENTRY := 654601;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4019.22,-3383.91,38.2265,2.7963,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4019.22,-3383.91,38.2265,2.7963,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4019.22,-3383.91,38.2265,2.7963,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,3,0,0,0,100,0,600000,600000,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Script - Set Event Phase 0");

-- Actionlist SAI
SET @ENTRY := 654602;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4019.99,-3394.54,38.5507,1.8342,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4019.99,-3394.54,38.5507,1.8342,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,2,0,0,0,100,0,600000,600000,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Script - Set Event Phase 0");

-- Actionlist SAI
SET @ENTRY := 654603;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4013.29,-3385.14,38.4656,2.3801,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4013.29,-3385.14,38.4656,2.3801,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,12,6550,1,600000,0,0,0,8,0,0,0,-4013.29,-3385.14,38.4656,2.3801,"Tabetha - On Script - Summon Creature 'Mana Surge'"),
(@ENTRY,9,3,0,0,0,100,0,600000,600000,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tabetha - On Script - Set Event Phase 0");

-- Mana Surge SAI
SET @ENTRY := 6550;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,1,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mana Surge - On Just Summoned - Start Random Movement (No Repeat)"),
(@ENTRY,0,1,0,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,6546,0,0,0,0,0,0,"Mana Surge - On Just Died - Set Data 1 1"),
(@ENTRY,0,2,0,0,0,100,0,3000,4000,8000,8000,11,11824,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mana Surge - In Combat - Cast 'Shock'"),
(@ENTRY,0,3,0,38,0,100,0,2,2,0,0,41,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mana Surge - On Data Set 2 2 - Despawn In 10 ms");

-- [Q] It's a Secret to Everybody - http://www.wowhead.com/quest=3908/its-a-secret-to-everybody
-- Donova Snowden SAI
SET @ENTRY := 9298;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,3908,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Donova Snowden - On Quest 'It's a Secret to Everybody' Finished - Run Script"),
(@ENTRY,0,1,0,61,0,100,0,3908,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Donova Snowden - On Quest 'It's a Secret to Everybody' Finished - Set Active On");

-- Actionlist SAI
SET @ENTRY := 929800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Npc Flag "),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,6384.54,-2527.25,538.736,2.52438,"On Script - Move To Position"),
(@ENTRY,9,3,0,0,0,100,0,6000,6000,0,0,69,0,0,0,0,0,0,8,0,0,0,6370.12,-2525.52,532.268,2.82283,"On Script - Move To Position"),
(@ENTRY,9,4,0,0,0,100,0,7000,7000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,5,0,0,0,100,0,5000,5000,0,0,5,61,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 61"),
(@ENTRY,9,6,0,0,0,100,0,1000,1000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,7,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,6364.25,-2524,527.058,2.9265,"On Script - Move To Position"),
(@ENTRY,9,8,0,0,0,100,0,3000,3000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,9,0,0,0,100,0,1000,1000,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 16"),
(@ENTRY,9,10,0,0,0,100,0,3000,3000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 4"),
(@ENTRY,9,11,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,6370.3,-2524.19,532.27,6.26836,"On Script - Move To Position"),
(@ENTRY,9,12,0,0,0,100,0,3000,3000,0,0,69,0,0,0,0,0,0,8,0,0,0,6385.99,-2529.26,539.03,5.66753,"On Script - Move To Position"),
(@ENTRY,9,13,0,0,0,100,0,8000,8000,0,0,69,0,0,0,0,0,0,8,0,0,0,6395.57,-2536.75,541.548,5.66753,"On Script - Move To Position"),
(@ENTRY,9,14,0,0,0,100,0,5000,5000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.86475,"On Script - Set Orientation 2,86475"),
(@ENTRY,9,15,0,0,0,100,0,1000,1000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 5"),
(@ENTRY,9,16,0,0,0,100,0,1000,1000,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Npc Flags Gossip & Questgiver");

DELETE FROM `creature_text` WHERE `entry`=9298;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(9298, 0, 0, 'Please, follow me.', 12, 0, 100, 0, 0, 0, 'Donova Snowden'),
(9298, 1, 0, 'I haven\'t really figured out what it is, but there\'s something strange about the hot springs...', 12, 0, 100, 0, 0, 0, 'Donova Snowden'),
(9298, 2, 0, '%s tosses the sword into the shallow pool.', 16, 0, 100, 0, 0, 0, 'Donova Snowden'),
(9298, 3, 0, 'I\'ve found that when I throw something into this water, it has improved incredibly when I retrieve it.', 12, 0, 100, 0, 0, 0, 'Donova Snowden'),
(9298, 4, 0, 'Well, whatever it is, it works quite well!', 12, 0, 100, 0, 0, 0, 'Donova Snowden'),
(9298, 5, 0, 'And I am determined to find out more... So if you need my help again, you know where I\'ll be.', 12, 0, 100, 0, 0, 0, 'Donova Snowden');

-- [Q] Propaganda War - Endevent - http://www.wowhead.com/quest=11128/propaganda-war
-- Calia Hastings SAI
SET @ENTRY := 23566;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,11128,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Calia Hastings - On Quest 'Propaganda War' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 2356600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Npc Flag "),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Run Off"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,-3817.38,-4566.12,8.84245,1.07843,"On Script - Move To Position"),
(@ENTRY,9,5,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,-3816.62,-4564.31,8.97211,1.1499,"On Script - Move To Position"),
(@ENTRY,9,6,0,0,0,100,0,1000,1000,0,0,5,69,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 69"),
(@ENTRY,9,7,0,0,0,100,0,9000,9000,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 0"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-3817.38,-4566.12,8.84245,0,"On Script - Move To Position"),
(@ENTRY,9,9,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,-3819.74,-4562.35,9.14216,2.40855,"On Script - Move To Position"),
(@ENTRY,9,10,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,11,0,0,0,100,0,2000,2000,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Npc Flag Questgiver"),
(@ENTRY,9,12,0,0,0,100,0,1000,1000,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Active Off");

DELETE FROM `creature_text` WHERE `entry`=23566;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(23566, 0, 0, 'It would be a shame to let these leaflets go to waste, wouldn\'t it?', 12, 0, 100, 1, 0, 0, 'Calia Hastings'), 
(23566, 1, 0, 'With just a little creative editing, these are much more useful...', 12, 0, 100, 0, 0, 0, 'Calia Hastings'); 

-- [Q] The Tower of Althalaxx - http://www.wowhead.com/quest=970/the-tower-of-althalaxx
-- Delgren the Purifier SAI
SET @ENTRY := 3663;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Delgren the Purifier - Between 0-15% Health - Flee For Assist (No Repeat)"),
(@ENTRY,0,1,2,20,0,100,0,970,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Delgren the Purifier - On Quest 'The Tower of Althalaxx' Finished - Run Script"),
(@ENTRY,0,2,0,61,0,100,0,970,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Delgren the Purifier - On Quest 'The Tower of Althalaxx' Finished - Set Active On");

-- Actionlist SAI
SET @ENTRY := 366300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 1"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.80526,"On Script - Set Orientation 2,80526"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,50,19862,60,0,0,0,0,8,0,0,0,3184.06,190.81,4.61263,5.55407,"On Script - Summon Gameobject 'Glowing Soulgem'"),
(@ENTRY,9,4,0,0,0,100,0,1000,1000,0,0,5,61,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 61"),
(@ENTRY,9,5,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,6,0,0,0,100,0,2000,2000,0,0,12,4509,3,38000,0,0,0,8,0,0,0,3184.06,190.81,4.61263,5.55407,"On Script - Summon Creature 'Sargath'"),
(@ENTRY,9,7,0,0,0,100,0,27000,27000,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,5,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 6"),
(@ENTRY,9,9,0,0,0,100,0,11000,11000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,10,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.471239,"On Script - Set Orientation 0,471239");

-- Sargath SAI
SET @ENTRY := 4509;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sargath - Out of Combat - Say Line 0 (No Repeat)"), 
(@ENTRY,0,1,0,1,0,100,1,7000,7000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sargath - Out of Combat - Say Line 1 (No Repeat)"),
(@ENTRY,0,2,0,1,0,100,1,12000,12000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sargath - Out of Combat - Say Line 2 (No Repeat)"),
(@ENTRY,0,3,0,1,0,100,1,17000,17000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sargath - Out of Combat - Say Line 3 (No Repeat)"),
(@ENTRY,0,4,0,1,0,100,1,22000,22000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sargath - Out of Combat - Say Line 4 (No Repeat)"),
(@ENTRY,0,5,0,1,0,100,1,32000,32000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sargath - Out of Combat - Say Line 5 (No Repeat)");


DELETE FROM `creature_text` WHERE `entry`=3663;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3663, 0, 0, 'A simple enough task to break this soulstone!', 12, 0, 100, 0, 0, 0, ''),
(3663, 1, 0, 'Soulgem bursts open!', 16, 0, 100, 0, 0, 0, ''),
(3663, 2, 0, 'Then we must put an end to Athrikus Narassin. Tell me, spirit, where might we find the other soulgems, to undo his magic?', 12, 0, 100, 0, 0, 0, ''),
(3663, 3, 0, 'Sargath fades into the mist...', 16, 0, 100, 0, 0, 0, '');

-- [Q] For Love Eternal - http://wowwiki.wikia.com/wiki/Quest:For_Love_Eternal
-- Cerellean Whiteclaw SAI
SET @ENTRY := 3644;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,2,20,0,100,0,963,0,0,0,12,3843,3,45000,0,0,0,8,0,0,0,6426.84,603.166,9.46655,4.14031,"Cerellean Whiteclaw - On Quest 'For Love Eternal' Finished - Summon Creature 'Anaya'"),
(@ENTRY,0,1,0,1,0,100,0,15000,15000,15000,15000,5,18,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cerellean Whiteclaw - Out of Combat - Play Emote 18"),
(@ENTRY,0,2,0,61,0,100,0,963,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cerellean Whiteclaw - On Quest 'For Love Eternal' Finished - Run Script");

UPDATE `creature_template` SET `faction`=35 WHERE  `entry`=3843;
UPDATE `creature_text` SET `type`=12 WHERE  `entry`=3644 AND `groupid`=1 AND `id`=0;
UPDATE `creature_text` SET `type`=12 WHERE  `entry`=3644 AND `groupid`=2 AND `id`=0;

-- [Q] Survey Alcaz Island - http://wotlk.openwow.com/quest=11142
UPDATE `creature_template` SET `ainame`='SmartAI', `scriptname`='' WHERE `entry` IN(4968,23704);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(4968,23704) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(2370400) AND `source_type`=9;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(4968, 0, 0, 1, 62, 0, 100, 0, 2465, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Gossip Select - Close Gossip'),
(4968, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Gossip Select - Say Line 6'),
(4968, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 23122, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Gossip Select - Cast Jaina''s Autograph'),
(4968, 0, 3, 4, 20, 0, 100, 0, 11142, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Quest Reward (Survey Alcaz Island - Face player'),
(4968, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Quest Reward (Survey Alcaz Island - Say Line 0'), -- 04:20:13.000
(4968, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 81, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Quest Reward (Survey Alcaz Island - Set NPC Flags'), 
(4968, 0, 6, 0, 52, 0, 100, 0, 0, 4968, 0, 0, 1, 1, 7000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Text Over Line 0 - Say Line 1'), -- 04:20:18.000
(4968, 0, 7, 0, 52, 0, 100, 0, 1, 4968, 0, 0, 1, 2, 6000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Text Over Line 1 - Say Line 2'), -- 04:20:25.000
(4968, 0, 8, 0, 52, 0, 100, 0, 2, 4968, 0, 0, 1, 3, 7000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Text Over Line 2 - Say Line 3'), -- 04:20:31.000
(4968, 0, 9, 0, 52, 0, 100, 0, 3, 4968, 0, 0, 1, 4, 6000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Text Over Line 3 - Say Line 4'), -- 04:20:38.000
(4968, 0, 10, 0, 52, 0, 100, 0, 4, 4968, 0, 0, 1, 5, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Text Over Line 4 - Say Line 5'), -- 04:20:44.000
(4968, 0, 11, 12, 52, 0, 100, 0, 5, 4968, 0, 0, 81, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Text Over Line 5 - Set Npc Flag'),
(4968, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lady Jaina Proudmoore - On Text Over Line 5 - Evade'),
(23704, 0, 0, 1, 62, 0, 100, 0, 8782, 0, 0, 0, 11, 42295, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Cassa Crimsonwing - On Gossip Option 0 Selected - Cast Spell 42295'),
(23704, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Cassa Crimsonwing - On Linked Actions - Close Gossip');

DELETE FROM `gossip_menu_option` WHERE `menu_id`=2465;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES 
(2465, 0, 0, 'Lady Jaina, this may sound like an odd request... but I have a young ward who is quite shy.  You are a hero to him, and he asked me to get your autograph.', 9663, 1, 1, 0, 0, 0, 0, '', 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=2465;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 2465, 0, 0, 0, 9, 0, 558, 0, 0, 0, 0, 0, '', 'Lady Jaina Proudmoore Shows gossip option 2465 if player has quest Jaina''s Autograph');

DELETE FROM `creature_text` WHERE `entry`=4968;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(4968, 0, 0, 'Perhaps I should explain...', 12, 0, 100, 1, 0, 0, 33092, 'Lady Jaina Proudmoore to Player'),
(4968, 1, 0, 'I had arranged for a secret summit between Warchief Thrall and King Wrynn, here in Theramore.', 12, 0, 100, 1, 0, 0, 33093, 'Lady Jaina Proudmoore to Player'),
(4968, 2, 0, 'The king was to travel here by ship, in secret. But the ship never arrived, and King Wrynn disappeared.', 12, 0, 100, 1, 0, 0, 33094, 'Lady Jaina Proudmoore to Player'),
(4968, 3, 0, 'Your help enabled us to connect the Defias to the mastermind behind the abduction, Onyxia, who was posing as a member of the royal court.', 12, 0, 100, 1, 0, 0, 33095, 'Lady Jaina Proudmoore to Player'),
(4968, 4, 0, 'Meanwhile, the king managed to escape his captors, and returned to Stormwind to deal with Onyxia.', 12, 0, 100, 1, 0, 0, 33096, 'Lady Jaina Proudmoore to Player'),
(4968, 5, 0, 'I will send word that you have discovered the link to the Defias. I was a fool to think them broken with the defeat of Edwin Van Cleef, and King Wrynn will want to make an example of all who remain.', 12, 0, 100, 1, 0, 0, 33097, 'Lady Jaina Proudmoore to Player'),
(4968, 6, 0, 'Why... that is very sweet of you.  I gather that you are volunteering time for Children''s Week, yes $c?  Well, you are to be commended.  It is imperative that we remember those less fortunate - especially the children.$B$BI''d be happy to sign an autograph.  Here you go.', 12, 0, 100, 1, 0, 0, 9665, 'Lady Jaina Proudmoore to Player');

SET NAMES utf8;
DELETE FROM `gossip_menu_option` WHERE (`menu_id`=8782 AND `id`=0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES 
(8782, 0, 0, 'I need to get a flight.', 0, 1, 1, 0, 0, 0, 0, NULL, 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=8782;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 8782, 0, 0, 0, 9, 0, 11142, 0, 0, 0, 0, 0, '', 'Cassa - show gossip if player has quest Survey Alcaz Island');

DELETE FROM `spell_area` WHERE  `spell`=42316 AND `area`=2079 AND `quest_start`=11142 AND `aura_spell`=0 AND `racemask`=1101 AND `gender`=2;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(42316, 2079, 11142, 0, 0, 1101, 2, 1, 74, 11);

-- King of the Foulweald - http://wotlk.openwow.com/quest=6621
DELETE FROM `spell_script_names` WHERE `spell_id`=20783;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(20783, 'spell_destroy_karangs_banner');

-- remove this shit - eventscripts will be running even without gameobject
DELETE FROM `event_scripts` where id=6721;

-- Karang's Banner SAI
SET @ENTRY := 178205;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,1,0,100,1,5000,5000,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Karang's Banner - Out of Combat - Run Script (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 17820500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,3749,3,180000,0,0,0,8,0,0,0,2237.48,-1524.45,89.7827,0,"On Script - Summon Creature 'Foulweald Ursa'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,3743,3,180000,0,0,0,8,0,0,0,2202.16,-1544.48,87.796,0,"On Script - Summon Creature 'Foulweald Warrior'"),
(@ENTRY,9,2,0,0,0,100,0,20000,20000,0,0,12,3750,3,180000,0,0,0,8,0,0,0,2208.93,-1567.59,87.2283,0,"On Script - Summon Creature 'Foulweald Totemic'"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,12,3749,3,180000,0,0,0,8,0,0,0,2235.44,-1578.43,86.4944,0,"On Script - Summon Creature 'Foulweald Ursa'"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,12,3743,3,180000,0,0,0,8,0,0,0,2260.9,-1547.91,89.1733,0,"On Script - Summon Creature 'Foulweald Warrior'"),
(@ENTRY,9,5,0,0,0,100,0,30000,30000,0,0,12,3750,3,180000,0,0,0,8,0,0,0,2237.48,-1524.45,89.7827,0,"On Script - Summon Creature 'Foulweald Totemic'"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,12,3749,3,180000,0,0,0,8,0,0,0,2202.16,-1544.48,87.796,0,"On Script - Summon Creature 'Foulweald Ursa'"),
(@ENTRY,9,7,0,0,0,100,0,20000,20000,0,0,12,3743,3,180000,0,0,0,8,0,0,0,2208.93,-1567.59,87.2283,0,"On Script - Summon Creature 'Foulweald Warrior'"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,12,3750,3,180000,0,0,0,8,0,0,0,2235.44,-1578.43,86.4944,0,"On Script - Summon Creature 'Foulweald Totemic'"),
(@ENTRY,9,9,0,0,0,100,0,0,0,0,0,12,3749,3,180000,0,0,0,8,0,0,0,2260.9,-1547.91,89.1733,0,"On Script - Summon Creature 'Foulweald Ursa'"),
(@ENTRY,9,10,0,0,0,100,0,30000,30000,0,0,12,3743,3,180000,0,0,0,8,0,0,0,2237.48,-1524.45,89.7827,0,"On Script - Summon Creature 'Foulweald Warrior'"),
(@ENTRY,9,11,0,0,0,100,0,0,0,0,0,12,3750,3,180000,0,0,0,8,0,0,0,2202.16,-1544.48,87.796,0,"On Script - Summon Creature 'Foulweald Totemic'"),
(@ENTRY,9,12,0,0,0,100,0,20000,20000,0,0,12,3749,3,180000,0,0,0,8,0,0,0,2208.93,-1567.59,87.2283,0,"On Script - Summon Creature 'Foulweald Ursa'"),
(@ENTRY,9,13,0,0,0,100,0,0,0,0,0,12,3743,3,180000,0,0,0,8,0,0,0,2235.44,-1578.43,86.4944,0,"On Script - Summon Creature 'Foulweald Warrior'"),
(@ENTRY,9,14,0,0,0,100,0,0,0,0,0,12,3750,3,180000,0,0,0,8,0,0,0,2260.9,-1547.91,89.1733,0,"On Script - Summon Creature 'Foulweald Totemic'"),
(@ENTRY,9,15,0,0,0,100,0,30000,30000,0,0,12,3749,3,180000,0,0,0,8,0,0,0,2237.48,-1524.45,89.7827,0,"On Script - Summon Creature 'Foulweald Ursa'"),
(@ENTRY,9,16,0,0,0,100,0,0,0,0,0,12,3743,3,180000,0,0,0,8,0,0,0,2202.16,-1544.48,87.796,0,"On Script - Summon Creature 'Foulweald Warrior'"),
(@ENTRY,9,17,0,0,0,100,0,25000,25000,0,0,12,12918,3,180000,0,0,0,8,0,0,0,2208.93,-1567.59,87.2283,0,"On Script - Summon Creature 'Chief Murgut'");

-- Foulweald Ursa SAI
SET @ENTRY := 3749;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`>=4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,4,0,1,0,100,0,2000,2000,20000,20000,69,1,0,0,0,0,0,8,0,0,0,2231.145,-1547.246,92.405,0,"Foulweald Ursa - Out of Combat - Move To Position"),
(@ENTRY,0,5,0,34,0,100,0,8,1,0,0,11,20786,0,0,0,0,0,1,0,0,0,0,0,0,0,"Foulweald Ursa - On Reached Point 1 - Cast 'Destroy Karang's Banner'");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=5 AND `SourceEntry`=3749;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,5,3749,0,0,30,1,178205,35,0,0,"","Foulweald SAI - ONLY near Banner");

-- Foulweald Warrior SAI
SET @ENTRY := 3743;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`>=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,2,0,1,0,100,0,2000,2000,20000,20000,69,1,0,0,0,0,0,8,0,0,0,2231.145,-1547.246,92.405,0,"Foulweald Warrior - Out of Combat - Move To Closest Gameobject 'Karang's Banner' (Phase 1)"),
(@ENTRY,0,3,0,34,0,100,0,8,1,0,0,11,20786,0,0,0,0,0,1,0,0,0,0,0,0,0,"Foulweald Warrior - On Reached Point 1 - Cast 'Destroy Karang's Banner'");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=3 AND `SourceEntry`=3743;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,3,3743,0,0,30,1,178205,35,0,0,"","Foulweald SAI - ONLY near Banner");

-- Foulweald Totemic SAI
SET @ENTRY := 3750;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`>=4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,4,0,1,0,100,0,2000,2000,20000,20000,69,1,0,0,0,0,0,8,0,0,0,2231.145,-1547.246,92.405,0,"Foulweald Totemic - Out of Combat - Move To Closest Gameobject 'Karang's Banner' (Phase 1)"),
(@ENTRY,0,5,0,34,0,100,0,8,1,0,0,11,20786,0,0,0,0,0,1,0,0,0,0,0,0,0,"Foulweald Totemic - On Reached Point 1 - Cast 'Destroy Karang's Banner'");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=5 AND `SourceEntry`=3750;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,5,3750,0,0,30,1,178205,35,0,0,"","Foulweald SAI - ONLY near Banner");

-- Chief Murgut SAI
SET @ENTRY := 12918;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`>=4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,4,0,1,0,100,0,2000,2000,20000,20000,69,1,0,0,0,0,0,8,0,0,0,2231.145,-1547.246,92.405,0,"Chief Murgut - Out of Combat - Move To Closest Gameobject 'Karang's Banner' (Phase 1)"),
(@ENTRY,0,5,0,34,0,100,0,8,1,0,0,11,20786,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chief Murgut - On Reached Point 1 - Cast 'Destroy Karang's Banner'");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=5 AND `SourceEntry`=12918;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,5,12918,0,0,30,1,178205,35,0,0,"","Foulweald SAI - ONLY near Banner");

-- The Bait for Lar'korwi - http://wotlk.openwow.com/quest=4292
UPDATE `gameobject` SET `position_z` = -216.891 WHERE `guid` =99845;
DELETE FROM `gameobject` WHERE `id`=169216;
DELETE FROM `event_scripts` WHERE  `id`=3980;
DELETE FROM `spell_script_names` WHERE `spell_id`=15118;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(15118, 'spell_place_threshadon_carcass');
-- INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (27142, 169216, 1, 490, 1942, 1, 1, -7198.09, -2425, -216.693, 4.30284, 0, 0, 0.83612, -0.548546, -180, 0, 1, 0);

-- [Q] 'Rescue From Jaedenar' - http://wotlk.openwow.com/quest=5203
-- Spirit of Trey Lightforge SAI
SET @ENTRY := 11141;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,40,0,0,11,15493,64,0,0,0,0,1,0,0,0,0,0,0,0,"Spirit of Trey Lightforge - Between 0-40% Health - Cast 'Holy Light' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,4000,4000,4000,4000,11,18164,64,0,0,0,0,2,0,0,0,0,0,0,0,"Spirit of Trey Lightforge - In Combat - Cast 'Shadow Bolt'");

UPDATE `creature_template` SET `ScriptName`='npc_captured_arkonarin' WHERE  `entry`=11016;
UPDATE `quest_template_addon` SET `SpecialFlags`=2 WHERE  `ID`=5203;

DELETE FROM `script_waypoint` WHERE `entry`=11016;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES 
(11016, 0, 5004.98, -440.237, 319.059, 4000, 'SAY_ESCORT_START'),
(11016, 1, 4992.22, -449.964, 317.057, 0, 'npc_captured_arkonarin'),
(11016, 2, 4988.55, -457.438, 316.289, 0, 'npc_captured_arkonarin'),
(11016, 3, 4989.98, -464.297, 316.846, 0, 'npc_captured_arkonarin'),
(11016, 4, 4994.04, -467.754, 318.055, 0, 'npc_captured_arkonarin'),
(11016, 5, 5002.31, -466.318, 319.965, 0, 'npc_captured_arkonarin'),
(11016, 6, 5011.8, -462.889, 321.501, 0, 'npc_captured_arkonarin'),
(11016, 7, 5020.53, -460.797, 321.97, 0, 'npc_captured_arkonarin'),
(11016, 8, 5026.84, -463.171, 321.345, 0, 'npc_captured_arkonarin'),
(11016, 9, 5028.66, -476.805, 318.726, 0, 'npc_captured_arkonarin'),
(11016, 10, 5029.5, -487.131, 318.179, 0, 'npc_captured_arkonarin'),
(11016, 11, 5031.18, -497.678, 316.533, 0, 'npc_captured_arkonarin'),
(11016, 12, 5032.72, -504.748, 314.744, 0, 'npc_captured_arkonarin'),
(11016, 13, 5035, -513.138, 314.372, 0, 'npc_captured_arkonarin'),
(11016, 14, 5037.49, -521.733, 313.221, 6000, 'SAY_FIRST_STOP'),
(11016, 15, 5049.06, -519.546, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 16, 5059.17, -522.93, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 17, 5062.75, -529.933, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 18, 5063.9, -538.827, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 19, 5062.22, -545.635, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 20, 5061.69, -552.333, 313.101, 0, 'npc_captured_arkonarin'),
(11016, 21, 5060.33, -560.349, 310.873, 0, 'npc_captured_arkonarin'),
(11016, 22, 5055.62, -565.541, 308.737, 0, 'npc_captured_arkonarin'),
(11016, 23, 5049.8, -567.604, 306.537, 0, 'npc_captured_arkonarin'),
(11016, 24, 5043.01, -564.946, 303.682, 0, 'npc_captured_arkonarin'),
(11016, 25, 5038.22, -559.823, 301.463, 0, 'npc_captured_arkonarin'),
(11016, 26, 5039.46, -548.675, 297.824, 0, 'npc_captured_arkonarin'),
(11016, 27, 5043.44, -538.807, 297.801, 0, 'npc_captured_arkonarin'),
(11016, 28, 5056.4, -528.954, 297.801, 0, 'npc_captured_arkonarin'),
(11016, 29, 5064.4, -521.904, 297.801, 0, 'npc_captured_arkonarin'),
(11016, 30, 5067.62, -512.999, 297.196, 0, 'npc_captured_arkonarin'),
(11016, 31, 5065.99, -505.329, 297.214, 0, 'npc_captured_arkonarin'),
(11016, 32, 5062.24, -499.086, 297.448, 0, 'npc_captured_arkonarin'),
(11016, 33, 5065.09, -492.069, 298.054, 0, 'npc_captured_arkonarin'),
(11016, 34, 5071.19, -491.173, 297.666, 5000, 'SAY_SECOND_STOP'),
(11016, 35, 5087.47, -496.478, 296.677, 0, 'npc_captured_arkonarin'),
(11016, 36, 5095.55, -508.639, 296.677, 0, 'npc_captured_arkonarin'),
(11016, 37, 5104.3, -521.014, 296.677, 0, 'npc_captured_arkonarin'),
(11016, 38, 5110.13, -532.123, 296.677, 4000, 'open equipment chest'),
(11016, 39, 5110.13, -532.123, 296.677, 4000, 'cast SPELL_STRENGHT_ARKONARIN'),
(11016, 40, 5110.13, -532.123, 296.677, 4000, 'SAY_EQUIPMENT'),
(11016, 41, 5110.13, -532.123, 296.677, 0, 'SAY_ESCAPE'),
(11016, 42, 5099.75, -510.823, 296.677, 0, 'npc_captured_arkonarin'),
(11016, 43, 5091.94, -497.516, 296.677, 0, 'npc_captured_arkonarin'),
(11016, 44, 5079.38, -486.811, 297.638, 0, 'npc_captured_arkonarin'),
(11016, 45, 5069.21, -488.77, 298.082, 0, 'npc_captured_arkonarin'),
(11016, 46, 5064.24, -496.051, 297.275, 0, 'npc_captured_arkonarin'),
(11016, 47, 5065.08, -505.239, 297.361, 0, 'npc_captured_arkonarin'),
(11016, 48, 5067.82, -515.245, 297.125, 0, 'npc_captured_arkonarin'),
(11016, 49, 5064.62, -521.17, 297.801, 0, 'npc_captured_arkonarin'),
(11016, 50, 5053.22, -530.739, 297.801, 0, 'npc_captured_arkonarin'),
(11016, 51, 5045.73, -538.311, 297.801, 0, 'npc_captured_arkonarin'),
(11016, 52, 5039.69, -548.112, 297.801, 0, 'npc_captured_arkonarin'),
(11016, 53, 5038.78, -557.588, 300.787, 0, 'npc_captured_arkonarin'),
(11016, 54, 5042.01, -566.749, 303.838, 0, 'npc_captured_arkonarin'),
(11016, 55, 5050.56, -568.149, 306.782, 0, 'npc_captured_arkonarin'),
(11016, 56, 5056.98, -564.674, 309.342, 0, 'npc_captured_arkonarin'),
(11016, 57, 5060.79, -556.801, 311.936, 0, 'npc_captured_arkonarin'),
(11016, 58, 5059.58, -551.626, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 59, 5062.83, -541.994, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 60, 5063.55, -531.288, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 61, 5057.93, -523.088, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 62, 5049.47, -519.36, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 63, 5040.79, -519.809, 313.221, 0, 'npc_captured_arkonarin'),
(11016, 64, 5034.3, -515.361, 313.948, 0, 'npc_captured_arkonarin'),
(11016, 65, 5032, -505.532, 314.663, 0, 'npc_captured_arkonarin'),
(11016, 66, 5029.92, -495.645, 316.821, 0, 'npc_captured_arkonarin'),
(11016, 67, 5028.87, -487, 318.179, 0, 'npc_captured_arkonarin'),
(11016, 68, 5028.11, -475.531, 318.839, 0, 'npc_captured_arkonarin'),
(11016, 69, 5027.76, -465.442, 320.643, 0, 'npc_captured_arkonarin'),
(11016, 70, 5019.96, -460.892, 321.969, 0, 'npc_captured_arkonarin'),
(11016, 71, 5009.43, -464.793, 321.248, 0, 'npc_captured_arkonarin'),
(11016, 72, 4999.57, -468.062, 319.426, 0, 'npc_captured_arkonarin'),
(11016, 73, 4992.03, -468.128, 317.894, 0, 'npc_captured_arkonarin'),
(11016, 74, 4988.17, -461.293, 316.369, 0, 'npc_captured_arkonarin'),
(11016, 75, 4990.62, -447.459, 317.104, 0, 'npc_captured_arkonarin'),
(11016, 76, 4993.48, -438.643, 318.272, 0, 'npc_captured_arkonarin'),
(11016, 77, 4995.45, -430.178, 318.462, 0, 'npc_captured_arkonarin'),
(11016, 78, 4993.56, -422.876, 318.864, 0, 'npc_captured_arkonarin'),
(11016, 79, 4985.4, -420.864, 320.205, 0, 'npc_captured_arkonarin'),
(11016, 80, 4976.52, -426.168, 323.112, 0, 'npc_captured_arkonarin'),
(11016, 81, 4969.83, -429.755, 325.029, 0, 'npc_captured_arkonarin'),
(11016, 82, 4960.7, -425.44, 325.834, 0, 'npc_captured_arkonarin'),
(11016, 83, 4955.45, -418.765, 327.433, 0, 'npc_captured_arkonarin'),
(11016, 84, 4949.7, -408.796, 328.004, 0, 'npc_captured_arkonarin'),
(11016, 85, 4940.02, -403.222, 329.956, 0, 'npc_captured_arkonarin'),
(11016, 86, 4934.98, -401.475, 330.898, 0, 'npc_captured_arkonarin'),
(11016, 87, 4928.69, -399.302, 331.744, 0, 'npc_captured_arkonarin'),
(11016, 88, 4926.94, -398.436, 333.079, 0, 'npc_captured_arkonarin'),
(11016, 89, 4916.16, -393.822, 333.729, 0, 'npc_captured_arkonarin'),
(11016, 90, 4908.39, -396.217, 333.217, 0, 'npc_captured_arkonarin'),
(11016, 91, 4905.61, -396.535, 335.05, 0, 'npc_captured_arkonarin'),
(11016, 92, 4897.88, -395.245, 337.346, 0, 'npc_captured_arkonarin'),
(11016, 93, 4895.21, -388.203, 339.295, 0, 'npc_captured_arkonarin'),
(11016, 94, 4896.94, -382.429, 341.04, 0, 'npc_captured_arkonarin'),
(11016, 95, 4901.88, -378.799, 342.771, 0, 'npc_captured_arkonarin'),
(11016, 96, 4908.09, -380.635, 344.597, 0, 'npc_captured_arkonarin'),
(11016, 97, 4911.91, -385.818, 346.491, 0, 'npc_captured_arkonarin'),
(11016, 98, 4910.1, -393.444, 348.798, 0, 'npc_captured_arkonarin'),
(11016, 99, 4903.5, -396.947, 350.812, 0, 'npc_captured_arkonarin'),
(11016, 100, 4898.08, -394.226, 351.821, 0, 'npc_captured_arkonarin'),
(11016, 101, 4891.33, -393.436, 351.801, 0, 'npc_captured_arkonarin'),
(11016, 102, 4881.2, -395.211, 351.59, 0, 'npc_captured_arkonarin'),
(11016, 103, 4877.84, -395.536, 349.713, 0, 'npc_captured_arkonarin'),
(11016, 104, 4873.97, -394.919, 349.844, 5000, 'SAY_FRESH_AIR'),
(11016, 105, 4873.97, -394.919, 349.844, 3000, 'SAY_BETRAYER'),
(11016, 106, 4873.97, -394.919, 349.844, 2000, 'SAY_TREY'),
(11016, 107, 4873.97, -394.919, 349.844, 0, 'SAY_ATTACK_TREY'),
(11016, 108, 4873.97, -394.919, 349.844, 5000, 'SAY_ESCORT_COMPLETE'),
(11016, 109, 4873.97, -394.919, 349.844, 1000, 'npc_captured_arkonarin'),
(11016, 110, 4863.02, -394.521, 350.65, 0, 'npc_captured_arkonarin'),
(11016, 111, 4848.7, -397.612, 351.215, 0, 'npc_captured_arkonarin');

DELETE FROM `creature_text` WHERE `entry`=11016;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(11016, 0, 0, 'Please, help me to get through this cursed forest.', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 1, 0, 'This creature suffers from the effect of the fel... We must end its misery.', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 2, 0, 'The corruption of the fel has not left any of the creatures of Felwood untouched. Please, be on your guard.', 12, 0, 10, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 3, 0, 'I sense the taint of corruption upon this. Help me destroy it.', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 4, 0, 'That I must fight against my own kind deeply saddens me.', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 5, 0, 'I can sense it now. Ashenvale lies down this path.', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 6, 0, 'I feel... something strange...', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 7, 0, 'My form has now changed! The true strength of my spirit is returning to me now... The cursed grasp of the forest is leaving me.', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin'),
(11016, 8, 0, 'Thank you. Now my spirit will finally be at peace.', 12, 0, 100, 0, 0, 0, 'npc_captured_arkonarin');

UPDATE `creature_template` SET `faction`=35 WHERE  `entry`=11016;

-- Kroshius' Infernal Core -- http://www.wowhead.com/quest=7603/kroshius-infernal-core
UPDATE `creature` SET `position_x`=5800.322754, `position_y`=-986.270813, `position_z`=409.803802, `unit_flags`=1048576 WHERE `guid`=39715;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=1 and `SourceEntry`=14467;
DELETE FROM `creature_text` WHERE `entry`=14467;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(14467, 0, 0, 'Kroshius live? Kroshius crush!', 14, 0, 100, 0, 0, 0, 'Kroshius');

-- Bodyguard for Hire (5821)
-- Gizelton Caravan (5943)
-- Delete paths from quest givers and kodos
UPDATE `creature_template` SET `faction`=250, `unit_flags`=0, `ScriptName`='' WHERE  `entry`=11625;
UPDATE `creature_template` SET `faction`=250, `unit_flags`=0 WHERE  `entry` IN (11626, 11564);

DELETE FROM `creature_addon` WHERE  `guid`=28714;
DELETE FROM `creature_addon` WHERE  `guid`=27290;
DELETE FROM `creature_addon` WHERE  `guid`=28728;
DELETE FROM `creature_addon` WHERE  `guid`=27289;
DELETE FROM `creature_formations` WHERE `leaderGUID`=28714;

DELETE FROM `creature_text` WHERE `entry` IN (11625, 11626);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextId`) VALUES 
(11625, 0, 0, 'So sorry to leave a customer but we have places to go and people to swindle. We will be back sometime later today. Good-bye!', 12, 0, 100, 0, 0, 0, 'Cork Gizelton', 7505),
(11625, 1, 0, 'I am looking for some bodyguards that would like to protect the Gizelton Caravan. We are stopped on the road east of Kormek\'s Hut, north of Kolkar Centaur Village.', 14, 0, 100, 0, 0, 0, 'Cork Gizelton', 7474),
(11626, 0, 0, 'Time for the Gizleton Caravan to head on out! We\'ll be back soon but if you cannot wait, head north to Kormek\'s Hut. We open shop in about an hour', 12, 0, 100, 0, 0, 0,'Rigger Gizelton', 7506),
(11626, 1, 0, 'This is Rigger Gizelton asking for assistance escorting my caravan past Mannoroc Coven. I\'m on the road east of Shadowprey village.', 14, 0, 100, 0, 0, 0, 'Rigger Gizelton', 7475);

DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id IN(12245, 12246));
DELETE FROM creature WHERE id IN(12245, 12246);
DELETE FROM creature_addon WHERE guid IN(27289, 27290, 28714, 28728);
DELETE FROM creature WHERE id IN(11625, 11626, 11564) AND guid IN(27289, 27290, 28714, 28728);
UPDATE creature_template SET speed_walk=1, ScriptName='npc_cork_gizelton' WHERE entry=11625;
DELETE FROM creature where guid IN (28714, 27290, 28728, 27289);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(28714, 11625, 1, 1, 1, 11629, 1, -1290.56, 1230.96, 109.39, 6.27641, 300, 0, 0, 1604, 0, 0, 0, 0, 0);

UPDATE creature_template SET speed_walk=1.04 WHERE entry=11564;
UPDATE creature_template SET speed_walk=1.06, AIName='SmartAI' WHERE entry=11626;
DELETE FROM smart_scripts WHERE entryorguid=11626 AND source_type=0;
INSERT INTO smart_scripts VALUES (11626, 0, 0, 0, 19, 0, 100, 0, 5943, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 11625, 50, 0, 0, 0, 0, 0, 'On Quest Accept - Set data');
UPDATE `creature_template` SET `DamageModifier`=3 WHERE  `entry` IN (11625,11626,11564);
-- Ambush
UPDATE creature_template SET AIName='CombatAI' WHERE entry IN(12976, 12977, 4684);

DELETE FROM `script_waypoint` WHERE `entry`=11625;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES 
(11625, 1, -1290.31, 1231.38, 109.237, 0, 'Desolace Caravan'),
(11625, 2, -1277.59, 1225.54, 108.85, 0, 'Desolace Caravan'),
(11625, 3, -1264.86, 1219.71, 108.452, 0, 'Desolace Caravan'),
(11625, 4, -1230.04, 1204.31, 104.374, 0, 'Desolace Caravan'),
(11625, 5, -1216.17, 1206.24, 101.889, 0, 'Desolace Caravan'),
(11625, 6, -1202.32, 1208.28, 99.7026, 0, 'Desolace Caravan'),
(11625, 7, -1188.03, 1207.66, 97.2208, 0, 'Desolace Caravan'),
(11625, 8, -1170.99, 1195.93, 94.5615, 0, 'Desolace Caravan'),
(11625, 9, -1155.46, 1192.16, 92.4374, 0, 'Desolace Caravan'),
(11625, 10, -1127.52, 1190.39, 89.8358, 0, 'Desolace Caravan'),
(11625, 11, -1113.58, 1189.12, 89.7403, 0, 'Desolace Caravan'),
(11625, 12, -1070.8, 1186.15, 89.7403, 0, 'Desolace Caravan'),
(11625, 13, -1037.27, 1183.2, 89.8006, 0, 'Desolace Caravan'),
(11625, 14, -995.58, 1177.92, 89.7409, 0, 'Desolace Caravan'),
(11625, 15, -981.817, 1180.48, 89.8152, 0, 'Desolace Caravan'),
(11625, 16, -952.606, 1181.99, 89.7313, 0, 'Desolace Caravan'),
(11625, 17, -935.445, 1182.25, 91.2113, 0, 'Desolace Caravan'),
(11625, 18, -921.448, 1182.53, 93.1746, 0, 'Desolace Caravan'),
(11625, 19, -879.467, 1183.72, 97.6043, 0, 'Desolace Caravan'),
(11625, 20, -858.976, 1184.22, 99.0322, 0, 'Desolace Caravan'),
(11625, 21, -828.316, 1180.2, 99.6657, 0, 'Desolace Caravan'),
(11625, 22, -799.811, 1176, 99.3364, 0, 'Desolace Caravan'),
(11625, 23, -757.106, 1191.47, 96.9164, 0, 'Desolace Caravan'),
(11625, 24, -731.879, 1208.14, 92.6956, 0, 'Desolace Caravan'),
(11625, 25, -719.12, 1213.91, 91.3297, 0, 'Desolace Caravan'),
(11625, 26, -706.36, 1219.67, 90.2856, 0, 'Desolace Caravan'),
(11625, 27, -689.935, 1228.43, 89.4426, 0, 'Desolace Caravan'),
(11625, 28, -679.121, 1237.31, 89.17, 0, 'Desolace Caravan'),
(11625, 29, -661.434, 1247.28, 89.17, 0, 'Desolace Caravan'),
(11625, 30, -635.655, 1258.2, 89.2063, 0, 'Desolace Caravan'),
(11625, 31, -614.489, 1269.64, 89.1686, 0, 'Desolace Caravan'),
(11625, 32, -600.078, 1274.85, 89.1238, 0, 'Desolace Caravan'),
(11625, 33, -586.268, 1277.15, 89.145, 0, 'Desolace Caravan'),
(11625, 34, -546.297, 1287.15, 89.1597, 0, 'Desolace Caravan'),
(11625, 35, -541.257, 1300.21, 89.1602, 0, 'Desolace Caravan'),
(11625, 36, -536.026, 1313.2, 89.1314, 0, 'Desolace Caravan'),
(11625, 37, -525.098, 1338.97, 89.1005, 0, 'Desolace Caravan'),
(11625, 38, -518.852, 1356.12, 89.0827, 0, 'Desolace Caravan'),
(11625, 39, -516.879, 1395.56, 89.0827, 0, 'Desolace Caravan'),
(11625, 40, -518.905, 1436.25, 89.0696, 0, 'Desolace Caravan'),
(11625, 41, -525.605, 1446.54, 88.4907, 0, 'Desolace Caravan'),
(11625, 42, -543.459, 1462.9, 88.3752, 0, 'Desolace Caravan'),
(11625, 43, -557.591, 1471.17, 88.9477, 0, 'Desolace Caravan'),
(11625, 44, -584.698, 1478.14, 88.3754, 0, 'Desolace Caravan'),
(11625, 45, -598.459, 1480.72, 88.3754, 0, 'Desolace Caravan'),
(11625, 46, -632.084, 1491.03, 88.3754, 0, 'Desolace Caravan'),
(11625, 47, -644.249, 1497.95, 88.3754, 0, 'Desolace Caravan'),
(11625, 48, -660.456, 1507.56, 88.3874, 0, 'Desolace Caravan'),
(11625, 49, -666.507, 1504.7, 89.0746, 0, 'Desolace Caravan'),
(11625, 50, -673.795, 1499.48, 90.3922, 0, 'Desolace Caravan'),
(11625, 51, -692.154, 1480.43, 90.5302, 0, 'Desolace Caravan'),
(11625, 52, -710.764, 1470.11, 91.3034, 0, 'Desolace Caravan'),
(11625, 53, -697.048, 1484.75, 91.0929, 0, 'Desolace Caravan'),
(11625, 54, -676.552, 1497.37, 90.6505, 0, 'Desolace Caravan'),
(11625, 55, -665.209, 1505.76, 88.8321, 0, 'Desolace Caravan'),
(11625, 56, -657.898, 1510.94, 88.3752, 0, 'Desolace Caravan'),
(11625, 57, -647.387, 1501.69, 88.3752, 0, 'Desolace Caravan'),
(11625, 58, -630.597, 1491.17, 88.3752, 0, 'Desolace Caravan'),
(11625, 59, -603.756, 1483.26, 88.3752, 0, 'Desolace Caravan'),
(11625, 60, -576.573, 1476.54, 88.3752, 0, 'Desolace Caravan'),
(11625, 61, -556.868, 1470.92, 88.8685, 0, 'Desolace Caravan'),
(11625, 62, -547.471, 1464.89, 88.3747, 0, 'Desolace Caravan'),
(11625, 63, -529.316, 1449.97, 88.402, 0, 'Desolace Caravan'),
(11625, 64, -517.699, 1433.75, 89.0816, 0, 'Desolace Caravan'),
(11625, 65, -518.09, 1405.76, 89.0816, 0, 'Desolace Caravan'),
(11625, 66, -518.149, 1377.76, 89.0816, 0, 'Desolace Caravan'),
(11625, 67, -521.289, 1350.76, 89.0816, 0, 'Desolace Caravan'),
(11625, 68, -531.625, 1324.74, 89.1339, 0, 'Desolace Caravan'),
(11625, 69, -537.391, 1311.99, 89.1594, 0, 'Desolace Caravan'),
(11625, 70, -551.845, 1284.12, 89.1594, 0, 'Desolace Caravan'),
(11625, 71, -578.054, 1278.57, 89.1685, 0, 'Desolace Caravan'),
(11625, 72, -591.957, 1276.92, 89.1634, 0, 'Desolace Caravan'),
(11625, 73, -611.806, 1271.05, 89.1694, 0, 'Desolace Caravan'),
(11625, 74, -623.928, 1264.06, 89.1694, 0, 'Desolace Caravan'),
(11625, 75, -653.384, 1249.74, 89.1694, 0, 'Desolace Caravan'),
(11625, 76, -666.372, 1244.51, 89.1694, 0, 'Desolace Caravan'),
(11625, 77, -684.6, 1232.06, 89.2134, 0, 'Desolace Caravan'),
(11625, 78, -694.027, 1225.67, 89.6627, 0, 'Desolace Caravan'),
(11625, 79, -706.605, 1219.58, 90.2981, 0, 'Desolace Caravan'),
(11625, 80, -732.184, 1208.23, 92.7376, 0, 'Desolace Caravan'),
(11625, 81, -738.514, 1204.75, 93.8662, 0, 'Desolace Caravan'),
(11625, 82, -754.159, 1193.91, 96.6195, 0, 'Desolace Caravan'),
(11625, 83, -766.62, 1187.59, 97.8394, 0, 'Desolace Caravan'),
(11625, 84, -792.515, 1177.07, 98.8327, 0, 'Desolace Caravan'),
(11625, 85, -802.533, 1175.57, 99.4435, 0, 'Desolace Caravan'),
(11625, 86, -821.772, 1178.84, 99.6542, 0, 'Desolace Caravan'),
(11625, 87, -835.435, 1181.9, 99.6662, 0, 'Desolace Caravan'),
(11625, 88, -848.98, 1184.67, 99.5782, 0, 'Desolace Caravan'),
(11625, 89, -861.251, 1185.3, 98.8033, 0, 'Desolace Caravan'),
(11625, 90, -889.179, 1183.34, 96.6117, 0, 'Desolace Caravan'),
(11625, 91, -903.158, 1182.57, 95.2033, 0, 'Desolace Caravan'),
(11625, 92, -931.15, 1182.17, 91.8346, 0, 'Desolace Caravan'),
(11625, 93, -945.149, 1182.01, 89.8612, 0, 'Desolace Caravan'),
(11625, 94, -959.149, 1181.92, 89.7397, 0, 'Desolace Caravan'),
(11625, 95, -973.149, 1181.97, 89.7397, 0, 'Desolace Caravan'),
(11625, 96, -1001.65, 1178.06, 89.7398, 0, 'Desolace Caravan'),
(11625, 97, -1011.8, 1177.4, 89.7398, 0, 'Desolace Caravan'),
(11625, 98, -1033.08, 1182.29, 89.7629, 0, 'Desolace Caravan'),
(11625, 99, -1073.62, 1186.33, 89.7398, 0, 'Desolace Caravan'),
(11625, 100, -1101.59, 1187.56, 89.7398, 0, 'Desolace Caravan'),
(11625, 101, -1129.48, 1190.01, 89.8855, 0, 'Desolace Caravan'),
(11625, 102, -1143.44, 1191.11, 91.0344, 0, 'Desolace Caravan'),
(11625, 103, -1166.85, 1194.28, 93.9649, 0, 'Desolace Caravan'),
(11625, 104, -1184.71, 1203.56, 96.6406, 0, 'Desolace Caravan'),
(11625, 105, -1201.45, 1208.2, 99.5698, 0, 'Desolace Caravan'),
(11625, 106, -1225.42, 1204.68, 103.502, 0, 'Desolace Caravan'),
(11625, 107, -1235.55, 1206.75, 105.129, 0, 'Desolace Caravan'),
(11625, 108, -1261.05, 1218.25, 108.207, 0, 'Desolace Caravan'),
(11625, 109, -1286.64, 1229.58, 109.112, 0, 'Desolace Caravan'),
(11625, 110, -1306.84, 1233.21, 109.771, 0, 'Desolace Caravan'),
(11625, 111, -1331.25, 1233.54, 110.674, 0, 'Desolace Caravan'),
(11625, 112, -1350.02, 1227.22, 111.201, 0, 'Desolace Caravan'),
(11625, 113, -1389.37, 1212.53, 111.587, 0, 'Desolace Caravan'),
(11625, 114, -1415.8, 1202.23, 111.948, 0, 'Desolace Caravan'),
(11625, 115, -1424.26, 1196.81, 112.038, 0, 'Desolace Caravan'),
(11625, 116, -1449.27, 1188.13, 111.53, 0, 'Desolace Caravan'),
(11625, 117, -1474.53, 1186.42, 109.366, 0, 'Desolace Caravan'),
(11625, 118, -1491.78, 1189.4, 106.114, 0, 'Desolace Caravan'),
(11625, 119, -1502.95, 1198.12, 101.757, 0, 'Desolace Caravan'),
(11625, 120, -1512.09, 1209.44, 96.2469, 0, 'Desolace Caravan'),
(11625, 121, -1520.19, 1226.67, 89.7861, 0, 'Desolace Caravan'),
(11625, 122, -1522.75, 1243.63, 83.3864, 0, 'Desolace Caravan'),
(11625, 123, -1520.9, 1257.51, 77.7027, 0, 'Desolace Caravan'),
(11625, 124, -1518.48, 1273.17, 71.8991, 0, 'Desolace Caravan'),
(11625, 125, -1516.17, 1290.94, 66.8473, 0, 'Desolace Caravan'),
(11625, 126, -1514.74, 1306.19, 63.4211, 0, 'Desolace Caravan'),
(11625, 127, -1511.54, 1328.73, 60.2051, 0, 'Desolace Caravan'),
(11625, 128, -1505.75, 1341.47, 59.2142, 0, 'Desolace Caravan'),
(11625, 129, -1494.42, 1367.08, 58.9254, 0, 'Desolace Caravan'),
(11625, 130, -1485.84, 1393.02, 58.9251, 0, 'Desolace Caravan'),
(11625, 131, -1485.47, 1407, 58.9469, 0, 'Desolace Caravan'),
(11625, 132, -1487.57, 1434.84, 58.9347, 0, 'Desolace Caravan'),
(11625, 133, -1489.45, 1448.71, 58.9302, 0, 'Desolace Caravan'),
(11625, 134, -1489.77, 1469.49, 58.9251, 0, 'Desolace Caravan'),
(11625, 135, -1483.8, 1482.15, 58.9251, 0, 'Desolace Caravan'),
(11625, 136, -1471.32, 1507.22, 58.9251, 0, 'Desolace Caravan'),
(11625, 137, -1464.94, 1519.68, 58.9251, 0, 'Desolace Caravan'),
(11625, 138, -1452.27, 1544.64, 58.9251, 0, 'Desolace Caravan'),
(11625, 139, -1442.94, 1584.75, 58.9255, 0, 'Desolace Caravan'),
(11625, 140, -1452.7, 1610.98, 58.9255, 0, 'Desolace Caravan'),
(11625, 141, -1464.1, 1641.7, 58.9255, 0, 'Desolace Caravan'),
(11625, 142, -1474.86, 1647.49, 58.9255, 0, 'Desolace Caravan'),
(11625, 143, -1500.84, 1657.91, 58.9255, 0, 'Desolace Caravan'),
(11625, 144, -1521.76, 1671.96, 58.9255, 0, 'Desolace Caravan'),
(11625, 145, -1541.37, 1691.94, 58.9255, 0, 'Desolace Caravan'),
(11625, 146, -1551.2, 1701.92, 58.9255, 0, 'Desolace Caravan'),
(11625, 147, -1571.41, 1721.29, 58.9255, 0, 'Desolace Caravan'),
(11625, 148, -1592.97, 1739.14, 58.9255, 0, 'Desolace Caravan'),
(11625, 149, -1613.28, 1758.07, 58.9255, 0, 'Desolace Caravan'),
(11625, 150, -1630.32, 1780.27, 58.9255, 0, 'Desolace Caravan'),
(11625, 151, -1645.92, 1803.52, 58.9296, 0, 'Desolace Caravan'),
(11625, 152, -1661.7, 1826.65, 58.9271, 0, 'Desolace Caravan'),
(11625, 153, -1681.42, 1858.29, 58.9271, 0, 'Desolace Caravan'),
(11625, 154, -1686.38, 1877.21, 59.2059, 0, 'Desolace Caravan'),
(11625, 155, -1692.06, 1899.02, 60.7504, 0, 'Desolace Caravan'),
(11625, 156, -1699.45, 1908.31, 61.1412, 0, 'Desolace Caravan'),
(11625, 157, -1717, 1915.93, 60.0908, 0, 'Desolace Caravan'),
(11625, 158, -1738.04, 1917.48, 59.0673, 0, 'Desolace Caravan'),
(11625, 159, -1757.16, 1918.92, 58.9757, 0, 'Desolace Caravan'),
(11625, 160, -1772.71, 1926.58, 59.1537, 0, 'Desolace Caravan'),
(11625, 161, -1791.81, 1939.62, 60.7298, 0, 'Desolace Caravan'),
(11625, 162, -1802.7, 1951.89, 60.7237, 0, 'Desolace Caravan'),
(11625, 163, -1809.79, 1963.96, 59.7477, 0, 'Desolace Caravan'),
(11625, 164, -1815.2, 1976.74, 59.0006, 0, 'Desolace Caravan'),
(11625, 165, -1817.51, 2008.7, 59.5336, 0, 'Desolace Caravan'),
(11625, 166, -1823, 2032.7, 60.6767, 0, 'Desolace Caravan'),
(11625, 167, -1821.87, 2042.21, 60.944, 0, 'Desolace Caravan'),
(11625, 168, -1813.14, 2068.68, 63.0096, 0, 'Desolace Caravan'),
(11625, 169, -1810.52, 2082.43, 63.114, 0, 'Desolace Caravan'),
(11625, 170, -1806.9, 2095.9, 63.1144, 0, 'Desolace Caravan'),
(11625, 171, -1802.03, 2111.56, 63.6862, 0, 'Desolace Caravan'),
(11625, 172, -1802.03, 2111.56, 63.6862, 0, 'Desolace Caravan'),
(11625, 173, -1801.53, 2141.07, 63.006, 0, 'Desolace Caravan'),
(11625, 174, -1801.53, 2141.07, 63.006, 0, 'Desolace Caravan'),
(11625, 175, -1802.25, 2155.05, 61.5195, 0, 'Desolace Caravan'),
(11625, 176, -1803.02, 2183.03, 59.8215, 0, 'Desolace Caravan'),
(11625, 177, -1808.36, 2207.2, 59.8215, 0, 'Desolace Caravan'),
(11625, 178, -1822.66, 2219.86, 59.8215, 0, 'Desolace Caravan'),
(11625, 179, -1836.76, 2232.87, 59.8215, 0, 'Desolace Caravan'),
(11625, 180, -1843.44, 2245.11, 59.8215, 0, 'Desolace Caravan'),
(11625, 181, -1844.75, 2266.9, 59.8215, 0, 'Desolace Caravan'),
(11625, 182, -1846.34, 2280.81, 59.8215, 0, 'Desolace Caravan'),
(11625, 183, -1849.89, 2294.13, 59.8215, 0, 'Desolace Caravan'),
(11625, 184, -1864.58, 2316.31, 59.8215, 0, 'Desolace Caravan'),
(11625, 185, -1872.72, 2327.7, 59.8224, 0, 'Desolace Caravan'),
(11625, 186, -1884.98, 2346.82, 59.8224, 0, 'Desolace Caravan'),
(11625, 187, -1887.2, 2354.3, 59.8696, 0, 'Desolace Caravan'),
(11625, 188, -1893.87, 2379.11, 59.9196, 0, 'Desolace Caravan'),
(11625, 189, -1900.07, 2391.67, 59.8224, 0, 'Desolace Caravan'),
(11625, 190, -1904, 2405.04, 59.8224, 0, 'Desolace Caravan'),
(11625, 191, -1904, 2405.04, 59.8224, 0, 'Desolace Caravan'),
(11625, 192, -1895.71, 2431.78, 59.8224, 0, 'Desolace Caravan'),
(11625, 193, -1888.72, 2458.89, 59.8224, 0, 'Desolace Caravan'),
(11625, 194, -1895.4, 2432.5, 59.8224, 0, 'Desolace Caravan'),
(11625, 195, -1899.03, 2418.98, 59.8224, 0, 'Desolace Caravan'),
(11625, 196, -1899.68, 2393.35, 59.8224, 0, 'Desolace Caravan'),
(11625, 197, -1892.03, 2375.61, 59.9178, 0, 'Desolace Caravan'),
(11625, 198, -1885.29, 2346.94, 59.8216, 0, 'Desolace Caravan'),
(11625, 199, -1881.12, 2339.05, 59.8216, 0, 'Desolace Caravan'),
(11625, 200, -1864.4, 2316.59, 59.8226, 0, 'Desolace Caravan'),
(11625, 201, -1852.79, 2300.12, 59.8226, 0, 'Desolace Caravan'),
(11625, 202, -1847.08, 2287.99, 59.8226, 0, 'Desolace Caravan'),
(11625, 203, -1844.34, 2264.2, 59.8226, 0, 'Desolace Caravan'),
(11625, 204, -1842.38, 2243.22, 59.8226, 0, 'Desolace Caravan'),
(11625, 205, -1840.11, 2237.75, 59.8226, 0, 'Desolace Caravan'),
(11625, 206, -1830.64, 2226.2, 59.8226, 0, 'Desolace Caravan'),
(11625, 207, -1810.22, 2209.43, 59.8226, 0, 'Desolace Caravan'),
(11625, 208, -1802.8, 2194.02, 59.8226, 0, 'Desolace Caravan'),
(11625, 209, -1800.41, 2180.08, 59.8226, 0, 'Desolace Caravan'),
(11625, 210, -1800.26, 2166.08, 60.1822, 0, 'Desolace Caravan'),
(11625, 211, -1801.62, 2148.85, 62.344, 0, 'Desolace Caravan'),
(11625, 212, -1801.15, 2134.86, 63.1766, 0, 'Desolace Caravan'),
(11625, 213, -1802.26, 2110.11, 63.6737, 0, 'Desolace Caravan'),
(11625, 214, -1805.87, 2096.6, 63.1784, 0, 'Desolace Caravan'),
(11625, 215, -1809.25, 2083.01, 63.0772, 0, 'Desolace Caravan'),
(11625, 216, -1812.63, 2069.43, 63.043, 0, 'Desolace Caravan'),
(11625, 217, -1816.72, 2056.04, 61.8496, 0, 'Desolace Caravan'),
(11625, 218, -1822.89, 2032.23, 60.6524, 0, 'Desolace Caravan'),
(11625, 219, -1822.76, 2027.39, 60.3783, 0, 'Desolace Caravan'),
(11625, 220, -1815.56, 2003.46, 59.4022, 0, 'Desolace Caravan'),
(11625, 221, -1814.41, 1983.18, 58.9549, 0, 'Desolace Caravan'),
(11625, 222, -1811.8, 1967.01, 59.4735, 0, 'Desolace Caravan'),
(11625, 223, -1803.12, 1951.78, 60.7154, 0, 'Desolace Caravan'),
(11625, 224, -1793.24, 1941.87, 60.8439, 0, 'Desolace Caravan'),
(11625, 225, -1775.92, 1926.82, 59.3033, 0, 'Desolace Caravan'),
(11625, 226, -1759.93, 1918.92, 58.9613, 0, 'Desolace Caravan'),
(11625, 227, -1751.9, 1917.2, 59.0003, 0, 'Desolace Caravan'),
(11625, 228, -1737.91, 1917.04, 59.0673, 0, 'Desolace Caravan'),
(11625, 229, -1712.18, 1914.85, 60.4394, 0, 'Desolace Caravan'),
(11625, 230, -1701.72, 1911.02, 61.0949, 0, 'Desolace Caravan'),
(11625, 231, -1694.06, 1904.03, 61.03, 0, 'Desolace Caravan'),
(11625, 232, -1687.1, 1886.34, 59.7501, 0, 'Desolace Caravan'),
(11625, 233, -1684.12, 1872.66, 59.0354, 0, 'Desolace Caravan'),
(11625, 234, -1673.14, 1845.28, 58.9273, 0, 'Desolace Caravan'),
(11625, 235, -1657.63, 1821.97, 58.9273, 0, 'Desolace Caravan'),
(11625, 236, -1649.83, 1810.34, 58.9273, 0, 'Desolace Caravan'),
(11625, 237, -1634.24, 1787.08, 58.9252, 0, 'Desolace Caravan'),
(11625, 238, -1626.45, 1775.45, 58.9252, 0, 'Desolace Caravan'),
(11625, 239, -1605.77, 1750.66, 58.9256, 0, 'Desolace Caravan'),
(11625, 240, -1594.91, 1741.83, 58.9256, 0, 'Desolace Caravan'),
(11625, 241, -1573.31, 1724.02, 58.9256, 0, 'Desolace Caravan'),
(11625, 242, -1553.4, 1704.35, 58.9256, 0, 'Desolace Caravan'),
(11625, 243, -1543.67, 1694.29, 58.9256, 0, 'Desolace Caravan'),
(11625, 244, -1523.39, 1674.99, 58.9256, 0, 'Desolace Caravan'),
(11625, 245, -1505.1, 1659.98, 58.9256, 0, 'Desolace Caravan'),
(11625, 246, -1489.89, 1652.47, 58.9256, 0, 'Desolace Caravan'),
(11625, 247, -1460.15, 1634.27, 58.9256, 0, 'Desolace Caravan'),
(11625, 248, -1453.16, 1621.35, 58.9256, 0, 'Desolace Caravan'),
(11625, 249, -1446.87, 1598.31, 58.9256, 0, 'Desolace Caravan'),
(11625, 250, -1440.81, 1573.28, 58.9256, 0, 'Desolace Caravan'),
(11625, 251, -1445.9, 1553.99, 58.9256, 0, 'Desolace Caravan'),
(11625, 252, -1451.91, 1541.35, 58.9256, 0, 'Desolace Caravan'),
(11625, 253, -1458.46, 1528.97, 58.9256, 0, 'Desolace Caravan'),
(11625, 254, -1471.62, 1504.26, 58.9256, 0, 'Desolace Caravan'),
(11625, 255, -1478.08, 1491.84, 58.9256, 0, 'Desolace Caravan'),
(11625, 256, -1490.08, 1466.54, 58.9256, 0, 'Desolace Caravan'),
(11625, 257, -1491.71, 1455.14, 58.9291, 0, 'Desolace Caravan'),
(11625, 258, -1488.22, 1427.36, 58.9348, 0, 'Desolace Caravan'),
(11625, 259, -1486.41, 1413.48, 58.9418, 0, 'Desolace Caravan'),
(11625, 260, -1487.62, 1388.44, 58.9251, 0, 'Desolace Caravan'),
(11625, 261, -1491.84, 1375.08, 58.9301, 0, 'Desolace Caravan'),
(11625, 262, -1502.72, 1349.31, 58.9416, 0, 'Desolace Caravan'),
(11625, 263, -1508.49, 1336.58, 59.525, 0, 'Desolace Caravan'),
(11625, 264, -1511.68, 1327.41, 60.3754, 0, 'Desolace Caravan'),
(11625, 265, -1514.03, 1314.22, 62.0185, 0, 'Desolace Caravan'),
(11625, 266, -1514.79, 1300.27, 64.5471, 0, 'Desolace Caravan'),
(11625, 267, -1516.1, 1286.34, 68.0841, 0, 'Desolace Caravan'),
(11625, 268, -1518.52, 1272.55, 72.0932, 0, 'Desolace Caravan'),
(11625, 269, -1523.17, 1245.16, 82.7876, 0, 'Desolace Caravan'),
(11625, 270, -1522.5, 1234.75, 87.008, 0, 'Desolace Caravan'),
(11625, 271, -1517.95, 1221.51, 91.5343, 0, 'Desolace Caravan'),
(11625, 272, -1511.76, 1208.2, 96.7403, 0, 'Desolace Caravan'),
(11625, 273, -1501.33, 1196.53, 102.475, 0, 'Desolace Caravan'),
(11625, 274, -1490.76, 1188.95, 106.376, 0, 'Desolace Caravan'),
(11625, 275, -1475.92, 1185.48, 109.181, 0, 'Desolace Caravan'),
(11625, 276, -1452.6, 1187.95, 111.422, 0, 'Desolace Caravan'),
(11625, 277, -1433.28, 1193.58, 111.857, 0, 'Desolace Caravan'),
(11625, 278, -1414.55, 1203.63, 111.886, 0, 'Desolace Caravan'),
(11625, 279, -1388.31, 1213.37, 111.599, 0, 'Desolace Caravan'),
(11625, 280, -1375.11, 1218.03, 111.465, 0, 'Desolace Caravan'),
(11625, 281, -1348.49, 1226.69, 111.175, 0, 'Desolace Caravan'),
(11625, 282, -1319.41, 1232.27, 110.201, 0, 'Desolace Caravan');

-- The Northern Pylon -- http://www.wowhead.com/quest=24722/the-northern-pylon
UPDATE `smart_scripts` SET `action_type`=26 WHERE  `entryorguid` IN (164956, 164957, 164955) AND `source_type`=1 AND `id`=0 AND `link`=0;

-- Escape Through Force / Volcor -- http://www.wowhead.com/quest=994/escape-through-force
-- Volcor SAI
SET @ENTRY := 3692;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,994,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Volcor - On Quest 'Escape Through Force' Taken - Run Script"),
(@ENTRY,0,1,0,19,0,100,0,995,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Volcor - On Quest 'Escape Through Stealth' Taken - Run Script"),
(@ENTRY,0,2,0,40,0,100,0,15,3692,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Volcor - On Waypoint 15 Reached - Despawn Instant"),
(@ENTRY,0,3,0,4,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Volcor - On Aggro - Say Line 1");

-- Actionlist SAI
SET @ENTRY := 369200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Volcor - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,53,0,3692,0,0,0,2,1,0,0,0,0,0,0,0,"Volcor - On Script - Start Waypoint"),
(@ENTRY,9,2,0,0,0,100,0,110000,110000,0,0,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,"Volcor - On Script - Say Line 2"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,15,994,0,0,0,0,0,17,0,30,0,0,0,0,0,"Volcor - On Script - Quest Credit 'Escape Through Force'");

-- Actionlist SAI
SET @ENTRY := 369201;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,3,0,0,0,0,0,0,"Volcor - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,53,0,3692,0,0,0,2,1,0,0,0,0,0,0,0,"Volcor - On Script - Start Waypoint"),
(@ENTRY,9,2,0,0,0,100,0,110000,110000,0,0,1,3,0,0,0,0,0,7,0,0,0,0,0,0,0,"Volcor - On Script - Say Line 3"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,15,995,0,0,0,0,0,17,0,30,0,0,0,0,0,"Volcor - On Script - Quest Credit 'Escape Through Stealth'");

-- DB/Quest: A lost Master -- http://www.wowhead.com/quest=986/a-lost-master
-- Terenthis SAI
SET @ENTRY := 3693;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,2,0,20,0,100,0,986,0,0,0,80,@ENTRY*100+02,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Quest 'A Lost Master' Finished - Run Script");

DELETE FROM `creature_text` WHERE `entry`=3693 AND `groupid`>=8;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3693, 8, 0, 'What was that noise? It sounded like a roar.!', 12, 0, 100, 1, 0, 0, 'Terenthis'), 
(3693, 9, 0, 'Grimclaw? Easy there, my friend... where is your master Volcor?', 12, 0, 100, 1, 0, 0, 'Terenthis'), 
(3693, 10, 0, 'Whoa, whoa there, my friend. One moment...', 12, 0, 100, 1, 0, 0, 'Terenthis'), 
(3693, 11, 0, '%s begins to cast a spell on Grimclaw.', 16, 0, 100, 1, 0, 0, 'Terenthis'), 
(3693, 12, 0, 'There... that should help. Now, tell me what''s happened, Grimclaw.', 12, 0, 100, 1, 0, 0, 'Terenthis'), 
(3693, 13, 0, 'I understand, my friend. I shall find someone to help your master. Go back to him now, or at least stay close.', 12, 0, 100, 1, 0, 0, 'Terenthis'), 
(3693, 14, 0, 'If you have the time, Grimclaw and his master Volcor could use your help. If you''re interested, speak with me further...', 12, 0, 100, 1, 0, 0, 'Terenthis'); 

DELETE FROM `creature_text` WHERE `entry`=3695 AND `groupid`>=1;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3695, 1, 0, '%s roars at Terenthis to get his attention.', 16, 0, 100, 1, 0, 0, 'Grimclaw'), 
(3695, 2, 0, '%s begins to moan and roar at Terenthis while stomping his paws on the ground.', 16, 0, 100, 1, 0, 0, 'Grimclaw'),
(3695, 3, 0, '%s roars at Terenthis more, but this time the druid seems to understand the bear.', 16, 0, 100, 1, 0, 0, 'Grimclaw'), 
(3695, 4, 0, '%s roars in acknowledgement at Terenthis.', 16, 0, 100, 1, 0, 0, 'Grimclaw'); 

-- Grimclaw SAI
SET @ENTRY := 3695;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimclaw - Received Emote 101 - Say Line 0"),
(@ENTRY,0,1,0,63,0,100,0,0,0,0,0,80,@ENTRY*100+02,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimclaw - On Just Summoned - Run Script");

-- Actionlist SAI
SET @ENTRY := 369502;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimclaw - On Script - Set Run Off"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,6437.702148,368.423737,13.939653,4.166484,"Grimclaw - On Script - Move To Position"),
(@ENTRY,9,2,0,0,0,100,0,8000,8000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.3688,"Grimclaw - On Script - Set Orientation 4,3688"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimclaw - On Script - Say Line 1"),
(@ENTRY,9,4,0,0,0,100,0,43000,43000,0,0,69,0,0,0,0,0,0,8,0,0,0,6427.02,404.78,11.031,5.1137,"Grimclaw - On Script - Move To Position");

-- Actionlist SAI
SET @ENTRY := 369302;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,3695,3,56000,0,0,0,8,0,0,0,6432.260254,388.354980,13.836236,5.046920,"Terenthis - On Script - Summon Creature 'Grimclaw'"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Say Line 8"),
(@ENTRY,9,2,0,0,0,100,0,10000,10000,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Say Line 9"),
(@ENTRY,9,3,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,19,3695,20,0,0,0,0,0,"Terenthis - On Script - Say Line 2"),
(@ENTRY,9,4,0,0,0,100,0,5000,5000,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Say Line 10"),
(@ENTRY,9,5,0,0,0,100,0,5000,5000,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Say Line 11"),
(@ENTRY,9,6,0,0,0,100,0,1000,1000,0,0,11,6238,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Cast 'Speak with Animals'"),
(@ENTRY,9,7,0,0,0,100,0,4000,4000,0,0,1,12,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Say Line 12"),
(@ENTRY,9,8,0,0,0,100,0,5000,5000,0,0,1,3,0,0,0,0,0,19,3695,20,0,0,0,0,0,"Terenthis - On Script - Say Line 3"),
(@ENTRY,9,9,0,0,0,100,0,5000,5000,0,0,1,13,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Say Line 13"),
(@ENTRY,9,10,0,0,0,100,0,5000,5000,0,0,1,4,0,0,0,0,0,19,3695,20,0,0,0,0,0,"Terenthis - On Script - Say Line 4"),
(@ENTRY,9,11,0,0,0,100,0,5000,5000,0,0,1,14,0,0,0,0,0,1,0,0,0,0,0,0,0,"Terenthis - On Script - Say Line 14");

-- DB/Quest: Cave Mushrooms -- http://www.wowhead.com/quest=947/cave-mushrooms
-- Barithras Moonshade SAI
SET @ENTRY := 3583;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,947,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Barithras Moonshade - On Quest 'Cave Mushrooms' Taken - Run Script");

-- Actionlist SAI
SET @ENTRY := 358300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,21,20,0,0,0,0,0,0,"On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 2"),
(@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1");

DELETE FROM `creature_text` WHERE `entry`=3583;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3583, 0, 0, 'Thank you, $N. And luck to you.', 12, 0, 100, 0, 0, 0, 'Barithras Moonshade'), 
(3583, 1, 0, 'Cliffspring Falls lies along the mountains to the east and north.', 12, 0, 100, 0, 0, 0, 'Barithras Moonshade'); 

-- DB/Quest: Forsaken Aid -- http://www.wowhead.com/quest=1064/deprecated-forsaken-aid
-- Magatha Grimtotem SAI
SET @ENTRY := 4046;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,1063,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Magatha Grimtotem - On Quest 'The Elder Crone' Finished - Run Script"),
(@ENTRY,0,1,0,19,0,100,0,1064,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Magatha Grimtotem - On Quest 'Forsaken Aid' Taken - Run Script");

-- Actionlist SAI
SET @ENTRY := 404601;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,11,6657,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Cast 'Summon Serpent Messenger'"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,12,4068,3,433000,0,0,0,8,0,0,0,-1067.22,-213.737,160.473,5.25037,"On Script - Summon Creature 'Serpent Messenger'"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Play Emote 25");

DELETE FROM `creature_text` WHERE `entry`=4046 AND `groupid`>=2;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4046, 2, 0, '%s summons a messenger...', 16, 0, 100, 0, 0, 0, 'Magatha Grimtotem'), 
(4046, 3, 0, 'Go, my servant. Send word of Stonetalon to Apothecary Zamah.', 12, 0, 100, 0, 0, 0, 'Magatha Grimtotem'); 

DELETE FROM `creature_text` WHERE `entry`=4068;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(4068, 0, 0, '%s gives message to Apothecary Zamah.', 16, 0, 100, 0, 0, 0, 'Serpent Messenger'); 

DELETE FROM `creature_text` WHERE `entry`=3419 AND `groupid`=2;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(3419, 2, 0, '%s gives message to Apothecary Zamah.', 16, 0, 100, 0, 0, 0, 'apo'); 

-- Serpent Messenger SAI
SET @ENTRY := 4068;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,3,54,0,100,0,0,0,0,0,53,1,4068,0,0,0,0,1,0,0,0,0,0,0,0,"Serpent Messenger - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,0,40,0,100,0,1,4068,0,0,54,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Serpent Messenger - On Waypoint 1 Reached - Pause Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,36,4068,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Serpent Messenger - On Waypoint 36 Reached - Run Script"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Serpent Messenger - On Just Summoned - Set Active On");
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=4068;

-- Actionlist SAI
SET @ENTRY := 406800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Serpent Messenger - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Serpent Messenger - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,6000,6000,0,0,1,2,0,0,0,0,0,19,3419,2,0,0,0,0,0,"Serpent Messenger - On Script - Say Line 2"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Serpent Messenger - On Script - Despawn Instant");

DELETE FROM `waypoints` WHERE `entry`=4068;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`) VALUES 
(4068, 1, -1067.22, -213.737, 160.473),
(4068, 2, -1062.56, -221.981, 160.294),
(4068, 3, -1054.61, -221.248, 161.894),
(4068, 4, -1054.61, -221.248, 161.894),
(4068, 5, -1037.05, -191.12, 158.949),
(4068, 6, -1053.12, -173.969, 163.214),
(4068, 7, -1064.46, -140.953, 161.368),
(4068, 8, -1079.25, -97.1617, 156.371),
(4068, 9, -1085.39, -64.6974, 164.416),
(4068, 10, -1083.91, -26.7695, 159.369),
(4068, 11, -1084.44, -9.29896, 158.034),
(4068, 12, -1109.66, 7.02863, 154.732),
(4068, 13, -1132.07, 31.5715, 158.157),
(4068, 14, -1129.02, 47.1316, 154.19),
(4068, 15, -1095.17, 63.5461, 150.752),
(4068, 16, -1086.83, 113.827, 144.557),
(4068, 17, -1113.2, 129.364, 140.268),
(4068, 18, -1146.35, 119.028, 141.776),
(4068, 19, -1169.85, 118.638, 141.101),
(4068, 20, -1206.75, 117.618, 139.861),
(4068, 21, -1211.53, 129.623, 135.559),
(4068, 22, -1192.52, 144.921, 136.995),
(4068, 23, -1175.37, 157.22, 146.484),
(4068, 24, -1155.67, 169.875, 146.074),
(4068, 25, -1127.05, 179.696, 131.79),
(4068, 26, -1096.04, 189.663, 118.055),
(4068, 27, -1061.46, 191.502, 109.917),
(4068, 28, -1056.64, 215.227, 113.473),
(4068, 29, -1046.91, 223.356, 114.831),
(4068, 30, -1035.35, 218.46, 112.371),
(4068, 31, -1027.93, 217.483, 114.236),
(4068, 32, -1023.41, 229.152, 108.92),
(4068, 33, -1016.34, 236.136, 109.243),
(4068, 34, -1013.08, 246.142, 108.77),
(4068, 35, -1006.87, 255.833, 113.284),
(4068, 36, -997.047, 275.161, 112.343);

-- DB/Quest: Vyletongue Corruption -- http://wotlk.openwow.com/?quest=7041
-- Talendria SAI
SET @ENTRY := 11715;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,7041,0,0,0,1,0,0,0,0,0,0,21,20,0,0,0,0,0,0,"Talendria - On Quest 'Vyletongue Corruption' Taken - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=11715;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(11715, 0, 0, '$N, please take a look at the sample of the Vylestem vine that I took from the caverns, so that you know what to look for...', 12, 0, 100, 0, 0, 0, 'Talendria');

-- Return to Troyas -- http://wotlk.openwow.com/?quest=2943
-- Troyas Moonbreeze SAI
SET @ENTRY := 7764;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,2943,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Troyas Moonbreeze - On Quest 'Return to Troyas' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 776400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Troyas Moonbreeze - On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Troyas Moonbreeze - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,-4476.23,3230.55,13.7301,4.20931,"Troyas Moonbreeze - On Script - Move To Position"),
(@ENTRY,9,3,0,0,0,100,0,2000,2000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.99471,"Troyas Moonbreeze - On Script - Set Orientation 4,99471"),
(@ENTRY,9,4,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Troyas Moonbreeze - On Script - Say Line 1"),
(@ENTRY,9,5,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,21,50,0,0,0,0,0,0,"Troyas Moonbreeze - On Script - Say Line 2"),
(@ENTRY,9,6,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,-4474.9,3232.88,13.7295,0.951991,"Troyas Moonbreeze - On Script - Move To Position");

DELETE FROM `creature_text` WHERE `entry`=7764;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(7764, 0, 0, 'A History... Hmmmm... Let me examine this for a moment.', 12, 0, 100, 0, 0, 0, 4039, 'Troyas Moonbreeze'),
(7764, 1, 0, '%s skims the pages of the book.', 16, 0, 100, 0, 0, 0, 4040, 'Troyas Moonbreeze'),
(7764, 2, 0, 'Amazing! I think I have found it, $n!', 12, 0, 100, 0, 0, 0, 4041, 'Troyas Moonbreeze');

-- Making Sense of It -- http://wotlk.openwow.com/?quest=4321
-- J.D. Collie SAI
SET @ENTRY := 9117;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,4321,0,0,0,80,@ENTRY*100+00,0,2,0,0,0,1,0,0,0,0,0,0,0,"J.D. Collie - On Quest 'Making Sense of It' Taken - Run Script"),
(@ENTRY,0,1,0,20,0,100,0,4321,0,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"J.D. Collie - On Quest 'Making Sense of It' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 911701;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Run Off"),
(@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,50,174683,20,0,0,0,0,8,0,0,0,-6034.46,-1014.57,-216.735,6.07572,"On Script - Summon Gameobject 'J.D.'s Manual'"),
(@ENTRY,9,3,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 1"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.36912,"On Script - Set Orientation 2,36912"),
(@ENTRY,9,5,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Say Line 2"),
(@ENTRY,9,6,0,0,0,100,0,4000,4000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.872665,"On Script - Set Orientation 0,872665"),
(@ENTRY,9,7,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,21,50,0,0,0,0,0,0,"On Script - Say Line 3"),
(@ENTRY,9,8,0,0,0,100,0,1000,1000,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Active Off");

DELETE FROM `creature_text` WHERE `entry`=9117 AND `groupid`>=1;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(9117, 1, 0, 'Now, let''s see... If I am correct, then... Hmmm...', 12, 0, 100, 0, 0, 0, 5287, 'J.D. Collie'),
(9117, 2, 0, 'Blue plus red... I predict...', 12, 0, 100, 0, 0, 0, 5288, 'J.D. Collie'),
(9117, 3, 0, '$n, that''s it! I have finally figured it out!', 12, 0, 100, 0, 0, 0, 5289, 'J.D. Collie');

-- Quest:Ancient Spirit -- http://wotlk.openwow.com/quest=4261
UPDATE `quest_template_addon` SET `SpecialFlags`=2 WHERE  `ID`=4261;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=15033;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`,`NegativeCondition`) VALUES
(17,0,15033,0,0,29,0,9598,100,0,0,"","Cannot cast Summon Ancient Spirits near Arei",1);

DELETE FROM `script_waypoint` WHERE entry=9598;
INSERT INTO `script_waypoint` VALUES
(9598, 0, 6004.265, -1180.494, 376.377, 0, 'Arei SAY_ESCORT_START'),
(9598, 1, 6002.512, -1157.294, 381.407, 0, 'Arei'),
(9598, 2, 6029.228, -1139.720, 383.127, 0, 'Arei'),
(9598, 3, 6042.479, -1128.963, 386.582, 0, 'Arei'),
(9598, 4, 6062.820, -1115.522, 386.850, 0, 'Arei'),
(9598, 5, 6089.188, -1111.907, 383.105, 0, 'Arei'),
(9598, 6, 6104.390, -1114.561, 380.490, 0, 'Arei'),
(9598, 7, 6115.080, -1128.572, 375.779, 0, 'Arei'),
(9598, 8, 6119.352, -1147.314, 372.518, 0, 'Arei'),
(9598, 9, 6119.003, -1176.082, 371.072, 0, 'Arei'),
(9598, 10, 6120.982, -1198.408, 373.432, 0, 'Arei'),
(9598, 11, 6123.521, -1226.636, 374.119, 0, 'Arei'),
(9598, 12, 6127.737, -1246.035, 373.574, 0, 'Arei'),
(9598, 13, 6133.433, -1253.642, 369.100, 0, 'Arei'),
(9598, 14, 6150.787, -1269.151, 369.240, 0, 'Arei'),
(9598, 15, 6155.805, -1275.029, 373.627, 0, 'Arei'),
(9598, 16, 6163.544, -1307.130, 376.234, 0, 'Arei'),
(9598, 17, 6174.800, -1340.885, 379.039, 0, 'Arei'),
(9598, 18, 6191.144, -1371.260, 378.453, 0, 'Arei'),
(9598, 19, 6215.652, -1397.517, 376.012, 0, 'Arei'),
(9598, 20, 6243.784, -1407.675, 371.594, 0, 'Arei'),
(9598, 21, 6280.775, -1408.259, 370.554, 0, 'Arei'),
(9598, 22, 6325.360, -1406.688, 370.082, 0, 'Arei'),
(9598, 23, 6355.000, -1404.337, 370.646, 0, 'Arei'),
(9598, 24, 6374.679, -1399.176, 372.105, 0, 'Arei'),
(9598, 25, 6395.803, -1367.057, 374.910, 0, 'Arei'),
(9598, 26, 6408.569, -1333.487, 376.616, 0, 'Arei'),
(9598, 27, 6409.075, -1312.168, 379.598, 0, 'Arei'),
(9598, 28, 6418.689, -1277.697, 381.638, 0, 'Arei'),
(9598, 29, 6441.689, -1247.316, 387.246, 0, 'Arei'),
(9598, 30, 6462.136, -1226.316, 397.610, 0, 'Arei'),
(9598, 31, 6478.021, -1216.260, 408.284, 0, 'Arei'),
(9598, 32, 6499.632, -1217.087, 419.461, 0, 'Arei'),
(9598, 33, 6523.165, -1220.780, 430.549, 0, 'Arei'),
(9598, 34, 6542.716, -1216.997, 437.788, 0, 'Arei'),
(9598, 35, 6557.279, -1211.125, 441.452, 0, 'Arei'),
(9598, 36, 6574.568, -1204.589, 443.216, 900000, 'SAY_EXIT_IRONTREE');

DELETE FROM `creature_text` WHERE `entry`=9598;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(9598, 0, 0, 'Please, help me to get through this cursed forest, $r.', 12, 0, 100, 0, 0, 0, 5004, 'arei SAY_AREI_ESCORT_START'),
(9598, 1, 0, 'This creature suffers from the effects of the fel... We must end its misery.', 12, 0, 100, 0, 0, 0, 5474, 'arei SAY_ATTACK_TOXIC_HORROR'),
(9598, 2, 0, 'The corruption of the fel has not left any of the creatures of Felwood untouched, $n. Please, be on your guard.', 12, 0, 100, 0, 0, 0, 5005, 'arei SAY_ATTACK_TOXIC_HORROR'),
(9598, 3, 0, 'I sense the taint of corruption upon this $n. Help me destroy it!', 12, 0, 100, 0, 0, 0, 5473, 'arei SAY_EXIT_WOODS'),
(9598, 4, 0, 'That I must fight against my own kind deeply saddens me.', 12, 0, 100, 0, 0, 0, 5008, 'arei SAY_CLEAR_PATH'),
(9598, 5, 0, 'I can sense it now, $n. Ashenvale lies down this path.', 12, 0, 100, 0, 0, 0, 5023, 'arei SAY_ASHENVALE'),
(9598, 6, 0, 'I feel... something strange...', 12, 0, 100, 0, 0, 0, 5026, 'arei SAY_TRANSFORM'),
(9598, 7, 0, '$n, my form has now changed! The true strength of my spirit is returning to me now... The cursed grasp of the forest is leaving me.', 12, 0, 100, 0, 0, 0, 5029, 'arei SAY_LIFT_CURSE'),
(9598, 8, 0, 'Thank you, $n. Now my spirit will finally be at peace.', 12, 0, 100, 0, 0, 0, 5036, 'arei SAY_ESCORT_COMPLETE');

UPDATE `creature_template` SET `ScriptName`='npc_arei' WHERE  `entry`=9598;
UPDATE `creature_template` SET `speed_walk`=2, `speed_run`=2 WHERE  `entry`=9598;
DELETE FROM `creature` WHERE `guid`=40377;
-- 
-- Gelkis/Magram - Decissionquest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19, 20)  AND `SourceEntry`=1368;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(20, 0, 1368, 0, 0, 8, 0, 1367, 0, 0, 1, 0, 0, '', 'Show Gelkis Alliance NOT if Magram Alliance is rewarded.'),
(19, 0, 1368, 0, 0, 8, 0, 1367, 0, 0, 1, 0, 0, '', 'Show Gelkis Alliance NOT if Magram Alliance is rewarded.'),
(19, 0, 1368, 0, 0, 28, 0, 1367, 0, 0, 1, 0, 0, '', 'Show Gelkis Alliance NOT if Magram Alliance is completed.'),
(20, 0, 1368, 0, 0, 28, 0, 1367, 0, 0, 1, 0, 0, '', 'Show Gelkis Alliance NOT if Magram Alliance is completed.'),
(19, 0, 1368, 0, 0, 9, 0, 1367, 0, 0, 1, 0, 0, '', 'Show Gelkis Alliance NOT if Magram Alliance is completed.'),
(20, 0, 1368, 0, 0, 9, 0, 1367, 0, 0, 1, 0, 0, '', 'Show Gelkis Alliance NOT if Magram Alliance is completed.');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19, 20)  AND `SourceEntry`=1367;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(20, 0, 1367, 0, 0, 8, 0, 1368, 0, 0, 1, 0, 0, '', 'Show Magram Alliance NOT if Gelkis Alliance is rewarded.'),
(19, 0, 1367, 0, 0, 8, 0, 1368, 0, 0, 1, 0, 0, '', 'Show Magram Alliance NOT if Gelkis Alliance is rewarded.'),
(19, 0, 1367, 0, 0, 28, 0, 1368, 0, 0, 1, 0, 0, '', 'Show Magram Alliance NOT if Gelkis Alliance is completed.'),
(20, 0, 1367, 0, 0, 28, 0, 1368, 0, 0, 1, 0, 0, '', 'Show Magram Alliance NOT if Gelkis Alliance is completed.'),
(19, 0, 1367, 0, 0, 9, 0, 1368, 0, 0, 1, 0, 0, '', 'Show Magram Alliance NOT if Gelkis Alliance is active.'),
(20, 0, 1367, 0, 0, 9, 0, 1368, 0, 0, 1, 0, 0, '', 'Show Magram Alliance NOT if Gelkis Alliance is avtive.');

-- 
-- Stillpine Captive
UPDATE creature SET orientation = 0.365682 WHERE guid = 90994;
-- The Prophecy of Akida -- http://wotlk.openwow.com/quest=9544
UPDATE creature SET orientation = 3.155424 WHERE guid = 90995;
UPDATE creature SET orientation = 4.971260 WHERE guid = 91001;
UPDATE creature SET orientation = 2.285983 WHERE guid = 91002;
UPDATE creature SET orientation = 1.334086 WHERE guid = 91003;
UPDATE creature SET orientation = 0.408888 WHERE guid = 91004;
UPDATE creature SET orientation = 4.620978 WHERE guid = 91005;
UPDATE creature SET orientation = 3.218260 WHERE guid = 91007;
UPDATE creature SET orientation = 4.423052 WHERE guid = 91008;

DELETE FROM `waypoint_data` WHERE `id` IN (909940, 909950, 909960, 909970, 909980, 909990, 910000, 910010, 910020, 910030, 910040, 910050, 910060, 910070, 910080);
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(909940,1,-4616.35,-11646.3,20.9185),
(909940,2,-4597.68,-11659.9,19.9798),
(909940,3,-4585.35,-11682.6,19.4543),
(909940,4,-4585.35,-11682.6,19.4543),
-- #90995
(909950,1,-4576.57,-11625.6,17.7847),
(909950,2,-4571.72,-11613.7,17.8211),
(909950,3,-4547.22,-11602.9,15.7619),
(909950,4,-4547.22,-11602.9,15.7619),
-- #90996
(909960,1,-4607.84,-11661.3,20.1229),
(909960,2,-4585.93,-11683.3,19.4376),
(909960,3,-4585.93,-11683.3,19.4376),
-- #90997
(909970,1,-4514.16,-11636.2,13.2484),
(909970,2,-4486.92,-11666.6,10.1438),
(909970,3,-4486.92,-11666.6,10.1438),
-- #90998
(909980,1,-4500.7,-11599.9,12.4237),
(909980,2,-4466.86,-11611.1,12.5875),
(909980,3,-4466.86,-11611.1,12.5875),
-- #90999
(909990,1,-4488.83,-11626.2,10.9745),
(909990,2,-4499.94,-11635.9,12.4551),
(909990,3,-4486.48,-11666.1,10.0948),
(909990,4,-4486.48,-11666.1,10.0948),
-- #91000
(910000,1,-4486.69,-11613.6,11.0187),
(910000,2,-4481.08,-11605.5,11.5851),
(910000,3,-4449.55,-11613.6,10.2269),
(910000,4,-4449.55,-11613.6,10.2269),
-- #91001
(910010,1,-4609.22,-11616.5,18.0117),
(910010,2,-4601.83,-11652.7,18.9373),
(910010,3,-4601.83,-11652.7,18.9373),
-- #91002
(910020,1,-4586.47,-11641.1,19.3945),
(910020,2,-4592.15,-11651,20.6222),
(910020,3,-4586.04,-11682.2,19.4636),
(910020,4,-4586.04,-11682.2,19.4636),
-- #91003
(910030,1,-4630.73,-11541.2,17.2353),
(910030,2,-4606.58,-11554.9,18.5432),
(910030,3,-4606.58,-11554.9,18.5432),
-- #91004
(910040,1,-4643.38,-11533.1,17.4496),
(910040,2,-4608.98,-11550,18.4467),
(910040,3,-4608.98,-11550,18.4467),
-- #91005
(910050,1,-4634.94,-11502,19.9331),
(910050,2,-4601.03,-11510.5,19.9801),
(910050,3,-4601.03,-11510.5,19.9801),
-- #91006
(910060,1,-4619.91,-11503.7,20.3987),
(910060,2,-4583.83,-11514.8,19.4313),
(910060,3,-4583.83,-11514.8,19.4313),
-- #91007
(910070,1,-4606.49,-11519.3,19.3579),
(910070,2,-4608.57,-11512.2,20.0682),
(910070,3,-4572.14,-11514.7,19.567),
(910070,4,-4572.14,-11514.7,19.567),
-- #91008
(910080,1,-4606.48,-11538.3,17.9555),
(910080,2,-4603.26,-11543.9,18.3778),
(910080,3,-4575.63,-11540.1,17.8463),
(910080,4,-4575.63,-11540.1,17.8463);

UPDATE `waypoint_data` SET move_type=1 WHERE `id` IN (909940, 909950, 909960, 909970, 909980, 909990, 910000, 910010, 910020, 910030, 910040, 910050, 910060, 910070, 910080);
UPDATE `creature_template` SET `speed_run`=1.2 WHERE  `entry`=17375;

-- Echeyakee -- http://wotlk.openwow.com/quest=881
UPDATE `event_scripts` SET `x`=453.896027, `y`=-3039.76147, `z`=91.785370 WHERE `id`=2980;
UPDATE `gameobject` SET `id`=147524 WHERE `guid`=50383;
UPDATE `gameobject_template` SET `data1`=60 WHERE  `entry`=147524;

-- DB/Quest: The Burning of Spirits - Itemtargeting -- http://wotlk.openwow.com/quest=1435
-- Capture Spirit - targeting
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=7914;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,7914,0,0,31,1,3,3195,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,1,31,1,3,3196,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,2,31,1,3,3197,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,3,31,1,3,3198,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,4,31,1,3,3199,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,5,31,1,3,3379,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,6,31,1,3,3380,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,7,31,1,3,4663,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,8,31,1,3,4664,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,9,31,1,3,4665,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,10,31,1,3,4666,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,11,31,1,3,4667,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,12,31,1,3,4668,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,13,31,1,3,4669,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,14,31,1,3,4705,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,15,31,1,3,12319,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,16,31,1,3,12320,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,17,31,1,3,13019,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,18,31,1,3,13836,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,19,31,1,3,18305,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,20,31,1,3,18306,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,21,31,1,3,18307,0,0,"","Capture Spirit - only target Burning Blade member"),
(17,0,7914,0,22,31,1,3,18308,0,0,"","Capture Spirit - only target Burning Blade member");

-- Kaya - Texts -- http://wotlk.openwow.com/quest=6523
DELETE FROM `creature_text` WHERE `entry` = 11856;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`comment`) VALUES
(11856, 0, 0, "Let's go before they find out I'm free!", 12, 0, 100, 1, 0, 0, 8327, 'Kaya SAY_START'),
(11856, 1, 0, "Look out! We're under attack!", 12, 0, 100, 5, 0, 0, 8328, 'Kaya SAY_AMBUSH'),
(11856, 2, 0, "Thank you for helping me. I know my way back from here.", 12, 0, 100, 3, 0, 0, 8329, 'Kaya SAY_END');

-- The Lord of Blackrock - http://wotlk.openwow.com/quest=7782 + http://wotlk.openwow.com/quest=7784
-- Field Marshal Afrasiabi SAI
SET @ENTRY := 14721;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,7782,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Field Marshal Afrasiabi - On Quest 'The Lord of Blackrock' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 1472100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Field Marshal Afrasiabi - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,14000,14000,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Field Marshal Afrasiabi - On Script - Say Line 1"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,11,22888,0,0,0,0,0,1,0,0,0,0,0,0,0,"Field Marshal Afrasiabi - On Script - Cast 'Rallying Cry of the Dragonslayer'");

-- Overlord Runthak SAI
SET @ENTRY := 14392;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,7784,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Runthak - On Quest 'The Lord of Blackrock' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 1439200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Overlord Runthak - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,14000,14000,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Overlord Runthak - On Script - Say Line 1"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,11,22888,0,0,0,0,0,1,0,0,0,0,0,0,0,"Overlord Runthak - On Script - Cast 'Rallying Cry of the Dragonslayer'");

DELETE FROM `creature_text` WHERE `entry` IN (14721, 14392);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextId`) VALUES 
(14392, 0, 0, 'NEFARIAN IS SLAIN! people of Orgrimmar, bow down before the might of $N and his allies for they have laid a blow against the Black Dragonflight that is sure to stir the Aspects from their malaise! This defeat shall surely be felt by the father of the Black Flight: Deathwing reels in pain and anguish this day!', 14, 0, 100, 0, 0, 0, 'Overlord Runthak', 9867),
(14392, 1, 0, 'Be lifted by $N accomplishment! Revel in his rallying cry!', 14, 0, 100, 0, 0, 0, 'Overlord Runthak', 9868),
(14721, 0, 0, 'Citizens of the Alliance, the Lord of Blackrock is slain! Nefarian has been subdued by the combined might of $N and $Ghis:her; allies!', 14, 0, 100, 0, 0, 0, 'Field Marshal Afrasiabi', 9870),
(14721, 1, 0, 'Let your spirits rise! Rally around your champion, bask in $Ghis:her; glory! Revel in the rallying cry of the dragon slayer!', 14, 0, 100, 0, 0, 0, 'Field Marshal Afrasiabi', 9872);

-- DB/Quest: The Sleeper Has Awakened -- http://wotlk.openwow.com/quest=5321
UPDATE `creature_text` SET `sound`=6209 WHERE  `entry`=11218 AND `groupid`=0 AND `id`=0;


-- Seal of Ascension 4743

SET @ENTRY :=10321;
-- Emberstrife Template
UPDATE `creature_template` SET AIName='SmartAI', spell1=16054, spell2=9573, spell3=8269, spell4=40504, spell5=0, spell6=0, spell7=0 WHERE entry=@ENTRY;

-- Emberstrife Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'Emberstrife will falters!', 16, 0, 100, 0, 0, 0, 0, 0, 'Emberstrife Emote when below 10%');

-- Emberstrife SAI 
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = @ENTRY);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 2, 0, 100, 0, 0, 10, 60000, 60000, 1, 0, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emberstrife - Emote Below 10%'),
(@ENTRY, 0, 1, 0, 0, 0, 100, 0, 2000, 5000, 5000, 12000, 11, 9573, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Emberstrife - Flame Breath'),
(@ENTRY, 0, 2, 0, 0, 0, 100, 0, 2000, 5000, 4000, 10000, 11, 40504, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Emberstrife - Cleave'),
(@ENTRY, 0, 3, 0, 2, 0, 100, 0, 0, 10, 60000, 60000, 11, 8269, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Emberstrife - Frenzy below 10%');

-- Unforged Seal of Ascension SAI
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=175321;
DELETE FROM `smart_scripts` WHERE `entryorguid`=175321 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(175321, 1, 0, 0, 8, 0, 100, 0, 16054, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Despawn');

-- DB/Quest: Counterattack -- http://www.wowhead.com/quest=4021/counterattack
-- Warlord Krom'zar SAI
SET @ENTRY := 9456;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,1000,4000,6000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,"Warlord Krom'zar - In Combat - Cast 'Strike'"),
(@ENTRY,0,1,0,6,0,100,1,0,1000,5000,8000,11,13965,2,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Krom'zar - On Just Died - Cast 'Create Krom'zar's Banner' (No Repeat)"),
(@ENTRY,0,4,0,11,0,100,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Krom'zar - On Respawn - Start Random Movement"),
(@ENTRY,0,5,0,11,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Krom'zar - On Respawn - Say Line 0");
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_deathgate' WHERE `entry`=3389;
DELETE FROM `smart_scripts` WHERE `entryorguid`=3389;

-- Gerenzo's Orders -- http://old.wowhead.com/quest=1090
DELETE FROM `creature_text` WHERE `entry`=4276;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(4276, 0, 0, 'Watch out for the Kobolds!', 12, 0, 100, 0, 0, 0, 0, 'Piznik'),
(4276, 1, 0, 'I\'m getting close!', 12, 0, 100, 0, 0, 0, 0, 'Piznik'),
(4276, 2, 0, 'Yay! I have found it!', 12, 0, 100, 0, 0, 0, 0, 'Piznik');
UPDATE creature_template SET faction=42, AIName='SmartAI', ScriptName='' WHERE entry=4276;
DELETE FROM smart_scripts WHERE entryorguid=4276 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=4276*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (4276, 0, 0, 0, 19, 0, 100, 0, 1090, 0, 0, 0, 80, 4276*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Script9');
INSERT INTO smart_scripts VALUES (4276*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 19, 512, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Remove NPC Immune Flag');
INSERT INTO smart_scripts VALUES (4276*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Remove NPC Flags');
INSERT INTO smart_scripts VALUES (4276*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Talk');
INSERT INTO smart_scripts VALUES (4276*100, 9, 3, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 12, 3998, 4, 30000, 0, 1, 0, 8, 0, 0, 0, 956.209, -260.946, -4.515244, 6.022552, 'Script9 - Summon creature');
INSERT INTO smart_scripts VALUES (4276*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 4001, 4, 30000, 0, 1, 0, 8, 0, 0, 0, 957.395, -258.515, -4.177891, 5.508116, 'Script9 - Summon creature');
INSERT INTO smart_scripts VALUES (4276*100, 9, 5, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 12, 3998, 4, 30000, 0, 1, 0, 8, 0, 0, 0, 956.209, -260.946, -4.515244, 6.022552, 'Script9 - Summon creature');
INSERT INTO smart_scripts VALUES (4276*100, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 4001, 4, 30000, 0, 1, 0, 8, 0, 0, 0, 957.395, -258.515, -4.177891, 5.508116, 'Script9 - Summon creature');
INSERT INTO smart_scripts VALUES (4276*100, 9, 7, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 12, 3998, 4, 30000, 0, 1, 0, 8, 0, 0, 0, 956.209, -260.946, -4.515244, 6.022552, 'Script9 - Summon creature');
INSERT INTO smart_scripts VALUES (4276*100, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 4001, 4, 30000, 0, 1, 0, 8, 0, 0, 0, 957.395, -258.515, -4.177891, 5.508116, 'Script9 - Summon creature');
INSERT INTO smart_scripts VALUES (4276*100, 9, 9, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 12, 3998, 4, 30000, 0, 1, 0, 8, 0, 0, 0, 956.209, -260.946, -4.515244, 6.022552, 'Script9 - Summon creature');
INSERT INTO smart_scripts VALUES (4276*100, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 4001, 4, 30000, 0, 1, 0, 8, 0, 0, 0, 957.395, -258.515, -4.177891, 5.508116, 'Script9 - Summon creature');
INSERT INTO smart_scripts VALUES (4276*100, 9, 11, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Talk');
INSERT INTO smart_scripts VALUES (4276*100, 9, 12, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 12, 3998, 4, 30000, 0, 1, 0, 8, 0, 0, 0, 956.209, -260.946, -4.515244, 6.022552, 'Script9 - Summon creature');
INSERT INTO smart_scripts VALUES (4276*100, 9, 13, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 4001, 4, 30000, 0, 1, 0, 8, 0, 0, 0, 957.395, -258.515, -4.177891, 5.508116, 'Script9 - Summon creature');
INSERT INTO smart_scripts VALUES (4276*100, 9, 14, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 12, 3998, 4, 30000, 0, 1, 0, 8, 0, 0, 0, 956.209, -260.946, -4.515244, 6.022552, 'Script9 - Summon creature');
INSERT INTO smart_scripts VALUES (4276*100, 9, 15, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 4001, 4, 30000, 0, 1, 0, 8, 0, 0, 0, 957.395, -258.515, -4.177891, 5.508116, 'Script9 - Summon creature');
INSERT INTO smart_scripts VALUES (4276*100, 9, 16, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 12, 3998, 4, 30000, 0, 1, 0, 8, 0, 0, 0, 956.209, -260.946, -4.515244, 6.022552, 'Script9 - Summon creature');
INSERT INTO smart_scripts VALUES (4276*100, 9, 17, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, 4001, 4, 30000, 0, 1, 0, 8, 0, 0, 0, 957.395, -258.515, -4.177891, 5.508116, 'Script9 - Summon creature');
INSERT INTO smart_scripts VALUES (4276*100, 9, 18, 0, 0, 0, 100, 0, 20000, 20000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Talk');
INSERT INTO smart_scripts VALUES (4276*100, 9, 19, 0, 0, 0, 100, 0, 0, 0, 0, 0, 26, 1090, 0, 0, 0, 0, 0, 18, 40, 0, 0, 0, 0, 0, 0, 'Script9 - Area Explored');
INSERT INTO smart_scripts VALUES (4276*100, 9, 20, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 512, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set NPC Immune Flag');
INSERT INTO smart_scripts VALUES (4276*100, 9, 21, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set NPC Flags');

UPDATE `creature_template` SET `AIName`="", `flags_extra`=0, `ScriptName`='npc_piznik' WHERE `entry`=4276;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (4276, 427600) AND `source_type` IN (0, 9);

-- Timbermaw Ally - [A][H] http://www.wowhead.com/quest=6131/timbermaw-ally

UPDATE quest_template_addon SET RequiredMaxRepFaction=576, RequiredMaxRepValue=0 WHERE ID=6131;


-- Deviate Hides - [A][H] http://www.wowhead.com/quest=1486/deviate-hides

UPDATE quest_template SET AllowableRaces=0 WHERE ID=1486;


-- Kyle's Gone Missing! - [H] http://www.wowhead.com/quest=11129/kyles-gone-missing

UPDATE creature_loot_template SET chance=30 WHERE Item=33009;

-- Quest: Blueleaf tuber -- http://wotlk.openwow.com/quest=1221
SET @Guid := 29727;

UPDATE `creature_template` SET `Ainame`='SmartAI', `scriptname`='' WHERE `entry`=4781;
UPDATE `gameobject_template` SET `AIName`= 'SmartGameObjectAI' WHERE `entry` =20920;
DELETE FROM `smart_scripts` WHERE `entryorguid` =20920 AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid`=4781 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=478100 AND `source_type`=9;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4781,0,0,1,54,0,100,0,0,0,0,0,1,0,0,0,0,0,0,23,0,0,0,0,0,0,0,'Snufflenose Gopher - On Just Summoned - Say Line 0'),
(4781,0,1,0,61,0,100,0,0,0,0,0,29,1,0,0,0,0,0,23,0,0,0,0,0,0,0,'Snufflenose Gopher - On Just Summoned - Follow Summoner'),
(4781,0,2,3,38,0,100,0,1,1,10000,10000,29,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Snufflenose Gopher - On Data Set - Stop Following Invoker'),
(4781,0,3,4,61,0,100,0,0,0,0,0,69,0,0,0,0,0,0,20,20920,0,0,0,0,0,0,'Snufflenose Gopher - On Data Set - Move to Blueleaf Tuber'),
(4781,0,4,5,61,0,100,0,0,0,0,0,80,478100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Snufflenose Gopher - On Data Set - Run Script'),
(4781,0,5,6,61,0,100,0,0,0,0,0,1,1,0,0,0,0,0,23,0,0,0,0,0,0,0,'Snufflenose Gopher - On Data Set - Say Line 1'),
(4781,0,6,0,61,0,100,0,0,0,0,0,8,0,0,0,0,0,0,23,0,0,0,0,0,0,0,'Snufflenose Gopher - On Data Set - Set Passive'),
(4781,0,7,0,8,0,100,0,8283,0,10000,10000,45,1,1,0,0,0,0,20,20920,40,0,0,0,0,0,'Snufflenose Gopher - On Spellhit (Snufflenose Command) - Set Data Blueleaf Tuber'),
(478100,9,0,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,23,0,0,0,0,0,0,0,'Snufflenose Gopher - Script - Say Line 2'),
(478100,9,1,0,0,0,100,0,0,0,0,0,104,0,0,0,0,0,0,20,20920,10,0,0,0,0,0,'Snufflenose Gopher - Script - Set Flags on Blueleaf Tuber'),
(478100,9,2,0,0,0,100,0,0,0,0,0,70,300,0,0,0,0,0,20,20920,10,0,0,0,0,0,'Snufflenose Gopher - Script - Respawn Blueleaf Tuber'),
(478100,9,3,0,0,0,100,0,5000,5000,0,0,29,1,0,0,0,0,0,23,0,0,0,0,0,0,0,'Snufflenose Gopher - Script - Follow Summoner'),
(478100,9,4,0,0,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Snufflenose Gopher - Script - Set Hostile'),

(20920,1,0,0,11,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blueleaf Tuber - On Spawn - Set Phase 1'),
(20920,1,1,2,38,1,100,0,1,1,0,0,45,1,1,0,0,0,0,19,4781,0,0,0,0,0,0,'Blueleaf Tuber - On Data Set (Phase 1) - Set Data Snufflenose Gopher'),
(20920,1,2,0,61,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blueleaf Tuber - On Data Set (Phase 1) - Set Phase 2'),
(20920,1,3,0,1,0,100,0,300000,300000,300000,300000,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blueleaf Tuber - OOC (Phase 2) - Set Phase 1');

DELETE FROM `creature_text` WHERE `entry`=4781;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(4781, 0, 0, '%s nervously crawls from the crate.', 16, 0, 100, 0, 0, 0, 1638, 0, 'Snufflenose Gopher'),
(4781, 1, 0, '%s wiggles his whiskers at $n.', 16, 0, 100, 0, 0, 0, 1591, 0, 'Snufflenose Gopher'),
(4781, 2, 0, '%s sniffs at the ground...', 16, 0, 100, 0, 0, 0, 1592, 0, 'Snufflenose Gopher');

DELETE FROM `gameobject` WHERE `id`=20919;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES 
(@Guid+0, 20919, 47, 0, 0, 1, 1, 2082.74, 1671.82, 61.2396, 3.66079, 0, 0, 0.966493, -0.256693, -43200, 100, 1, 0),
(@Guid+1, 20919, 47, 0, 0, 1, 1, 2159.43, 1687.49, 57.5433, 3.66079, 0, 0, 0.966493, -0.256693, -43200, 100, 1, 0),
(@Guid+2, 20919, 47, 0, 0, 1, 1, 2080.89, 1703.36, 56.6447, 0.553757, 0, 0, 0.273354, 0.961913, -43200, 100, 1, 0),
(@Guid+3, 20919, 47, 0, 0, 1, 1, 2055.28, 1767.7, 58.4559, 2.98378, 0, 0, 0.996889, 0.0788245, -43200, 100, 1, 0),
(@Guid+4, 20919, 47, 0, 0, 1, 1, 2196.64, 1827.96, 61.4706, 2.11277, 0, 0, 0.870583, 0.492022, -43200, 100, 1, 0),
(@Guid+5, 20919, 47, 0, 0, 1, 1, 2030.32, 1867.61, 56.2866, 5.6777, 0, 0, 0.298139, -0.954522, -43200, 100, 1, 0),
(@Guid+6, 20919, 47, 0, 0, 1, 1, 2091.33, 1861.73, 51.0341, 1.25355, 0, 0, 0.586536, 0.809923, -43200, 100, 1, 0),
(@Guid+7, 20919, 47, 0, 0, 1, 1, 2200.15, 1897.64, 71.3191, 2.6492, 0, 0, 0.969846, 0.243717, -43200, 100, 1, 0),
(@Guid+8, 20919, 47, 0, 0, 1, 1, 2075.75, 1742.04, 76.7184, 1.33994, 0, 0, 0.620962, 0.78384, -43200, 100, 1, 0),
(@Guid+9, 20919, 47, 0, 0, 1, 1, 2126, 1661.15, 82.4824, 0.0220437, 0, 0, 0.0110216, 0.999939, -43200, 100, 1, 0),
(@Guid+10, 20919, 47, 0, 0, 1, 1, 2207.92, 1596.91, 80.7375, 3.60582, 0, 0, 0.973182, -0.230035, -43200, 100, 1, 0),
(@Guid+11, 20919, 47, 0, 0, 1, 1, 2156.98, 1542.26, 72.849, 2.43086, 0, 0, 0.937519, 0.347934, -43200, 100, 1, 0),
(@Guid+12, 20919, 47, 0, 0, 1, 1, 2179.95, 1514.06, 69.0709, 0.778385, 0, 0, 0.379441, 0.925216, -43200, 100, 1, 0),
(@Guid+13, 20919, 47, 0, 0, 1, 1, 2000.85, 1533.93, 80.3971, 4.919, 0, 0, 0.630419, -0.776255, -43200, 100, 1, 0),
(@Guid+14, 20919, 47, 0, 0, 1, 1, 1991.49, 1608.53, 81.1601, 1.1004, 0, 0, 0.522858, 0.85242, -43200, 100, 1, 0);

-- Venomhide Eggs should have the pre-quest Toxic Tolerance.
UPDATE `quest_template_addon` SET `PrevQuestID` = 13850 WHERE `ID` = 13887; 

-- [Quest] Seeking Spiritual Aid - http://www.wowhead.com/quest=5158/deprecated-seeking-spiritual-aid
-- Islen Waterseer SAI
SET @ENTRY := 5901;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,5158,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Islen Waterseer - On Quest 'Seeking Spiritual Aid' Finished - Run Script"),
(@ENTRY,0,1,0,61,0,100,0,5158,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Islen Waterseer - On Quest 'Seeking Spiritual Aid' Finished - Store Targetlist");

-- Actionlist SAI
SET @ENTRY := 590100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,"Islen Waterseer - On Script - Set Flag Not Selectable"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Islen Waterseer - On Script - Set Run Off"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,-1345.16,-4065.02,-0.49,4.73,"Islen Waterseer - On Script - Move To Position"),
(@ENTRY,9,3,0,0,0,100,0,8000,8000,0,0,1,0,0,0,0,0,0,12,1,0,0,0,0,0,0,"Islen Waterseer - On Script - Say Line 0"),
(@ENTRY,9,4,0,0,0,100,0,3000,3000,0,0,12,11256,3,25000,0,0,0,8,0,0,0,-1346.59,-4076.39,-1.23,1.6,"Islen Waterseer - On Script - Summon Creature 'Manifestation of Water'"),
(@ENTRY,9,5,0,0,0,100,0,12000,12000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Islen Waterseer - On Script - Say Line 1"),
(@ENTRY,9,6,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,-1345,-4048,6.09,4.34,"Islen Waterseer - On Script - Move To Position"),
(@ENTRY,9,7,0,0,0,100,0,6000,6000,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,"Islen Waterseer - On Script - Remove Flag Not Selectable"),
(@ENTRY,9,8,0,0,0,100,0,3000,3000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.345870,"Islen Waterseer - On Script - Set Orientation 4,345870");

-- Manifestation of Water SAI
SET @ENTRY := 11256;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,10000,10000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Manifestation of Water - Out of Combat - Say Line 0 (No Repeat)");

UPDATE `creature_text` SET `type`=12 WHERE  `entry`=5901 AND `groupid`=0 AND `id`=0;
UPDATE `creature_text` SET `text`='[Kalimag] Ma reth bromo zoln kilagrin dra ma zoern tu ko fraht ko tadrom Ma krin drinor zoln drinor Ma krin kan aasrugel korsul.', `BroadcastTextId`=0, `type`=12 WHERE  `entry`=11256 AND `groupid`=0 AND `id`=0;

-- [Q] Freedom to Ruul - https://wowgaming.altervista.org/aowow/?quest=6482
UPDATE `creature_template` SET `unit_flags`=0 WHERE  `entry`=12818;

-- DB/Quest: Counterattack -- http://www.wowhead.com/quest=4021/counterattack
-- Warlord Krom'zar SAI
SET @ENTRY := 9456;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,1000,4000,6000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,"Warlord Krom'zar - In Combat - Cast 'Strike'"),
(@ENTRY,0,1,0,6,0,100,1,0,1000,5000,8000,11,13965,2,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Krom'zar - On Just Died - Cast 'Create Krom'zar's Banner' (No Repeat)"),
(@ENTRY,0,4,0,11,0,100,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Krom'zar - On Respawn - Start Random Movement"),
(@ENTRY,0,5,0,11,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Krom'zar - On Respawn - Say Line 0");
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_deathgate' WHERE `entry`=3389;
DELETE FROM `smart_scripts` WHERE `entryorguid`=3389;

-- GO Blueleaf Tuber (20920)
UPDATE gameobject_template SET faction=0 WHERE entry=20920;

DELETE FROM `spell_script_names` WHERE `spell_id`=8283;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(8283, 'spell_snufflenose_command');

UPDATE `creature_template` SET `unit_flags`=768, `AIName` = "", `flags_extra`=2, `ScriptName`="npc_snufflenose_gopher" WHERE `entry`=4781;