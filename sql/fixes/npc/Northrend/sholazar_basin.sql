-- -------------------------------------------
-- SHOLAZAR BASIN
-- -------------------------------------------

-- Vic's Flying Machine - http://www.wowhead.com/npc=28710/vics-flying-machine
SET @PLANE          := 28710; -- Vic's Flying Machine
UPDATE `creature_template` SET InhabitType='4', `vehicleid`=129, `speed_walk`=10 WHERE `entry`=28710;
DELETE FROM `vehicle_template_accessory` WHERE `entry`=@PLANE;

-- Urgreth of the Thousand Tombs SAI
SET @ENTRY := 28103;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,9000,12000,11,16856,0,0,0,0,0,2,0,0,0,0,0,0,0,"Urgreth of the Thousand Tombs - In Combat - Cast 'Mortal Strike'"),
(@ENTRY,0,1,0,0,0,100,0,11000,16000,18000,24000,11,51074,1,0,0,0,0,2,0,0,0,0,0,0,0,"Urgreth of the Thousand Tombs - In Combat - Cast 'Shadow Barrage'"),
(@ENTRY,0,2,0,0,0,100,0,11000,16000,18000,24000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Urgreth of the Thousand Tombs - In Combat - Say Line 0"),
(@ENTRY,0,3,4,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Urgreth of the Thousand Tombs - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Urgreth of the Thousand Tombs - On Just Died - set corpse delay 5 seconds"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"Urgreth of the Thousand Tombs - On Just Died - set respawntime 60 seconds");

-- Hailscorn SAI
SET @ENTRY := 28208;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,5000,7000,11,3130,0,0,0,0,0,2,0,0,0,0,0,0,0,"Hailscorn - In Combat - Cast 'Ice Claw'"),
(@ENTRY,0,1,0,0,0,100,0,9000,16000,18000,23000,11,51144,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hailscorn - In Combat - Cast 'Wing Buffet'"),
(@ENTRY,0,2,0,0,0,100,0,14000,20000,75000,90000,11,51061,1,0,0,0,0,1,0,0,0,0,0,0,0,"Hailscorn - In Combat - Cast 'Skeleton Army'"),
(@ENTRY,0,3,4,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hailscorn - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hailscorn - On Just Died - set corpse delay 5 seconds"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hailscorn - On Just Died - set respawntime 60 seconds");

-- Bythius the Flesh-Shaper SAI
SET @ENTRY := 28212;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,10000,12000,17000,11,30043,0,0,0,0,0,5,0,0,0,0,0,0,0,"Bythius the Flesh-Shaper - In Combat - Cast 'Poison Spray'"),
(@ENTRY,0,1,2,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bythius the Flesh-Shaper - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bythius the Flesh-Shaper - On Just Died - set corpse delay 5 seconds"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bythius the Flesh-Shaper - On Just Died - set respawntime 60 seconds");

-- Cerberon SAI
SET @ENTRY := 28207;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cerberon - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cerberon - On Just Died - set corpse delay 5 seconds"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cerberon - On Just Died - set respawntime 60 seconds");

-- Glonn SAI
SET @ENTRY := 28211;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Glonn - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Glonn - On Just Died - set corpse delay 5 seconds"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"Glonn - On Just Died - set respawntime 60 seconds");


-- [NPC][WotlK] Venomtip, Monte Muzzleshot, Pitch
-- Pathing for Bonescythe Ravager Entry: 28108 'TDB FORMAT' 
SET @NPC := 114967;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5500.312,`position_y`=4289.887,`position_z`=-120.2268 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5500.312,4289.887,-120.2268,0,0,0,0,100,0), -- 20:10:09
(@PATH,2,5498.041,4315.163,-129.7959,0,0,0,0,100,0), -- 20:10:16
(@PATH,3,5479.31,4327.313,-135.7188,0,0,0,0,100,0), -- 20:10:27
(@PATH,4,5463.216,4324.641,-136.9318,0,0,0,0,100,0), -- 20:10:36
(@PATH,5,5478.41,4327.514,-135.9461,0,0,0,0,100,0), -- 20:10:45
(@PATH,6,5497.42,4316.309,-130.2866,0,0,0,0,100,0), -- 20:10:52
(@PATH,7,5500.079,4290.952,-120.9775,0,0,0,0,100,0), -- 20:11:01
(@PATH,8,5501.669,4276.696,-113.4382,0,0,0,0,100,0), -- 20:11:12
(@PATH,9,5487.548,4249.027,-101.2658,0,0,0,0,100,0), -- 20:11:20
(@PATH,10,5501.655,4274.147,-112.3108,0,0,0,0,100,0), -- 20:11:35
(@PATH,11,5500.302,4289.813,-120.1293,0,0,0,0,100,0); -- 20:11:49

-- Pathing for Venomtip Entry: 28358 'TDB FORMAT' 
SET @NPC := 114670;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5744.435,`position_y`=4404.204,`position_z`=-155.8173 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5744.435,4404.204,-155.8173,0,0,0,0,100,0), -- 20:12:40
(@PATH,2,5715.645,4401.772,-153.2857,0,0,0,0,100,0), -- 20:12:52
(@PATH,3,5705.375,4395.701,-143.6391,0,0,0,0,100,0), -- 20:13:04
(@PATH,4,5705.622,4389.093,-143.1557,0,0,0,0,100,0), -- 20:13:10
(@PATH,5,5709.83,4376.562,-139.9715,0,0,0,0,100,0), -- 20:13:13
(@PATH,6,5715.95,4373.072,-138.6089,0,0,0,0,100,0), -- 20:13:19
(@PATH,7,5731.555,4385.193,-136.1523,1.161770,50000,0,0,100,0), -- 20:13:25
(@PATH,8,5724.199,4381.691,-138.8936,0,0,0,0,100,0), -- 20:14:21
(@PATH,9,5704.81,4390.143,-143.2419,0,0,0,0,100,0), -- 20:14:32
(@PATH,10,5708.165,4396.367,-146.6284,0,0,0,0,100,0), -- 20:14:41
(@PATH,11,5725.642,4404.539,-155.5634,0,0,0,0,100,0), -- 20:14:52
(@PATH,12,5760.399,4425.273,-142.3246,0,0,0,0,100,0), -- 20:15:02
(@PATH,13,5769.836,4447.699,-136.3267,0,0,0,0,100,0), -- 20:15:13
(@PATH,14,5771.975,4460.357,-133.9554,0,0,0,0,100,0), -- 20:15:23
(@PATH,15,5780.781,4464.373,-132.3605,0,0,0,0,100,0), -- 20:15:29
(@PATH,16,5785.139,4465.843,-131.7293,0,0,0,0,100,0), -- 20:15:34
(@PATH,17,5780.612,4451.286,-133.4964,0,0,0,0,100,0), -- 20:15:38
(@PATH,18,5772.853,4435.489,-138.0123,0,0,0,0,100,0), -- 20:15:42
(@PATH,19,5770.67,4424.073,-142.0041,0,0,0,0,100,0), -- 20:15:49
(@PATH,20,5768.662,4419.837,-143.741,4.185554,80000,0,0,100,0); -- 20:17:16

UPDATE `creature_addon` SET `emote` = 383 , `auras` = NULL WHERE `guid` = 103289; 

-- ============
-- Add correct Monte Muzzleshot Emote state
-- ============
-- Monte Muzzleshot SAI
SET @ENTRY := 27987;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,3000,3000,0,0,75,50544,0,0,0,0,0,1,0,0,0,0,0,0,0,"Monte Muzzleshot - Out of Combat - Add Aura 'Cosmetic - Parachute Stuck' (No Repeat)");

DELETE FROM `creature_addon` WHERE `guid` = 114140;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(114140, 0, 0, 0, 1, 0, ''); -- 28097 - 51344 - 51344

-- ============
-- Add Emote and Event for Pitch
-- ============
-- Pitch SAI
SET @ENTRY := 28097;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,5,30,9000,12000,11,54487,2,0,0,0,0,2,0,0,0,0,0,0,0,"Pitch - Within 5-30 Range - Cast 'Jump Attack'"),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,7000,13000,11,24332,2,0,0,0,0,2,0,0,0,0,0,0,0,"Pitch - In Combat - Cast 'Rake'"),
(@ENTRY,0,2,0,1,0,100,0,1000,1000,8000,8000,5,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Pitch - Out of Combat - Play Emote 35"),
(@ENTRY,0,3,0,25,0,100,0,0,0,0,0,11,51344,32,0,0,0,0,1,0,0,0,0,0,0,0,"Pitch - On Reset - Cast 'Razorpine's Fear Aura'");

-- Tracker Gekgek SAI
SET @ENTRY := 28095;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,6000,4000,7000,11,50533,2,0,0,0,0,2,0,0,0,0,0,0,0,"Tracker Gekgek - In Combat - Cast 'Flip Attack'"),
(@ENTRY,0,1,0,1,0,100,0,1000,1000,15000,15000,1,2,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Tracker Gekgek - Out of Combat - Say Line 2"),
(@ENTRY,0,2,0,23,0,100,0,51343,0,5000,5000,201,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tracker Gekgek - On Has Aura 'Razorpine's Fear Effect' - Move to Home Position"),
(@ENTRY,0,3,0,23,0,100,0,51343,1,25000,25000,1,3,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Tracker Gekgek - On Has Aura 'Razorpine's Fear Effect' - Say Line 3");

-- Conditions for Talk Event
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=2 AND `SourceEntry`=28095;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,2,28095,0,0,1,1,51343,0,0,1,0,0,"","Do not run Talk Event if Tracker Gekgek Has Aura 'Razorpine's Fear Effect'"),
(22,2,28095,0,0,29,1,28097,60,0,0,0,0,"","Only run Talk Event if Tracker Gekgek is near creature: Pitch");

-- Frenzyheart Tracker SAI
SET @ENTRY := 28077;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,66,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"Frenzyheart Tracker - On Just Summoned - Set Orientation Closest Player"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frenzyheart Tracker - On Just Summoned - Say Line 0"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,41,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frenzyheart Tracker - On Just Summoned - Despawn In 8000 ms"),
(@ENTRY,0,3,0,0,0,100,0,0,0,3000,5000,11,22907,64,0,0,0,0,2,0,0,0,0,0,0,0,"Frenzyheart Tracker - In Combat - Cast 'Shoot'"),
(@ENTRY,0,4,0,0,0,100,0,10000,14000,60000,65000,11,53432,1,0,0,0,0,1,0,0,0,0,0,0,0,"Frenzyheart Tracker - In Combat - Cast 'Bear Trap'"),
(@ENTRY,0,5,0,23,0,100,0,51343,0,5000,5000,201,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frenzyheart Tracker - On Has Aura 'Razorpine's Fear Effect' - Move to Home Position");

-- Frenzyheart Tracker SAI
UPDATE `creature` SET `saiscriptflag`=1 WHERE  `guid` IN (112327, 112328, 113886);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-112327, -112328, -113886) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-112327,0,0,0,34,0,100,0,8,5,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.705260,"Frenzyheart Tracker - On Reached Point 5 - Set Orientation 2,705260"),
(-112328,0,0,0,34,0,100,0,8,5,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.25704,"Frenzyheart Tracker - On Reached Point 5 - Set Orientation 3.25704"),
(-113886,0,0,0,34,0,100,0,8,5,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.0019,"Tracker Gekgek - On Reached Point 5 - Set Orientation 3,0019");


DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND  `SourceGroup`=1 AND `SourceEntry`=51343;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 51343, 0, 0, 31, 0, 3, 28077, 0, 0, 0, 0, '', 'Razorpine''s Fear Effect only targets Frenzyheart Tracker'),
(13, 1, 51343, 0, 1, 31, 0, 3, 28095, 0, 0, 0, 0, '', 'Razorpine''s Fear Effect only targets Tracker Gekgek');

-- ============
-- Update Texts and Timer for Tracker Gekgek
-- ============
DELETE FROM `creature_text` WHERE `entry`=28095 AND `groupid`>=2;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(28095, 2, 0, 'No let it get away! We got it this time.', 12, 0, 33, 0, 0, 0, 28493, 0, 'Tracker Gekgek'),
(28095, 2, 1, 'Careful! No let it scratch you like last time.', 12, 0, 33, 0, 0, 0, 28495, 0, 'Tracker Gekgek'),
(28095, 2, 2, 'Dumb! Don''t shoot at it! Gekgek want trophy in one piece!', 12, 0, 34, 0, 0, 0, 28492, 0, 'Tracker Gekgek'),
(28095, 2, 3, 'No let it get away! We got it this time.', 12, 0, 34, 0, 0, 0, 28493, 0, 'Tracker Gekgek'),
(28095, 2, 4, 'Gekgek finally trap dumb cat. You Gekgek''s now!', 12, 0, 34, 0, 0, 0, 28494, 0, 'Tracker Gekgek'),
-- 
(28095, 3, 0, 'Ahh! It\'s coming right for us!', 12, 0, 34, 0, 0, 0, 27754, 0, 'Tracker Gekgek');

-- ============
-- Add fake death emote for Injured Rainspeaker Oracle and one missing spawn
-- ============
-- Injured Rainspeaker Oracle SAI
SET @ENTRY := 28217;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,11,0,100,0,0,0,0,0,75,51329,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Respawn - Add Aura 'Feign Death'"),
(@ENTRY,0,1,14,61,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Respawn - Set Npc Flags Gossip & Questgiver"),
(@ENTRY,0,2,3,62,0,100,0,9677,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Gossip Option 0 Selected - Say Line 0"),
(@ENTRY,0,3,4,61,0,100,0,9677,0,0,0,28,51329,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Gossip Option 0 Selected - Remove Aura 'Feign Death'"),
(@ENTRY,0,4,5,61,0,100,0,9677,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Gossip Option 0 Selected - Set Npc Flags Gossip & Questgiver"),
(@ENTRY,0,5,15,61,0,100,0,9677,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,6,0,62,0,100,0,9677,0,0,0,85,51382,2,0,0,0,0,7,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Gossip Option 0 Selected - Invoker Cast 'Forcecast Summon Huge Crocolisk'"),
(@ENTRY,0,7,0,64,0,100,0,0,0,0,0,98,9684,13124,0,0,0,0,7,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Gossip Hello - Send Gossip"),
(@ENTRY,0,8,10,62,0,100,0,9684,0,0,0,2,774,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Gossip Option 0 Selected - Set Faction 774"),
(@ENTRY,0,9,10,62,0,100,0,9684,0,0,0,2,775,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Gossip Option 0 Selected - Set Faction 775"),
(@ENTRY,0,10,11,61,0,100,0,9684,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Gossip Option 0 Selected - Store Targetlist"),
(@ENTRY,0,11,0,61,0,100,0,9684,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Gossip Option 0 Selected - Run Script"),
(@ENTRY,0,12,0,19,0,100,0,12570,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Quest '' Taken - Say Line 1"),
(@ENTRY,0,13,0,40,0,100,0,64,28217,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Waypoint 64 Reached - Run Script"),
(@ENTRY,0,14,0,61,0,100,0,0,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Respawn - Set Flag Standstate Dead"),
(@ENTRY,0,15,0,61,0,100,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Rainspeaker Oracle - On Gossip Option 0 Selected - Remove Flag Standstate Dead");

-- add one missing spawn
SET @cguid:= 5005384;
DELETE FROM `creature` WHERE `guid` = @cguid;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID, 28217, 571, 0, 0, 1, 1, 0, 0, 5459.164, 4515.149, -134.4442, 0.8028514, 300, 0, 0, 0, 0, 0, 0, 0, 0, 23420); -- 28217 (Area: -1) (Auras: 51329 - 51329)

DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(1, 15) AND SourceGroup=9677 AND SourceEntry IN(0, 11446);
INSERT INTO `conditions` VALUES (1, 9677, 11446, 0, 0, 8, 0, 4242, 0, 0, 0, 0, 0, '', NULL);
INSERT INTO `conditions` VALUES (15, 9677, 0, 0, 0, 8, 0, 12570, 0, 0, 1, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if Player does not have Fortunate Misunderstandings rewarded');
INSERT INTO `conditions` VALUES (15, 9677, 0, 0, 0, 9, 0, 12540, 0, 0, 0, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if Just following orders taken');
INSERT INTO `conditions` VALUES (15, 9677, 0, 0, 0, 28, 0, 12570, 0, 0, 1, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if Player does not have Fortunate Misunderstandings complete');
INSERT INTO `conditions` VALUES (15, 9677, 0, 0, 1, 8, 0, 12540, 0, 0, 0, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if Just following orders rewarded');
INSERT INTO `conditions` VALUES (15, 9677, 0, 0, 1, 8, 0, 12570, 0, 0, 1, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if Player does not have Fortunate Misunderstandings rewarded');
INSERT INTO `conditions` VALUES (15, 9677, 0, 0, 1, 28, 0, 12570, 0, 0, 1, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if Player does not have Fortunate Misunderstandings complete');