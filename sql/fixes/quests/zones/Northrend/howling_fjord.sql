-- -------------------------------------------
-- HOWLING FJORD
-- -------------------------------------------


-- If Valgarde Falls... -- [A] http://www.wowhead.com/quest=11243/if-valgarde-falls

DELETE FROM creature WHERE id IN(24051, 24063);

INSERT INTO creature (guid, id, map, zoneId, areaId, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags, VerifiedBuild)
VALUES
    (87530, 24051, 571, 0, 0, 1, 1, 0, 1, 738.176, -4933.92, 5.9536, 3.76332, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87531, 24051, 571, 0, 0, 1, 1, 0, 1, 740.399, -4941.34, 5.24911, 3.17662, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87532, 24063, 571, 0, 0, 1, 1, 0, 0, 769.433, -4955.05, 2.07196, 2.69753, 120, 0, 0, 6326, 0, 0, 0, 0, 0, 0),
    (87533, 24051, 571, 0, 0, 1, 1, 0, 1, 766.205, -4986.84, 1.60532, 5.72917, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87534, 24051, 571, 0, 0, 1, 1, 0, 1, 733.168, -4999.25, 4.01414, 2.53968, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87535, 24063, 571, 0, 0, 1, 1, 0, 0, 708.769, -4917.59, 7.79307, 4.87781, 120, 0, 0, 6326, 0, 0, 0, 0, 0, 0),
    (87536, 24051, 571, 0, 0, 1, 1, 0, 1, 770.842, -4877.62, 2.94487, 3.2049, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87537, 24051, 571, 0, 0, 1, 1, 0, 1, 753.224, -4849.59, 5.69775, 4.21807, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (87538, 24063, 571, 0, 0, 1, 1, 0, 0, 771.226, -4950.11, 2.26675, 3.23239, 120, 0, 0, 6326, 0, 0, 0, 0, 0, 0),
    (87539, 24051, 571, 0, 0, 1, 1, 0, 1, 785.022, -4928.71, 1.15719, 6.147, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87540, 24051, 571, 0, 0, 1, 1, 0, 1, 730.868, -4893.85, 4.37402, 5.37731, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87541, 24051, 571, 0, 0, 1, 1, 0, 1, 736.414, -4895.24, 3.80446, 3.34313, 120, 0, 0, 7984, 0, 0, 0, 0, 0, 0),
    (87542, 24063, 571, 0, 0, 1, 1, 0, 0, 733.528, -4891.04, 3.37424, 4.62332, 120, 0, 0, 6326, 0, 0, 0, 0, 0, 0),
    (118766, 24051, 571, 0, 0, 1, 1, 22048, 1, 709.307, -4939.81, 5.69565, 2.21077, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (118767, 24051, 571, 0, 0, 1, 1, 22050, 1, 719.792, -4981.83, 6.26409, 1.5708, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (118768, 24051, 571, 0, 0, 1, 1, 22049, 1, 710.86, -4936.77, 6.34196, -1.73661, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (118769, 24051, 571, 0, 0, 1, 1, 22048, 1, 719.792, -4990.14, 6.70648, -2.03322, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (118770, 24051, 571, 0, 0, 1, 1, 22048, 1, 739.815, -4866.26, 6.49782, 3.53406, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (118771, 24051, 571, 0, 0, 1, 1, 22048, 1, 739.29, -4937.83, 5.74562, 3.5513, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (118772, 24051, 571, 0, 0, 1, 1, 22050, 1, 773.114, -4973.18, 1.3794, 0.366519, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (118773, 24051, 571, 0, 0, 1, 1, 22049, 1, 760.44, -4896.1, 2.77501, 1.78024, 120, 0, 0, 6986, 0, 0, 0, 0, 0, 0),
    (120557, 24063, 571, 0, 0, 1, 1, 22044, 0, 713.543, -4938.75, 6.11675, -2.70399, 120, 0, 0, 3728, 0, 0, 0, 0, 0, 0),
    (120558, 24063, 571, 0, 0, 1, 1, 22044, 0, 759.329, -4927.86, 3.91054, 3.25516, 120, 0, 0, 3728, 0, 0, 0, 0, 0, 0),
    (120559, 24063, 571, 0, 0, 1, 1, 22044, 0, 711.91, -4963.56, 4.99635, 3.34014, 120, 5, 0, 3728, 0, 1, 0, 0, 0, 0),
    (120560, 24063, 571, 0, 0, 1, 1, 22044, 0, 761.72, -4863.74, 4.49782, 3.24979, 120, 0, 0, 3728, 0, 0, 0, 0, 0, 0),
    (120561, 24063, 571, 0, 0, 1, 1, 22044, 0, 766.92, -4893.33, 2.99759, 2.0975, 120, 0, 0, 3728, 0, 0, 0, 0, 0, 0);

UPDATE creature SET spawntimesecs=120 WHERE id IN(24051, 24063);

-- 
-- Sorlof's Booty - [A][H] - http://de.wowhead.com/quest=11529/sorlofs-beute
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=24992;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
(24992, 45008, 0, 0);

UPDATE `creature_template` SET `npcflag`=16777216 WHERE  `entry`=24992;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=45008;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 45008, 0, 0, 31, 0, 3, 24914, 0, 0, 0, 0, '', 'Spell Cannon Assault targets Sorlof');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=24992;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 24992, 45008, 0, 0, 9, 0, 11529, 0, 0, 0, 0, 0, '', 'Required quest active for spellclick');

-- Quest Let's Go Surfing Now - [A] - http://www.wowhead.com/quest=11436/lets-go-surfing-now
DELETE FROM `gameobject_template` WHERE `entry`=186894;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES 
(186894, 22, 295, 'Large Harpoon Lever', '', '', '', 0, 0, 2, 50007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340);

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE  `guid`=107391;

-- Dragonflayer Harpoon SAI
SET @ENTRY := 27924;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,1,27924,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Harpoon - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,2,40,0,100,0,5,27924,0,0,15,11436,0,0,0,0,0,17,0,10,0,0,0,0,0,"Dragonflayer Harpoon - On Waypoint 5 Reached - Quest Credit 'Let's Go Surfing Now'"),
(@ENTRY,0,2,0,61,0,100,0,5,27924,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Harpoon - On Waypoint 5 Reached - Despawn Instant"),
(@ENTRY,0,3,0,40,0,100,0,4,27924,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Harpoon - On Waypoint 4 Reached - Despawn In 5000 ms");

DELETE FROM `waypoints` WHERE `entry`=27924;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(27924, 1, 803.085, -5333.39, 191.903, 'Dragonflayer Harpoon'),
(27924, 2, 761.183, -5268.77, 152.492, 'Dragonflayer Harpoon'),
(27924, 3, 695.561, -5155.04, 81.2906, 'Dragonflayer Harpoon'),
(27924, 4, 647.533, -5073.72, 29.9669, 'Dragonflayer Harpoon'),
(27924, 5, 621.608, -5027.49, 2.03123, 'Dragonflayer Harpoon');

DELETE FROM `creature_template_addon` WHERE `entry`=27924;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(27924,0,0,0x1000000|0x2000000,0x1,0, '43775');
UPDATE `creature_template` SET `InhabitType`=4, `speed_walk`=6, `speed_run`=6 WHERE  `entry`=27924;

-- Vrykul Scroll of Ascension drop condition
UPDATE `conditions` SET `ConditionValue1`=11248, `Comment`='Winterskorn mobs drop item 33314 only if Quest 11248 has been rewarded' WHERE `SourceTypeOrReferenceId`=1 AND `SourceEntry`=33314;
UPDATE `conditions` SET `ConditionValue1`=11256, `Comment`='Winterskorn mobs drop item 33345 only if Quest 11256 has been rewarded' WHERE `SourceTypeOrReferenceId`=1 AND `SourceEntry`=33345;

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


-- Adding Injury to Insult - [H] http://www.wowhead.com/quest=12481/adding-injury-to-insult

SET @BJORN := 24238;
UPDATE creature_template SET speed_run=1.3, InhabitType=3, HoverHeight=7.5 WHERE entry=@BJORN;
DELETE FROM creature_template_addon WHERE entry=@BJORN;
DELETE FROM smart_scripts WHERE entryorguid=@BJORN AND source_type=0;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment)
VALUES
    (@BJORN, 0, 0, 0, 1, 0, 100, 0, 10000, 15000, 45000, 60000, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On update OOC - Say text 2'),
    (@BJORN, 0, 1, 2, 8, 0, 100, 0, 43315, 0, 0, 0, 84, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spellhit Vrykul Insult - Invoker say text 0'),
    (@BJORN, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spellhit Vrykul Insult - Say text 1'),
    (@BJORN, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 43, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spellhit Vrykul Insult - Unmount'),
    (@BJORN, 0, 4, 6, 61, 0, 100, 0, 0, 0, 0, 0, 141, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spellhit Vrykul Insult - Remove Hover'),
    (@BJORN, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 8, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spellhit Vrykul Insult - Set Aggressive'),
    (@BJORN, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 19, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spellhit Vrykul Insult - Remove Unit Flags'),
    (@BJORN, 0, 8, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spellhit Vrykul Insult - Attack Start'),
    (@BJORN, 0, 10, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 43371, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On death - Spellcast Bjorn Kill Credit'),
    (@BJORN, 0, 11, 0, 0, 0, 100, 0, 5000, 10000, 10000, 15000, 11, 32736, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On update IC - Spellcast Mortal Strike'),
    (@BJORN, 0, 12, 0, 0, 0, 100, 0, 0, 5000, 10000, 15000, 11, 33661, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On update IC - Spellcast Crush Armor'),
    (@BJORN, 0, 13, 15, 11, 0, 100, 0, 0, 0, 0, 0, 43, 0, 22657, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On spawn - Mount'),
    (@BJORN, 0, 14, 15, 7, 0, 100, 0, 0, 0, 0, 0, 43, 0, 22657, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On evade - Mount'),
    (@BJORN, 0, 15, 16, 61, 0, 100, 0, 0, 0, 0, 0, 141, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On evade - Set Hover'),
    (@BJORN, 0, 16, 18, 61, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On evade - Set Passive'),
    (@BJORN, 0, 18, 0, 61, 0, 100, 0, 0, 0, 0, 0, 18, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bjorn Halgurdsson - On evade - Set Unit Flags');


-- The Jig is Up - [A][H] http://www.wowhead.com/quest=11471/the-jig-is-up

SET @STERLING := 24742;
DELETE FROM smart_scripts WHERE entryorguid=@STERLING AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (@STERLING, 0, 0, 0, 0, 0, 100, 0, 0, 15000, 15000, 30000, 11, 50188, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - IC - Cast Wildly Flailing'),    
    (@STERLING, 0, 1, 2, 2, 0, 100, 1, 0, 25, 0, 0, 18, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On 25% Hp - Set Flag Inmune To PC and Pacified'),
    (@STERLING, 0, 2, 3, 61, 0, 100, 1, 0, 25, 0, 0, 19, 524288, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On 25% Hp  - Remove Flag In Combat'),
    (@STERLING, 0, 3, 4, 61, 0, 100, 1, 0, 25, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On 25% Hp - Say Line 1'),
    (@STERLING, 0, 4, 5, 61, 0, 100, 1, 0, 25, 0, 0, 102, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On 25% Hp - Set HP Regen off'),
    (@STERLING, 0, 5, 0, 61, 0, 100, 1, 0, 25, 0, 0, 53, 1, @STERLING, 0, 0, 180000, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On 25% Hp - Start WP'),
    (@STERLING, 0, 6, 7, 40, 0, 100, 0, 1, @STERLING, 0, 0, 97, 20, 20, 0, 0, 0, 0, 1, 0, 0, 0, -39.0669, -3420.677, -14.4579, 0, '\"Mad\" Jonah Sterling - On Reached WP1 - Jump to Hozzer'),
    (@STERLING, 0, 7, 0, 61, 0, 100, 0, 1, @STERLING, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 24547, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On Reached WP1 - Set Data 1 1'),
    (@STERLING, 0, 8, 0, 40, 0, 100, 0, 2, @STERLING, 0, 0, 103, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On Reached WP2 - Set Root'),
    (@STERLING, 0, 9, 10, 38, 0, 100, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On Data Set 1 1 - Say Line 2'),
    (@STERLING, 0, 10, 0, 61, 0, 100, 0, 1, 1, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On Data Set 1 1 - Despawn Instant'),
    (@STERLING, 0, 11, 12, 11, 0, 100, 0, 0, 0, 0, 0, 19, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On Respawn - Remove Flag Inmune To PC and Pacified'),
    (@STERLING, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 103, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On Respawn - Remove Flag Inmune To PC and Pacified');

DELETE FROM smart_scripts WHERE entryorguid=2474200 AND source_type=9;

SET @HOZZER := 24547;
UPDATE creature SET position_x=-66.8634, position_y=-3402.8393, position_z=-4.1482, orientation=0.5056 WHERE guid=117725 AND id=@HOZZER;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@HOZZER;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@HOZZER AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
    (@HOZZER,0,0,0,38,0,100,0,1,1,0,0,53,1,24547,0,0,180000,2,1,0,0,0,0,0,0,0,"Hozzer - On Data Set 1 1 - Start Waypoint"),
    (@HOZZER,0,1,2,40,0,100,0,2,24547,0,0,11,44458,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hozzer - On Waypoint 2 Reached - Cast 'Hozzer Feeds'"),
    (@HOZZER,0,2,3,61,0,100,0,2,24547,0,0,45,1,1,0,0,0,0,19,@STERLING,0,0,0,0,0,0,"Hozzer - On Waypoint 2 Reached - Set Data 1 1"),
    (@HOZZER,0,3,0,61,0,100,0,2,24547,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Hozzer - On Waypoint 2 Reached - Say Line 1");

DELETE FROM waypoints WHERE entry=24547;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
    (@HOZZER, 1, -29.2858, -3393.9516, -14.3585, 'Hozzer'),
    (@HOZZER, 2, -36.4373, -3417.6162, -14.7240, 'Hozzer');

DELETE FROM waypoints WHERE entry=@STERLING;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
    (@STERLING, 1, -35.703812, -3425.64, 5.2230, '\"Mad\" Jonah Sterling'),
    (@STERLING, 2, -39.0669, -3420.677, -14.4579, '\"Mad\" Jonah Sterling');


-- To Venomspite! - [H] http://www.wowhead.com/quest=12182/to-venomspite

DELETE FROM smart_scripts WHERE entryorguid=24155 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (24155, 0, 0, 1, 4, 0, 100, 0, 0, 0, 0, 0, 12, 9521, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tobias Sarkhoff - On Aggro - Summon Creature \'Enraged Felbat\''),
    (24155, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 12, 9521, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tobias Sarkhoff - On Aggro - Summon Creature \'Enraged Felbat\''),
    (24155, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tobias Sarkhoff - On Aggro - Say Line 0'),
    (24155, 0, 3, 0, 19, 0, 100, 0, 12182, 0, 0, 0, 52, 837, 0, 0, 0, 0, 0, 21, 30, 0, 0, 0, 0, 0, 0, 'Tobias Sarkhoff - On Quest Accepted - Activate Taxi');


-- Everything Must Be Ready - [A] http://www.wowhead.com/quest=11406/everything-must-be-ready

UPDATE quest_template_addon SET PrevQuestID=11332 WHERE ID=11406;


-- Into the World of Spirits - [A] http://www.wowhead.com/quest=11333/into-the-world-of-spirits

SET @GO_REAGENT_POUCH := 6354;
DELETE FROM gameobject WHERE id=186662;
DELETE FROM gameobject WHERE guid IN(@GO_REAGENT_POUCH, @GO_REAGENT_POUCH+1, @GO_REAGENT_POUCH+2) AND id=186662;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
    (@GO_REAGENT_POUCH, 186662, 571, 0, 0, 1, 1, 1032.58, -5153.86, -51.1602, -1.64061, 0, 0, 0, 1, 180, 100, 1, 0),
    (@GO_REAGENT_POUCH+1, 186662, 571, 0, 0, 1, 1, 725.215, -5169.55, -73.8399, 6.24164, 0, 0, 0.0207709, -0.999784, 180, 0, 1, 0),
    (@GO_REAGENT_POUCH+2, 186662, 571, 0, 0, 1, 1, 793.38, -5150.03, -82.557, 0.54751, 0, 0, 0.270348, 0.962763, 180, 0, 1, 0);

SET @REAGENT_POUCH_POOL_ENTRY := 369;
DELETE FROM pool_template WHERE entry IN(@REAGENT_POUCH_POOL_ENTRY);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
    (@REAGENT_POUCH_POOL_ENTRY, 1, 'Reagent Pouch');

DELETE FROM pool_gameobject WHERE guid IN(@GO_REAGENT_POUCH, @GO_REAGENT_POUCH+1, @GO_REAGENT_POUCH+2) AND pool_entry=@REAGENT_POUCH_POOL_ENTRY;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
    (@GO_REAGENT_POUCH, @REAGENT_POUCH_POOL_ENTRY, 34, ''),
    (@GO_REAGENT_POUCH+1, @REAGENT_POUCH_POOL_ENTRY, 33, ''),
    (@GO_REAGENT_POUCH+2, @REAGENT_POUCH_POOL_ENTRY, 33, '');


-- High Commander Halford Wyrmbane - [A] http://www.wowhead.com/quest=12298/high-commander-halford-wyrmbane

DELETE FROM smart_scripts WHERE entryorguid=23859 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (23859, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 80, 2385900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Greer Orehammer - On aggro - Run Script'),
    (23859, 0, 1, 0, 62, 0, 100, 0, 9546, 1, 0, 0, 56, 33634, 10, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Greer Orehammer - On gossip option select - give player 10 Orehammer\'s Precision Bombs'),
    (23859, 0, 2, 0, 62, 0, 100, 0, 9546, 1, 0, 0, 52, 745, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Greer Orehammer - On gossip option select - Plague This Taxi Start'),
    (23859, 0, 3, 0, 19, 0, 100, 0, 0, 0, 0, 0, 11, 48862, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Greer Orehammer - On Quest Accepted - Activate Taxi to Wintergarde Keep");


-- Winterhoof Emblem 33340
-- The Conqueror of Skorn! - [H] http://wotlk.openwow.com/quest=11261
-- Operation: Skornful Wrath - [A] http://wotlk.openwow.com/quest=11248

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=8898;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (15, 8898, 0, 0, 0, 8, 0, 11256, 0, 0, 0, 0, 0, '', 'Gossip Option requires Skorn Must Fall Rewarded'),
    (15, 8898, 0, 0, 0, 8, 0, 11258, 0, 0, 1, 0, 0, '', 'Gossip Option requires Burn, Skorn, Burn not Rewarded'),
    (15, 8898, 0, 0, 0, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem'),
    (15, 8898, 0, 0, 1, 8, 0, 11256, 0, 0, 0, 0, 0, '', 'Gossip Option requires Skorn Must Fall Rewarded'),
    (15, 8898, 0, 0, 1, 8, 0, 11257, 0, 0, 1, 0, 0, '', 'Gossip Option requires Gruesome but Necessary not Rewarded'),
    (15, 8898, 0, 0, 1, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem'),
    (15, 8898, 0, 0, 2, 8, 0, 11256, 0, 0, 0, 0, 0, '', 'Gossip Option requires Skorn Must Fall Rewarded'),
    (15, 8898, 0, 0, 2, 8, 0, 11259, 0, 0, 1, 0, 0, '', 'Gossip Option requires Towers of Certain Doom not Rewarded'),
    (15, 8898, 0, 0, 2, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem'),
    (15, 8898, 0, 0, 3, 8, 0, 11256, 0, 0, 0, 0, 0, '', 'Gossip Option requires Skorn Must Fall Rewarded'),
    (15, 8898, 0, 0, 3, 8, 0, 11261, 0, 0, 1, 0, 0, '', 'Gossip Option requires The Conqueror of Skorn! not Rewarded'),
    (15, 8898, 0, 0, 3, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem'),
    (15, 8898, 0, 0, 4, 8, 0, 11256, 0, 0, 1, 0, 0, '', 'Gossip Option requires Skorn Must Fall not Rewarded AND'),
    (15, 8898, 0, 0, 4, 8, 0, 11281, 0, 0, 0, 0, 0, '', 'Gossip Option requires Mimicking Nature''s Call Rewarded AND'),
    (15, 8898, 0, 0, 4, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem');

UPDATE quest_template_addon SET PrevQuestID=0 WHERE ID=11261;

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=8852;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (15, 8852, 0, 0, 0, 8, 0, 11248, 0, 0, 0, 0, 0, '', 'Gossip Option requires Operation: Skornful Wrath Rewarded'),
    (15, 8852, 0, 0, 0, 8, 0, 11247, 0, 0, 1, 0, 0, '', 'Gossip Option requires Burn, Skorn, Burn not Rewarded'),
    (15, 8852, 0, 0, 0, 2, 0, 33311, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not have Westguard Command Insignia'),
    (15, 8852, 0, 0, 1, 8, 0, 11248, 0, 0, 0, 0, 0, '', 'Gossip Option requires Operation: Skornful Wrath Rewarded'),
    (15, 8852, 0, 0, 1, 8, 0, 11246, 0, 0, 1, 0, 0, '', 'Gossip Option requires Gruesome but Necessary not Rewarded'),
    (15, 8852, 0, 0, 1, 2, 0, 33311, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Have Westguard Command Insignia'),
    (15, 8852, 0, 0, 2, 8, 0, 11248, 0, 0, 0, 0, 0, '', 'Gossip Option requires Operation: Skornful Wrath Rewarded'),
    (15, 8852, 0, 0, 2, 8, 0, 11245, 0, 0, 1, 0, 0, '', 'Gossip Option requires Towers of Certain Doom not Rewarded'),
    (15, 8852, 0, 0, 2, 2, 0, 33311, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not have Westguard Command Insignia'),
    (15, 8852, 0, 0, 3, 8, 0, 11248, 0, 0, 0, 0, 0, '', 'Gossip Option requires Operation: Skornful Wrath'),
    (15, 8852, 0, 0, 3, 8, 0, 11250, 0, 0, 1, 0, 0, '', 'Gossip Option requires All Hail the Conqueror of Skorn! not Rewarded'),
    (15, 8852, 0, 0, 3, 2, 0, 33311, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not have Westguard Command Insignia'),
    (15, 8852, 0, 0, 4, 8, 0, 11248, 0, 0, 1, 0, 0, '', 'Gossip Option requires Operation: Skornful Wrath NOT Rewarded AND'),
    (15, 8852, 0, 0, 4, 8, 0, 11332, 0, 0, 0, 0, 0, '', 'Gossip Option requires Mission: Plague This! Rewarded AND'),
    (15, 8852, 0, 0, 4, 2, 0, 33311, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Westguard Command Insignia');


-- "Crowleg" Dan - [A][H] http://www.wowhead.com/quest=11479/crowleg-dan

DELETE FROM `smart_scripts` WHERE `entryorguid`=24713 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (24713, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Crowleg\" Dan - On Agro - Say'),
    (24713, 0, 1, 0, 9, 0, 100, 0, 0, 5, 5000, 8000, 11, 50311, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Crowleg\" Dan - On Range - Cast Thrash Kick'),
    (24713, 0, 2, 3, 62, 0, 100, 0, 9335, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '\"Crowleg\" Dan - On Gossip Option Select - Close Gossip'),
    (24713, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 2, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Crowleg\" Dan - On Gossip Option Select - Set faction 14'),
    (24713, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '\"Crowleg\" Dan - On Gossip Option Select - Start Attack'),
    (24713, 0, 5, 0, 25, 0, 100, 0, 0, 0, 0, 0, 2, 1888, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Crowleg\" Dan - On Reset - Set faction 1888');


DELETE FROM `gossip_menu_option` WHERE `menu_id`=9335;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES 
(9335, 0, 0, 'Ummm... the frog says you''re a traitor, "matey."', 25738, 1, 1, 0, 0, 0, 0, NULL, 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9335;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 9335, 0, 0, 0, 9, 0, 11479, 0, 0, 0, 0, 0, '', 'Crowleg" Dan - Only show Gossip if player has quest active');


-- Meet Lieutenant Icehammer... - [A] http://wotlk.openwow.com/quest=11427

SET @GRYPHON:= 27886;

UPDATE creature_template SET AIName="SmartAI", InhabitType=5, speed_run=3 WHERE entry=@GRYPHON;
DELETE FROM smart_scripts WHERE entryorguid=@GRYPHON AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@GRYPHON,0,0,0,27,0,100,0,0,0,0,0,53,1,@GRYPHON,0,0,0,0,1,0,0,0,0,0,0,0,"Valgarde Gryphon - On Passenger Boarded - Start Waypoint"),
    (@GRYPHON,0,1,2,40,0,100,0,15,@GRYPHON,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Valgarde Gryphon - On Waypoint 15 Reached - Dismount"),
    (@GRYPHON,0,2,0,61,0,100,0,15,@GRYPHON,0,0,75,44795,0,0,0,0,0,17,0,30,0,0,0,0,0,"Valgarde Gryphon - On Waypoint 15 Reached - Add Aura 'Parachute'");

DELETE FROM waypoints WHERE entry=@GRYPHON;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@GRYPHON, 1, 611.694153, -5049.680176, 24.236082, 'Valgarde Gryphon'),
    (@GRYPHON, 2, 645.473206, -5088.019531, 30.966393, 'Valgarde Gryphon'),
    (@GRYPHON, 3, 712.810547, -5091.938965, 35.150776, 'Valgarde Gryphon'),
    (@GRYPHON, 4, 943.164795, -5001.226074, 51.646461, 'Valgarde Gryphon'),
    (@GRYPHON, 5, 1043.208984, -4975.551270, 42.536732, 'Valgarde Gryphon'),
    (@GRYPHON, 6, 1105.994263, -4981.366699, 44.616421, 'Valgarde Gryphon'),
    (@GRYPHON, 7, 1168.691772, -4956.152344, 43.580040, 'Valgarde Gryphon'),
    (@GRYPHON, 8, 1188.284546, -4949.069336, 43.889103, 'Valgarde Gryphon'),
    (@GRYPHON, 9, 1224.690918, -5034.330566, 45.493435, 'Valgarde Gryphon'),
    (@GRYPHON, 10, 1284.036011, -5064.889160, 70.936272, 'Valgarde Gryphon'),
    (@GRYPHON, 11, 1299.864014, -5123.960449, 92.312981, 'Valgarde Gryphon'),
    (@GRYPHON, 12, 1268.888550, -5172.307129, 125.225029, 'Valgarde Gryphon'),
    (@GRYPHON, 13, 1204.625854, -5202.031250, 162.438080, 'Valgarde Gryphon'),
    (@GRYPHON, 14, 1264.150391, -5293.074707, 194.687225, 'Valgarde Gryphon'),
    (@GRYPHON, 15, 1250.924927, -5318.654297, 202.334183, 'Valgarde Gryphon');

SET @ZOREK := 23728;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ZOREK;
DELETE FROM smart_scripts WHERE entryorguid=@ZOREK AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (@ZOREK, 0, 0, 0, 10, 0, 100, 0, 1, 50, 120000, 300000, 80, 2372800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Guard Captain Zorek - OOC LOS - Run Script'),
    (@ZOREK, 0, 1, 0, 19, 0, 100, 0, 11427, 0, 0, 0, 85, 49845, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Guard Captain Zorek - On quest accepted - Cast Valgarde Gryphon on Player');


-- Let Them Eat Crow - [H] http://www.wowhead.com/quest=11227/let-them-eat-crow

SET @PLAGUEHOUND := 23943;
UPDATE creature_template SET AIName='SmartAI' WHERE entry=@PLAGUEHOUND;
DELETE FROM smart_scripts WHERE entryorguid=@PLAGUEHOUND AND source_type=0;
INSERT INTO smart_scripts
VALUES    
    (@PLAGUEHOUND, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Just Summoned - Follow invoker'),
    (@PLAGUEHOUND, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 180000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Just Summoned - Follow invoker');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=42769;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (17, 0, 42769, 0, 0, 29, 0, @PLAGUEHOUND, 50, 0, 1, 0, 0, '', 'Hungry Plaguehound cannot be summoned near another Plaguehound');



-- Quest: Absholutely... Thish Will Work -- http://www.wowhead.com/quest=11330/absholutely-thish-will-work
UPDATE `creature_template` SET `ainame`='SmartAI' WHERE `entry` IN(23842,24284);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(23842,24284) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(23844) AND `source_type`=0 AND `id`=0;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN(2428400,2428401,2384200) AND `source_type`=9;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(23842,0,0,0,38,0,30,0,1,1,0,0,80,2384200,2,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - On Data Set - Run Script'),
(23842,0,1,0,0,0,100,0,5000,15000,20000,40000,11,48147,0,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - IC - Cast Crazed'),
(23842,0,2,0,0,0,100,1,500,500,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - IC - Cast Defensive'),
(23842,0,3,0,0,0,100,0,1000,3000,10400,10400,11,3639,0,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - IC - Cast Improved Blocking'),
(23842,0,4,0,0,0,100,0,2000,5000,10000,21000,11,11972,0,0,0,0,0,2,0,0,0,0,0,0,0,'Westguard Defender - IC - Cast ShieldBash'),
(23842,0,5,0,0,0,100,0,0,5000,1000,6000,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Westguard Defender - IC - Cast Shoot'),
(24284,0,0,0,8,0,100,0,43386,0,0,0,80,2428400,2,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - On Spell Hit (Peppys Special Mix) - Run Script'),
(24284,0,1,2,40,0,100,0,1,24284,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - On Reached WP1 - Say Line 0'),
(24284,0,2,0,61,0,100,0,0,0,0,0,54,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - On Reached WP1 - Pause WP'),
(24284,0,3,4,40,0,100,0,9,24284,0,0,11,43401,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - On Reached WP9 - Cast Cosmetic - Blood Explosion Green - Large'),
(24284,0,4,5,61,0,100,0,0,0,0,0,3,0,1145,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - On Reached WP9 - Change displayid to 1145'),
(24284,0,5,0,61,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - On Reached WP9 - Set Phase 2'),
(24284,0,6,0,1,2,100,1,4000,4000,0,0,80,2428401,2,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - OOC (Phase 2) - Run Script'),
(2384200,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,19,24288,0,0,0,0,0,0,'Westguard Defender - Script - Face Target'), -- 19:36:43.046
(2384200,9,1,0,0,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - Script - Set Bytes 1'), -- 19:36:43.046
(2384200,9,2,0,0,0,100,0,1000,1000,0,0,11,43391,0,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - Script - Cast Vomit'), -- 19:36:44.231
(2384200,9,3,0,0,0,100,0,9000,9000,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - Script - Set Bytes 1'), -- 19:36:53.872
(2384200,9,4,0,0,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - Script - Evade'), 
(2428401,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,10,99027,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Say'), 
(2428401,9,1,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,10,99023,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Say'), 
(2428401,9,2,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,10,99012,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Say'), 
(2428401,9,3,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,10,99010,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Say'), 
(2428401,9,4,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,10,99024,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Say'), 
(2428401,9,5,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,10,99026,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Say'), 
(2428401,9,6,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,9,23842,0,80,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Set Data'), 
(2428401,9,7,0,0,0,100,0,1000,1000,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Cast Suicide, No Blood, No Logging'), 
(2428400,9,0,0,0,0,100,0,0,0,0,0,5,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Play Emote (OneShotEat)'), -- 19:36:18.195
(2428400,9,1,0,0,0,100,0,0,0,0,0,71,0,0,2200,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Equip item 2200 to Slot 1'), -- 19:36:18.195
(2428400,9,2,0,0,0,100,0,2800,2800,0,0,11,21862,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Cast Radiation'), -- 19:36:20.925
(2428400,9,3,0,0,0,100,0,0,0,0,0,33,24284,0,0,0,0,0,7,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Give Quest Credit'),
(2428400,9,4,0,0,0,100,0,0,0,0,0,71,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - UnEquip item'), -- 19:36:20.925
(2428400,9,5,0,0,0,100,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Remove Bytes 1'), -- 19:36:20.925
(2428400,9,6,0,0,0,100,0,3200,3200,0,0,4,9110,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Play Sound 9110'), -- 19:36:23.421
(2428400,9,7,0,0,0,100,0,0,0,0,0,5,53,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Play Emote OneShotBattleRoar'), -- 19:36:23.421
(2428400,9,8,0,0,0,100,0,1200,1200,0,0,53,0,24284,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Start WP'), -- 19:36:24.622
(2428400,9,9,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,10,99027,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Say'), -- 19:36:24.622
(2428400,9,10,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,10,99023,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Say'), -- 19:36:24.622
(2428400,9,11,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,10,99012,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Say'); -- 19:36:24.622


DELETE FROM `waypoints` WHERE `entry`=24284;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(24284, 1, 1366.673, -3179.636, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 2, 1367.06, -3177.925, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 3, 1368.679, -3181.09, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 4, 1367.308, -3179.079, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 5, 1366.374, -3179.791, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 6, 1365.373, -3179.188, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 7, 1365.733, -3179.677, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 8, 1366.468, -3176.728, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 9, 1365.269, -3181.054, 153.576, 'Dragonflayer Vrykul Prisoner');

DELETE FROM `creature_text` WHERE `entry`IN(24284,23842);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(24284, 0, 0, 'The vrykul clutches at his throat as he begins to gag and thrash about.', 16, 0, 100, 53, 0, 0, 23087, 'Dragonflayer Vrykul Prisoner to Player'),
(23842, 0, 0, 'Uh...?', 12, 7, 100, 1, 0, 0, 23103, 'Westguard Defender to Player'),
(23842, 0, 1, 'Interesting.', 12, 7, 100, 1, 0, 0, 23107, 'Westguard Defender to Player'),
(23842, 0, 2, 'Yikes.', 12, 7, 100, 0, 0, 0, 23104, 'Westguard Defender to Player'),
(23842, 0, 3, 'Is he okay?', 12, 7, 100, 0, 0, 0, 23105, 'Westguard Defender to Player'),
(23842, 0, 4, 'Captain''s not gonna like this.', 12, 7, 100, 0, 0, 0, 23106, 'Westguard Defender to Player'),
(23842, 0, 5, 'Whoa.', 12, 7, 100, 0, 0, 0, 23108, 'Westguard Defender to Player'),
(23842, 1, 0, 'I didn''t know they could do that.', 12, 7, 100, 1, 0, 0, 23096, 'Westguard Defender to Player'),
(23842, 1, 1, 'That''s... special.', 12, 7, 100, 1, 0, 0, 23097, 'Westguard Defender to Player'),
(23842, 1, 2, 'Heh, cool!', 12, 7, 100, 1, 0, 0, 23094, 'Westguard Defender to Player'),
(23842, 1, 3, 'That''s the new Forsaken plague?', 12, 7, 100, 1, 0, 0, 23098, 'Westguard Defender to Player'),
(23842, 1, 4, 'What kind of sicko are you?', 12, 7, 100, 1, 0, 0, 23095, 'Westguard Defender to Player'),
(23842, 1, 5, 'Oh, sick!', 12, 7, 100, 1, 0, 0, 23091, 'Westguard Defender to Player'),
(23842, 1, 6, 'I feel ill.', 12, 7, 100, 1, 0, 0, 23093, 'Westguard Defender to Player'),
(23842, 1, 7, 'That did NOT just happen!', 12, 7, 100, 1, 0, 0, 23092, 'Westguard Defender to Player');

-- Shoveltusk Ligament -- http://wotlk.openwow.com/item=33611
UPDATE `creature_loot_template` SET `Chance`=45 WHERE `Item`=33611;

-- We Call Him Steelfeather (11418)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=24514;
DELETE FROM smart_scripts WHERE entryorguid=24514 AND source_type=0;
INSERT INTO smart_scripts VALUES(24514, 0, 0, 1, 8, 0, 100, 0, 43969, 0, 0, 0, 19, 524288, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Evade Hack');
INSERT INTO smart_scripts VALUES(24514, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 60, 1, 300, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Set Fly');
INSERT INTO smart_scripts VALUES(24514, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Store Target');
INSERT INTO smart_scripts VALUES(24514, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 53, 1, 24514, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Start WP');
INSERT INTO smart_scripts VALUES(24514, 0, 4, 5, 40, 0, 100, 0, 5, 0, 0, 0, 33, 24515, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'On WP Reach - Kill Credit');
INSERT INTO smart_scripts VALUES(24514, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 28, 43969, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'On WP Reach - Remove Aura');
INSERT INTO smart_scripts VALUES(24514, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Despawn');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=43969;
INSERT INTO conditions VALUES (17, 0, 43969, 0, 0, 31, 1, 3, 24514, 0, 0, 0, 0, '', 'Requires Steelfeather');
DELETE FROM waypoints WHERE entry=24514;
INSERT INTO waypoints VALUES (24514, 1, 2613, -5086.51, 398.899, 'Steelfeather'),(24514, 2, 2640.59, -5144.9, 427.292, 'Steelfeather'),(24514, 3, 2611.1, -5253.76, 419.437, 'Steelfeather'),(24514, 4, 2575.39, -5252.23, 382.764, 'Steelfeather'),(24514, 5, 2570.71, -5228.31, 376.612, 'Steelfeather');
DELETE FROM creature_text WHERE entry IN(24139, 24131);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(24131, 0, 0, 'Why not? Just think how much better it\'ll look with the hatchlings to either side --', 12, 0, 100, 0, 0, 0, 'Trapper Jethan'),
(24131, 1, 0, 'What? I\'m just sayin\' that\'s how we do things in Grizzly Hills.', 12, 0, 100, 0, 0, 0, 'Trapper Jethan'),
(24139, 0, 0, 'Y\'hear that, Jethan? You\'re not getting that Steelfeather trophy now that we know she\'s a mother.', 12, 0, 100, 0, 0, 0, 'Gil Grisert'),
(24139, 1, 0, 'Jethan!', 12, 0, 100, 0, 0, 0, 'Gil Grisert');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=24139;
DELETE FROM smart_scripts WHERE entryorguid=24139 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=24139*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (24139, 0, 0, 0, 20, 0, 100, 0, 11418, 0, 0, 0, 80, 24139*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Rewarded - Script9');
INSERT INTO smart_scripts VALUES (24139*100, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script 9 - Talk');
INSERT INTO smart_scripts VALUES (24139*100, 9, 1, 0, 0, 0, 100, 0, 8000, 8000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, 24131, 0, 0, 0, 0, 0, 0, 'Script 9 - Talk');
INSERT INTO smart_scripts VALUES (24139*100, 9, 2, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script 9 - Talk');
INSERT INTO smart_scripts VALUES (24139*100, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, 24131, 0, 0, 0, 0, 0, 0, 'Script 9 - Talk');

-- DB/Quest: Gruesome, But Necessary
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=43036;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES 
(17,0,43036,0,0,36,1,0,0,0,1,0,0,'',"'The Brave's Machete' - Target must be dead"),
(17,0,43036,0,1,31,1,3,23661,0,0,0,0,'',"'The Brave's Machete' must target Winterskorn Tribesman"),
(17,0,43036,0,1,31,1,3,23662,0,0,0,0,'',"'The Brave's Machete' must target Winterskorn Woodsman"),
(17,0,43036,0,1,31,1,3,23663,0,0,0,0,'',"'The Brave's Machete' must target Winterskorn Shield-Maiden"),
(17,0,43036,0,1,31,1,3,23664,0,0,0,0,'',"'The Brave's Machete' must target Winterskorn Warrior"),
(17,0,43036,0,1,31,1,3,23665,0,0,0,0,'',"'The Brave's Machete' must target Winterskorn Raider"),
(17,0,43036,0,1,31,1,3,23666,0,0,0,0,'',"'The Brave's Machete' must target Winterskorn Berserker"),
(17,0,43036,0,1,31,1,3,23667,0,0,0,0,'',"'The Brave's Machete' must target Winterskorn Rune-Seer"),
(17,0,43036,0,1,31,1,3,23668,0,0,0,0,'',"'The Brave's Machete' must target Winterskorn Rune-Caster"),
(17,0,43036,0,1,31,1,3,23669,0,0,0,0,'',"'The Brave's Machete' must target Winterskorn Oracle"),
(17,0,43036,0,1,31,1,3,23670,0,0,0,0,'',"'The Brave's Machete' must target Winterskorn Elder");