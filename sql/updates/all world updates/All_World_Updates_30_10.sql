/* 
* sql\updates\world\2015_09_29_02_world.sql 
*/ 
-- 
UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry`=29639;
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `guid`=105166;
UPDATE `creature_addon` SET `auras`=29266 WHERE `guid`=105166;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=29500;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (29558, 32520);
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `guid`=105243;
UPDATE `creature_addon` SET `auras`=29266 WHERE `guid`=105243;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `Entry` IN (29351, 29358);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (29351, 29358) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29351,0,0,0,0,0,100,0,2000,5000,7000,9000,11,38621,0,0,0,0,0,2,0,0,0,0,0,0,0,'Niffelem Frost Giant - IC - Cast Debilitating Strike'),
(29358,0,0,0,0,0,100,0,2000,5000,7000,9000,11,61572,0,0,0,0,0,2,0,0,0,0,0,0,0,'Frostworg - IC - Cast Frostbite'),
(29358,0,1,0,0,0,100,0,2000,6000,6000,9000,11,50075,0,0,0,0,0,2,0,0,0,0,0,0,0,'Frostworg - IC - Cast Maim Flesh');
 
 
/* 
* sql\updates\world\2015_09_29_03_world.sql 
*/ 
-- 

DELETE FROM `creature` WHERE `id`=29558;
UPDATE `creature_template` SET `npcflag`=16777216 WHERE `entry` IN (29351, 29358);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (29358, 29351);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(29358,46598,0,0),
(29351,46598,0,0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (29358, 29351);
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`) VALUES
(29351,29558,0,1, 'Niffelem Frost Giant', 8),
(29351,29558,1,1, 'Niffelem Frost Giant', 8),
(29351,29558,2,1, 'Niffelem Frost Giant', 8),
(29351,29558,3,1, 'Niffelem Frost Giant', 8),
(29358,29558,0,1, 'Frostworg', 8),
(29358,29558,1,1, 'Frostworg', 8);
 
 
/* 
* sql\updates\world\2015_09_30_00_world.sql 
*/ 
-- 
UPDATE `waypoint_data` SET `position_z` = 45.5099 WHERE `id` = 845820 AND `point` = 5;
 
 
/* 
* sql\updates\world\2015_10_01_00_world.sql 
*/ 
-- Pathing for Azuremyst Peacekeeper Entry: 18038 'TDB FORMAT' 
SET @NPC := 63772;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4171.392,`position_y`=-12464.35,`position_z`=44.40071 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,4097,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4171.392,-12464.35,44.40071,0,0,0,0,100,0),
(@PATH,2,-4172.635,-12441.57,43.73568,0,0,0,0,100,0),
(@PATH,3,-4183.271,-12464.69,44.86507,0,0,0,0,100,0),
(@PATH,4,-4191.694,-12478.19,45.88747,0,0,0,0,100,0),
(@PATH,5,-4208.529,-12485.6,44.76502,0,0,0,0,100,0),
(@PATH,6,-4206.412,-12507.59,45.07471,0,0,0,0,100,0),
(@PATH,7,-4195.887,-12522.06,45.18763,0,0,0,0,100,0),
(@PATH,8,-4175.124,-12527.87,44.7594,0,0,0,0,100,0),
(@PATH,9,-4159.117,-12516.98,44.69878,0,0,0,0,100,0),
(@PATH,10,-4153.929,-12500.22,44.07134,0,0,0,0,100,0),
(@PATH,11,-4155.868,-12489.98,44.48027,0,0,0,0,100,0);

-- Pathing for Azuremyst Peacekeeper Entry: 18038 'TDB FORMAT' 
SET @NPC := 63774;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4200.606,`position_y`=-12494.63,`position_z`=44.62513 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,4097,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4200.606,-12494.63,44.62513,0,0,0,0,100,0),
(@PATH,2,-4177.409,-12486.11,44.26247,0,0,0,0,100,0),
(@PATH,3,-4164.705,-12500.84,44.40313,0,0,0,0,100,0),
(@PATH,4,-4134.247,-12503.81,43.62505,0,0,0,0,100,0),
(@PATH,5,-4100.406,-12490.22,40.99446,0,0,0,0,100,0),
(@PATH,6,-4067.271,-12473.87,35.7093,0,0,0,0,100,0),
(@PATH,7,-4034.042,-12460.46,31.01041,0,0,0,0,100,0),
(@PATH,8,-4000.527,-12450.34,25.04846,0,0,0,0,100,0),
(@PATH,9,-3967.376,-12442.74,18.43705,0,0,0,0,100,0),
(@PATH,10,-3951.83,-12430.16,14.62435,0,0,0,0,100,0),
(@PATH,11,-3923.009,-12427.82,9.259804,0,0,0,0,100,0),
(@PATH,12,-3890.977,-12420.35,3.110225,0,0,0,0,100,0),
(@PATH,13,-3845.61,-12400.15,-0.5076148,0,0,0,0,100,0),
(@PATH,14,-3799.788,-12396.9,-1.57003,0,0,0,0,100,0),
(@PATH,15,-3767.789,-12389.86,-1.612022,0,0,0,0,100,0),
(@PATH,16,-3733.884,-12386.01,-2.563792,0,0,0,0,100,0),
(@PATH,17,-3699.675,-12379.4,-3.253355,0,0,0,0,100,0),
(@PATH,18,-3676.898,-12366.13,-3.005086,0,0,0,0,100,0),
(@PATH,19,-3634.198,-12353.74,-1.517532,0,0,0,0,100,0),
(@PATH,20,-3600.196,-12362.62,0.9561348,0,0,0,0,100,0),
(@PATH,21,-3566.171,-12360.33,3.723941,0,0,0,0,100,0),
(@PATH,22,-3533.756,-12360.66,6.88605,0,0,0,0,100,0),
(@PATH,23,-3500.217,-12359.56,9.171444,0,0,0,0,100,0),
(@PATH,24,-3533.756,-12360.66,6.88605,0,0,0,0,100,0),
(@PATH,25,-3566.171,-12360.33,3.723941,0,0,0,0,100,0),
(@PATH,26,-3600.196,-12362.62,0.9561348,0,0,0,0,100,0),
(@PATH,27,-3634.033,-12353.8,-1.465286,0,0,0,0,100,0),
(@PATH,28,-3676.898,-12366.13,-3.005086,0,0,0,0,100,0),
(@PATH,29,-3699.675,-12379.4,-3.253355,0,0,0,0,100,0),
(@PATH,30,-3733.884,-12386.01,-2.563792,0,0,0,0,100,0),
(@PATH,31,-3767.789,-12389.86,-1.612022,0,0,0,0,100,0),
(@PATH,32,-3799.788,-12396.9,-1.57003,0,0,0,0,100,0),
(@PATH,33,-3845.61,-12400.15,-0.5076148,0,0,0,0,100,0),
(@PATH,34,-3890.977,-12420.35,3.110225,0,0,0,0,100,0),
(@PATH,35,-3923.009,-12427.82,9.259804,0,0,0,0,100,0),
(@PATH,36,-3951.679,-12430.06,14.65267,0,0,0,0,100,0),
(@PATH,37,-3967.376,-12442.74,18.43705,0,0,0,0,100,0),
(@PATH,38,-4000.527,-12450.34,25.04846,0,0,0,0,100,0),
(@PATH,39,-4034.023,-12460.46,30.9877,0,0,0,0,100,0),
(@PATH,40,-4067.271,-12473.87,35.7093,0,0,0,0,100,0),
(@PATH,41,-4100.406,-12490.22,40.99446,0,0,0,0,100,0),
(@PATH,42,-4134.247,-12503.81,43.62505,0,0,0,0,100,0),
(@PATH,43,-4164.705,-12500.84,44.40313,0,0,0,0,100,0),
(@PATH,44,-4177.409,-12486.11,44.26247,0,0,0,0,100,0);

-- Pathing for Azuremyst Peacekeeper Entry: 18038 'TDB FORMAT' 
SET @NPC := 63773;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4134.126,`position_y`=-12506.01,`position_z`=43.88897 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,4097,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4134.126,-12506.01,43.88897,0,0,0,0,100,0),
(@PATH,2,-4167.211,-12511.93,44.3844,0,0,0,0,100,0),
(@PATH,3,-4197.208,-12508.09,44.48694,0,0,0,0,100,0),
(@PATH,4,-4233.25,-12487.22,41.86756,0,0,0,0,100,0),
(@PATH,5,-4267.729,-12476.33,29.47266,0,0,0,0,100,0),
(@PATH,6,-4289.251,-12471.83,24.20484,0,0,0,0,100,0),
(@PATH,7,-4319.148,-12478.5,18.93451,0,0,0,0,100,0),
(@PATH,8,-4333.606,-12469.67,15.57558,0,0,0,0,100,0),
(@PATH,9,-4364.828,-12471.54,10.27822,0,0,0,0,100,0),
(@PATH,10,-4399.945,-12455.7,5.627916,0,0,0,0,100,0),
(@PATH,11,-4432.767,-12443.6,2.278673,0,0,0,0,100,0),
(@PATH,12,-4467.428,-12430.61,2.763325,0,0,0,0,100,0),
(@PATH,13,-4499.994,-12415.54,4.523335,0,0,0,0,100,0),
(@PATH,14,-4533.506,-12416.08,7.310507,0,0,0,0,100,0),
(@PATH,15,-4566.756,-12417.92,9.204178,0,0,0,0,100,0),
(@PATH,16,-4533.506,-12416.08,7.310507,0,0,0,0,100,0),
(@PATH,17,-4499.994,-12415.54,4.523335,0,0,0,0,100,0),
(@PATH,18,-4467.428,-12430.61,2.763325,0,0,0,0,100,0),
(@PATH,19,-4432.767,-12443.6,2.278673,0,0,0,0,100,0),
(@PATH,20,-4399.945,-12455.7,5.627916,0,0,0,0,100,0),
(@PATH,21,-4364.828,-12471.54,10.27822,0,0,0,0,100,0),
(@PATH,22,-4333.889,-12469.66,15.56435,0,0,0,0,100,0),
(@PATH,23,-4319.148,-12478.5,18.93451,0,0,0,0,100,0),
(@PATH,24,-4289.251,-12471.83,24.20484,0,0,0,0,100,0),
(@PATH,25,-4267.729,-12476.33,29.47266,0,0,0,0,100,0),
(@PATH,26,-4233.25,-12487.22,41.86756,0,0,0,0,100,0),
(@PATH,27,-4197.208,-12508.09,44.48694,0,0,0,0,100,0),
(@PATH,28,-4167.211,-12511.93,44.3844,0,0,0,0,100,0);

DELETE FROM `creature` WHERE `guid`=63770;
DELETE FROM `creature_addon` WHERE `guid`=63770;
 
 
/* 
* sql\updates\world\2015_10_01_01_world.sql 
*/ 
-- 
SET @ENTRY := 34102;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (@ENTRY, 33462, 33480, 33459, 33467, 33477, 33465);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY, 33462, 33480, 33459, 33467, 33477, 33465) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY*100, @ENTRY*100+1, @ENTRY*100+2, @ENTRY*100+3, @ENTRY*100+4, @ENTRY*100+5, @ENTRY*100+6, 33462*100, 33480*100, 33459*100, 33467*100, 33477*100, 33465*100, 33462*100+1, 33480*100+1, 33459*100+1, 33467*100+1, 33477*100+1, 33465*100+1) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,600000,600000,1200000,1200000,53,0,@ENTRY*10,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - OOC - Action List"),
(@ENTRY,0,1,0,40,0,100,0,1,@ENTRY*10,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - On waypoint reached - Action List"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,8494.070313, 1102.23584, 554.327515, 3.772250,"Argent Confessor Paletress - Action List - Set orientation"),
(@ENTRY*100,9,1,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,2,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,3,0,0,0,100,0,7000,7000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,4,0,0,0,100,0,5000,5000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,5,0,0,0,100,0,7000,7000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,6,0,0,0,100,0,5000,5000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,7,0,0,0,100,0,5000,5000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,8,0,0,0,100,0,7000,7000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,9,0,0,0,100,0,7000,7000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,10,0,0,0,100,0,7000,7000,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,11,0,0,0,100,0,5000,5000,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,12,0,0,0,100,0,5000,5000,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,13,0,0,0,100,0,5000,5000,0,0,1,12,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,14,0,0,0,100,0,7000,7000,0,0,1,13,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,15,0,0,0,100,0,5000,5000,0,0,1,14,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,16,0,0,0,100,0,5000,5000,0,0,1,15,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,17,0,0,0,100,0,6000,6000,0,0,1,16,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,18,0,0,0,100,0,6000,6000,0,0,1,17,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,19,0,0,0,100,0,7000,7000,0,0,1,18,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Talk"),
(@ENTRY*100,9,20,0,0,0,100,0,7000,7000,0,0,53,0,@ENTRY*10+1,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Action List - Start wp"),
(@ENTRY,0,2,0,40,0,100,0,2,@ENTRY*10+1,0,0,87,@ENTRY*100+1,@ENTRY*100+2,@ENTRY*100+3,@ENTRY*100+4,@ENTRY*100+5,@ENTRY*100+5,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - On data set - Random Action List"),
(@ENTRY*100+1,9,0,0,0,0,100,0,0,0,0,0,54,18000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Random Action List - Set Data"),
(@ENTRY*100+1,9,1,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,33462,50,0,0,0,0,0,"Argent Confessor Paletress - Random Action List - Set Data"),
(@ENTRY*100+2,9,0,0,0,0,100,0,0,0,0,0,54,18000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Random Action List - Set Data"),
(@ENTRY*100+2,9,1,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,33480,50,0,0,0,0,0,"Argent Confessor Paletress - Random Action List - Set Data"),
(@ENTRY*100+3,9,0,0,0,0,100,0,0,0,0,0,54,18000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Random Action List - Set Data"),
(@ENTRY*100+3,9,1,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,33459,50,0,0,0,0,0,"Argent Confessor Paletress - Random Action List - Set Data"),
(@ENTRY*100+4,9,0,0,0,0,100,0,0,0,0,0,54,18000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Random Action List - Set Data"),
(@ENTRY*100+4,9,1,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,33467,50,0,0,0,0,0,"Argent Confessor Paletress - Random Action List - Set Data"),
(@ENTRY*100+5,9,0,0,0,0,100,0,0,0,0,0,54,18000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Random Action List - Set Data"),
(@ENTRY*100+5,9,1,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,33477,50,0,0,0,0,0,"Argent Confessor Paletress - Random Action List - Set Data"),
(@ENTRY*100+6,9,0,0,0,0,100,0,0,0,0,0,54,18000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - Random Action List - Set Data"),
(@ENTRY*100+6,9,1,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,33465,50,0,0,0,0,0,"Argent Confessor Paletress - Random Action List - Set Data"),
(@ENTRY,0,3,0,38,0,100,0,1,1,0,0,69,0,0,0,0,0,0,8,0,0,0,8490.290039, 1111.510010, 554.333984, 4.642580,"Argent Confessor Paletress - On data set - move to pos"),
(@ENTRY,0,4,0,38,0,100,0,1,2,0,0,5,23,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - On data set - play emote"),
(@ENTRY,0,5,0,38,0,100,0,1,3,0,0,5,17,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Confessor Paletress - On data set - play emote"),
(33462,0,0,0,38,0,100,0,1,1,0,0,80,33462*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - On data set - Action List"),
(33462*100,9,0,0,0,0,100,0,0,0,0,0,91,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - Action List - Set up"),
(33462*100,9,1,0,0,0,100,0,0,0,0,0,53,0,33462*10,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - Action List - Start waypoint"),
(33480,0,0,0,38,0,100,0,1,1,0,0,80,33480*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - On data set - Action List"),
(33480*100,9,0,0,0,0,100,0,0,0,0,0,91,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - Action List - Set up"),
(33480*100,9,1,0,0,0,100,0,0,0,0,0,53,0,33480*10,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - Action List - Start waypoint"),
(33459,0,0,0,38,0,100,0,1,1,0,0,80,33459*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - On data set - Action List"),
(33459*100,9,0,0,0,0,100,0,0,0,0,0,91,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - Action List - Set up"),
(33459*100,9,1,0,0,0,100,0,0,0,0,0,53,0,33459*10,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - Action List - Start waypoint"),
(33467,0,0,0,38,0,100,0,1,1,0,0,80,33467*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - On data set - Action List"),
(33467*100,9,0,0,0,0,100,0,0,0,0,0,91,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - Action List - Set up"),
(33467*100,9,1,0,0,0,100,0,0,0,0,0,53,0,33467*10,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - Action List - Start waypoint"),
(33477,0,0,0,38,0,100,0,1,1,0,0,80,33477*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - On data set - Action List"),
(33477*100,9,0,0,0,0,100,0,0,0,0,0,91,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - Action List - Set up"),
(33477*100,9,1,0,0,0,100,0,0,0,0,0,53,0,33477*10,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - Action List - Start waypoint"),
(33465,0,0,0,38,0,100,0,1,1,0,0,80,33465*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - On data set - Action List"),
(33465*100,9,0,0,0,0,100,0,0,0,0,0,91,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - Action List - Set up"),
(33465*100,9,1,0,0,0,100,0,0,0,0,0,53,0,33465*10,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - Action List - Start waypoint"),
(33462,0,1,0,40,0,100,0,5,33462*10,0,0,80,33462*100+1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - On waypoint reached - Action List"),
(33462*100+1,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,8485.782227, 1114.010864, 554.297485, 5.774796,"Gnomeregan Champion - Action List - Set orientation"),
(33462*100+1,9,1,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - Action List - Talk"),
(33462*100+1,9,2,0,0,0,100,0,6000,6000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - Action List - Talk"),
(33462*100+1,9,3,0,0,0,100,0,6000,6000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - Action List - Talk"),
(33462*100+1,9,4,0,0,0,100,0,10000,10000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - Action List - Talk"),
(33462*100+1,9,5,0,0,0,100,0,6000,6000,0,0,1,19,0,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Gnomeregan Champion - Action List - Talk"),
(33462*100+1,9,6,0,0,0,100,0,6000,6000,0,0,1,20,0,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Gnomeregan Champion - Action List - Talk"),
(33462*100+1,9,7,0,0,0,100,0,6000,6000,0,0,45,1,1,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Gnomeregan Champion - Action List - Set Data"),
(33462*100+1,9,8,0,0,0,100,0,0,0,0,0,53,0,33462*10+1,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - Action List - Start waypoint"),
(33462,0,2,0,40,0,100,0,5,33462*10+1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - On waypoint reached - Despawn"),
(33480,0,1,0,40,0,100,0,5,33480*10,0,0,80,33480*100+1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - On waypoint reached - Action List"),
(33480*100+1,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,8485.782227, 1114.010864, 554.297485, 5.774796,"Ironforge Champion - Action List - Set orientation"),
(33480*100+1,9,1,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - Action List - Talk"),
(33480*100+1,9,2,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - Action List - Talk"),
(33480*100+1,9,3,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - Action List - Talk"),
(33480*100+1,9,4,0,0,0,100,0,5000,5000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - Action List - Talk"),
(33480*100+1,9,5,0,0,0,100,0,5000,5000,0,0,1,21,0,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Ironforge Champion - Action List - Talk"),
(33480*100+1,9,6,0,0,0,100,0,5000,5000,0,0,45,1,1,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Ironforge Champion - Action List - Set Data"),
(33480*100+1,9,7,0,0,0,100,0,0,0,0,0,53,0,33480*10+1,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - Action List - Start waypoint"),
(33480,0,2,0,40,0,100,0,5,33480*10+1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - On waypoint reached - Despawn"),
(33459,0,1,0,40,0,100,0,3,33459*10,0,0,80,33459*100+1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - On waypoint reached - Action List"),
(33459*100+1,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,8485.782227, 1114.010864, 554.297485, 5.774796,"Orgrimmar Champion - Action List - Set orientation"),
(33459*100+1,9,1,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - Action List - Talk"),
(33459*100+1,9,2,0,0,0,100,0,6000,6000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - Action List - Talk"),
(33459*100+1,9,3,0,0,0,100,0,6000,6000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - Action List - Talk"),
(33459*100+1,9,4,0,0,0,100,0,6000,6000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - Action List - Talk"),
(33459*100+1,9,5,0,0,0,100,0,6000,6000,0,0,1,22,0,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Orgrimmar Champion - Action List - Talk"),
(33459*100+1,9,6,0,0,0,100,0,6000,6000,0,0,1,23,0,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Orgrimmar Champion - Action List - Talk"),
(33459*100+1,9,7,0,0,0,100,0,4000,4000,0,0,45,1,2,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Orgrimmar Champion - Action List - Set Data"),
(33459*100+1,9,8,0,0,0,100,0,1000,1000,0,0,5,11,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - Action List - Emote"),
(33459*100+1,9,9,0,0,0,100,0,2000,2000,0,0,1,24,0,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Orgrimmar Champion - Action List - Talk"),
(33459*100+1,9,10,0,0,0,100,0,6000,6000,0,0,45,1,1,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Orgrimmar Champion - Action List - Set Data"),
(33459*100+1,9,11,0,0,0,100,0,0,0,0,0,53,0,33459*10+1,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - Action List - Start waypoint"),
(33459,0,2,0,40,0,100,0,3,33459*10+1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - On waypoint reached - Despawn"),
(33467,0,1,0,40,0,100,0,4,33467*10,0,0,80,33467*100+1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - On waypoint reached - Action List"),
(33467*100+1,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,8485.782227, 1114.010864, 554.297485, 5.774796,"Silvermoon Champion - Action List - Set orientation"),
(33467*100+1,9,1,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - Action List - Talk"),
(33467*100+1,9,2,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - Action List - Talk"),
(33467*100+1,9,3,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - Action List - Talk"),
(33467*100+1,9,4,0,0,0,100,0,5000,5000,0,0,1,25,0,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Silvermoon Champion - Action List - Talk"),
(33467*100+1,9,5,0,0,0,100,0,8000,8000,0,0,1,26,0,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Silvermoon Champion - Action List - Talk"),
(33467*100+1,9,6,0,0,0,100,0,2000,2000,0,0,45,1,3,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Silvermoon Champion - Action List - Set Data"),
(33467*100+1,9,7,0,0,0,100,0,3000,3000,0,0,5,17,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - Action List - Emote"),
(33467*100+1,9,8,0,0,0,100,0,5000,5000,0,0,45,1,1,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Silvermoon Champion - Action List - Set Data"),
(33467*100+1,9,9,0,0,0,100,0,0,0,0,0,53,0,33467*10+1,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - Action List - Start waypoint"),
(33467,0,2,0,40,0,100,0,4,33467*10+1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - On waypoint reached - Despawn"),
(33477,0,1,0,40,0,100,0,6,33477*10,0,0,80,33477*100+1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - On waypoint reached - Action List"),
(33477*100+1,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,8485.782227, 1114.010864, 554.297485, 5.774796,"Stormwind Champion - Action List - Set orientation"),
(33477*100+1,9,1,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - Action List - Talk"),
(33477*100+1,9,2,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - Action List - Talk"),
(33477*100+1,9,3,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - Action List - Talk"),
(33477*100+1,9,4,0,0,0,100,0,5000,5000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - Action List - Talk"),
(33477*100+1,9,5,0,0,0,100,0,5000,5000,0,0,1,27,0,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Stormwind Champion - Action List - Talk"),
(33477*100+1,9,6,0,0,0,100,0,7000,7000,0,0,1,28,0,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Stormwind Champion - Action List - Talk"),
(33477*100+1,9,7,0,0,0,100,0,8000,8000,0,0,1,29,0,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Stormwind Champion - Action List - Talk"),
(33477*100+1,9,8,0,0,0,100,0,7000,7000,0,0,1,30,0,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Stormwind Champion - Action List - Talk"),
(33477*100+1,9,9,0,0,0,100,0,5000,5000,0,0,45,1,1,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Stormwind Champion - Action List - Set Data"),
(33477*100+1,9,10,0,0,0,100,0,0,0,0,0,53,0,33477*10+1,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - Action List - Start waypoint"),
(33477,0,2,0,40,0,100,0,6,33477*10+1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - On waypoint reached - Despawn"),
(33465,0,1,0,40,0,100,0,3,33465*10,0,0,80,33465*100+1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - On waypoint reached - Action List"),
(33465*100+1,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,8485.782227, 1114.010864, 554.297485, 5.774796,"Undercity Champion - Action List - Set orientation"),
(33465*100+1,9,1,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - Action List - Talk"),
(33465*100+1,9,2,0,0,0,100,0,5000,5000,0,0,1,31,0,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Undercity Champion - Action List - Talk"),
(33465*100+1,9,3,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - Action List - Talk"),
(33465*100+1,9,4,0,0,0,100,0,1000,1000,0,0,5,11,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - Action List - Emote"),
(33465*100+1,9,5,0,0,0,100,0,2000,2000,0,0,45,1,1,0,0,0,0,19,@ENTRY,15,0,0,0,0,0,"Undercity Champion - Action List - Set Data"),
(33465*100+1,9,6,0,0,0,100,0,3000,3000,0,0,5,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - Action List - Emote"),
(33465*100+1,9,7,0,0,0,100,0,3000,3000,0,0,53,0,33465*10+1,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - Action List - Start waypoint"),
(33465,0,2,0,40,0,100,0,3,33465*10+1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - On waypoint reached - Despawn");

DELETE FROM `waypoints` WHERE `entry`IN (@ENTRY*10, @ENTRY*10+1, 33462*10, 33462*10+1, 33480*10, 33480*10+1, 33459*10, 33459*10+1, 33467*10, 33467*10+1, 33477*10, 33477*10+1, 33465*10, 33465*10+1);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY*10+1,1,8490.655273, 1111.821045, 554.363525,'Argent Confessor Paletress'),
(@ENTRY*10+1,2,8488.863281, 1112.676514, 554.298096,'Argent Confessor Paletress'),
(@ENTRY*10,1,8494.070313, 1102.23584, 554.327515,'Argent Confessor Paletress'),
(33462*10,1,8491.833008, 1100.861572, 554.361450,'Champion'), 
(33462*10,2,8491.234375, 1102.656860, 554.360840,'Champion'),
(33462*10,3,8487.101563, 1107.712036, 554.363220,'Champion'),
(33462*10,4,8482.299805, 1113.207886, 554.349243,'Champion'),
(33462*10,5,8485.782227, 1114.010864, 554.297485,'Champion'),
(33462*10+1,1,8485.782227, 1114.010864, 554.297485,'Champion'),
(33462*10+1,2,8482.299805, 1113.207886, 554.349243,'Champion'),
(33462*10+1,3,8487.101563, 1107.712036, 554.363220,'Champion'),
(33462*10+1,4,8491.234375, 1102.656860, 554.360840,'Champion'),
(33462*10+1,5,8491.833008, 1100.861572, 554.361450,'Champion'),
(33480*10,1,8494.106445, 1097.863037, 554.344543,'Champion'),
(33480*10,2,8491.234375, 1102.656860, 554.360840,'Champion'),
(33480*10,3,8487.101563, 1107.712036, 554.363220,'Champion'),
(33480*10,4,8482.942383, 1113.390015, 554.340759,'Champion'),
(33480*10,5,8485.782227, 1114.010864, 554.297485,'Champion'),
(33480*10+1,1,8485.782227, 1114.010864, 554.297485,'Champion'),
(33480*10+1,2,8482.942383, 1113.390015, 554.340759,'Champion'),
(33480*10+1,3,8487.101563, 1107.712036, 554.363220,'Champion'),
(33480*10+1,4,8491.234375, 1102.656860, 554.360840,'Champion'),
(33480*10+1,5,8494.106445, 1097.863037, 554.344543,'Champion'),
(33459*10,1,8486.814453, 1107.731689, 554.365784,'Champion'),
(33459*10,2,8482.299805, 1113.207886, 554.349243,'Champion'),
(33459*10,3,8485.782227, 1114.010864, 554.297485,'Champion'),
(33459*10+1,1,8485.782227, 1114.010864, 554.297485,'Champion'),
(33459*10+1,2,8482.299805, 1113.207886, 554.349243,'Champion'),
(33459*10+1,3,8486.814453, 1107.731689, 554.365784,'Champion'),
(33467*10,1,8483.411133, 1105.254639, 554.445313,'Champion'),
(33467*10,2,8486.906250, 1107.583130, 554.366699,'Champion'),
(33467*10,3,8482.692383, 1113.328857, 554.342896,'Champion'),
(33467*10,4,8485.782227, 1114.010864, 554.297485,'Champion'),
(33467*10+1,1,8485.782227, 1114.010864, 554.297485,'Champion'),
(33467*10+1,2,8482.692383, 1113.328857, 554.342896,'Champion'),
(33467*10+1,3,8486.906250, 1107.583130, 554.366699,'Champion'),
(33467*10+1,4,8483.411133, 1105.254639, 554.445313,'Champion'),
(33477*10,1,8492.628906, 1091.799683, 554.420837,'Champion'),
(33477*10,2,8496.347656, 1094.432129, 554.335510,'Champion'),
(33477*10,3,8492.845703, 1099.233643, 554.353027,'Champion'),
(33477*10,4,8488.207031, 1106.236206, 554.367737,'Champion'),
(33477*10,5,8483.253906, 1113.153198, 554.338135,'Champion'),
(33477*10,6,8485.782227, 1114.010864, 554.297485,'Champion'),
(33477*10+1,1,8485.782227, 1114.010864, 554.297485,'Champion'),
(33477*10+1,2,8483.253906, 1113.153198, 554.338135,'Champion'),
(33477*10+1,3,8488.207031, 1106.236206, 554.367737,'Champion'),
(33477*10+1,4,8492.845703, 1099.233643, 554.353027,'Champion'),
(33477*10+1,5,8496.347656, 1094.432129, 554.335510,'Champion'),
(33477*10+1,6,8492.628906, 1091.799683, 554.420837,'Champion'),
(33465*10,1,8477.542969, 1110.444702, 554.429932,'Champion'), 
(33465*10,2,8482.299805, 1113.207886, 554.349243,'Champion'),
(33465*10,3,8485.782227, 1114.010864, 554.297485,'Champion'),
(33465*10+1,1,8485.782227, 1114.010864, 554.297485,'Champion'),
(33465*10+1,2,8482.299805, 1113.207886, 554.349243,'Champion'),
(33465*10+1,3,8477.542969, 1110.444702, 554.429932,'Champion');

DELETE FROM `creature_text` WHERE `entry` IN (@ENTRY, 33462, 33480, 33459, 33467, 33477, 33465);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(@ENTRY,0,0,'Thank you all for attending this sermon. It''s wonderful to see so many familiar faces!',12,0,100,0,0,0, 'Argent Confessor Paletress',34192),
(@ENTRY,1,0,'Today I would like to touch on the three virtues of the Light.',12,0,100,0,0,0, 'Argent Confessor Paletress',34193),
(@ENTRY,2,0,'These are dark and difficult times for us all. The armies of the Scourge amass to the south. Companions fall on the battlefield and rise to serve our enemy moments later.',12,0,100,0,0,0, 'Argent Confessor Paletress',34194),
(@ENTRY,3,0,'Many of you have experienced a betrayal of trust.',12,0,100,0,0,0, 'Argent Confessor Paletress',34196),
(@ENTRY,4,0,'Yet you persevere, as we all must. In these times, no one is a stranger to the virtue of tenacity. In the face of despair and hatred, we continue to stand true to our beliefs and fight on.',12,0,100,0,0,0, 'Argent Confessor Paletress',34197),
(@ENTRY,5,0,'There can be no doubt as to your tenacity... but there are other virtues to consider.',12,0,100,0,0,0, 'Argent Confessor Paletress',34199),
(@ENTRY,6,0,'Respect is the first virtue taught to those joining the path of the Light.',12,0,100,0,0,0, 'Argent Confessor Paletress',34200),
(@ENTRY,7,0,'Look across the aisle to those you would call enemy. Despite the hatred that separates you, there are qualities to respect in your opponent. Their prowess should be acknowledged.',12,0,100,0,0,0, 'Argent Confessor Paletress',34201),
(@ENTRY,8,0,'All of us gathered here have a concept of honorable combat. Conducting yourself with honor and treating your opponent as you wish to be treated shows respect.',12,0,100,0,0,0, 'Argent Confessor Paletress',34202),
(@ENTRY,9,0,'Respect your opponent on the field, whether he be your brother or your sworn enemy. No matter where your beliefs truly lie, such respect is acknowledging a connection...',12,0,100,0,0,0, 'Argent Confessor Paletress',34203),
(@ENTRY,10,0,'...and in acknowledging those connections, you are closer to the Light.',12,0,100,0,0,0, 'Argent Confessor Paletress',34205),
(@ENTRY,11,0,'There is one further step on the path of Light: compassion.',12,0,100,0,0,0, 'Argent Confessor Paletress',34206),
(@ENTRY,12,0,'Rivalries abound in this day and age. It is easy to see differences wherever you turn.',12,0,100,0,0,0, 'Argent Confessor Paletress',34207),
(@ENTRY,13,0,'The challenge is in looking beyond appearances and understanding our similarities. Through this understanding, you can feel compassion for the losses others have suffered...',12,0,100,0,0,0, 'Argent Confessor Paletress',34208),
(@ENTRY,14,0,'...even if the victim bears another banner.',12,0,100,0,0,0, 'Argent Confessor Paletress',34209),
(@ENTRY,15,0,'By feeling and understanding compassion in enemy and ally alike, you reaffirm your connection with the world.',12,0,100,0,0,0, 'Argent Confessor Paletress',34210),
(@ENTRY,16,0,'Acting on these tenets, these virtues, help make the world a place we all can appreciate. A world of honor and justice.',12,0,100,0,0,0, 'Argent Confessor Paletress',34211),
(@ENTRY,17,0,'Think on my words, friends. In the darkness that surrounds us all, the Light is needed more than ever.',12,0,100,0,0,0, 'Argent Confessor Paletress',34212),
(@ENTRY,18,0,'I''ll be behind the confessional screen if anyone wishes to speak with me. Any doubts, any worries, any uncertainties I will happily soothe.',12,0,100,0,0,0, 'Argent Confessor Paletress',34216),
(@ENTRY,19,0,'Take heart. Size isn''t what matters, but how you use the skills you have.',12,0,100,0,0,0, 'Argent Confessor Paletress',34250),
(@ENTRY,20,0,'What you lack in size you make up for in ambition and dedication, little one. Go with the Light.',12,0,100,0,0,0, 'Argent Confessor Paletress',34251),
(@ENTRY,21,0,'Drink in moderation, then, my dwarven friend, but you may want to turn in your lance and reins for the time being. Go with the Light.',12,0,100,0,0,0, 'Argent Confessor Paletress',34259),
(@ENTRY,22,0,'I understand your frustration. Your people are ferocious in battle, and this isn''t what you''re used to.',12,0,100,0,0,0, 'Argent Confessor Paletress',34285),
(@ENTRY,23,0,'But this is a different sort of honorable combat. Difficult to adapt to, perhaps, but with your prowess I''m sure you''ll show everyone the strength in your people.',12,0,100,0,0,0, 'Argent Confessor Paletress',34286),
(@ENTRY,24,0,'Besides... while an axe can be a valuable tool in war, lances have their uses as well.',12,0,100,0,0,0, 'Argent Confessor Paletress',34287),
(@ENTRY,25,0,'It may seem pointless, but try to find pride in a good fight. The time will come when all this practicing and competition will be put to good use.',12,0,100,0,0,0, 'Argent Confessor Paletress',34292),
(@ENTRY,26,0,'And your hair looks wonderful.',12,0,100,0,0,0, 'Argent Confessor Paletress',34293),
(@ENTRY,27,0,'Your heart is in the right place, and I know you seek to serve the Light. But these small strikes do little to the great undead host.',12,0,100,0,0,0, 'Argent Confessor Paletress',34264),
(@ENTRY,28,0,'This tournament is helping to form a strong, concerted force, though it may not appear obvious. When we''re ready, the eyes of the Crusade and all its champions will turn towards Icecrown.',12,0,100,0,0,0, 'Argent Confessor Paletress',34265),
(@ENTRY,29,0,'We will bring the might of all races to the Lich King, and he will be defeated.',12,0,100,0,0,0, 'Argent Confessor Paletress',34266),
(@ENTRY,30,0,'I know this does not seem like the obvious path to you, but it will bring you closer to the Light. Fight well, brother.',12,0,100,0,0,0, 'Argent Confessor Paletress',34267),
(@ENTRY,31,0,'Oh, my. Do you feel remorseful, at least?',12,0,100,0,0,0, 'Argent Confessor Paletress',34254),
(33462,0,0,'I don''t know if I can compete! Everyone is so much bigger!',12,0,100,0,0,0, 'Gnomeregan Champion',34246),
(33462,1,0,'I''ve calculated the probability of my success, and it''s distressingly low!',12,0,100,0,0,0, 'Gnomeregan Champion',34247),
(33462,2,0,'I can''t accurately assess the mathematics behind the charge of my turbostrider while keeping hold of my lance at the precise angle needed and keeping my shield in the exact location for maximum protection at any given second!',12,0,100,0,0,0, 'Gnomeregan Champion',34248),
(33462,3,0,'...and some of those mounts can trample me!',12,0,100,0,0,0, 'Gnomeregan Champion',34249),
(33480,0,0,'Lass, I''ve a confession to make to ya.',12,0,100,0,0,0, 'Ironforge Champion',34255),
(33480,1,0,'I''ve been feelin''... urges.',12,0,100,0,0,0, 'Ironforge Champion',34256),
(33480,2,0,'It was a powerful feelin'' while I was listenin'' to yer sermon, and it''s drivin'' me nuts!',12,0,100,0,0,0, 'Ironforge Champion',34257),
(33480,3,0,'...I NEED A DRINK!',12,0,100,0,0,0, 'Ironforge Champion',34258),
(33459,0,0,'This isn''t honorable combat. I long to face my opponents in battle with my axe in hand!',12,0,100,0,0,0, 'Orgrimmar Champion',34269),
(33459,1,0,'These are my enemies. YOU would be my enemy in battle! Your king has declared war on my kind!',12,0,100,0,0,0, 'Orgrimmar Champion',34270),
(33459,2,0,'But instead of fighting as my people would, as my people should, I find myself with a long, unwieldy pole, attempting to coax my wolf into charging my opponent without attacking.',12,0,100,0,0,0, 'Orgrimmar Champion',34271),
(33459,3,0,'This is not how orcs fight! My duty to the Warchief wars with my personal honor. I hold no faith in your Light, but as you seem an advisor, I would hear your words.',12,0,100,0,0,0, 'Orgrimmar Champion',34272),
(33467,0,0,'This fighting is endless. I''m not certain how much more of it I can stand.',12,0,100,0,0,0, 'Silvermoon Champion',34289),
(33467,1,0,'All of this posturing, all of this dancing about in rings... it seems pointless. What''s the use?',12,0,100,0,0,0, 'Silvermoon Champion',34290),
(33467,2,0,'And I''m beginning to get HELMET HAIR. This is a travesty!',12,0,100,0,0,0, 'Silvermoon Champion',34291),
(33477,0,0,'My heart hangs heavier with each passing day, Confessor.',12,0,100,0,0,0, 'Stormwind Champion',34260),
(33477,1,0,'I have been ordered here, and here I stay and fight under the banner of Stormwind. But everything I do here is empty.',12,0,100,0,0,0, 'Stormwind Champion',34261),
(33477,2,0,'Beyond these reaches, the Scourge continue their work, destroying more and more of what we''ve built. The fight should be there. I should be there.',12,0,100,0,0,0, 'Stormwind Champion',34262),
(33477,3,0,'How can I justify jousting while people die without my protection?',12,0,100,0,0,0, 'Stormwind Champion',34263),
(33465,0,0,'I punched a penguin on my way in here.',12,0,100,0,0,0, 'Undercity Champion',34252),
(33465,1,0,'Nah, not really. I just wanted to see the look on your face.',12,0,100,0,0,0, 'Undercity Champion',34253);
 
 
/* 
* sql\updates\world\2015_10_01_02_world.sql 
*/ 
-- 
UPDATE `smart_scripts` SET `event_param1`=2000, `event_param2`=3000, `event_param3`=13000, `event_param4`=15000, `action_param1`=7357, `action_param2`=0, COMMENT="Murloc Scout - In Combat - Cast 'Poisonous Stab'" WHERE `entryorguid`IN (578) AND `source_type`=0 AND `id`=0;
 
 
/* 
* sql\updates\world\2015_10_02_00_world.sql 
*/ 
-- 
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7143, 8172);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7139) AND `id`=3;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`, `OptionBroadcastTextID`, `option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(7143,0,0,"Help you with what situation?",18420,1,1,8172),
(8172,0,0,"Big ones?",18421,1,1,8171),
(7139,3,0,"Please transport me to the Guardian's Library.",20519,1,1,0); 

UPDATE `gossip_menu_option` SET `action_menu_id`=8167 WHERE `menu_id`=7139 AND `id`=0;
UPDATE `gossip_menu_option` SET `action_menu_id`=8168 WHERE `menu_id`=7139 AND `id`=1;
UPDATE `gossip_menu_option` SET `action_menu_id`=8169 WHERE `menu_id`=7139 AND `id`=2;

UPDATE `creature_template` SET `gossip_menu_id`=8173 WHERE `entry`=16426;
DELETE FROM `gossip_menu` WHERE `entry`=8173 AND `text_id`=10120;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (8173, 10120);

UPDATE `creature_template` SET `gossip_menu_id`=8175 WHERE `entry`=16806;
DELETE FROM `gossip_menu` WHERE `entry`=8175 AND `text_id`=10123;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (8175, 10123);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=7139;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 7139, 3, 0, 0, 13, 1, 7, 3, 0, 0, 0, 0, '', 'Show options for gossip only if ARAN done');

UPDATE `creature_template` SET `ScriptName`='', `AIName`='SmartAI' WHERE `entry`=16153;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (16153) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(16153,0,0,1,62,0,100,0,7139,3,0,0,85,39567,0,0,0,0,0,7,0,0,0,0,0,0,0,"Berthold - On gossip select - cast spell"),
(16153,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Berthold  - On gossip select - Close gossip");
 
 
/* 
* sql\updates\world\2015_10_02_01_world.sql 
*/ 
DELETE FROM `trinity_string` WHERE `entry` = 11010;
INSERT INTO `trinity_string` VALUES
(11010, 'You had cooldowns before starting the duel, so your cooldowns haven\'t been reset.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
 
 
/* 
* sql\updates\world\2015_10_03_00_world.sql 
*/ 
-- 
-- Razormaw SAI
SET @ENTRY := 17592;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,3000,3000,5000,11,31279,64,0,0,0,0,2,0,0,0,0,0,0,0,"Razormaw - In Combat - Cast 'Swipe'"),
(@ENTRY,0,1,0,0,0,100,0,8000,12000,6000,8000,11,8873,64,0,0,0,0,1,0,0,0,0,0,0,0,"Razormaw - In Combat - Cast 'Flame Breath'"),
(@ENTRY,0,2,0,2,0,50,1,0,50,0,0,11,14100,64,0,0,0,0,1,0,0,0,0,0,0,0,"Razormaw - Between 0-50% Health - Cast 'Terrifying Roar' (No Repeat)"),
(@ENTRY,0,3,11,11,0,100,0,0,0,0,0,53,1,17592,0,0,0,0,1,0,0,0,0,0,0,0,"Razormaw - On Respawn - Start Waypoint"),
(@ENTRY,0,4,18,40,0,100,0,10,17592,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,"Razormaw - On Waypoint 10 Reached - Remove Flag Immune To Players"),
(@ENTRY,0,11,0,61,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Razormaw - On Respawn - Set Active On"),
(@ENTRY,0,14,18,40,0,100,0,9,17592,0,0,91,2,3,0,0,0,0,1,0,0,0,0,0,0,0,"Razormaw - On Waypoint 9 Reached - Remove Flag Hover"),
(@ENTRY,0,18,0,61,0,100,0,10,17592,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Razormaw - On Waypoint 10 Reached - Set Reactstate Aggressive"),
(@ENTRY,0,19,0,40,0,100,0,11,17592,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Razormaw - On Waypoint 11 Reached - Set Home Position"),
(@ENTRY,0,20,23,40,0,100,0,1,17592,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,"Razormaw - On Waypoint 1 Reached - Set Flag Immune To Players"),
(@ENTRY,0,21,22,25,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Razormaw - On Reset - Set Reactstate Aggressive"),
(@ENTRY,0,22,0,61,0,100,0,0,0,0,0,91,2,3,0,0,0,0,1,0,0,0,0,0,0,0,"Razormaw - On Reset - Remove Flag Hover"),
(@ENTRY,0,23,0,61,0,100,0,1,17592,0,0,90,2,3,0,0,0,0,1,0,0,0,0,0,0,0,"Razormaw - On Waypoint 1 Reached - Set Flag Hover");

UPDATE `waypoints` SET `position_z` = 96.5391 WHERE `entry`=17592 AND `pointid`=11;
 
 
/* 
* sql\updates\world\2015_10_03_01_world.sql 
*/ 
-- 
DELETE FROM `creature` WHERE `guid`=71981 AND `id`=20251;

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (15241, 21719, 24933, 21497, 20127);
UPDATE `creature_template` SET `InhabitType`=7 WHERE `entry` IN (20611);

UPDATE `creature_template_addon` SET `bytes1`=33554432 WHERE `entry`=21497;
UPDATE `creature_template` SET `unit_flags`=512 WHERE `entry` IN (21497);
UPDATE `smart_scripts` SET `action_param1`=15847, `comment`="Blackscale - In Combat - Cast 'Tail Sweep'" WHERE `entryorguid`=21497 AND `source_Type`=0 AND `id`=2;
UPDATE `creature` SET `MovementType`=1, `spawndist`=10 WHERE `id` IN (21497, 20611, 20127);
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id` IN (21639, 20251, 22320);

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (20238);
DELETE FROM `smart_scripts` WHERE `entryorguid`IN (20238) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(20238,0,0,0,1,0,100,0,1000,3000,3000,7000,11,35063,0,0,0,0,0,19,20251,20,0,0,0,0,0,"Honor Hold Scout - OOC - Cast Shoot Honor Hold Scout Archery Target");
 
 
/* 
* sql\updates\world\2015_10_03_02_world.sql 
*/ 
-- 
DELETE FROM `gossip_menu` WHERE `entry`=8750 AND `text_id`=11082;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (8750, 11082);

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8750) AND `id`=2;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`, `OptionBroadcastTextID`, `option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(8750,2,0,"I'm ready. Take me to the Chamber of Command.",21879,1,1,0); 

DELETE FROM `spell_target_position` WHERE `id`=41570;
INSERT INTO `spell_target_position` (`id`,`MapID`,`PositionX`,`PositionY`,`PositionZ`,`Orientation`) VALUES
(41570, 564, 603.42, 305.982, 271.9, 0);

UPDATE `creature_template` SET `ScriptName`='', `AIName`='SmartAI' WHERE `entry`=23411;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (23411) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(23411,0,0,1,62,0,100,0,8750,1,0,0,85,41566,0,0,0,0,0,7,0,0,0,0,0,0,0,"Spirit of Olum - On gossip select - cast spell"),
(23411,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Spirit of Olum - On gossip select - Close gossip"),
(23411,0,2,3,62,0,100,0,8750,2,0,0,85,41570,0,0,0,0,0,7,0,0,0,0,0,0,0,"Spirit of Olum - On gossip select - cast spell"),
(23411,0,3,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Spirit of Olum - On gossip select - Close gossip");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=8750;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 8750, 1, 0, 0, 13, 1, 1, 3, 2, 0, 0, 0, '', 'Show options for gossip only if SUPREMUS done'),
(15, 8750, 2, 0, 0, 13, 1, 7, 3, 2, 0, 0, 0, '', 'Show options for gossip only if COUNCIL done'),
(14, 8750, 11082, 0, 0, 13, 1, 1, 3, 2, 1, 0, 0, '', 'Show gossip text only if SUPREMUS not done'),
(14, 8750, 11081, 0, 0, 13, 1, 1, 3, 2, 0, 0, 0, '', 'Show gossip text only if SUPREMUS done');
 
 
/* 
* sql\updates\world\2015_10_04_00_world.sql 
*/ 
--
-- Salanar the Horseman (NPC 28788) say line in Realm of Shadows
SET @ENTRY := 28788;
DELETE FROM `creature_text` WHERE `entry` = @ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES 
(@ENTRY,0,0,'Impressive, death knight. Return to me in the world of the living for your reward.',12,0,100,0,0,0,28835,0,'SALANAR_SAY');

-- Salanar the Horseman (NPC 28653) conditions for the gossip_menu_option to be shown for Into the Realm of Shadows
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9739 AND `ConditionValue1`=12687;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,9739,0,0,0,9,0,12687,0,0,0,0,0,'','Salanar the Horseman - Show gossip option only if player has accepted quest 12687, but not completed it.');
 
 
/* 
* sql\updates\world\2015_10_04_01_world.sql 
*/ 
UPDATE `creature_template` SET `npcflag`=1, `gossip_menu_id`=10953 WHERE `entry`=37187;

DELETE FROM `gossip_menu` WHERE `entry` IN (10953, 10952) AND `text_id` IN (15217, 15218);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(10953, 15217),
(10952, 15218);

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (10953, 10952);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`, `OptionBroadcastTextID`, `option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(10953,0,0,"We are ready to go, High Overlord. The Lich King must fall!",37631,1,1,10952),
(10952,0,0,"Lok'tar ogar! We are ready! Onward, brother orc!",37633,1,1,0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (10933, 10934);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`, `OptionBroadcastTextID`, `option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(10933,0,0,"We're ready, Muradin",37446,1,1,10934),
(10934,0,0,"We're sure. Let's go!",37448,1,1,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` IN (10933, 10953);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 10933, 0, 0, 0, 13, 1, 2, 4, 2, 1, 0, 0, '', 'Show gossip option only if Deathbringer Saurfang is not done'),
(15, 10953, 0, 0, 0, 13, 1, 2, 4, 2, 1, 0, 0, '', 'Show gossip option only if Deathbringer Saurfang is not done');
 
 
/* 
* sql\updates\world\2015_10_04_02_world.sql 
*/ 
-- 
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry` IN (37187,37200);
 
 
/* 
* sql\updates\world\2015_10_04_03_world.sql 
*/ 
-- 
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (11206,11207);
INSERT IGNORE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `OptionBroadcastTextID`) VALUE 
(11206, 0, 0, 'Northrend requires your attention Overlord Hellscream. We will deal with the Lich King and his minions without your aid.', 1, 1, 11207, 0, 0, 0, '', 39416),
(11207, 0, 0, 'The word is given. The Lich King will die by our hands!', 1, 1, 11208, 0, 0, 0, '', 39415);
UPDATE `npc_text` SET `text0_0`="You turn away the might of the Warsong Offensive? Has the chaos of battle turned you mad? With my help, victory is at hand! Without my help, your fight will be difficult.", `BroadcastTextID0`=39418 WHERE `id`=15608;
UPDATE `npc_text` SET `text0_0`="Glory to the Horde!", `BroadcastTextID0`=39419 WHERE `id`=15609;
 
 
/* 
* sql\updates\world\2015_10_04_04_world.sql 
*/ 
-- 
UPDATE `creature` SET `spawndist`=0,`MovementType`=0 WHERE `id`=34319;
 
 
/* 
* sql\updates\world\2015_10_04_05_world.sql 
*/ 
-- 
-- Hrothgar Landing Fixups
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=34879;
 
DELETE FROM `creature` WHERE `guid` IN (52041,52042,52043,53107,53767,12483);
DELETE FROM `creature_addon` WHERE `guid` IN (52041,52042,52043,53107,53767,12483);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(52041, 34852, 571, 1, 1, 9990.989, 1252.2, 72.15693, 0, 120, 0, 0),
(52042, 34852, 571, 1, 1, 9977.433, 1207.604, 56.32283, 0, 120, 0, 0),
(52043, 34852, 571, 1, 1, 10013.58, 1270.264, 70.93209, 0, 120, 0, 0),
(53107, 34852, 571, 1, 1, 10051.8, 1186.913, 69.17319, 0, 120, 0, 0),
(53767, 34852, 571, 1, 1, 10063.12, 1209.752, 73.48428, 0, 120, 0, 0),
(12483, 34852, 571, 1, 1, 10115.9, 1189.974, 81.12413, 0, 120, 0, 0);
 
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=10051.27,`position_y`=1216.898,`position_z`=69.68569,`orientation`=2.460914 WHERE `guid`=53109;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=10110.92,`position_y`=1218.408,`position_z`=78.9978,`orientation`=0.6283185 WHERE `guid`=53113;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=10096.75,`position_y`=1190.5,`position_z`=79.6442,`orientation`=6.195919 WHERE `guid`=53041;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=9951.683,`position_y`=1201.502,`position_z`=52.69936,`orientation`=5.585053 WHERE `guid`=53114;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=9928.953,`position_y`=1172.898,`position_z`=51.50733,`orientation`=3.054326 WHERE `guid`=53224;
 
DELETE FROM `creature_addon` WHERE `guid` IN (53041,53114,53109,53113);
INSERT INTO `creature_addon` (`guid`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (53041,0,256,0, ''),(53114,1,1,0, ''),(53109,0,1,234, ''),(53113,0,256,0, '');
 
-- Pathing for Kvaldir Reaver Entry: 34838 'TDB FORMAT'
SET @NPC := 52038;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=10347.37,`position_y`=803.1042,`position_z`=77.75536 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,10347.37,803.1042,77.75536,0,0,0,0,100,0),
(@PATH,2,10367.6,818.8438,84.29758,0,0,0,0,100,0),
(@PATH,3,10383.35,834.6024,92.76371,0,0,0,0,100,0),
(@PATH,4,10395.81,846.125,99.77592,0,0,0,0,100,0),
(@PATH,5,10405.93,863.6893,107.7268,0,0,0,0,100,0),
(@PATH,6,10405.98,875.375,111.8353,0,0,0,0,100,0),
(@PATH,7,10408.97,888.6285,116.7162,0,0,0,0,100,0),
(@PATH,8,10414.13,900.0261,121.0533,0,0,0,0,100,0),
(@PATH,9,10415.96,910.5504,123.9247,0,0,0,0,100,0),
(@PATH,10,10414.13,900.0261,121.0533,0,0,0,0,100,0),
(@PATH,11,10408.97,888.6285,116.7162,0,0,0,0,100,0),
(@PATH,12,10405.98,875.375,111.8353,0,0,0,0,100,0),
(@PATH,13,10405.93,863.6893,107.7268,0,0,0,0,100,0),
(@PATH,14,10395.81,846.125,99.77592,0,0,0,0,100,0),
(@PATH,15,10383.35,834.6024,92.76371,0,0,0,0,100,0),
(@PATH,16,10367.6,818.8438,84.29758,0,0,0,0,100,0);
 
-- Pathing for Kvaldir Reaver Entry: 34838 'TDB FORMAT'
SET @NPC := 52039;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=10238.24,`position_y`=782.2483,`position_z`=71.30614 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,10238.24,782.2483,71.30614,0,0,0,0,100,0),
(@PATH,2,10263.58,779.5504,72.51409,0,0,0,0,100,0),
(@PATH,3,10288.04,780.6441,74.41165,0,0,0,0,100,0),
(@PATH,4,10303.06,778.2899,74.40554,0,0,0,0,100,0),
(@PATH,5,10317.63,777.9688,74.40554,0,0,0,0,100,0),
(@PATH,6,10330.9,782.1233,74.53054,0,0,0,0,100,0),
(@PATH,7,10340.32,781.7136,74.69975,0,0,0,0,100,0),
(@PATH,8,10330.9,782.1233,74.53054,0,0,0,0,100,0),
(@PATH,9,10317.63,777.9688,74.40554,0,0,0,0,100,0),
(@PATH,10,10303.06,778.2899,74.40554,0,0,0,0,100,0),
(@PATH,11,10288.04,780.6441,74.41165,0,0,0,0,100,0),
(@PATH,12,10263.58,779.5504,72.51409,0,0,0,0,100,0);
 
-- Pathing for Kvaldir Reaver Entry: 34838 'TDB FORMAT'
SET @NPC := 52604;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=10163.75,`position_y`=843.0364,`position_z`=42.24613 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,10163.75,843.0364,42.24613,0,0,0,0,100,0),
(@PATH,2,10170.49,831.2708,47.18571,0,0,0,0,100,0),
(@PATH,3,10181.2,816.316,52.61528,0,0,0,0,100,0),
(@PATH,4,10192.17,799.5977,57.89101,0,0,0,0,100,0),
(@PATH,5,10203.03,791.2552,62.39041,0,0,0,0,100,0),
(@PATH,6,10213.43,785.3785,65.56143,0,0,0,0,100,0),
(@PATH,7,10224.06,785.1649,68.88577,0,0,0,0,100,0),
(@PATH,8,10213.43,785.3785,65.56143,0,0,0,0,100,0),
(@PATH,9,10203.03,791.2552,62.39041,0,0,0,0,100,0),
(@PATH,10,10192.28,799.4097,57.93019,0,0,0,0,100,0),
(@PATH,11,10181.2,816.316,52.61528,0,0,0,0,100,0),
(@PATH,12,10170.49,831.2708,47.18571,0,0,0,0,100,0);
 
-- Pathing for Kvaldir Reaver Entry: 34838 'TDB FORMAT'
SET @NPC := 52045;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=10151.62,`position_y`=744.2795,`position_z`=66.60175 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,10151.62,744.2795,66.60175,0,0,0,0,100,0),
(@PATH,2,10160.01,748.9653,66.73127,0,0,0,0,100,0),
(@PATH,3,10170,758.5295,66.86421,0,0,0,0,100,0),
(@PATH,4,10177.37,775.2413,63.86098,0,0,0,0,100,0),
(@PATH,5,10186.68,792.9365,58.51601,0,0,0,0,100,0),
(@PATH,6,10177.37,775.2413,63.86098,0,0,0,0,100,0),
(@PATH,7,10170,758.5295,66.86421,0,0,0,0,100,0),
(@PATH,8,10160.01,748.9653,66.73127,0,0,0,0,100,0);
 
-- Pathing for Kvaldir Reaver Entry: 34838 'TDB FORMAT'
SET @NPC := 53134;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=10135.21,`position_y`=1210.611,`position_z`=79.11204 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,10135.21,1210.611,79.11204,0,0,0,0,100,0),
(@PATH,2,10143.43,1207.156,79.93629,0,0,0,0,100,0),
(@PATH,3,10151.32,1200.924,83.26014,0,0,0,0,100,0),
(@PATH,4,10160.9,1196.632,81.05866,0,0,0,0,100,0),
(@PATH,5,10167.02,1193.387,78.56778,0,0,0,0,100,0),
(@PATH,6,10172.88,1190.09,76.37518,0,0,0,0,100,0),
(@PATH,7,10167.02,1193.387,78.56778,0,0,0,0,100,0),
(@PATH,8,10160.9,1196.631,81.06026,0,0,0,0,100,0),
(@PATH,9,10151.32,1200.924,83.26014,0,0,0,0,100,0),
(@PATH,10,10143.43,1207.156,79.93629,0,0,0,0,100,0);
 
-- Pathing for Kvaldir Reaver Entry: 34838 'TDB FORMAT'
SET @NPC := 53108;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=9980.583,`position_y`=1195.92,`position_z`=54.3329 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,9980.583,1195.92,54.3329,0,0,0,0,100,0),
(@PATH,2,9986.409,1177.829,50.95467,0,0,0,0,100,0),
(@PATH,3,9977.379,1170.333,47.40315,0,0,0,0,100,0),
(@PATH,4,9968.799,1153.069,42.6813,0,0,0,0,100,0),
(@PATH,5,9968.064,1136.25,37.7756,0,0,0,0,100,0),
(@PATH,6,9967.274,1118.092,32.56385,0,0,0,0,100,0),
(@PATH,7,9969.733,1107.026,29.42457,0,0,0,0,100,0),
(@PATH,8,9969.542,1093.946,25.73834,0,0,0,0,100,0),
(@PATH,9,9969.849,1082.082,23.47699,0,0,0,0,100,0),
(@PATH,10,9970.052,1073.906,21.76483,0,0,0,0,100,0),
(@PATH,11,9969.849,1082.082,23.47699,0,0,0,0,100,0),
(@PATH,12,9969.542,1093.946,25.73834,0,0,0,0,100,0),
(@PATH,13,9969.732,1106.946,29.36329,0,0,0,0,100,0),
(@PATH,14,9967.274,1118.092,32.56385,0,0,0,0,100,0),
(@PATH,15,9968.064,1136.25,37.7756,0,0,0,0,100,0),
(@PATH,16,9968.799,1153.069,42.6813,0,0,0,0,100,0),
(@PATH,17,9977.379,1170.333,47.40315,0,0,0,0,100,0),
(@PATH,18,9986.482,1177.609,51.15157,0,0,0,0,100,0);
 
-- Pathing for Kvaldir Reaver Entry: 34838 'TDB FORMAT'
SET @NPC := 53099;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=9975.161,`position_y`=1041.323,`position_z`=16.6497 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,9975.161,1041.323,16.6497,0,0,0,0,100,0),
(@PATH,2,9988.208,1029.54,13.30617,0,0,0,0,100,0),
(@PATH,3,10005.18,1011.085,9.467186,0,0,0,0,100,0),
(@PATH,4,10021.29,994.6493,6.951415,0,0,0,0,100,0),
(@PATH,5,10047,976.625,6.902773,0,0,0,0,100,0),
(@PATH,6,10066.32,965.4705,10.23769,0,0,0,0,100,0),
(@PATH,7,10047,976.625,6.902773,0,0,0,0,100,0),
(@PATH,8,10021.29,994.6493,6.951415,0,0,0,0,100,0),
(@PATH,9,10005.19,1011.068,9.509178,0,0,0,0,100,0),
(@PATH,10,9988.272,1029.477,13.34639,0,0,0,0,100,0);
 
-- Pathing for Kvaldir Reaver Entry: 34838 'TDB FORMAT'
SET @NPC := 53112;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=10003.86,`position_y`=1191.727,`position_z`=58.1468 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,10003.86,1191.727,58.1468,0,0,0,0,100,0),
(@PATH,2,10019.43,1197.052,61.09853,0,0,0,0,100,0),
(@PATH,3,10034.4,1198.321,64.06003,0,0,0,0,100,0),
(@PATH,4,10053.43,1195.531,69.2673,0,0,0,0,100,0),
(@PATH,5,10066.09,1187.489,73.69296,0,0,0,0,100,0),
(@PATH,6,10071.19,1179.259,75.82832,0,0,0,0,100,0),
(@PATH,7,10066.11,1187.476,73.49924,0,0,0,0,100,0),
(@PATH,8,10053.45,1195.518,69.44296,0,0,0,0,100,0),
(@PATH,9,10034.4,1198.321,64.06003,0,0,0,0,100,0),
(@PATH,10,10019.43,1197.052,61.09853,0,0,0,0,100,0);
 
-- Kvaldir Reaver SAI
SET @ENTRY := 34838;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,9000,11000,11,49922,0,0,0,0,0,2,0,0,0,0,0,0,0,"Kvaldir Reaver - In Combat - Cast 'Wave Crash'");
 
-- Kvaldir Mist Binder SAI
SET @ENTRY := 34839;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,6000,12000,15000,11,49816,0,0,0,0,0,2,0,0,0,0,0,0,0,"Kvaldir Mist Binder - In Combat - Cast 'Mist of Strangulation'");
 
 
/* 
* sql\updates\world\2015_10_05_00_world.sql 
*/ 
-- 
UPDATE `quest_request_items` SET `CompletionText` = 'Did you find Fizzle, $N? He, and rest of the Burning Blade, must be scoured from our lands!' WHERE `ID` = 806;
 
 
/* 
* sql\updates\world\2015_10_05_01_world.sql 
*/ 
-- 
DELETE FROM `creature_template_addon` WHERE `Entry`=38058;
INSERT INTO `creature_template_addon` (`entry`, `bytes1`, `bytes2`) VALUES (38058,50331648,1);
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=38058;

DELETE FROM `smart_scripts` WHERE `entryorguid`=36725 AND `source_type`=0 AND `id`>4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(36725,0,5,0,4,0,100,31,0,0,0,0,11,69887,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nerub'ar Broodkeeper - On aggro - Cast Web Beam"),
(36725,0,6,0,0,0,100,31,4000,4000,0,0,91,2,3,0,0,0,0,1,0,0,0,0,0,0,0,"Nerub'ar Broodkeeper  - In combat no repeat - Remove Flag Hover");
 
 
/* 
* sql\updates\world\2015_10_06_00_world.sql 
*/ 
-- 
SET @ENTRY := 37230;
SET @CGUID := 45827;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+3;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, @ENTRY, 631, 3, 1, -368.000, 2316.687, 234.047, 2.792558, 7200, 0, 0),
(@CGUID+1, @ENTRY, 631, 3, 1, -511.493, 2318.217, 234.045, 0.483487, 7200, 0, 0),
(@CGUID+2, @ENTRY, 631, 3, 1, -516.336, 2108.577, 234.049, 5.733871, 7200, 0, 0),
(@CGUID+3, @ENTRY, 631, 3, 1, -353.894, 2111.659, 234.043, 3.711472, 7200, 0, 0);

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (@ENTRY, 38444);
DELETE FROM `creature_template_addon` WHERE `entry` IN (@ENTRY, 38444);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(@ENTRY, 0, 0x3000000, 0x1, ''),
(38444, 0, 0x3000000, 0x1, '');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,30,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Spire Frostwyrm - on Reset - Set invisible"),
(@ENTRY,0,1,2,10,0,100,31,0,100,1000,1000,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Spire Frostwyrm - OOC_LOS - SET visible"),
(@ENTRY,0,2,0,61,0,100,31,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Spire Frostwyrm - OOC_LOS - Start Attack"),
(@ENTRY,0,3,0,4,0,100,30,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Spire Frostwyrm - On aggro - Say text"),
(@ENTRY,0,4,0,33,0,100,31,100,30000,0,0,91,2,3,0,0,0,0,1,0,0,0,0,0,0,0,"Spire Frostwyrm - On target damaged - Remove Flag Hover"),
(@ENTRY,0,5,0,0,0,100,30,10000,13000,13000,16000,11,70362,0,0,0,0,0,5,0,0,0,0,0,0,0,"Spire Frostwyrm - IC - Cast Blizzard"), 
(@ENTRY,0,6,0,0,0,100,30,8000,10000,3000,6000,11,70361,0,0,0,0,0,2,0,0,0,0,0,0,0,"Spire Frostwyrm - IC - Cast Cleave"),
(@ENTRY,0,7,0,0,0,100,30,13000,15000,6000,9000,11,70116,0,0,0,0,0,2,0,0,0,0,0,0,0,"Spire Frostwyrm - IC - Cast Frost Breath");

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'A screeching cry pierces the air above!', 41, 0, 100, 0, 0, 0, 37161, 1, 'Spire Frostwyrm to Player');
 
 
/* 
* sql\updates\world\2015_10_06_01_world.sql 
*/ 
-- Sheddle Glossgleam
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=194115;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29703;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (194115) AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (29703) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2970300, 19411500) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(194115, 1, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 80, 19411500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shoeshine Seat - On Gossip hello - Action list'),
(19411500, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Shoeshine Seat - Action list - Store target'),
(19411500, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 19, 29703, 20, 0, 0, 0, 0, 0, 'Shoeshine Seat - Action list - Send Target'),
(19411500, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 29703, 20, 0, 0, 0, 0, 0, 'Shoeshine Seat - Action list - Set Data'),
(29703, 0, 0, 0, 38, 0, 100, 0, 1, 1, 13000, 13000, 80, 2970300, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sheddle Glossgleam - On Data set - Action list'),
(2970300, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Sheddle Glossgleam - Action list - Say text'),
(2970300, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sheddle Glossgleam - Action list - Set run off'),
(2970300, 9, 2, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 5810.110, 676.122, 658.0285, 5.002982, 'Sheddle Glossgleam- Action list - Move to pos'),
(2970300, 9, 3, 0, 0, 0, 100, 0, 1200, 1200, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 5810.110, 676.122, 658.0285, 5.002982, 'Sheddle Glossgleam - Action list - Set Orientation'),
(2970300, 9, 4, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 11, 68442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sheddle Glossgleam - Action list - Cast Kneel'),
(2970300, 9, 5, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 28, 68442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sheddle Glossgleam - Action list - Remove Kneel aura'),
(2970300, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 62089, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Sheddle Glossgleam - Action list - Cast Shiny Shoes'),
(2970300, 9, 7, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Sheddle Glossgleam - Action list - Say text'),
(2970300, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 5812.08, 676.872, 658.112, 3.071780, 'Sheddle Glossgleam - Action list - Move to pos'),
(2970300, 9, 9, 0, 0, 0, 100, 0, 1200, 1200, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 5812.08, 676.872, 658.112, 3.071780, 'Sheddle Glossgleam - Action list - Set Orientation');

DELETE FROM `creature_text` WHERE `entry` IN (29703);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(29703,0,0,'Need a shoeshine, $c?',12,0,100,0,0,0, 'Sheddle Glossgleam',33178),
(29703,0,1,'One shoeshine coming up!',12,0,100,0,0,0, 'Sheddle Glossgleam',33180),
(29703,0,2,'Let me shine your shoes, $c.',12,0,100,0,0,0, 'Sheddle Glossgleam',33181),
(29703,1,0,'Take care of that shine, $c.',12,0,100,0,0,0, 'Sheddle Glossgleam',33179),
(29703,1,1,'Shiny!',12,0,100,0,0,0, 'Sheddle Glossgleam',33182),
(29703,1,2,'Another shiny, happy person.  Take care, $c!',12,0,100,0,0,0, 'Sheddle Glossgleam',33183);
 
 
/* 
* sql\updates\world\2015_10_08_00_world.sql 
*/ 
-- Pathing for Anub'ar Warrior Entry: 28732 'TDB FORMAT'
SET @NPC := 127230;
SET @NPC1 := 127339;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=536.2838,`position_y`=747.2582,`position_z`=790.701 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=534.9068,`position_y`=742.6521,`position_z`=789.386 WHERE `guid`=@NPC1;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@NPC1);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, ''),(@NPC1,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,536.2838,747.2582,790.701,0,0,0,0,100,0),
(@PATH,2,553.5668,733.7203,777.5034,0,0,0,0,100,0),
(@PATH,3,536.2838,747.2582,790.701,0,0,0,0,100,0),
(@PATH,4,507.5956,755.1626,808.8735,0,0,0,0,100,0),
(@PATH,5,488.8975,758.9921,818.0986,0,0,0,0,100,0),
(@PATH,6,507.5956,755.1626,808.8735,0,0,0,0,100,0);
 
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@NPC1,4,90,2,2,5);
 
 
/* 
* sql\updates\world\2015_10_08_01_world.sql 
*/ 
--
UPDATE `gameobject_template` SET `faction`=0 WHERE `entry`=177219;
 
 

/* 
* sql\updates\world\2015_10_10_02_world.sql 
*/ 
--
DELETE FROM `smart_scripts` WHERE `entryorguid`=16286 AND `source_type`=0;
UPDATE `creature_template` SET `AIName`="" WHERE `entry`=16286;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (29865,55053);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(29865,"spell_loatheb_deathbloom"),
(55053,"spell_loatheb_deathbloom");

DELETE FROM `spelldifficulty_dbc` WHERE `id` IN (55594);
INSERT INTO `spelldifficulty_dbc` (`id`,`spellid0`,`spellid1`) VALUES
(55594,55594,55601);
 
 
/* 
* sql\updates\world\2015_10_10_03_world.sql 
*/ 
--
UPDATE `locales_quest` SET `Title_loc2` = "Le nettoyage du camp des kobolds", `Title_loc3` = "Säuberung im Koboldlager", `Title_loc7` = "La Limpieza del Campamento Kóbold", `Title_loc8` = "Нападение на лагерь кобольдов" WHERE `Id` = 7;
 
 
/* 
* sql\updates\world\2015_10_10_04_world.sql 
*/ 
--
DELETE FROM `gossip_menu_option` WHERE `menu_id`=344 AND `id`=1;
 
 
/* 
* sql\updates\world\2015_10_10_05_world.sql 
*/ 
DELETE FROM `trinity_string` WHERE `entry` IN (5057, 5058);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(5057, 'Boss id %i state is now set to %i (%s).', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5058, 'Boss id %i state is %i (%s).', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
 
 
/* 
* sql\updates\world\2015_10_11_00_world.sql 
*/ 
--
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (29865,-29865,55053,-55053);
 
 
/* 
* sql\updates\world\2015_10_11_01_world.sql 
*/ 
DROP TABLE IF EXISTS `skill_perfect_item_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_perfect_item_template` (
	`spellId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
	`requiredSpecialization` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
	`perfectCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create the perfect item instead',
	`perfectItemType` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'perfect item type to create instead',
	PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Crafting Perfection System';
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `skill_perfect_item_template` WRITE;
/*!40000 ALTER TABLE `skill_perfect_item_template` DISABLE KEYS */;
INSERT INTO `skill_perfect_item_template` (`spellId`, `requiredSpecialization`, `perfectCreateChance`, `perfectItemType`)
VALUES
/* Bloodstone */
(53831,55534,20,41432), -- Bold
(53835,55534,20,41433), -- Bright
(53832,55534,20,41434), -- Delicate
(53844,55534,20,41435), -- Flashing
(53845,55534,20,41436), -- Fractured
(54017,55534,20,41437), -- Precise
(53834,55534,20,41438), -- Runed
(53843,55534,20,41439), -- Subtle
/* Sun Crystal */
(53852,55534,20,41444), -- Brilliant
(53857,55534,20,41445), -- Mystic
(53856,55534,20,41446), -- Quick
(53854,55534,20,41447), -- Rigid
(53853,55534,20,41448), -- Smooth
(53855,55534,20,41449), -- Thick
/* Chalcedony */
(53941,55534,20,41440), -- Lustrous
(53934,55534,20,41441), -- Solid
(53940,55534,20,41442), -- Sparkling
(53943,55534,20,41443), -- Stormy
/* Dark Jade */
(53926,55534,20,41463), -- Dazzling
(53918,55534,20,41464), -- Enduring
(53930,55534,20,41465), -- Energized
(53920,55534,20,41466), -- Forceful
(53925,55534,20,41467), -- Intricate
(53916,55534,20,41468), -- Jagged
(53928,55534,20,41469), -- Lambent
(53922,55534,20,41470), -- Misty
(53929,55534,20,41471), -- Opaque
(53931,55534,20,41472), -- Radiant
(53921,55534,20,41473), -- Seer's
(53933,55534,20,41474), -- Shattered
(53923,55534,20,41475), -- Shining
(53919,55534,20,41476), -- Steady
(53927,55534,20,41477), -- Sundered
(53932,55534,20,41478), -- Tense
(53894,55534,20,41479), -- Timeless
(53924,55534,20,41480), -- Turbid
(53917,55534,20,41481), -- Vivid
/* Huge Citrine */
(53886,55534,20,41429), -- Wicked
(53892,55534,20,41482), -- Accurate
(53874,55534,20,41483), -- Champion's
(53877,55534,20,41484), -- Deadly
(53880,55534,20,41485), -- Deft
(53884,55534,20,41486), -- Durable
(53888,55534,20,41487), -- Empowered
(53873,55534,20,41488), -- Etched
(53876,55534,20,41489), -- Fierce
(53891,55534,20,41490), -- Glimmering
(53878,55534,20,41491), -- Glinting
(53872,55534,20,41492), -- Inscribed
(53879,55534,20,41493), -- Lucent
(53881,55534,20,41494), -- Luminous
(53882,55534,20,41495), -- Potent
(53887,55534,20,41496), -- Pristine
(53885,55534,20,41497), -- Reckless
(53893,55534,20,41498), -- Resolute
(53875,55534,20,41499), -- Resplendent
(53890,55534,20,41500), -- Stalwart
(53889,55534,20,41501), -- Stark
(53883,55534,20,41502), -- Veiled
/* Shadow Crystal */
(53866,55534,20,41450), -- Balanced
(53869,55534,20,41451), -- Defender's
(53862,55534,20,41452), -- Glowing
(53871,55534,20,41453), -- Guardian's
(53867,55534,20,41454), -- Infused
(53865,55534,20,41455), -- Mysterious
(53870,55534,20,41456), -- Puissant
(53863,55534,20,41457), -- Purified
(53868,55534,20,41458), -- Regal
(53864,55534,20,41459), -- Royal
(53860,55534,20,41460), -- Shifting
(53859,55534,20,41461), -- Sovereign
(53861,55534,20,41462); -- Tenuous
/*!40000 ALTER TABLE `skill_perfect_item_template` ENABLE KEYS */;
UNLOCK TABLES;
 
 
/* 
* sql\updates\world\2015_10_11_02_world.sql 
*/ 
-- Gameobject list for Molten Core
SET @OGUID   := 56280;
DELETE FROM `gameobject` WHERE `guid` IN (43162,43163,43164,43165,35665);
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID AND @OGUID+14;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@OGUID+0,176951,409,2717,0,1,1,601.6724,-1174.613,-196.0725,3.141593,0,0,-1,0,120,255,1), -- Rune of Koro
(@OGUID+1,176952,409,2717,0,1,1,748.8392,-985.1598,-178.2831,3.141593,0,0,-1,0,120,255,1), -- Rune of Zeth
(@OGUID+2,176953,409,2717,0,1,1,583.7003,-806.7377,-204.9614,3.141593,0,0,-1,0,120,255,1), -- Rune of Mazj
(@OGUID+3,176954,409,2717,0,1,1,795.5356,-974.2527,-207.7883,3.141593,0,0,-1,0,120,255,1), -- Rune of Theri
(@OGUID+4,176955,409,2717,0,1,1,694.2289,-495.5984,-214.3294,3.141593,0,0,-1,0,120,255,1), -- Rune of Blaz
(@OGUID+5,176956,409,2717,0,1,1,1132.106,-1017.273,-186.4936,3.141593,0,0,-1,0,120,255,1), -- Rune of Kress
(@OGUID+6,176957,409,2717,0,1,1,897.0577,-551.5464,-203.9534,3.141593,0,0,-1,0,120,255,1), -- Rune of Mohn
(@OGUID+7,177000,409,2717,0,1,1,736.6626,-1176.569,-119.7984,3.141593,0,0,-1,0,120,255,1), -- Hot Coal
(@OGUID+8,178187,409,2717,0,1,1,601.6724,-1174.613,-196.0725,3.141593,0,0,-1,0,120,255,1), -- Molten Core Circle SULFURON
(@OGUID+9,178188,409,2717,0,1,1,748.8392,-985.1598,-178.2831,3.141593,0,0,-1,0,120,255,1), -- Molten Core Circle BARON
(@OGUID+10,178189,409,2717,0,1,1,583.7003,-806.7377,-204.9614,3.141593,0,0,-1,0,120,255,1), -- Molten Core Circle SHAZZRAH
(@OGUID+11,178190,409,2717,0,1,1,795.5356,-974.2527,-207.7883,3.141593,0,0,-1,0,120,255,1), -- Molten Core Circle GOLEMAGG
(@OGUID+12,178191,409,2717,0,1,1,694.2289,-495.5984,-214.3294,3.141593,0,0,-1,0,120,255,1), -- Molten Core Circle GARR
(@OGUID+13,178192,409,2717,0,1,1,1132.106,-1017.273,-186.4936,3.141593,0,0,-1,0,120,255,1), -- Molten Core Circle MAGMADAR
(@OGUID+14,178193,409,2717,0,1,1,897.0577,-551.5464,-203.9534,3.141593,0,0,-1,0,120,255,1); -- Molten Core Circle GEHENNAS
 
 
/* 
* sql\updates\world\2015_10_11_03_world.sql 
*/ 
-- Add missing Firesworn spawn
SET @CGUID := 16399;
DELETE FROM `creature` WHERE `guid`=@CGUID;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID, 12099, 409, 1, 1, 698.831, -507.815, -214.691, 1.832596, 7200, 0, 0);

-- Garr movement/formation fixup
UPDATE `creature` SET `spawndist`=10,`MovementType`=1 WHERE `guid`=56609;
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (56609);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(56609,56609,0,0,2,0,0),
(56609,56610,10,45,2,0,0),
(56609,56616,10,90,2,0,0),
(56609,56619,10,135,2,0,0),
(56609,56620,10,180,2,0,0),
(56609,56622,10,225,2,0,0),
(56609,56626,10,270,2,0,0),
(56609,56628,10,315,2,0,0),
(56609,@CGUID,10,360,2,0,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56742;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=619.3152,`position_y`=-1131.169,`position_z`=-201.6246 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,619.3152,-1131.169,-201.6246,0,0,0,0,100,0),
(@PATH,2,635.5156,-1094.704,-196.7484,0,0,0,0,100,0),
(@PATH,3,637.1269,-1060.913,-199.2417,0,0,0,0,100,0),
(@PATH,4,635.5156,-1094.704,-196.7484,0,0,0,0,100,0),
(@PATH,5,619.3152,-1131.169,-201.6246,0,0,0,0,100,0),
(@PATH,6,610.0372,-1155.73,-198.8285,0,0,0,0,100,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56743;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1039.667,`position_y`=-791.0968,`position_z`=-151.0096 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1039.667,-791.0968,-151.0096,0,0,0,0,100,0),
(@PATH,2,1026.315,-767.8003,-156.6493,0,0,0,0,100,0),
(@PATH,3,1038.774,-761.6977,-152.658,0,0,0,0,100,0),
(@PATH,4,1064.627,-748.9409,-151.7516,0,0,0,0,100,0),
(@PATH,5,1038.774,-761.6977,-152.658,0,0,0,0,100,0),
(@PATH,6,1026.315,-767.8003,-156.6493,0,0,0,0,100,0),
(@PATH,7,1039.641,-791.0518,-150.9892,0,0,0,0,100,0),
(@PATH,8,1051.314,-799.6896,-151.9713,0,0,0,0,100,0),
(@PATH,9,1040.764,-815.1115,-152.1656,0,0,0,0,100,0),
(@PATH,10,1051.314,-799.6896,-151.9713,0,0,0,0,100,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56744;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=862.4832,`position_y`=-1025.388,`position_z`=-193.7729 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,862.4832,-1025.388,-193.7729,0,0,0,0,100,0),
(@PATH,2,837.9779,-1005.705,-203.4326,0,0,0,0,100,0),
(@PATH,3,811.0497,-995.4718,-207.7699,0,0,0,0,100,0),
(@PATH,4,837.9779,-1005.705,-203.4326,0,0,0,0,100,0),
(@PATH,5,862.4832,-1025.388,-193.7729,0,0,0,0,100,0),
(@PATH,6,867.8922,-1050.318,-187.0417,0,0,0,0,100,0),
(@PATH,7,872.7313,-1072.91,-180.5435,0,0,0,0,100,0),
(@PATH,8,866.1934,-1092.763,-172.8487,0,0,0,0,100,0),
(@PATH,9,852.0717,-1110.005,-164.8026,0,0,0,0,100,0),
(@PATH,10,839.597,-1126.927,-156.889,0,0,0,0,100,0),
(@PATH,11,809.0994,-1147.87,-152.4792,0,0,0,0,100,0),
(@PATH,12,797.6674,-1151.59,-151.2095,0,0,0,0,100,0),
(@PATH,13,786.1231,-1142.027,-149.5751,0,0,0,0,100,0),
(@PATH,14,751.8342,-1124.252,-144.3583,0,0,0,0,100,0),
(@PATH,15,726.2703,-1123.733,-140.4308,0,0,0,0,100,0),
(@PATH,16,705.0751,-1129.982,-137.4043,0,0,0,0,100,0),
(@PATH,17,688.8096,-1145.377,-132.6487,0,0,0,0,100,0),
(@PATH,18,681.356,-1157.213,-129.4221,0,0,0,0,100,0),
(@PATH,19,678.912,-1171.258,-124.9925,0,0,0,0,100,0),
(@PATH,20,687.782,-1186.916,-122.3317,0,0,0,0,100,0),
(@PATH,21,702.4774,-1195.069,-120.2255,0,0,0,0,100,0),
(@PATH,22,687.7936,-1186.922,-122.3323,0,0,0,0,100,0),
(@PATH,23,678.912,-1171.258,-124.9925,0,0,0,0,100,0),
(@PATH,24,681.356,-1157.213,-129.4221,0,0,0,0,100,0),
(@PATH,25,688.8096,-1145.377,-132.6487,0,0,0,0,100,0),
(@PATH,26,705.0751,-1129.982,-137.4043,0,0,0,0,100,0),
(@PATH,27,726.2703,-1123.733,-140.4308,0,0,0,0,100,0),
(@PATH,28,751.8342,-1124.252,-144.3583,0,0,0,0,100,0),
(@PATH,29,786.1231,-1142.027,-149.5751,0,0,0,0,100,0),
(@PATH,30,797.6674,-1151.59,-151.2095,0,0,0,0,100,0),
(@PATH,31,809.0994,-1147.87,-152.4792,0,0,0,0,100,0),
(@PATH,32,839.597,-1126.927,-156.889,0,0,0,0,100,0),
(@PATH,33,852.0717,-1110.005,-164.8026,0,0,0,0,100,0),
(@PATH,34,866.1934,-1092.763,-172.8487,0,0,0,0,100,0),
(@PATH,35,872.7313,-1072.91,-180.5435,0,0,0,0,100,0),
(@PATH,36,867.8922,-1050.318,-187.0417,0,0,0,0,100,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56745;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=820.8864,`position_y`=-1133.536,`position_z`=-153.9561 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,820.8864,-1133.536,-153.9561,0,0,0,0,100,0),
(@PATH,2,811.4623,-1112.419,-155.1721,0,0,0,0,100,0),
(@PATH,3,791.674,-1098.377,-157.4893,0,0,0,0,100,0),
(@PATH,4,756.4903,-1086.385,-165.0273,0,0,0,0,100,0),
(@PATH,5,713.1385,-1077.042,-178.4627,0,0,0,0,100,0),
(@PATH,6,666.2255,-1071.984,-188.5744,0,0,0,0,100,0),
(@PATH,7,713.1385,-1077.042,-178.4627,0,0,0,0,100,0),
(@PATH,8,756.4903,-1086.385,-165.0273,0,0,0,0,100,0),
(@PATH,9,791.674,-1098.377,-157.4893,0,0,0,0,100,0),
(@PATH,10,811.4623,-1112.419,-155.1721,0,0,0,0,100,0),
(@PATH,11,820.8864,-1133.536,-153.9561,0,0,0,0,100,0),
(@PATH,12,807.4134,-1143.589,-152.2109,0,0,0,0,100,0),
(@PATH,13,788.3813,-1136.843,-150.0572,0,0,0,0,100,0),
(@PATH,14,774.8284,-1122.117,-148.7992,0,0,0,0,100,0),
(@PATH,15,753.0598,-1112.579,-145.9724,0,0,0,0,100,0),
(@PATH,16,723.3937,-1111.516,-142.1575,0,0,0,0,100,0),
(@PATH,17,692.8207,-1125.591,-137.05,0,0,0,0,100,0),
(@PATH,18,670.802,-1153.978,-128.2815,0,0,0,0,100,0),
(@PATH,19,669.009,-1180.974,-123.0805,0,0,0,0,100,0),
(@PATH,20,670.802,-1153.978,-128.2815,0,0,0,0,100,0),
(@PATH,21,692.8207,-1125.591,-137.05,0,0,0,0,100,0),
(@PATH,22,723.3937,-1111.516,-142.1575,0,0,0,0,100,0),
(@PATH,23,753.0598,-1112.579,-145.9724,0,0,0,0,100,0),
(@PATH,24,774.8284,-1122.117,-148.7992,0,0,0,0,100,0),
(@PATH,25,788.3813,-1136.843,-150.0572,0,0,0,0,100,0),
(@PATH,26,807.4134,-1143.589,-152.2109,0,0,0,0,100,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56746;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=706.5988,`position_y`=-608.756,`position_z`=-209.7862 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,706.5988,-608.756,-209.7862,0,0,0,0,100,0),
(@PATH,2,694.3823,-643.1285,-209.7859,0,0,0,0,100,0),
(@PATH,3,691.9941,-667.7454,-209.6549,0,0,0,0,100,0),
(@PATH,4,712.6238,-699.4688,-209.7263,0,0,0,0,100,0),
(@PATH,5,696.8894,-727.3798,-209.4279,0,0,0,0,100,0),
(@PATH,6,672.7046,-770.8894,-209.0702,0,0,0,0,100,0),
(@PATH,7,696.8894,-727.3798,-209.4279,0,0,0,0,100,0),
(@PATH,8,712.6238,-699.4688,-209.7263,0,0,0,0,100,0),
(@PATH,9,691.9941,-667.7454,-209.6549,0,0,0,0,100,0),
(@PATH,10,694.3823,-643.1285,-209.7859,0,0,0,0,100,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56667;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=716.2954,`position_y`=-563.1713,`position_z`=-215.2122 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,716.2954,-563.1713,-215.2122,0,0,0,0,100,0),
(@PATH,2,730.72,-541.2038,-216.5207,0,0,0,0,100,0),
(@PATH,3,751.7352,-537.1676,-215.0087,0,0,0,0,100,0),
(@PATH,4,782.8221,-568.6121,-213.2396,0,0,0,0,100,0),
(@PATH,5,826.4692,-557.4173,-206.1204,0,0,0,0,100,0),
(@PATH,6,862.7628,-559.3347,-203.8248,0,0,0,0,100,0),
(@PATH,7,897.3094,-575.2031,-203.7624,0,0,0,0,100,0),
(@PATH,8,928.274,-599.9254,-203.4944,0,0,0,0,100,0),
(@PATH,9,976.9997,-588.0521,-203.566,0,0,0,0,100,0),
(@PATH,10,1013.348,-611.7108,-198.8222,0,0,0,0,100,0),
(@PATH,11,1031.784,-628.6943,-189.8679,0,0,0,0,100,0),
(@PATH,12,1054.582,-638.4258,-174.0191,0,0,0,0,100,0),
(@PATH,13,1082.93,-658.8265,-159.5947,0,0,0,0,100,0),
(@PATH,14,1102.016,-688.0265,-153.0321,0,0,0,0,100,0),
(@PATH,15,1095.611,-709.971,-151.2729,0,0,0,0,100,0),
(@PATH,16,1102.016,-688.0265,-153.0321,0,0,0,0,100,0),
(@PATH,17,1082.93,-658.8265,-159.5947,0,0,0,0,100,0),
(@PATH,18,1054.582,-638.4258,-174.0191,0,0,0,0,100,0),
(@PATH,19,1031.784,-628.6943,-189.8679,0,0,0,0,100,0),
(@PATH,20,1013.348,-611.7108,-198.8222,0,0,0,0,100,0),
(@PATH,21,976.9997,-588.0521,-203.566,0,0,0,0,100,0),
(@PATH,22,928.274,-599.9254,-203.4944,0,0,0,0,100,0),
(@PATH,23,897.3094,-575.2031,-203.7624,0,0,0,0,100,0),
(@PATH,24,862.7628,-559.3347,-203.8248,0,0,0,0,100,0),
(@PATH,25,826.4692,-557.4173,-206.1204,0,0,0,0,100,0),
(@PATH,26,782.8221,-568.6121,-213.2396,0,0,0,0,100,0),
(@PATH,27,751.7352,-537.1676,-215.0087,0,0,0,0,100,0),
(@PATH,28,730.72,-541.2038,-216.5207,0,0,0,0,100,0),
(@PATH,29,716.2954,-563.1713,-215.2122,0,0,0,0,100,0),
(@PATH,30,710.9113,-588.9549,-211.3497,0,0,0,0,100,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56668;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=746.1315,`position_y`=-1006.086,`position_z`=-177.4375 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,746.1315,-1006.086,-177.4375,0,0,0,0,100,0),
(@PATH,2,733.2838,-1027.083,-177.5541,0,0,0,0,100,0),
(@PATH,3,695.6022,-1035.41,-182.9091,0,0,0,0,100,0),
(@PATH,4,652.9347,-1047.064,-195.1933,0,0,0,0,100,0),
(@PATH,5,695.6022,-1035.41,-182.9091,0,0,0,0,100,0),
(@PATH,6,733.2838,-1027.083,-177.5541,0,0,0,0,100,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56669;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=819.1058,`position_y`=-631.4754,`position_z`=-202.4386 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,819.1058,-631.4754,-202.4386,0,0,0,0,100,0),
(@PATH,2,842.2988,-620.2899,-203.6502,0,0,0,0,100,0),
(@PATH,3,863.2007,-606.6663,-201.9657,0,0,0,0,100,0),
(@PATH,4,880.7169,-589.9871,-203.5187,0,0,0,0,100,0),
(@PATH,5,891.5865,-563.1656,-204.1768,0,0,0,0,100,0),
(@PATH,6,880.7169,-589.9871,-203.5187,0,0,0,0,100,0),
(@PATH,7,863.2007,-606.6663,-201.9657,0,0,0,0,100,0),
(@PATH,8,842.2988,-620.2899,-203.6502,0,0,0,0,100,0),
(@PATH,9,819.1058,-631.4754,-202.4386,0,0,0,0,100,0),
(@PATH,10,801.1528,-637.2293,-203.2919,0,0,0,0,100,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56670;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=640.3456,`position_y`=-838.7157,`position_z`=-208.4006 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,640.3456,-838.7157,-208.4006,0,0,0,0,100,0),
(@PATH,2,606.3914,-839.9142,-207.404,0,0,0,0,100,0),
(@PATH,3,580.7532,-839.1719,-206.0227,0,0,0,0,100,0),
(@PATH,4,571.1739,-823.5732,-206.9356,0,0,0,0,100,0),
(@PATH,5,568.275,-805.6725,-206.7511,0,0,0,0,100,0),
(@PATH,6,574.7719,-784.4373,-207.1243,0,0,0,0,100,0),
(@PATH,7,568.275,-805.6725,-206.7511,0,0,0,0,100,0),
(@PATH,8,571.1739,-823.5732,-206.9356,0,0,0,0,100,0),
(@PATH,9,580.7532,-839.1719,-206.0227,0,0,0,0,100,0),
(@PATH,10,606.3914,-839.9142,-207.404,0,0,0,0,100,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56671;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=693.7902,`position_y`=-895.4052,`position_z`=-199.3317 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,693.7902,-895.4052,-199.3317,0,0,0,0,100,0),
(@PATH,2,676.3041,-859.0721,-207.3966,0,0,0,0,100,0),
(@PATH,3,660.5331,-846.3304,-208.582,0,0,0,0,100,0),
(@PATH,4,676.3041,-859.0721,-207.3966,0,0,0,0,100,0),
(@PATH,5,693.7902,-895.4052,-199.3317,0,0,0,0,100,0),
(@PATH,6,709.7253,-933.0809,-191.2163,0,0,0,0,100,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56672;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=708.7521,`position_y`=-494.4869,`position_z`=-213.9441 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,708.7521,-494.4869,-213.9441,0,0,0,0,100,0),
(@PATH,2,706.8069,-515.2225,-215.4603,0,0,0,0,100,0),
(@PATH,3,695.7981,-526.2382,-214.3069,0,0,0,0,100,0),
(@PATH,4,671.7322,-532.863,-210.5322,0,0,0,0,100,0),
(@PATH,5,695.7981,-526.2382,-214.3069,0,0,0,0,100,0),
(@PATH,6,706.8069,-515.2225,-215.4603,0,0,0,0,100,0),
(@PATH,7,708.7521,-494.4869,-213.9441,0,0,0,0,100,0),
(@PATH,8,706.4074,-474.3789,-211.1673,0,0,0,0,100,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56673;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=723.8314,`position_y`=-518.3099,`position_z`=-217.6104 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,723.8314,-518.3099,-217.6104,0,0,0,0,100,0),
(@PATH,2,706.7125,-535.8472,-216.7189,0,0,0,0,100,0),
(@PATH,3,685.7861,-543.6451,-211.2004,0,0,0,0,100,0),
(@PATH,4,667.6307,-538.1242,-209.9916,0,0,0,0,100,0),
(@PATH,5,685.7861,-543.6451,-211.2004,0,0,0,0,100,0),
(@PATH,6,706.7125,-535.8472,-216.7189,0,0,0,0,100,0),
(@PATH,7,723.8314,-518.3099,-217.6104,0,0,0,0,100,0),
(@PATH,8,728.2719,-487.4919,-212.95,0,0,0,0,100,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56674;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=831.386,`position_y`=-627.8932,`position_z`=-203.1487 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,831.386,-627.8932,-203.1487,0,0,0,0,100,0),
(@PATH,2,856.4564,-617.9056,-202.1571,0,0,0,0,100,0),
(@PATH,3,899.6118,-613.5433,-202.2377,0,0,0,0,100,0),
(@PATH,4,936.2535,-612.5002,-203.6217,0,0,0,0,100,0),
(@PATH,5,975.1815,-641.0467,-201.5775,0,0,0,0,100,0),
(@PATH,6,1002.311,-661.9902,-194.1922,0,0,0,0,100,0),
(@PATH,7,1024.067,-684.3118,-173.4296,0,0,0,0,100,0),
(@PATH,8,1042.016,-695.8206,-163.7581,0,0,0,0,100,0),
(@PATH,9,1058.163,-706.0782,-156.6107,0,0,0,0,100,0),
(@PATH,10,1068.566,-742.8318,-151.7328,0,0,0,0,100,0),
(@PATH,11,1117.097,-744.479,-145.6289,0,0,0,0,100,0),
(@PATH,12,1149.458,-726.4506,-133.8044,0,0,0,0,100,0),
(@PATH,13,1175.513,-702.1757,-130.9873,0,0,0,0,100,0),
(@PATH,14,1200.504,-670.9343,-128.5453,0,0,0,0,100,0),
(@PATH,15,1202.953,-639.3985,-126.1688,0,0,0,0,100,0),
(@PATH,16,1188.303,-614.0296,-121.8816,0,0,0,0,100,0),
(@PATH,17,1164.196,-595.4036,-115.7764,0,0,0,0,100,0),
(@PATH,18,1155.213,-574.8707,-113.3766,0,0,0,0,100,0),
(@PATH,19,1164.196,-595.4036,-115.7764,0,0,0,0,100,0),
(@PATH,20,1188.303,-614.0296,-121.8816,0,0,0,0,100,0),
(@PATH,21,1202.953,-639.3985,-126.1688,0,0,0,0,100,0),
(@PATH,22,1200.504,-670.9343,-128.5453,0,0,0,0,100,0),
(@PATH,23,1175.589,-702.0806,-130.9749,0,0,0,0,100,0),
(@PATH,24,1149.458,-726.4506,-133.8044,0,0,0,0,100,0),
(@PATH,25,1117.097,-744.479,-145.6289,0,0,0,0,100,0),
(@PATH,26,1068.566,-742.8318,-151.7328,0,0,0,0,100,0),
(@PATH,27,1058.163,-706.0782,-156.6107,0,0,0,0,100,0),
(@PATH,28,1042.016,-695.8206,-163.7581,0,0,0,0,100,0),
(@PATH,29,1024.226,-684.4753,-173.2943,0,0,0,0,100,0),
(@PATH,30,1002.311,-661.9902,-194.1922,0,0,0,0,100,0),
(@PATH,31,975.1815,-641.0467,-201.5775,0,0,0,0,100,0),
(@PATH,32,936.2535,-612.5002,-203.6217,0,0,0,0,100,0),
(@PATH,33,899.6118,-613.5433,-202.2377,0,0,0,0,100,0),
(@PATH,34,856.4564,-617.9056,-202.1571,0,0,0,0,100,0),
(@PATH,35,831.386,-627.8932,-203.1487,0,0,0,0,100,0),
(@PATH,36,816.5816,-641.0675,-203.8891,0,0,0,0,100,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56675;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1144.05,`position_y`=-662.6844,`position_z`=-131.4626 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1144.05,-662.6844,-131.4626,0,0,0,0,100,0),
(@PATH,2,1160.286,-696.8795,-132.4863,0,0,0,0,100,0),
(@PATH,3,1129.031,-721.049,-139.5804,0,0,0,0,100,0),
(@PATH,4,1118.512,-712.1383,-144.2585,0,0,0,0,100,0),
(@PATH,5,1104.687,-722.1303,-146.9832,0,0,0,0,100,0),
(@PATH,6,1090.824,-731.3634,-149.9868,0,0,0,0,100,0),
(@PATH,7,1070.791,-717.5623,-153.4831,0,0,0,0,100,0),
(@PATH,8,1080.754,-681.5721,-159.8726,0,0,0,0,100,0),
(@PATH,9,1081.626,-681.3043,-159.6755,0,12000,0,0,100,0),
(@PATH,10,1079.369,-678.5401,-160.8983,0,10000,0,0,100,0),
(@PATH,11,1081.374,-680.3018,-159.9551,0,1000,0,0,100,0),
(@PATH,12,1080.824,-681.4283,-159.8819,0,2000,0,0,100,0),
(@PATH,13,1081.491,-679.0739,-160.1742,0,1000,0,0,100,0),
(@PATH,14,1079.343,-678.3975,-160.9352,0,5000,0,0,100,0),
(@PATH,15,1081.436,-676.3215,-160.7577,0,8000,0,0,100,0),
(@PATH,16,1080.754,-681.5721,-159.8726,0,1000,0,0,100,0),
(@PATH,17,1077.228,-678.6388,-161.4971,0,1000,0,0,100,0),
(@PATH,18,1077.687,-678.7886,-161.3334,0,1000,0,0,100,0),
(@PATH,19,1079.716,-679.3854,-160.6235,0,10000,0,0,100,0),
(@PATH,20,1081.338,-682.8629,-159.4373,0,10000,0,0,100,0),
(@PATH,21,1079.463,-680.3129,-160.5056,0,1000,0,0,100,0),
(@PATH,22,1080.754,-681.5721,-159.8726,0,1000,0,0,100,0),
(@PATH,23,1080.708,-679.2873,-160.3567,0,1000,0,0,100,0),
(@PATH,24,1082.191,-681.9566,-159.3777,0,9000,0,0,100,0),
(@PATH,25,1079.69,-678.5046,-160.8126,0,8000,0,0,100,0),
(@PATH,26,1080.177,-679.1766,-160.5332,0,1000,0,0,100,0),
(@PATH,27,1078.341,-677.3896,-161.4327,0,9000,0,0,100,0),
(@PATH,28,1079.791,-676.366,-161.2243,0,1000,0,0,100,0),
(@PATH,29,1078.341,-677.3896,-161.4327,0,1000,0,0,100,0),
(@PATH,30,1081.163,-683.5833,-159.3395,0,7000,0,0,100,0),
(@PATH,31,1080.636,-682.1011,-159.7975,0,1000,0,0,100,0),
(@PATH,32,1081.985,-678.5395,-160.1417,0,2000,0,0,100,0),
(@PATH,33,1081.526,-679.8784,-159.9983,0,1000,0,0,100,0),
(@PATH,34,1080.778,-681.3652,-159.9082,0,1000,0,0,100,0),
(@PATH,35,1079.221,-677.4147,-161.1729,0,1000,0,0,100,0),
(@PATH,36,1079.501,-678.1235,-160.946,0,2000,0,0,100,0),
(@PATH,37,1080.827,-681.6636,-159.8325,0,6000,0,0,100,0),
(@PATH,38,1085.063,-680.338,-158.8806,0,8000,0,0,100,0),
(@PATH,39,1079.092,-677.261,-161.242,0,1000,0,0,100,0),
(@PATH,40,1079.541,-677.6991,-161.0217,0,1000,0,0,100,0),
(@PATH,41,1081.284,-682.4361,-159.5412,0,2000,0,0,100,0),
(@PATH,42,1080.757,-681.0048,-159.9885,0,1000,0,0,100,0),
(@PATH,43,1083.066,-680.2807,-159.4699,0,6000,0,0,100,0),
(@PATH,44,1081.552,-677.1035,-160.5629,0,1000,0,0,100,0),
(@PATH,45,1081.611,-680.4688,-159.852,0,11000,0,0,100,0),
(@PATH,46,1080.048,-679.4224,-160.5198,0,7000,0,0,100,0),
(@PATH,47,1082.761,-681.9189,-159.2203,0,11000,0,0,100,0),
(@PATH,48,1078.952,-678.8635,-160.9521,0,8000,0,0,100,0),
(@PATH,49,1081.18,-681.5133,-159.7614,0,1000,0,0,100,0),
(@PATH,50,1080.676,-681.3997,-159.9307,0,11000,0,0,100,0),
(@PATH,51,1078.617,-679.6107,-160.8951,0,1000,0,0,100,0),
(@PATH,52,1081.279,-680.4371,-159.9548,0,1000,0,0,100,0),
(@PATH,53,1078.764,-677.3422,-161.3203,0,1000,0,0,100,0),
(@PATH,54,1080.66,-681.4279,-159.9294,0,2000,0,0,100,0),
(@PATH,55,1080.101,-708.452,-154.2289,0,1000,0,0,100,0),
(@PATH,56,1084.528,-731.8951,-151.0118,0,0,0,0,100,0),
(@PATH,57,1093.696,-748.0836,-149.2619,0,0,0,0,100,0),
(@PATH,58,1110.641,-738.1426,-146.5005,0,0,0,0,100,0),
(@PATH,59,1115.694,-716.585,-144.6347,0,0,0,0,100,0),
(@PATH,60,1148.22,-713.5815,-132.988,0,0,0,0,100,0),
(@PATH,61,1161.699,-694.4932,-132.2003,0,0,0,0,100,0),
(@PATH,62,1149.113,-669.7729,-130.3396,0,0,0,0,100,0),
(@PATH,63,1142.684,-647.411,-131.9233,0,0,0,0,100,0),
(@PATH,64,1142.684,-647.411,-131.9233,1.53589,60000,0,0,100,0);

-- Pathing for Core Hound Entry: 11673 'TDB FORMAT' 
SET @NPC := 56676;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=820.1378,`position_y`=-991.096,`position_z`=-207.1345 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,820.1378,-991.096,-207.1345,0,0,0,0,100,0),
(@PATH,2,815.0589,-979.8468,-208.6176,0,0,0,0,100,0),
(@PATH,3,820.1378,-991.096,-207.1345,0,0,0,0,100,0),
(@PATH,4,837.5117,-1001.866,-203.9284,0,0,0,0,100,0),
(@PATH,5,875.2714,-1009.17,-195.7951,0,0,0,0,100,0),
(@PATH,6,884.1406,-1024.13,-192.9333,0,0,0,0,100,0),
(@PATH,7,875.2714,-1009.17,-195.7951,0,0,0,0,100,0),
(@PATH,8,837.5117,-1001.866,-203.9284,0,0,0,0,100,0);

-- Pathing for Baron Geddon Entry: 12056 'TDB FORMAT' 
SET @NPC := 56655;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=747.5466,`position_y`=-981.676,`position_z`=-178.401 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,747.5466,-981.676,-178.401,0,0,1,0,100,0),
(@PATH,2,739.986,-953.2151,-185.7548,0,0,1,0,100,0),
(@PATH,3,716.3201,-910.8809,-193.1546,0,0,1,0,100,0),
(@PATH,4,701.403,-887.8356,-199.5063,0,0,1,0,100,0),
(@PATH,5,675.8235,-847.7932,-208.2585,0,0,1,0,100,0),
(@PATH,6,639.0753,-830.6404,-208.4202,0,0,1,0,100,0),
(@PATH,7,611.1107,-828.0424,-207.401,0,0,1,0,100,0),
(@PATH,8,591.2252,-811.5459,-205.4029,0,0,1,0,100,0),
(@PATH,9,608.8426,-787.6771,-207.4771,0,0,1,0,100,0),
(@PATH,10,643.6417,-778.0462,-208.7169,0,0,1,0,100,0),
(@PATH,11,664.3234,-786.412,-208.9517,0,0,1,0,100,0),
(@PATH,12,661.6707,-816.6882,-208.705,0,0,1,0,100,0),
(@PATH,13,678.5975,-847.099,-208.2891,0,0,1,0,100,0),
(@PATH,14,699.6382,-878.082,-201.5386,0,0,1,0,100,0),
(@PATH,15,718.3248,-907.4992,-193.3159,0,0,1,0,100,0),
(@PATH,16,740.3997,-949.3792,-186.3494,0,0,1,0,100,0),
(@PATH,17,746.6027,-966.5585,-181.5636,0,0,1,0,100,0);

-- Pathing for Shazzrah Entry: 12264 'TDB FORMAT' 
SET @NPC := 56608;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=587.3033,`position_y`=-801.9748,`position_z`=-205.1575 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,587.3033,-801.9748,-205.1575,0,0,0,0,100,0),
(@PATH,2,588.8104,-806.2665,-205.0612,0,0,0,0,100,0),
(@PATH,3,587.384,-811.3304,-205.1067,0,0,0,0,100,0),
(@PATH,4,583.1524,-811.6958,-205.1573,0,0,0,0,100,0),
(@PATH,5,579.2105,-806.6736,-205.2536,0,0,0,0,100,0),
(@PATH,6,579.0768,-804.3456,-205.2396,0,0,0,0,100,0),
(@PATH,7,580.0167,-800.6034,-205.4058,0,0,0,0,100,0),
(@PATH,8,583.49,-799.7552,-205.3562,0,0,0,0,100,0);

-- Pathing for Lucifron Entry: 12118 'TDB FORMAT' 
SET @NPC := 56605;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1037.022,`position_y`=-986.3419,`position_z`=-181.5163 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1037.022,-986.3419,-181.5163,0,0,0,0,100,0),
(@PATH,2,1053.15,-990.7546,-182.6615,0,0,0,0,100,0),
(@PATH,3,1070.411,-1006.765,-185.5444,0,0,0,0,100,0),
(@PATH,4,1053.299,-990.8936,-182.7192,0,0,0,0,100,0),
(@PATH,5,1037.022,-986.3419,-181.5163,0,0,0,0,100,0),
(@PATH,6,1014.705,-978.6508,-181.182,0,0,0,0,100,0),
(@PATH,7,1007.782,-958.0884,-180.174,0,0,0,0,100,0),
(@PATH,8,1000.203,-955.4069,-179.5825,0,0,0,0,100,0),
(@PATH,9,1007.782,-958.0884,-180.174,0,0,0,0,100,0),
(@PATH,10,1014.45,-978.5632,-181.1854,0,0,0,0,100,0);
-- Lucifron formation fixup
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (56605);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(56605,56605,0,0,2,0,0),
(56605,56606,4,90,2,3,8),
(56605,56607,4,270,2,3,8);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1035.672,`position_y`=-989.7419,`position_z`=-181.7763 WHERE `guid`=56606;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1038.512,`position_y`=-982.9519,`position_z`=-181.2578 WHERE `guid`=56607;
DELETE FROM `waypoint_data` WHERE `id` IN (566060,566070);

-- Pathing for Lava Surger Entry: 12101 'TDB FORMAT' 
SET @NPC := 56656;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1028.491,`position_y`=-908.0417,`position_z`=-161.3687 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1028.491,-908.0417,-161.3687,0,0,1,0,100,0),
(@PATH,2,1041.238,-888.9818,-158.3343,0,0,1,0,100,0),
(@PATH,3,1061.057,-900.0848,-159.2599,0,0,1,0,100,0),
(@PATH,4,1071.243,-893.1624,-156.4947,0,0,1,0,100,0),
(@PATH,5,1041.238,-888.9818,-158.3343,0,0,1,0,100,0),
(@PATH,6,1028.491,-908.0417,-161.3687,0,0,1,0,100,0),
(@PATH,7,1008.565,-890.0919,-165.3463,0,0,1,0,100,0),
(@PATH,8,980.3823,-904.361,-171.1376,0,0,1,0,100,0),
(@PATH,9,966.753,-899.8453,-175.7252,0,0,1,0,100,0),
(@PATH,10,957.4196,-885.538,-173.7588,0,0,1,0,100,0),
(@PATH,11,980.3823,-904.361,-171.1376,0,0,1,0,100,0),
(@PATH,12,1008.565,-890.0919,-165.3463,0,0,1,0,100,0);

-- Pathing for Lava Surger Entry: 12101 'TDB FORMAT' 
SET @NPC := 56657;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=748.5151,`position_y`=-725.4263,`position_z`=-211.9395 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,748.5151,-725.4263,-211.9395,0,0,1,0,100,0),
(@PATH,2,739.7422,-763.3509,-218.9724,0,0,1,0,100,0),
(@PATH,3,737.3899,-809.9995,-225.6305,0,0,1,0,100,0),
(@PATH,4,745.2436,-850.8501,-223.6281,0,0,1,0,100,0),
(@PATH,5,737.3899,-809.9995,-225.6305,0,0,1,0,100,0),
(@PATH,6,739.7422,-763.3509,-218.9724,0,0,1,0,100,0),
(@PATH,7,748.5151,-725.4263,-211.9395,0,0,1,0,100,0),
(@PATH,8,764.8676,-686.4996,-212.5972,0,0,1,0,100,0);

-- Pathing for Lava Surger Entry: 12101 'TDB FORMAT' 
SET @NPC := 56658;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=975.5094,`position_y`=-589.3787,`position_z`=-203.781 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,975.5094,-589.3787,-203.781,0,0,1,0,100,0),
(@PATH,2,958.4057,-595.7327,-203.9931,0,0,1,0,100,0),
(@PATH,3,950.7159,-608.6719,-202.882,0,0,1,0,100,0),
(@PATH,4,957.0149,-625.9316,-203.259,0,0,1,0,100,0),
(@PATH,5,980.0177,-632.2986,-203.5142,0,0,1,0,100,0),
(@PATH,6,990.2437,-625.777,-200.7675,0,0,1,0,100,0),
(@PATH,7,998.6928,-609.5692,-202.0619,0,0,1,0,100,0),
(@PATH,8,989.8893,-595.9269,-203.2261,0,0,1,0,100,0);

-- Pathing for Lava Surger Entry: 12101 'TDB FORMAT' 
SET @NPC := 56659;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=864.6398,`position_y`=-983.1211,`position_z`=-199.6699 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,864.6398,-983.1211,-199.6699,0,0,1,0,100,0),
(@PATH,2,875.8871,-1014.841,-194.9043,0,0,1,0,100,0),
(@PATH,3,891.3988,-1050.081,-187.1399,0,0,1,0,100,0),
(@PATH,4,891.1622,-1067.062,-182.6621,0,0,1,0,100,0),
(@PATH,5,883.1496,-1090.733,-176.0342,0,0,1,0,100,0),
(@PATH,6,870.0406,-1110.407,-169.6678,0,0,1,0,100,0),
(@PATH,7,855.7172,-1121.873,-161.9807,0,0,1,0,100,0),
(@PATH,8,839.0113,-1128.492,-156.5452,0,0,1,0,100,0),
(@PATH,9,819.8719,-1143.5,-153.6145,0,0,1,0,100,0),
(@PATH,10,809.326,-1150.683,-152.5631,0,0,1,0,100,0),
(@PATH,11,791.812,-1152.45,-150.4214,0,0,1,0,100,0),
(@PATH,12,787.2233,-1123.192,-150.5524,0,0,1,0,100,0),
(@PATH,13,757.2313,-1129.672,-145.1273,0,0,1,0,100,0),
(@PATH,14,723.393,-1106.211,-143.0938,0,0,1,0,100,0),
(@PATH,15,701.5763,-1137.426,-135.6903,0,0,1,0,100,0),
(@PATH,16,666.1591,-1162.693,-126.0165,0,0,1,0,100,0),
(@PATH,17,693.4008,-1186.742,-120.9137,0,0,1,0,100,0),
(@PATH,18,717.1637,-1193.438,-118.9491,0,0,1,0,100,0),
(@PATH,19,736.2715,-1211.634,-118.8998,0,0,1,0,100,0),
(@PATH,20,759.3818,-1228.879,-119.2757,0,0,1,0,100,0),
(@PATH,21,736.2715,-1211.634,-118.8998,0,0,1,0,100,0),
(@PATH,22,717.1637,-1193.438,-118.9491,0,0,1,0,100,0),
(@PATH,23,693.4008,-1186.742,-120.9137,0,0,1,0,100,0),
(@PATH,24,666.1591,-1162.693,-126.0165,0,0,1,0,100,0),
(@PATH,25,701.5763,-1137.426,-135.6903,0,0,1,0,100,0),
(@PATH,26,723.393,-1106.211,-143.0938,0,0,1,0,100,0),
(@PATH,27,757.2313,-1129.672,-145.1273,0,0,1,0,100,0),
(@PATH,28,787.2233,-1123.192,-150.5524,0,0,1,0,100,0),
(@PATH,29,791.812,-1152.45,-150.4214,0,0,1,0,100,0),
(@PATH,30,809.326,-1150.683,-152.5631,0,0,1,0,100,0),
(@PATH,31,819.8719,-1143.5,-153.6145,0,0,1,0,100,0),
(@PATH,32,839.0113,-1128.492,-156.5452,0,0,1,0,100,0),
(@PATH,33,855.7172,-1121.873,-161.9807,0,0,1,0,100,0),
(@PATH,34,870.0406,-1110.407,-169.6678,0,0,1,0,100,0),
(@PATH,35,883.1496,-1090.733,-176.0342,0,0,1,0,100,0),
(@PATH,36,891.1622,-1067.062,-182.6621,0,0,1,0,100,0),
(@PATH,37,891.3988,-1050.081,-187.1399,0,0,1,0,100,0),
(@PATH,38,875.8871,-1014.841,-194.9043,0,0,1,0,100,0),
(@PATH,39,864.6398,-983.1211,-199.6699,0,0,1,0,100,0);

-- Pathing for Lava Surger Entry: 12101 'TDB FORMAT' 
SET @NPC := 56660;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=912.38,`position_y`=-812.9961,`position_z`=-227.3731 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,912.38,-812.9961,-227.3731,0,0,1,0,100,0),
(@PATH,2,917.8469,-848.5494,-219.4701,0,0,1,0,100,0),
(@PATH,3,913.7874,-875.5369,-214.22,0,0,1,0,100,0),
(@PATH,4,890.5936,-905.0054,-222.0683,0,0,1,0,100,0),
(@PATH,5,860.6026,-921.1229,-225.7609,0,0,1,0,100,0),
(@PATH,6,816.981,-920.8954,-225.8454,0,0,1,0,100,0),
(@PATH,7,782.662,-911.1868,-222.6471,0,0,1,0,100,0),
(@PATH,8,816.9766,-920.8942,-225.8542,0,0,1,0,100,0),
(@PATH,9,860.6026,-921.1229,-225.7609,0,0,1,0,100,0),
(@PATH,10,890.5936,-905.0054,-222.0683,0,0,1,0,100,0),
(@PATH,11,913.7874,-875.5369,-214.22,0,0,1,0,100,0),
(@PATH,12,917.8469,-848.5494,-219.4701,0,0,1,0,100,0),
(@PATH,13,912.38,-812.9961,-227.3731,0,0,1,0,100,0),
(@PATH,14,909.2687,-788.947,-226.9377,0,0,1,0,100,0),
(@PATH,15,895.7159,-764.4568,-224.3548,0,0,1,0,100,0),
(@PATH,16,879.3519,-761.3517,-224.0491,0,0,1,0,100,0),
(@PATH,17,865.0396,-765.1099,-224.75,0,0,1,0,100,0),
(@PATH,18,884.0205,-803.6951,-226.6926,0,0,1,0,100,0),
(@PATH,19,889.6862,-825.1835,-227.3351,0,0,1,0,100,0),
(@PATH,20,865.6118,-779.7151,-225.9819,0,0,1,0,100,0),
(@PATH,21,865.0396,-765.1099,-224.75,0,0,1,0,100,0),
(@PATH,22,879.3519,-761.3517,-224.0491,0,0,1,0,100,0),
(@PATH,23,895.7159,-764.4568,-224.3548,0,0,1,0,100,0),
(@PATH,24,909.2687,-788.947,-226.9377,0,0,1,0,100,0);

-- Pathing for Lava Surger Entry: 12101 'TDB FORMAT' 
SET @NPC := 56661;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1031.916,`position_y`=-889.574,`position_z`=-160.0134 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1031.916,-889.574,-160.0134,0,0,1,0,100,0),
(@PATH,2,1069.734,-893.855,-156.7931,0,0,1,0,100,0),
(@PATH,3,1031.916,-889.574,-160.0134,0,0,1,0,100,0),
(@PATH,4,996.8139,-897.9012,-168.1947,0,0,1,0,100,0),
(@PATH,5,962.845,-884.6795,-173.6825,0,0,1,0,100,0),
(@PATH,6,987.062,-893.2951,-169.7379,0,0,1,0,100,0),
(@PATH,7,1001.684,-886.9771,-167.0547,0,0,1,0,100,0),
(@PATH,8,1008.282,-863.9785,-164.7876,0,0,1,0,100,0),
(@PATH,9,987.062,-893.2951,-169.7379,0,0,1,0,100,0),
(@PATH,10,962.845,-884.6795,-173.6825,0,0,1,0,100,0),
(@PATH,11,996.8139,-897.9012,-168.1947,0,0,1,0,100,0);

-- Pathing for Lava Surger Entry: 12101 'TDB FORMAT' 
SET @NPC := 56662;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1068.962,`position_y`=-696.559,`position_z`=-157.781 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1068.962,-696.559,-157.781,0,0,1,0,100,0),
(@PATH,2,1053.966,-737.0459,-151.7794,0,0,1,0,100,0),
(@PATH,3,1059.624,-760.5685,-151.586,0,0,1,0,100,0),
(@PATH,4,1084.683,-739.8831,-150.7728,0,0,1,0,100,0),
(@PATH,5,1099.292,-778.5201,-151.1692,0,0,1,0,100,0),
(@PATH,6,1125.305,-739.6833,-142.7612,0,0,1,0,100,0),
(@PATH,7,1159.508,-719.2535,-133.2384,0,0,1,0,100,0),
(@PATH,8,1192.168,-686.1762,-128.7967,0,0,1,0,100,0),
(@PATH,9,1211.332,-653.7628,-127.9139,0,0,1,0,100,0),
(@PATH,10,1187.516,-611.0389,-121.1588,0,0,1,0,100,0),
(@PATH,11,1148.847,-599.9906,-114.898,0,0,1,0,100,0),
(@PATH,12,1187.516,-611.0389,-121.1588,0,0,1,0,100,0),
(@PATH,13,1211.332,-653.7628,-127.9139,0,0,1,0,100,0),
(@PATH,14,1192.168,-686.1762,-128.7967,0,0,1,0,100,0),
(@PATH,15,1159.508,-719.2535,-133.2384,0,0,1,0,100,0),
(@PATH,16,1125.392,-739.6312,-142.7302,0,0,1,0,100,0),
(@PATH,17,1099.292,-778.5201,-151.1692,0,0,1,0,100,0),
(@PATH,18,1084.683,-739.8831,-150.7728,0,0,1,0,100,0),
(@PATH,19,1059.654,-760.5442,-151.592,0,0,1,0,100,0),
(@PATH,20,1053.966,-737.0459,-151.7794,0,0,1,0,100,0),
(@PATH,21,1068.962,-696.559,-157.781,0,0,1,0,100,0),
(@PATH,22,1046.413,-674.9515,-169.5157,0,0,1,0,100,0),
(@PATH,23,1023.84,-646.451,-189.8513,0,0,1,0,100,0),
(@PATH,24,1046.413,-674.9515,-169.5157,0,0,1,0,100,0);

-- Pathing for Lava Surger Entry: 12101 'TDB FORMAT' 
SET @NPC := 56664;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=759.9225,`position_y`=-689.7131,`position_z`=-212.5623 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,759.9225,-689.7131,-212.5623,0,0,1,0,100,0),
(@PATH,2,779.0322,-680.1849,-213.9095,0,0,1,0,100,0),
(@PATH,3,800.4368,-665.5578,-208.9407,0,0,1,0,100,0),
(@PATH,4,807.4164,-656.269,-206.1155,0,0,1,0,100,0),
(@PATH,5,779.0322,-680.1849,-213.9095,0,0,1,0,100,0),
(@PATH,6,759.9225,-689.7131,-212.5623,0,0,1,0,100,0),
(@PATH,7,753.9745,-704.1632,-211.753,0,0,1,0,100,0),
(@PATH,8,758.8966,-684.4725,-212.381,0,0,1,0,100,0),
(@PATH,9,780.8896,-669.565,-211.4591,0,0,1,0,100,0),
(@PATH,10,791.4582,-652.981,-207.6324,0,0,1,0,100,0),
(@PATH,11,758.8966,-684.4725,-212.381,0,0,1,0,100,0),
(@PATH,12,753.9745,-704.1632,-211.753,0,0,1,0,100,0);

-- Pathing for Lava Surger Entry: 12101 'TDB FORMAT' 
SET @NPC := 56665;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1035.173,`position_y`=-854.7958,`position_z`=-158.8589 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1035.173,-854.7958,-158.8589,0,0,1,0,100,0),
(@PATH,2,1057.385,-862.5274,-159.6177,0,0,1,0,100,0),
(@PATH,3,995.0676,-853.4235,-165.4317,0,0,1,0,100,0);

-- Pathing for Lava Surger Entry: 12101 'TDB FORMAT' 
SET @NPC := 56740;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=667.9337,`position_y`=-1066.047,`position_z`=-188.3889 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,667.9337,-1066.047,-188.3889,0,0,1,0,100,0),
(@PATH,2,619.8726,-1066.64,-199.7958,0,0,1,0,100,0),
(@PATH,3,613.3337,-1099.887,-198.7582,0,0,1,0,100,0),
(@PATH,4,591.3667,-1135.207,-200.2088,0,0,1,0,100,0),
(@PATH,5,578.8029,-1173.733,-194.7558,0,0,1,0,100,0),
(@PATH,6,591.5503,-1192.438,-195.7943,0,0,1,0,100,0),
(@PATH,7,608.195,-1194.054,-195.7651,0,0,1,0,100,0),
(@PATH,8,623.8442,-1186.21,-195.8348,0,0,1,0,100,0),
(@PATH,9,628.4896,-1171.869,-194.5435,0,0,1,0,100,0),
(@PATH,10,628.3709,-1151.011,-197.0152,0,0,1,0,100,0),
(@PATH,11,626.806,-1131.724,-200.8709,0,0,1,0,100,0),
(@PATH,12,645.6395,-1106.676,-196.4797,0,0,1,0,100,0);

-- Pathing for Lava Surger Entry: 12101 'TDB FORMAT' 
SET @NPC := 56741;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1055.823,`position_y`=-833.2653,`position_z`=-154.468 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1055.823,-833.2653,-154.468,0,0,0,0,100,0),
(@PATH,2,1032.143,-826.1788,-154.2626,0,0,0,0,100,0),
(@PATH,3,1015.666,-808.7546,-148.7213,0,0,0,0,100,0),
(@PATH,4,1032.143,-826.1788,-154.2626,0,0,0,0,100,0);

-- Pathing for Lava Surger Entry: 12101 'TDB FORMAT' 
SET @NPC := 56789;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=679.1953,`position_y`=-847.3836,`position_z`=-208.2482 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,679.1953,-847.3836,-208.2482,0,0,1,0,100,0),
(@PATH,2,676.7046,-829.8509,-208.8353,0,0,1,0,100,0),
(@PATH,3,665.002,-813.2372,-208.774,0,0,1,0,100,0),
(@PATH,4,681.6021,-776.7833,-209.1657,0,0,1,0,100,0),
(@PATH,5,686.1985,-738.5436,-209.2948,0,0,1,0,100,0),
(@PATH,6,707.9111,-711.0708,-209.5187,0,0,1,0,100,0),
(@PATH,7,708.2624,-692.8405,-209.5718,0,0,1,0,100,0),
(@PATH,8,690.2739,-662.6287,-209.6574,0,0,1,0,100,0),
(@PATH,9,708.2625,-692.8368,-209.5175,0,0,1,0,100,0),
(@PATH,10,707.9111,-711.0708,-209.5187,0,0,1,0,100,0),
(@PATH,11,686.1985,-738.5436,-209.2948,0,0,1,0,100,0),
(@PATH,12,681.6021,-776.7833,-209.1657,0,0,1,0,100,0),
(@PATH,13,665.002,-813.2372,-208.774,0,0,1,0,100,0),
(@PATH,14,676.7046,-829.8509,-208.8353,0,0,1,0,100,0),
(@PATH,15,679.1953,-847.3836,-208.2482,0,0,1,0,100,0),
(@PATH,16,696.5482,-855.4606,-206.0954,0,0,1,0,100,0),
(@PATH,17,710.7119,-882.6242,-198.953,0,0,1,0,100,0),
(@PATH,18,714.8118,-907.6405,-193.7685,0,0,1,0,100,0),
(@PATH,19,735.3042,-937.3447,-188.4066,0,0,1,0,100,0),
(@PATH,20,714.8118,-907.6405,-193.7685,0,0,1,0,100,0),
(@PATH,21,710.7119,-882.6242,-198.953,0,0,1,0,100,0),
(@PATH,22,697.0541,-866.1818,-204.0854,0,0,1,0,100,0);
 
 
/* 
* sql\updates\world\2015_10_11_04_world.sql 
*/ 
-- Lothos Riftwaker SAI Spell fix
UPDATE `smart_scripts` SET `action_param2`=2 WHERE `entryorguid`=14387;
 
 
/* 
* sql\updates\world\2015_10_12_00_world.sql 
*/ 
--
DELETE FROM `gameobject` WHERE `guid` IN (5514,5515,5516,5517,5518,5519,5520,5521,5522,5523,5524,5525,5526,5527,5528);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(5514, 191517, 571, 0, 0, 1, 1, 6255.64, -1185.84, 425.924, 2.12057, 0, 0, 0, 1, 300, 100, 1, 0),
(5515, 1732, 0, 0, 0, 1, 1, -9255, -2735, 89.702, 0.436, 0, 0, 0.216439, 0.976296, 900, 100, 1, 0),
(5516, 1732, 0, 0, 0, 1, 1, -3149, -3275, 63.632, 0.262, 0, 0, 0, 0, 900, 100, 1, 0),
(5518, 1732, 0, 0, 0, 1, 1, -9853.86, 1406.45, 38.028, 1.826, 0, 0, 0.95848, 0.285161, 900, 100, 1, 0),
(5519, 1732, 0, 0, 0, 1, 1, -9835.8, 1394.81, 38.405, 0.106, 0, 0, 0, 0, 900, 100, 1, 0),
(5520, 1732, 0, 0, 0, 1, 1, -9854.17, 1391.69, 38.7294, 3.244, 0, 0, 0, 0, 900, 100, 1, 0),
(5522, 1732, 1, 0, 0, 1, 1, -1521, 1964.46, 67.374, 1.85, 0, 0, 0.798635, 0.601815, 900, 100, 1, 0),
(5523, 1732, 0, 0, 0, 1, 1, -9847.12, 1399.89, 37.1306, 3.397, 0, 0, 0.95848, 0.285161, 900, 100, 1, 0),
(5524, 1732, 0, 0, 0, 1, 1, -1123, -1277, 66.215, 3.817, 0, 0, 0.943491, -0.331398, 900, 100, 1, 0),
(5525, 1732, 1, 0, 0, 1, 1, 2508.13, -1446, 172.044, -2, 0, 0, 0, 0, 900, 100, 1, 0),
(5526, 2054, 0, 0, 0, 1, 1, -8850, -1905, 125.96, 4.143, 0, 0, 0, 0, 900, 100, 1, 0),
(5527, 1732, 0, 0, 0, 1, 1, -9828, 1415.7, 37.242, 2.663, 0, 0, 0, 0, 900, 100, 1, 0),
(5528, 1732, 0, 0, 0, 1, 1, -9843, 1386.87, 39.012, 4.783, 0, 0, 0, 0, 900, 100, 1, 0);
 
 
/* 
* sql\updates\world\2015_10_13_00_world_335.sql 
*/ 
--
DELETE FROM `game_event_creature` WHERE `guid` IN (87734,87736,87877);
DELETE FROM `game_event_creature` WHERE `guid` IN (28797,28798,28799);
INSERT INTO `game_event_creature` (`eventEntry`,`guid`) VALUES
(24,28797),(24,28798),(24,28799);

DELETE FROM `creature` WHERE `guid` IN (87734,87736,87877);
DELETE FROM `creature` WHERE `guid` IN (28797,28798,28799);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(28797,24497,1,1,1,1279.69,-4411.26,26.4771,1.97222,43200,0,0),
(28798,24484,1,1,1,1329.54,-4360.52,27.8138,0.940035,450,0,0),
(28799,24484,1,1,1,1332.88,-4360.04,28.1824,1.73972,450,0,0);
 
 
/* 
* sql\updates\world\2015_10_14_00_world.sql 
*/ 
-- Remove spawned Vexniss Borer
DELETE FROM `creature` WHERE `guid` BETWEEN 87654 AND 87670;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 87654 AND 87670;
-- Remove spawned Vauj Brood
DELETE FROM `creature` WHERE `guid` BETWEEN 88068 AND 88071;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 88068 AND 88071;
-- Remove overspawned Vexniss Warrior
DELETE FROM `creature` WHERE `guid` BETWEEN 87614 AND 87616;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 87614 AND 87616;
DELETE FROM `creature` WHERE `guid` BETWEEN 87645 AND 87647;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 87645 AND 87647;
-- Remove overspawned Vexniss Guardian
DELETE FROM `creature` WHERE `guid` BETWEEN 87639 AND 87644;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 87639 AND 87644;
DELETE FROM `creature` WHERE `guid`=87671;
DELETE FROM `creature_addon` WHERE `guid`=87671;

SET @CGUID := 87564;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+7;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 15264, 531, 1, 1, -8321.975, 2142.675, 118.266, 0.6283185, 7200, 0, 0),
(@CGUID+1, 15264, 531, 1, 1, -8156.46, 2119.579, 129.2029, 3.577925, 7200, 0, 0),
(@CGUID+2, 15264, 531, 1, 1, -8288.92, 2054.495, 118.3005, 0.5235988, 7200, 0, 0),
(@CGUID+3, 15264, 531, 1, 1, -8159.368, 2144.159, 129.5639, 4.08407, 7200, 0, 0),
(@CGUID+4, 15264, 531, 1, 1, -8297.351, 2075.668, 118.2692, 0.6108652, 7200, 0, 0),
(@CGUID+5, 15264, 531, 1, 1, -8182.612, 2166.212, 129.6401, 4.642576, 7200, 0, 0),
(@CGUID+6, 15264, 531, 1, 1, -8314.339, 2119.221, 118.2629, 0.541052, 7200, 0, 0),
(@CGUID+7, 15264, 531, 1, 1, -8206.177, 2164.815, 129.4669, 5.026548, 7200, 0, 0);

DELETE FROM `creature` WHERE `guid` IN (88075,87527,87528,87529,87652,87653,87595,87596,87597,87598,87599,87600,87601,87602);
DELETE FROM `creature` WHERE `guid` BETWEEN 87604 AND 87638;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(88075, 15263, 531, 1, 1, -8346.052, 2080.981, 125.7325, 0.4014257, 7200, 0, 0),
(87527, 15502, 531, 1, 1, -8496.147, 1932.62, 135.7384, 1.308997, 7200, 0, 0),
(87529, 15503, 531, 1, 1, -8500.15, 1937.377, 135.7554, 0.4712389, 7200, 0, 0),
(87528, 15504, 531, 1, 1, -8499.575, 1933.64, 135.7087, 0.9773844, 7200, 0, 0),
(87652, 15262, 531, 1, 1, -8281.484, 2087.381, 118.3001, 4.957793, 7200, 0, 0),
(87653, 15262, 531, 1, 1, -8327.386, 2080.153, 125.6371, 5.012831, 7200, 0, 0),
(87595, 15233, 531, 1, 1, -8404.733, 2070.303, 116.2127, 3.647738, 7200, 0, 0),
(87596, 15233, 531, 1, 1, -8396.88, 2051.316, 116.2118, 3.385939, 7200, 0, 0),
(87597, 15247, 531, 1, 1, -8391.906, 2063.48, 116.2034, 3.508112, 7200, 0, 0),
(87598, 15247, 531, 1, 1, -8592.574, 1976.949, -1.209995, 6.091199, 7200, 0, 0),
(87599, 15233, 531, 1, 1, -8586.837, 1985.7, -1.542133, 1.894589, 7200, 5, 1),
(87600, 15233, 531, 1, 1, -8581.488, 1970.878, -1.458955, 4.427207, 7200, 5, 1),
(87608, 15233, 531, 1, 1, -8593.99, 1964.035, -1.260533, 1.852829, 7200, 5, 1),
(87601, 15543, 531, 1, 1, -8587.962, 2174.209, -4.147823, 4.939282, 7200, 0, 0),
(87602, 15511, 531, 1, 1, -8566.884, 2177.171, -3.978982, 4.223697, 7200, 0, 0),
(87604, 15247, 531, 1, 1, -8548.23, 2130.356, -2.730221, 4.485496, 7200, 0, 0),
(87605, 15247, 531, 1, 1, -8551.39, 2118.207, -1.737938, 1.22173, 7200, 0, 0),
(87606, 15247, 531, 1, 1, -8623.282, 2108.951, -2.676475, 3.787364, 7200, 0, 0),
(87607, 15247, 531, 1, 1, -8631.831, 2101.618, -1.330519, 0.5061455, 7200, 0, 0),
(87609, 15233, 531, 1, 1, -8541.605, 2134.76, -2.544568, 1.736609, 7200, 0, 0),
(87610, 15233, 531, 1, 1, -8550.414, 2110.023, -0.8794384, 5.872046, 7200, 0, 0),
(87611, 15233, 531, 1, 1, -8544.825, 2124.616, -1.830906, 5.065909, 7200, 0, 0),
(87612, 15233, 531, 1, 1, -8620.168, 2093.819, -1.801619, 5.462881, 7200, 0, 0),
(87613, 15233, 531, 1, 1, -8633.741, 2112.304, -1.909737, 1.784077, 7200, 0, 0),
(87614, 15233, 531, 1, 1, -8636.268, 2090.388, -1.370589, 1.34908, 7200, 0, 0),
(87615, 15233, 531, 1, 1, -8369.455, 2060.384, 9.630878, 5.041036, 7200, 0, 0),
(87616, 15233, 531, 1, 1, -8368.543, 2035.741, 9.288624, 2.589778, 7200, 0, 0),
(87617, 15233, 531, 1, 1, -8397.211, 2058.122, 9.618873, 1.057295, 7200, 0, 0),
(87618, 15233, 531, 1, 1, -8385.495, 2044.833, 9.216681, 0.1224109, 7200, 0, 0),
(87619, 15233, 531, 1, 1, -8393.083, 2075.153, 9.179768, 5.667883, 7200, 0, 0),
(87620, 15233, 531, 1, 1, -8378.618, 2070.816, 8.844448, 1.763804, 7200, 0, 0),
(87621, 15233, 531, 1, 1, -8326.908, 1891.109, -1.837783, 5.856318, 7200, 0, 0),
(87622, 15233, 531, 1, 1, -8339.306, 1800.288, -1.517404, 3.040907, 7200, 0, 0),
(87623, 15233, 531, 1, 1, -8351.284, 1805.48, -1.233535, 0.5619113, 7200, 0, 0),
(87624, 15233, 531, 1, 1, -8344.919, 1919.037, -2.500755, 3.838682, 7200, 0, 0),
(87625, 15233, 531, 1, 1, -8402.613, 1914.386, 3.142937, 2.031992, 7200, 0, 0),
(87626, 15233, 531, 1, 1, -8351.182, 1921.119, -2.540841, 3.627775, 7200, 0, 0),
(87627, 15233, 531, 1, 1, -8328.894, 1876.641, -2.246095, 4.796616, 7200, 0, 0),
(87628, 15233, 531, 1, 1, -8401.165, 1932.269, 2.618013, 5.465084, 7200, 0, 0),
(87629, 15233, 531, 1, 1, -8350.329, 1814.966, 0.02815836, 0.622449, 7200, 0, 0),
(87630, 15233, 531, 1, 1, -8339.517, 1890.658, -2.486081, 2.180425, 7200, 0, 0),
(87631, 15233, 531, 1, 1, -8393.705, 1924.228, 3.221893, 2.51069, 7200, 0, 0),
(87632, 15233, 531, 1, 1, -8357.022, 1822.796, 0.3194859, 6.032223, 7200, 0, 0),
(87633, 15233, 531, 1, 1, -8395.523, 1942.848, 4.020818, 5.754907, 7200, 0, 0),
(87634, 15233, 531, 1, 1, -8341.861, 1906.819, -2.410278, 5.228793, 7200, 0, 0),
(87635, 15233, 531, 1, 1, -8390.899, 1914.458, 3.005651, 2.863161, 7200, 0, 0),
(87636, 15233, 531, 1, 1, -8408.117, 1938.302, 3.825733, 2.332423, 7200, 0, 0),
(87637, 15233, 531, 1, 1, -8348.093, 1790.437, -2.233759, 2.154297, 7200, 0, 0),
(87638, 15233, 531, 1, 1, -8363.572, 1811.677, 1.227631, 5.535646, 7200, 0, 0);

DELETE FROM `creature` WHERE `id` IN (15962,15630);

SET @CGUID := 87678;
DELETE FROM `creature` WHERE `guid` BETWEEN 87678 AND 87900;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 15300, 531, 1, 1, -7892.548, 1435.668, -65.22711, 0.03490658, 7200, 5, 1),
(@CGUID+1, 15300, 531, 1, 1, -7892.569, 1422.789, -64.86232, 0.03490658, 7200, 5, 1),
(@CGUID+2, 15300, 531, 1, 1, -7893.518, 1410.414, -63.56542, 0.06981317, 7200, 5, 1),
(@CGUID+3, 15300, 531, 1, 1, -7898.467, 1467.742, -63.57774, 0.9599311, 7200, 5, 1),
(@CGUID+4, 15300, 531, 1, 1, -7902.507, 1379.252, -64.91041, 5.602507, 7200, 5, 1),
(@CGUID+5, 15300, 531, 1, 1, -7903.237, 1475.595, -62.51829, 0.1745329, 7200, 5, 1),
(@CGUID+6, 15300, 531, 1, 1, -7904.257, 1483.905, -61.91321, 0.1919862, 7200, 5, 1),
(@CGUID+7, 15300, 531, 1, 1, -7905.727, 1397.53, -65.67427, 1.689209, 7200, 5, 1),
(@CGUID+8, 15300, 531, 1, 1, -7908.201, 1441.5, -67.67268, 1.965443, 7200, 5, 1),
(@CGUID+9, 15300, 531, 1, 1, -7909.212, 1453.823, -66.71354, 5.388192, 7200, 5, 1),
(@CGUID+10, 15300, 531, 1, 1, -7909.227, 1432.98, -68.22237, 2.530727, 7200, 5, 1),
(@CGUID+11, 15300, 531, 1, 1, -7909.395, 1408.309, -66.57648, 2.094395, 7200, 5, 1),
(@CGUID+12, 15300, 531, 1, 1, -7911.222, 1360.079, -75.37612, 5.811946, 7200, 5, 1),
(@CGUID+13, 15300, 531, 1, 1, -7911.51, 1433.753, -68.01991, 2.973195, 7200, 5, 1),
(@CGUID+14, 15300, 531, 1, 1, -7912.08, 1399.684, -68.01915, 4.38238, 7200, 5, 1),
(@CGUID+15, 15300, 531, 1, 1, -7912.685, 1392.55, -68.86684, 4.433136, 7200, 5, 1),
(@CGUID+16, 15300, 531, 1, 1, -7915.495, 1391.565, -68.96242, 0.1829643, 7200, 5, 1),
(@CGUID+17, 15300, 531, 1, 1, -7916.698, 1452.717, -66.98033, 3.176499, 7200, 5, 1),
(@CGUID+18, 15300, 531, 1, 1, -7919.031, 1399.421, -65.47141, 0.8203048, 7200, 5, 1),
(@CGUID+19, 15300, 531, 1, 1, -7919.174, 1450.881, -66.86721, 3.781995, 7200, 5, 1),
(@CGUID+20, 15300, 531, 1, 1, -7919.538, 1503.975, -60.7916, 0.6806784, 7200, 5, 1),
(@CGUID+21, 15300, 531, 1, 1, -7919.866, 1441.265, -66.96127, 0.03490658, 7200, 5, 1),
(@CGUID+22, 15300, 531, 1, 1, -7921.188, 1485.365, -64.48227, 3.437477, 7200, 5, 1),
(@CGUID+23, 15300, 531, 1, 1, -7923.026, 1477.876, -65.64141, 3.438299, 7200, 5, 1),
(@CGUID+24, 15300, 531, 1, 1, -7925.117, 1421.922, -65.61559, 3.193953, 7200, 5, 1),
(@CGUID+25, 15300, 531, 1, 1, -7926.443, 1354.812, -83.58868, 3.46605, 7200, 5, 1),
(@CGUID+26, 15300, 531, 1, 1, -7926.561, 1411.766, -65.3652, 2.740167, 7200, 5, 1),
(@CGUID+27, 15300, 531, 1, 1, -7926.702, 1518.368, -59.68728, 0.5585054, 7200, 5, 1),
(@CGUID+28, 15300, 531, 1, 1, -7927.257, 1493.96, -64.12371, 2.336106, 7200, 5, 1),
(@CGUID+29, 15300, 531, 1, 1, -7927.331, 1328.951, -89.86474, 5.759586, 7200, 5, 1),
(@CGUID+30, 15300, 531, 1, 1, -7927.374, 1365.604, -79.83042, 6.056293, 7200, 5, 1),
(@CGUID+31, 15300, 531, 1, 1, -7927.462, 1472.604, -65.65568, 1.799682, 7200, 5, 1),
(@CGUID+32, 15300, 531, 1, 1, -7927.478, 1389.667, -69.12563, 2.949606, 7200, 5, 1),
(@CGUID+33, 15300, 531, 1, 1, -7929.896, 1484.513, -65.13245, 2.539029, 7200, 5, 1),
(@CGUID+34, 15300, 531, 1, 1, -7930.548, 1320.507, -90.37265, 5.707227, 7200, 5, 1),
(@CGUID+35, 15300, 531, 1, 1, -7931.007, 1349.313, -86.4936, 4.62881, 7200, 5, 1),
(@CGUID+36, 15300, 531, 1, 1, -7932.876, 1453.155, -65.91177, 3.333579, 7200, 5, 1),
(@CGUID+37, 15300, 531, 1, 1, -7933.675, 1528.835, -59.21246, 0.6283185, 7200, 5, 1),
(@CGUID+38, 15300, 531, 1, 1, -7933.889, 1378.917, -75.02083, 3.036873, 7200, 5, 1),
(@CGUID+39, 15300, 531, 1, 1, -7935.543, 1492.749, -64.42677, 5.602507, 7200, 5, 1),
(@CGUID+40, 15300, 531, 1, 1, -7936.098, 1496.016, -64.40736, 3.071736, 7200, 5, 1),
(@CGUID+41, 15300, 531, 1, 1, -7937.946, 1461.595, -65.50119, 3.804818, 7200, 5, 1),
(@CGUID+42, 15300, 531, 1, 1, -7938.33, 1348.699, -87.84061, 3.572022, 7200, 5, 1),
(@CGUID+43, 15300, 531, 1, 1, -7938.882, 1372.345, -78.70309, 2.199115, 7200, 5, 1),
(@CGUID+44, 15300, 531, 1, 1, -7939.133, 1356.648, -86.10828, 1.623156, 7200, 5, 1),
(@CGUID+45, 15300, 531, 1, 1, -7940.602, 1337.277, -91.03973, 2.722714, 7200, 5, 1),
(@CGUID+46, 15300, 531, 1, 1, -7949.532, 1525.042, -62.28769, 2.129302, 7200, 5, 1),
(@CGUID+47, 15300, 531, 1, 1, -7949.806, 1486.382, -63.61917, 3.525565, 7200, 5, 1),
(@CGUID+48, 15300, 531, 1, 1, -7950.41, 1317.311, -89.45904, 1.911877, 7200, 5, 1),
(@CGUID+49, 15300, 531, 1, 1, -7950.723, 1521.167, -62.74979, 2.950145, 7200, 5, 1),
(@CGUID+50, 15300, 531, 1, 1, -7954.241, 1559.81, -59.11872, 0.715585, 7200, 5, 1),
(@CGUID+51, 15300, 531, 1, 1, -7954.718, 1540.167, -60.00118, 4.363323, 7200, 5, 1),
(@CGUID+52, 15300, 531, 1, 1, -7954.768, 1345.852, -91.36903, 3.124139, 7200, 5, 1),
(@CGUID+53, 15300, 531, 1, 1, -7955.768, 1568.089, -60.09465, 0.2268928, 7200, 5, 1),
(@CGUID+54, 15300, 531, 1, 1, -7955.857, 1498.233, -62.65005, 3.665191, 7200, 5, 1),
(@CGUID+55, 15300, 531, 1, 1, -7955.873, 1284.801, -75.54648, 5.8294, 7200, 5, 1),
(@CGUID+56, 15300, 531, 1, 1, -7957.664, 1340.282, -92.26547, 2.286381, 7200, 5, 1),
(@CGUID+57, 15300, 531, 1, 1, -7958.491, 1528.291, -61.77398, 3.857317, 7200, 5, 1),
(@CGUID+58, 15300, 531, 1, 1, -7959.439, 1320.096, -89.41815, 0.8552113, 7200, 5, 1),
(@CGUID+59, 15300, 531, 1, 1, -7960.226, 1307.606, -83.07062, 5.003528, 7200, 5, 1),
(@CGUID+60, 15300, 531, 1, 1, -7961.386, 1279.918, -73.73505, 5.375614, 7200, 5, 1),
(@CGUID+61, 15300, 531, 1, 1, -7961.915, 1338.292, -92.40445, 2.234021, 7200, 5, 1),
(@CGUID+62, 15300, 531, 1, 1, -7967.022, 1274.792, -72.16002, 5.044002, 7200, 5, 1),
(@CGUID+63, 15300, 531, 1, 1, -7967.221, 1524.411, -60.57605, 5.270895, 7200, 5, 1),
(@CGUID+64, 15300, 531, 1, 1, -7967.628, 1313.647, -85.22298, 5.323254, 7200, 5, 1),
(@CGUID+65, 15300, 531, 1, 1, -7967.866, 1536.324, -62.04499, 5.916666, 7200, 5, 1),
(@CGUID+66, 15300, 531, 1, 1, -7970.926, 1297.65, -76.17361, 3.368485, 7200, 5, 1),
(@CGUID+67, 15300, 531, 1, 1, -7971.198, 1302.062, -78.52887, 2.688358, 7200, 5, 1),
(@CGUID+68, 15300, 531, 1, 1, -7978.03, 1568.925, -61.93628, 2.338741, 7200, 5, 1),
(@CGUID+69, 15300, 531, 1, 1, -7979.314, 1537.99, -61.21902, 3.211406, 7200, 5, 1),
(@CGUID+70, 15300, 531, 1, 1, -7982.532, 1274.688, -72.87275, 4.817109, 7200, 5, 1),
(@CGUID+71, 15300, 531, 1, 1, -7984.055, 1544.057, -61.72084, 3.560472, 7200, 5, 1),
(@CGUID+72, 15300, 531, 1, 1, -7984.721, 1306.54, -76.8012, 2.356194, 7200, 5, 1),
(@CGUID+73, 15300, 531, 1, 1, -7988.979, 1555.543, -62.07476, 3.560472, 7200, 5, 1),
(@CGUID+74, 15300, 531, 1, 1, -7989.688, 1580.115, -62.092, 6.125817, 7200, 5, 1),
(@CGUID+75, 15300, 531, 1, 1, -7990.045, 1297.59, -74.12374, 3.123379, 7200, 5, 1),
(@CGUID+76, 15300, 531, 1, 1, -7990.39, 1272.209, -73.56954, 2.932153, 7200, 5, 1),
(@CGUID+77, 15300, 531, 1, 1, -7990.807, 1284.74, -73.15822, 2.827433, 7200, 5, 1),
(@CGUID+78, 15300, 531, 1, 1, -7991.841, 1299.617, -73.96005, 2.129302, 7200, 5, 1),
(@CGUID+79, 15300, 531, 1, 1, -7992.515, 1592.58, -60.09307, 0.526886, 7200, 5, 1),
(@CGUID+80, 15300, 531, 1, 1, -7999.318, 1278.983, -73.69726, 4.537856, 7200, 5, 1),
(@CGUID+81, 15300, 531, 1, 1, -8000.123, 1602.627, -58.32988, 0.2268928, 7200, 5, 1),
(@CGUID+82, 15300, 531, 1, 1, -8002.065, 1595.297, -60.0018, 1.451103, 7200, 5, 1),
(@CGUID+83, 15300, 531, 1, 1, -8003.662, 1273.239, -75.26857, 0.2094395, 7200, 5, 1),
(@CGUID+84, 15300, 531, 1, 1, -8004.083, 1619.394, -55.74008, 0.2443461, 7200, 5, 1),
(@CGUID+85, 15300, 531, 1, 1, -8005.251, 1585.535, -61.27219, 0.2546086, 7200, 5, 1),
(@CGUID+86, 15300, 531, 1, 1, -8006.769, 1543.797, -67.10904, 5.218534, 7200, 5, 1),
(@CGUID+87, 15300, 531, 1, 1, -8010.409, 1557.02, -66.04092, 6.091199, 7200, 5, 1),
(@CGUID+88, 15300, 531, 1, 1, -8010.659, 1253.649, -79.13587, 1.675516, 7200, 5, 1),
(@CGUID+89, 15300, 531, 1, 1, -8011.024, 1629.752, -55.88325, 0.6283185, 7200, 5, 1),
(@CGUID+90, 15300, 531, 1, 1, -8015.45, 1614.308, -58.71272, 1.978479, 7200, 5, 1),
(@CGUID+91, 15300, 531, 1, 1, -8017.145, 1536.662, -68.31948, 5.113815, 7200, 5, 1),
(@CGUID+92, 15300, 531, 1, 1, -8017.821, 1614.39, -59.06019, 0.715585, 7200, 5, 1),
(@CGUID+93, 15300, 531, 1, 1, -8021.231, 1552.841, -67.07516, 5.462881, 7200, 5, 1),
(@CGUID+94, 15300, 531, 1, 1, -8026.983, 1601.135, -59.09586, 3.839724, 7200, 5, 1),
(@CGUID+95, 15300, 531, 1, 1, -8028.739, 1230.844, -85.93344, 5.5676, 7200, 5, 1),
(@CGUID+96, 15300, 531, 1, 1, -8030.674, 1534.738, -67.83488, 3.595378, 7200, 5, 1),
(@CGUID+97, 15300, 531, 1, 1, -8030.963, 1190.392, -88.7235, 1.48353, 7200, 5, 1),
(@CGUID+98, 15300, 531, 1, 1, -8033.078, 1644.174, -58.82825, 4.17972, 7200, 5, 1),
(@CGUID+99, 15300, 531, 1, 1, -8033.252, 1610.343, -58.87102, 3.560472, 7200, 5, 1),
(@CGUID+100, 15300, 531, 1, 1, -8037.915, 1551.607, -65.29885, 4.206244, 7200, 5, 1),
(@CGUID+101, 15300, 531, 1, 1, -8038.434, 1617.541, -58.87218, 4.153883, 7200, 5, 1),
(@CGUID+102, 15300, 531, 1, 1, -8043.782, 1637.505, -59.37272, 3.199285, 7200, 5, 1),
(@CGUID+103, 15300, 531, 1, 1, -8045.612, 1583.694, -62.98385, 0.9790034, 7200, 5, 1),
(@CGUID+104, 15300, 531, 1, 1, -8050.1, 1645.168, -58.91573, 4.224158, 7200, 5, 1),
(@CGUID+105, 15300, 531, 1, 1, -8052.96, 1648.648, -58.46545, 0.3665192, 7200, 5, 1),
(@CGUID+106, 15300, 531, 1, 1, -8057.072, 1658.566, -56.45635, 0.8377581, 7200, 5, 1),
(@CGUID+107, 15300, 531, 1, 1, -8057.798, 1593.25, -61.41485, 3.272068, 7200, 5, 1),
(@CGUID+108, 15300, 531, 1, 1, -8058.555, 1573.006, -61.56964, 3.92076, 7200, 5, 1),
(@CGUID+109, 15300, 531, 1, 1, -8059.333, 1586.706, -61.1738, 5.235988, 7200, 5, 1),
(@CGUID+110, 15300, 531, 1, 1, -8060.234, 1604.707, -60.46527, 4.956735, 7200, 5, 1),
(@CGUID+111, 15300, 531, 1, 1, -8065.966, 1589.98, -60.27099, 0.8203048, 7200, 5, 1),
(@CGUID+112, 15300, 531, 1, 1, -8066.036, 1645.905, -56.94833, 3.00077, 7200, 5, 1),
(@CGUID+113, 15300, 531, 1, 1, -8073.205, 1670.581, -51.66552, 1.500983, 7200, 5, 1),
(@CGUID+114, 15300, 531, 1, 1, -8078.903, 1239.604, -91.37767, 1.066351, 7200, 5, 1),
(@CGUID+115, 15300, 531, 1, 1, -8082.463, 1673.083, -49.71113, 1.029744, 7200, 5, 1),
(@CGUID+116, 15300, 531, 1, 1, -8082.638, 1645.959, -53.69846, 4.45059, 7200, 5, 1),
(@CGUID+117, 15300, 531, 1, 1, -8082.839, 1626.916, -55.887, 0.8028514, 7200, 5, 1),
(@CGUID+118, 15300, 531, 1, 1, -8084.041, 1154.17, -92.02991, 1.797689, 7200, 5, 1),
(@CGUID+119, 15300, 531, 1, 1, -8087.102, 1594.794, -56.22529, 3.612832, 7200, 5, 1),
(@CGUID+120, 15300, 531, 1, 1, -8091.706, 1660.421, -51.86389, 1.884956, 7200, 5, 1),
(@CGUID+121, 15300, 531, 1, 1, -8092.724, 1633.168, -54.13385, 0.3490658, 7200, 5, 1),
(@CGUID+122, 15300, 531, 1, 1, -8093.48, 1646.51, -51.53661, 4.939282, 7200, 5, 1),
(@CGUID+123, 15300, 531, 1, 1, -8098.15, 1677.546, -46.38687, 1.43117, 7200, 5, 1),
(@CGUID+124, 15300, 531, 1, 1, -8102.48, 1600.465, -52.38706, 4.310963, 7200, 5, 1),
(@CGUID+125, 15300, 531, 1, 1, -8103.642, 1634.176, -51.76759, 1.58825, 7200, 5, 1),
(@CGUID+126, 15300, 531, 1, 1, -8105.175, 1616.933, -52.51282, 3.246312, 7200, 5, 1),
(@CGUID+127, 15300, 531, 1, 1, -8110, 1654.932, -47.85446, 6.178465, 7200, 5, 1),
(@CGUID+128, 15300, 531, 1, 1, -8110.333, 1194.992, -91.69107, 1.570796, 7200, 5, 1),
(@CGUID+129, 15300, 531, 1, 1, -8183.295, 1625.464, -38.23788, 3.455752, 7200, 5, 1),
(@CGUID+130, 15300, 531, 1, 1, -8110.5, 1665.461, -47.72958, 0.418879, 7200, 5, 1),
(@CGUID+131, 15300, 531, 1, 1, -8117.023, 1671.853, -45.05032, 6.038839, 7200, 5, 1),
(@CGUID+132, 15300, 531, 1, 1, -8121.577, 1659.169, -44.89305, 5.5676, 7200, 5, 1),
(@CGUID+133, 15300, 531, 1, 1, -8122.221, 1622.481, -49.14006, 0.8982115, 7200, 5, 1),
(@CGUID+134, 15300, 531, 1, 1, -8123.377, 1655.844, -44.69468, 3.455752, 7200, 5, 1),
(@CGUID+135, 15300, 531, 1, 1, -8124.208, 1665.759, -44.58142, 1.099557, 7200, 5, 1),
(@CGUID+136, 15300, 531, 1, 1, -8135.342, 1631.169, -46.52505, 5.67232, 7200, 5, 1),
(@CGUID+137, 15300, 531, 1, 1, -8135.99, 1614.041, -45.35197, 4.270462, 7200, 5, 1),
(@CGUID+138, 15300, 531, 1, 1, -8140.333, 1653.827, -40.98864, 3.769911, 7200, 5, 1),
(@CGUID+139, 15300, 531, 1, 1, -8141.307, 1619.113, -44.39598, 1.029744, 7200, 5, 1),
(@CGUID+140, 15300, 531, 1, 1, -8144.391, 1680.055, -36.83066, 1.361357, 7200, 5, 1),
(@CGUID+141, 15300, 531, 1, 1, -8146.426, 1631.036, -44.10762, 4.729842, 7200, 5, 1),
(@CGUID+142, 15300, 531, 1, 1, -8147.207, 1655.39, -38.81593, 5.51524, 7200, 5, 1),
(@CGUID+143, 15300, 531, 1, 1, -8151.949, 1683.398, -35.01212, 0.8028514, 7200, 5, 1),
(@CGUID+144, 15300, 531, 1, 1, -8154.279, 1613.235, -40.65197, 4.607669, 7200, 5, 1),
(@CGUID+145, 15300, 531, 1, 1, -8155.774, 1674.52, -36.2891, 2.181224, 7200, 5, 1),
(@CGUID+146, 15300, 531, 1, 1, -8156.148, 1656.466, -36.48287, 4.694936, 7200, 5, 1),
(@CGUID+147, 15300, 531, 1, 1, -8156.426, 1625.304, -41.49326, 2.059489, 7200, 5, 1),
(@CGUID+148, 15300, 531, 1, 1, -8160.91, 1643.194, -38.99018, 1.867502, 7200, 5, 1),
(@CGUID+149, 15300, 531, 1, 1, -8167.602, 1671.222, -34.59419, 4.433136, 7200, 5, 1),
(@CGUID+150, 15300, 531, 1, 1, -8170.387, 1639.527, -37.48939, 1.884956, 7200, 5, 1),
(@CGUID+151, 15300, 531, 1, 1, -8170.757, 1613.131, -37.4205, 3.926991, 7200, 5, 1);

-- Pathing for Vekniss Soldier Entry: 15229 'TDB FORMAT' 
SET @NPC := 87901;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8015.134,`position_y`=1258.724,`position_z`=-79.72564 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8015.134,1258.724,-79.72564,0,0,1,0,100,0),
(@PATH,2,-7971.334,1280.292,-73.27785,0,0,1,0,100,0),
(@PATH,3,-7954.62,1323.919,-90.7532,0,0,1,0,100,0),
(@PATH,4,-7970.993,1280.664,-73.33447,0,0,1,0,100,0);

-- Pathing for Vekniss Soldier Entry: 15229 'TDB FORMAT' 
SET @NPC := 87902;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8043.788,`position_y`=1645.192,`position_z`=-59.28296 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8043.788,1645.192,-59.28296,0,0,1,0,100,0),
(@PATH,2,-8020.601,1616.473,-59.27552,0,0,1,0,100,0),
(@PATH,3,-8043.788,1645.192,-59.28296,0,0,1,0,100,0),
(@PATH,4,-8073.597,1660.363,-54.66129,0,0,1,0,100,0),
(@PATH,5,-8111.89,1663.297,-47.55686,0,0,1,0,100,0),
(@PATH,6,-8157.463,1669.077,-36.71965,0,0,1,0,100,0),
(@PATH,7,-8111.89,1663.297,-47.55686,0,0,1,0,100,0),
(@PATH,8,-8073.597,1660.363,-54.66129,0,0,1,0,100,0);

-- Pathing for Vekniss Soldier Entry: 15229 'TDB FORMAT' 
SET @NPC := 87903;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-7902.709,`position_y`=1410.921,`position_z`=-66.08652 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-7902.709,1410.921,-66.08652,0,0,1,0,100,0),
(@PATH,2,-7927.595,1369.56,-78.29517,0,0,1,0,100,0),
(@PATH,3,-7938.981,1323.41,-92.47753,0,0,1,0,100,0),
(@PATH,4,-7927.595,1369.56,-78.29517,0,0,1,0,100,0);

-- Pathing for Vekniss Soldier Entry: 15229 'TDB FORMAT' 
SET @NPC := 87904;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-7938.296,`position_y`=1489.504,`position_z`=-64.33451 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-7938.296,1489.504,-64.33451,0,0,1,0,100,0),
(@PATH,2,-7902.537,1456.171,-65.55414,0,0,1,0,100,0),
(@PATH,3,-7915.813,1414.564,-66.10455,0,0,1,0,100,0),
(@PATH,4,-7902.476,1455.991,-65.56479,0,0,1,0,100,0);

-- Pathing for Vekniss Soldier Entry: 15229 'TDB FORMAT' 
SET @NPC := 87905;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8164.897,`position_y`=1624.758,`position_z`=-40.04349 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8164.897,1624.758,-40.04349,0,0,1,0,100,0),
(@PATH,2,-8130.617,1623.805,-47.28335,0,0,1,0,100,0),
(@PATH,3,-8087.561,1611.887,-56.31141,0,0,1,0,100,0),
(@PATH,4,-8054.685,1585.599,-61.79655,0,0,1,0,100,0),
(@PATH,5,-8028.956,1551.455,-66.53555,0,0,1,0,100,0),
(@PATH,6,-8054.685,1585.599,-61.79655,0,0,1,0,100,0),
(@PATH,7,-8087.561,1611.887,-56.31141,0,0,1,0,100,0),
(@PATH,8,-8130.617,1623.805,-47.28335,0,0,1,0,100,0);

-- Pathing for Vekniss Soldier Entry: 15229 'TDB FORMAT' 
SET @NPC := 87906;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-7925.455,`position_y`=1500.005,`position_z`=-63.07186 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-7925.455,1500.005,-63.07186,0,0,1,0,100,0),
(@PATH,2,-7966.281,1527.871,-61.1781,0,0,1,0,100,0),
(@PATH,3,-7976.614,1572.205,-61.79373,0,0,1,0,100,0),
(@PATH,4,-7966.281,1527.871,-61.1781,0,0,1,0,100,0);

DELETE FROM `creature` WHERE `guid`=87907;

DELETE FROM `creature_template_addon` WHERE `entry` IN (15233,15247);
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (15233,0,1,0, '18950'),(15247,0,1,0, '18950');

-- Pathing for Obsidian Eradicator Entry: 15262 'TDB FORMAT' 
SET @NPC := 88074;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8181.452,`position_y`=2105.019,`position_z`=129.1963 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '19818');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8181.452,2105.019,129.1963,0,0,0,0,100,0),
(@PATH,2,-8191.375,2086.593,129.1963,0,0,0,0,100,0),
(@PATH,3,-8181.452,2105.019,129.1963,0,0,0,0,100,0),
(@PATH,4,-8185.167,2123.686,129.1963,0,0,0,0,100,0),
(@PATH,5,-8202.72,2136.731,129.3353,0,0,0,0,100,0),
(@PATH,6,-8233.334,2128.125,131.1751,0,0,0,0,100,0),
(@PATH,7,-8242.226,2125.75,127.5347,0,0,0,0,100,0),
(@PATH,8,-8256.743,2124.262,120.2957,0,0,0,0,100,0),
(@PATH,9,-8242.226,2125.75,127.5347,0,0,0,0,100,0),
(@PATH,10,-8234.375,2128.125,130.8001,0,0,0,0,100,0),
(@PATH,11,-8202.72,2136.731,129.3353,0,0,0,0,100,0),
(@PATH,12,-8185.167,2123.686,129.1963,0,0,0,0,100,0);

-- Pathing for Obsidian Eradicator Entry: 15262 'TDB FORMAT' 
SET @NPC := 87652;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8282.951,`position_y`=2093.236,`position_z`=118.3001 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '19818');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8282.951,2093.236,118.3001,0,0,0,0,100,0),
(@PATH,2,-8273.953,2106.067,118.3001,0,0,0,0,100,0),
(@PATH,3,-8277.969,2116.79,118.3001,0,0,0,0,100,0),
(@PATH,4,-8292.524,2119.098,118.3001,0,0,0,0,100,0),
(@PATH,5,-8307.771,2141.695,118.3659,0,0,0,0,100,0),
(@PATH,6,-8292.524,2119.098,118.3001,0,0,0,0,100,0),
(@PATH,7,-8277.969,2116.79,118.3001,0,0,0,0,100,0),
(@PATH,8,-8273.953,2106.067,118.3001,0,0,0,0,100,0),
(@PATH,9,-8282.951,2093.236,118.3001,0,0,0,0,100,0),
(@PATH,10,-8277.297,2070.659,118.3001,0,0,0,0,100,0);

-- Pathing for Obsidian Eradicator Entry: 15262 'TDB FORMAT' 
SET @NPC := 87653;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8325.952,`position_y`=2055.939,`position_z`=133.0548 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '19818');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8325.952,2055.939,133.0548,0,0,0,0,100,0),
(@PATH,2,-8332.794,2047.068,133.1227,0,0,0,0,100,0),
(@PATH,3,-8338.969,2041.953,136.5257,0,0,0,0,100,0),
(@PATH,4,-8347.218,2036.589,142.4718,0,0,0,0,100,0),
(@PATH,5,-8357.45,2041.958,144.8221,0,0,0,0,100,0),
(@PATH,6,-8368.557,2053.296,144.8487,0,0,0,0,100,0),
(@PATH,7,-8378.51,2073.499,144.8015,0,0,0,0,100,0),
(@PATH,8,-8383.191,2096.747,144.8261,0,0,0,0,100,0),
(@PATH,9,-8379.467,2113.167,143.6545,0,0,0,0,100,0),
(@PATH,10,-8368.374,2117.771,136.2442,0,0,0,0,100,0),
(@PATH,11,-8356.403,2116.523,133.1008,0,0,0,0,100,0),
(@PATH,12,-8342.338,2116.063,133.0911,0,0,0,0,100,0),
(@PATH,13,-8338.457,2108.827,132.6952,0,0,0,0,100,0),
(@PATH,14,-8331.443,2092.253,125.627,0,0,0,0,100,0),
(@PATH,15,-8323.716,2093.625,125.6041,0,0,0,0,100,0),
(@PATH,16,-8316.983,2095.258,122.4067,0,0,0,0,100,0),
(@PATH,17,-8311.382,2097.501,118.8619,0,0,0,0,100,0),
(@PATH,18,-8302.849,2107.911,118.3001,0,0,0,0,100,0),
(@PATH,19,-8292.684,2108.071,118.3001,0,0,0,0,100,0),
(@PATH,20,-8289.837,2100.808,118.3001,0,0,0,0,100,0),
(@PATH,21,-8297.129,2093.869,118.3001,0,0,0,0,100,0),
(@PATH,22,-8310.037,2094.395,118.7956,0,0,0,0,100,0),
(@PATH,23,-8315.771,2092.706,122.2935,0,0,0,0,100,0),
(@PATH,24,-8322.37,2089.841,125.615,0,0,0,0,100,0),
(@PATH,25,-8328.958,2085.229,125.6326,0,0,0,0,100,0),
(@PATH,26,-8326.164,2076.209,126.8105,0,0,0,0,100,0),
(@PATH,27,-8321.34,2065.851,133.0319,0,0,0,0,100,0);

-- Pathing for Vekniss Warrior Entry: 15230 'TDB FORMAT' 
SET @NPC := 87672;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8578.048,`position_y`=1940.539,`position_z`=-0.06545047 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8581.048,`position_y`=1940.539,`position_z`=-0.06545047 WHERE `guid`=@NPC+1;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8586.048,`position_y`=1940.539,`position_z`=-0.06545047 WHERE `guid`=@NPC+2;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@NPC+1,@NPC+2);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(@NPC,@PATH,0,0,1,0, ''),(@NPC+1,@PATH,0,0,1,0, ''),(@NPC+2,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8578.048,1940.539,-0.06545047,0,0,1,0,100,0),
(@PATH,2,-8549.408,1941.299,5.823864,0,0,1,0,100,0),
(@PATH,3,-8531.94,1962.451,11.77114,0,0,1,0,100,0),
(@PATH,4,-8536.534,1991.978,20.64153,0,0,1,0,100,0),
(@PATH,5,-8511.746,1997.704,21.69398,0,0,1,0,100,0),
(@PATH,6,-8469.14,2013.381,16.1259,0,0,1,0,100,0),
(@PATH,7,-8433.611,2039.519,8.550707,0,0,1,0,100,0),
(@PATH,8,-8401.688,2057.265,9.581982,0,0,1,0,100,0),
(@PATH,9,-8407.505,2014.451,8.3922,0,0,1,0,100,0),
(@PATH,10,-8405.526,1984.281,2.559676,0,0,1,0,100,0),
(@PATH,11,-8389.834,1963.352,2.570214,0,0,1,0,100,0),
(@PATH,12,-8405.526,1984.281,2.559676,0,0,1,0,100,0),
(@PATH,13,-8407.505,2014.451,8.3922,0,0,1,0,100,0),
(@PATH,14,-8401.688,2057.265,9.581982,0,0,1,0,100,0),
(@PATH,15,-8433.611,2039.519,8.550707,0,0,1,0,100,0),
(@PATH,16,-8469.14,2013.381,16.1259,0,0,1,0,100,0),
(@PATH,17,-8511.746,1997.704,21.69398,0,0,1,0,100,0),
(@PATH,18,-8536.534,1991.978,20.64153,0,0,1,0,100,0),
(@PATH,19,-8531.94,1962.451,11.77114,0,0,1,0,100,0),
(@PATH,20,-8549.408,1941.299,5.823864,0,0,1,0,100,0),
(@PATH,21,-8578.048,1940.539,-0.06545047,0,0,1,0,100,0),
(@PATH,22,-8581.254,1985.698,-1.939677,0,0,1,0,100,0),
(@PATH,23,-8580,2032.773,-2.74892,0,0,1,0,100,0),
(@PATH,24,-8594.974,2078.681,-1.559797,0,0,1,0,100,0),
(@PATH,25,-8592.876,2114.829,-7.230148,0,0,1,0,100,0),
(@PATH,26,-8594.974,2078.681,-1.559797,0,0,1,0,100,0),
(@PATH,27,-8580,2032.773,-2.74892,0,0,1,0,100,0),
(@PATH,28,-8581.254,1985.698,-1.939677,0,0,1,0,100,0);

-- Vekniss Warrior formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@NPC+1,4,360,2,0,0),
(@NPC,@NPC+2,8,360,2,0,0);

-- Pathing for Vekniss Warrior Entry: 15230 'TDB FORMAT' 
SET @NPC := 87675;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8406.916,`position_y`=1940.698,`position_z`=3.540012 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8406.916,`position_y`=1940.698,`position_z`=3.540012 WHERE `guid`=@NPC+1;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8406.916,`position_y`=1940.698,`position_z`=3.540012 WHERE `guid`=@NPC+2;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@NPC+1,@NPC+2);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(@NPC,@PATH,0,0,1,0, ''),(@NPC+1,@PATH,0,0,1,0, ''),(@NPC+2,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8406.916,1940.698,3.540012,0,0,1,0,100,0),
(@PATH,2,-8394.013,1898.244,2.764256,0,0,1,0,100,0),
(@PATH,3,-8379.354,1860.681,2.642385,0,0,1,0,100,0),
(@PATH,4,-8355.81,1840.051,0.444995,0,0,1,0,100,0),
(@PATH,5,-8327.183,1855.611,-3.365049,0,0,1,0,100,0),
(@PATH,6,-8336.607,1904.446,-2.144968,0,0,1,0,100,0),
(@PATH,7,-8351.146,1947.595,-1.962911,0,0,1,0,100,0),
(@PATH,8,-8356.023,1966.897,-2.996279,0,0,1,0,100,0),
(@PATH,9,-8336.607,1904.446,-2.144968,0,0,1,0,100,0),
(@PATH,10,-8327.183,1855.611,-3.365049,0,0,1,0,100,0),
(@PATH,11,-8355.81,1840.051,0.444995,0,0,1,0,100,0),
(@PATH,12,-8379.354,1860.681,2.642385,0,0,1,0,100,0),
(@PATH,13,-8394.013,1898.244,2.764256,0,0,1,0,100,0),
(@PATH,14,-8406.916,1940.698,3.540012,0,0,1,0,100,0),
(@PATH,15,-8391.783,1963.953,2.740874,0,0,1,0,100,0),
(@PATH,16,-8363.329,1968.659,-2.484006,0,0,1,0,100,0),
(@PATH,17,-8358.553,1942.278,-2.137602,0,0,1,0,100,0),
(@PATH,18,-8338.893,1911.847,-2.365611,0,0,1,0,100,0),
(@PATH,19,-8321.089,1875.853,-1.947007,0,0,1,0,100,0),
(@PATH,20,-8327.794,1850.802,-3.493851,0,0,1,0,100,0),
(@PATH,21,-8307.335,1833.033,-4.333048,0,0,1,0,100,0),
(@PATH,22,-8320.271,1866.489,-2.442684,0,0,1,0,100,0),
(@PATH,23,-8334.945,1892.853,-2.193387,0,0,1,0,100,0),
(@PATH,24,-8350.508,1929.607,-2.263634,0,0,1,0,100,0),
(@PATH,25,-8356.683,1963.76,-2.672498,0,0,1,0,100,0),
(@PATH,26,-8382.319,1966.879,1.677073,0,0,1,0,100,0),
(@PATH,27,-8404.743,1959.304,3.478677,0,0,1,0,100,0),
(@PATH,28,-8397.587,1920.886,2.367266,0,0,1,0,100,0),
(@PATH,29,-8381.415,1878.202,2.439208,0,0,1,0,100,0),
(@PATH,30,-8357.64,1836.641,0.5241066,0,0,1,0,100,0),
(@PATH,31,-8344.722,1792.031,-2.582653,0,0,1,0,100,0),
(@PATH,32,-8363.003,1837.87,0.9091408,0,0,1,0,100,0),
(@PATH,33,-8376.87,1866.093,2.108701,0,0,1,0,100,0),
(@PATH,34,-8392.19,1902.458,2.388478,0,0,1,0,100,0),
(@PATH,35,-8402.383,1950.098,3.546199,0,0,1,0,100,0),
(@PATH,36,-8406.804,1977.574,3.235986,0,0,1,0,100,0),
(@PATH,37,-8408.774,2021.132,9.192656,0,0,1,0,100,0),
(@PATH,38,-8407.785,1997.445,5.142398,0,0,1,0,100,0),
(@PATH,39,-8398.694,1969.258,3.159751,0,0,1,0,100,0),
(@PATH,40,-8378.146,1965.434,0.9081311,0,0,1,0,100,0),
(@PATH,41,-8357.106,1958.744,-2.32515,0,0,1,0,100,0),
(@PATH,42,-8343.271,1916.817,-2.434541,0,0,1,0,100,0),
(@PATH,43,-8332.095,1888.039,-2.186295,0,0,1,0,100,0),
(@PATH,44,-8323.842,1855.49,-3.38597,0,0,1,0,100,0),
(@PATH,45,-8346.259,1845.706,-0.4906869,0,0,1,0,100,0),
(@PATH,46,-8357.015,1829.12,0.3158551,0,0,1,0,100,0),
(@PATH,47,-8347.274,1799.175,-1.778138,0,0,1,0,100,0),
(@PATH,48,-8339.567,1780.459,-4.878539,0,0,1,0,100,0),
(@PATH,49,-8335.18,1767.381,-6.044283,0,0,1,0,100,0),
(@PATH,50,-8347.274,1799.175,-1.778138,0,0,1,0,100,0),
(@PATH,51,-8357.015,1829.12,0.3158551,0,0,1,0,100,0),
(@PATH,52,-8346.259,1845.706,-0.4906869,0,0,1,0,100,0),
(@PATH,53,-8323.842,1855.49,-3.38597,0,0,1,0,100,0),
(@PATH,54,-8332.095,1888.039,-2.186295,0,0,1,0,100,0),
(@PATH,55,-8343.271,1916.817,-2.434541,0,0,1,0,100,0),
(@PATH,56,-8357.106,1958.744,-2.32515,0,0,1,0,100,0),
(@PATH,57,-8378.146,1965.434,0.9081311,0,0,1,0,100,0),
(@PATH,58,-8398.694,1969.258,3.159751,0,0,1,0,100,0),
(@PATH,59,-8407.783,1997.389,5.136318,0,0,1,0,100,0),
(@PATH,60,-8408.774,2021.132,9.192656,0,0,1,0,100,0),
(@PATH,61,-8406.804,1977.574,3.235986,0,0,1,0,100,0),
(@PATH,62,-8402.383,1950.098,3.546199,0,0,1,0,100,0),
(@PATH,63,-8392.19,1902.458,2.388478,0,0,1,0,100,0),
(@PATH,64,-8376.87,1866.093,2.108701,0,0,1,0,100,0),
(@PATH,65,-8363.003,1837.87,0.9091408,0,0,1,0,100,0),
(@PATH,66,-8344.722,1792.031,-2.582653,0,0,1,0,100,0),
(@PATH,67,-8357.583,1836.447,0.5609013,0,0,1,0,100,0),
(@PATH,68,-8381.415,1878.202,2.439208,0,0,1,0,100,0),
(@PATH,69,-8397.587,1920.886,2.367266,0,0,1,0,100,0),
(@PATH,70,-8404.743,1959.304,3.478677,0,0,1,0,100,0),
(@PATH,71,-8382.319,1966.879,1.677073,0,0,1,0,100,0),
(@PATH,72,-8356.683,1963.76,-2.672498,0,0,1,0,100,0),
(@PATH,73,-8350.508,1929.607,-2.263634,0,0,1,0,100,0),
(@PATH,74,-8334.945,1892.853,-2.193387,0,0,1,0,100,0),
(@PATH,75,-8320.302,1866.569,-2.461329,0,0,1,0,100,0),
(@PATH,76,-8307.335,1833.033,-4.333048,0,0,1,0,100,0),
(@PATH,77,-8327.794,1850.802,-3.493851,0,0,1,0,100,0),
(@PATH,78,-8321.089,1875.853,-1.947007,0,0,1,0,100,0),
(@PATH,79,-8338.786,1911.682,-2.312635,0,0,1,0,100,0),
(@PATH,80,-8358.553,1942.278,-2.137602,0,0,1,0,100,0),
(@PATH,81,-8363.329,1968.659,-2.484006,0,0,1,0,100,0),
(@PATH,82,-8391.783,1963.953,2.740874,0,0,1,0,100,0);

-- Vekniss Warrior formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@NPC+1,4,360,2,0,0),
(@NPC,@NPC+2,8,360,2,0,0);

-- Pathing for Vem Entry: 15544 'TDB FORMAT' 
SET @NPC := 87603;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8598.536,`position_y`=2165.304,`position_z`=-4.016909 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8598.536,2165.304,-4.016909,0,0,1,0,100,0),
(@PATH,2,-8570.547,2154.366,-7.216968,0,0,1,0,100,0),
(@PATH,3,-8556.566,2155.94,-5.39525,0,0,1,0,100,0),
(@PATH,4,-8548.769,2163.426,-3.609193,0,0,1,0,100,0),
(@PATH,5,-8558.276,2162.482,-4.689288,0,0,1,0,100,0),
(@PATH,6,-8573.464,2159.948,-6.644062,0,0,1,0,100,0),
(@PATH,7,-8591.517,2159.22,-6.108228,0,0,1,0,100,0),
(@PATH,8,-8597.023,2159.045,-5.198315,0,0,1,0,100,0),
(@PATH,9,-8584.803,2161.023,-6.455252,0,0,1,0,100,0),
(@PATH,10,-8577.727,2169.429,-4.657184,0,0,1,0,100,0),
(@PATH,11,-8555.971,2160.376,-4.63052,0,0,1,0,100,0),
(@PATH,12,-8541.419,2166.771,-3.432642,0,0,1,0,100,0),
(@PATH,13,-8571.241,2162.583,-5.917914,0,0,1,0,100,0),
(@PATH,14,-8577.813,2157.56,-7.250329,0,0,1,0,100,0),
(@PATH,15,-8597.023,2159.045,-5.198315,0,0,1,0,100,0),
(@PATH,16,-8591.517,2159.22,-6.108228,0,0,1,0,100,0),
(@PATH,17,-8582.77,2155.171,-7.513537,0,0,1,0,100,0),
(@PATH,18,-8565.398,2161.521,-5.813965,0,0,1,0,100,0),
(@PATH,19,-8548.237,2167.902,-3.599379,0,0,1,0,100,0),
(@PATH,20,-8556.566,2155.94,-5.39525,0,0,1,0,100,0),
(@PATH,21,-8577.118,2156.268,-7.330427,0,0,1,0,100,0),
(@PATH,22,-8590.432,2156.978,-6.771957,0,0,1,0,100,0);

-- Pathing for Battleguard Sartura Entry: 15516 'TDB FORMAT' 
SET @NPC := 87648;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8302.484,`position_y`=1657.664,`position_z`=-29.81326 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8302.484,`position_y`=1657.664,`position_z`=-29.81326 WHERE `guid`=@NPC+1;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8302.484,`position_y`=1657.664,`position_z`=-29.81326 WHERE `guid`=@NPC+2;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8302.484,`position_y`=1657.664,`position_z`=-29.81326 WHERE `guid`=@NPC+3;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@NPC+1,@NPC+2,@NPC+3);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(@NPC,@PATH,0,0,1,0, ''),(@NPC+1,@PATH,0,0,1,0, ''),(@NPC+2,@PATH,0,0,1,0, ''),(@NPC+3,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8302.484,1657.664,-29.81326,0,0,1,0,100,0),
(@PATH,2,-8322.1,1681.196,-23.77903,0,0,1,0,100,0),
(@PATH,3,-8337.48,1695.275,-20.64655,0,0,1,0,100,0),
(@PATH,4,-8308.396,1705.129,-20.57656,0,0,1,0,100,0),
(@PATH,5,-8276.452,1706.471,-21.82398,0,0,1,0,100,0),
(@PATH,6,-8251.389,1708.836,-25.76576,0,0,1,0,100,0),
(@PATH,7,-8224.531,1711.219,-27.28119,0,0,1,0,100,0),
(@PATH,8,-8261.439,1684.329,-28.35187,0,0,1,0,100,0),
(@PATH,9,-8286.062,1662.657,-29.58469,0,0,1,0,100,0),
(@PATH,10,-8321.049,1634.691,-32.09647,0,0,1,0,100,0),
(@PATH,11,-8299.077,1670.921,-27.83419,0,0,1,0,100,0),
(@PATH,12,-8281.883,1688.65,-25.09606,0,0,1,0,100,0),
(@PATH,13,-8277.175,1719.16,-18.75556,0,0,1,0,100,0),
(@PATH,14,-8264.544,1744.857,-15.06134,0,0,1,0,100,0),
(@PATH,15,-8256.176,1706.132,-25.62639,0,0,1,0,100,0),
(@PATH,16,-8260.745,1661.01,-30.71562,0,0,1,0,100,0),
(@PATH,17,-8261.763,1630.783,-35.8319,0,0,1,0,100,0),
(@PATH,18,-8281.746,1643.871,-32.61421,0,0,1,0,100,0);

-- Battleguard Sartura formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@NPC+1,3,180,2,0,0),
(@NPC,@NPC+2,3,60,2,0,0),
(@NPC,@NPC+3,3,300,2,0,0);

-- Pathing for Anubisath Defender Entry: 15277 'TDB FORMAT' 
SET @NPC := 88015;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8824.772,`position_y`=1504.369,`position_z`=-94.81835 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8824.772,1504.369,-94.81835,0,0,0,0,100,0),
(@PATH,2,-8827.692,1516.268,-95.1673,0,0,0,0,100,0),
(@PATH,3,-8847.614,1538.224,-95.33534,0,0,0,0,100,0),
(@PATH,4,-8879.378,1544.877,-94.70975,0,0,0,0,100,0),
(@PATH,5,-8908.75,1537.785,-95.42508,0,0,0,0,100,0),
(@PATH,6,-8928.812,1526.368,-94.99846,0,0,0,0,100,0),
(@PATH,7,-8940.877,1502.948,-92.83627,0,0,0,0,100,0),
(@PATH,8,-8949.911,1469.664,-92.77494,0,0,0,0,100,0),
(@PATH,9,-8948.604,1447.861,-92.23408,0,0,0,0,100,0),
(@PATH,10,-8929.873,1441.007,-92.37372,0,0,0,0,100,0),
(@PATH,11,-8912.088,1436.755,-93.20541,0,0,0,0,100,0),
(@PATH,12,-8885.823,1430.602,-90.09874,0,0,0,0,100,0),
(@PATH,13,-8870.321,1430.479,-91.59385,0,0,0,0,100,0),
(@PATH,14,-8864.462,1438.929,-91.28598,0,0,0,0,100,0),
(@PATH,15,-8852.853,1467.848,-91.95611,0,0,0,0,100,0),
(@PATH,16,-8836.742,1489.87,-93.61978,0,0,0,0,100,0);

-- Pathing for Anubisath Defender Entry: 15277 'TDB FORMAT' 
SET @NPC := 88016;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8775.906,`position_y`=1617.338,`position_z`=-87.98548 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8775.906,1617.338,-87.98548,0,0,0,0,100,0),
(@PATH,2,-8756.48,1631.175,-83.78447,0,0,0,0,100,0),
(@PATH,3,-8722.348,1652.832,-84.65975,0,0,0,0,100,0),
(@PATH,4,-8756.48,1631.175,-83.78447,0,0,0,0,100,0),
(@PATH,5,-8775.906,1617.338,-87.98548,0,0,0,0,100,0),
(@PATH,6,-8805.615,1592.723,-93.64745,0,0,0,0,100,0),
(@PATH,7,-8830.067,1567.62,-95.89575,0,0,0,0,100,0),
(@PATH,8,-8834.922,1551.61,-95.44115,0,0,0,0,100,0),
(@PATH,9,-8827.188,1534.668,-96.41103,0,0,0,0,100,0),
(@PATH,10,-8810.128,1530.688,-95.44586,0,0,0,0,100,0),
(@PATH,11,-8792.012,1541.508,-95.1269,0,0,0,0,100,0),
(@PATH,12,-8775.249,1557.799,-92.72282,0,0,0,0,100,0),
(@PATH,13,-8761.716,1573.43,-89.71658,0,0,0,0,100,0),
(@PATH,14,-8775.249,1557.799,-92.72282,0,0,0,0,100,0),
(@PATH,15,-8791.755,1541.662,-95.08477,0,0,0,0,100,0),
(@PATH,16,-8810.128,1530.688,-95.44586,0,0,0,0,100,0),
(@PATH,17,-8827.188,1534.668,-96.41103,0,0,0,0,100,0),
(@PATH,18,-8834.922,1551.61,-95.44115,0,0,0,0,100,0),
(@PATH,19,-8830.067,1567.62,-95.89575,0,0,0,0,100,0),
(@PATH,20,-8805.615,1592.723,-93.64745,0,0,0,0,100,0);

-- Pathing for Anubisath Defender Entry: 15277 'TDB FORMAT' 
SET @NPC := 88017;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8850.698,`position_y`=1524.024,`position_z`=-95.07934 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8850.698,1524.024,-95.07934,0,0,0,0,100,0),
(@PATH,2,-8839.276,1512.111,-94.61455,0,0,0,0,100,0),
(@PATH,3,-8841.783,1499.33,-93.90066,0,0,0,0,100,0),
(@PATH,4,-8849.356,1486.96,-93.27434,0,0,0,0,100,0),
(@PATH,5,-8858.664,1470.628,-92.28557,0,0,0,0,100,0),
(@PATH,6,-8868.028,1456.196,-91.08892,0,0,0,0,100,0),
(@PATH,7,-8878.98,1438.545,-90.00536,0,0,0,0,100,0),
(@PATH,8,-8901.879,1442.889,-92.06799,0,0,0,0,100,0),
(@PATH,9,-8912.693,1447.352,-92.27155,0,0,0,0,100,0),
(@PATH,10,-8939.51,1457.284,-91.9281,0,0,0,0,100,0),
(@PATH,11,-8944.809,1468.24,-92.68608,0,0,0,0,100,0),
(@PATH,12,-8942.858,1479.536,-93.14706,0,0,0,0,100,0),
(@PATH,13,-8934.113,1498.147,-93.81955,0,0,0,0,100,0),
(@PATH,14,-8921.667,1516.135,-94.55971,0,0,0,0,100,0),
(@PATH,15,-8905.804,1530.124,-94.62666,0,0,0,0,100,0),
(@PATH,16,-8889.152,1531.822,-94.14017,0,0,0,0,100,0),
(@PATH,17,-8870.22,1529.641,-95.36583,0,0,0,0,100,0);

-- Pathing for Anubisath Defender Entry: 15277 'TDB FORMAT' 
SET @NPC := 88018;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8887.567,`position_y`=1503.212,`position_z`=-94.07798 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8887.567,1503.212,-94.07798,0,0,0,0,100,0),
(@PATH,2,-8873.922,1517.935,-94.89435,0,0,0,0,100,0),
(@PATH,3,-8887.567,1503.212,-94.07798,0,0,0,0,100,0),
(@PATH,4,-8894.092,1484.492,-92.96038,0,0,0,0,100,0),
(@PATH,5,-8904.106,1462.815,-92.10182,0,0,0,0,100,0),
(@PATH,6,-8894.092,1484.492,-92.96038,0,0,0,0,100,0);

-- Pathing for Anubisath Defender Entry: 15277 'TDB FORMAT' 
SET @NPC := 88019;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8909.747,`position_y`=1378.045,`position_z`=-101.7986 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8909.747,1378.045,-101.7986,0,0,0,0,100,0),
(@PATH,2,-8918.701,1364.768,-104.2538,0,0,0,0,100,0),
(@PATH,3,-8909.747,1378.045,-101.7986,0,0,0,0,100,0),
(@PATH,4,-8901.399,1392.455,-99.42863,0,0,0,0,100,0),
(@PATH,5,-8901.083,1400.452,-98.34517,0,0,0,0,100,0),
(@PATH,6,-8906.459,1429.929,-93.87345,0,0,0,0,100,0),
(@PATH,7,-8901.083,1400.452,-98.34517,0,0,0,0,100,0),
(@PATH,8,-8901.399,1392.455,-99.42863,0,0,0,0,100,0);

DELETE FROM `creature` WHERE `guid`=88063;

-- Pathing for Vekniss Drone Entry: 15300 'TDB FORMAT' 
SET @NPC := 87782;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8047.272,`position_y`=1647.506,`position_z`=-58.86852 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8047.272,1647.506,-58.86852,0,0,1,0,100,0),
(@PATH,2,-8078.599,1666.187,-52.86737,0,0,1,0,100,0),
(@PATH,3,-8104.689,1660.787,-49.11528,0,0,1,0,100,0),
(@PATH,4,-8078.599,1666.187,-52.86737,0,0,1,0,100,0),
(@PATH,5,-8047.272,1647.506,-58.86852,0,0,1,0,100,0),
(@PATH,6,-8019.708,1624.168,-58.74899,0,0,1,0,100,0),
(@PATH,7,-8004.919,1589.924,-60.78511,0,0,1,0,100,0),
(@PATH,8,-8015.494,1565.506,-64.88443,0,0,1,0,100,0),
(@PATH,9,-8022.754,1552.338,-67.08372,0,0,1,0,100,0),
(@PATH,10,-8036.019,1571.532,-64.49551,0,0,1,0,100,0),
(@PATH,11,-8068.761,1599.027,-59.67414,0,0,1,0,100,0),
(@PATH,12,-8091.299,1622.772,-55.47946,0,0,1,0,100,0),
(@PATH,13,-8129.723,1618.528,-47.06943,0,0,1,0,100,0),
(@PATH,14,-8157.688,1629.017,-41.62284,0,0,1,0,100,0),
(@PATH,15,-8180.13,1626.174,-38.51837,0,0,1,0,100,0),
(@PATH,16,-8157.688,1629.017,-41.62284,0,0,1,0,100,0),
(@PATH,17,-8129.723,1618.528,-47.06943,0,0,1,0,100,0),
(@PATH,18,-8091.299,1622.772,-55.47946,0,0,1,0,100,0),
(@PATH,19,-8068.761,1599.027,-59.67414,0,0,1,0,100,0),
(@PATH,20,-8036.019,1571.532,-64.49551,0,0,1,0,100,0),
(@PATH,21,-8022.85,1552.261,-67.08212,0,0,1,0,100,0),
(@PATH,22,-8015.494,1565.506,-64.88443,0,0,1,0,100,0),
(@PATH,23,-8004.919,1589.924,-60.78511,0,0,1,0,100,0),
(@PATH,24,-8019.708,1624.168,-58.74899,0,0,1,0,100,0);

-- Pathing for Vekniss Drone Entry: 15300 'TDB FORMAT' 
SET @NPC := 87717;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-7959.943,`position_y`=1511.205,`position_z`=-61.94479 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-7959.943,1511.205,-61.94479,0,0,1,0,100,0),
(@PATH,2,-7969.066,1530.94,-61.9753,0,0,1,0,100,0),
(@PATH,3,-7959.073,1548.518,-60.69316,0,0,1,0,100,0),
(@PATH,4,-7973.308,1580.152,-61.10556,0,0,1,0,100,0),
(@PATH,5,-7959.008,1548.632,-60.67959,0,0,1,0,100,0),
(@PATH,6,-7969.134,1531.086,-61.98817,0,0,1,0,100,0),
(@PATH,7,-7960.104,1511.377,-61.92974,0,0,1,0,100,0),
(@PATH,8,-7946.518,1496.745,-63.51249,0,0,1,0,100,0),
(@PATH,9,-7928.649,1495.495,-64.09904,0,0,1,0,100,0),
(@PATH,10,-7930.104,1470.892,-65.47607,0,0,1,0,100,0),
(@PATH,11,-7916.759,1457.218,-66.95297,0,0,1,0,100,0),
(@PATH,12,-7900.108,1454.012,-65.35246,0,0,1,0,100,0),
(@PATH,13,-7916.759,1457.218,-66.95297,0,0,1,0,100,0),
(@PATH,14,-7930.104,1470.892,-65.47607,0,0,1,0,100,0),
(@PATH,15,-7928.649,1495.495,-64.09904,0,0,1,0,100,0),
(@PATH,16,-7946.518,1496.745,-63.51249,0,0,1,0,100,0);

-- Pathing for Vekniss Drone Entry: 15300 'TDB FORMAT' 
SET @NPC := 87688;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-7917.924,`position_y`=1443.211,`position_z`=-67.16397 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-7917.924,1443.211,-67.16397,0,0,1,0,100,0),
(@PATH,2,-7909.153,1417.411,-67.2205,0,0,1,0,100,0),
(@PATH,3,-7923.03,1402.219,-65.58526,0,0,1,0,100,0),
(@PATH,4,-7930.945,1379.339,-74.47357,0,0,1,0,100,0),
(@PATH,5,-7923.883,1369.651,-77.58849,0,0,1,0,100,0),
(@PATH,6,-7915.488,1351.216,-81.1413,0,0,1,0,100,0),
(@PATH,7,-7923.883,1369.651,-77.58849,0,0,1,0,100,0),
(@PATH,8,-7930.945,1379.339,-74.47357,0,0,1,0,100,0),
(@PATH,9,-7923.03,1402.219,-65.58526,0,0,1,0,100,0),
(@PATH,10,-7909.153,1417.411,-67.2205,0,0,1,0,100,0),
(@PATH,11,-7917.924,1443.211,-67.16397,0,0,1,0,100,0),
(@PATH,12,-7927.112,1444.966,-66.48512,0,0,1,0,100,0),
(@PATH,13,-7901.919,1463.738,-64.63509,0,0,1,0,100,0),
(@PATH,14,-7909.403,1491.503,-61.68564,0,0,1,0,100,0),
(@PATH,15,-7929.077,1499.48,-63.57971,0,0,1,0,100,0),
(@PATH,16,-7927.155,1514.873,-60.485,0,0,1,0,100,0),
(@PATH,17,-7929.077,1499.48,-63.57971,0,0,1,0,100,0),
(@PATH,18,-7909.403,1491.503,-61.68564,0,0,1,0,100,0),
(@PATH,19,-7901.919,1463.738,-64.63509,0,0,1,0,100,0),
(@PATH,20,-7927.112,1444.966,-66.48512,0,0,1,0,100,0);

-- Pathing for Vekniss Drone Entry: 15300 'TDB FORMAT' 
SET @NPC := 87810;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8182.791,`position_y`=1672.963,`position_z`=-31.65287 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8182.791,1672.963,-31.65287,0,0,1,0,100,0),
(@PATH,2,-8161.917,1683.302,-33.64119,0,0,1,0,100,0),
(@PATH,3,-8144.854,1658.909,-39.02008,0,0,1,0,100,0),
(@PATH,4,-8112.538,1648.41,-48.56252,0,0,1,0,100,0),
(@PATH,5,-8099.015,1661.896,-50.44419,0,0,1,0,100,0),
(@PATH,6,-8073.55,1670.37,-51.79721,0,0,1,0,100,0),
(@PATH,7,-8047.324,1647.833,-58.80652,0,0,1,0,100,0),
(@PATH,8,-8023.915,1630.05,-58.94074,0,0,1,0,100,0),
(@PATH,9,-8007.258,1617.836,-56.80342,0,0,1,0,100,0),
(@PATH,10,-8007.498,1581.44,-61.93605,0,0,1,0,100,0),
(@PATH,11,-8024.588,1566.902,-65.47791,0,0,1,0,100,0),
(@PATH,12,-8026.689,1536.815,-68.19724,0,0,1,0,100,0),
(@PATH,13,-8024.588,1566.902,-65.47791,0,0,1,0,100,0),
(@PATH,14,-8007.498,1581.44,-61.93605,0,0,1,0,100,0),
(@PATH,15,-8007.258,1617.836,-56.80342,0,0,1,0,100,0),
(@PATH,16,-8023.915,1630.05,-58.94074,0,0,1,0,100,0),
(@PATH,17,-8047.324,1647.833,-58.80652,0,0,1,0,100,0),
(@PATH,18,-8073.55,1670.37,-51.79721,0,0,1,0,100,0),
(@PATH,19,-8099.015,1661.896,-50.44419,0,0,1,0,100,0),
(@PATH,20,-8112.538,1648.41,-48.56252,0,0,1,0,100,0),
(@PATH,21,-8144.854,1658.909,-39.02008,0,0,1,0,100,0),
(@PATH,22,-8161.917,1683.302,-33.64119,0,0,1,0,100,0);

UPDATE `creature` SET `spawndist`=10,`MovementType`=1 WHERE `guid`=87911;

-- Remove Vekniss Hive Crawler overspawn
DELETE FROM `creature` WHERE `guid` BETWEEN 87945 AND 87961;

-- Pathing for Vekniss Hive Crawler Entry: 15240 'TDB FORMAT' 
SET @NPC := 87939;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8290.739,`position_y`=1337.271,`position_z`=-79.84545 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8294.739,`position_y`=1332.271,`position_z`=-79.84545 WHERE `guid`=@NPC+1;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8290.739,1337.271,-79.84545,0,0,0,0,100,0),
(@PATH,2,-8248.099,1339.004,-85.39378,0,0,0,0,100,0),
(@PATH,3,-8238.928,1292.994,-87.8344,0,0,0,0,100,0),
(@PATH,4,-8202.383,1264.173,-92.27186,0,0,0,0,100,0),
(@PATH,5,-8192.835,1226.339,-92.15359,0,0,0,0,100,0),
(@PATH,6,-8169.127,1230.136,-92.5405,0,0,0,0,100,0),
(@PATH,7,-8192.835,1226.339,-92.15359,0,0,0,0,100,0),
(@PATH,8,-8202.383,1264.173,-92.27186,0,0,0,0,100,0),
(@PATH,9,-8238.928,1292.994,-87.8344,0,0,0,0,100,0),
(@PATH,10,-8248.099,1339.004,-85.39378,0,0,0,0,100,0);

-- Vekniss Hive Crawler formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@NPC+1,7,90,2,1,6);

-- Pathing for Vekniss Hive Crawler Entry: 15240 'TDB FORMAT' 
SET @NPC := 87941;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8255.963,`position_y`=1349.651,`position_z`=-84.4174 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8255.963,`position_y`=1349.651,`position_z`=-84.4174 WHERE `guid`=@NPC+1;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8255.963,1349.651,-84.4174,0,0,0,0,100,0),
(@PATH,2,-8293.042,1364.945,-77.56605,0,0,0,0,100,0),
(@PATH,3,-8320.49,1334.739,-72.65111,0,0,0,0,100,0),
(@PATH,4,-8355.71,1359.734,-65.14333,0,0,0,0,100,0),
(@PATH,5,-8320.678,1334.872,-72.67966,0,0,0,0,100,0),
(@PATH,6,-8293.042,1364.945,-77.56605,0,0,0,0,100,0),
(@PATH,7,-8255.963,1349.651,-84.4174,0,0,0,0,100,0),
(@PATH,8,-8233.676,1320.495,-86.60672,0,0,0,0,100,0),
(@PATH,9,-8230.803,1281.079,-89.86937,0,0,0,0,100,0),
(@PATH,10,-8203.98,1271.184,-91.95763,0,0,0,0,100,0),
(@PATH,11,-8197.017,1230.331,-92.32941,0,0,0,0,100,0),
(@PATH,12,-8203.98,1271.184,-91.95763,0,0,0,0,100,0),
(@PATH,13,-8230.538,1280.981,-89.9477,0,0,0,0,100,0),
(@PATH,14,-8233.676,1320.495,-86.60672,0,0,0,0,100,0);

-- Vekniss Hive Crawler formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@NPC+1,7,90,2,4,11);

-- Pathing for Vekniss Hive Crawler Entry: 15240 'TDB FORMAT' 
SET @NPC := 87943;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8526.7,`position_y`=1385.158,`position_z`=-58.87769 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8526.7,`position_y`=1385.158,`position_z`=-58.87769 WHERE `guid`=@NPC+1;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8526.7,1385.158,-58.87769,0,0,0,0,100,0),
(@PATH,2,-8514.655,1377.609,-59.3903,0,0,0,0,100,0),
(@PATH,3,-8489.994,1376.669,-59.29538,0,0,0,0,100,0),
(@PATH,4,-8465.505,1376.563,-58.49561,0,0,0,0,100,0),
(@PATH,5,-8458.902,1363.877,-60.13142,0,0,0,0,100,0),
(@PATH,6,-8473.567,1356.557,-59.07343,0,0,0,0,100,0),
(@PATH,7,-8498.528,1361.103,-60.34806,0,0,0,0,100,0),
(@PATH,8,-8519.738,1370.179,-61.29987,0,0,0,0,100,0),
(@PATH,9,-8546.015,1380.145,-60.98241,0,0,0,0,100,0),
(@PATH,10,-8573.124,1395.751,-64.01164,0,0,0,0,100,0),
(@PATH,11,-8568.937,1404.801,-61.96235,0,0,0,0,100,0),
(@PATH,12,-8557.207,1408.638,-58.67739,0,0,0,0,100,0),
(@PATH,13,-8541.95,1393.287,-59.30177,0,0,0,0,100,0);

-- Vekniss Hive Crawler formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@NPC+1,7,90,2,0,0);

-- Pathing for Princess Huhuran Entry: 15509 'TDB FORMAT' 
SET @NPC := 88014;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8515.803,`position_y`=1693.652,`position_z`=-90.48472 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8515.803,1693.652,-90.48472,0,0,0,0,100,0),
(@PATH,2,-8512.993,1728.714,-91.76323,0,0,0,0,100,0),
(@PATH,3,-8514.034,1751.632,-91.8007,0,0,0,0,100,0),
(@PATH,4,-8535.463,1765.799,-90.55943,0,0,0,0,100,0),
(@PATH,5,-8555.29,1770.428,-90.79091,0,0,0,0,100,0),
(@PATH,6,-8575.839,1788.965,-91.80469,0,0,0,0,100,0),
(@PATH,7,-8605.888,1785.042,-89.97934,0,0,0,0,100,0),
(@PATH,8,-8631.052,1766.135,-91.00841,0,0,0,0,100,0),
(@PATH,9,-8656.294,1757.134,-91.79616,0,0,0,0,100,0),
(@PATH,10,-8631.057,1766.133,-91.00929,0,0,0,0,100,0),
(@PATH,11,-8605.888,1785.042,-89.97934,0,0,0,0,100,0),
(@PATH,12,-8575.839,1788.965,-91.80469,0,0,0,0,100,0),
(@PATH,13,-8555.29,1770.428,-90.79091,0,0,0,0,100,0),
(@PATH,14,-8535.463,1765.799,-90.55943,0,0,0,0,100,0),
(@PATH,15,-8514.142,1751.703,-91.84047,0,0,0,0,100,0),
(@PATH,16,-8512.993,1728.714,-91.76323,0,0,0,0,100,0);

-- The Prophet Skeram respawn linking
DELETE FROM `linked_respawn` WHERE `linkedGuid`=88075;
INSERT INTO `linked_respawn` (`guid`,`linkedGuid`,`linkType`) VALUES
(87564,88075,0),(87565,88075,0),(87566,88075,0),(87567,88075,0),(87568,88075,0),(87569,88075,0),
(87570,88075,0),(87571,88075,0),(87652,88075,0),(87653,88075,0),(88074,88075,0);

-- Battleguard Sartura respawn linking
DELETE FROM `linked_respawn` WHERE `linkedGuid`=87648;
INSERT INTO `linked_respawn` (`guid`,`linkedGuid`,`linkType`) VALUES
(87597,87648,0),(87598,87648,0),(87604,87648,0),(87605,87648,0),(87606,87648,0),(87607,87648,0),
(87672,87648,0),(87673,87648,0),(87674,87648,0),(87675,87648,0),(87676,87648,0),(87677,87648,0),
(87595,87648,0),(87596,87648,0),(87599,87648,0),(87600,87648,0),(87608,87648,0),(87609,87648,0),
(87610,87648,0),(87611,87648,0),(87612,87648,0),(87613,87648,0),(87614,87648,0),(87615,87648,0),
(87616,87648,0),(87617,87648,0),(87618,87648,0),(87619,87648,0),(87620,87648,0),(87621,87648,0),
(87622,87648,0),(87623,87648,0),(87624,87648,0),(87625,87648,0),(87626,87648,0),(87627,87648,0),
(87628,87648,0),(87629,87648,0),(87630,87648,0),(87631,87648,0),(87632,87648,0),(87633,87648,0),
(87634,87648,0),(87635,87648,0),(87636,87648,0),(87637,87648,0),(87638,87648,0),(87649,87648,0),
(87650,87648,0),(87651,87648,0);
 
 
/* 
* sql\updates\world\2015_10_14_01_world.sql 
*/ 
-- Pathing for Lava Surger Entry: 12101 'TDB FORMAT' 
SET @NPC := 56666;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=679.1953,`position_y`=-847.3836,`position_z`=-208.2482 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,679.1953,-847.3836,-208.2482,0,0,1,0,100,0),
(@PATH,2,676.7046,-829.8509,-208.8353,0,0,1,0,100,0),
(@PATH,3,665.002,-813.2372,-208.774,0,0,1,0,100,0),
(@PATH,4,681.6021,-776.7833,-209.1657,0,0,1,0,100,0),
(@PATH,5,686.1985,-738.5436,-209.2948,0,0,1,0,100,0),
(@PATH,6,707.9111,-711.0708,-209.5187,0,0,1,0,100,0),
(@PATH,7,708.2624,-692.8405,-209.5718,0,0,1,0,100,0),
(@PATH,8,690.2739,-662.6287,-209.6574,0,0,1,0,100,0),
(@PATH,9,708.2625,-692.8368,-209.5175,0,0,1,0,100,0),
(@PATH,10,707.9111,-711.0708,-209.5187,0,0,1,0,100,0),
(@PATH,11,686.1985,-738.5436,-209.2948,0,0,1,0,100,0),
(@PATH,12,681.6021,-776.7833,-209.1657,0,0,1,0,100,0),
(@PATH,13,665.002,-813.2372,-208.774,0,0,1,0,100,0),
(@PATH,14,676.7046,-829.8509,-208.8353,0,0,1,0,100,0),
(@PATH,15,679.1953,-847.3836,-208.2482,0,0,1,0,100,0),
(@PATH,16,696.5482,-855.4606,-206.0954,0,0,1,0,100,0),
(@PATH,17,710.7119,-882.6242,-198.953,0,0,1,0,100,0),
(@PATH,18,714.8118,-907.6405,-193.7685,0,0,1,0,100,0),
(@PATH,19,735.3042,-937.3447,-188.4066,0,0,1,0,100,0),
(@PATH,20,714.8118,-907.6405,-193.7685,0,0,1,0,100,0),
(@PATH,21,710.7119,-882.6242,-198.953,0,0,1,0,100,0),
(@PATH,22,697.0541,-866.1818,-204.0854,0,0,1,0,100,0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=696.6885,`position_y`=-852.352,`position_z`=-206.5962,`orientation`=3.674797 WHERE `guid`=56789;
DELETE FROM `creature_addon` WHERE `guid`=56789;
DELETE FROM `waypoint_data` WHERE `id`=567890;
 
 
/* 
* sql\updates\world\2015_10_14_02_world.sql 
*/ 
--
DELETE FROM `creature_addon` WHERE `guid` IN (56606,56607);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(56606,566050,0,0,1,0, ''),
(56607,566050,0,0,1,0, '');
 
 
/* 
* sql\updates\world\2015_10_14_03_world.sql 
*/ 
--
-- Fix up some errors in Vekniss Hive Crawler Entry: 15240 pathing
UPDATE `creature` SET `position_x`=-8259.721,`position_y`=1343.373,`position_z`=-84.4428 WHERE `guid`=87942;
UPDATE `creature` SET `position_x`=-8524.316,`position_y`=1389.612,`position_z`=-57.2656 WHERE `guid`=87944;
DELETE FROM `creature_addon` WHERE `guid` IN (87940,87942,87944);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(87940,879390,0,0,1,0, ''),(87942,879410,0,0,1,0, ''),(87944,879430,0,0,1,0, '');
 
 
/* 
* sql\updates\world\2015_10_14_04_world.sql 
*/ 
-- 
-- Add missing critters to AQ40
SET @CGUID := 87830;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+62;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 4076, 531, 1, 1, -7993.61, 1277.031, -73.53455, 1.856409, 7200, 5, 1),
(@CGUID+1, 4076, 531, 1, 1, -8071.965, 1231.468, -91.46188, 1.903564, 7200, 5, 1),
(@CGUID+2, 4076, 531, 1, 1, -8308.057, 1858.822, -1.610428, 5.606663, 7200, 5, 1),
(@CGUID+3, 4076, 531, 1, 1, -8414.608, 2051.612, 9.279689, 3.343741, 7200, 5, 1),
(@CGUID+4, 4076, 531, 1, 1, -8416.188, 2076.555, 116.1282, 2.943876, 7200, 5, 1),
(@CGUID+5, 4076, 531, 1, 1, -8430.81, 2030.658, 116.1034, 4.016187, 7200, 5, 1),
(@CGUID+6, 4076, 531, 1, 1, -8693.907, 1563.222, -80.14254, 3.734258, 7200, 5, 1),
(@CGUID+7, 4076, 531, 1, 1, -8710.091, 1659.989, -84.65031, 5.40056, 7200, 5, 1),
(@CGUID+8, 4076, 531, 1, 1, -8855.175, 1535.051, -95.46984, 1.537807, 7200, 5, 1),
(@CGUID+9, 4076, 531, 1, 1, -8869.176, 1416.73, -93.07328, 5.271091, 7200, 5, 1),
(@CGUID+10, 4076, 531, 1, 1, -8904.052, 1863.421, -21.88551, 1.61788, 7200, 5, 1),
(@CGUID+11, 4076, 531, 1, 1, -9068.005, 1884.902, -43.82254, 2.850689, 7200, 5, 1),
(@CGUID+12, 4076, 531, 1, 1, -9117.436, 1379.472, -106.4541, 5.968285, 7200, 5, 1),
(@CGUID+13, 4076, 531, 1, 1, -9174.12, 2027.797, -60.80634, 0.08407046, 7200, 5, 1),
(@CGUID+14, 4076, 531, 1, 1, -9184.257, 1699.096, -50.83805, 3.615798, 7200, 5, 1),
(@CGUID+15, 15475, 531, 1, 1, -7914.396, 1445.457, -67.39938, 3.58752, 7200, 5, 1),
(@CGUID+16, 15475, 531, 1, 1, -7953.215, 1524.226, -62.41693, 3.258193, 7200, 5, 1),
(@CGUID+17, 15475, 531, 1, 1, -8012.04, 1604.964, -59.16104, 1.007754, 7200, 5, 1),
(@CGUID+18, 15475, 531, 1, 1, -8034.017, 1565.151, -65.11945, 1.29113, 7200, 5, 1),
(@CGUID+19, 15475, 531, 1, 1, -8039.968, 1175.328, -90.4319, 1.981047, 7200, 5, 1),
(@CGUID+20, 15475, 531, 1, 1, -8101.441, 1152.044, -90.54535, 1.581657, 7200, 5, 1),
(@CGUID+21, 15475, 531, 1, 1, -8108.146, 1662.778, -48.41492, 3.097694, 7200, 5, 1),
(@CGUID+22, 15475, 531, 1, 1, -8298.537, 1722.821, -16.17212, 4.068121, 7200, 5, 1),
(@CGUID+23, 15475, 531, 1, 1, -8371.146, 2061.964, 9.355958, 0.2580761, 7200, 5, 1),
(@CGUID+24, 15475, 531, 1, 1, -8386.911, 1898.422, 2.752187, 6.2749, 7200, 5, 1),
(@CGUID+25, 15475, 531, 1, 1, -8432.691, 2079.264, 116.1293, 0.4680386, 7200, 5, 1),
(@CGUID+26, 15475, 531, 1, 1, -8492.966, 1962.474, 62.38858, 4.436271, 7200, 5, 1),
(@CGUID+27, 15475, 531, 1, 1, -8557.565, 2140.73, -6.423177, 1.536374, 7200, 5, 1),
(@CGUID+28, 15475, 531, 1, 1, -8558.164, 1398.536, -61.02413, 1.319915, 7200, 5, 1),
(@CGUID+29, 15475, 531, 1, 1, -8586.941, 1998.362, -1.80591, 3.095486, 7200, 5, 1),
(@CGUID+30, 15475, 531, 1, 1, -8606.187, 1636.149, -89.51112, 2.737563, 7200, 5, 1),
(@CGUID+31, 15475, 531, 1, 1, -8627.807, 1908.553, 108.5656, 3.843493, 7200, 5, 1),
(@CGUID+32, 15475, 531, 1, 1, -8943.605, 1438.669, -92.41223, 3.784467, 7200, 5, 1),
(@CGUID+33, 15475, 531, 1, 1, -9096.328, 2109.297, -60.5332, 5.777769, 7200, 5, 1),
(@CGUID+34, 15475, 531, 1, 1, -9116.301, 1796.602, -42.21427, 1.827075, 7200, 5, 1),
(@CGUID+35, 15475, 531, 1, 1, -9118.708, 2143.711, -62.06357, 2.151066, 7200, 5, 1),
(@CGUID+36, 15475, 531, 1, 1, -9142.719, 2103.468, -65.14211, 1.267552, 7200, 5, 1),
(@CGUID+37, 15475, 531, 1, 1, -9180.303, 1493.747, -94.91629, 0.3170593, 7200, 5, 1),
(@CGUID+38, 15475, 531, 1, 1, -9196.674, 2084.258, -63.99967, 2.517623, 7200, 5, 1),
(@CGUID+39, 15475, 531, 1, 1, -9234.575, 2114.615, -66.58328, 3.193953, 7200, 5, 1),
(@CGUID+40, 15476, 531, 1, 1, -7921.302, 1372.589, -75.91825, 4.972216, 7200, 5, 1),
(@CGUID+41, 15476, 531, 1, 1, -8125.222, 1185.706, -90.46516, 3.404643, 7200, 5, 1),
(@CGUID+42, 15476, 531, 1, 1, -8136.203, 1621.301, -45.78866, 0.4527432, 7200, 5, 1),
(@CGUID+43, 15476, 531, 1, 1, -8219.493, 1287.494, -90.73062, 5.135323, 7200, 5, 1),
(@CGUID+44, 15476, 531, 1, 1, -8231.996, 1730.547, -23.7835, 1.56798, 7200, 5, 1),
(@CGUID+45, 15476, 531, 1, 1, -8282.225, 1654.54, -30.92528, 3.785695, 7200, 5, 1),
(@CGUID+46, 15476, 531, 1, 1, -8343.887, 1800.739, -1.62698, 0.4436055, 7200, 5, 1),
(@CGUID+47, 15476, 531, 1, 1, -8354.889, 1950.469, -1.990107, 2.945138, 7200, 5, 1),
(@CGUID+48, 15476, 531, 1, 1, -8402.777, 2032.242, 116.1043, 1.83938, 7200, 5, 1),
(@CGUID+49, 15476, 531, 1, 1, -8530.837, 1987.527, 19.45868, 1.684378, 7200, 5, 1),
(@CGUID+50, 15476, 531, 1, 1, -8571.373, 1981.646, -2.622002, 1.976356, 7200, 5, 1),
(@CGUID+51, 15476, 531, 1, 1, -8584.706, 2161.053, -6.459295, 1.208772, 7200, 5, 1),
(@CGUID+52, 15476, 531, 1, 1, -8604.21, 2111.618, -5.873696, 1.306837, 7200, 5, 1),
(@CGUID+53, 15476, 531, 1, 1, -8786.167, 1550.577, -94.0428, 4.411382, 7200, 5, 1),
(@CGUID+54, 15476, 531, 1, 1, -8795.048, 1985.752, -20.00344, 4.738873, 7200, 5, 1),
(@CGUID+55, 15476, 531, 1, 1, -8902.53, 1530.709, -94.36566, 4.301609, 7200, 5, 1),
(@CGUID+56, 15476, 531, 1, 1, -9003.465, 1871.428, -42.74734, 5.304233, 7200, 5, 1),
(@CGUID+57, 15476, 531, 1, 1, -9087.258, 1473.547, -105.3523, 0.5530397, 7200, 5, 1),
(@CGUID+58, 15476, 531, 1, 1, -9107.258, 2057.86, -61.6295, 2.819984, 7200, 5, 1),
(@CGUID+59, 15476, 531, 1, 1, -9163.185, 2056.463, -63.7112, 3.981431, 7200, 5, 1),
(@CGUID+60, 15476, 531, 1, 1, -9207.206, 2138.979, -67.99921, 3.086965, 7200, 5, 1),
(@CGUID+61, 15476, 531, 1, 1, -9223.008, 2041.489, -62.08887, 0.8683821, 7200, 5, 1),
(@CGUID+62, 15476, 531, 1, 1, -9243.944, 2079.562, -64.68581, 1.411943, 7200, 5, 1);

-- Ahn'Qiraj Trigger
SET @CGUID := 87639;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+6;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 15426, 531, 1, 1, -8336.388, 2176.261, 127.9972, 2.129302, 7200, 0, 0),
(@CGUID+1, 15426, 531, 1, 1, -8163.713, 2179.064, 130.4213, 5.51524, 7200, 0, 0),
(@CGUID+2, 15426, 531, 1, 1, -8313.152, 2045.799, 137.8285, 4.18879, 7200, 0, 0),
(@CGUID+3, 15426, 531, 1, 1, -8651.198, 2071.601, 20.505, 2.495821, 7200, 0, 0),
(@CGUID+4, 15426, 531, 1, 1, -8337.532, 1731.16, 31.24248, 5.951573, 7200, 0, 0),
(@CGUID+5, 15426, 531, 1, 1, -7994.346, 1000.059, 2.599343, 2.600541, 7200, 0, 0),
(@CGUID+6, 15426, 531, 1, 1, -8983.974, 1392.379, -82.83119, 3.630285, 7200, 0, 0);

-- OLDWorld Trigger (DO NOT DELETE)
SET @CGUID := 87646;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+1;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 15384, 531, 1, 1, -8546.249, 1987.516, -96.43676, 0.3316126, 7200, 0, 0),
(@CGUID+1, 15384, 531, 1, 1, -8576.694, 1987.583, 100.3037, 0.4712389, 7200, 0, 0);

-- Anubisath Warder
SET @CGUID := 87654;
DELETE FROM `creature` WHERE `guid` IN (88020,88021,88064);
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+3;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 15311, 531, 1, 1, -8909.497, 1860.686, -22.37387, 3.176499, 7200, 0, 0),
(@CGUID+1, 15311, 531, 1, 1, -8997.906, 1920.162, -43.96503, 4.29351, 7200, 0, 0),
(@CGUID+2, 15311, 531, 1, 1, -9083.562, 1767.909, -42.79126, 3.228859, 7200, 0, 0),
(@CGUID+3, 15311, 531, 1, 1, -9133.911, 1813.15, -42.73888, 5.131268, 7200, 0, 0);

-- Obsidian Nullifier
SET @CGUID := 88022;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+7;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 15312, 531, 1, 1, -8913.266, 1875.202, -22.02199, 3.176499, 7200, 0, 0),
(@CGUID+1, 15312, 531, 1, 1, -8918.995, 1846.376, -23.08899, 2.617994, 7200, 0, 0),
(@CGUID+2, 15312, 531, 1, 1, -8995.444, 1903.269, -41.87885, 3.752458, 7200, 0, 0),
(@CGUID+3, 15312, 531, 1, 1, -9016.395, 1920.327, -44.30135, 4.572762, 7200, 0, 0),
(@CGUID+4, 15312, 531, 1, 1, -9087.13, 1781.5, -42.47464, 3.577925, 7200, 0, 0),
(@CGUID+5, 15312, 531, 1, 1, -9090.95, 1755.96, -41.99282, 2.86234, 7200, 0, 0),
(@CGUID+6, 15312, 531, 1, 1, -9122.171, 1809.711, -42.50865, 4.433136, 7200, 0, 0),
(@CGUID+7, 15312, 531, 1, 1, -9140.379, 1802.046, -42.01139, 5.480334, 7200, 0, 0);

-- Pathing for OLDWorld Trigger (DO NOT DELETE) Entry: 15384 'TDB FORMAT' 
SET @NPC := 87647;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8577.317,`position_y`=1988.112,`position_z`=101.2204 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8577.317,1988.112,101.2204,0,0,0,0,100,0),
(@PATH,2,-8578.001,1987.128,101.2204,0,0,0,0,100,0);

DELETE FROM `creature_template_addon` WHERE `entry` IN (15312);
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (15312,0,1,0, '19818');

UPDATE `creature` SET `spawntimesecs`=0 WHERE `id`=15300;

-- Remove over spawned Vekniss Stinger
DELETE FROM `creature` WHERE `guid` IN (88006,88007,88011,88012,88013);
-- Remove over spawned Vekniss Wasp
DELETE FROM `creature` WHERE `guid` BETWEEN 87977 AND 87989;
DELETE FROM `creature` WHERE `guid` IN (88000,88001,88004,88005,88009,88010);
-- Remove over spawned Anubisath Swarmguard
DELETE FROM `creature` WHERE `guid` IN (87999,88002,88003,88008);

UPDATE `creature_template` SET `InhabitType`=7 WHERE `entry` IN (15235,15236,15249);
-- Anubisath Swarmguard spawns should be Qiraji Lasher
UPDATE `creature` SET `id`=15249 WHERE `guid` IN (87994,87995,87996);

-- Pathing for Vekniss Stinger Entry: 15235 'TDB FORMAT'
SET @NPC := 87990;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8563.52,`position_y`=1739.6,`position_z`=-90.46359 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8563.52,`position_y`=1739.6,`position_z`=-90.46359 WHERE `guid`=87962; -- Vekniss Wasp
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8563.52,`position_y`=1739.6,`position_z`=-90.46359 WHERE `guid`=87963; -- Vekniss Wasp
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8563.52,`position_y`=1739.6,`position_z`=-90.46359 WHERE `guid`=87994; -- Qiraji Lasher
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,87962,87963,87994);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(87962,@PATH,0,0,1,0, ''),(87963,@PATH,0,0,1,0, ''),(87994,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8563.52,1739.6,-90.46359,0,0,1,0,100,0),
(@PATH,2,-8548.448,1731.575,-91.82451,0,0,1,0,100,0),
(@PATH,3,-8542.137,1699.376,-90.39761,0,0,1,0,100,0),
(@PATH,4,-8558.685,1666.235,-90.69133,0,0,1,0,100,0),
(@PATH,5,-8585.775,1654.991,-89.79728,0,0,1,0,100,0),
(@PATH,6,-8613.518,1668.712,-90.51443,0,0,1,0,100,0),
(@PATH,7,-8622.457,1691.902,-91.26654,0,0,1,0,100,0),
(@PATH,8,-8645.388,1710.061,-90.06686,0,0,1,0,100,0),
(@PATH,9,-8635.841,1744.949,-91.82065,0,0,1,0,100,0),
(@PATH,10,-8617.822,1770.243,-90.46841,0,0,1,0,100,0),
(@PATH,11,-8635.841,1744.949,-91.82065,0,0,1,0,100,0),
(@PATH,12,-8645.388,1710.061,-90.06686,0,0,1,0,100,0),
(@PATH,13,-8622.457,1691.902,-91.26654,0,0,1,0,100,0),
(@PATH,14,-8613.518,1668.712,-90.51443,0,0,1,0,100,0),
(@PATH,15,-8585.775,1654.991,-89.79728,0,0,1,0,100,0),
(@PATH,16,-8558.685,1666.235,-90.69133,0,0,1,0,100,0),
(@PATH,17,-8542.137,1699.376,-90.39761,0,0,1,0,100,0),
(@PATH,18,-8548.448,1731.575,-91.82451,0,0,1,0,100,0),
(@PATH,19,-8563.52,1739.6,-90.46359,0,0,1,0,100,0),
(@PATH,20,-8580.759,1732.139,-91.39182,0,0,1,0,100,0),
(@PATH,21,-8595.639,1703.542,-91.69364,0,0,1,0,100,0),
(@PATH,22,-8598.313,1670.841,-90.63684,0,0,1,0,100,0),
(@PATH,23,-8596.669,1642.029,-89.56214,0,0,1,0,100,0),
(@PATH,24,-8602.972,1615.217,-88.6513,0,0,1,0,100,0),
(@PATH,25,-8605.679,1582.754,-82.176,0,0,1,0,100,0),
(@PATH,26,-8617.505,1563.513,-79.12038,0,0,1,0,100,0),
(@PATH,27,-8621.844,1547.022,-76.55392,0,0,1,0,100,0),
(@PATH,28,-8617.5,1516.144,-70.19933,0,0,1,0,100,0),
(@PATH,29,-8625.505,1479.613,-68.04492,0,0,1,0,100,0),
(@PATH,30,-8614.832,1443.637,-66.69106,0,0,1,0,100,0),
(@PATH,31,-8600.255,1422.463,-65.39139,0,0,1,0,100,0),
(@PATH,32,-8611.4,1385.665,-69.80731,0,0,1,0,100,0),
(@PATH,33,-8623.595,1364.614,-69.91782,0,0,1,0,100,0),
(@PATH,34,-8604.512,1328.141,-69.94511,0,0,1,0,100,0),
(@PATH,35,-8589.592,1311.021,-69.10871,0,0,1,0,100,0),
(@PATH,36,-8604.512,1328.141,-69.94511,0,0,1,0,100,0),
(@PATH,37,-8623.595,1364.614,-69.91782,0,0,1,0,100,0),
(@PATH,38,-8611.4,1385.665,-69.80731,0,0,1,0,100,0),
(@PATH,39,-8600.255,1422.463,-65.39139,0,0,1,0,100,0),
(@PATH,40,-8614.832,1443.637,-66.69106,0,0,1,0,100,0),
(@PATH,41,-8625.505,1479.613,-68.04492,0,0,1,0,100,0),
(@PATH,42,-8617.5,1516.144,-70.19933,0,0,1,0,100,0),
(@PATH,43,-8621.844,1547.022,-76.55392,0,0,1,0,100,0),
(@PATH,44,-8617.505,1563.513,-79.12038,0,0,1,0,100,0),
(@PATH,45,-8605.679,1582.754,-82.176,0,0,1,0,100,0),
(@PATH,46,-8602.972,1615.217,-88.6513,0,0,1,0,100,0),
(@PATH,47,-8596.669,1642.029,-89.56214,0,0,1,0,100,0),
(@PATH,48,-8598.313,1670.841,-90.63684,0,0,1,0,100,0),
(@PATH,49,-8595.639,1703.542,-91.69364,0,0,1,0,100,0),
(@PATH,50,-8580.759,1732.139,-91.39182,0,0,1,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,87962,6,90,2,10,35),
(@NPC,87963,6,270,2,10,35),
(@NPC,87994,6,360,2,0,0);

-- Pathing for Vekniss Stinger Entry: 15235 'TDB FORMAT' 
SET @NPC := 87991;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8635.931,`position_y`=1406.936,`position_z`=-69.83319 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8635.931,`position_y`=1406.936,`position_z`=-69.83319 WHERE `guid`=87964; -- Vekniss Wasp
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8635.931,`position_y`=1406.936,`position_z`=-69.83319 WHERE `guid`=87965; -- Vekniss Wasp
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8635.931,`position_y`=1406.936,`position_z`=-69.83319 WHERE `guid`=87966; -- Vekniss Wasp
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,87964,87965,87966);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(87964,@PATH,0,0,1,0, ''),(87965,@PATH,0,0,1,0, ''),(87966,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8635.931,1406.936,-69.83319,0,0,1,0,100,0),
(@PATH,2,-8663.641,1389.05,-69.89677,0,0,1,0,100,0),
(@PATH,3,-8685.819,1364.188,-69.32112,0,0,1,0,100,0),
(@PATH,4,-8654.888,1363.939,-69.89539,0,0,1,0,100,0),
(@PATH,5,-8628.978,1372.13,-69.89567,0,0,1,0,100,0),
(@PATH,6,-8610.717,1381.386,-69.89604,0,0,1,0,100,0),
(@PATH,7,-8594.859,1388.721,-68.43361,0,0,1,0,100,0),
(@PATH,8,-8570.96,1400.338,-62.98791,0,0,1,0,100,0),
(@PATH,9,-8592.089,1370.82,-68.49156,0,0,1,0,100,0),
(@PATH,10,-8597.555,1344.224,-69.9974,0,0,1,0,100,0),
(@PATH,11,-8601.242,1313.158,-69.77949,0,0,1,0,100,0),
(@PATH,12,-8600.213,1300.66,-68.76534,0,0,1,0,100,0),
(@PATH,13,-8601.242,1313.158,-69.77949,0,0,1,0,100,0),
(@PATH,14,-8597.555,1344.224,-69.9974,0,0,1,0,100,0),
(@PATH,15,-8592.089,1370.82,-68.49156,0,0,1,0,100,0),
(@PATH,16,-8570.96,1400.338,-62.98791,0,0,1,0,100,0),
(@PATH,17,-8594.859,1388.721,-68.43361,0,0,1,0,100,0),
(@PATH,18,-8610.717,1381.386,-69.89604,0,0,1,0,100,0),
(@PATH,19,-8628.978,1372.13,-69.89567,0,0,1,0,100,0),
(@PATH,20,-8654.888,1363.939,-69.89539,0,0,1,0,100,0),
(@PATH,21,-8685.696,1364.187,-69.33382,0,0,1,0,100,0),
(@PATH,22,-8663.641,1389.05,-69.89677,0,0,1,0,100,0),
(@PATH,23,-8635.931,1406.936,-69.83319,0,0,1,0,100,0),
(@PATH,24,-8618.646,1426.418,-67.81181,0,0,1,0,100,0),
(@PATH,25,-8609.056,1445.661,-65.29099,0,0,1,0,100,0),
(@PATH,26,-8629.429,1440.835,-68.46561,0,0,1,0,100,0),
(@PATH,27,-8650.575,1437.557,-69.80312,0,0,1,0,100,0),
(@PATH,28,-8680.427,1427.707,-69.89879,0,0,1,0,100,0),
(@PATH,29,-8711.025,1419.595,-69.8176,0,0,1,0,100,0),
(@PATH,30,-8712.949,1440.549,-69.93085,0,0,1,0,100,0),
(@PATH,31,-8684.471,1454.425,-69.90324,0,0,1,0,100,0),
(@PATH,32,-8667.691,1471.393,-69.88974,0,0,1,0,100,0),
(@PATH,33,-8638.46,1491.58,-69.76362,0,0,1,0,100,0),
(@PATH,34,-8621.95,1510.354,-69.86166,0,0,1,0,100,0),
(@PATH,35,-8649.152,1507.348,-68.94562,0,0,1,0,100,0),
(@PATH,36,-8685.408,1502.433,-69.90717,0,0,1,0,100,0),
(@PATH,37,-8724.848,1499.006,-68.85789,0,0,1,0,100,0),
(@PATH,38,-8685.408,1502.433,-69.90717,0,0,1,0,100,0),
(@PATH,39,-8649.152,1507.348,-68.94562,0,0,1,0,100,0),
(@PATH,40,-8621.95,1510.354,-69.86166,0,0,1,0,100,0),
(@PATH,41,-8638.389,1491.629,-69.73217,0,0,1,0,100,0),
(@PATH,42,-8667.691,1471.393,-69.88974,0,0,1,0,100,0),
(@PATH,43,-8684.471,1454.425,-69.90324,0,0,1,0,100,0),
(@PATH,44,-8712.949,1440.549,-69.93085,0,0,1,0,100,0),
(@PATH,45,-8711.025,1419.595,-69.8176,0,0,1,0,100,0),
(@PATH,46,-8680.427,1427.707,-69.89879,0,0,1,0,100,0),
(@PATH,47,-8650.575,1437.557,-69.80312,0,0,1,0,100,0),
(@PATH,48,-8629.429,1440.835,-68.46561,0,0,1,0,100,0),
(@PATH,49,-8609.056,1445.661,-65.29099,0,0,1,0,100,0),
(@PATH,50,-8618.646,1426.418,-67.81181,0,0,1,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,87964,6,90,2,12,37),
(@NPC,87965,6,270,2,12,37),
(@NPC,87966,6,360,2,0,0);

-- Pathing for Vekniss Stinger Entry: 15235 'TDB FORMAT' 
SET @NPC := 87992;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8623.98,`position_y`=1334.81,`position_z`=-69.86489 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8623.98,`position_y`=1334.81,`position_z`=-69.86489 WHERE `guid`=87967; -- Vekniss Wasp
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8623.98,`position_y`=1334.81,`position_z`=-69.86489 WHERE `guid`=87968; -- Vekniss Wasp
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8623.98,`position_y`=1334.81,`position_z`=-69.86489 WHERE `guid`=87969; -- Vekniss Wasp
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,87967,87968,87969);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(87967,@PATH,0,0,1,0, ''),(87968,@PATH,0,0,1,0, ''),(87969,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8623.98,1334.81,-69.86489,0,0,1,0,100,0),
(@PATH,2,-8634.258,1313.449,-68.89619,0,0,1,0,100,0),
(@PATH,3,-8623.98,1334.81,-69.86489,0,0,1,0,100,0),
(@PATH,4,-8609.494,1363.034,-69.90972,0,0,1,0,100,0),
(@PATH,5,-8586.571,1399.059,-66.1879,0,0,1,0,100,0),
(@PATH,6,-8578.356,1419.405,-61.01471,0,0,1,0,100,0),
(@PATH,7,-8597.195,1413.111,-66.22318,0,0,1,0,100,0),
(@PATH,8,-8624.466,1398.803,-69.8503,0,0,1,0,100,0),
(@PATH,9,-8649.411,1383.114,-69.89638,0,0,1,0,100,0),
(@PATH,10,-8670.308,1369.943,-69.89581,0,0,1,0,100,0),
(@PATH,11,-8689.218,1363.772,-68.88567,0,0,1,0,100,0),
(@PATH,12,-8680.373,1391.337,-69.88323,0,0,1,0,100,0),
(@PATH,13,-8667.099,1414.957,-69.89799,0,0,1,0,100,0),
(@PATH,14,-8650.532,1430.125,-69.78033,0,0,1,0,100,0),
(@PATH,15,-8628.963,1440.418,-68.43501,0,0,1,0,100,0),
(@PATH,16,-8603.716,1459.491,-63.19542,0,0,1,0,100,0),
(@PATH,17,-8634.405,1457.036,-68.30659,0,0,1,0,100,0),
(@PATH,18,-8659.28,1457.645,-69.87594,0,0,1,0,100,0),
(@PATH,19,-8685.762,1457.884,-69.90578,0,0,1,0,100,0),
(@PATH,20,-8710.759,1451.817,-70.05974,0,0,1,0,100,0),
(@PATH,21,-8733.675,1458.389,-69.94682,0,0,1,0,100,0),
(@PATH,22,-8711.259,1475.931,-69.84384,0,0,1,0,100,0),
(@PATH,23,-8684.056,1485.012,-69.90536,0,0,1,0,100,0),
(@PATH,24,-8658.634,1491.176,-70.00501,0,0,1,0,100,0),
(@PATH,25,-8643.371,1495.58,-69.92625,0,0,1,0,100,0),
(@PATH,26,-8628.882,1499.146,-68.3502,0,0,1,0,100,0),
(@PATH,27,-8652.819,1508.739,-68.82653,0,0,1,0,100,0),
(@PATH,28,-8680.034,1515.398,-69.43343,0,0,1,0,100,0),
(@PATH,29,-8713.806,1523.833,-70.50439,0,0,1,0,100,0),
(@PATH,30,-8680.034,1515.398,-69.43343,0,0,1,0,100,0),
(@PATH,31,-8652.98,1508.779,-68.82138,0,0,1,0,100,0),
(@PATH,32,-8628.882,1499.146,-68.3502,0,0,1,0,100,0),
(@PATH,33,-8643.371,1495.58,-69.92625,0,0,1,0,100,0),
(@PATH,34,-8658.634,1491.176,-70.00501,0,0,1,0,100,0),
(@PATH,35,-8684.056,1485.012,-69.90536,0,0,1,0,100,0),
(@PATH,36,-8711.231,1475.952,-69.84595,0,0,1,0,100,0),
(@PATH,37,-8733.675,1458.389,-69.94682,0,0,1,0,100,0),
(@PATH,38,-8710.759,1451.817,-70.05974,0,0,1,0,100,0),
(@PATH,39,-8685.762,1457.884,-69.90578,0,0,1,0,100,0),
(@PATH,40,-8659.28,1457.645,-69.87594,0,0,1,0,100,0),
(@PATH,41,-8634.405,1457.036,-68.30659,0,0,1,0,100,0),
(@PATH,42,-8603.716,1459.491,-63.19542,0,0,1,0,100,0),
(@PATH,43,-8628.963,1440.418,-68.43501,0,0,1,0,100,0),
(@PATH,44,-8650.532,1430.125,-69.78033,0,0,1,0,100,0),
(@PATH,45,-8667.099,1414.957,-69.89799,0,0,1,0,100,0),
(@PATH,46,-8680.373,1391.337,-69.88323,0,0,1,0,100,0),
(@PATH,47,-8689.218,1363.772,-68.88567,0,0,1,0,100,0),
(@PATH,48,-8670.308,1369.943,-69.89581,0,0,1,0,100,0),
(@PATH,49,-8649.411,1383.114,-69.89638,0,0,1,0,100,0),
(@PATH,50,-8624.466,1398.803,-69.8503,0,0,1,0,100,0),
(@PATH,51,-8597.195,1413.111,-66.22318,0,0,1,0,100,0),
(@PATH,52,-8578.356,1419.405,-61.01471,0,0,1,0,100,0),
(@PATH,53,-8586.571,1399.059,-66.1879,0,0,1,0,100,0),
(@PATH,54,-8609.494,1363.034,-69.90972,0,0,1,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,87967,6,90,2,2,29),
(@NPC,87968,6,270,2,2,29),
(@NPC,87969,6,360,2,0,0);

-- Pathing for Vekniss Stinger Entry: 15235 'TDB FORMAT'
SET @NPC := 87993;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8627.878,`position_y`=1556.896,`position_z`=-77.69943 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8627.878,`position_y`=1556.896,`position_z`=-77.69943 WHERE `guid`=87970; -- Vekniss Wasp
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8627.878,`position_y`=1556.896,`position_z`=-77.69943 WHERE `guid`=87971; -- Vekniss Wasp
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8627.878,`position_y`=1556.896,`position_z`=-77.69943 WHERE `guid`=87995; -- Qiraji Lasher
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,87970,87971,87995);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(87970,@PATH,0,0,1,0, ''),(87971,@PATH,0,0,1,0, ''),(87995,@PATH,0,0,1,0, '');
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8627.878,1556.896,-77.69943,0,0,1,0,100,0),
(@PATH,2,-8605.357,1575.12,-80.19345,0,0,1,0,100,0),
(@PATH,3,-8612.334,1613.268,-88.55583,0,0,1,0,100,0),
(@PATH,4,-8586.318,1634.416,-89.21418,0,0,1,0,100,0),
(@PATH,5,-8576.596,1669.095,-90.36967,0,0,1,0,100,0),
(@PATH,6,-8584.211,1701.455,-91.66071,0,0,1,0,100,0),
(@PATH,7,-8570.804,1737.575,-90.75662,0,0,1,0,100,0),
(@PATH,8,-8581.879,1760.92,-91.87544,0,0,1,0,100,0),
(@PATH,9,-8589.551,1734.61,-90.93699,0,0,1,0,100,0),
(@PATH,10,-8588.171,1710.714,-91.73016,0,0,1,0,100,0),
(@PATH,11,-8596.261,1697.514,-91.66012,0,0,1,0,100,0),
(@PATH,12,-8605.489,1655.251,-89.98928,0,0,1,0,100,0),
(@PATH,13,-8632.322,1660.238,-89.734,0,0,1,0,100,0),
(@PATH,14,-8677.901,1675.274,-88.18523,0,0,1,0,100,0),
(@PATH,15,-8718.77,1662.168,-84.18893,0,0,1,0,100,0),
(@PATH,16,-8690.873,1675.741,-85.92585,0,0,1,0,100,0),
(@PATH,17,-8653.208,1690.787,-90.23106,0,0,1,0,100,0),
(@PATH,18,-8620.695,1704.375,-90.88026,0,0,1,0,100,0),
(@PATH,19,-8593.161,1708.36,-91.68605,0,0,1,0,100,0),
(@PATH,20,-8571.983,1710.358,-91.63534,0,0,1,0,100,0),
(@PATH,21,-8537.26,1707.522,-90.49876,0,0,1,0,100,0),
(@PATH,22,-8571.903,1710.365,-91.61901,0,0,1,0,100,0),
(@PATH,23,-8593.161,1708.36,-91.68605,0,0,1,0,100,0),
(@PATH,24,-8620.695,1704.375,-90.88026,0,0,1,0,100,0),
(@PATH,25,-8653.208,1690.787,-90.23106,0,0,1,0,100,0),
(@PATH,26,-8690.873,1675.741,-85.92585,0,0,1,0,100,0),
(@PATH,27,-8718.77,1662.168,-84.18893,0,0,1,0,100,0),
(@PATH,28,-8677.901,1675.274,-88.18523,0,0,1,0,100,0),
(@PATH,29,-8632.322,1660.238,-89.734,0,0,1,0,100,0),
(@PATH,30,-8605.489,1655.251,-89.98928,0,0,1,0,100,0),
(@PATH,31,-8596.261,1697.514,-91.66012,0,0,1,0,100,0),
(@PATH,32,-8588.171,1710.714,-91.73016,0,0,1,0,100,0),
(@PATH,33,-8589.551,1734.61,-90.93699,0,0,1,0,100,0),
(@PATH,34,-8581.879,1760.92,-91.87544,0,0,1,0,100,0),
(@PATH,35,-8570.804,1737.575,-90.75662,0,0,1,0,100,0),
(@PATH,36,-8584.211,1701.455,-91.66071,0,0,1,0,100,0),
(@PATH,37,-8576.596,1669.095,-90.36967,0,0,1,0,100,0),
(@PATH,38,-8586.318,1634.416,-89.21418,0,0,1,0,100,0),
(@PATH,39,-8612.334,1613.268,-88.55583,0,0,1,0,100,0),
(@PATH,40,-8605.357,1575.12,-80.19345,0,0,1,0,100,0),
(@PATH,41,-8627.878,1556.896,-77.69943,0,0,1,0,100,0),
(@PATH,42,-8615.41,1527.631,-72.21809,0,0,1,0,100,0),
(@PATH,43,-8621.278,1502.706,-68.84049,0,0,1,0,100,0),
(@PATH,44,-8613.856,1468.638,-65.51812,0,0,1,0,100,0),
(@PATH,45,-8611.396,1441.914,-66.07516,0,0,1,0,100,0),
(@PATH,46,-8648.351,1425.724,-69.76824,0,0,1,0,100,0),
(@PATH,47,-8690.109,1425.443,-69.89849,0,0,1,0,100,0),
(@PATH,48,-8688.043,1466.35,-69.90285,0,0,1,0,100,0),
(@PATH,49,-8686.704,1491.772,-69.90602,0,0,1,0,100,0),
(@PATH,50,-8703.396,1513.316,-68.86869,0,0,1,0,100,0),
(@PATH,51,-8699.363,1545.228,-73.52942,0,0,1,0,100,0),
(@PATH,52,-8696.403,1571.755,-83.60843,0,0,1,0,100,0),
(@PATH,53,-8705.782,1534.327,-70.82861,0,0,1,0,100,0),
(@PATH,54,-8684.076,1503.377,-69.9073,0,0,1,0,100,0),
(@PATH,55,-8677.442,1474.101,-69.88051,0,0,1,0,100,0),
(@PATH,56,-8685.396,1458.496,-69.90556,0,0,1,0,100,0),
(@PATH,57,-8672.833,1442.362,-69.90025,0,0,1,0,100,0),
(@PATH,58,-8671.919,1416.88,-69.89809,0,0,1,0,100,0),
(@PATH,59,-8658.405,1396.628,-69.89714,0,0,1,0,100,0),
(@PATH,60,-8652.979,1366.002,-69.89549,0,0,1,0,100,0),
(@PATH,61,-8631.563,1350.226,-69.90196,0,0,1,0,100,0),
(@PATH,62,-8621.747,1329.126,-69.84866,0,0,1,0,100,0),
(@PATH,63,-8600.984,1321.89,-69.9459,0,0,1,0,100,0),
(@PATH,64,-8581.273,1314.304,-68.56961,0,0,1,0,100,0),
(@PATH,65,-8600.984,1321.89,-69.9459,0,0,1,0,100,0),
(@PATH,66,-8621.747,1329.126,-69.84866,0,0,1,0,100,0),
(@PATH,67,-8631.563,1350.226,-69.90196,0,0,1,0,100,0),
(@PATH,68,-8652.979,1366.002,-69.89549,0,0,1,0,100,0),
(@PATH,69,-8658.405,1396.628,-69.89714,0,0,1,0,100,0),
(@PATH,70,-8671.919,1416.88,-69.89809,0,0,1,0,100,0),
(@PATH,71,-8672.833,1442.362,-69.90025,0,0,1,0,100,0),
(@PATH,72,-8685.396,1458.496,-69.90556,0,0,1,0,100,0),
(@PATH,73,-8677.442,1474.101,-69.88051,0,0,1,0,100,0),
(@PATH,74,-8684.076,1503.377,-69.9073,0,0,1,0,100,0),
(@PATH,75,-8705.782,1534.327,-70.82861,0,0,1,0,100,0),
(@PATH,76,-8696.403,1571.755,-83.60843,0,0,1,0,100,0),
(@PATH,77,-8699.363,1545.228,-73.52942,0,0,1,0,100,0),
(@PATH,78,-8703.396,1513.316,-68.86869,0,0,1,0,100,0),
(@PATH,79,-8686.704,1491.772,-69.90602,0,0,1,0,100,0),
(@PATH,80,-8688.043,1466.35,-69.90285,0,0,1,0,100,0),
(@PATH,81,-8690.109,1425.443,-69.89849,0,0,1,0,100,0),
(@PATH,82,-8648.351,1425.724,-69.76824,0,0,1,0,100,0),
(@PATH,83,-8611.396,1441.914,-66.07516,0,0,1,0,100,0),
(@PATH,84,-8613.856,1468.638,-65.51812,0,0,1,0,100,0),
(@PATH,85,-8621.252,1502.585,-68.85918,0,0,1,0,100,0),
(@PATH,86,-8615.41,1527.631,-72.21809,0,0,1,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,87970,6,90,2,21,64),
(@NPC,87971,6,270,2,21,64),
(@NPC,87995,6,360,2,0,0);

-- Pathing for Vekniss Stinger Entry: 15235 'TDB FORMAT'
SET @NPC := 87997;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8632.927,`position_y`=1329.29,`position_z`=-69.79494 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8632.927,`position_y`=1329.29,`position_z`=-69.79494 WHERE `guid`=87972; -- Vekniss Wasp
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8632.927,`position_y`=1329.29,`position_z`=-69.79494 WHERE `guid`=87973; -- Vekniss Wasp
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8632.927,`position_y`=1329.29,`position_z`=-69.79494 WHERE `guid`=87996; -- Qiraji Lasher
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,87972,87973,87996);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(87972,@PATH,0,0,1,0, ''),(87973,@PATH,0,0,1,0, ''),(87996,@PATH,0,0,1,0, '');
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8632.927,1329.29,-69.79494,0,0,1,0,100,0),
(@PATH,2,-8652.701,1333.004,-68.40736,0,0,1,0,100,0),
(@PATH,3,-8680.63,1356.865,-69.12091,0,0,1,0,100,0),
(@PATH,4,-8665.341,1388.947,-69.89678,0,0,1,0,100,0),
(@PATH,5,-8671.486,1426.792,-69.89878,0,0,1,0,100,0),
(@PATH,6,-8697.307,1425.366,-69.90847,0,0,1,0,100,0),
(@PATH,7,-8717.54,1450.804,-70.15675,0,0,1,0,100,0),
(@PATH,8,-8685.707,1480.185,-69.88573,0,0,1,0,100,0),
(@PATH,9,-8687.312,1502.292,-69.90711,0,0,1,0,100,0),
(@PATH,10,-8710.659,1518.567,-69.73161,0,0,1,0,100,0),
(@PATH,11,-8706.653,1553.953,-76.87526,0,0,1,0,100,0),
(@PATH,12,-8693.664,1593.24,-87.52875,0,0,1,0,100,0),
(@PATH,13,-8682.797,1563.556,-79.95404,0,0,1,0,100,0),
(@PATH,14,-8670.129,1531.131,-69.25419,0,0,1,0,100,0),
(@PATH,15,-8650.239,1513.957,-68.97311,0,0,1,0,100,0),
(@PATH,16,-8628.124,1493.124,-68.32035,0,0,1,0,100,0),
(@PATH,17,-8614.616,1451.34,-66.25972,0,0,1,0,100,0),
(@PATH,18,-8606.941,1423.058,-66.755,0,0,1,0,100,0),
(@PATH,19,-8578.108,1397.931,-64.62989,0,0,1,0,100,0),
(@PATH,20,-8581,1380.874,-67.55366,0,0,1,0,100,0),
(@PATH,21,-8606.554,1354.503,-69.90284,0,0,1,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,87972,6,90,2,0,0),
(@NPC,87973,6,270,2,0,0),
(@NPC,87996,6,360,2,0,0);

-- Pathing for Vekniss Stinger Entry: 15235 'TDB FORMAT' 
SET @NPC := 87998;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8602.222,`position_y`=1420.14,`position_z`=-66.16376 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8602.222,`position_y`=1420.14,`position_z`=-66.16376 WHERE `guid`=87974; -- Vekniss Wasp
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8602.222,`position_y`=1420.14,`position_z`=-66.16376 WHERE `guid`=87975; -- Vekniss Wasp
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8602.222,`position_y`=1420.14,`position_z`=-66.16376 WHERE `guid`=87976; -- Vekniss Wasp
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,87974,87975,87976);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(87974,@PATH,0,0,1,0, ''),(87975,@PATH,0,0,1,0, ''),(87976,@PATH,0,0,1,0, '');
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8602.222,1420.14,-66.16376,0,0,1,0,100,0),
(@PATH,2,-8600.822,1382.153,-68.87067,0,0,1,0,100,0),
(@PATH,3,-8579.124,1346.505,-68.48977,0,0,1,0,100,0),
(@PATH,4,-8572.202,1326.875,-67.66993,0,0,1,0,100,0),
(@PATH,5,-8585.142,1302.318,-68.76385,0,0,1,0,100,0),
(@PATH,6,-8619.394,1300.438,-68.81915,0,0,1,0,100,0),
(@PATH,7,-8646.751,1323.468,-68.54993,0,0,1,0,100,0),
(@PATH,8,-8662.735,1341.994,-68.51302,0,0,1,0,100,0),
(@PATH,9,-8690.161,1374.271,-69.59505,0,0,1,0,100,0),
(@PATH,10,-8711.819,1409.641,-69.78663,0,0,1,0,100,0),
(@PATH,11,-8720.594,1446.922,-70.16204,0,0,1,0,100,0),
(@PATH,12,-8720.908,1475.034,-69.86876,0,0,1,0,100,0),
(@PATH,13,-8716.834,1490.991,-69.79664,0,0,1,0,100,0),
(@PATH,14,-8692.722,1513.566,-69.40113,0,0,1,0,100,0),
(@PATH,15,-8657.146,1508.662,-69.40543,0,0,1,0,100,0),
(@PATH,16,-8636.427,1495.452,-69.00857,0,0,1,0,100,0),
(@PATH,17,-8608.235,1466.913,-64.1589,0,0,1,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,87974,6,90,2,0,0),
(@NPC,87975,6,270,2,0,0),
(@NPC,87976,6,360,2,0,0);

-- Fankriss the Unyielding respawn linking
DELETE FROM `linked_respawn` WHERE `linkedGuid`=87911;
INSERT INTO `linked_respawn` (`guid`,`linkedGuid`,`linkType`) VALUES
(87901,87911,0),(87902,87911,0),(87903,87911,0),(87904,87911,0),(87905,87911,0),(87906,87911,0),
(87678,87911,0),(87679,87911,0),(87680,87911,0),(87681,87911,0),(87682,87911,0),(87683,87911,0),
(87685,87911,0),(87686,87911,0),(87687,87911,0),(87688,87911,0),(87689,87911,0),(87690,87911,0),
(87692,87911,0),(87694,87911,0),(87695,87911,0),(87696,87911,0),(87697,87911,0),(87698,87911,0),
(87699,87911,0),(87700,87911,0),(87702,87911,0),(87703,87911,0),(87704,87911,0),(87705,87911,0),
(87706,87911,0),(87707,87911,0),(87708,87911,0),(87710,87911,0),(87711,87911,0),(87712,87911,0),
(87713,87911,0),(87714,87911,0),(87715,87911,0),(87716,87911,0),(87717,87911,0),(87718,87911,0),
(87719,87911,0),(87720,87911,0),(87721,87911,0),(87725,87911,0),(87726,87911,0),(87727,87911,0),
(87728,87911,0),(87729,87911,0),(87730,87911,0),(87731,87911,0),(87732,87911,0),(87733,87911,0),
(87734,87911,0),(87735,87911,0),(87736,87911,0),(87737,87911,0),(87738,87911,0),(87739,87911,0),
(87740,87911,0),(87741,87911,0),(87742,87911,0),(87743,87911,0),(87745,87911,0),(87747,87911,0),
(87748,87911,0),(87749,87911,0),(87750,87911,0),(87751,87911,0),(87752,87911,0),(87753,87911,0),
(87754,87911,0),(87755,87911,0),(87756,87911,0),(87757,87911,0),(87758,87911,0),(87759,87911,0),
(87760,87911,0),(87761,87911,0),(87762,87911,0),(87763,87911,0),(87764,87911,0),(87765,87911,0),
(87767,87911,0),(87770,87911,0),(87772,87911,0),(87774,87911,0),(87776,87911,0),(87777,87911,0),
(87778,87911,0),(87779,87911,0),(87780,87911,0),(87781,87911,0),(87782,87911,0),(87784,87911,0),
(87786,87911,0),(87788,87911,0),(87789,87911,0),(87790,87911,0),(87791,87911,0),(87793,87911,0),
(87794,87911,0),(87795,87911,0),(87797,87911,0),(87799,87911,0),(87800,87911,0),(87801,87911,0),
(87802,87911,0),(87803,87911,0),(87805,87911,0),(87807,87911,0),(87808,87911,0),(87809,87911,0),
(87811,87911,0),(87812,87911,0),(87813,87911,0),(87814,87911,0),(87815,87911,0),(87816,87911,0),
(87817,87911,0),(87818,87911,0),(87819,87911,0),(87820,87911,0),(87821,87911,0),(87822,87911,0),
(87823,87911,0),(87824,87911,0),(87826,87911,0),(87828,87911,0),(87829,87911,0);

-- Princess Huhuran respawn linking
DELETE FROM `linked_respawn` WHERE `linkedGuid`=88014;
INSERT INTO `linked_respawn` (`guid`,`linkedGuid`,`linkType`) VALUES
(87939,88014,0),(87940,88014,0),(87941,88014,0),(87942,88014,0),(87943,88014,0),(87944,88014,0),
(87990,88014,0),(87991,88014,0),(87992,88014,0),(87993,88014,0),(87997,88014,0),(87998,88014,0),
(87962,88014,0),(87963,88014,0),(87964,88014,0),(87965,88014,0),(87966,88014,0),(87967,88014,0),
(87968,88014,0),(87969,88014,0),(87970,88014,0),(87971,88014,0),(87972,88014,0),(87973,88014,0),
(87974,88014,0),(87975,88014,0),(87976,88014,0),(87994,88014,0),(87995,88014,0),(87996,88014,0);

-- Remove underspawning of Qiraji Scarab
DELETE FROM `creature` WHERE `guid` BETWEEN 87572 AND 87594;

-- Qiraji Scarab
SET @CGUID := 144235;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+96;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 15316, 531, 1, 1, -8718.273, 1668.985, -83.24529, 6.276577, 7200, 0, 0),
(@CGUID+1, 15316, 531, 1, 1, -8752.732, 1622.762, -82.50239, 3.85716, 7200, 0, 0),
(@CGUID+2, 15316, 531, 1, 1, -8848.825, 1543.332, -95.77992, 0.3748086, 7200, 0, 0),
(@CGUID+3, 15316, 531, 1, 1, -8852.401, 1221.99, -104.3232, 5.082306, 7200, 0, 0),
(@CGUID+4, 15316, 531, 1, 1, -8856.361, 1231.608, -104.3222, 0.03505083, 7200, 0, 0),
(@CGUID+5, 15316, 531, 1, 1, -8857.818, 1211.251, -104.301, 1.676702, 7200, 0, 0),
(@CGUID+6, 15316, 531, 1, 1, -8861.068, 1221.99, -104.3127, 5.777609, 7200, 0, 0),
(@CGUID+7, 15316, 531, 1, 1, -8861.551, 1424.439, -91.73545, 4.751832, 7200, 0, 0),
(@CGUID+8, 15316, 531, 1, 1, -8861.7, 1215.009, -104.3096, 4.039688, 7200, 0, 0),
(@CGUID+9, 15316, 531, 1, 1, -8895.811, 1440.09, -90.5479, 6.037028, 7200, 0, 0),
(@CGUID+10, 15316, 531, 1, 1, -8903.062, 1233.613, -112.2933, 3.425546, 7200, 0, 0),
(@CGUID+11, 15316, 531, 1, 1, -8913.198, 1239.525, -112.2094, 5.026548, 7200, 0, 0),
(@CGUID+12, 15316, 531, 1, 1, -8914.45, 1228.33, -112.2933, 2.326542, 7200, 0, 0),
(@CGUID+13, 15316, 531, 1, 1, -8915.258, 1169.887, -112.3025, 3.203353, 7200, 0, 0),
(@CGUID+14, 15316, 531, 1, 1, -8915.822, 1271.88, -112.2893, 5.160469, 7200, 0, 0),
(@CGUID+15, 15316, 531, 1, 1, -8916.75, 1288.38, -112.2935, 0.1507932, 7200, 0, 0),
(@CGUID+16, 15316, 531, 1, 1, -8921.445, 1263.286, -112.2916, 1.408914, 7200, 0, 0),
(@CGUID+17, 15316, 531, 1, 1, -8921.779, 1299.67, -112.2189, 6.108652, 7200, 0, 0),
(@CGUID+18, 15316, 531, 1, 1, -8922.732, 1187.455, -112.2936, 5.639871, 7200, 0, 0),
(@CGUID+19, 15316, 531, 1, 1, -8923.949, 1172.429, -112.3033, 5.763388, 7200, 0, 0),
(@CGUID+20, 15316, 531, 1, 1, -8924.408, 1272.34, -112.2882, 5.481043, 7200, 0, 0),
(@CGUID+21, 15316, 531, 1, 1, -8926.774, 1237.892, -112.2923, 2.316605, 7200, 0, 0),
(@CGUID+22, 15316, 531, 1, 1, -8927.355, 1291.111, -112.2965, 2.028318, 7200, 0, 0),
(@CGUID+23, 15316, 531, 1, 1, -8928.101, 1227.168, -112.2921, 3.446646, 7200, 0, 0),
(@CGUID+24, 15316, 531, 1, 1, -8928.22, 1368.938, -104.2533, 0.8451178, 7200, 0, 0),
(@CGUID+25, 15316, 531, 1, 1, -8933.846, 1249.548, -112.2922, 2.21655, 7200, 0, 0),
(@CGUID+26, 15316, 531, 1, 1, -8935.909, 1189.324, -112.2886, 5.859407, 7200, 0, 0),
(@CGUID+27, 15316, 531, 1, 1, -8939.716, 1163.848, -112.2995, 0.5001168, 7200, 0, 0),
(@CGUID+28, 15316, 531, 1, 1, -8942.026, 1261.226, -112.2923, 5.235967, 7200, 0, 0),
(@CGUID+29, 15316, 531, 1, 1, -8943.135, 1192.366, -112.2916, 5.814977, 7200, 0, 0),
(@CGUID+30, 15316, 531, 1, 1, -8951.372, 1274.603, -112.2933, 3.105438, 7200, 0, 0),
(@CGUID+31, 15316, 531, 1, 1, -8960.903, 1280.689, -112.2933, 3.253839, 7200, 0, 0),
(@CGUID+32, 15316, 531, 1, 1, -8962.061, 1269.011, -112.5005, 4.200222, 7200, 0, 0),
(@CGUID+33, 15316, 531, 1, 1, -8964.825, 1240.759, -112.6207, 3.0616, 7200, 0, 0),
(@CGUID+34, 15316, 531, 1, 1, -8966.551, 1207.659, -112.2936, 4.477177, 7200, 0, 0),
(@CGUID+35, 15316, 531, 1, 1, -8968.729, 1325.82, -104.2429, 3.186054, 7200, 0, 0),
(@CGUID+36, 15316, 531, 1, 1, -8972.038, 1214.245, -112.2936, 1.164536, 7200, 0, 0),
(@CGUID+37, 15316, 531, 1, 1, -8972.853, 1276.217, -112.2933, 3.891855, 7200, 0, 0),
(@CGUID+38, 15316, 531, 1, 1, -8974.806, 1226.225, -112.2935, 1.722429, 7200, 0, 0),
(@CGUID+39, 15316, 531, 1, 1, -8977.898, 1320.487, -104.2417, 3.175818, 7200, 0, 0),
(@CGUID+40, 15316, 531, 1, 1, -8981.08, 1223.435, -112.2936, 0.2615982, 7200, 0, 0),
(@CGUID+41, 15316, 531, 1, 1, -8981.135, 1332.209, -104.2538, 5.953023, 7200, 0, 0),
(@CGUID+42, 15316, 531, 1, 1, -8982.36, 1235.153, -112.2919, 1.343902, 7200, 0, 0),
(@CGUID+43, 15316, 531, 1, 1, -8984.571, 1250.385, -112.2913, 5.36409, 7200, 0, 0),
(@CGUID+44, 15316, 531, 1, 1, -8991.225, 1329.982, -104.2318, 3.062955, 7200, 0, 0),
(@CGUID+45, 15316, 531, 1, 1, -8992.072, 1319.728, -104.2388, 3.363478, 7200, 0, 0),
(@CGUID+46, 15316, 531, 1, 1, -9002.667, 1154.327, -104.3145, 6.014025, 7200, 0, 0),
(@CGUID+47, 15316, 531, 1, 1, -9006.724, 1241.467, -112.2903, 1.948067, 7200, 0, 0),
(@CGUID+48, 15316, 531, 1, 1, -9011.103, 1167.529, -104.3195, 1.777823, 7200, 0, 0),
(@CGUID+49, 15316, 531, 1, 1, -9014.963, 1233.01, -112.2952, 3.99794, 7200, 0, 0),
(@CGUID+50, 15316, 531, 1, 1, -9016.687, 1169.943, -104.3132, 3.21999, 7200, 0, 0),
(@CGUID+51, 15316, 531, 1, 1, -9019.488, 1151.87, -104.3178, 4.565871, 7200, 0, 0),
(@CGUID+52, 15316, 531, 1, 1, -9020.327, 1250.439, -112.3019, 3.988241, 7200, 0, 0),
(@CGUID+53, 15316, 531, 1, 1, -9022.727, 1161.319, -104.2895, 2.878046, 7200, 0, 0),
(@CGUID+54, 15316, 531, 1, 1, -9026.855, 1240.548, -112.3019, 4.020616, 7200, 0, 0),
(@CGUID+55, 15316, 531, 1, 1, -9028.263, 1233.39, -112.303, 1.271099, 7200, 0, 0),
(@CGUID+56, 15316, 531, 1, 1, -9032.163, 1322.912, -104.1445, 2.076942, 7200, 0, 0),
(@CGUID+57, 15316, 531, 1, 1, -9041.214, 1418.469, -105.3165, 6.056293, 7200, 0, 0),
(@CGUID+58, 15316, 531, 1, 1, -9043.839, 1352.871, -103.4252, 0.4712389, 7200, 0, 0),
(@CGUID+59, 15316, 531, 1, 1, -9044.052, 1416.098, -105.2357, 5.078908, 7200, 0, 0),
(@CGUID+60, 15316, 531, 1, 1, -9052.255, 1412.902, -105.2205, 2.076942, 7200, 0, 0),
(@CGUID+61, 15316, 531, 1, 1, -9073.752, 1386.457, -107.3353, 0.7195361, 7200, 0, 0),
(@CGUID+62, 15316, 531, 1, 1, -9075.857, 1399.424, -106.766, 0.1396263, 7200, 0, 0),
(@CGUID+63, 15316, 531, 1, 1, -9077.962, 1380.42, -106.7133, 2.485329, 7200, 0, 0),
(@CGUID+64, 15316, 531, 1, 1, -9084.801, 1348.045, -104.9859, 2.426008, 7200, 0, 0),
(@CGUID+65, 15316, 531, 1, 1, -9085.026, 1341.638, -105.1593, 1.099557, 7200, 0, 0),
(@CGUID+66, 15316, 531, 1, 1, -9085.651, 1336.603, -104.9917, 2.395166, 7200, 0, 0),
(@CGUID+67, 15316, 531, 1, 1, -9088.616, 1402.316, -107.2495, 1.026358, 7200, 0, 0),
(@CGUID+68, 15316, 531, 1, 1, -9091.26, 1510.94, -99.81429, 3.543018, 7200, 0, 0),
(@CGUID+69, 15316, 531, 1, 1, -9092.019, 1351.04, -105.4157, 4.974188, 7200, 0, 0),
(@CGUID+70, 15316, 531, 1, 1, -9094.279, 1499.209, -102.2279, 0.6806784, 7200, 0, 0),
(@CGUID+71, 15316, 531, 1, 1, -9095.951, 1507.988, -100.7126, 4.886922, 7200, 0, 0),
(@CGUID+72, 15316, 531, 1, 1, -9098.203, 1357.665, -105.5745, 0.7330383, 7200, 0, 0),
(@CGUID+73, 15316, 531, 1, 1, -9099.199, 1350.561, -105.9741, 6.248279, 7200, 0, 0),
(@CGUID+74, 15316, 531, 1, 1, -9101.524, 1505.308, -100.3417, 1.174368, 7200, 0, 0),
(@CGUID+75, 15316, 531, 1, 1, -9102.322, 1446.374, -105.6202, 1.196755, 7200, 0, 0),
(@CGUID+76, 15316, 531, 1, 1, -9147.428, 1516.564, -94.89061, 1.853269, 7200, 0, 0),
(@CGUID+77, 15316, 531, 1, 1, -9176.505, 1554.577, -83.83012, 5.850253, 7200, 0, 0),
(@CGUID+78, 15316, 531, 1, 1, -9178.145, 1483.475, -96.65578, 3.036873, 7200, 0, 0),
(@CGUID+79, 15316, 531, 1, 1, -9178.386, 1652.744, -64.78233, 4.974188, 7200, 0, 0),
(@CGUID+80, 15316, 531, 1, 1, -9178.485, 1667.534, -60.37609, 1.297821, 7200, 0, 0),
(@CGUID+81, 15316, 531, 1, 1, -9178.765, 1479.855, -97.55507, 1.937315, 7200, 0, 0),
(@CGUID+82, 15316, 531, 1, 1, -9183.195, 1475.588, -98.77051, 2.478368, 7200, 0, 0),
(@CGUID+83, 15316, 531, 1, 1, -9183.288, 1489.488, -95.63787, 4.425344, 7200, 0, 0),
(@CGUID+84, 15316, 531, 1, 1, -9188.178, 1471.158, -99.32278, 5.113815, 7200, 0, 0),
(@CGUID+85, 15316, 531, 1, 1, -9188.786, 1657.487, -64.15721, 4.23883, 7200, 0, 0),
(@CGUID+86, 15316, 531, 1, 1, -9189.339, 1531.628, -85.89825, 6.195919, 7200, 0, 0),
(@CGUID+87, 15316, 531, 1, 1, -9191.104, 1521.98, -87.71062, 5.026548, 7200, 0, 0),
(@CGUID+88, 15316, 531, 1, 1, -9191.532, 1537.507, -84.53267, 5.864306, 7200, 0, 0),
(@CGUID+89, 15316, 531, 1, 1, -9192.622, 1647.297, -65.36017, 3.023633, 7200, 0, 0),
(@CGUID+90, 15316, 531, 1, 1, -9197.758, 1667.534, -61.18479, 1.386884, 7200, 0, 0),
(@CGUID+91, 15316, 531, 1, 1, -9211.669, 1526.513, -86.4464, 3.19899, 7200, 0, 0),
(@CGUID+92, 15316, 531, 1, 1, -9212.579, 1576.334, -75.70084, 1.349625, 7200, 0, 0),
(@CGUID+93, 15316, 531, 1, 1, -9218.398, 1574.924, -76.35339, 0.3938427, 7200, 0, 0),
(@CGUID+94, 15316, 531, 1, 1, -9220.125, 1595.057, -72.45622, 0.8910265, 7200, 0, 0),
(@CGUID+95, 15316, 531, 1, 1, -9225.136, 1585.159, -74.82648, 4.34335, 7200, 0, 0),
(@CGUID+96, 15316, 531, 1, 1, -9235.81, 1588.07, -73.63668, 3.152771, 7200, 0, 0);

-- Qiraji Scorpion
SET @CGUID := 144332;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+84;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 15317, 531, 1, 1, -8767.857, 1577.66, -89.34533, 6.280417, 7200, 0, 0),
(@CGUID+1, 15317, 531, 1, 1, -8822.126, 1500.405, -93.85766, 3.89038, 7200, 0, 0),
(@CGUID+2, 15317, 531, 1, 1, -8863.717, 1188.008, -104.3105, 3.325896, 7200, 0, 0),
(@CGUID+3, 15317, 531, 1, 1, -8864.533, 1179.054, -104.2634, 3.61623, 7200, 0, 0),
(@CGUID+4, 15317, 531, 1, 1, -8868.387, 1219.072, -104.3231, 1.470888, 7200, 0, 0),
(@CGUID+5, 15317, 531, 1, 1, -8874.394, 1204.472, -104.3245, 2.822855, 7200, 0, 0),
(@CGUID+6, 15317, 531, 1, 1, -8875.634, 1184.706, -104.3149, 1.349733, 7200, 0, 0),
(@CGUID+7, 15317, 531, 1, 1, -8889.706, 1263.574, -112.2916, 1.86493, 7200, 0, 0),
(@CGUID+8, 15317, 531, 1, 1, -8896.925, 1271.528, -112.2916, 1.54404, 7200, 0, 0),
(@CGUID+9, 15317, 531, 1, 1, -8902.623, 1258.208, -112.2916, 1.783228, 7200, 0, 0),
(@CGUID+10, 15317, 531, 1, 1, -8907.309, 1264.09, -112.2916, 1.616129, 7200, 0, 0),
(@CGUID+11, 15317, 531, 1, 1, -8907.318, 1215.414, -112.2933, 5.120383, 7200, 0, 0),
(@CGUID+12, 15317, 531, 1, 1, -8909.942, 1288.731, -112.2903, 2.332356, 7200, 0, 0),
(@CGUID+13, 15317, 531, 1, 1, -8910.222, 1210.898, -112.2933, 0.9807646, 7200, 0, 0),
(@CGUID+14, 15317, 531, 1, 1, -8916.438, 1218.511, -112.2933, 1.023647, 7200, 0, 0),
(@CGUID+15, 15317, 531, 1, 1, -8927.608, 1219.249, -112.2919, 3.29309, 7200, 0, 0),
(@CGUID+16, 15317, 531, 1, 1, -8931.669, 1478.098, -92.41454, 4.330824, 7200, 0, 0),
(@CGUID+17, 15317, 531, 1, 1, -8932.62, 1206.902, -112.2916, 1.067478, 7200, 0, 0),
(@CGUID+18, 15317, 531, 1, 1, -8937.341, 1231.81, -112.293, 1.432786, 7200, 0, 0),
(@CGUID+19, 15317, 531, 1, 1, -8941.132, 1183.686, -112.289, 6.190642, 7200, 0, 0),
(@CGUID+20, 15317, 531, 1, 1, -8945.947, 1250.477, -112.2929, 2.542778, 7200, 0, 0),
(@CGUID+21, 15317, 531, 1, 1, -8948.824, 1331.953, -104.2506, 5.926363, 7200, 0, 0),
(@CGUID+22, 15317, 531, 1, 1, -8949.483, 1285.587, -112.21, 6.056293, 7200, 0, 0),
(@CGUID+23, 15317, 531, 1, 1, -8951.337, 1184.432, -112.2916, 5.571285, 7200, 0, 0),
(@CGUID+24, 15317, 531, 1, 1, -8951.586, 1472.797, -92.3147, 1.302438, 7200, 0, 0),
(@CGUID+25, 15317, 531, 1, 1, -8951.589, 1211.099, -112.2927, 1.28833, 7200, 0, 0),
(@CGUID+26, 15317, 531, 1, 1, -8952.454, 1166.542, -112.3003, 0.01904146, 7200, 0, 0),
(@CGUID+27, 15317, 531, 1, 1, -8953.988, 1344.636, -104.2234, 0.5719893, 7200, 0, 0),
(@CGUID+28, 15317, 531, 1, 1, -8955.576, 1230.115, -112.6207, 1.36077, 7200, 0, 0),
(@CGUID+29, 15317, 531, 1, 1, -8958.938, 1321.819, -104.2457, 5.784297, 7200, 0, 0),
(@CGUID+30, 15317, 531, 1, 1, -8960.115, 1254.93, -112.2935, 5.113963, 7200, 0, 0),
(@CGUID+31, 15317, 531, 1, 1, -8960.776, 1262.318, -112.2936, 3.113808, 7200, 0, 0),
(@CGUID+32, 15317, 531, 1, 1, -8961.691, 1200.368, -112.2923, 1.925909, 7200, 0, 0),
(@CGUID+33, 15317, 531, 1, 1, -8965.124, 1164.983, -112.2994, 0.2619652, 7200, 0, 0),
(@CGUID+34, 15317, 531, 1, 1, -8965.508, 1178.931, -112.2083, 4.729842, 7200, 0, 0),
(@CGUID+35, 15317, 531, 1, 1, -8966.613, 1337.695, -104.2513, 2.703376, 7200, 0, 0),
(@CGUID+36, 15317, 531, 1, 1, -8973.95, 1265.45, -112.2938, 1.584118, 7200, 0, 0),
(@CGUID+37, 15317, 531, 1, 1, -8977.52, 1266.341, -112.2916, 5.713685, 7200, 0, 0),
(@CGUID+38, 15317, 531, 1, 1, -8978.57, 1198.204, -112.2933, 2.00547, 7200, 0, 0),
(@CGUID+39, 15317, 531, 1, 1, -8984.783, 1209.762, -112.2933, 3.727343, 7200, 0, 0),
(@CGUID+40, 15317, 531, 1, 1, -8989.297, 1202.465, -112.2933, 5.423434, 7200, 0, 0),
(@CGUID+41, 15317, 531, 1, 1, -8992.732, 1212.768, -112.2933, 6.098367, 7200, 0, 0),
(@CGUID+42, 15317, 531, 1, 1, -8996.319, 1224.411, -112.2871, 3.1986, 7200, 0, 0),
(@CGUID+43, 15317, 531, 1, 1, -8996.775, 1272.687, -112.2916, 1.227572, 7200, 0, 0),
(@CGUID+44, 15317, 531, 1, 1, -9002.565, 1324.533, -104.2338, 2.005882, 7200, 0, 0),
(@CGUID+45, 15317, 531, 1, 1, -9005.325, 1249.047, -112.2889, 5.861159, 7200, 0, 0),
(@CGUID+46, 15317, 531, 1, 1, -9009.533, 1273.289, -112.3006, 0.9313107, 7200, 0, 0),
(@CGUID+47, 15317, 531, 1, 1, -9014.954, 1261.934, -112.3012, 1.054686, 7200, 0, 0),
(@CGUID+48, 15317, 531, 1, 1, -9020.213, 1262.013, -112.2994, 4.35212, 7200, 0, 0),
(@CGUID+49, 15317, 531, 1, 1, -9026.252, 1184.02, -104.3176, 2.335238, 7200, 0, 0),
(@CGUID+50, 15317, 531, 1, 1, -9029.824, 1168.414, -104.2877, 5.261246, 7200, 0, 0),
(@CGUID+51, 15317, 531, 1, 1, -9034.853, 1195.079, -104.3191, 5.497178, 7200, 0, 0),
(@CGUID+52, 15317, 531, 1, 1, -9044.638, 1179.075, -104.2623, 4.273608, 7200, 0, 0),
(@CGUID+53, 15317, 531, 1, 1, -9045.368, 1426.71, -106.2691, 4.956735, 7200, 0, 0),
(@CGUID+54, 15317, 531, 1, 1, -9045.752, 1189.078, -104.2579, 1.568065, 7200, 0, 0),
(@CGUID+55, 15317, 531, 1, 1, -9048.547, 1421.894, -106.3411, 0.05235988, 7200, 0, 0),
(@CGUID+56, 15317, 531, 1, 1, -9054.128, 1419.324, -106.088, 3.316126, 7200, 0, 0),
(@CGUID+57, 15317, 531, 1, 1, -9063.941, 1432.531, -107.3954, 6.056363, 7200, 0, 0),
(@CGUID+58, 15317, 531, 1, 1, -9064.931, 1387.491, -106.5863, 4.276057, 7200, 0, 0),
(@CGUID+59, 15317, 531, 1, 1, -9075.902, 1395.459, -106.8902, 0.5061455, 7200, 0, 0),
(@CGUID+60, 15317, 531, 1, 1, -9081.571, 1399.585, -107.172, 5.270895, 7200, 0, 0),
(@CGUID+61, 15317, 531, 1, 1, -9082.262, 1393.761, -107.1919, 0.1741033, 7200, 0, 0),
(@CGUID+62, 15317, 531, 1, 1, -9086.603, 1497.652, -102.6972, 3.385939, 7200, 0, 0),
(@CGUID+63, 15317, 531, 1, 1, -9087.264, 1506.401, -100.6753, 2.617994, 7200, 0, 0),
(@CGUID+64, 15317, 531, 1, 1, -9090.989, 1356.731, -105.0189, 3.124139, 7200, 0, 0),
(@CGUID+65, 15317, 531, 1, 1, -9091.271, 1492.376, -103.3976, 5.742133, 7200, 0, 0),
(@CGUID+66, 15317, 531, 1, 1, -9091.804, 1342.174, -105.5085, 5.340707, 7200, 0, 0),
(@CGUID+67, 15317, 531, 1, 1, -9098.125, 1447.736, -104.3787, 2.112744, 7200, 0, 0),
(@CGUID+68, 15317, 531, 1, 1, -9098.346, 1364.72, -105.1836, 2.565634, 7200, 0, 0),
(@CGUID+69, 15317, 531, 1, 1, -9099.76, 1498.805, -101.7028, 1.471863, 7200, 0, 0),
(@CGUID+70, 15317, 531, 1, 1, -9103.596, 1357.07, -106.0872, 4.729842, 7200, 0, 0),
(@CGUID+71, 15317, 531, 1, 1, -9105.113, 1363.609, -105.8369, 3.787364, 7200, 0, 0),
(@CGUID+72, 15317, 531, 1, 1, -9126.784, 1462.199, -104.2633, 0.7992821, 7200, 0, 0),
(@CGUID+73, 15317, 531, 1, 1, -9172.644, 1542.289, -87.25746, 4.763266, 7200, 0, 0),
(@CGUID+74, 15317, 531, 1, 1, -9177.08, 1683.528, -54.50222, 0.04849045, 7200, 0, 0),
(@CGUID+75, 15317, 531, 1, 1, -9183.351, 1644.611, -67.06108, 2.327298, 7200, 0, 0),
(@CGUID+76, 15317, 531, 1, 1, -9187.728, 1680.688, -57.8031, 5.651324, 7200, 0, 0),
(@CGUID+77, 15317, 531, 1, 1, -9190.996, 1674.806, -59.74267, 3.410446, 7200, 0, 0),
(@CGUID+78, 15317, 531, 1, 1, -9193.495, 1691.111, -54.63859, 3.411577, 7200, 0, 0),
(@CGUID+79, 15317, 531, 1, 1, -9197.91, 1677.646, -59.01847, 5.331757, 7200, 0, 0),
(@CGUID+80, 15317, 531, 1, 1, -9200.417, 1565.645, -78.08263, 3.682645, 7200, 0, 0),
(@CGUID+81, 15317, 531, 1, 1, -9215.096, 1566.989, -77.65082, 4.193158, 7200, 0, 0),
(@CGUID+82, 15317, 531, 1, 1, -9215.519, 1556.678, -79.77057, 3.495375, 7200, 0, 0),
(@CGUID+83, 15317, 531, 1, 1, -9223.643, 1562.967, -78.591, 0.9200022, 7200, 0, 0),
(@CGUID+84, 15317, 531, 1, 1, -9231.377, 1566.911, -77.66441, 5.653526, 7200, 0, 0);
 
 
/* 
* sql\updates\world\2015_10_14_05_world.sql 
*/ 
-- Meteorite Crystal
UPDATE `spell_proc_event` SET `ppmRate`=0 WHERE `entry`=64999;
 
 
/* 
* sql\updates\world\2015_10_14_06_world.sql 
*/ 
--
UPDATE `waypoints` SET `position_z`=489.640110 WHERE `entry`=15491 AND `pointid`=3;
UPDATE `creature_template` SET `InhabitType`=6 WHERE `entry`=15491;
DELETE FROM `smart_scripts` WHERE `entryorguid`=15491 AND `source_type`=0 AND `id`>38;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(15491,0,39,0,40,0,100,0,3,15491,0,0,91,2,3,0,0,0,0,1,0,0,0,0,0,0,0,"Eranikus, Tyrant of the Dream - On Waypoint 3 Reached - Remove Flag Hover"),
(15491,0,40,0,54,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Eranikus, Tyrant of the Dream - On Just summoned - Set unitflag"),
(15491,0,41,0,40,0,100,0,4,15491,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Eranikus, Tyrant of the Dream - On Waypoint 4 Reached - Remove unitflag");
 
 
/* 
* sql\updates\world\2015_10_14_07_world.sql 
*/ 
-- AQ20 Full Respawn, Full Pathing **** 355 & 434 & 6XX ****
SET @CGUID := 144417;
DELETE FROM `creature` WHERE `map`=509;
DELETE FROM `linked_respawn` WHERE `guid` BETWEEN 61988 AND 61993;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+383;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 4076, 509, 1, 1, -8557.875, 1475.61, 32.09278, 0.3173114, 7200, 10, 1), -- Roach
(@CGUID+1, 4076, 509, 1, 1, -8578.957, 1562.631, 38.3445, 2.08301, 7200, 10, 1), -- Roach
(@CGUID+2, 4076, 509, 1, 1, -8670.483, 1374.597, 32.03201, 3.178652, 7200, 10, 1), -- Roach
(@CGUID+3, 4076, 509, 1, 1, -8764.862, 1637.767, 21.83943, 1.083136, 7200, 10, 1), -- Roach
(@CGUID+4, 4076, 509, 1, 1, -8839.453, 2198.035, 21.48637, 3.546741, 7200, 10, 1), -- Roach
(@CGUID+5, 4076, 509, 1, 1, -8879.403, 1635.506, 21.51133, 0.4385682, 7200, 10, 1), -- Roach
(@CGUID+6, 4076, 509, 1, 1, -8895.27, 1739.468, 21.59288, 3.728892, 7200, 10, 1), -- Roach
(@CGUID+7, 4076, 509, 1, 1, -8958.73, 1640.258, 29.74357, 3.461734, 7200, 10, 1), -- Roach
(@CGUID+8, 4076, 509, 1, 1, -8993.171, 2054.444, 24.64812, 0.330403, 7200, 10, 1), -- Roach
(@CGUID+9, 4076, 509, 1, 1, -9007.328, 1625.977, 31.00255, 2.55359, 7200, 10, 1), -- Roach
(@CGUID+10, 4076, 509, 1, 1, -9159.453, 1308.013, 21.74607, 0.6927378, 7200, 10, 1), -- Roach
(@CGUID+11, 4076, 509, 1, 1, -9330.007, 1187.867, 21.52394, 5.304915, 7200, 10, 1), -- Roach
(@CGUID+12, 4076, 509, 1, 1, -9447.224, 1341.093, 21.44869, 3.252343, 7200, 10, 1), -- Roach
(@CGUID+13, 15168, 509, 1, 1, -8523.959, 1468.174, 32.73527, 2.546548, 7200, 5, 1), -- Vile Scarab
(@CGUID+14, 15168, 509, 1, 1, -8556.954, 1410.153, 32.13479, 4.098383, 7200, 5, 1), -- Vile Scarab
(@CGUID+15, 15168, 509, 1, 1, -8577.19, 1449.547, 32.29018, 0.351546, 7200, 5, 1), -- Vile Scarab
(@CGUID+16, 15168, 509, 1, 1, -8585.965, 1341.191, 34.02468, 6.263584, 7200, 5, 1), -- Vile Scarab
(@CGUID+17, 15168, 509, 1, 1, -8605.016, 1599.756, 32.03201, 2.771847, 7200, 5, 1), -- Vile Scarab
(@CGUID+18, 15168, 509, 1, 1, -8610.068, 1357.368, 32.42776, 6.232846, 7200, 5, 1), -- Vile Scarab
(@CGUID+19, 15168, 509, 1, 1, -8645.912, 1430.941, 32.48993, 4.987458, 7200, 5, 1), -- Vile Scarab
(@CGUID+20, 15168, 509, 1, 1, -8659.348, 1666.773, 21.51167, 2.910921, 7200, 5, 1), -- Vile Scarab
(@CGUID+21, 15168, 509, 1, 1, -8661.099, 1559.783, 32.03201, 5.295803, 7200, 5, 1), -- Vile Scarab
(@CGUID+22, 15168, 509, 1, 1, -8694.207, 1489.305, 32.14948, 3.348807, 7200, 5, 1), -- Vile Scarab
(@CGUID+23, 15168, 509, 1, 1, -8732.676, 1399.609, 32.53547, 3.420845, 7200, 5, 1), -- Vile Scarab
(@CGUID+24, 15168, 509, 1, 1, -8733.768, 1600.124, 21.46972, 3.246312, 7200, 5, 1), -- Vile Scarab
(@CGUID+25, 15168, 509, 1, 1, -8785.252, 2009.173, 21.46967, 3.001966, 7200, 5, 1), -- Vile Scarab
(@CGUID+26, 15168, 509, 1, 1, -8792.841, 2131.115, 21.46975, 5.183628, 7200, 5, 1), -- Vile Scarab
(@CGUID+27, 15168, 509, 1, 1, -8848.906, 1845.958, 21.46968, 2.059489, 7200, 5, 1), -- Vile Scarab
(@CGUID+28, 15168, 509, 1, 1, -8917.903, 1547.614, 21.46967, 0.9948376, 7200, 5, 1), -- Vile Scarab
(@CGUID+29, 15168, 509, 1, 1, -8978.44, 2101.632, 21.46971, 0.3665192, 7200, 5, 1), -- Vile Scarab
(@CGUID+30, 15168, 509, 1, 1, -8994.842, 1916.528, 21.46968, 5.5676, 7200, 5, 1), -- Vile Scarab
(@CGUID+31, 15168, 509, 1, 1, -9000.707, 1700.101, 21.57215, 4.433136, 7200, 5, 1), -- Vile Scarab
(@CGUID+32, 15168, 509, 1, 1, -9058.105, 2159.35, 21.46968, 4.363323, 7200, 5, 1), -- Vile Scarab
(@CGUID+33, 15168, 509, 1, 1, -9066.019, 1733.488, 21.53086, 3.246312, 7200, 5, 1), -- Vile Scarab
(@CGUID+34, 15168, 509, 1, 1, -9211.341, 1432.979, 21.46969, 4.014257, 7200, 5, 1), -- Vile Scarab
(@CGUID+35, 15318, 509, 1, 1, -9489.848, 1372.825, 21.59988, 4.380776, 7200, 5, 1), -- Hive'Zara Drone
(@CGUID+36, 15318, 509, 1, 1, -9524.376, 1383.685, 21.51131, 1.03884, 7200, 5, 1), -- Hive'Zara Drone
(@CGUID+37, 15318, 509, 1, 1, -9574.348, 1484.254, 22.76791, 1.781548, 7200, 5, 1), -- Hive'Zara Drone
(@CGUID+38, 15318, 509, 1, 1, -9578.559, 1506.852, 21.73697, 3.014219, 7200, 5, 1), -- Hive'Zara Drone
(@CGUID+39, 15318, 509, 1, 1, -9580.178, 1381.902, 23.9498, 1.777291, 7200, 5, 1), -- Hive'Zara Drone
(@CGUID+40, 15318, 509, 1, 1, -9592.439, 1388.404, 25.74436, 2.019479, 7200, 5, 1), -- Hive'Zara Drone
(@CGUID+41, 15319, 509, 1, 1, -9479.979, 1370.798, 23.41084, 1.989675, 7200, 5, 1), -- Hive'Zara Collector
(@CGUID+42, 15319, 509, 1, 1, -9511.272, 1386.067, 21.51131, 0.1170127, 7200, 5, 1), -- Hive'Zara Collector
(@CGUID+43, 15319, 509, 1, 1, -9571.893, 1493.507, 21.54095, 2.293517, 7200, 5, 1), -- Hive'Zara Collector
(@CGUID+44, 15319, 509, 1, 1, -9580.605, 1480.182, 22.21877, 4.90255, 7200, 5, 1), -- Hive'Zara Collector
(@CGUID+45, 15319, 509, 1, 1, -9589.697, 1407.815, 21.51132, 0.6980565, 7200, 5, 1), -- Hive'Zara Collector
(@CGUID+46, 15319, 509, 1, 1, -9592.67, 1425.937, 21.63632, 2.661848, 7200, 5, 1), -- Hive'Zara Collector
(@CGUID+47, 15320, 509, 1, 1, -9141.966, 1292.707, 21.46963, 1.710423, 7200, 5, 1), -- Hive'Zara Soldier
(@CGUID+48, 15320, 509, 1, 1, -9149.69, 1284.749, 21.46964, 0.5061455, 7200, 5, 1), -- Hive'Zara Soldier
(@CGUID+49, 15320, 509, 1, 1, -9187.016, 1463.765, 21.46968, 1.186824, 7200, 5, 1), -- Hive'Zara Soldier
(@CGUID+50, 15320, 509, 1, 1, -9224.242, 1384.024, 21.46967, 3.193953, 7200, 5, 1), -- Hive'Zara Soldier
(@CGUID+51, 15320, 509, 1, 1, -9236.348, 1396.04, 21.46967, 2.513274, 7200, 5, 1), -- Hive'Zara Soldier
(@CGUID+52, 15320, 509, 1, 1, -9315.232, 1380.299, 21.50587, 5.462881, 7200, 5, 1), -- Hive'Zara Soldier
(@CGUID+53, 15320, 509, 1, 1, -9340.127, 1210.839, 21.4696, 5.340707, 7200, 5, 1), -- Hive'Zara Soldier
(@CGUID+54, 15320, 509, 1, 1, -9386.74, 1393.283, 21.46968, 2.076942, 7200, 5, 1), -- Hive'Zara Soldier
(@CGUID+55, 15320, 509, 1, 1, -9395.24, 1388.353, 21.38681, 0.4920194, 7200, 5, 1), -- Hive'Zara Soldier
(@CGUID+56, 15323, 509, 1, 1, -9154.134, 1292.979, 21.46964, 4.276057, 7200, 5, 1), -- Hive'Zara Sandstalker
(@CGUID+57, 15323, 509, 1, 1, -9189.154, 1452.477, 21.52919, 2.059489, 7200, 5, 1), -- Hive'Zara Sandstalker
(@CGUID+58, 15323, 509, 1, 1, -9199.545, 1464.198, 21.48786, 2.70526, 7200, 5, 1), -- Hive'Zara Sandstalker
(@CGUID+59, 15323, 509, 1, 1, -9231.433, 1386.642, 21.46967, 0.4363323, 7200, 5, 1), -- Hive'Zara Sandstalker
(@CGUID+60, 15323, 509, 1, 1, -9301.522, 1385.101, 21.46969, 5.67232, 7200, 5, 1), -- Hive'Zara Sandstalker
(@CGUID+61, 15323, 509, 1, 1, -9311.369, 1389.395, 21.50966, 5.532694, 7200, 5, 1), -- Hive'Zara Sandstalker
(@CGUID+62, 15323, 509, 1, 1, -9353.457, 1204.119, 21.85404, 4.13643, 7200, 5, 1), -- Hive'Zara Sandstalker
(@CGUID+63, 15323, 509, 1, 1, -9359.12, 1217.685, 21.46961, 3.124139, 7200, 5, 1), -- Hive'Zara Sandstalker
(@CGUID+64, 15323, 509, 1, 1, -9379.337, 1401.022, 21.47204, 3.316126, 7200, 5, 1), -- Hive'Zara Sandstalker
(@CGUID+65, 15324, 509, 1, 1, -8517.444, 1505.661, 33.36475, 0.8377581, 7200, 0, 0), -- Qiraji Gladiator
(@CGUID+66, 15324, 509, 1, 1, -8531.854, 1515.689, 33.26437, 0.7679449, 7200, 0, 0), -- Qiraji Gladiator
(@CGUID+67, 15324, 509, 1, 1, -8693.788, 1565.823, 31.99034, 5.358161, 7200, 0, 0), -- Qiraji Gladiator
(@CGUID+68, 15324, 509, 1, 1, -8706.146, 1552.285, 31.99034, 5.410521, 7200, 0, 0), -- Qiraji Gladiator
(@CGUID+69, 15324, 509, 1, 1, -9053.818, 1664.356, 22.9385, 3.996804, 7200, 0, 0), -- Qiraji Gladiator
(@CGUID+70, 15324, 509, 1, 1, -9067.317, 1673.464, 23.0715, 4.310963, 7200, 0, 0), -- Qiraji Gladiator
(@CGUID+71, 15324, 509, 1, 1, -9148.94, 1510.32, 21.99232, 0.9424778, 7200, 0, 0), -- Qiraji Gladiator
(@CGUID+72, 15324, 509, 1, 1, -9162.49, 1518.798, 22.7809, 0.2268928, 7200, 0, 0), -- Qiraji Gladiator
(@CGUID+73, 15325, 509, 1, 1, -8515.021, 1397.78, 32.29177, 4.820597, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+74, 15325, 509, 1, 1, -8524.704, 1395.719, 31.98318, 5.121015, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+75, 15325, 509, 1, 1, -8535.219, 1424.391, 32.03201, 5.229107, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+76, 15325, 509, 1, 1, -8544.961, 1422.634, 32.03201, 5.260347, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+77, 15325, 509, 1, 1, -8639.566, 1345.902, 32.3508, 3.251172, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+78, 15325, 509, 1, 1, -8640.774, 1355.726, 32.31917, 3.251222, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+79, 15325, 509, 1, 1, -8654.444, 1491.354, 32.0958, 1.829467, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+80, 15325, 509, 1, 1, -8660.053, 1491.356, 32.18204, 2.223871, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+81, 15325, 509, 1, 1, -8660.561, 1414.245, 32.65175, 1.890694, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+82, 15325, 509, 1, 1, -8666.813, 1407.651, 32.03201, 2.012179, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+83, 15325, 509, 1, 1, -8695.072, 1455.611, 32.48226, 3.809897, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+84, 15325, 509, 1, 1, -8700.693, 1463.633, 33.78428, 3.815571, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+85, 15325, 509, 1, 1, -8743.022, 1607.379, 21.61758, 3.693705, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+86, 15325, 509, 1, 1, -8747.875, 1615.742, 21.87457, 3.717672, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+87, 15325, 509, 1, 1, -8752.388, 1622.344, 21.76074, 4.628274, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+88, 15325, 509, 1, 1, -8761.905, 1621.611, 21.83998, 4.671357, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+89, 15325, 509, 1, 1, -8773.826, 1640.988, 21.80477, 2.381759, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+90, 15325, 509, 1, 1, -8780.559, 1633.73, 21.72563, 2.381759, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+91, 15325, 509, 1, 1, -8816.079, 1599.633, 21.46869, 3.29854, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+92, 15325, 509, 1, 1, -8817.565, 1609.256, 20.37871, 3.284594, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+93, 15325, 509, 1, 1, -9586.802, 1602.671, 21.51135, 6.242362, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+94, 15325, 509, 1, 1, -9590.834, 1600.473, 21.51135, 0.05669658, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+95, 15325, 509, 1, 1, -9593.194, 1594.593, 21.55599, 1.229132, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+96, 15325, 509, 1, 1, -9606.353, 1571.422, 22.01131, 0.2620987, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+97, 15325, 509, 1, 1, -9607.973, 1606.99, 21.60341, 0.9448448, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+98, 15325, 509, 1, 1, -9608.446, 1563.199, 21.65768, 0.1963355, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+99, 15325, 509, 1, 1, -9609.348, 1615.344, 21.79114, 0.9476151, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+100, 15325, 509, 1, 1, -9610.393, 1610.891, 21.60728, 0.9449909, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+101, 15325, 509, 1, 1, -9649.376, 1648.167, 21.52642, 1.862836, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+102, 15325, 509, 1, 1, -9653.988, 1648.745, 21.59047, 1.866604, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+103, 15325, 509, 1, 1, -9656.947, 1652.301, 21.52642, 1.870413, 7200, 0, 0), -- Hive'Zara Wasp
(@CGUID+104, 15327, 509, 1, 1, -8521.604, 1377.789, 34.2847, 4.518502, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+105, 15327, 509, 1, 1, -8538.28, 1413.481, 32.03201, 4.890828, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+106, 15327, 509, 1, 1, -8654.492, 1349.237, 32.22055, 0.1095644, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+107, 15327, 509, 1, 1, -8660.443, 1499.997, 32.17234, 2.224768, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+108, 15327, 509, 1, 1, -8667.888, 1419.82, 32.11544, 1.778565, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+109, 15327, 509, 1, 1, -8705.161, 1452.156, 33.72097, 3.983237, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+110, 15327, 509, 1, 1, -8750.896, 1607.642, 22.07515, 3.82532, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+111, 15327, 509, 1, 1, -8758.171, 1609.758, 21.96272, 4.207295, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+112, 15327, 509, 1, 1, -8787.256, 1646.833, 22.81458, 2.358341, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+113, 15327, 509, 1, 1, -8822.804, 1603.601, 21.43074, 3.162875, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+114, 15327, 509, 1, 1, -9578.752, 1590.721, 21.58902, 5.604074, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+115, 15327, 509, 1, 1, -9582.396, 1601.374, 21.63635, 6.097988, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+116, 15327, 509, 1, 1, -9590.949, 1573.593, 21.64739, 0.5360234, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+117, 15327, 509, 1, 1, -9592.131, 1596.068, 21.52306, 0.03750357, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+118, 15327, 509, 1, 1, -9603.499, 1605.943, 21.51134, 0.9452588, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+119, 15327, 509, 1, 1, -9604.769, 1560.449, 21.63631, 0.2232969, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+120, 15327, 509, 1, 1, -9623.114, 1586.583, 21.88172, 0.9226059, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+121, 15327, 509, 1, 1, -9637.552, 1612.699, 21.51152, 1.132231, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+122, 15327, 509, 1, 1, -9643.36, 1625.865, 21.68241, 1.686941, 7200, 0, 0), -- Hive'Zara Stinger
(@CGUID+123, 15333, 509, 1, 1, -9450.053, 1422.016, 28.19568, 5.704928, 7200, 10, 1), -- Silicate Feeder
(@CGUID+124, 15333, 509, 1, 1, -9452.668, 1483.815, 22.87595, 1.221858, 7200, 10, 1), -- Silicate Feeder
(@CGUID+125, 15333, 509, 1, 1, -9454.068, 1451.504, 21.53237, 0.4250475, 7200, 10, 1), -- Silicate Feeder
(@CGUID+126, 15333, 509, 1, 1, -9483.096, 1476.489, 21.51131, 4.546051, 7200, 10, 1), -- Silicate Feeder
(@CGUID+127, 15333, 509, 1, 1, -9485.433, 1454.96, 21.51132, 1.341279, 7200, 10, 1), -- Silicate Feeder
(@CGUID+128, 15333, 509, 1, 1, -9491.116, 1377.249, 21.51131, 4.68092, 7200, 10, 1), -- Silicate Feeder
(@CGUID+129, 15333, 509, 1, 1, -9491.985, 1360.045, 21.51132, 1.734773, 7200, 10, 1), -- Silicate Feeder
(@CGUID+130, 15333, 509, 1, 1, -9505.238, 1333.173, 21.51132, 0.5689664, 7200, 10, 1), -- Silicate Feeder
(@CGUID+131, 15333, 509, 1, 1, -9508.66, 1373.73, 21.58461, 6.189344, 7200, 10, 1), -- Silicate Feeder
(@CGUID+132, 15333, 509, 1, 1, -9511.469, 1481.016, 22.00921, 1.69612, 7200, 10, 1), -- Silicate Feeder
(@CGUID+133, 15333, 509, 1, 1, -9512.081, 1354.932, 21.62411, 0.05311435, 7200, 10, 1), -- Silicate Feeder
(@CGUID+134, 15333, 509, 1, 1, -9520.733, 1456.67, 21.51132, 2.629578, 7200, 10, 1), -- Silicate Feeder
(@CGUID+135, 15333, 509, 1, 1, -9544.545, 1392.073, 21.51131, 0.8189642, 7200, 10, 1), -- Silicate Feeder
(@CGUID+136, 15333, 509, 1, 1, -9551.313, 1411.539, 21.51131, 3.517841, 7200, 10, 1), -- Silicate Feeder
(@CGUID+137, 15333, 509, 1, 1, -9559.898, 1520.136, 21.51131, 3.08167, 7200, 10, 1), -- Silicate Feeder
(@CGUID+138, 15333, 509, 1, 1, -9576.01, 1517.689, 21.53801, 2.500756, 7200, 10, 1), -- Silicate Feeder
(@CGUID+139, 15333, 509, 1, 1, -9581.107, 1420.726, 21.51132, 0.9606542, 7200, 10, 1), -- Silicate Feeder
(@CGUID+140, 15333, 509, 1, 1, -9581.575, 1491.29, 21.51131, 1.228613, 7200, 10, 1), -- Silicate Feeder
(@CGUID+141, 15333, 509, 1, 1, -9581.714, 1578.228, 21.64806, 3.731387, 7200, 10, 1), -- Silicate Feeder
(@CGUID+142, 15333, 509, 1, 1, -9582.215, 1391.218, 22.1015, 3.665587, 7200, 10, 1), -- Silicate Feeder
(@CGUID+143, 15333, 509, 1, 1, -9583.522, 1554.888, 21.58274, 2.520709, 7200, 10, 1), -- Silicate Feeder
(@CGUID+144, 15333, 509, 1, 1, -9586.859, 1644.306, 21.83975, 5.548194, 7200, 10, 1), -- Silicate Feeder
(@CGUID+145, 15333, 509, 1, 1, -9588.4, 1609.687, 22.03196, 4.592999, 7200, 10, 1), -- Silicate Feeder
(@CGUID+146, 15333, 509, 1, 1, -9589.72, 1442.263, 21.63682, 5.89996, 7200, 10, 1), -- Silicate Feeder
(@CGUID+147, 15333, 509, 1, 1, -9607.79, 1461.607, 22.79347, 3.408359, 7200, 10, 1), -- Silicate Feeder
(@CGUID+148, 15333, 509, 1, 1, -9610.552, 1614.562, 21.88635, 0.1637974, 7200, 10, 1), -- Silicate Feeder
(@CGUID+149, 15333, 509, 1, 1, -9612.232, 1582.742, 21.88631, 1.648435, 7200, 10, 1), -- Silicate Feeder
(@CGUID+150, 15333, 509, 1, 1, -9612.367, 1642.575, 21.51134, 5.734612, 7200, 10, 1), -- Silicate Feeder
(@CGUID+151, 15333, 509, 1, 1, -9612.531, 1553.086, 21.51131, 5.839962, 7200, 10, 1), -- Silicate Feeder
(@CGUID+152, 15333, 509, 1, 1, -9645.53, 1619.285, 22.01152, 1.771511, 7200, 10, 1), -- Silicate Feeder
(@CGUID+153, 15333, 509, 1, 1, -9647.195, 1651.031, 21.65448, 0.9608645, 7200, 10, 1), -- Silicate Feeder
(@CGUID+154, 15333, 509, 1, 1, -9653.326, 1673.394, 22.09751, 3.574276, 7200, 10, 1), -- Silicate Feeder
(@CGUID+155, 15333, 509, 1, 1, -9654.614, 1553.397, 21.51586, 3.283447, 7200, 10, 1), -- Silicate Feeder
(@CGUID+156, 15333, 509, 1, 1, -9656.288, 1585.146, 21.62086, 2.682987, 7200, 10, 1), -- Silicate Feeder
(@CGUID+157, 15333, 509, 1, 1, -9674.635, 1580.351, 21.51132, 6.094749, 7200, 10, 1), -- Silicate Feeder
(@CGUID+158, 15333, 509, 1, 1, -9675.218, 1611.29, 21.51152, 4.639176, 7200, 10, 1), -- Silicate Feeder
(@CGUID+159, 15333, 509, 1, 1, -9675.699, 1652.324, 21.51187, 3.384236, 7200, 10, 1), -- Silicate Feeder
(@CGUID+160, 15333, 509, 1, 1, -9681.588, 1551.112, 21.56898, 1.922503, 7200, 10, 1), -- Silicate Feeder
(@CGUID+161, 15333, 509, 1, 1, -9721.058, 1484.207, 21.63279, 4.123934, 7200, 10, 1), -- Silicate Feeder
(@CGUID+162, 15333, 509, 1, 1, -9740.685, 1486.821, 22.87148, 0.6774856, 7200, 10, 1), -- Silicate Feeder
(@CGUID+163, 15333, 509, 1, 1, -9746.62, 1514.349, 22.26016, 5.49662, 7200, 10, 1), -- Silicate Feeder
(@CGUID+164, 15335, 509, 1, 1, -8962.963, 1649.652, 24.11304, 0.4845064, 7200, 0, 0), -- Flesh Hunter
(@CGUID+165, 15335, 509, 1, 1, -9082.635, 2149.024, 23.20904, 5.902679, 7200, 0, 0), -- Flesh Hunter
(@CGUID+166, 15335, 509, 1, 1, -9305.492, 1403.459, 25.60786, 2.159173, 7200, 0, 0), -- Flesh Hunter
(@CGUID+167, 15335, 509, 1, 1, -9456.793, 1296.307, 22.1249, 1.87437, 7200, 0, 0), -- Flesh Hunter
(@CGUID+168, 15335, 509, 1, 1, -9328.003, 1298.321, -64.24252, 0.2443461, 7200, 5, 1), -- Flesh Hunter
(@CGUID+169, 15336, 509, 1, 1, -9494.096, 1385.02, 21.46964, 2.268928, 7200, 5, 1), -- Hive'Zara Tail Lasher
(@CGUID+170, 15336, 509, 1, 1, -9503.87, 1392.831, 21.51751, 0.9250245, 7200, 5, 1), -- Hive'Zara Tail Lasher
(@CGUID+171, 15336, 509, 1, 1, -9563.056, 1500.709, 22.59851, 4.18879, 7200, 5, 1), -- Hive'Zara Tail Lasher
(@CGUID+172, 15336, 509, 1, 1, -9592.147, 1496.167, 22.92012, 1.106082, 7200, 5, 1), -- Hive'Zara Tail Lasher
(@CGUID+173, 15336, 509, 1, 1, -9600.68, 1417.569, 22.99969, 5.747794, 7200, 5, 1), -- Hive'Zara Tail Lasher
(@CGUID+174, 15336, 509, 1, 1, -9602.287, 1403.74, 24.61112, 1.931395, 7200, 5, 1), -- Hive'Zara Tail Lasher
(@CGUID+175, 15338, 509, 1, 1, -8786.295, 2107.791, 21.79048, 5.001371, 7200, 0, 0), -- Obsidian Destroyer
(@CGUID+176, 15338, 509, 1, 1, -8798.089, 1934.021, 21.46238, 4.412516, 7200, 0, 0), -- Obsidian Destroyer
(@CGUID+177, 15338, 509, 1, 1, -8864.612, 2021.75, 21.64479, 3.131173, 7200, 0, 0), -- Obsidian Destroyer
(@CGUID+178, 15338, 509, 1, 1, -8868.629, 1877.659, 21.87304, 2.538011, 7200, 0, 0), -- Obsidian Destroyer
(@CGUID+179, 15338, 509, 1, 1, -8936.657, 1715.272, 21.51128, 4.108858, 7200, 0, 0), -- Obsidian Destroyer
(@CGUID+180, 15338, 509, 1, 1, -8970.525, 2080.208, 21.51132, 5.018237, 7200, 0, 0), -- Obsidian Destroyer
(@CGUID+181, 15338, 509, 1, 1, -9014.472, 1711.889, 21.48144, 2.354002, 7200, 0, 0), -- Obsidian Destroyer
(@CGUID+182, 15338, 509, 1, 1, -9018.842, 1888.04, 21.62847, 4.138173, 7200, 0, 0), -- Obsidian Destroyer
(@CGUID+183, 15338, 509, 1, 1, -9080.542, 1740.715, 21.51128, 5.577422, 7200, 0, 0), -- Obsidian Destroyer
(@CGUID+184, 15339, 509, 1, 1, -9502.8, 2042.65, 105.3096, 5.654867, 7200, 0, 0), -- Ossirian the Unscarred
(@CGUID+185, 15340, 509, 1, 1, -8845.518, 2260.144, 21.46967, 4.642576, 7200, 0, 0), -- Moam
(@CGUID+186, 15341, 509, 1, 1, -9129.729, 1602.503, 26.54407, 5.532694, 7200, 0, 0), -- General Rajaxx
(@CGUID+187, 15343, 509, 1, 1, -8595.92, 1447.688, 32.04808, 5.463164, 7200, 0, 0), -- Qiraji Swarmguard
(@CGUID+188, 15343, 509, 1, 1, -8634.026, 1515.246, 31.96161, 2.593201, 7200, 0, 0), -- Qiraji Swarmguard
(@CGUID+189, 15343, 509, 1, 1, -8641.496, 1392.684, 32.10234, 5.526043, 7200, 0, 0), -- Qiraji Swarmguard
(@CGUID+190, 15343, 509, 1, 1, -8642.217, 1445.216, 32.52929, 0.8981247, 7200, 0, 0), -- Qiraji Swarmguard
(@CGUID+191, 15343, 509, 1, 1, -8647.904, 1430.745, 32.16164, 3.90623, 7200, 0, 0), -- Qiraji Swarmguard
(@CGUID+192, 15343, 509, 1, 1, -8652.679, 1459.439, 32.04622, 2.591174, 7200, 0, 0), -- Qiraji Swarmguard
(@CGUID+193, 15344, 509, 1, 1, -8991.146, 1553.998, 21.65394, 2.775074, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+194, 15344, 509, 1, 1, -9003.747, 1536.158, 21.46966, 2.635447, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+195, 15344, 509, 1, 1, -9012.13, 1608.774, 24.86932, 3.141593, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+196, 15344, 509, 1, 1, -9014.358, 1597.683, 21.46967, 3.036873, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+197, 15344, 509, 1, 1, -9020.146, 1586.732, 21.46967, 2.949606, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+198, 15344, 509, 1, 1, -9022.039, 1612.046, 22.80729, 3.159046, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+199, 15344, 509, 1, 1, -9022.71, 1505.878, 21.55961, 2.408554, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+200, 15344, 509, 1, 1, -9029.94, 1498.077, 22.14014, 2.338741, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+201, 15344, 509, 1, 1, -9031.986, 1592.263, 21.46968, 2.984513, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+202, 15344, 509, 1, 1, -9038.44, 1491.037, 23.22957, 2.268928, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+203, 15344, 509, 1, 1, -9070.706, 1634.371, 21.48116, 3.490659, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+204, 15344, 509, 1, 1, -9071.044, 1622.144, 21.46969, 3.333579, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+205, 15344, 509, 1, 1, -9071.757, 1611.277, 21.4721, 3.176499, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+206, 15344, 509, 1, 1, -9076.421, 1530.23, 21.46967, 2.234021, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+207, 15344, 509, 1, 1, -9078.797, 1622.799, 21.46967, 3.368485, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+208, 15344, 509, 1, 1, -9083.137, 1524.759, 21.46966, 2.146755, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+209, 15344, 509, 1, 1, -9091.763, 1519.367, 21.46966, 2.059489, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+210, 15344, 509, 1, 1, -9092.34, 1586.273, 21.46964, 2.687807, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+211, 15344, 509, 1, 1, -9097.289, 1578.36, 21.46964, 2.513274, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+212, 15344, 509, 1, 1, -9102.547, 1569.417, 21.4757, 2.321288, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+213, 15344, 509, 1, 1, -9113.942, 1546.056, 21.46964, 1.954769, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+214, 15344, 509, 1, 1, -9132.825, 1539.097, 21.46964, 1.658063, 7200, 0, 0), -- Swarmguard Needler
(@CGUID+215, 15348, 509, 1, 1, -8822.197, 1625.819, 19.80574, 3.884628, 7200, 5, 1), -- Kurinnaxx
(@CGUID+216, 15355, 509, 1, 1, -9161.633, 1893.916, 86.4881, 4.610681, 7200, 0, 0), -- Anubisath Guardian
(@CGUID+217, 15355, 509, 1, 1, -9182.274, 1935.26, 85.68071, 0.07460589, 7200, 0, 0), -- Anubisath Guardian
(@CGUID+218, 15355, 509, 1, 1, -9211.516, 1874.948, 85.68073, 5.704421, 7200, 0, 0), -- Anubisath Guardian
(@CGUID+219, 15355, 509, 1, 1, -9239.259, 1907.01, 85.68074, 4.830944, 7200, 0, 0), -- Anubisath Guardian
(@CGUID+220, 15355, 509, 1, 1, -9291.042, 1947.945, 85.68074, 5.187096, 7200, 0, 0), -- Anubisath Guardian
(@CGUID+221, 15355, 509, 1, 1, -9294.917, 1760.814, 85.64307, 5.859818, 7200, 0, 0), -- Anubisath Guardian
(@CGUID+222, 15355, 509, 1, 1, -9322.551, 1736.57, 85.67474, 0.2409076, 7200, 0, 0), -- Anubisath Guardian
(@CGUID+223, 15355, 509, 1, 1, -9337.068, 1797.589, 85.67978, 4.818147, 7200, 0, 0), -- Anubisath Guardian
(@CGUID+224, 15369, 509, 1, 1, -9719.611, 1514.752, 27.55229, 0.7679449, 7200, 0, 0), -- Ayamiss the Hunter
(@CGUID+225, 15370, 509, 1, 1, -9235.976, 1234.066, -63.65783, 5.899213, 7200, 5, 1), -- Buru the Gorger
(@CGUID+226, 15384, 509, 1, 1, -9546.693, 1574.15, 25.31675, 2.059489, 7200, 0, 0), -- OLDWorld Trigger (DO NOT DELETE)
(@CGUID+227, 15384, 509, 1, 1, -9583.222, 1629.951, 23.97154, 0.6283185, 7200, 0, 0), -- OLDWorld Trigger (DO NOT DELETE)
(@CGUID+228, 15384, 509, 1, 1, -9596.415, 1545.681, 22.6737, 0.5585054, 7200, 0, 0), -- OLDWorld Trigger (DO NOT DELETE)
(@CGUID+229, 15384, 509, 1, 1, -9632.509, 1587.674, 22.96964, 1.134464, 7200, 0, 0), -- OLDWorld Trigger (DO NOT DELETE)
(@CGUID+230, 15384, 509, 1, 1, -9675.3, 1693.714, 30.20995, 4.206244, 7200, 0, 0), -- OLDWorld Trigger (DO NOT DELETE)
(@CGUID+231, 15384, 509, 1, 1, -9698.361, 1637.477, 23.61151, 6.161012, 7200, 0, 0), -- OLDWorld Trigger (DO NOT DELETE)
(@CGUID+232, 15384, 509, 1, 1, -9704.792, 1523.153, 21.52732, 0.1396263, 7200, 0, 0), -- OLDWorld Trigger (DO NOT DELETE)
(@CGUID+233, 15384, 509, 1, 1, -9759.329, 1480.819, 28.64592, 3.351032, 7200, 0, 0), -- OLDWorld Trigger (DO NOT DELETE)
(@CGUID+234, 15385, 509, 1, 1, -9108.294, 1584.171, 21.47101, 2.495821, 7200, 0, 0), -- Colonel Zerran
(@CGUID+235, 15386, 509, 1, 1, -9085.032, 1622.403, 21.46965, 3.368485, 7200, 0, 0), -- Major Yeggeth
(@CGUID+236, 15387, 509, 1, 1, -8994.835, 1542.269, 21.64863, 2.70526, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+237, 15387, 509, 1, 1, -8998.049, 1560.147, 22.13081, 2.80998, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+238, 15387, 509, 1, 1, -9001.262, 1549.051, 22.02086, 2.722714, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+239, 15387, 509, 1, 1, -9010.698, 1542.467, 21.46967, 2.6529, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+240, 15387, 509, 1, 1, -9023.852, 1601.583, 21.46967, 3.071779, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+241, 15387, 509, 1, 1, -9030.075, 1512.309, 21.47057, 2.408554, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+242, 15387, 509, 1, 1, -9038.825, 1505.317, 21.59063, 2.338741, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+243, 15387, 509, 1, 1, -9046.502, 1498.264, 22.0108, 2.268928, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+244, 15387, 509, 1, 1, -9066.888, 1521.481, 21.46966, 2.251475, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+245, 15387, 509, 1, 1, -9074.003, 1515.235, 21.46966, 2.164208, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+246, 15387, 509, 1, 1, -9078.066, 1635.034, 21.46967, 3.543018, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+247, 15387, 509, 1, 1, -9080.052, 1612.093, 21.46965, 3.193953, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+248, 15387, 509, 1, 1, -9082.668, 1510.194, 21.51312, 2.076942, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+249, 15387, 509, 1, 1, -9098.183, 1589.878, 21.46998, 2.70526, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+250, 15387, 509, 1, 1, -9102.671, 1581.557, 21.47097, 2.495821, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+251, 15387, 509, 1, 1, -9107.887, 1574.311, 21.48627, 2.303835, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+252, 15387, 509, 1, 1, -9117.37, 1553.283, 21.46964, 1.937315, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+253, 15387, 509, 1, 1, -9123.583, 1541.553, 21.46964, 1.797689, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+254, 15387, 509, 1, 1, -9125.76, 1549.293, 21.46964, 1.780236, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+255, 15387, 509, 1, 1, -9134.138, 1546.722, 21.46964, 1.64061, 7200, 0, 0), -- Qiraji Warrior
(@CGUID+256, 15388, 509, 1, 1, -9127.978, 1558.543, 21.68785, 1.797689, 7200, 0, 0), -- Major Pakkon
(@CGUID+257, 15389, 509, 1, 1, -9033.166, 1604.659, 21.46967, 3.089233, 7200, 0, 0), -- Captain Drenn
(@CGUID+258, 15390, 509, 1, 1, -9087.008, 1530.263, 21.46967, 2.146755, 7200, 0, 0), -- Captain Xurrem
(@CGUID+259, 15391, 509, 1, 1, -9007.403, 1556.874, 21.6039, 2.75762, 7200, 0, 0), -- Captain Qeez
(@CGUID+260, 15392, 509, 1, 1, -9041.356, 1512.58, 21.47481, 2.338741, 7200, 0, 0), -- Captain Tuubid
(@CGUID+261, 15426, 509, 1, 1, -8680.658, 1585.614, 33.19108, 2.548181, 7200, 0, 0), -- Ahn'Qiraj Trigger
(@CGUID+262, 15428, 509, 1, 1, -9230.038, 1916.913, 85.65411, 4.529287, 7200, 0, 0), -- Sand Vortex
(@CGUID+263, 15428, 509, 1, 1, -9523.837, 1881.484, 85.64066, 5.181685, 7200, 0, 0), -- Sand Vortex
(@CGUID+264, 15461, 509, 1, 1, -8777.984, 1946.542, 29.26133, 5.90431, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+265, 15461, 509, 1, 1, -8779.035, 1939.482, 28.63995, 5.916666, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+266, 15461, 509, 1, 1, -8779.128, 1927.207, 27.42442, 2.724261, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+267, 15461, 509, 1, 1, -8784.287, 1915.417, 24.22899, 5.393067, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+268, 15461, 509, 1, 1, -8799.364, 1954.671, 21.51133, 5.978374, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+269, 15461, 509, 1, 1, -8890.03, 1741.545, 21.7629, 1.518436, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+270, 15461, 509, 1, 1, -8900.689, 1727.25, 24.3461, 4.555309, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+271, 15461, 509, 1, 1, -8911.898, 1741.947, 21.96902, 1.021649, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+272, 15461, 509, 1, 1, -8914.18, 1776.939, 21.66511, 3.48624, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+273, 15461, 509, 1, 1, -8931.609, 2026.63, 23.34022, 5.709093, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+274, 15461, 509, 1, 1, -8933.949, 1761.936, 22.19745, 2.513257, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+275, 15461, 509, 1, 1, -8935.758, 1993.071, 22.7103, 3.963199, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+276, 15461, 509, 1, 1, -8936.32, 2034.411, 23.23642, 2.167205, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+277, 15461, 509, 1, 1, -8949.799, 1981.901, 21.69878, 1.727876, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+278, 15461, 509, 1, 1, -8986, 1995.47, 23.65904, 3.566723, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+279, 15461, 509, 1, 1, -9013.021, 1864.727, 22.24529, 6.056293, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+280, 15461, 509, 1, 1, -9021.092, 1856.039, 21.65097, 2.042035, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+281, 15461, 509, 1, 1, -9026.661, 1838.82, 21.46962, 4.590216, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+282, 15461, 509, 1, 1, -9048.649, 1860.379, 22.03692, 5.604976, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+283, 15461, 509, 1, 1, -9052.467, 1873.286, 24.717, 1.431662, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+284, 15461, 509, 1, 1, -9101.366, 2212.7, 21.51138, 2.302702, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+285, 15461, 509, 1, 1, -9102.915, 2204.249, 21.51138, 1.122511, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+286, 15461, 509, 1, 1, -9104.067, 2173.496, 21.51134, 0.5112051, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+287, 15461, 509, 1, 1, -9109.516, 2190.421, 21.51134, 0.7625134, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+288, 15461, 509, 1, 1, -9113.313, 2218.674, 22.06243, 1.520167, 7200, 5, 1), -- Shrieker Scarab
(@CGUID+289, 15462, 509, 1, 1, -8773.882, 1964.334, 28.00181, 1.714765, 7200, 5, 1), -- Spitting Scarab
(@CGUID+290, 15462, 509, 1, 1, -8777.861, 1955.941, 27.29991, 1.703948, 7200, 5, 1), -- Spitting Scarab
(@CGUID+291, 15462, 509, 1, 1, -8792.899, 1944.089, 21.55064, 3.30581, 7200, 5, 1), -- Spitting Scarab
(@CGUID+292, 15462, 509, 1, 1, -8805.239, 1936.149, 21.46968, 3.455752, 7200, 5, 1), -- Spitting Scarab
(@CGUID+293, 15462, 509, 1, 1, -8818.191, 1927.24, 22.42108, 5.61996, 7200, 5, 1), -- Spitting Scarab
(@CGUID+294, 15462, 509, 1, 1, -8879.906, 1771.096, 24.49183, 5.58218, 7200, 5, 1), -- Spitting Scarab
(@CGUID+295, 15462, 509, 1, 1, -8892.148, 1788.219, 22.04427, 5.124065, 7200, 5, 1), -- Spitting Scarab
(@CGUID+296, 15462, 509, 1, 1, -8894.619, 1763.474, 21.59097, 0.7297062, 7200, 5, 1), -- Spitting Scarab
(@CGUID+297, 15462, 509, 1, 1, -8929.951, 1760.378, 21.76128, 0.06232084, 7200, 5, 1), -- Spitting Scarab
(@CGUID+298, 15462, 509, 1, 1, -8935.928, 1744.146, 21.47835, 5.471159, 7200, 5, 1), -- Spitting Scarab
(@CGUID+299, 15462, 509, 1, 1, -8938.027, 2012.935, 22.70216, 0.9310265, 7200, 5, 1), -- Spitting Scarab
(@CGUID+300, 15462, 509, 1, 1, -8945.51, 1986.941, 21.54233, 3.434109, 7200, 5, 1), -- Spitting Scarab
(@CGUID+301, 15462, 509, 1, 1, -8961.313, 1989.169, 21.99717, 3.973462, 7200, 5, 1), -- Spitting Scarab
(@CGUID+302, 15462, 509, 1, 1, -8961.39, 2036.786, 21.94052, 5.367473, 7200, 5, 1), -- Spitting Scarab
(@CGUID+303, 15462, 509, 1, 1, -8986.513, 2005.445, 23.18358, 4.609489, 7200, 5, 1), -- Spitting Scarab
(@CGUID+304, 15462, 509, 1, 1, -9037.781, 1872.558, 21.83935, 3.590566, 7200, 5, 1), -- Spitting Scarab
(@CGUID+305, 15462, 509, 1, 1, -9038.259, 1894.863, 22.61593, 4.983107, 7200, 5, 1), -- Spitting Scarab
(@CGUID+306, 15462, 509, 1, 1, -9039.103, 1826.128, 22.9693, 5.044002, 7200, 5, 1), -- Spitting Scarab
(@CGUID+307, 15462, 509, 1, 1, -9046.372, 1886.375, 24.54025, 3.335346, 7200, 5, 1), -- Spitting Scarab
(@CGUID+308, 15462, 509, 1, 1, -9052.063, 1852.845, 22.53534, 1.600288, 7200, 5, 1), -- Spitting Scarab
(@CGUID+309, 15462, 509, 1, 1, -9077.655, 2199.215, 21.47052, 5.794493, 7200, 5, 1), -- Spitting Scarab
(@CGUID+310, 15462, 509, 1, 1, -9087.489, 2206.195, 21.49517, 2.583087, 7200, 5, 1), -- Spitting Scarab
(@CGUID+311, 15462, 509, 1, 1, -9091.026, 2222.007, 22.47916, 0.3574632, 7200, 5, 1), -- Spitting Scarab
(@CGUID+312, 15462, 509, 1, 1, -9094.922, 2187.126, 21.76134, 4.347096, 7200, 5, 1), -- Spitting Scarab
(@CGUID+313, 15462, 509, 1, 1, -9115.486, 2203.177, 21.51138, 4.066154, 7200, 5, 1), -- Spitting Scarab
(@CGUID+314, 15475, 509, 1, 1, -8558.053, 1335.651, 32.23059, 1.330155, 7200, 5, 1), -- Beetle
(@CGUID+315, 15475, 509, 1, 1, -8580.42, 1653.069, 43.2859, 3.590021, 7200, 5, 1), -- Beetle
(@CGUID+316, 15475, 509, 1, 1, -8649.051, 1482.82, 32.00608, 6.216755, 7200, 5, 1), -- Beetle
(@CGUID+317, 15475, 509, 1, 1, -8798.256, 1878.107, 22.0182, 0.3919355, 7200, 5, 1), -- Beetle
(@CGUID+318, 15475, 509, 1, 1, -8904.351, 1528.15, 21.60996, 2.543734, 7200, 5, 1), -- Beetle
(@CGUID+319, 15475, 509, 1, 1, -8999.541, 1989.413, 29.24577, 0.1391346, 7200, 5, 1), -- Beetle
(@CGUID+320, 15475, 509, 1, 1, -9022.933, 1472.28, 33.09048, 4.812155, 7200, 5, 1), -- Beetle
(@CGUID+321, 15475, 509, 1, 1, -9155.481, 2215.207, 26.00118, 3.855093, 7200, 5, 1), -- Beetle
(@CGUID+322, 15475, 509, 1, 1, -9200.068, 1430.018, 21.51133, 4.903863, 7200, 5, 1), -- Beetle
(@CGUID+323, 15475, 509, 1, 1, -9385.35, 1404.552, 21.51134, 4.628578, 7200, 5, 1), -- Beetle
(@CGUID+324, 15476, 509, 1, 1, -8603.881, 1356.801, 32.0353, 5.992309, 7200, 5, 1), -- Scorpid
(@CGUID+325, 15476, 509, 1, 1, -8673.53, 1535.038, 31.96736, 5.982349, 7200, 5, 1), -- Scorpid
(@CGUID+326, 15476, 509, 1, 1, -8770.431, 2134.666, 30.01231, 1.451406, 7200, 5, 1), -- Scorpid
(@CGUID+327, 15476, 509, 1, 1, -8782.575, 2207.545, 26.37049, 6.040576, 7200, 5, 1), -- Scorpid
(@CGUID+328, 15476, 509, 1, 1, -9030.191, 1901.198, 21.95046, 0.2293586, 7200, 5, 1), -- Scorpid
(@CGUID+329, 15476, 509, 1, 1, -9088.795, 1479.958, 29.47734, 4.849589, 7200, 5, 1), -- Scorpid
(@CGUID+330, 15476, 509, 1, 1, -9121.418, 1772.116, 22.70201, 4.443481, 7200, 5, 1), -- Scorpid
(@CGUID+331, 15505, 509, 1, 1, -8851.227, 2056.546, 4.849823, 3.996804, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+332, 15505, 509, 1, 1, -8857.7, 2072.103, 4.994012, 0.4886922, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+333, 15505, 509, 1, 1, -8858.738, 2062.827, 4.482691, 1.797689, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+334, 15505, 509, 1, 1, -8865.083, 2083.378, 3.65268, 5.078908, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+335, 15505, 509, 1, 1, -8870.662, 2109.143, 6.556806, 1.151917, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+336, 15505, 509, 1, 1, -8874.804, 1936.475, 6.60746, 1.133057, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+337, 15505, 509, 1, 1, -8874.903, 2058.621, 4.535347, 0, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+338, 15505, 509, 1, 1, -8875.742, 1945.669, 6.486465, 5.31958, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+339, 15505, 509, 1, 1, -8877.209, 2127.847, 7.684945, 1.867502, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+340, 15505, 509, 1, 1, -8877.619, 1959.799, 6.453036, 4.259987, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+341, 15505, 509, 1, 1, -8884.489, 1926.345, 4.517488, 1.902409, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+342, 15505, 509, 1, 1, -8886.457, 2125.595, 5.525422, 5.462881, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+343, 15505, 509, 1, 1, -8889.349, 1931.745, 5.704772, 4.119449, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+344, 15505, 509, 1, 1, -8889.567, 2115.469, 7.099297, 0.7679449, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+345, 15505, 509, 1, 1, -8896.666, 2135.883, 5.975152, 0.2310998, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+346, 15505, 509, 1, 1, -8916.911, 2170.905, 12.31206, 2.958982, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+347, 15505, 509, 1, 1, -8916.97, 2153.477, 5.997731, 3.785432, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+348, 15505, 509, 1, 1, -8918.426, 2159.507, 5.476036, 6.043295, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+349, 15505, 509, 1, 1, -8929.834, 1869.064, 4.986817, 3.717551, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+350, 15505, 509, 1, 1, -8930.449, 2162.486, 5.261242, 0.3141593, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+351, 15505, 509, 1, 1, -8931.279, 1852.244, 4.11584, 3.333579, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+352, 15505, 509, 1, 1, -8937.561, 2177.217, 4.788124, 2.3946, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+353, 15505, 509, 1, 1, -8938.794, 1854.301, 2.765879, 5.864306, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+354, 15505, 509, 1, 1, -8939.113, 1846.925, 2.428802, 4.869469, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+355, 15505, 509, 1, 1, -8947.23, 1868.441, 4.382745, 0.93376, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+356, 15505, 509, 1, 1, -8972.435, 1825.497, 3.846474, 0.122173, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+357, 15505, 509, 1, 1, -8974.198, 1807.207, 1.86357, 5.270895, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+358, 15505, 509, 1, 1, -8981.374, 1815.486, 4.08643, 5.166174, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+359, 15505, 509, 1, 1, -8989.232, 1811.111, 5.656726, 5.794493, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+360, 15505, 509, 1, 1, -8989.631, 1822.99, 6.513769, 0.4712389, 7200, 5, 1),  -- Canal Frenzy
(@CGUID+361, 15514, 509, 1, 1, -9234.326, 1243.826, -63.52806, 3.490659, 7200, 0, 0), -- Buru Egg
(@CGUID+362, 15514, 509, 1, 1, -9243.427, 1280.498, -63.59377, 3.822271, 7200, 0, 0), -- Buru Egg
(@CGUID+363, 15514, 509, 1, 1, -9263.014, 1295.236, -63.80813, 1.797689, 7200, 0, 0), -- Buru Egg
(@CGUID+364, 15514, 509, 1, 1, -9270.393, 1243.896, -63.76731, 2.722714, 7200, 0, 0), -- Buru Egg
(@CGUID+365, 15514, 509, 1, 1, -9300.067, 1305.085, -63.69709, 4.18879, 7200, 0, 0), -- Buru Egg
(@CGUID+366, 15514, 509, 1, 1, -9300.189, 1266.665, -63.74272, 0.2617994, 7200, 0, 0), -- Buru Egg
(@CGUID+367, 15590, 509, 1, 1, -9188.444, 1940.21, 85.63905, 3.176499, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+368, 15590, 509, 1, 1, -9188.444, 1940.21, 85.63905, 3.176499, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+369, 15590, 509, 1, 1, -9244.413, 1808.983, 85.63908, 5.637414, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+370, 15590, 509, 1, 1, -9248.413, 1974.83, 85.63908, 5.899213, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+371, 15590, 509, 1, 1, -9282.08, 1887.34, 85.63908, 2.007129, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+372, 15590, 509, 1, 1, -9282.08, 1887.34, 85.63908, 2.007129, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+373, 15590, 509, 1, 1, -9299.727, 1748.453, 85.63907, 1.448623, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+374, 15590, 509, 1, 1, -9357.861, 1929.079, 85.63907, 1.064651, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+375, 15590, 509, 1, 1, -9357.861, 1929.079, 85.63907, 1.064651, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+376, 15590, 509, 1, 1, -9367.171, 1780.888, 85.63908, 1.902409, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+377, 15590, 509, 1, 1, -9367.171, 1780.888, 85.63908, 1.902409, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+378, 15590, 509, 1, 1, -9383.292, 2012.681, 85.65106, 2.932153, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+379, 15590, 509, 1, 1, -9383.292, 2012.681, 85.65106, 2.932153, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+380, 15590, 509, 1, 1, -9406.096, 1862.376, 85.63908, 6.230825, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+381, 15590, 509, 1, 1, -9407.718, 1960.211, 85.63906, 1.117011, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+382, 15590, 509, 1, 1, -9432.396, 1782.529, 85.63908, 5.864306, 7200, 0, 0), -- Ossirian Crystal Trigger
(@CGUID+383, 15590, 509, 1, 1, -9506.192, 1865.572, 85.63909, 4.276057, 7200, 0, 0); -- Ossirian Crystal Trigger

DELETE FROM `creature_template_addon` WHERE `entry` IN (15324,15335,15387,15505,15339,15341,15385,15428);
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(15324,0,1,0, '18950'),(15335,0,1,0, '18950'),(15387,0,1,0, '18950'),(15505,0,1,0, '18943'),
(15339,0,1,0, '25176'),(15341,0,1,0, '18943'),(15385,0,1,0, '25462'),(15428,0,1,0, '25160');

-- Pathing for Anubisath Guardian Entry: 15355 'TDB FORMAT' 
SET @NPC := @CGUID+216;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9248.026,`position_y`=1888.945,`position_z`=85.68073 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9248.026,1888.945,85.68073,0,0,0,0,100,0),
(@PATH,2,-9282.023,1855.383,85.5974,0,0,0,0,100,0),
(@PATH,3,-9311.62,1831.059,84.10042,0,0,0,0,100,0),
(@PATH,4,-9339.822,1823.54,85.67978,0,0,0,0,100,0),
(@PATH,5,-9336.083,1788.304,85.67978,0,0,0,0,100,0),
(@PATH,6,-9373.787,1788.205,85.68073,0,0,0,0,100,0),
(@PATH,7,-9392.846,1821.798,85.68074,0,0,0,0,100,0),
(@PATH,8,-9396.511,1850.486,85.68074,0,0,0,0,100,0),
(@PATH,9,-9409.217,1865.23,85.68074,0,0,0,0,100,0),
(@PATH,10,-9438.716,1862.457,85.68074,0,0,0,0,100,0),
(@PATH,11,-9458.922,1889.078,85.68074,0,0,0,0,100,0),
(@PATH,12,-9451.585,1908.686,85.67978,0,0,0,0,100,0),
(@PATH,13,-9424.979,1921.917,85.58256,0,0,0,0,100,0),
(@PATH,14,-9399.763,1928.021,85.64656,0,0,0,0,100,0),
(@PATH,15,-9383.525,1958.783,85.68073,0,0,0,0,100,0),
(@PATH,16,-9371.938,1976.018,85.68073,0,0,0,0,100,0),
(@PATH,17,-9344.856,2007.821,85.68074,0,0,0,0,100,0),
(@PATH,18,-9315.889,2002.974,85.68073,0,0,0,0,100,0),
(@PATH,19,-9305.473,1976.09,85.68074,0,0,0,0,100,0),
(@PATH,20,-9294.416,1948.307,85.68074,0,0,0,0,100,0),
(@PATH,21,-9259.192,1938.78,85.68074,0,0,0,0,100,0),
(@PATH,22,-9234.046,1921.629,85.68074,0,0,0,0,100,0);

-- Pathing for Anubisath Guardian Entry: 15355 'TDB FORMAT' 
SET @NPC := @CGUID+217;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9184.5,`position_y`=1854.158,`position_z`=85.68073 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9184.5,1854.158,85.68073,0,0,0,0,100,0),
(@PATH,2,-9216.548,1824.755,85.68074,0,0,0,0,100,0),
(@PATH,3,-9250.388,1789.818,85.68074,0,0,0,0,100,0),
(@PATH,4,-9273.942,1769.737,85.67978,0,0,0,0,100,0),
(@PATH,5,-9287.727,1753.579,85.68074,0,0,0,0,100,0),
(@PATH,6,-9322.813,1721.81,87.2582,0,0,0,0,100,0),
(@PATH,7,-9353.575,1722.876,87.03452,0,0,0,0,100,0),
(@PATH,8,-9361.314,1755.279,85.68076,0,0,0,0,100,0),
(@PATH,9,-9364.741,1787.446,85.67978,0,0,0,0,100,0),
(@PATH,10,-9382.464,1800.235,85.68074,0,0,0,0,100,0),
(@PATH,11,-9383.027,1827.17,86.00362,0,0,0,0,100,0),
(@PATH,12,-9390.321,1846.647,85.68074,0,0,0,0,100,0),
(@PATH,13,-9419.723,1858.245,85.57466,0,0,0,0,100,0),
(@PATH,14,-9449.339,1865.135,85.68074,0,0,0,0,100,0),
(@PATH,15,-9486.292,1872.536,85.68074,0,0,0,0,100,0),
(@PATH,16,-9507.497,1867.104,85.68071,0,0,0,0,100,0),
(@PATH,17,-9527.903,1882.607,85.68071,0,0,0,0,100,0),
(@PATH,18,-9510.689,1925.589,85.68073,0,0,0,0,100,0),
(@PATH,19,-9488.487,1946.937,85.67978,0,0,0,0,100,0),
(@PATH,20,-9459.86,1976.461,85.92978,0,0,0,0,100,0),
(@PATH,21,-9442.087,1990.908,85.92978,0,0,0,0,100,0),
(@PATH,22,-9407.938,2024.798,85.93073,0,0,0,0,100,0),
(@PATH,23,-9380.547,2051.861,85.94083,0,0,0,0,100,0),
(@PATH,24,-9353.088,2075.302,86.06718,0,0,0,0,100,0),
(@PATH,25,-9322.948,2076.674,86.80594,0,0,0,0,100,0),
(@PATH,26,-9315.573,2050.009,85.64993,0,0,0,0,100,0),
(@PATH,27,-9314.585,2018.313,85.68073,0,0,0,0,100,0),
(@PATH,28,-9302.906,1992.931,85.68074,0,0,0,0,100,0),
(@PATH,29,-9307.348,1964.604,85.652,0,0,0,0,100,0),
(@PATH,30,-9282.028,1949.146,85.68074,0,0,0,0,100,0),
(@PATH,31,-9252.31,1944.22,85.68074,0,0,0,0,100,0),
(@PATH,32,-9227.021,1928.589,85.68074,0,0,0,0,100,0),
(@PATH,33,-9189.054,1932.123,85.68071,0,0,0,0,100,0),
(@PATH,34,-9158.877,1920.914,86.81694,0,0,0,0,100,0),
(@PATH,35,-9163.66,1874.253,86.90241,0,0,0,0,100,0);

-- Pathing for Anubisath Guardian Entry: 15355 'TDB FORMAT' 
SET @NPC := @CGUID+218;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9266.736,`position_y`=1785.315,`position_z`=85.67978 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9266.736,1785.315,85.67978,0,0,0,0,100,0),
(@PATH,2,-9254.919,1821.132,85.68074,0,0,0,0,100,0),
(@PATH,3,-9229.319,1826.478,85.68074,0,0,0,0,100,0),
(@PATH,4,-9219.66,1845.915,85.68073,0,0,0,0,100,0),
(@PATH,5,-9229.024,1871.725,85.68073,0,0,0,0,100,0),
(@PATH,6,-9245.31,1880.665,85.68073,0,0,0,0,100,0),
(@PATH,7,-9270.313,1884.48,85.68073,0,0,0,0,100,0),
(@PATH,8,-9290.14,1888.328,85.68073,0,0,0,0,100,0),
(@PATH,9,-9323.363,1912.306,85.58256,0,0,0,0,100,0),
(@PATH,10,-9346.232,1921.884,85.67978,0,0,0,0,100,0),
(@PATH,11,-9365.159,1955.121,85.63752,0,0,0,0,100,0),
(@PATH,12,-9373.188,1980.685,85.68073,0,0,0,0,100,0),
(@PATH,13,-9396.845,2005.119,85.68073,0,0,0,0,100,0),
(@PATH,14,-9424.114,2004.707,85.93073,0,0,0,0,100,0),
(@PATH,15,-9439.311,1988.515,85.92978,0,0,0,0,100,0),
(@PATH,16,-9442.091,1961.605,85.23379,0,0,0,0,100,0),
(@PATH,17,-9430.677,1936.73,85.55478,0,0,0,0,100,0),
(@PATH,18,-9423.523,1916.457,85.58256,0,0,0,0,100,0),
(@PATH,19,-9388.256,1899.98,86.93074,0,0,0,0,100,0),
(@PATH,20,-9365.732,1875.688,85.68073,0,0,0,0,100,0),
(@PATH,21,-9332.013,1843.525,85.67978,0,0,0,0,100,0),
(@PATH,22,-9335.819,1822.33,85.5914,0,0,0,0,100,0),
(@PATH,23,-9333.703,1798.843,84.41318,0,0,0,0,100,0),
(@PATH,24,-9323.364,1773.62,85.55771,0,0,0,0,100,0),
(@PATH,25,-9293.272,1760.073,85.68074,0,0,0,0,100,0);

-- Pathing for Anubisath Guardian Entry: 15355 'TDB FORMAT' 
SET @NPC := @CGUID+219;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9252.741,`position_y`=1943.686,`position_z`=85.68074 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9252.741,1943.686,85.68074,0,0,0,0,100,0),
(@PATH,2,-9222.651,1931.318,85.68074,0,0,0,0,100,0),
(@PATH,3,-9191.619,1942.506,85.68071,0,0,0,0,100,0),
(@PATH,4,-9170.24,1922.948,85.68071,0,0,0,0,100,0),
(@PATH,5,-9169.914,1879.729,85.68073,0,0,0,0,100,0),
(@PATH,6,-9195.714,1851.033,85.68073,0,0,0,0,100,0),
(@PATH,7,-9223.459,1817.724,85.68074,0,0,0,0,100,0),
(@PATH,8,-9244.517,1803.858,85.68074,0,0,0,0,100,0),
(@PATH,9,-9261.152,1787.29,85.68074,0,0,0,0,100,0),
(@PATH,10,-9284.998,1755.206,85.68074,0,0,0,0,100,0),
(@PATH,11,-9308.692,1733.549,85.68074,0,0,0,0,100,0),
(@PATH,12,-9345.574,1727.55,85.65805,0,0,0,0,100,0),
(@PATH,13,-9378.37,1742.617,85.68076,0,0,0,0,100,0),
(@PATH,14,-9376.036,1778.404,85.68073,0,0,0,0,100,0),
(@PATH,15,-9391.478,1813.657,85.68074,0,0,0,0,100,0),
(@PATH,16,-9395.252,1844.675,85.68074,0,0,0,0,100,0),
(@PATH,17,-9431.688,1857.969,85.68074,0,0,0,0,100,0),
(@PATH,18,-9457.778,1865.383,85.68074,0,0,0,0,100,0),
(@PATH,19,-9490.235,1866.432,85.50545,0,0,0,0,100,0),
(@PATH,20,-9530.864,1870.682,86.19707,0,0,0,0,100,0),
(@PATH,21,-9526.759,1911.277,86.01886,0,0,0,0,100,0),
(@PATH,22,-9496.368,1944.791,85.67978,0,0,0,0,100,0),
(@PATH,23,-9466.16,1972.771,85.92978,0,0,0,0,100,0),
(@PATH,24,-9439.001,1997.835,85.92978,0,0,0,0,100,0),
(@PATH,25,-9406.588,2025.468,85.93073,0,0,0,0,100,0),
(@PATH,26,-9381.611,2054.042,85.94083,0,0,0,0,100,0),
(@PATH,27,-9370.005,2074.14,86.93733,0,0,0,0,100,0),
(@PATH,28,-9326.063,2072.066,86.11478,0,0,0,0,100,0),
(@PATH,29,-9317.672,2030.484,85.68073,0,0,0,0,100,0),
(@PATH,30,-9309.036,1982.96,85.68074,0,0,0,0,100,0),
(@PATH,31,-9290.975,1947.814,85.68074,0,0,0,0,100,0);

-- Pathing for Anubisath Guardian Entry: 15355 'TDB FORMAT' 
SET @NPC := @CGUID+220;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9338.638,`position_y`=1812.094,`position_z`=85.67978 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9338.638,1812.094,85.67978,0,0,0,0,100,0),
(@PATH,2,-9349.664,1779.623,85.67978,0,0,0,0,100,0),
(@PATH,3,-9367.894,1745.984,85.68076,0,0,0,0,100,0),
(@PATH,4,-9352.953,1729.101,85.65805,0,0,0,0,100,0),
(@PATH,5,-9311.624,1739.255,85.68074,0,0,0,0,100,0),
(@PATH,6,-9327.572,1781.838,85.6329,0,0,0,0,100,0),
(@PATH,7,-9367.602,1793.721,85.68073,0,0,0,0,100,0),
(@PATH,8,-9389.63,1822.929,85.68074,0,0,0,0,100,0),
(@PATH,9,-9375.203,1855.041,85.68074,0,0,0,0,100,0),
(@PATH,10,-9361.834,1883.146,85.68073,0,0,0,0,100,0),
(@PATH,11,-9367.618,1915.205,85.68074,0,0,0,0,100,0),
(@PATH,12,-9369.153,1949.937,85.68073,0,0,0,0,100,0),
(@PATH,13,-9359.215,1982.555,85.86217,0,0,0,0,100,0),
(@PATH,14,-9347.963,2014.867,85.68074,0,0,0,0,100,0),
(@PATH,15,-9367.603,2028.901,85.68073,0,0,0,0,100,0),
(@PATH,16,-9373.234,2057.752,86.05863,0,0,0,0,100,0),
(@PATH,17,-9356.573,2072.664,86.02653,0,0,0,0,100,0),
(@PATH,18,-9327.185,2070.252,86.02213,0,0,0,0,100,0),
(@PATH,19,-9315.275,2050.388,85.64993,0,0,0,0,100,0),
(@PATH,20,-9316.94,2021.346,85.68073,0,0,0,0,100,0),
(@PATH,21,-9309.85,1985.53,85.68074,0,0,0,0,100,0),
(@PATH,22,-9315.965,1950.781,85.652,0,0,0,0,100,0),
(@PATH,23,-9321.123,1910.298,85.58256,0,0,0,0,100,0),
(@PATH,24,-9343.007,1881.461,85.68073,0,0,0,0,100,0),
(@PATH,25,-9341.981,1844.112,85.15749,0,0,0,0,100,0);

-- Pathing for Anubisath Guardian Entry: 15355 'TDB FORMAT' 
SET @NPC := @CGUID+221;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9373.941,`position_y`=2005.845,`position_z`=85.68073 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9373.941,2005.845,85.68073,0,0,0,0,100,0),
(@PATH,2,-9352.195,2015.95,85.68074,0,0,0,0,100,0),
(@PATH,3,-9317.304,2017.394,85.68073,0,0,0,0,100,0),
(@PATH,4,-9306.902,1975.931,85.68074,0,0,0,0,100,0),
(@PATH,5,-9294.695,1950.731,85.68074,0,0,0,0,100,0),
(@PATH,6,-9265.143,1937.398,85.68074,0,0,0,0,100,0),
(@PATH,7,-9240.809,1920.022,85.68074,0,0,0,0,100,0),
(@PATH,8,-9236.777,1886.178,85.68073,0,0,0,0,100,0),
(@PATH,9,-9257.813,1873.583,85.68073,0,0,0,0,100,0),
(@PATH,10,-9285.015,1845.869,85.5974,0,0,0,0,100,0),
(@PATH,11,-9317.275,1834.302,85.67978,0,0,0,0,100,0),
(@PATH,12,-9336.368,1823.559,85.67978,0,0,0,0,100,0),
(@PATH,13,-9338.676,1791.969,85.67978,0,0,0,0,100,0),
(@PATH,14,-9373.688,1782.111,85.68073,0,0,0,0,100,0),
(@PATH,15,-9389.025,1814.412,85.68074,0,0,0,0,100,0),
(@PATH,16,-9392.569,1842.455,85.68074,0,0,0,0,100,0),
(@PATH,17,-9416.333,1859.258,85.80574,0,0,0,0,100,0),
(@PATH,18,-9444.572,1859.874,85.68074,0,0,0,0,100,0),
(@PATH,19,-9468.98,1877.569,85.68074,0,0,0,0,100,0),
(@PATH,20,-9457.439,1907.662,85.67978,0,0,0,0,100,0),
(@PATH,21,-9429.858,1935.159,85.55478,0,0,0,0,100,0),
(@PATH,22,-9406.939,1970.748,86.69244,0,0,0,0,100,0),
(@PATH,23,-9385.19,1986.798,85.68073,0,0,0,0,100,0);

-- Pathing for Anubisath Guardian Entry: 15355 'TDB FORMAT' 
SET @NPC := @CGUID+222;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9166.672,`position_y`=1901.352,`position_z`=85.68071 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9166.672,1901.352,85.68071,0,0,0,0,100,0),
(@PATH,2,-9180.448,1880.267,85.68073,0,0,0,0,100,0),
(@PATH,3,-9213.866,1872.235,85.68073,0,0,0,0,100,0),
(@PATH,4,-9249.758,1884.736,85.68073,0,0,0,0,100,0),
(@PATH,5,-9278.231,1876.297,85.68073,0,0,0,0,100,0),
(@PATH,6,-9306.932,1891.425,85.68074,0,0,0,0,100,0),
(@PATH,7,-9352.966,1877.49,85.68073,0,0,0,0,100,0),
(@PATH,8,-9377.938,1866.495,85.68074,0,0,0,0,100,0),
(@PATH,9,-9409.548,1865.281,85.68074,0,0,0,0,100,0),
(@PATH,10,-9446.503,1862.634,85.68074,0,0,0,0,100,0),
(@PATH,11,-9485.57,1861.776,86.05574,0,0,0,0,100,0),
(@PATH,12,-9520.958,1858.505,85.6807,0,0,0,0,100,0),
(@PATH,13,-9527.915,1885.158,85.68071,0,0,0,0,100,0),
(@PATH,14,-9480.079,1874.759,85.68074,0,0,0,0,100,0),
(@PATH,15,-9454.199,1899.666,85.68074,0,0,0,0,100,0),
(@PATH,16,-9424.421,1915.016,85.58256,0,0,0,0,100,0),
(@PATH,17,-9382.796,1911.83,85.68074,0,0,0,0,100,0),
(@PATH,18,-9350.083,1908.802,85.67978,0,0,0,0,100,0),
(@PATH,19,-9317.604,1914.786,85.90751,0,0,0,0,100,0),
(@PATH,20,-9294.263,1930.234,85.68073,0,0,0,0,100,0),
(@PATH,21,-9273.63,1940.642,85.68074,0,0,0,0,100,0),
(@PATH,22,-9244.164,1935.673,85.68074,0,0,0,0,100,0),
(@PATH,23,-9217.478,1932.629,85.68074,0,0,0,0,100,0),
(@PATH,24,-9177.326,1935.63,85.68071,0,0,0,0,100,0);

-- Pathing for Anubisath Guardian Entry: 15355 'TDB FORMAT' 
SET @NPC := @CGUID+223;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9172.666,`position_y`=1878.279,`position_z`=85.68073 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9172.666,1878.279,85.68073,0,0,0,0,100,0),
(@PATH,2,-9174.009,1917.66,85.68071,0,0,0,0,100,0),
(@PATH,3,-9211.638,1928.865,85.68074,0,0,0,0,100,0),
(@PATH,4,-9227.843,1913.313,85.68074,0,0,0,0,100,0),
(@PATH,5,-9260.224,1888.819,85.90156,0,0,0,0,100,0),
(@PATH,6,-9288.68,1887.306,85.68073,0,0,0,0,100,0),
(@PATH,7,-9322.48,1900.894,85.58256,0,0,0,0,100,0),
(@PATH,8,-9350.107,1903.339,85.67978,0,0,0,0,100,0),
(@PATH,9,-9366.493,1879.411,85.68073,0,0,0,0,100,0),
(@PATH,10,-9377.524,1841.84,85.68074,0,0,0,0,100,0),
(@PATH,11,-9384.171,1822.345,85.68074,0,0,0,0,100,0),
(@PATH,12,-9374.88,1798.042,85.68073,0,0,0,0,100,0),
(@PATH,13,-9366.794,1776.835,85.68073,0,0,0,0,100,0),
(@PATH,14,-9339.757,1770.504,86.38388,0,0,0,0,100,0),
(@PATH,15,-9321.449,1758.749,85.56721,0,0,0,0,100,0),
(@PATH,16,-9322.691,1729.77,85.69717,0,0,0,0,100,0),
(@PATH,17,-9349.976,1722.141,87.03061,0,0,0,0,100,0),
(@PATH,18,-9370.238,1754.357,85.68076,0,0,0,0,100,0),
(@PATH,19,-9344.755,1789.065,85.67978,0,0,0,0,100,0),
(@PATH,20,-9337.997,1823.515,85.67978,0,0,0,0,100,0),
(@PATH,21,-9338.635,1860.298,85.58352,0,0,0,0,100,0),
(@PATH,22,-9343.844,1902.833,86.33212,0,0,0,0,100,0),
(@PATH,23,-9356.249,1927.595,85.67978,0,0,0,0,100,0),
(@PATH,24,-9361.627,1950.974,85.26081,0,0,0,0,100,0),
(@PATH,25,-9365.068,1978.835,85.56127,0,0,0,0,100,0),
(@PATH,26,-9370.208,2007.365,85.68073,0,0,0,0,100,0),
(@PATH,27,-9379.047,2042.119,85.94083,0,0,0,0,100,0),
(@PATH,28,-9358.38,2067.382,86.02653,0,0,0,0,100,0),
(@PATH,29,-9326.092,2045.334,85.64993,0,0,0,0,100,0),
(@PATH,30,-9321.812,2013.535,85.68073,0,0,0,0,100,0),
(@PATH,31,-9312.634,1989.898,85.68074,0,0,0,0,100,0),
(@PATH,32,-9320.132,1941.708,85.652,0,0,0,0,100,0),
(@PATH,33,-9334.301,1916.916,85.67978,0,0,0,0,100,0),
(@PATH,34,-9363.942,1895.521,85.68073,0,0,0,0,100,0),
(@PATH,35,-9385.781,1880.747,86.05794,0,0,0,0,100,0),
(@PATH,36,-9417.543,1860.298,85.97346,0,0,0,0,100,0),
(@PATH,37,-9446.719,1864.315,85.68074,0,0,0,0,100,0),
(@PATH,38,-9482.172,1869.57,85.68074,0,0,0,0,100,0),
(@PATH,39,-9529.659,1878.282,85.84587,0,0,0,0,100,0),
(@PATH,40,-9513.365,1858.603,85.6807,0,0,0,0,100,0),
(@PATH,41,-9475.059,1881.233,85.68074,0,0,0,0,100,0),
(@PATH,42,-9447.695,1905.845,85.67978,0,0,0,0,100,0),
(@PATH,43,-9414.993,1911.188,85.58256,0,0,0,0,100,0),
(@PATH,44,-9382.191,1909.415,85.68074,0,0,0,0,100,0),
(@PATH,45,-9351.412,1910.773,85.67978,0,0,0,0,100,0),
(@PATH,46,-9310.615,1922.279,85.58256,0,0,0,0,100,0),
(@PATH,47,-9277.019,1933.476,85.68074,0,0,0,0,100,0),
(@PATH,48,-9235.7,1928.599,85.68074,0,0,0,0,100,0),
(@PATH,49,-9224.213,1883.244,85.68073,0,0,0,0,100,0),
(@PATH,50,-9199.386,1867.022,85.68073,0,0,0,0,100,0);

-- Pathing for Obsidian Destroyer Entry: 15338 'TDB FORMAT' 
SET @NPC := @CGUID+175;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9033.357,`position_y`=1700.726,`position_z`=21.50263 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '19818');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9033.357,1700.726,21.50263,0,0,0,0,100,0),
(@PATH,2,-9015.379,1687.783,21.51133,0,0,0,0,100,0),
(@PATH,3,-8994.662,1677.224,21.51133,0,0,0,0,100,0),
(@PATH,4,-8978.021,1677.923,21.51133,0,0,0,0,100,0),
(@PATH,5,-8972.52,1687.417,21.51133,0,0,0,0,100,0),
(@PATH,6,-8984.521,1701.282,21.51128,0,0,0,0,100,0),
(@PATH,7,-9001.419,1714.948,21.44322,0,0,0,0,100,0),
(@PATH,8,-9022.22,1741.963,21.47298,0,0,0,0,100,0),
(@PATH,9,-9031.46,1752.775,21.47298,0,0,0,0,100,0),
(@PATH,10,-9055.802,1756.606,21.51128,0,0,0,0,100,0),
(@PATH,11,-9067.387,1766.724,21.51128,0,0,0,0,100,0),
(@PATH,12,-9072.949,1783.319,21.51128,0,0,0,0,100,0),
(@PATH,13,-9081.565,1794.618,21.51128,0,0,0,0,100,0),
(@PATH,14,-9091.146,1792.92,21.51128,0,0,0,0,100,0),
(@PATH,15,-9095.299,1779.993,21.51128,0,0,0,0,100,0),
(@PATH,16,-9094.856,1764.921,21.51128,0,0,0,0,100,0),
(@PATH,17,-9080.542,1740.715,21.51128,0,0,0,0,100,0),
(@PATH,18,-9063.872,1726.509,21.50263,0,0,0,0,100,0);

-- Pathing for Obsidian Destroyer Entry: 15338 'TDB FORMAT' 
SET @NPC := @CGUID+176;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9042.727,`position_y`=1737.669,`position_z`=21.51128 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '19818');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9042.727,1737.669,21.51128,0,0,0,0,100,0),
(@PATH,2,-9074.525,1763.811,21.63628,0,0,0,0,100,0),
(@PATH,3,-9042.727,1737.669,21.51128,0,0,0,0,100,0),
(@PATH,4,-9016.15,1713.575,21.44322,0,0,0,0,100,0),
(@PATH,5,-8996.683,1694.021,21.88633,0,0,0,0,100,0),
(@PATH,6,-9016.15,1713.575,21.44322,0,0,0,0,100,0);

-- Pathing for Obsidian Destroyer Entry: 15338 'TDB FORMAT' 
SET @NPC := @CGUID+177;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8912.597,`position_y`=1750.176,`position_z`=21.51128 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '19818');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8912.597,1750.176,21.51128,0,0,0,0,100,0),
(@PATH,2,-8887.421,1790.745,21.89122,0,0,0,0,100,0),
(@PATH,3,-8875.27,1810.156,21.52765,0,0,0,0,100,0),
(@PATH,4,-8857.879,1833.748,21.51134,0,0,0,0,100,0),
(@PATH,5,-8875.27,1810.156,21.52765,0,0,0,0,100,0),
(@PATH,6,-8887.421,1790.745,21.89122,0,0,0,0,100,0),
(@PATH,7,-8912.597,1750.176,21.51128,0,0,0,0,100,0),
(@PATH,8,-8939.655,1710.923,21.51128,0,0,0,0,100,0);

-- Pathing for Obsidian Destroyer Entry: 15338 'TDB FORMAT' 
SET @NPC := @CGUID+178;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9042.861,`position_y`=1841.39,`position_z`=21.51129 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '19818');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9042.861,1841.39,21.51129,0,0,0,0,100,0),
(@PATH,2,-9068.371,1808.513,21.51134,0,0,0,0,100,0),
(@PATH,3,-9042.861,1841.39,21.51129,0,0,0,0,100,0),
(@PATH,4,-9027.129,1875.23,21.73922,0,0,0,0,100,0),
(@PATH,5,-9010.076,1901.59,21.51132,0,0,0,0,100,0),
(@PATH,6,-8985.672,1928.493,21.39046,0,0,0,0,100,0),
(@PATH,7,-9010.076,1901.59,21.51132,0,0,0,0,100,0),
(@PATH,8,-9027.129,1875.23,21.73922,0,0,0,0,100,0);

-- Pathing for Obsidian Destroyer Entry: 15338 'TDB FORMAT' 
SET @NPC := @CGUID+179;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8783.435,`position_y`=2068.937,`position_z`=21.51132 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '19818');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8783.435,2068.937,21.51132,0,0,0,0,100,0),
(@PATH,2,-8783.41,2098.071,21.99277,0,0,0,0,100,0),
(@PATH,3,-8790.493,2121.913,21.39743,0,0,0,0,100,0),
(@PATH,4,-8804.847,2146.174,21.5113,0,0,0,0,100,0),
(@PATH,5,-8816.018,2179.885,21.5113,0,0,0,0,100,0),
(@PATH,6,-8825.034,2192.031,21.5113,0,0,0,0,100,0),
(@PATH,7,-8816.018,2179.885,21.5113,0,0,0,0,100,0),
(@PATH,8,-8804.847,2146.174,21.5113,0,0,0,0,100,0),
(@PATH,9,-8790.493,2121.913,21.39743,0,0,0,0,100,0),
(@PATH,10,-8783.41,2098.071,21.99277,0,0,0,0,100,0);

-- Pathing for Obsidian Destroyer Entry: 15338 'TDB FORMAT' 
SET @NPC := @CGUID+180;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8973.863,`position_y`=2090.781,`position_z`=21.51132 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '19818');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8973.863,2090.781,21.51132,0,0,0,0,100,0),
(@PATH,2,-8965.227,2063.428,21.51132,0,0,0,0,100,0),
(@PATH,3,-8973.863,2090.781,21.51132,0,0,0,0,100,0),
(@PATH,4,-8997.472,2114.756,21.51132,0,0,0,0,100,0),
(@PATH,5,-9038.394,2142.94,21.51132,0,0,0,0,100,0),
(@PATH,6,-9071.605,2173.132,21.51134,0,0,0,0,100,0),
(@PATH,7,-9100.489,2204.315,21.51138,0,0,0,0,100,0),
(@PATH,8,-9128.889,2235.459,21.51138,0,0,0,0,100,0),
(@PATH,9,-9100.489,2204.315,21.51138,0,0,0,0,100,0),
(@PATH,10,-9071.605,2173.132,21.51134,0,0,0,0,100,0),
(@PATH,11,-9038.394,2142.94,21.51132,0,0,0,0,100,0),
(@PATH,12,-8997.472,2114.756,21.51132,0,0,0,0,100,0);

-- Pathing for Obsidian Destroyer Entry: 15338 'TDB FORMAT' 
SET @NPC := @CGUID+181;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8816.171,`position_y`=1898.789,`position_z`=21.44084 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '19818');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8816.171,1898.789,21.44084,0,0,0,0,100,0),
(@PATH,2,-8839.262,1867.66,21.49597,0,0,0,0,100,0),
(@PATH,3,-8816.171,1898.789,21.44084,0,0,0,0,100,0),
(@PATH,4,-8802.058,1921.186,21.51134,0,0,0,0,100,0),
(@PATH,5,-8793.903,1947.559,21.41075,0,0,0,0,100,0),
(@PATH,6,-8790.971,1971.102,21.51134,0,0,0,0,100,0),
(@PATH,7,-8789.137,2003.844,21.50675,0,0,0,0,100,0),
(@PATH,8,-8786.372,2039.531,21.51132,0,0,0,0,100,0),
(@PATH,9,-8789.137,2003.844,21.50675,0,0,0,0,100,0),
(@PATH,10,-8790.971,1971.102,21.51134,0,0,0,0,100,0),
(@PATH,11,-8793.903,1947.559,21.41075,0,0,0,0,100,0),
(@PATH,12,-8802.058,1921.186,21.51134,0,0,0,0,100,0);

-- Pathing for Obsidian Destroyer Entry: 15338 'TDB FORMAT' 
SET @NPC := @CGUID+182;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8969.802,`position_y`=2023.487,`position_z`=22.20616 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '19818');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8969.802,2023.487,22.20616,0,0,0,0,100,0),
(@PATH,2,-8944.742,2022.87,21.63633,0,0,0,0,100,0),
(@PATH,3,-8921.641,2023.073,22.70727,0,0,0,0,100,0),
(@PATH,4,-8898.989,2022.108,20.80474,0,0,0,0,100,0),
(@PATH,5,-8863.61,2021.74,20.80473,0,0,0,0,100,0),
(@PATH,6,-8823.653,2020.322,22.78971,0,0,0,0,100,0),
(@PATH,7,-8779.903,2018.759,21.7045,0,0,0,0,100,0),
(@PATH,8,-8823.653,2020.322,22.78971,0,0,0,0,100,0),
(@PATH,9,-8822.38,2017.285,22.79048,0,0,0,0,100,0),
(@PATH,10,-8863.61,2021.74,21.66928,0,0,0,0,100,0),
(@PATH,11,-8898.989,2022.108,20.80474,0,0,0,0,100,0),
(@PATH,12,-8921.641,2023.073,22.70727,0,0,0,0,100,0),
(@PATH,13,-8944.742,2022.87,21.63633,0,0,0,0,100,0);

-- Pathing for Obsidian Destroyer Entry: 15338 'TDB FORMAT' 
SET @NPC := @CGUID+183;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8892.271,`position_y`=1893.26,`position_z`=21.65431 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '19818');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8892.271,1893.26,21.65431,0,0,0,0,100,0),
(@PATH,2,-8920.27,1911.372,21.77089,0,0,0,0,100,0),
(@PATH,3,-8947.984,1930.219,22.32584,0,0,0,0,100,0),
(@PATH,4,-8976.198,1948.563,21.51134,0,0,0,0,100,0),
(@PATH,5,-8947.984,1930.219,22.32584,0,0,0,0,100,0),
(@PATH,6,-8920.27,1911.372,21.77089,0,0,0,0,100,0),
(@PATH,7,-8892.271,1893.26,21.77088,0,0,0,0,100,0),
(@PATH,8,-8868.629,1877.659,21.87304,0,0,0,0,100,0),
(@PATH,9,-8832.841,1852.986,21.54105,0,0,0,0,100,0),
(@PATH,10,-8868.629,1877.659,21.87304,0,0,0,0,100,0);

-- Pathing for Flesh Hunter Entry: 15335 'TDB FORMAT' 
SET @NPC := @CGUID+164;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9043.481,`position_y`=2118.309,`position_z`=21.77282 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9043.481,2118.309,21.77282,0,0,0,0,100,0),
(@PATH,2,-9015.23,2102.794,22.79501,0,0,0,0,100,0),
(@PATH,3,-8984.772,2078.662,21.99447,0,0,0,0,100,0),
(@PATH,4,-8946.997,2073.267,22.66354,0,0,0,0,100,0),
(@PATH,5,-8946.354,2104.688,23.20453,0,0,0,0,100,0),
(@PATH,6,-8979.36,2128.562,22.51132,0,0,0,0,100,0),
(@PATH,7,-9000.776,2157.609,23.0173,0,0,0,0,100,0),
(@PATH,8,-8997.853,2188.157,24.82291,0,0,0,0,100,0),
(@PATH,9,-8980.488,2222.645,24.47016,0,0,0,0,100,0),
(@PATH,10,-8947.694,2247.549,26.53898,0,0,0,0,100,0),
(@PATH,11,-8925.727,2254.902,22.93172,0,0,0,0,100,0),
(@PATH,12,-8899.796,2231.063,21.50976,0,0,0,0,100,0),
(@PATH,13,-8774.992,2122.031,27.18796,0,0,0,0,100,0),
(@PATH,14,-8788.56,2156.315,22.57724,0,0,0,0,100,0),
(@PATH,15,-8824.089,2150.349,21.5113,0,0,0,0,100,0),
(@PATH,16,-8847.282,2160.686,22.8295,0,0,0,0,100,0),
(@PATH,17,-8878.708,2195.174,24.06134,0,0,0,0,100,0),
(@PATH,18,-8899.255,2224.002,21.50976,0,0,0,0,100,0),
(@PATH,19,-8927.709,2249.856,23.44112,0,0,0,0,100,0),
(@PATH,20,-8943.206,2244.535,26.44963,0,0,0,0,100,0),
(@PATH,21,-8975.5,2223.893,23.89484,0,0,0,0,100,0),
(@PATH,22,-8992.835,2203.356,24.46564,0,0,0,0,100,0),
(@PATH,23,-9000.075,2177.49,24.70543,0,0,0,0,100,0),
(@PATH,24,-9022.258,2168.586,25.53624,0,0,0,0,100,0),
(@PATH,25,-9048.837,2191.075,25.16519,0,0,0,0,100,0),
(@PATH,26,-9067.234,2222.022,23.55216,0,0,0,0,100,0),
(@PATH,27,-9091.356,2246.307,25.71063,0,0,0,0,100,0),
(@PATH,28,-9117.254,2253.088,23.81876,0,0,0,0,100,0),
(@PATH,29,-9142.09,2238.851,22.44915,0,0,0,0,100,0),
(@PATH,30,-9146.989,2216.528,23.29689,0,0,0,0,100,0),
(@PATH,31,-9118.285,2185.291,22.93004,0,0,0,0,100,0),
(@PATH,32,-9102.656,2157.033,21.51134,0,0,0,0,100,0),
(@PATH,33,-9075.009,2145.98,23.58446,0,0,0,0,100,0);

-- Pathing for Flesh Hunter Entry: 15335 'TDB FORMAT' 
SET @NPC := @CGUID+165;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8937.627,`position_y`=1698.941,`position_z`=21.93345 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8937.627,1698.941,21.93345,0,0,0,0,100,0),
(@PATH,2,-8920.532,1729.919,21.51128,0,0,0,0,100,0),
(@PATH,3,-8908.218,1761.801,21.51128,0,0,0,0,100,0),
(@PATH,4,-8885.667,1785.599,21.55186,0,0,0,0,100,0),
(@PATH,5,-8865.728,1829.28,21.51134,0,0,0,0,100,0),
(@PATH,6,-8873.043,1860.568,24.12182,0,0,0,0,100,0),
(@PATH,7,-8840.51,1857.832,21.51134,0,0,0,0,100,0),
(@PATH,8,-8808.15,1884.686,21.48137,0,0,0,0,100,0),
(@PATH,9,-8789.465,1924.165,21.91466,0,0,0,0,100,0),
(@PATH,10,-8785.51,1961.738,22.2678,0,0,0,0,100,0),
(@PATH,11,-8795.169,2004.241,21.50675,0,0,0,0,100,0),
(@PATH,12,-8785.291,2024.753,21.50675,0,0,0,0,100,0),
(@PATH,13,-8781.997,2063.416,21.51132,0,0,0,0,100,0),
(@PATH,14,-8785.409,2085.489,21.51132,0,0,0,0,100,0),
(@PATH,15,-8800.996,2059.075,21.54108,0,0,0,0,100,0),
(@PATH,16,-8797.33,2012.523,21.50675,0,0,0,0,100,0),
(@PATH,17,-8785.368,1995.146,21.51134,0,0,0,0,100,0),
(@PATH,18,-8796.997,1956.54,21.51133,0,0,0,0,100,0),
(@PATH,19,-8803.447,1922.115,21.51134,0,0,0,0,100,0),
(@PATH,20,-8826.821,1891.991,21.44084,0,0,0,0,100,0),
(@PATH,21,-8853.722,1857.549,21.64537,0,0,0,0,100,0),
(@PATH,22,-8875.416,1831.338,21.5401,0,0,0,0,100,0),
(@PATH,23,-8891.538,1801.722,21.40265,0,0,0,0,100,0),
(@PATH,24,-8913.353,1764.123,21.51128,0,0,0,0,100,0),
(@PATH,25,-8932.728,1722.069,21.51128,0,0,0,0,100,0),
(@PATH,26,-8953.999,1702.306,21.51128,0,0,0,0,100,0),
(@PATH,27,-8971.226,1712.679,22.30425,0,0,0,0,100,0),
(@PATH,28,-8992.638,1723.895,21.95708,0,0,0,0,100,0),
(@PATH,29,-9019.508,1750.176,21.47298,0,0,0,0,100,0),
(@PATH,30,-9050.058,1757.618,21.51128,0,0,0,0,100,0),
(@PATH,31,-9067.125,1783.419,21.51128,0,0,0,0,100,0),
(@PATH,32,-9051.433,1827.842,21.51132,0,0,0,0,100,0),
(@PATH,33,-9017.392,1854.547,21.78888,0,0,0,0,100,0),
(@PATH,34,-9005.049,1877.975,22.21676,0,0,0,0,100,0),
(@PATH,35,-9007.448,1920.794,21.51132,0,0,0,0,100,0),
(@PATH,36,-8989.702,1949.567,22.3109,0,0,0,0,100,0),
(@PATH,37,-8979.287,1983.77,21.65501,0,0,0,0,100,0),
(@PATH,38,-8973.602,2011.78,21.51134,0,0,0,0,100,0),
(@PATH,39,-8968.567,2049.794,21.88634,0,0,0,0,100,0),
(@PATH,40,-8969.888,2083.404,21.51132,0,0,0,0,100,0),
(@PATH,41,-8956.057,2078.304,21.806,0,0,0,0,100,0),
(@PATH,42,-8938.739,2045.659,22.83847,0,0,0,0,100,0),
(@PATH,43,-8939.479,2009.669,22.33628,0,0,0,0,100,0),
(@PATH,44,-8953.139,1989.581,21.85654,0,0,0,0,100,0),
(@PATH,45,-8956.321,1957.073,21.82368,0,0,0,0,100,0),
(@PATH,46,-8969.141,1927.572,22.15987,0,0,0,0,100,0),
(@PATH,47,-8989.028,1899.803,21.95286,0,0,0,0,100,0),
(@PATH,48,-9020.87,1876.037,21.51132,0,0,0,0,100,0),
(@PATH,49,-9055.008,1842.989,22.47308,0,0,0,0,100,0),
(@PATH,50,-9084.486,1817.886,25.49034,0,0,0,0,100,0),
(@PATH,51,-9097.041,1783.97,21.51128,0,0,0,0,100,0),
(@PATH,52,-9118.29,1753.874,22.52647,0,0,0,0,100,0),
(@PATH,53,-9093.203,1728.075,24.58226,0,0,0,0,100,0),
(@PATH,54,-9052.174,1708.394,21.50263,0,0,0,0,100,0),
(@PATH,55,-9020.147,1686.075,21.61656,0,0,0,0,100,0),
(@PATH,56,-8986.377,1657.262,22.46316,0,0,0,0,100,0),
(@PATH,57,-8964.914,1648.625,24.69013,0,0,0,0,100,0),
(@PATH,58,-8944.825,1659.208,24.58833,0,0,0,0,100,0);

-- Pathing for Flesh Hunter Entry: 15335 'TDB FORMAT' 
SET @NPC := @CGUID+166;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9290.099,`position_y`=1380.387,`position_z`=21.38616 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9290.099,1380.387,21.38616,0,0,0,0,100,0),
(@PATH,2,-9266.542,1382.812,21.44118,0,0,0,0,100,0),
(@PATH,3,-9243.845,1402.906,23.31999,0,0,0,0,100,0),
(@PATH,4,-9224.515,1442.994,24.32664,0,0,0,0,100,0),
(@PATH,5,-9206.087,1475.642,25.78873,0,0,0,0,100,0),
(@PATH,6,-9173.119,1482.051,21.5113,0,0,0,0,100,0),
(@PATH,7,-9176.457,1441.36,22.84715,0,0,0,0,100,0),
(@PATH,8,-9192.751,1415.595,22.71139,0,0,0,0,100,0),
(@PATH,9,-9214.301,1378.276,21.75317,0,0,0,0,100,0),
(@PATH,10,-9213.823,1340.182,21.47529,0,0,0,0,100,0),
(@PATH,11,-9186.384,1316.321,21.47732,0,0,0,0,100,0),
(@PATH,12,-9146.026,1309.063,22.9012,0,0,0,0,100,0),
(@PATH,13,-9186.384,1316.321,21.47732,0,0,0,0,100,0),
(@PATH,14,-9213.823,1340.182,21.47529,0,0,0,0,100,0),
(@PATH,15,-9214.301,1378.276,21.75317,0,0,0,0,100,0),
(@PATH,16,-9192.751,1415.595,22.71139,0,0,0,0,100,0),
(@PATH,17,-9176.457,1441.36,22.84715,0,0,0,0,100,0),
(@PATH,18,-9173.119,1482.051,21.5113,0,0,0,0,100,0),
(@PATH,19,-9206.087,1475.642,25.78873,0,0,0,0,100,0),
(@PATH,20,-9224.515,1442.994,24.32664,0,0,0,0,100,0),
(@PATH,21,-9243.845,1402.906,23.31999,0,0,0,0,100,0),
(@PATH,22,-9266.542,1382.812,21.44118,0,0,0,0,100,0),
(@PATH,23,-9290.099,1380.387,21.48297,0,10000,0,0,100,0),
(@PATH,24,-9305.492,1403.459,25.60786,0,15000,0,0,100,0);

-- Pathing for Flesh Hunter Entry: 15335 'TDB FORMAT' 
SET @NPC := @CGUID+167;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9452.126,`position_y`=1337.869,`position_z`=21.42187 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9452.126,1337.869,21.42187,0,0,0,0,100,0),
(@PATH,2,-9417.646,1355.137,22.36102,0,0,0,0,100,0),
(@PATH,3,-9403.974,1352.924,21.39361,0,0,0,0,100,0),
(@PATH,4,-9432.193,1352.471,21.55352,0,0,0,0,100,0),
(@PATH,5,-9457.63,1330.037,21.44484,0,0,0,0,100,0),
(@PATH,6,-9442.115,1301.084,18.79591,0,0,0,0,100,0),
(@PATH,7,-9421.976,1294.538,6.835041,0,0,0,0,100,0),
(@PATH,8,-9395.618,1285.335,-8.039509,0,0,0,0,100,0),
(@PATH,9,-9381.646,1286.155,-14.88204,0,0,0,0,100,0),
(@PATH,10,-9364.117,1279.244,-22.36019,0,0,0,0,100,0),
(@PATH,11,-9341.927,1257.022,-42.71544,0,0,0,0,100,0),
(@PATH,12,-9358.893,1279.803,-24.58626,0,0,0,0,100,0),
(@PATH,13,-9378.188,1284.211,-16.61263,0,0,0,0,100,0),
(@PATH,14,-9402.994,1287.507,-3.193645,0,0,0,0,100,0),
(@PATH,15,-9429.794,1296.828,10.47188,0,0,0,0,100,0),
(@PATH,16,-9459.201,1309.284,21.44484,0,0,0,0,100,0),
(@PATH,17,-9449.167,1266.607,21.47515,0,0,0,0,100,0),
(@PATH,18,-9420.796,1250.398,21.60155,0,0,0,0,100,0),
(@PATH,19,-9449.167,1266.607,21.47515,0,0,0,0,100,0),
(@PATH,20,-9459.201,1309.284,21.44484,0,0,0,0,100,0),
(@PATH,21,-9429.794,1296.828,10.47188,0,0,0,0,100,0),
(@PATH,22,-9403.174,1287.535,-3.026531,0,0,0,0,100,0),
(@PATH,23,-9378.188,1284.211,-16.61263,0,0,0,0,100,0),
(@PATH,24,-9358.893,1279.803,-24.58626,0,0,0,0,100,0),
(@PATH,25,-9341.927,1257.022,-42.71544,0,0,0,0,100,0),
(@PATH,26,-9364.117,1279.244,-22.36019,0,0,0,0,100,0),
(@PATH,27,-9381.559,1286.167,-14.92842,0,0,0,0,100,0),
(@PATH,28,-9395.531,1285.347,-8.382038,0,0,0,0,100,0),
(@PATH,29,-9421.976,1294.538,6.835041,0,0,0,0,100,0),
(@PATH,30,-9442.115,1301.084,18.79591,0,0,0,0,100,0),
(@PATH,31,-9457.63,1330.037,21.44484,0,0,0,0,100,0),
(@PATH,32,-9432.193,1352.471,21.55352,0,0,0,0,100,0),
(@PATH,33,-9403.974,1352.924,21.39361,0,0,0,0,100,0),
(@PATH,34,-9417.646,1355.137,22.36102,0,0,0,0,100,0),
(@PATH,35,-9452.126,1337.869,21.42187,0,0,0,0,100,0),
(@PATH,36,-9460.447,1307.998,21.44484,0,0,0,0,100,0),
(@PATH,37,-9451.692,1280.025,21.41385,0,0,0,0,100,0),
(@PATH,38,-9436.887,1255.127,21.91142,0,0,0,0,100,0),
(@PATH,39,-9402.084,1241.667,21.54369,0,0,0,0,100,0),
(@PATH,40,-9382.529,1226.703,21.4241,0,0,0,0,100,0),
(@PATH,41,-9401.425,1241.072,21.55248,0,0,0,0,100,0),
(@PATH,42,-9436.887,1255.127,21.91142,0,0,0,0,100,0),
(@PATH,43,-9451.692,1280.025,21.41385,0,0,0,0,100,0),
(@PATH,44,-9460.447,1307.998,21.44484,0,0,0,0,100,0);

-- Pathing for Qiraji Swarmguard Entry: 15343 'TDB FORMAT' 
SET @NPC := @CGUID+187;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8715.07,`position_y`=1514.421,`position_z`=32.02237 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8715.07,1514.421,32.02237,0,0,0,0,100,0),
(@PATH,2,-8707.966,1495.304,32.03201,0,0,0,0,100,0),
(@PATH,3,-8676.498,1465.334,32.03133,0,0,0,0,100,0),
(@PATH,4,-8674.114,1424.483,32.03201,0,0,0,0,100,0),
(@PATH,5,-8676.498,1465.334,32.03133,0,0,0,0,100,0),
(@PATH,6,-8707.966,1495.304,32.03201,0,0,0,0,100,0),
(@PATH,7,-8715.07,1514.421,32.02237,0,0,0,0,100,0),
(@PATH,8,-8683.518,1489.15,32.03194,0,0,0,0,100,0),
(@PATH,9,-8652.897,1459.573,32.03194,0,0,0,0,100,0),
(@PATH,10,-8624.121,1441.949,32.86404,0,0,0,0,100,0),
(@PATH,11,-8632.826,1463.566,32.03201,0,0,0,0,100,0),
(@PATH,12,-8643.889,1475.416,32.00608,0,0,0,0,100,0),
(@PATH,13,-8605.078,1462.348,32.03201,0,0,0,0,100,0),
(@PATH,14,-8608.562,1487.01,32.13507,0,0,0,0,100,0),
(@PATH,15,-8598.64,1521.189,37.2549,0,0,0,0,100,0),
(@PATH,16,-8624.487,1500.118,31.95148,0,0,0,0,100,0),
(@PATH,17,-8650.246,1484.845,32.00608,0,0,0,0,100,0),
(@PATH,18,-8627.65,1525.419,32.07648,0,0,0,0,100,0),
(@PATH,19,-8658.124,1488.298,32.00608,0,0,0,0,100,0),
(@PATH,20,-8649.376,1536.51,32.03201,0,0,0,0,100,0),
(@PATH,21,-8678.199,1552.388,31.96736,0,0,0,0,100,0),
(@PATH,22,-8649.376,1536.51,32.03201,0,0,0,0,100,0),
(@PATH,23,-8658.124,1488.298,32.00608,0,0,0,0,100,0),
(@PATH,24,-8627.65,1525.419,32.07648,0,0,0,0,100,0),
(@PATH,25,-8650.246,1484.845,32.00608,0,0,0,0,100,0),
(@PATH,26,-8624.487,1500.118,31.95148,0,0,0,0,100,0),
(@PATH,27,-8598.64,1521.189,37.2549,0,0,0,0,100,0),
(@PATH,28,-8608.562,1487.01,32.13507,0,0,0,0,100,0),
(@PATH,29,-8605.078,1462.348,32.03201,0,0,0,0,100,0),
(@PATH,30,-8643.889,1475.416,32.00608,0,0,0,0,100,0),
(@PATH,31,-8632.826,1463.566,32.03201,0,0,0,0,100,0),
(@PATH,32,-8624.121,1441.949,32.86404,0,0,0,0,100,0),
(@PATH,33,-8652.897,1459.573,32.03194,0,0,0,0,100,0),
(@PATH,34,-8683.518,1489.15,32.03194,0,0,0,0,100,0);

-- Pathing for Qiraji Swarmguard Entry: 15343 'TDB FORMAT' 
SET @NPC := @CGUID+188;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8626.872,`position_y`=1393.024,`position_z`=32.11965 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8626.872,1393.024,32.11965,0,0,0,0,100,0),
(@PATH,2,-8612.871,1397.043,32.03201,0,0,0,0,100,0),
(@PATH,3,-8601.797,1405.588,33.28201,0,0,0,0,100,0),
(@PATH,4,-8597.448,1422.481,32.04214,0,0,0,0,100,0),
(@PATH,5,-8602.82,1435.621,32.58205,0,0,0,0,100,0),
(@PATH,6,-8614.282,1446.714,32.03201,0,0,0,0,100,0),
(@PATH,7,-8632.753,1445.288,32.78201,0,0,0,0,100,0),
(@PATH,8,-8648.204,1430.458,32.16177,0,0,0,0,100,0),
(@PATH,9,-8651.211,1414.462,32.32424,0,0,0,0,100,0),
(@PATH,10,-8639.497,1397.023,32.03201,0,0,0,0,100,0);

-- Pathing for Qiraji Swarmguard Entry: 15343 'TDB FORMAT' 
SET @NPC := @CGUID+189;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8698.72,`position_y`=1557.427,`position_z`=31.96736 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8698.72,1557.427,31.96736,0,0,0,0,100,0),
(@PATH,2,-8727.424,1587.903,21.51132,0,0,0,0,100,0),
(@PATH,3,-8745.534,1586.328,21.51132,0,0,0,0,100,0),
(@PATH,4,-8750.269,1568.49,23.20175,0,0,0,0,100,0),
(@PATH,5,-8749.061,1555.604,27.10514,0,0,0,0,100,0),
(@PATH,6,-8745.534,1586.328,21.51132,0,0,0,0,100,0),
(@PATH,7,-8727.424,1587.903,21.51132,0,0,0,0,100,0),
(@PATH,8,-8698.72,1557.427,31.96736,0,0,0,0,100,0),
(@PATH,9,-8677.868,1540.741,31.96736,0,0,0,0,100,0),
(@PATH,10,-8652.031,1526.245,32.03201,0,0,0,0,100,0),
(@PATH,11,-8631.435,1513.663,31.95148,0,0,0,0,100,0),
(@PATH,12,-8620.831,1486.299,31.94367,0,0,0,0,100,0),
(@PATH,13,-8631.435,1513.663,31.95148,0,0,0,0,100,0),
(@PATH,14,-8652.031,1526.245,32.03201,0,0,0,0,100,0),
(@PATH,15,-8677.868,1540.741,31.96736,0,0,0,0,100,0);

-- Pathing for Qiraji Swarmguard Entry: 15343 'TDB FORMAT' 
SET @NPC := @CGUID+190;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8596.261,`position_y`=1445.324,`position_z`=32.03201 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8596.261,1445.324,32.03201,0,0,0,0,100,0),
(@PATH,2,-8579.316,1455.001,32.57644,0,0,0,0,100,0),
(@PATH,3,-8558.855,1463.694,32.03201,0,0,0,0,100,0),
(@PATH,4,-8544.131,1479.762,32.15701,0,0,0,0,100,0),
(@PATH,5,-8534.158,1494.747,32.78201,0,0,0,0,100,0),
(@PATH,6,-8523.998,1511.022,32.90698,0,0,0,0,100,0),
(@PATH,7,-8515.556,1523.541,32.28198,0,0,0,0,100,0),
(@PATH,8,-8501.833,1535.644,32.03198,0,0,0,0,100,0),
(@PATH,9,-8523.998,1511.022,32.90698,0,0,0,0,100,0),
(@PATH,10,-8534.158,1494.747,32.78201,0,0,0,0,100,0),
(@PATH,11,-8544.131,1479.762,32.15701,0,0,0,0,100,0),
(@PATH,12,-8558.855,1463.694,32.03201,0,0,0,0,100,0),
(@PATH,13,-8579.316,1455.001,32.57644,0,0,0,0,100,0),
(@PATH,14,-8596.261,1445.324,32.03201,0,0,0,0,100,0),
(@PATH,15,-8609.186,1444.716,32.03201,0,0,0,0,100,0),
(@PATH,16,-8624.747,1453.474,32.03201,0,0,0,0,100,0),
(@PATH,17,-8648.166,1437.747,32.03194,0,0,0,0,100,0),
(@PATH,18,-8653.364,1427.667,32.90701,0,0,0,0,100,0),
(@PATH,19,-8652.444,1412.949,32.52126,0,0,0,0,100,0),
(@PATH,20,-8635.768,1394.096,32.03201,0,0,0,0,100,0),
(@PATH,21,-8624.594,1389.992,32.03201,0,0,0,0,100,0),
(@PATH,22,-8605.42,1395.665,32.03201,0,0,0,0,100,0),
(@PATH,23,-8594.566,1415.467,32.03201,0,0,0,0,100,0),
(@PATH,24,-8599.567,1429.468,32.63076,0,0,0,0,100,0),
(@PATH,25,-8620.474,1447.892,32.03201,0,0,0,0,100,0),
(@PATH,26,-8632.201,1448.974,32.83376,0,0,0,0,100,0),
(@PATH,27,-8648.3,1425.739,32.86428,0,0,0,0,100,0),
(@PATH,28,-8647.554,1415.542,32.81582,0,0,0,0,100,0),
(@PATH,29,-8634.466,1397.044,32.08352,0,0,0,0,100,0),
(@PATH,30,-8612.184,1395.429,32.03201,0,0,0,0,100,0),
(@PATH,31,-8602.937,1404.893,33.18166,0,0,0,0,100,0),
(@PATH,32,-8606.291,1430.675,33.09939,0,0,0,0,100,0),
(@PATH,33,-8614.849,1438.85,32.68252,0,0,0,0,100,0),
(@PATH,34,-8636.876,1442.12,32.39876,0,0,0,0,100,0),
(@PATH,35,-8642.267,1432.34,32.03201,0,0,0,0,100,0),
(@PATH,36,-8640.708,1410.744,33.11062,0,0,0,0,100,0),
(@PATH,37,-8625.944,1401.671,32.70779,0,0,0,0,100,0),
(@PATH,38,-8607.826,1407.917,32.91775,0,0,0,0,100,0),
(@PATH,39,-8610.313,1427.698,33.28201,0,0,0,0,100,0),
(@PATH,40,-8622.624,1437.455,33.24148,0,0,0,0,100,0),
(@PATH,41,-8629.749,1439.459,32.77468,0,0,0,0,100,0),
(@PATH,42,-8605.587,1416.063,33.04202,0,0,0,0,100,0),
(@PATH,43,-8607.826,1407.917,32.91775,0,0,0,0,100,0),
(@PATH,44,-8625.944,1401.671,32.70779,0,0,0,0,100,0),
(@PATH,45,-8640.708,1410.744,33.11062,0,0,0,0,100,0),
(@PATH,46,-8642.267,1432.34,32.03201,0,0,0,0,100,0),
(@PATH,47,-8623.281,1444.953,32.4501,0,0,0,0,100,0),
(@PATH,48,-8614.849,1438.85,32.68252,0,0,0,0,100,0),
(@PATH,49,-8600.551,1419.44,32.26528,0,0,0,0,100,0),
(@PATH,50,-8602.937,1404.893,33.18166,0,0,0,0,100,0),
(@PATH,51,-8625.483,1394.269,32.41152,0,0,0,0,100,0),
(@PATH,52,-8634.466,1397.044,32.08352,0,0,0,0,100,0),
(@PATH,53,-8647.554,1415.542,32.81582,0,0,0,0,100,0),
(@PATH,54,-8643.316,1438.734,32.03194,0,0,0,0,100,0),
(@PATH,55,-8632.201,1448.974,32.83376,0,0,0,0,100,0),
(@PATH,56,-8608.438,1441.045,32.11904,0,0,0,0,100,0),
(@PATH,57,-8599.567,1429.468,32.63076,0,0,0,0,100,0),
(@PATH,58,-8594.566,1415.467,32.03201,0,0,0,0,100,0),
(@PATH,59,-8605.42,1395.665,32.03201,0,0,0,0,100,0),
(@PATH,60,-8624.594,1389.992,32.03201,0,0,0,0,100,0),
(@PATH,61,-8642.364,1400.395,32.03201,0,0,0,0,100,0),
(@PATH,62,-8652.444,1412.949,32.52126,0,0,0,0,100,0),
(@PATH,63,-8653.364,1427.667,32.90701,0,0,0,0,100,0),
(@PATH,64,-8638.11,1450.366,33.01338,0,0,0,0,100,0),
(@PATH,65,-8624.747,1453.474,32.03201,0,0,0,0,100,0),
(@PATH,66,-8609.186,1444.716,32.03201,0,0,0,0,100,0);

-- Pathing for Qiraji Swarmguard Entry: 15343 'TDB FORMAT' 
SET @NPC := @CGUID+191;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8554.364,`position_y`=1453.022,`position_z`=32.44558 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8554.364,1453.022,32.44558,0,0,0,0,100,0),
(@PATH,2,-8531.382,1409.837,32.03201,0,0,0,0,100,0),
(@PATH,3,-8565.742,1422.705,32.03201,0,0,0,0,100,0),
(@PATH,4,-8597.424,1431.692,32.89761,0,0,0,0,100,0),
(@PATH,5,-8579.544,1395.944,32.03201,0,0,0,0,100,0),
(@PATH,6,-8568.221,1369.643,32.03201,0,0,0,0,100,0),
(@PATH,7,-8550.396,1335.821,32.04605,0,0,0,0,100,0),
(@PATH,8,-8568.221,1369.643,32.03201,0,0,0,0,100,0),
(@PATH,9,-8579.544,1395.944,32.03201,0,0,0,0,100,0),
(@PATH,10,-8597.424,1431.692,32.89761,0,0,0,0,100,0),
(@PATH,11,-8565.742,1422.705,32.03201,0,0,0,0,100,0),
(@PATH,12,-8531.382,1409.837,32.03201,0,0,0,0,100,0),
(@PATH,13,-8554.364,1453.022,32.44558,0,0,0,0,100,0),
(@PATH,14,-8585.673,1436.706,32.06472,0,0,0,0,100,0),
(@PATH,15,-8605.817,1458.296,32.03201,0,0,0,0,100,0),
(@PATH,16,-8571.966,1465.175,32.03201,0,0,0,0,100,0),
(@PATH,17,-8599.507,1480.402,32.61454,0,0,0,0,100,0),
(@PATH,18,-8571.966,1465.175,32.03201,0,0,0,0,100,0),
(@PATH,19,-8605.817,1458.296,32.03201,0,0,0,0,100,0),
(@PATH,20,-8585.673,1436.706,32.06472,0,0,0,0,100,0);

-- Pathing for Qiraji Swarmguard Entry: 15343 'TDB FORMAT' 
SET @NPC := @CGUID+192;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8601.664,`position_y`=1390.749,`position_z`=32.03201 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8601.664,1390.749,32.03201,0,0,0,0,100,0),
(@PATH,2,-8591.866,1403.699,32.15054,0,0,0,0,100,0),
(@PATH,3,-8588.45,1414.927,32.03201,0,0,0,0,100,0),
(@PATH,4,-8586.888,1427.869,33.06387,0,0,0,0,100,0),
(@PATH,5,-8591.98,1441.59,31.97866,0,0,0,0,100,0),
(@PATH,6,-8604.068,1451.8,32.03201,0,0,0,0,100,0),
(@PATH,7,-8622.909,1456.538,32.03201,0,0,0,0,100,0),
(@PATH,8,-8642.18,1452.721,32.90791,0,0,0,0,100,0),
(@PATH,9,-8653.962,1444.923,32.03194,0,0,0,0,100,0),
(@PATH,10,-8662.412,1435.851,32.79219,0,0,0,0,100,0),
(@PATH,11,-8661.74,1419.056,32.18276,0,0,0,0,100,0),
(@PATH,12,-8654.638,1405.104,33.02615,0,0,0,0,100,0),
(@PATH,13,-8639.636,1390.926,32.03201,0,0,0,0,100,0),
(@PATH,14,-8622.461,1385.466,32.03201,0,0,0,0,100,0);

-- Pathing for Hive'Zara Stinger Entry: 15327 'TDB FORMAT' 
SET @NPC := @CGUID+104;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8529.958,`position_y`=1364.049,`position_z`=36.8613 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8529.958,`position_y`=1364.049,`position_z`=36.8613 WHERE `guid`=@CGUID+73;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8529.958,`position_y`=1364.049,`position_z`=36.8613 WHERE `guid`=@CGUID+74;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@CGUID+73,@CGUID+74);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@CGUID+73,@PATH,0,0,1,0, ''),(@CGUID+74,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8529.958,1364.049,36.8613,0,0,0,0,100,0),
(@PATH,2,-8539.803,1346.646,35.40701,0,0,0,0,100,0),
(@PATH,3,-8548.704,1332.98,32.31227,0,0,0,0,100,0),
(@PATH,4,-8558.811,1320.909,33.84633,0,0,0,0,100,0),
(@PATH,5,-8566.942,1311.42,35.92106,0,0,0,0,100,0),
(@PATH,6,-8576.419,1309.016,37.23088,0,0,0,0,100,0),
(@PATH,7,-8584.488,1311.995,38.23796,0,0,0,0,100,0),
(@PATH,8,-8595.519,1311.563,38.18644,0,0,0,0,100,0),
(@PATH,9,-8600.222,1319.612,36.98295,0,0,0,0,100,0),
(@PATH,10,-8607.076,1327.968,35.15849,0,0,0,0,100,0),
(@PATH,11,-8615.813,1346.86,34.1813,0,0,0,0,100,0),
(@PATH,12,-8625.896,1351.781,33.83559,0,0,0,0,100,0),
(@PATH,13,-8640.597,1348.754,32.22292,0,0,0,0,100,0),
(@PATH,14,-8656.664,1339.812,32.06704,0,0,0,0,100,0),
(@PATH,15,-8665.035,1340.468,32.31985,0,0,0,0,100,0),
(@PATH,16,-8675.461,1346.442,32.03201,0,0,0,0,100,0),
(@PATH,17,-8681.545,1352.296,32.03201,0,0,0,0,100,0),
(@PATH,18,-8689.306,1363.689,32.03201,0,0,0,0,100,0),
(@PATH,19,-8689.081,1377.316,32.1592,0,0,0,0,100,0),
(@PATH,20,-8689.243,1386.516,32.03201,0,0,0,0,100,0),
(@PATH,21,-8689.553,1391.781,32.03201,0,0,0,0,100,0),
(@PATH,22,-8696.313,1401.926,32.03201,0,0,0,0,100,0),
(@PATH,23,-8710.984,1403.616,32.03201,0,0,0,0,100,0),
(@PATH,24,-8725,1401.026,32.09084,0,0,0,0,100,0),
(@PATH,25,-8731.581,1405.537,33.48586,0,0,0,0,100,0),
(@PATH,26,-8734.479,1414.433,36.20397,0,0,0,0,100,0),
(@PATH,27,-8732.03,1423.297,37.67117,0,0,0,0,100,0),
(@PATH,28,-8725.299,1431.885,36.10378,0,0,0,0,100,0),
(@PATH,29,-8707.934,1441.262,33.016,0,0,0,0,100,0),
(@PATH,30,-8698.775,1448.582,32.44686,0,0,0,0,100,0),
(@PATH,31,-8689.356,1462.353,32.23666,0,0,0,0,100,0),
(@PATH,32,-8689.169,1472.879,32.03194,0,0,0,0,100,0),
(@PATH,33,-8700.186,1486.412,32.03201,0,0,0,0,100,0),
(@PATH,34,-8713.146,1492.665,32.6149,0,0,0,0,100,0),
(@PATH,35,-8722.861,1496.83,33.90457,0,0,0,0,100,0),
(@PATH,36,-8729.367,1504.248,33.60392,0,0,0,0,100,0),
(@PATH,37,-8722.961,1517.956,31.73966,0,0,0,0,100,0),
(@PATH,38,-8709.675,1523.971,32.02237,0,0,0,0,100,0),
(@PATH,39,-8700.321,1534.454,32.01286,0,0,0,0,100,0),
(@PATH,40,-8695.349,1544.921,31.96736,0,0,0,0,100,0),
(@PATH,41,-8681.404,1547.222,31.96736,0,0,0,0,100,0),
(@PATH,42,-8653.026,1542.493,32.03201,0,0,0,0,100,0),
(@PATH,43,-8647.881,1531.499,32.03201,0,0,0,0,100,0),
(@PATH,44,-8639.888,1526.415,32.03201,0,0,0,0,100,0),
(@PATH,45,-8626.61,1527.882,32.1098,0,0,0,0,100,0),
(@PATH,46,-8615.333,1529.297,33.04889,0,0,0,0,100,0),
(@PATH,47,-8607.277,1521.799,34.45148,0,0,0,0,100,0),
(@PATH,48,-8610.157,1511.149,32.29498,0,0,0,0,100,0),
(@PATH,49,-8613.661,1498.537,31.88141,0,0,0,0,100,0),
(@PATH,50,-8609.094,1485.39,31.94074,0,0,0,0,100,0),
(@PATH,51,-8598.721,1477.947,32.41422,0,0,0,0,100,0),
(@PATH,52,-8582.448,1473.503,32.78202,0,0,0,0,100,0),
(@PATH,53,-8562.289,1476.467,32.03201,0,0,0,0,100,0),
(@PATH,54,-8541.956,1473.268,32.03201,0,0,0,0,100,0),
(@PATH,55,-8537.244,1462.648,32.03201,0,0,0,0,100,0),
(@PATH,56,-8534.426,1453.312,32.03201,0,0,0,0,100,0),
(@PATH,57,-8529.186,1446.878,32.46731,0,0,0,0,100,0),
(@PATH,58,-8521.271,1435.866,32.78323,0,0,0,0,100,0),
(@PATH,59,-8523.449,1424.432,32.15139,0,0,0,0,100,0),
(@PATH,60,-8521.978,1406.374,32.03201,0,0,0,0,100,0),
(@PATH,61,-8518.832,1391.909,33.57486,0,0,0,0,100,0),
(@PATH,62,-8521.604,1377.789,34.2847,0,0,0,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@CGUID+73,8,315,2,0,0),
(@NPC,@CGUID+74,8,405,2,0,0);

-- Pathing for Hive'Zara Stinger Entry: 15327 'TDB FORMAT' 
SET @NPC := @CGUID+105;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8548.863,`position_y`=1386.292,`position_z`=32.03201 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8548.863,`position_y`=1386.292,`position_z`=32.03201 WHERE `guid`=@CGUID+75;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8548.863,`position_y`=1386.292,`position_z`=32.03201 WHERE `guid`=@CGUID+76;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@CGUID+75,@CGUID+76);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@CGUID+75,@PATH,0,0,1,0, ''),(@CGUID+76,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8548.863,1386.292,32.03201,0,0,0,0,100,0),
(@PATH,2,-8565.712,1372.886,32.03201,0,0,0,0,100,0),
(@PATH,3,-8581.622,1367.627,32.03201,0,0,0,0,100,0),
(@PATH,4,-8606.725,1366.843,32.03201,0,0,0,0,100,0),
(@PATH,5,-8632.288,1375.482,32.03201,0,0,0,0,100,0),
(@PATH,6,-8654.506,1394.647,32.03201,0,0,0,0,100,0),
(@PATH,7,-8671.173,1419.873,32.03201,0,0,0,0,100,0),
(@PATH,8,-8676.283,1440.234,32.03133,0,0,0,0,100,0),
(@PATH,9,-8667.241,1453.61,32.03133,0,0,0,0,100,0),
(@PATH,10,-8646.296,1471.409,32.00608,0,0,0,0,100,0),
(@PATH,11,-8622.894,1479.165,32.00641,0,0,0,0,100,0),
(@PATH,12,-8601.697,1470.526,32.00641,0,0,0,0,100,0),
(@PATH,13,-8572.213,1460.675,32.03201,0,0,0,0,100,0),
(@PATH,14,-8551.573,1441.729,32.03201,0,0,0,0,100,0),
(@PATH,15,-8540.968,1428.382,32.03201,0,0,0,0,100,0),
(@PATH,16,-8537.028,1406.539,32.03201,0,0,0,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@CGUID+75,8,315,2,0,0),
(@NPC,@CGUID+76,8,405,2,0,0);

-- Pathing for Hive'Zara Stinger Entry: 15327 'TDB FORMAT' 
SET @NPC := @CGUID+106;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8597.936,`position_y`=1369.124,`position_z`=32.03201 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8597.936,`position_y`=1369.124,`position_z`=32.03201 WHERE `guid`=@CGUID+77;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8597.936,`position_y`=1369.124,`position_z`=32.03201 WHERE `guid`=@CGUID+78;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@CGUID+77,@CGUID+78);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@CGUID+77,@PATH,0,0,1,0, ''),(@CGUID+78,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8597.936,1369.124,32.03201,0,0,0,0,100,0),
(@PATH,2,-8597.158,1401.358,32.62844,0,0,0,0,100,0),
(@PATH,3,-8590.24,1447.263,32.03201,0,0,0,0,100,0),
(@PATH,4,-8559.169,1456.705,32.03201,0,0,0,0,100,0),
(@PATH,5,-8590.24,1447.263,32.03201,0,0,0,0,100,0),
(@PATH,6,-8597.158,1401.358,32.62844,0,0,0,0,100,0),
(@PATH,7,-8597.936,1369.124,32.03201,0,0,0,0,100,0),
(@PATH,8,-8623.723,1352.624,33.90456,0,0,0,0,100,0),
(@PATH,9,-8662.29,1348.379,32.03201,0,0,0,0,100,0),
(@PATH,10,-8623.723,1352.624,33.90456,0,0,0,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@CGUID+77,8,315,2,0,0),
(@NPC,@CGUID+78,8,405,2,0,0);

-- Pathing for Hive'Zara Stinger Entry: 15327 'TDB FORMAT' 
SET @NPC := @CGUID+107;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8676.303,`position_y`=1523.413,`position_z`=32.03201 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8676.303,`position_y`=1523.413,`position_z`=32.03201 WHERE `guid`=@CGUID+79;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8676.303,`position_y`=1523.413,`position_z`=32.03201 WHERE `guid`=@CGUID+80;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@CGUID+79,@CGUID+80);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@CGUID+79,@PATH,0,0,1,0, ''),(@CGUID+80,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8676.303,1523.413,32.03201,0,0,0,0,100,0),
(@PATH,2,-8674.751,1532.686,32.03201,0,0,0,0,100,0),
(@PATH,3,-8666.7,1549.006,31.96736,0,0,0,0,100,0),
(@PATH,4,-8661.062,1564.438,32.03201,0,0,0,0,100,0),
(@PATH,5,-8653.452,1584.203,32.00211,0,0,0,0,100,0),
(@PATH,6,-8635.348,1595.124,32.00211,0,0,0,0,100,0),
(@PATH,7,-8623.174,1592.671,32.03201,0,0,0,0,100,0),
(@PATH,8,-8613.221,1590.594,32.03201,0,0,0,0,100,0),
(@PATH,9,-8601.792,1588.857,32.03201,0,0,0,0,100,0),
(@PATH,10,-8593.638,1591.012,32.03201,0,0,0,0,100,0),
(@PATH,11,-8587.351,1597.304,32.03201,0,0,0,0,100,0),
(@PATH,12,-8587.771,1604.197,31.95384,0,0,0,0,100,0),
(@PATH,13,-8592.951,1609.818,31.95384,0,0,0,0,100,0),
(@PATH,14,-8601.403,1614.527,31.92987,0,0,0,0,100,0),
(@PATH,15,-8609.681,1613.565,31.92987,0,0,0,0,100,0),
(@PATH,16,-8619.378,1610.386,31.92987,0,0,0,0,100,0),
(@PATH,17,-8635.724,1600.521,32.01131,0,0,0,0,100,0),
(@PATH,18,-8654.849,1586.285,32.00211,0,0,0,0,100,0),
(@PATH,19,-8667.545,1565.508,31.96736,0,0,0,0,100,0),
(@PATH,20,-8686.157,1545.365,31.96736,0,0,0,0,100,0),
(@PATH,21,-8700.114,1518.251,32.02237,0,0,0,0,100,0),
(@PATH,22,-8698.923,1495.54,32.03194,0,0,0,0,100,0),
(@PATH,23,-8684.854,1482.41,32.03194,0,0,0,0,100,0),
(@PATH,24,-8671.786,1476.209,32.03194,0,0,0,0,100,0),
(@PATH,25,-8662.458,1477.07,32.00608,0,0,0,0,100,0),
(@PATH,26,-8655.018,1486.244,32.00608,0,0,0,0,100,0),
(@PATH,27,-8657.109,1495.647,32.17112,0,0,0,0,100,0),
(@PATH,28,-8665.246,1506.262,32.1741,0,0,0,0,100,0),
(@PATH,29,-8672.817,1514.818,32.03201,0,0,0,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@CGUID+79,8,315,2,0,0),
(@NPC,@CGUID+80,8,405,2,0,0);

-- Pathing for Hive'Zara Stinger Entry: 15327 'TDB FORMAT' 
SET @NPC := @CGUID+108;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8658.216,`position_y`=1452.975,`position_z`=32.03194 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8658.216,`position_y`=1452.975,`position_z`=32.03194 WHERE `guid`=@CGUID+81;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8658.216,`position_y`=1452.975,`position_z`=32.03194 WHERE `guid`=@CGUID+82;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@CGUID+81,@CGUID+82);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@CGUID+81,@PATH,0,0,1,0, ''),(@CGUID+82,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8658.216,1452.975,32.03194,0,0,0,0,100,0),
(@PATH,2,-8641.388,1466.459,32.03194,0,0,0,0,100,0),
(@PATH,3,-8621.116,1464.743,32.03201,0,0,0,0,100,0),
(@PATH,4,-8585.999,1450.884,32.03201,0,0,0,0,100,0),
(@PATH,5,-8549.127,1432.836,32.03201,0,0,0,0,100,0),
(@PATH,6,-8542.808,1418.113,32.03201,0,0,0,0,100,0),
(@PATH,7,-8549.8,1395.085,32.03201,0,0,0,0,100,0),
(@PATH,8,-8563.838,1378,32.03201,0,0,0,0,100,0),
(@PATH,9,-8577.313,1367.248,32.03201,0,0,0,0,100,0),
(@PATH,10,-8597.477,1364.023,32.03201,0,0,0,0,100,0),
(@PATH,11,-8615.605,1370.76,32.03201,0,0,0,0,100,0),
(@PATH,12,-8634.19,1381.713,32.03201,0,0,0,0,100,0),
(@PATH,13,-8665.271,1407.404,32.16384,0,0,0,0,100,0),
(@PATH,14,-8671.109,1435.101,32.05587,0,0,0,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@CGUID+81,8,315,2,0,0),
(@NPC,@CGUID+82,8,405,2,0,0);

-- Pathing for Hive'Zara Stinger Entry: 15327 'TDB FORMAT' 
SET @NPC := @CGUID+109;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8729.304,`position_y`=1429.319,`position_z`=37.32424 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8729.304,`position_y`=1429.319,`position_z`=37.32424 WHERE `guid`=@CGUID+83;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8729.304,`position_y`=1429.319,`position_z`=37.32424 WHERE `guid`=@CGUID+84;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@CGUID+83,@CGUID+84);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@CGUID+83,@PATH,0,0,1,0, ''),(@CGUID+84,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8729.304,1429.319,37.32424,0,0,0,0,100,0),
(@PATH,2,-8706.372,1430.352,34.3594,0,0,0,0,100,0),
(@PATH,3,-8674.178,1445.882,32.03133,0,0,0,0,100,0),
(@PATH,4,-8669.013,1458.894,32.03133,0,0,0,0,100,0),
(@PATH,5,-8665.397,1470.97,32.00608,0,0,0,0,100,0),
(@PATH,6,-8640.486,1471.08,32.00608,0,0,0,0,100,0),
(@PATH,7,-8599.312,1477.941,32.30228,0,0,0,0,100,0),
(@PATH,8,-8640.486,1471.08,32.00608,0,0,0,0,100,0),
(@PATH,9,-8665.397,1470.97,32.00608,0,0,0,0,100,0),
(@PATH,10,-8669.013,1458.894,32.03133,0,0,0,0,100,0),
(@PATH,11,-8674.178,1445.882,32.03133,0,0,0,0,100,0),
(@PATH,12,-8706.372,1430.352,34.3594,0,0,0,0,100,0),
(@PATH,13,-8729.304,1429.319,37.32424,0,0,0,0,100,0),
(@PATH,14,-8713.892,1442.385,34.02357,0,0,0,0,100,0),
(@PATH,15,-8696.722,1461.607,33.19967,0,0,0,0,100,0),
(@PATH,16,-8671.114,1479.966,32.03194,0,0,0,0,100,0),
(@PATH,17,-8645.507,1492.281,32.76731,0,0,0,0,100,0),
(@PATH,18,-8621.361,1512.898,32.07648,0,0,0,0,100,0),
(@PATH,19,-8645.507,1492.281,32.76731,0,0,0,0,100,0),
(@PATH,20,-8671.114,1479.966,32.03194,0,0,0,0,100,0),
(@PATH,21,-8696.722,1461.607,33.19967,0,0,0,0,100,0),
(@PATH,22,-8713.892,1442.385,34.02357,0,0,0,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@CGUID+83,8,315,2,0,0),
(@NPC,@CGUID+84,8,405,2,0,0);

-- Pathing for Hive'Zara Stinger Entry: 15327 'TDB FORMAT' 
SET @NPC := @CGUID+110;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8764.116,`position_y`=1581.645,`position_z`=22.68807 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8764.116,`position_y`=1581.645,`position_z`=22.68807 WHERE `guid`=@CGUID+85;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8764.116,`position_y`=1581.645,`position_z`=22.68807 WHERE `guid`=@CGUID+86;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@CGUID+85,@CGUID+86);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@CGUID+85,@PATH,0,0,1,0, ''),(@CGUID+86,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8764.116,1581.645,22.68807,0,0,0,0,100,0),
(@PATH,2,-8753.808,1574.044,22.58163,0,0,0,0,100,0),
(@PATH,3,-8738.576,1574.061,21.51132,0,0,0,0,100,0),
(@PATH,4,-8725.54,1586.539,21.51132,0,0,0,0,100,0),
(@PATH,5,-8721.115,1598.405,21.51132,0,0,0,0,100,0),
(@PATH,6,-8716.487,1608.771,21.50764,0,0,0,0,100,0),
(@PATH,7,-8697.559,1617.893,21.50965,0,0,0,0,100,0),
(@PATH,8,-8689.124,1620.98,21.4054,0,0,0,0,100,0),
(@PATH,9,-8676.7,1633.637,21.5121,0,0,0,0,100,0),
(@PATH,10,-8664.844,1651.779,22.2621,0,0,0,0,100,0),
(@PATH,11,-8658.319,1668.855,21.51167,0,0,0,0,100,0),
(@PATH,12,-8664.207,1676.173,22.29316,0,0,0,0,100,0),
(@PATH,13,-8674.647,1676.72,22.07937,0,0,0,0,100,0),
(@PATH,14,-8683.002,1674.971,23.14468,0,0,0,0,100,0),
(@PATH,15,-8690.661,1662.559,23.09059,0,0,0,0,100,0),
(@PATH,16,-8692.645,1651.498,22.43434,0,0,0,0,100,0),
(@PATH,17,-8701.47,1635.077,22.32766,0,0,0,0,100,0),
(@PATH,18,-8713.073,1627.768,22.65229,0,0,0,0,100,0),
(@PATH,19,-8728.455,1620.784,21.50764,0,0,0,0,100,0),
(@PATH,20,-8742.18,1614.745,21.63534,0,0,0,0,100,0),
(@PATH,21,-8754.88,1604.404,22.26132,0,0,0,0,100,0),
(@PATH,22,-8767.513,1589.608,21.55936,0,0,0,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@CGUID+85,8,315,2,0,0),
(@NPC,@CGUID+86,8,405,2,0,0);

-- Pathing for Hive'Zara Stinger Entry: 15327 'TDB FORMAT' 
SET @NPC := @CGUID+111;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8767.31,`position_y`=1593.834,`position_z`=21.49979 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8767.31,`position_y`=1593.834,`position_z`=21.49979 WHERE `guid`=@CGUID+87;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8767.31,`position_y`=1593.834,`position_z`=21.49979 WHERE `guid`=@CGUID+88;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@CGUID+87,@CGUID+88);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@CGUID+87,@PATH,0,0,1,0, ''),(@CGUID+88,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8767.31,1593.834,21.49979,0,0,0,0,100,0),
(@PATH,2,-8770.036,1585.847,22.46646,0,0,0,0,100,0),
(@PATH,3,-8768.942,1580.037,24.6282,0,0,0,0,100,0),
(@PATH,4,-8761.078,1573.96,24.66903,0,0,0,0,100,0),
(@PATH,5,-8754.317,1573.614,23.1307,0,0,0,0,100,0),
(@PATH,6,-8749.495,1583.887,21.51132,0,0,0,0,100,0),
(@PATH,7,-8749.606,1598.333,22.0267,0,0,0,0,100,0),
(@PATH,8,-8744.066,1615.724,21.68685,0,0,0,0,100,0),
(@PATH,9,-8738.805,1626.016,22.66122,0,0,0,0,100,0),
(@PATH,10,-8737.81,1633.883,24.68712,0,0,0,0,100,0),
(@PATH,11,-8741.979,1643.341,28.25573,0,0,0,0,100,0),
(@PATH,12,-8748.667,1644.332,26.70861,0,0,0,0,100,0),
(@PATH,13,-8755.17,1639.595,23.78893,0,0,0,0,100,0),
(@PATH,14,-8756.532,1629.037,21.51132,0,0,0,0,100,0),
(@PATH,15,-8755.539,1614.518,21.83163,0,0,0,0,100,0),
(@PATH,16,-8761.656,1603.455,22.13632,0,0,0,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@CGUID+87,8,315,2,0,0),
(@NPC,@CGUID+88,8,405,2,0,0);

-- Pathing for Hive'Zara Stinger Entry: 15327 'TDB FORMAT' 
SET @NPC := @CGUID+112;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8812.028,`position_y`=1669.479,`position_z`=21.51077 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8812.028,`position_y`=1669.479,`position_z`=21.51077 WHERE `guid`=@CGUID+89;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8812.028,`position_y`=1669.479,`position_z`=21.51077 WHERE `guid`=@CGUID+90;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@CGUID+89,@CGUID+90);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@CGUID+89,@PATH,0,0,1,0, ''),(@CGUID+90,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8812.028,1669.479,21.51077,0,0,0,0,100,0),
(@PATH,2,-8829.116,1676.292,21.51077,0,0,0,0,100,0),
(@PATH,3,-8844.153,1674.81,21.51133,0,0,0,0,100,0),
(@PATH,4,-8862.958,1666.421,21.44188,0,0,0,0,100,0),
(@PATH,5,-8879.5,1648.462,21.51133,0,0,0,0,100,0),
(@PATH,6,-8889.997,1630.464,21.74863,0,0,0,0,100,0),
(@PATH,7,-8881.832,1613.655,21.51133,0,0,0,0,100,0),
(@PATH,8,-8868.665,1603.683,21.51133,0,0,0,0,100,0),
(@PATH,9,-8851.86,1597.849,21.51132,0,0,0,0,100,0),
(@PATH,10,-8825.522,1596.61,21.49979,0,0,0,0,100,0),
(@PATH,11,-8808.65,1596.895,21.49979,0,0,0,0,100,0),
(@PATH,12,-8787.695,1598.145,21.49979,0,0,0,0,100,0),
(@PATH,13,-8771.377,1609.977,21.58078,0,0,0,0,100,0),
(@PATH,14,-8770.968,1626.16,21.45578,0,0,0,0,100,0),
(@PATH,15,-8774.21,1634.483,21.43074,0,0,0,0,100,0),
(@PATH,16,-8783.411,1643.005,23.20686,0,0,0,0,100,0),
(@PATH,17,-8797.109,1656.653,21.46516,0,0,0,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@CGUID+89,8,315,2,0,0),
(@NPC,@CGUID+90,8,405,2,0,0);

-- Pathing for Hive'Zara Stinger Entry: 15327 'TDB FORMAT' 
SET @NPC := @CGUID+113;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8853.164,`position_y`=1601.762,`position_z`=21.43074 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8853.164,`position_y`=1601.762,`position_z`=21.43074 WHERE `guid`=@CGUID+91;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8853.164,`position_y`=1601.762,`position_z`=21.43074 WHERE `guid`=@CGUID+92;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@CGUID+91,@CGUID+92);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@CGUID+91,@PATH,0,0,1,0, ''),(@CGUID+92,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8853.164,1601.762,21.43074,0,0,0,0,100,0),
(@PATH,2,-8866.146,1609.803,21.43074,0,0,0,0,100,0),
(@PATH,3,-8867.712,1619.324,21.51133,0,0,0,0,100,0),
(@PATH,4,-8869.861,1636.031,21.51133,0,0,0,0,100,0),
(@PATH,5,-8868.245,1642.404,21.51133,0,0,0,0,100,0),
(@PATH,6,-8860.811,1651.562,21.44188,0,0,0,0,100,0),
(@PATH,7,-8846.482,1659.746,21.44188,0,0,0,0,100,0),
(@PATH,8,-8832.089,1664.295,21.43074,0,0,0,0,100,0),
(@PATH,9,-8818.774,1664.332,21.43074,0,0,0,0,100,0),
(@PATH,10,-8804.403,1654.945,21.43074,0,0,0,0,100,0),
(@PATH,11,-8798.054,1646.651,21.43074,0,0,0,0,100,0),
(@PATH,12,-8793.324,1634.422,21.43074,0,0,0,0,100,0),
(@PATH,13,-8790.466,1615.461,21.45578,0,0,0,0,100,0),
(@PATH,14,-8805.591,1606.401,21.21346,0,0,0,0,100,0),
(@PATH,15,-8817.363,1603.717,21.43074,0,0,0,0,100,0),
(@PATH,16,-8839.466,1603.247,21.43074,0,0,0,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@CGUID+91,8,315,2,0,0),
(@NPC,@CGUID+92,8,405,2,0,0);

-- Pathing for Hive'Zara Stinger Entry: 15327 'TDB FORMAT' 
SET @NPC := @CGUID+116;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9616.939,`position_y`=1598.47,`position_z`=21.51131 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9616.939,`position_y`=1598.47,`position_z`=21.51131 WHERE `guid`=@CGUID+117;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9616.939,`position_y`=1598.47,`position_z`=21.51131 WHERE `guid`=@CGUID+95;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9616.939,`position_y`=1598.47,`position_z`=21.51131 WHERE `guid`=@CGUID+96;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9616.939,`position_y`=1598.47,`position_z`=21.51131 WHERE `guid`=@CGUID+98;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@CGUID+117,@CGUID+95,@CGUID+96,@CGUID+98);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@CGUID+117,@PATH,0,0,1,0, ''),(@CGUID+95,@PATH,0,0,1,0, ''),(@CGUID+96,@PATH,0,0,1,0, ''),(@CGUID+98,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9616.939,1598.47,21.51131,0,0,0,0,100,0),
(@PATH,2,-9644.368,1600.97,21.51152,0,0,0,0,100,0),
(@PATH,3,-9666.587,1602.68,21.51152,0,0,0,0,100,0),
(@PATH,4,-9693.127,1615.85,24.8499,0,0,0,0,100,0),
(@PATH,5,-9666.587,1602.68,21.51152,0,0,0,0,100,0),
(@PATH,6,-9644.368,1600.97,21.51152,0,0,0,0,100,0),
(@PATH,7,-9616.939,1598.47,21.51131,0,0,0,0,100,0),
(@PATH,8,-9593.868,1602.922,21.51135,0,0,0,0,100,0),
(@PATH,9,-9567.264,1581.447,21.64806,0,0,0,0,100,0),
(@PATH,10,-9593.868,1602.922,21.51135,0,0,0,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@CGUID+117,7,55,2,4,9),
(@NPC,@CGUID+95,7,15,2,4,9),
(@NPC,@CGUID+96,7,345,2,4,9),
(@NPC,@CGUID+98,7,305,2,4,9);

-- Pathing for Hive'Zara Stinger Entry: 15327 'TDB FORMAT' 
SET @NPC := @CGUID+119;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9616.939,`position_y`=1598.47,`position_z`=21.51131 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9616.939,`position_y`=1598.47,`position_z`=21.51131 WHERE `guid`=@CGUID+114;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9616.939,`position_y`=1598.47,`position_z`=21.51131 WHERE `guid`=@CGUID+115;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9616.939,`position_y`=1598.47,`position_z`=21.51131 WHERE `guid`=@CGUID+93;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9616.939,`position_y`=1598.47,`position_z`=21.51131 WHERE `guid`=@CGUID+94;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@CGUID+93,@CGUID+94,@CGUID+114,@CGUID+115);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@CGUID+93,@PATH,0,0,1,0, ''),(@CGUID+94,@PATH,0,0,1,0, ''),(@CGUID+114,@PATH,0,0,1,0, ''),(@CGUID+115,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9590.347,1600.979,21.51135,0,0,0,0,100,0),
(@PATH,2,-9617.396,1634.867,21.51134,0,0,0,0,100,0),
(@PATH,3,-9648.472,1660.417,21.77227,0,0,0,0,100,0),
(@PATH,4,-9672.451,1659.046,21.51187,0,0,0,0,100,0),
(@PATH,5,-9684.246,1618.948,22.01957,0,0,0,0,100,0),
(@PATH,6,-9680.485,1588.97,21.73227,0,0,0,0,100,0),
(@PATH,7,-9686.441,1561.453,21.56898,0,0,0,0,100,0),
(@PATH,8,-9669.827,1543.189,21.56898,0,0,0,0,100,0),
(@PATH,9,-9643.708,1556.367,21.51131,0,0,0,0,100,0),
(@PATH,10,-9611.799,1561.207,21.63631,0,0,0,0,100,0),
(@PATH,11,-9589.686,1574.344,21.64806,0,0,0,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@CGUID+114,7,55,2,0,0),
(@NPC,@CGUID+93,7,15,2,0,0),
(@NPC,@CGUID+94,7,345,2,0,0),
(@NPC,@CGUID+115,7,305,2,0,0);

-- Pathing for Hive'Zara Stinger Entry: 15327 'TDB FORMAT' 
SET @NPC := @CGUID+120;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9631.854,`position_y`=1575.044,`position_z`=21.51131 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9631.854,`position_y`=1575.044,`position_z`=21.51131 WHERE `guid`=@CGUID+118;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9631.854,`position_y`=1575.044,`position_z`=21.51131 WHERE `guid`=@CGUID+97;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9631.854,`position_y`=1575.044,`position_z`=21.51131 WHERE `guid`=@CGUID+99;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9631.854,`position_y`=1575.044,`position_z`=21.51131 WHERE `guid`=@CGUID+100;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@CGUID+118,@CGUID+97,@CGUID+99,@CGUID+100);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@CGUID+118,@PATH,0,0,1,0, ''),(@CGUID+97,@PATH,0,0,1,0, ''),(@CGUID+99,@PATH,0,0,1,0, ''),(@CGUID+100,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9631.854,1575.044,21.51131,0,0,0,0,100,0),
(@PATH,2,-9665.344,1553.455,21.51131,0,0,0,0,100,0),
(@PATH,3,-9690.092,1528.433,21.56898,0,0,0,0,100,0),
(@PATH,4,-9697.1,1511.1,21.57094,0,0,0,0,100,0),
(@PATH,5,-9716.545,1490.724,22.14614,0,0,0,0,100,0),
(@PATH,6,-9737.131,1482.494,23.25845,0,0,0,0,100,0),
(@PATH,7,-9716.545,1490.724,22.14614,0,0,0,0,100,0),
(@PATH,8,-9697.1,1511.1,21.57094,0,0,0,0,100,0),
(@PATH,9,-9690.092,1528.433,21.56898,0,0,0,0,100,0),
(@PATH,10,-9665.344,1553.455,21.51131,0,0,0,0,100,0),
(@PATH,11,-9631.854,1575.044,21.51131,0,0,0,0,100,0),
(@PATH,12,-9613.673,1599.045,21.51131,0,0,0,0,100,0),
(@PATH,13,-9592.846,1628.057,22.5028,0,0,0,0,100,0),
(@PATH,14,-9613.673,1599.045,21.51131,0,0,0,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@CGUID+118,7,55,2,6,13),
(@NPC,@CGUID+97,7,15,2,6,13),
(@NPC,@CGUID+99,7,345,2,6,13),
(@NPC,@CGUID+100,7,305,2,6,13);

-- Pathing for Hive'Zara Stinger Entry: 15327 'TDB FORMAT' 
SET @NPC := @CGUID+121;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9641.111,`position_y`=1606.591,`position_z`=21.51152 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9641.111,`position_y`=1606.591,`position_z`=21.51152 WHERE `guid`=@CGUID+122;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9641.111,`position_y`=1606.591,`position_z`=21.51152 WHERE `guid`=@CGUID+101;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9641.111,`position_y`=1606.591,`position_z`=21.51152 WHERE `guid`=@CGUID+102;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9641.111,`position_y`=1606.591,`position_z`=21.51152 WHERE `guid`=@CGUID+103;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@CGUID+122,@CGUID+101,@CGUID+102,@CGUID+103);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@CGUID+122,@PATH,0,0,1,0, ''),(@CGUID+101,@PATH,0,0,1,0, ''),(@CGUID+102,@PATH,0,0,1,0, ''),(@CGUID+103,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9641.111,1606.591,21.51152,0,0,0,0,100,0),
(@PATH,2,-9644.073,1631.978,21.73661,0,0,0,0,100,0),
(@PATH,3,-9656.497,1670.769,21.86399,0,0,0,0,100,0),
(@PATH,4,-9644.073,1631.978,21.73661,0,0,0,0,100,0),
(@PATH,5,-9641.111,1606.591,21.51152,0,0,0,0,100,0),
(@PATH,6,-9654.327,1587.958,21.51131,0,0,0,0,100,0),
(@PATH,7,-9649.587,1562.207,21.51131,0,0,0,0,100,0),
(@PATH,8,-9639.38,1544.195,21.51131,0,0,0,0,100,0),
(@PATH,9,-9649.587,1562.207,21.51131,0,0,0,0,100,0),
(@PATH,10,-9654.327,1587.958,21.51131,0,0,0,0,100,0);

-- Vekniss Stinger formation
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@CGUID+122,7,55,2,3,8),
(@NPC,@CGUID+101,7,15,2,3,8),
(@NPC,@CGUID+102,7,345,2,3,8),
(@NPC,@CGUID+103,7,305,2,3,8);
 
 
/* 
* sql\updates\world\2015_10_16_00_world.sql 
*/ 
--
UPDATE `creature` SET `spawndist`=0,`MovementType`=0 WHERE `guid` IN (87678,87679,87680,87681,87682,87683,87684,87690,87698,87702,87704,87705,87707,87710,87712,87714,87715,87716,87719,87721,87725,87728,87730,87731,87732,87733,87734,87738,87739,87740,87747,87749,87750,87751,87756,87762,87764,87765,87767,87769,87772,87774,87777,87778,87779,87791,87793,87794,87795,87797,87799,87800,87801,87802,87803,87807,87816,87818,87820,87822,87824,87826,87828,87829);
INSERT INTO `creature_addon` (`guid`,`emote`) (SELECT `guid`, 28 FROM `creature` WHERE `id`=15300 AND `MovementType`=0);

-- Fixing position of some AQ40 spawns
DELETE FROM `creature` WHERE `guid` IN (87561,87562,87563,4458,87559,87560,88073,88076,88077,88072);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(87561, 15378, 531, 1, 1, -8652.15, 2020.907, 108.6608, 4.014257, 7200, 0, 0), -- Merithra of the Dream
(87562, 15379, 531, 1, 1, -8660.591, 2022.339, 108.6608, 4.031711, 7200, 0, 0), -- Caelestrasz
(87563, 15380, 531, 1, 1, -8663.463, 2029.885, 108.6608, 4.310963, 7200, 0, 0), -- Arygos
(4458, 15896, 531, 1, 1, -8578.104, 1986.944, 100.3037, 2.303835, 7200, 0, 0), -- C'Thun Portal
(87559, 15727, 531, 1, 1, -8578.648, 1985.847, 100.3037, 3.490659, 7200, 0, 0), -- C'Thun
(87560, 15589, 531, 1, 1, -8578.792, 1986.183, 100.3037, 3.508112, 7200, 0, 0), -- Eye of C'Thun
(88073, 15957, 531, 1, 1, -9173.091, 2107.334, -65.08635 ,1.430085, 7200, 5, 1), -- Ouro should be Ouro Spawner
(88076, 15275, 531, 1, 1, -9023.666, 1176.24, -104.226, 0.7679449, 7200, 0, 0), -- Emperor Vek'nilash
(88077, 15276, 531, 1, 1, -8868.309, 1205.966, -104.2311, 2.70526, 7200, 0, 0), -- Emperor Vek'lor
(88072, 15963, 531, 1, 1, -8953.297, 1233.641, -99.71796, 5.305801, 7200, 0, 0); -- The Master's Eye
-- Ouro Spawner should spawn Ouro "BOSS" on aggro and despawn self.
 
DELETE FROM `creature_template_addon` WHERE `entry` IN (15589,15957,15963);
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(15589,0,1,0, '18950'),(15957,0,1,0, '26092'),(15963,0,1,0, '18430');
 
UPDATE `creature_template` SET `InhabitType`=7 WHERE `entry` IN (15963);
 
 
/* 
* sql\updates\world\2015_10_16_01_world.sql 
*/ 
DELETE FROM `creature_text` WHERE `entry`=34965;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(34965, 0, 0, 'Foolish $c, you cannot stop the Kvaldir!', 12, 0, 100, 0, 0, 0, 35393, 0, 'Mistcaller Yngvar');

DELETE FROM `smart_scripts` WHERE `entryorguid`=34965 AND `source_type`=0 AND `id`=4;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(34965, 0, 4, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Mistcaller Yngvar - On Agro - Say');

UPDATE `creature_template` SET `unit_flags`=33555200, `InhabitType`=4 WHERE  `entry`=34888;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(34852,34888) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(34852, 0, 0, 1, 8, 0, 100, 1, 66390, 0, 0, 0, 33, 34852, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Slain Tualiq Villager - On Spellhit \'Read Last Rites\' - Quest Credit \'The Light\'s Mercy\' (No Repeat)'),
(34852, 0, 1, 2, 61, 0, 100, 1, 0, 0, 0, 0, 11, 66412, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Slain Tualiq Villager - On Spellhit \'Read Last Rites\' - Cast 66412'),
(34852, 0, 2, 0, 61, 0, 100, 1, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Slain Tualiq Villager - On Spellhit \'Read Last Rites\' - Despawn'),
(34888, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 90, 33554432, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tualiq Spirit - On Just Summoned - Set Bytes 2'),
(34888, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 37119, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tualiq Spirit - On Just Summoned - Cast Spirit Particles (Spawn)'),
(34888, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 11, 64462, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tualiq Spirit - On Just Summoned - Cast Feign and Drown'),
(34888, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tualiq Spirit - On Just Summoned - Set run off'),
(34888, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 114, 90, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tualiq Spirit - On Just Summoned - Rise up');

UPDATE `smart_scripts` SET `action_param1`=64100 WHERE  `entryorguid`=33429 AND `source_type`=0 AND `id`=6 AND `link`=0;
 
 
/* 
* sql\updates\world\2015_10_16_02_world.sql 
*/ 
-- 
-- Darthalia Ebonscorch SAI
SET @ENTRY := 32679;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darthalia Ebonscorch - Out of Combat - Play Emote 1");

-- Archmage Tenaj SAI
SET @ENTRY := 32688;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Archmage Tenaj - Out of Combat - Play Emote 1");

-- Adorean Lew SAI
SET @ENTRY := 32689;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Adorean Lew - Out of Combat - Play Emote 1");

-- Bitty Frostflinger SAI
SET @ENTRY := 32690;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bitty Frostflinger - Out of Combat - Play Emote 1");

-- Grindle Firespark SAI
SET @ENTRY := 32676;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grindle Firespark - Out of Combat - Play Emote 1");

-- Fabioso the Fabulous SAI
SET @ENTRY := 32680;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fabioso the Fabulous - Out of Combat - Play Emote 1");

-- Sabriana Sorrowgaze SAI
SET @ENTRY := 32693;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sabriana Sorrowgaze - Out of Combat - Play Emote 1");

-- Emeline Fizzlefry SAI
SET @ENTRY := 32678;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Emeline Fizzlefry - Out of Combat - Play Emote 1");

-- Whirt the All-Knowing SAI
SET @ENTRY := 32677;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Whirt the All-Knowing - Out of Combat - Play Emote 1");

-- Mona Everspring SAI
SET @ENTRY := 32684;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mona Everspring - Out of Combat - Play Emote 1");

-- The Magnificent Merleaux SAI
SET @ENTRY := 32681;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Magnificent Merleaux - Out of Combat - Play Emote 1");

-- Kitz Proudbreeze SAI
SET @ENTRY := 32685;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kitz Proudbreeze - Out of Combat - Play Emote 1");

-- Crafticus Mindbender SAI
SET @ENTRY := 32686;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Crafticus Mindbender - Out of Combat - Play Emote 1");

-- Babagahnoosh the Grumpy SAI
SET @ENTRY := 32675;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Babagahnoosh the Grumpy - Out of Combat - Play Emote 1");

-- Magus Fansy Goodbringer SAI
SET @ENTRY := 32691;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Magus Fansy Goodbringer - Out of Combat - Play Emote 1");

-- Arcanist Alec SAI
SET @ENTRY := 32692;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Arcanist Alec - Out of Combat - Play Emote 1");

-- Linda Ann Kastinglow SAI
SET @ENTRY := 32687;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,4000,8000,4000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Linda Ann Kastinglow - Out of Combat - Play Emote 1");
 
 
/* 
* sql\updates\world\2015_10_17_00_world.sql 
*/ 
--
UPDATE `creature` SET `spawnMask`=15 WHERE `id`=37230;
 
 
/* 
* sql\updates\world\2015_10_17_01_world.sql 
*/ 
DELETE FROM `trinity_string` WHERE `entry` = 11010;
 
 
/* 
* sql\updates\world\2015_10_17_02_world.sql 
*/ 
--
UPDATE `creature` SET `position_x`=5832.238, `position_y`=564.013611, `position_z`=651.771301, `Orientation`=2.596493 WHERE `guid`=105661;
UPDATE `creature_addon` SET `auras`=60191 WHERE `guid` IN (105661, 103039);
DELETE FROM `creature_addon` WHERE `guid` IN (115295, 48251,48252,48253);
INSERT INTO `creature_addon` (`guid`, `bytes1`, `bytes2`, `auras`) VALUES 
(115295,65536,1,60191),
(48251,65536,1,60190),
(48252,65536,1,60190),
(48253,65536,1,60190);

DELETE FROM `creature` WHERE `guid` IN (48251,48252,48253);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `Orientation`, `spawntimesecs`) VALUES
(48251, 31851, 571, 1, 1, 5832.240, 564.0139, 651.77099, 2.596490,300),
(48252, 32335, 571, 1, 1, 5833.799, 567.3480, 651.92498, 2.460910,300),
(48253, 32206, 571, 1, 1, 5836.709, 570.0759, 652.10797, 2.146750,300);
 
 
/* 
* sql\updates\world\2015_10_20_00_world.sql 
*/ 
-- Gryphoneer Leafbeard - Gossip
DELETE FROM `gossip_menu_option` WHERE (`menu_id`=8100 AND `id`=0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES 
(8100, 0, 0, 'Send me to Shatter Point!', 17935, 1, 1, 0, 0, 0, 0, NULL, 0);

-- Gryphoneer Leafbeard SAI
SET @ENTRY := 20236;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,8100,0,0,0,11,35066,2,0,0,0,0,7,0,0,0,0,0,0,0,"Gryphoneer Leafbeard - On Gossip Option 0 Selected - Cast 'Taxi - Hellfire Peninsula - Beach Head to Shatter Point'"),
(@ENTRY,0,1,0,61,0,100,0,8100,0,0,0,72,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gryphoneer Leafbeard - On Gossip Option 0 Selected - Close Gossip");
 
 
/* 
* sql\updates\world\2015_10_20_01_world.sql 
*/ 
-- Young Thistle Boar - Skinning Loot
UPDATE `creature_template` SET `skinloot`=1984 WHERE  `entry`=1984;
DELETE FROM `skinning_loot_template` WHERE `Entry`=1984;
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(1984, 2934, 0, 80, 0, 1, 1, 1, 1, NULL);
 
 
/* 
* sql\updates\world\2015_10_20_02_world.sql 
*/ 
-- Small Crag Boar - Skinning Loot
UPDATE `creature_template` SET `skinloot`=0 WHERE  `entry`=708;
 
 
/* 
* sql\updates\world\2015_10_20_03_world.sql 
*/ 
-- Thistle Boar - Skinning Loot
UPDATE `creature_template` SET `skinloot`=1985 WHERE  `entry`=1985;
DELETE FROM `skinning_loot_template` WHERE `Entry`=1985;
INSERT INTO `skinning_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(1985, 2934, 0, 88, 0, 1, 1, 1, 1, NULL),
(1985, 2318, 0, 10, 0, 1, 1, 1, 1, NULL);
 
 
/* 
* sql\updates\world\2015_10_21_00_world.sql 
*/ 
-- Onyxia Add WPs
SET @NPC := 52051;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-128.604,`position_y`=-135.78,`position_z`=-51.68033 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-128.604,-135.78,-51.68033,0,0,0,0,100,0),
(@PATH,2,-127.7581,-135.2467,-51.68033,0,0,0,0,100,0),
(@PATH,3,-124.1603,-132.1572,-51.38051,0,0,0,0,100,0),
(@PATH,4,-117.3008,-126.2667,-49.287,0,0,0,0,100,0),
(@PATH,5,-114.3034,-123.6929,-49.21809,0,0,0,0,100,0),
(@PATH,6,-110.7887,-120.6747,-48.59732,0,0,0,0,100,0),
(@PATH,7,-106.7952,-117.2454,-45.67963,0,0,0,0,100,0),
(@PATH,8,-103.1414,-114.1078,-42.60856,0,0,0,0,100,0),
(@PATH,9,-103.1414,-114.1078,-42.60856,0,0,0,0,100,0),
(@PATH,10,-102.9662,-113.9184,-42.13044,0,0,0,0,100,0),
(@PATH,11,-101.9662,-112.9184,-41.38044,0,0,0,0,100,0),
(@PATH,12,-97.21623,-108.9184,-39.38044,0,0,0,0,100,0),
(@PATH,13,-94.21623,-106.4184,-38.38044,0,0,0,0,100,0),
(@PATH,14,-91.96623,-104.4184,-38.38044,0,0,0,0,100,0),
(@PATH,15,-87.21623,-100.1684,-36.63044,0,0,0,0,100,0),
(@PATH,16,-86.88522,-99.955,-36.61054,0,0,0,0,100,0),
(@PATH,17,-86.13522,-99.705,-36.36054,0,0,0,0,100,0),
(@PATH,18,-82.63522,-99.205,-35.61054,0,0,0,0,100,0),
(@PATH,19,-80.88522,-99.205,-35.61054,0,0,0,0,100,0),
(@PATH,20,-78.38522,-98.955,-35.11054,0,0,0,0,100,0),
(@PATH,21,-73.38522,-98.455,-34.61054,0,0,0,0,100,0),
(@PATH,22,-73.4659,-98.32379,-34.65569,0,0,0,0,100,0),
(@PATH,23,-77.9659,-98.82379,-35.15569,0,0,0,0,100,0),
(@PATH,24,-80.9659,-98.82379,-35.65569,0,0,0,0,100,0),
(@PATH,25,-82.7159,-99.07379,-35.65569,0,0,0,0,100,0),
(@PATH,26,-82.87637,-99.18207,-35.74073,0,0,0,0,100,0),
(@PATH,27,-86.12637,-99.68207,-36.49073,0,0,0,0,100,0),
(@PATH,28,-87.12637,-100.1821,-36.49073,0,0,0,0,100,0),
(@PATH,29,-91.87637,-104.4321,-38.24073,0,0,0,0,100,0),
(@PATH,30,-93.87637,-106.4321,-38.24073,0,0,0,0,100,0),
(@PATH,31,-96.87637,-108.6821,-39.24073,0,0,0,0,100,0),
(@PATH,32,-101.8764,-112.9321,-41.24073,0,0,0,0,100,0),
(@PATH,33,-102.2544,-113.366,-41.50324,0,0,0,0,100,0),
(@PATH,34,-103.2544,-114.116,-42.50324,0,0,0,0,100,0),
(@PATH,35,-106.7544,-117.366,-45.50324,0,0,0,0,100,0),
(@PATH,36,-110.7544,-120.616,-48.25324,0,0,0,0,100,0),
(@PATH,37,-114.2544,-123.616,-48.75324,0,0,0,0,100,0),
(@PATH,38,-117.0044,-126.116,-48.75324,0,0,0,0,100,0),
(@PATH,39,-123.5044,-131.616,-50.75324,0,0,0,0,100,0),
(@PATH,40,-127.0044,-134.616,-51.00324,0,0,0,0,100,0),
(@PATH,41,-127.2775,-134.812,-51.39043,0,0,0,0,100,0),
(@PATH,42,-127.7775,-135.312,-51.39043,0,0,0,0,100,0),
(@PATH,43,-129.0275,-136.062,-51.89043,0,0,0,0,100,0),
(@PATH,44,-135.7775,-140.312,-52.64043,0,0,0,0,100,0),
(@PATH,45,-136.7775,-141.062,-52.89043,0,0,0,0,100,0),
(@PATH,46,-144.7775,-145.812,-53.89043,0,0,0,0,100,0),
(@PATH,47,-147.2775,-147.562,-53.14043,0,0,0,0,100,0),
(@PATH,48,-147.5882,-147.6326,-53.39889,0,0,0,0,100,0),
(@PATH,49,-148.3382,-148.3826,-53.14889,0,0,0,0,100,0),
(@PATH,50,-150.5882,-150.6326,-53.14889,0,0,0,0,100,0),
(@PATH,51,-151.3382,-151.6326,-53.64889,0,0,0,0,100,0),
(@PATH,52,-156.5882,-157.6326,-56.39889,0,0,0,0,100,0),
(@PATH,53,-158.0882,-159.1326,-57.14889,0,0,0,0,100,0),
(@PATH,54,-162.8382,-164.6326,-58.64889,0,0,0,0,100,0),
(@PATH,55,-163.5882,-165.3826,-59.64889,0,0,0,0,100,0),
(@PATH,56,-166.3382,-168.3826,-61.14889,0,0,0,0,100,0),
(@PATH,57,-166.5622,-168.6543,-61.35694,0,0,0,0,100,0),
(@PATH,58,-163.5622,-165.4043,-59.60694,0,0,0,0,100,0),
(@PATH,59,-162.8122,-164.6543,-58.85694,0,0,0,0,100,0),
(@PATH,60,-158.3122,-159.4043,-57.10694,0,0,0,0,100,0),
(@PATH,61,-156.8122,-157.6543,-56.35694,0,0,0,0,100,0),
(@PATH,62,-151.8122,-152.1543,-54.10694,0,0,0,0,100,0),
(@PATH,63,-150.5622,-150.6543,-53.10694,0,0,0,0,100,0),
(@PATH,64,-148.4862,-148.2634,-52.81345,0,0,0,0,100,0),
(@PATH,65,-147.2362,-147.5134,-53.06345,0,0,0,0,100,0),
(@PATH,66,-144.7362,-146.0134,-53.81345,0,0,0,0,100,0),
(@PATH,67,-136.9862,-141.0134,-52.81345,0,0,0,0,100,0),
(@PATH,68,-135.9862,-140.2634,-52.56345,0,0,0,0,100,0),
(@PATH,69,-129.7362,-136.5134,-52.06345,0,0,0,0,100,0),
(@PATH,70,-129.596,-136.2151,-51.79766,0,0,0,0,100,0);

SET @NPC := 52049;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-141.0218,`position_y`=-144.2874,`position_z`=-53.78587 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-141.0218,-144.2874,-53.78587,0,0,0,0,100,0),
(@PATH,2,-140.2045,-143.7111,-53.78587,0,0,0,0,100,0),
(@PATH,3,-136.8762,-141.0416,-53.2686,0,0,0,0,100,0),
(@PATH,4,-135.8708,-140.2352,-53.07284,0,0,0,0,100,0),
(@PATH,5,-130.4393,-135.8787,-52.2235,0,0,0,0,100,0),
(@PATH,6,-128.077,-133.984,-51.39751,0,0,0,0,100,0),
(@PATH,7,-126.1452,-132.4346,-51.30407,0,0,0,0,100,0),
(@PATH,8,-126.1452,-132.4346,-51.30407,0,0,0,0,100,0),
(@PATH,9,-127.6748,-133.5728,-51.29497,0,0,0,0,100,0),
(@PATH,10,-130.4248,-135.8228,-52.04497,0,0,0,0,100,0),
(@PATH,11,-135.6748,-140.0728,-52.54497,0,0,0,0,100,0),
(@PATH,12,-136.6748,-140.8228,-52.79497,0,0,0,0,100,0),
(@PATH,13,-140.2209,-143.5945,-53.65104,0,0,0,0,100,0),
(@PATH,14,-144.7209,-146.8445,-54.15104,0,0,0,0,100,0),
(@PATH,15,-147.2209,-148.5945,-53.40104,0,0,0,0,100,0),
(@PATH,16,-150.2209,-150.5945,-53.15104,0,0,0,0,100,0),
(@PATH,17,-150.9709,-151.3445,-53.65104,0,0,0,0,100,0),
(@PATH,18,-152.2209,-152.0945,-54.15104,0,0,0,0,100,0),
(@PATH,19,-157.7209,-155.8445,-56.40104,0,0,0,0,100,0),
(@PATH,20,-160.7863,-158.1388,-57.63475,0,0,0,0,100,0),
(@PATH,21,-162.7863,-162.1388,-58.63475,0,0,0,0,100,0),
(@PATH,22,-163.7863,-163.8888,-59.13475,0,0,0,0,100,0),
(@PATH,23,-166.0363,-168.6388,-61.13475,0,0,0,0,100,0),
(@PATH,24,-168.5363,-173.3888,-62.88475,0,0,0,0,100,0),
(@PATH,25,-170.4057,-176.7284,-64.06725,0,0,0,0,100,0),
(@PATH,26,-170.6557,-177.9784,-64.31725,0,0,0,0,100,0),
(@PATH,27,-171.1557,-178.9784,-64.81725,0,0,0,0,100,0),
(@PATH,28,-172.6557,-184.2284,-65.56725,0,0,0,0,100,0),
(@PATH,29,-175.3081,-192.9928,-66.43716,0,0,0,0,100,0),
(@PATH,30,-171.8081,-197.2428,-66.43716,0,0,0,0,100,0),
(@PATH,31,-168.8081,-201.2428,-66.18716,0,0,0,0,100,0),
(@PATH,32,-165.1812,-205.6809,-66.07635,0,0,0,0,100,0),
(@PATH,33,-160.4312,-207.9309,-66.07635,0,0,0,0,100,0),
(@PATH,34,-154.1812,-210.9309,-66.32635,0,0,0,0,100,0),
(@PATH,35,-154.1465,-210.945,-66.31016,0,0,0,0,100,0),
(@PATH,36,-160.3965,-207.945,-66.06016,0,0,0,0,100,0),
(@PATH,37,-165.1298,-205.5847,-66.08299,0,0,0,0,100,0),
(@PATH,38,-168.6298,-201.3347,-66.33299,0,0,0,0,100,0),
(@PATH,39,-171.8798,-197.3347,-66.58299,0,0,0,0,100,0),
(@PATH,40,-174.8798,-193.8347,-66.58299,0,0,0,0,100,0),
(@PATH,41,-174.8037,-193.4657,-66.47095,0,0,0,0,100,0),
(@PATH,42,-175.3037,-192.7157,-66.47095,0,0,0,0,100,0),
(@PATH,43,-172.5537,-184.4657,-65.47095,0,0,0,0,100,0),
(@PATH,44,-171.0537,-179.2157,-64.97095,0,0,0,0,100,0),
(@PATH,45,-170.8037,-177.9657,-64.22095,0,0,0,0,100,0),
(@PATH,46,-170.8405,-178.8178,-64.7157,0,0,0,0,100,0),
(@PATH,47,-170.5905,-177.8178,-63.9657,0,0,0,0,100,0),
(@PATH,48,-170.0905,-176.5678,-63.7157,0,0,0,0,100,0),
(@PATH,49,-168.3405,-173.3178,-62.9657,0,0,0,0,100,0),
(@PATH,50,-166.3405,-169.0678,-61.4657,0,0,0,0,100,0),
(@PATH,51,-164.0905,-164.5678,-59.7157,0,0,0,0,100,0),
(@PATH,52,-162.8405,-162.0678,-58.7157,0,0,0,0,100,0),
(@PATH,53,-160.623,-157.9054,-57.24116,0,0,0,0,100,0),
(@PATH,54,-157.623,-155.9054,-56.24116,0,0,0,0,100,0),
(@PATH,55,-152.123,-152.4054,-54.24116,0,0,0,0,100,0),
(@PATH,56,-151.373,-151.6554,-53.49116,0,0,0,0,100,0),
(@PATH,57,-150.373,-150.9054,-53.24116,0,0,0,0,100,0),
(@PATH,58,-147.373,-148.9054,-53.24116,0,0,0,0,100,0),
(@PATH,59,-144.623,-146.9054,-54.24116,0,0,0,0,100,0);

SET @NPC := 52048;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-117.2994,`position_y`=-214.0461,`position_z`=-72.49876 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-117.2994,-214.0461,-72.49876,0,0,0,0,100,0),
(@PATH,2,-121.5494,-213.7961,-71.24876,0,0,0,0,100,0),
(@PATH,3,-125.0494,-213.5461,-71.24876,0,0,0,0,100,0),
(@PATH,4,-138.0494,-212.5461,-69.49876,0,0,0,0,100,0),
(@PATH,5,-141.0494,-212.2961,-68.49876,0,0,0,0,100,0),
(@PATH,6,-144.2994,-212.0461,-68.49876,0,0,0,0,100,0),
(@PATH,7,-146.5494,-211.7961,-68.24876,0,0,0,0,100,0),
(@PATH,8,-153.7994,-211.2961,-66.49876,0,0,0,0,100,0),
(@PATH,9,-160.8753,-210.4289,-66.45905,0,0,0,0,100,0),
(@PATH,10,-162.8753,-208.4289,-66.20905,0,0,0,0,100,0),
(@PATH,11,-165.3753,-205.9289,-66.20905,0,0,0,0,100,0),
(@PATH,12,-169.3753,-201.6789,-66.20905,0,0,0,0,100,0),
(@PATH,13,-175.155,-195.7021,-66.3976,0,0,0,0,100,0),
(@PATH,14,-174.155,-193.2021,-66.3976,0,0,0,0,100,0),
(@PATH,15,-170.655,-182.9521,-65.3976,0,0,0,0,100,0),
(@PATH,16,-169.405,-179.2021,-64.6476,0,0,0,0,100,0),
(@PATH,17,-168.905,-177.7021,-63.8976,0,0,0,0,100,0),
(@PATH,18,-167.655,-173.9521,-63.1476,0,0,0,0,100,0),
(@PATH,19,-165.9926,-169.4054,-61.62289,0,0,0,0,100,0),
(@PATH,20,-163.2426,-166.4054,-59.87289,0,0,0,0,100,0),
(@PATH,21,-162.2426,-165.4054,-58.62289,0,0,0,0,100,0),
(@PATH,22,-156.4926,-158.6554,-56.37289,0,0,0,0,100,0),
(@PATH,23,-152.4926,-153.9054,-54.37289,0,0,0,0,100,0),
(@PATH,24,-152.2406,-153.7879,-54.28136,0,0,0,0,100,0),
(@PATH,25,-150.4906,-152.0379,-53.28136,0,0,0,0,100,0),
(@PATH,26,-147.9906,-150.0379,-53.28136,0,0,0,0,100,0),
(@PATH,27,-146.7406,-149.0379,-53.28136,0,0,0,0,100,0),
(@PATH,28,-144.2406,-147.0379,-54.03136,0,0,0,0,100,0),
(@PATH,29,-136.7406,-141.2879,-52.78136,0,0,0,0,100,0),
(@PATH,30,-129.9906,-136.2879,-52.03136,0,0,0,0,100,0),
(@PATH,31,-127.4906,-134.5379,-51.28136,0,0,0,0,100,0),
(@PATH,32,-124.2406,-131.7879,-51.28136,0,0,0,0,100,0),
(@PATH,33,-121.0758,-129.5125,-50.05389,0,0,0,0,100,0),
(@PATH,34,-116.8258,-126.2625,-48.80389,0,0,0,0,100,0),
(@PATH,35,-113.8258,-123.7625,-48.80389,0,0,0,0,100,0),
(@PATH,36,-110.5758,-121.0125,-48.30389,0,0,0,0,100,0),
(@PATH,37,-106.3258,-117.7625,-45.55389,0,0,0,0,100,0),
(@PATH,38,-101.5758,-114.0125,-41.55389,0,0,0,0,100,0),
(@PATH,39,-98.82584,-111.7625,-40.30389,0,0,0,0,100,0),
(@PATH,40,-97.149,-110.4035,-39.23767,0,0,0,0,100,0),
(@PATH,41,-95.899,-109.6535,-38.73767,0,0,0,0,100,0),
(@PATH,42,-95.149,-109.1535,-38.48767,0,0,0,0,100,0),
(@PATH,43,-92.399,-107.6535,-37.73767,0,0,0,0,100,0),
(@PATH,44,-89.649,-105.9035,-37.73767,0,0,0,0,100,0),
(@PATH,45,-84.649,-103.1535,-36.23767,0,0,0,0,100,0),
(@PATH,46,-82.649,-101.9035,-35.73767,0,0,0,0,100,0),
(@PATH,47,-78.149,-99.15355,-35.23767,0,0,0,0,100,0),
(@PATH,48,-77.96553,-98.93108,-35.05116,0,0,0,0,100,0),
(@PATH,49,-75.21553,-97.68108,-34.80116,0,0,0,0,100,0),
(@PATH,50,-73.21553,-97.68108,-34.80116,0,0,0,0,100,0),
(@PATH,51,-68.21553,-97.68108,-37.05116,0,0,0,0,100,0),
(@PATH,52,-63.21553,-97.68108,-38.55116,0,0,0,0,100,0),
(@PATH,53,-57.46553,-97.68108,-38.30116,0,0,0,0,100,0),
(@PATH,54,-57.42111,-98.24262,-38.41855,0,0,0,0,100,0),
(@PATH,55,-63.42111,-98.49262,-38.41855,0,0,0,0,100,0),
(@PATH,56,-68.17111,-98.49262,-36.91855,0,0,0,0,100,0),
(@PATH,57,-73.17111,-98.74262,-34.66855,0,0,0,0,100,0),
(@PATH,58,-73.4623,-98.88531,-34.77631,0,0,0,0,100,0),
(@PATH,59,-76.2123,-99.13531,-35.02631,0,0,0,0,100,0),
(@PATH,60,-78.2123,-99.88531,-35.02631,0,0,0,0,100,0),
(@PATH,61,-82.7123,-101.3853,-35.77631,0,0,0,0,100,0),
(@PATH,62,-85.2123,-101.8853,-36.27631,0,0,0,0,100,0),
(@PATH,63,-91.4623,-104.1353,-38.02631,0,0,0,0,100,0),
(@PATH,64,-91.69406,-104.2236,-38.36034,0,0,0,0,100,0),
(@PATH,65,-93.44406,-104.7236,-38.11034,0,0,0,0,100,0),
(@PATH,66,-94.69406,-105.7236,-38.11034,0,0,0,0,100,0),
(@PATH,67,-97.69406,-108.4736,-39.11034,0,0,0,0,100,0),
(@PATH,68,-98.69406,-109.4736,-39.86034,0,0,0,0,100,0),
(@PATH,69,-102.4441,-112.4736,-41.61034,0,0,0,0,100,0),
(@PATH,70,-106.9441,-116.4736,-45.36034,0,0,0,0,100,0),
(@PATH,71,-111.2919,-119.9628,-48.522,0,0,0,0,100,0),
(@PATH,72,-114.7919,-123.2128,-49.022,0,0,0,0,100,0),
(@PATH,73,-117.5419,-125.9628,-49.022,0,0,0,0,100,0),
(@PATH,74,-123.5419,-131.4628,-51.022,0,0,0,0,100,0),
(@PATH,75,-126.7919,-134.7128,-51.022,0,0,0,0,100,0),
(@PATH,76,-129.2919,-136.7128,-51.772,0,0,0,0,100,0),
(@PATH,77,-133.0963,-140.5668,-52.85578,0,0,0,0,100,0),
(@PATH,78,-135.5963,-142.3168,-53.10578,0,0,0,0,100,0),
(@PATH,79,-143.5963,-147.5668,-54.35578,0,0,0,0,100,0),
(@PATH,80,-146.3463,-149.3168,-53.35578,0,0,0,0,100,0),
(@PATH,81,-149.5963,-151.5668,-53.35578,0,0,0,0,100,0),
(@PATH,82,-151.0963,-152.5668,-53.85578,0,0,0,0,100,0),
(@PATH,83,-156.1434,-156.1172,-55.97437,0,0,0,0,100,0),
(@PATH,84,-156.8934,-157.3672,-56.47437,0,0,0,0,100,0),
(@PATH,85,-159.1434,-159.8672,-57.47437,0,0,0,0,100,0),
(@PATH,86,-162.8934,-164.8672,-58.97437,0,0,0,0,100,0),
(@PATH,87,-163.3934,-165.6172,-59.72437,0,0,0,0,100,0),
(@PATH,88,-165.8934,-168.6172,-61.22437,0,0,0,0,100,0),
(@PATH,89,-169.1434,-172.8672,-62.72437,0,0,0,0,100,0),
(@PATH,90,-169.4215,-173.0583,-63.12639,0,0,0,0,100,0),
(@PATH,91,-170.6715,-175.0583,-63.62639,0,0,0,0,100,0),
(@PATH,92,-170.9215,-178.0583,-64.37639,0,0,0,0,100,0),
(@PATH,93,-170.9215,-179.0583,-64.87639,0,0,0,0,100,0),
(@PATH,94,-170.9215,-183.3083,-65.37639,0,0,0,0,100,0),
(@PATH,95,-171.4215,-191.8083,-66.12639,0,0,0,0,100,0),
(@PATH,96,-171.6715,-197.3083,-66.12639,0,0,0,0,100,0),
(@PATH,97,-171.9399,-201.3128,-66.46771,0,0,0,0,100,0),
(@PATH,98,-170.4399,-202.0628,-66.21771,0,0,0,0,100,0),
(@PATH,99,-165.1899,-205.0628,-66.21771,0,0,0,0,100,0),
(@PATH,100,-160.1899,-207.5628,-66.21771,0,0,0,0,100,0),
(@PATH,101,-154.1899,-211.0628,-66.46771,0,0,0,0,100,0),
(@PATH,102,-153.828,-211.3276,-66.49379,0,0,0,0,100,0),
(@PATH,103,-153.078,-211.8276,-66.74379,0,0,0,0,100,0),
(@PATH,104,-145.828,-212.8276,-68.49379,0,0,0,0,100,0),
(@PATH,105,-141.578,-213.0776,-68.74379,0,0,0,0,100,0),
(@PATH,106,-138.828,-213.5776,-69.24379,0,0,0,0,100,0),
(@PATH,107,-131.328,-214.5776,-70.24379,0,0,0,0,100,0),
(@PATH,108,-131.1989,-214.7451,-70.56252,0,0,0,0,100,0),
(@PATH,109,-129.4489,-214.7451,-70.81252,0,0,0,0,100,0),
(@PATH,110,-124.6989,-214.7451,-71.56252,0,0,0,0,100,0),
(@PATH,111,-121.6989,-214.7451,-71.56252,0,0,0,0,100,0),
(@PATH,112,-117.6989,-214.7451,-72.31252,0,0,0,0,100,0);
 
 
/* 
* sql\updates\world\2015_10_21_01_world.sql 
*/ 
-- 
-- Grethok the Controller SAI
SET @ENTRY := 12557;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,4,0,6,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grethok the Controller - On Just Died - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=12557;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(12557, 0, 0, 'Intruders have breached the hatchery! Sound the alarm! Protect the eggs at all costs!', 14, 0, 100, 0, 0, 0, 9958, 'Grethok the Controller');
 
 
/* 
* sql\updates\world\2015_10_22_00_world.sql 
*/ 
-- 
-- Orbaz Bloodbane (NPC 28914) condition for gossip option 9769 to be visible only for quest 12757, Scarlet Armies Approach...
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9769 AND `ConditionValue1`=39654;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,9769,0,0,0,2,0,39654,1,0,0,0,0,'','Orbaz Bloodbane - Show gossip option only if player has received item 39654, The Path of Redemption, from quest 12757');

-- Orbaz Bloodbane SAI
SET @ENTRY := 28914;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,12757,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Orbaz Bloodbane - On Quest 'Scarlet Armies Approach' Taken - Run Script"),
(@ENTRY,0,1,2,62,0,100,0,9769,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Orbaz Bloodbane - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,0,61,0,100,0,9769,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Orbaz Bloodbane - On Gossip Option 0 Selected - Run Script");
 
 
/* 
* sql\updates\world\2015_10_22_01_world.sql 
*/ 
-- Pathing for Monstrous Underbelly Rat Entry: 32466 'TDB FORMAT' 
SET @NPC := 115709;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5838.242,`position_y`=727.3474,`position_z`=618.8483 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5838.242,727.3474,618.8483,0,58000,0,0,100,0), -- 17:24:07
(@PATH,2,5838.957,727.3331,618.8483,0,0,0,0,100,0), -- 17:25:05
(@PATH,3,5830.747,726.1935,618.8483,0,0,0,0,100,0), -- 17:25:09
(@PATH,4,5824.448,723.9514,618.8483,0,20000,0,0,100,0), -- 17:25:11
(@PATH,5,5824.13,723.7587,618.8483,0,0,0,0,100,0), -- 17:25:31
(@PATH,6,5831.308,726.0686,618.8483,0,0,0,0,100,0); -- 17:25:33

-- Pathing for Underbelly Rat Entry: 32428 'TDB FORMAT' 
SET @NPC := 112319;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5860.327,`position_y`=704.5416,`position_z`=609.4075 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5860.327,704.5416,609.4075,0,0,1,0,100,0), -- 17:41:04
(@PATH,2,5848.26,705.7133,609.4075,0,0,1,0,100,0), -- 17:41:05
(@PATH,3,5846.842,704.8635,609.5217,0,0,1,0,100,0), -- 17:41:07
(@PATH,4,5836.342,691.6135,609.5217,0,0,1,0,100,0), -- 17:41:07
(@PATH,5,5835.342,690.3635,610.0217,0,0,1,0,100,0), -- 17:41:07
(@PATH,6,5833.592,688.1135,610.0217,0,0,1,0,100,0), -- 17:41:07
(@PATH,7,5832.342,686.1135,610.0217,0,0,1,0,100,0), -- 17:41:07
(@PATH,8,5831.625,685.5962,610.1531,0,0,1,0,100,0), -- 17:41:12
(@PATH,9,5821.625,681.8462,610.1531,0,0,1,0,100,0), -- 17:41:12
(@PATH,10,5817.857,678.2463,610.1359,0,0,1,0,100,0), -- 17:41:15
(@PATH,11,5816.357,672.2463,610.1359,0,0,1,0,100,0), -- 17:41:15
(@PATH,12,5815.969,667.8105,610.1359,0,0,1,0,100,0), -- 17:41:17
(@PATH,13,5815.969,666.0605,610.1359,0,0,1,0,100,0), -- 17:41:17
(@PATH,14,5815.719,663.5605,609.6359,0,0,1,0,100,0), -- 17:41:17
(@PATH,15,5815.719,655.0605,609.6359,0,0,1,0,100,0), -- 17:41:17
(@PATH,16,5815.719,653.8105,609.8859,0,0,1,0,100,0), -- 17:41:17
(@PATH,17,5815.234,650.0985,610.0259,0,0,1,0,100,0), -- 17:41:21
(@PATH,18,5813.234,651.0985,610.0259,0,0,1,0,100,0), -- 17:41:21
(@PATH,19,5806.553,653.642,610.1359,0,0,1,0,100,0), -- 17:41:23
(@PATH,20,5797.906,650.6086,610.1359,0,0,1,0,100,0), -- 17:41:24
(@PATH,21,5793.906,647.1086,610.1359,0,0,1,0,100,0), -- 17:41:24
(@PATH,22,5791.656,644.8586,610.1359,0,0,1,0,100,0), -- 17:41:24
(@PATH,23,5790.859,644.0999,610.1359,0,0,1,0,100,0), -- 17:41:27
(@PATH,24,5790.109,642.5999,610.1359,0,0,1,0,100,0), -- 17:41:27
(@PATH,25,5787.335,632.4458,609.5217,0,0,1,0,100,0), -- 17:41:29
(@PATH,26,5786.012,626.2661,609.6223,0,0,1,0,100,0), -- 17:41:30
(@PATH,27,5785.262,623.5161,609.6223,0,0,1,0,100,0), -- 17:41:30
(@PATH,28,5785.012,622.0161,610.1223,0,0,1,0,100,0), -- 17:41:30
(@PATH,29,5784.012,618.7661,610.1223,0,0,1,0,100,0), -- 17:41:30
(@PATH,30,5766.996,613.3734,610.1359,0,0,1,0,100,0), -- 17:41:37
(@PATH,31,5764.289,614.7873,610.1359,0,0,1,0,100,0), -- 17:41:41
(@PATH,32,5761.711,609.0067,610.1359,0,0,1,0,100,0), -- 17:41:43
(@PATH,33,5762.814,602.2861,610.1359,0,0,1,0,100,0), -- 17:41:44
(@PATH,34,5769.666,596.1545,610.1359,0,0,1,0,100,0), -- 17:41:47
(@PATH,35,5779.668,590.0027,610.0217,0,0,1,0,100,0), -- 17:41:48
(@PATH,36,5780.418,588.7527,609.5217,0,0,1,0,100,0), -- 17:41:48
(@PATH,37,5782.172,585.9805,609.6359,0,0,1,0,100,0), -- 17:41:50
(@PATH,38,5784.172,588.9805,609.6359,0,0,1,0,100,0), -- 17:41:50
(@PATH,39,5784.672,589.7305,609.6359,0,0,1,0,100,0), -- 17:41:50
(@PATH,40,5786.422,592.7305,610.1359,0,0,1,0,100,0), -- 17:41:50
(@PATH,41,5788.172,595.2305,610.1359,0,0,1,0,100,0), -- 17:41:50
(@PATH,42,5789.422,597.2305,610.1359,0,0,1,0,100,0), -- 17:41:50
(@PATH,43,5791.422,599.9805,610.1359,0,0,1,0,100,0), -- 17:41:50
(@PATH,44,5792.814,602.571,610.0217,0,0,1,0,100,0), -- 17:41:54
(@PATH,45,5793.564,605.321,610.0217,0,0,1,0,100,0), -- 17:41:54
(@PATH,46,5794.814,608.821,610.0217,0,0,1,0,100,0), -- 17:41:54
(@PATH,47,5795.814,612.571,609.5217,0,0,1,0,100,0), -- 17:41:54
(@PATH,48,5796.314,614.821,609.5217,0,0,1,0,100,0), -- 17:41:54
(@PATH,49,5797.296,616.8961,609.5619,0,0,1,0,100,0), -- 17:41:58
(@PATH,50,5800.046,619.1461,609.5619,0,0,1,0,100,0), -- 17:41:58
(@PATH,51,5802.796,621.1461,609.5619,0,0,1,0,100,0), -- 17:41:58
(@PATH,52,5804.796,622.6461,610.0619,0,0,1,0,100,0), -- 17:41:58
(@PATH,53,5807.046,624.6461,610.0619,0,0,1,0,100,0), -- 17:41:58
(@PATH,54,5809.546,626.3961,610.0619,0,0,1,0,100,0), -- 17:41:58
(@PATH,55,5813.885,631.6583,610.1359,0,0,1,0,100,0), -- 17:42:02
(@PATH,56,5814.885,632.6583,610.1359,0,0,1,0,100,0), -- 17:42:02
(@PATH,57,5816.79,635.3191,610.0217,0,0,1,0,100,0), -- 17:42:03
(@PATH,58,5818.29,638.0691,610.0217,0,0,1,0,100,0), -- 17:42:03
(@PATH,59,5821.54,644.0691,610.0217,0,0,1,0,100,0), -- 17:42:03
(@PATH,60,5822.54,646.3191,609.5217,0,0,1,0,100,0), -- 17:42:03
(@PATH,61,5823.54,648.3191,609.5217,0,0,1,0,100,0), -- 17:42:03
(@PATH,62,5823.962,648.8779,609.6245,0,0,1,0,100,0), -- 17:42:06
(@PATH,63,5827.962,654.3779,609.6245,0,0,1,0,100,0), -- 17:42:06
(@PATH,64,5828.962,655.6279,610.1245,0,0,1,0,100,0), -- 17:42:06
(@PATH,65,5835.354,659.7132,610.0316,0,0,1,0,100,0), -- 17:42:09
(@PATH,66,5829.279,655.8999,610.0217,0,0,1,0,100,0), -- 17:42:12
(@PATH,67,5828.279,654.3999,609.5217,0,0,1,0,100,0), -- 17:42:12
(@PATH,68,5816.525,665.3367,610.0217,0,0,1,0,100,0), -- 17:42:12
(@PATH,69,5815.275,664.3367,609.5217,0,0,1,0,100,0), -- 17:42:12
(@PATH,70,5821.443,644.0874,610.0221,0,0,1,0,100,0), -- 17:42:15
(@PATH,71,5818.443,638.0874,610.0221,0,0,1,0,100,0), -- 17:42:15
(@PATH,72,5814.938,632.898,610.1369,0,0,1,0,100,0), -- 17:42:17
(@PATH,73,5814.188,631.898,610.1369,0,0,1,0,100,0), -- 17:42:17
(@PATH,74,5807.222,624.6782,610.0217,0,0,1,0,100,0), -- 17:42:20
(@PATH,75,5804.972,622.9282,610.0217,0,0,1,0,100,0), -- 17:42:20
(@PATH,76,5802.972,621.4282,609.5217,0,0,1,0,100,0), -- 17:42:20
(@PATH,77,5800.222,619.1782,609.5217,0,0,1,0,100,0), -- 17:42:20
(@PATH,78,5797.37,616.6953,609.5106,0,0,1,0,100,0), -- 17:42:22
(@PATH,79,5796.62,614.6953,609.5106,0,0,1,0,100,0), -- 17:42:22
(@PATH,80,5796.37,613.4453,609.5106,0,0,1,0,100,0), -- 17:42:22
(@PATH,81,5794.87,609.1953,610.0106,0,0,1,0,100,0), -- 17:42:22
(@PATH,82,5793.87,605.1953,610.0106,0,0,1,0,100,0), -- 17:42:22
(@PATH,83,5791.352,600.0093,610.0248,0,0,1,0,100,0), -- 17:42:26
(@PATH,84,5789.602,597.2593,610.0248,0,0,1,0,100,0), -- 17:42:26
(@PATH,85,5788.102,595.2593,610.0248,0,0,1,0,100,0), -- 17:42:26
(@PATH,86,5786.602,592.7593,610.0248,0,0,1,0,100,0), -- 17:42:26
(@PATH,87,5784.602,589.7593,609.5248,0,0,1,0,100,0), -- 17:42:26
(@PATH,88,5784.102,589.0093,609.5248,0,0,1,0,100,0), -- 17:42:26
(@PATH,89,5781.995,586.1212,609.5032,0,0,1,0,100,0), -- 17:42:30
(@PATH,90,5780.495,588.8712,609.5032,0,0,1,0,100,0), -- 17:42:30
(@PATH,91,5779.745,590.1212,610.0032,0,0,1,0,100,0), -- 17:42:30
(@PATH,92,5777.245,594.3712,610.0032,0,0,1,0,100,0), -- 17:42:30
(@PATH,93,5769.974,595.9542,610.1404,0,0,1,0,100,0), -- 17:42:32
(@PATH,94,5768.724,595.7042,610.1404,0,0,1,0,100,0), -- 17:42:32
(@PATH,95,5767.407,595.5968,610.1359,0,0,1,0,100,0), -- 17:42:35
(@PATH,96,5763.157,601.5968,610.1359,0,0,1,0,100,0), -- 17:42:35
(@PATH,97,5762.924,602.3074,610.1359,0,0,1,0,100,0), -- 17:42:36
(@PATH,98,5763.78,614.1101,610.1359,0,0,1,0,100,0), -- 17:42:37
(@PATH,99,5764.873,615.9689,610.1359,0,0,1,0,100,0), -- 17:42:38
(@PATH,100,5766.873,613.2189,610.1359,0,0,1,0,100,0), -- 17:42:38
(@PATH,101,5784.897,621.7813,610.0217,0,0,1,0,100,0), -- 17:42:43
(@PATH,102,5785.397,623.5313,609.5217,0,0,1,0,100,0), -- 17:42:43
(@PATH,103,5786.147,626.2813,609.5217,0,0,1,0,100,0), -- 17:42:43
(@PATH,104,5786.897,629.0313,609.5217,0,0,1,0,100,0), -- 17:42:43
(@PATH,105,5786.155,626.5582,609.6359,0,0,1,0,100,0), -- 17:42:49
(@PATH,106,5786.905,629.0582,609.6359,0,0,1,0,100,0), -- 17:42:49
(@PATH,107,5786.905,629.5582,609.6359,0,0,1,0,100,0), -- 17:42:49
(@PATH,108,5787.155,632.0582,609.6359,0,0,1,0,100,0), -- 17:42:49
(@PATH,109,5787.405,634.3082,610.1359,0,0,1,0,100,0), -- 17:42:49
(@PATH,110,5790,642.3279,609.9437,0,0,1,0,100,0), -- 17:42:52
(@PATH,111,5794.055,646.8982,610.1359,0,0,1,0,100,0), -- 17:42:53
(@PATH,112,5797.555,650.6482,610.1359,0,0,1,0,100,0), -- 17:42:53
(@PATH,113,5799.555,652.6482,610.1359,0,0,1,0,100,0), -- 17:42:53
(@PATH,114,5801.444,654.5395,610.1359,0,0,1,0,100,0), -- 17:42:56
(@PATH,115,5806.444,653.7895,610.1359,0,0,1,0,100,0), -- 17:42:56
(@PATH,116,5807.512,653.4955,610.1359,0,0,1,0,100,0), -- 17:42:57
(@PATH,117,5812.512,651.2455,610.1359,0,0,1,0,100,0), -- 17:42:57
(@PATH,118,5815.426,653.1886,610.1359,0,0,1,0,100,0), -- 17:42:59
(@PATH,119,5815.426,654.9386,609.6359,0,0,1,0,100,0), -- 17:42:59
(@PATH,120,5815.676,663.6886,609.6359,0,0,1,0,100,0), -- 17:42:59
(@PATH,121,5815.676,665.9386,610.1359,0,0,1,0,100,0), -- 17:42:59
(@PATH,122,5815.676,667.6886,610.1359,0,0,1,0,100,0), -- 17:42:59
(@PATH,123,5816.03,668.0648,610.0238,0,0,1,0,100,0), -- 17:43:03
(@PATH,124,5816.03,670.0648,610.0238,0,0,1,0,100,0), -- 17:43:03
(@PATH,125,5816.53,672.0648,610.0238,0,0,1,0,100,0), -- 17:43:03
(@PATH,126,5817.53,678.0648,610.0238,0,0,1,0,100,0), -- 17:43:03
(@PATH,127,5821.502,681.4215,610.1359,0,0,1,0,100,0), -- 17:43:05
(@PATH,128,5835.538,690.3898,610.0217,0,0,1,0,100,0), -- 17:43:08
(@PATH,129,5836.288,691.6398,609.5217,0,0,1,0,100,0), -- 17:43:08
(@PATH,130,5849.831,706.8584,609.4108,0,0,1,0,100,0), -- 17:43:13
(@PATH,131,5855.265,709.8666,609.4075,0,0,1,0,100,0), -- 17:43:15
(@PATH,132,5866.013,703.9492,609.4075,0,0,1,0,100,0), -- 17:43:16
(@PATH,133,5873.884,695.3582,609.4075,0,0,1,0,100,0), -- 17:43:19
(@PATH,134,5874.632,694.2865,609.4949,0,0,1,0,100,0), -- 17:43:20
(@PATH,135,5874.84,689.0822,609.9387,0,0,1,0,100,0), -- 17:43:21
(@PATH,136,5874.09,687.0822,610.9387,0,0,1,0,100,0), -- 17:43:21
(@PATH,137,5873.47,685.0145,610.9896,0,0,1,0,100,0), -- 17:43:23
(@PATH,138,5871.47,683.0145,610.7396,0,0,1,0,100,0), -- 17:43:23
(@PATH,139,5866.97,678.2645,610.9896,0,0,1,0,100,0), -- 17:43:23
(@PATH,140,5865.97,677.2645,610.9896,0,0,1,0,100,0), -- 17:43:23
(@PATH,141,5864.548,676.2894,610.9425,0,0,1,0,100,0), -- 17:43:25
(@PATH,142,5863.548,676.5394,610.9425,0,0,1,0,100,0), -- 17:43:25
(@PATH,143,5859.548,677.2894,610.1925,0,0,1,0,100,0), -- 17:43:25
(@PATH,144,5848.772,675.0753,610.0875,0,0,1,0,100,0), -- 17:43:28
(@PATH,145,5847.37,674.7904,610.0217,0,0,1,0,100,0), -- 17:43:29
(@PATH,146,5844.12,673.7904,610.0217,0,0,1,0,100,0), -- 17:43:29
(@PATH,147,5839.478,672.2452,610.1381,0,0,1,0,100,0), -- 17:43:30
(@PATH,148,5839.478,669.2452,610.1381,0,0,1,0,100,0), -- 17:43:30
(@PATH,149,5839.478,663.7452,610.1381,0,0,1,0,100,0), -- 17:43:30
(@PATH,150,5839.195,669.4826,610.1359,0,0,1,0,100,0), -- 17:43:34
(@PATH,151,5843.771,673.7661,610.1359,0,0,1,0,100,0), -- 17:43:35
(@PATH,152,5846.521,674.7661,610.1359,0,0,1,0,100,0), -- 17:43:35
(@PATH,153,5847.64,674.8135,610.0217,0,0,1,0,100,0), -- 17:43:36
(@PATH,154,5848.64,674.8135,610.0217,0,0,1,0,100,0), -- 17:43:36
(@PATH,155,5849.89,674.8135,609.5217,0,0,1,0,100,0), -- 17:43:36
(@PATH,156,5866.708,676.1121,609.4492,0,0,1,0,100,0), -- 17:43:39
(@PATH,157,5866.708,675.6121,609.4492,0,0,1,0,100,0), -- 17:43:39
(@PATH,158,5864.833,676.2982,610.9387,0,0,1,0,100,0), -- 17:43:41
(@PATH,159,5865.833,677.2982,610.9387,0,0,1,0,100,0), -- 17:43:41
(@PATH,160,5866.833,678.2982,610.9387,0,0,1,0,100,0), -- 17:43:41
(@PATH,161,5871.583,683.0482,610.9387,0,0,1,0,100,0), -- 17:43:41
(@PATH,162,5874.132,686.8735,610.9503,0,0,1,0,100,0), -- 17:43:44
(@PATH,163,5874.632,687.8735,610.4503,0,0,1,0,100,0), -- 17:43:44
(@PATH,164,5875.144,689.2743,609.9451,0,0,1,0,100,0), -- 17:43:45
(@PATH,165,5876.144,690.5243,609.6951,0,0,1,0,100,0), -- 17:43:45
(@PATH,166,5874.644,694.2743,609.6951,0,0,1,0,100,0), -- 17:43:45
(@PATH,167,5873.894,695.0243,609.6951,0,0,1,0,100,0), -- 17:43:45
(@PATH,168,5866.658,703.6503,609.4075,0,0,1,0,100,0), -- 17:43:47
(@PATH,169,5860.372,704.5635,609.4075,0,0,1,0,100,0); -- 17:43:50

-- Pathing for Underbelly Rat Entry: 32428 'TDB FORMAT' 
SET @NPC := 112318;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5812.506,`position_y`=725.5436,`position_z`=624.4396 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5812.506,725.5436,624.4396,0,0,1,0,100,0), -- 17:45:05
(@PATH,2,5811.401,724.5404,624.3019,0,0,1,0,100,0), -- 17:45:07
(@PATH,3,5809.651,723.5404,623.8019,0,0,1,0,100,0), -- 17:45:07
(@PATH,4,5805.687,715.0458,619.4795,0,0,1,0,100,0), -- 17:45:09
(@PATH,5,5805.306,711.5175,619.0914,0,0,1,0,100,0), -- 17:45:10
(@PATH,6,5805.056,711.0175,619.0914,0,0,1,0,100,0), -- 17:45:10
(@PATH,7,5803.806,710.2675,619.3414,0,0,1,0,100,0), -- 17:45:10
(@PATH,8,5798.439,709.6013,619.4612,0,0,1,0,100,0), -- 17:45:11
(@PATH,9,5796.939,708.1013,619.7112,0,0,1,0,100,0), -- 17:45:11
(@PATH,10,5796.189,707.3513,619.7112,0,0,1,0,100,0), -- 17:45:11
(@PATH,11,5796.251,707.1489,619.6675,0,0,1,0,100,0), -- 17:45:12
(@PATH,12,5794.501,705.6489,619.6675,0,0,1,0,100,0), -- 17:45:12
(@PATH,13,5795.787,700.2144,619.2513,0,0,1,0,100,0), -- 17:45:14
(@PATH,14,5796.287,698.9644,619.2513,0,0,1,0,100,0), -- 17:45:14
(@PATH,15,5797.537,695.4644,619.0013,0,0,1,0,100,0), -- 17:45:14
(@PATH,16,5798.287,692.4644,619.0013,0,0,1,0,100,0), -- 17:45:14
(@PATH,17,5799.037,690.9644,619.2513,0,0,1,0,100,0), -- 17:45:14
(@PATH,18,5799.537,689.4644,619.2513,0,0,1,0,100,0), -- 17:45:14
(@PATH,19,5799.536,689.3114,619.3141,0,0,1,0,100,0), -- 17:45:16
(@PATH,20,5800.036,688.0614,619.3141,0,0,1,0,100,0), -- 17:45:16
(@PATH,21,5798.786,687.0614,619.3141,0,0,1,0,100,0), -- 17:45:16
(@PATH,22,5794.159,683.7436,619.2207,0,0,1,0,100,0), -- 17:45:17
(@PATH,23,5792.909,683.2436,619.2207,0,0,1,0,100,0), -- 17:45:17
(@PATH,24,5791.659,682.7436,619.2207,0,0,1,0,100,0), -- 17:45:17
(@PATH,25,5791.753,682.5482,619.214,0,0,1,0,100,0), -- 17:45:19
(@PATH,26,5791.253,682.2982,618.964,0,0,1,0,100,0), -- 17:45:19
(@PATH,27,5789.503,680.2982,618.964,0,0,1,0,100,0), -- 17:45:19
(@PATH,28,5788.781,677.8862,619.2213,0,0,1,0,100,0), -- 17:45:20
(@PATH,29,5789.031,675.3862,619.2213,0,0,1,0,100,0), -- 17:45:20
(@PATH,30,5786.781,671.8862,619.2213,0,0,1,0,100,0), -- 17:45:20
(@PATH,31,5785.09,669.5923,619.22,0,0,1,0,100,0), -- 17:45:21
(@PATH,32,5782.34,670.0923,619.22,0,0,1,0,100,0), -- 17:45:21
(@PATH,33,5781.488,670.0141,619.1985,0,0,1,0,100,0), -- 17:45:22
(@PATH,34,5778.738,667.5141,618.9485,0,0,1,0,100,0), -- 17:45:22
(@PATH,35,5776.889,665.7174,619.0254,0,0,1,0,100,0), -- 17:45:23
(@PATH,36,5771.591,666.1527,618.715,0,0,1,0,100,0), -- 17:45:25
(@PATH,37,5769.591,664.6527,618.715,0,0,1,0,100,0), -- 17:45:25
(@PATH,38,5764.23,657.7101,618.679,0,0,1,0,100,0), -- 17:45:26
(@PATH,39,5763.645,656.9364,618.9661,0,0,1,0,100,0), -- 17:45:27
(@PATH,40,5762.145,655.9364,618.7161,0,0,1,0,100,0), -- 17:45:27
(@PATH,41,5761.145,654.9364,618.7161,0,0,1,0,100,0), -- 17:45:27
(@PATH,42,5759.645,653.9364,618.4661,0,0,1,0,100,0), -- 17:45:27
(@PATH,43,5757.645,652.4364,618.4661,0,0,1,0,100,0), -- 17:45:27
(@PATH,44,5758.634,650.1743,617.9124,0,0,1,0,100,0), -- 17:45:30
(@PATH,45,5759.384,649.6743,617.6624,0,0,1,0,100,0), -- 17:45:30
(@PATH,46,5760.884,648.9243,617.9124,0,0,1,0,100,0), -- 17:45:30
(@PATH,47,5765.302,645.7458,617.7252,0,0,1,0,100,0), -- 17:45:31
(@PATH,48,5766.552,645.2458,617.7252,0,0,1,0,100,0), -- 17:45:31
(@PATH,49,5771.302,643.4958,617.7252,0,0,1,0,100,0), -- 17:45:31
(@PATH,50,5772.802,642.7458,617.4752,0,0,1,0,100,0), -- 17:45:31
(@PATH,51,5773.302,642.4958,617.4752,0,0,1,0,100,0), -- 17:45:31
(@PATH,52,5774.802,640.9958,616.4752,0,0,1,0,100,0), -- 17:45:31
(@PATH,53,5775.896,637.9182,614.7648,0,0,1,0,100,0), -- 17:45:34
(@PATH,54,5777.396,635.9182,613.0148,0,0,1,0,100,0), -- 17:45:34
(@PATH,55,5781.486,634.472,611.2208,0,0,1,0,100,0), -- 17:45:36
(@PATH,56,5782.236,634.472,610.4708,0,0,1,0,100,0), -- 17:45:36
(@PATH,57,5783.486,634.472,609.4708,0,0,1,0,100,0), -- 17:45:36
(@PATH,58,5785.486,634.722,609.4708,0,0,1,0,100,0), -- 17:45:36
(@PATH,59,5783.877,634.4684,609.5891,0,0,1,0,100,0), -- 17:45:37
(@PATH,60,5785.627,634.7184,609.5891,0,0,1,0,100,0), -- 17:45:37
(@PATH,61,5787.377,634.7184,610.3391,0,0,1,0,100,0), -- 17:45:37
(@PATH,62,5791.627,635.2184,610.3391,0,0,1,0,100,0), -- 17:45:37
(@PATH,63,5792.804,635.6805,610.0217,0,0,1,0,100,0), -- 17:45:38
(@PATH,64,5804.054,638.4305,610.0217,0,0,1,0,100,0), -- 17:45:38
(@PATH,65,5808.587,639.6121,610.1359,0,0,1,0,100,0), -- 17:45:41
(@PATH,66,5816.692,643.6942,610.1359,0,0,1,0,100,0), -- 17:45:43
(@PATH,67,5822.68,639.5682,609.7672,0,0,1,0,100,0), -- 17:45:45
(@PATH,68,5823.43,639.5682,610.0172,0,0,1,0,100,0), -- 17:45:45
(@PATH,69,5825.18,639.8182,610.0172,0,0,1,0,100,0), -- 17:45:45
(@PATH,70,5824.43,638.3182,610.0172,0,0,1,0,100,0), -- 17:45:45
(@PATH,71,5824.57,638.2134,610.1077,0,0,1,0,100,0), -- 17:45:47
(@PATH,72,5823.57,636.9634,611.1077,0,0,1,0,100,0), -- 17:45:47
(@PATH,73,5823.57,634.9634,611.6077,0,0,1,0,100,0), -- 17:45:47
(@PATH,74,5824.07,633.7134,612.3577,0,0,1,0,100,0), -- 17:45:47
(@PATH,75,5824.662,632.4669,612.8602,0,0,1,0,100,0), -- 17:45:48
(@PATH,76,5826.162,630.2169,614.1102,0,0,1,0,100,0), -- 17:45:48
(@PATH,77,5826.912,628.9669,614.8602,0,0,1,0,100,0), -- 17:45:48
(@PATH,78,5827.492,628.314,614.7683,0,0,1,0,100,0), -- 17:45:49
(@PATH,79,5828.242,627.314,615.2683,0,0,1,0,100,0), -- 17:45:49
(@PATH,80,5828.742,626.064,616.0183,0,0,1,0,100,0), -- 17:45:49
(@PATH,81,5829.492,624.314,616.0183,0,0,1,0,100,0), -- 17:45:49
(@PATH,82,5830.492,622.564,616.2683,0,0,1,0,100,0), -- 17:45:49
(@PATH,83,5829.866,624.0173,616.4043,0,0,1,0,100,0), -- 17:45:50
(@PATH,84,5830.366,622.7673,616.6543,0,0,1,0,100,0), -- 17:45:50
(@PATH,85,5832.866,624.2673,616.9043,0,0,1,0,100,0), -- 17:45:50
(@PATH,86,5832.366,622.5173,617.4043,0,0,1,0,100,0), -- 17:45:50
(@PATH,87,5832.366,621.2673,617.9043,0,0,1,0,100,0), -- 17:45:50
(@PATH,88,5832.433,621.1912,618.1343,0,0,1,0,100,0), -- 17:45:52
(@PATH,89,5832.183,618.6912,619.1343,0,0,1,0,100,0), -- 17:45:52
(@PATH,90,5832.433,615.6912,620.8843,0,0,1,0,100,0), -- 17:45:52
(@PATH,91,5832.683,614.6912,621.3843,0,0,1,0,100,0), -- 17:45:52
(@PATH,92,5833.433,611.1912,622.1343,0,0,1,0,100,0), -- 17:45:52
(@PATH,93,5833.683,609.6912,621.8843,0,0,1,0,100,0), -- 17:45:52
(@PATH,94,5833.704,609.4901,622.2904,0,0,1,0,100,0), -- 17:45:54
(@PATH,95,5833.954,607.4901,622.2904,0,0,1,0,100,0), -- 17:45:54
(@PATH,96,5833.954,606.2401,622.5404,0,0,1,0,100,0), -- 17:45:54
(@PATH,97,5833.704,600.7401,623.2904,0,0,1,0,100,0), -- 17:45:54
(@PATH,98,5833.454,599.4901,624.0404,0,0,1,0,100,0), -- 17:45:54
(@PATH,99,5833.538,598.366,623.9922,0,0,1,0,100,0), -- 17:45:56
(@PATH,100,5832.038,596.866,624.4922,0,0,1,0,100,0), -- 17:45:56
(@PATH,101,5830.538,595.116,624.7422,0,0,1,0,100,0), -- 17:45:56
(@PATH,102,5828.975,593.5865,624.9868,0,0,1,0,100,0), -- 17:45:58
(@PATH,103,5826.725,591.3365,625.4868,0,0,1,0,100,0), -- 17:45:58
(@PATH,104,5825.521,588.7355,625.7487,0,0,1,0,100,0), -- 17:45:59
(@PATH,105,5825.271,587.4855,625.9987,0,0,1,0,100,0), -- 17:45:59
(@PATH,106,5822.575,582.8594,626.4241,0,0,1,0,100,0), -- 17:46:01
(@PATH,107,5815.441,579.615,627.5906,0,0,1,0,100,0), -- 17:46:02
(@PATH,108,5814.441,578.865,627.8406,0,0,1,0,100,0), -- 17:46:02
(@PATH,109,5812.545,576.4588,628.457,0,0,1,0,100,0), -- 17:46:03
(@PATH,110,5811.545,574.7088,628.707,0,0,1,0,100,0), -- 17:46:03
(@PATH,111,5810.408,571.4939,629.276,0,0,1,0,100,0), -- 17:46:04
(@PATH,112,5804.017,568.0781,629.6204,0,0,1,0,100,0), -- 17:46:06
(@PATH,113,5803.017,566.5781,629.8704,0,0,1,0,100,0), -- 17:46:06
(@PATH,114,5803.129,566.3809,629.8486,0,0,1,0,100,0), -- 17:46:07
(@PATH,115,5801.879,564.8809,629.8486,0,0,1,0,100,0), -- 17:46:07
(@PATH,116,5801.879,563.1309,629.8486,0,0,1,0,100,0), -- 17:46:07
(@PATH,117,5801.629,561.8809,629.8486,0,0,1,0,100,0), -- 17:46:07
(@PATH,118,5801.365,560.2042,630.7414,0,0,1,0,100,0), -- 17:46:08
(@PATH,119,5796.325,553.0746,634.724,0,0,1,0,100,0), -- 17:46:09
(@PATH,120,5793.369,549.6201,634.8419,0,0,1,0,100,0), -- 17:46:10
(@PATH,121,5792.119,548.8701,634.8419,0,0,1,0,100,0), -- 17:46:10
(@PATH,122,5791.119,548.3701,634.8419,0,0,1,0,100,0), -- 17:46:10
(@PATH,123,5788.369,546.6201,636.8419,0,0,1,0,100,0), -- 17:46:10
(@PATH,124,5785.869,545.1201,638.0919,0,0,1,0,100,0), -- 17:46:10
(@PATH,125,5790.984,548.038,634.9894,0,0,1,0,100,0), -- 17:46:15
(@PATH,126,5792.234,548.788,634.9894,0,0,1,0,100,0), -- 17:46:15
(@PATH,127,5792.435,549.0204,634.8621,0,0,1,0,100,0), -- 17:46:17
(@PATH,128,5793.435,549.7704,634.8621,0,0,1,0,100,0), -- 17:46:17
(@PATH,129,5795.435,552.0204,634.8621,0,0,1,0,100,0), -- 17:46:17
(@PATH,130,5796.685,553.2704,635.1121,0,0,1,0,100,0), -- 17:46:17
(@PATH,131,5796.966,553.6017,634.8666,0,0,1,0,100,0), -- 17:46:18
(@PATH,132,5797.216,554.1017,634.3666,0,0,1,0,100,0), -- 17:46:18
(@PATH,133,5801.743,562.6663,630.2207,0,0,1,0,100,0), -- 17:46:20
(@PATH,134,5801.743,564.9163,630.2207,0,0,1,0,100,0), -- 17:46:20
(@PATH,135,5802.493,565.9163,630.2207,0,0,1,0,100,0), -- 17:46:20
(@PATH,136,5804.158,567.8349,629.5902,0,0,1,0,100,0), -- 17:46:21
(@PATH,137,5810.48,571.2711,629.313,0,0,1,0,100,0), -- 17:46:23
(@PATH,138,5812.102,575.7954,628.5873,0,0,1,0,100,0), -- 17:46:24
(@PATH,139,5812.102,576.5454,628.3373,0,0,1,0,100,0), -- 17:46:24
(@PATH,140,5814.352,578.7954,628.0873,0,0,1,0,100,0), -- 17:46:24
(@PATH,141,5814.542,578.6766,628.0162,0,0,1,0,100,0), -- 17:46:25
(@PATH,142,5815.292,579.6766,627.7662,0,0,1,0,100,0), -- 17:46:25
(@PATH,143,5816.792,579.6766,627.7662,0,0,1,0,100,0), -- 17:46:25
(@PATH,144,5822.438,582.6847,626.7626,0,0,1,0,100,0), -- 17:46:26
(@PATH,145,5823.438,583.9347,626.5126,0,0,1,0,100,0), -- 17:46:26
(@PATH,146,5824.323,584.9958,626.1263,0,0,1,0,100,0), -- 17:46:27
(@PATH,147,5825.073,587.2458,626.1263,0,0,1,0,100,0), -- 17:46:27
(@PATH,148,5825.323,588.4958,626.1263,0,0,1,0,100,0), -- 17:46:27
(@PATH,149,5826.115,590.5767,625.4272,0,0,1,0,100,0), -- 17:46:29
(@PATH,150,5831.021,605.7319,623.0287,0,0,1,0,100,0), -- 17:46:29
(@PATH,151,5829.021,599.4819,624.0287,0,0,1,0,100,0), -- 17:46:29
(@PATH,152,5828.021,595.7319,624.5287,0,0,1,0,100,0), -- 17:46:29
(@PATH,153,5827.271,592.9819,624.7787,0,0,1,0,100,0), -- 17:46:29
(@PATH,154,5826.521,590.9819,625.5287,0,0,1,0,100,0), -- 17:46:29
(@PATH,155,5831.989,596.5863,624.5801,0,0,1,0,100,0), -- 17:46:30
(@PATH,156,5833.593,600.676,623.2581,0,0,1,0,100,0), -- 17:46:31
(@PATH,157,5833.843,605.926,622.7581,0,0,1,0,100,0), -- 17:46:31
(@PATH,158,5833.962,607.8434,622.0533,0,0,1,0,100,0), -- 17:46:32
(@PATH,159,5833.712,609.3434,621.8033,0,0,1,0,100,0), -- 17:46:32
(@PATH,160,5833.462,610.3434,622.0533,0,0,1,0,100,0), -- 17:46:32
(@PATH,161,5832.712,614.5934,621.5533,0,0,1,0,100,0), -- 17:46:32
(@PATH,162,5832.712,615.5934,621.0533,0,0,1,0,100,0), -- 17:46:32
(@PATH,163,5832.212,618.0934,619.8033,0,0,1,0,100,0), -- 17:46:32
(@PATH,164,5832.256,618.2179,619.4556,0,0,1,0,100,0), -- 17:46:35
(@PATH,165,5832.006,618.7179,619.2056,0,0,1,0,100,0), -- 17:46:35
(@PATH,166,5832.506,620.9679,618.2056,0,0,1,0,100,0), -- 17:46:35
(@PATH,167,5832.756,622.4679,617.7056,0,0,1,0,100,0), -- 17:46:35
(@PATH,168,5832.239,621.2859,617.7874,0,0,1,0,100,0), -- 17:46:36
(@PATH,169,5832.489,622.5359,617.5374,0,0,1,0,100,0), -- 17:46:36
(@PATH,170,5832.739,624.2859,617.0374,0,0,1,0,100,0), -- 17:46:36
(@PATH,171,5832.239,624.5359,616.5374,0,0,1,0,100,0), -- 17:46:36
(@PATH,172,5830.989,625.5359,616.2874,0,0,1,0,100,0), -- 17:46:36
(@PATH,173,5829.739,626.7859,616.0374,0,0,1,0,100,0), -- 17:46:36
(@PATH,174,5828.739,627.5359,615.5374,0,0,1,0,100,0), -- 17:46:36
(@PATH,175,5826.31,630.0842,614.1038,0,0,1,0,100,0), -- 17:46:38
(@PATH,176,5825.06,631.8342,613.3538,0,0,1,0,100,0), -- 17:46:38
(@PATH,177,5824.81,632.0842,613.1038,0,0,1,0,100,0), -- 17:46:38
(@PATH,178,5824.31,633.3342,612.6038,0,0,1,0,100,0), -- 17:46:38
(@PATH,179,5824.213,633.7821,612.4078,0,0,1,0,100,0), -- 17:46:40
(@PATH,180,5823.713,634.7821,611.6578,0,0,1,0,100,0), -- 17:46:40
(@PATH,181,5824.463,636.7821,611.1578,0,0,1,0,100,0), -- 17:46:40
(@PATH,182,5823.713,638.2821,610.6578,0,0,1,0,100,0), -- 17:46:40
(@PATH,183,5825.163,639.6008,610.0427,0,0,1,0,100,0), -- 17:46:41
(@PATH,184,5823.413,639.3508,610.0427,0,0,1,0,100,0), -- 17:46:41
(@PATH,185,5822.913,639.3508,609.7927,0,0,1,0,100,0), -- 17:46:41
(@PATH,186,5821.913,640.8508,610.2927,0,0,1,0,100,0), -- 17:46:41
(@PATH,187,5821.71,641.128,610.0275,0,0,1,0,100,0), -- 17:46:42
(@PATH,188,5820.21,642.878,610.0275,0,0,1,0,100,0), -- 17:46:42
(@PATH,189,5816.96,643.628,610.0275,0,0,1,0,100,0), -- 17:46:42
(@PATH,190,5813.353,644.3413,610.1364,0,0,1,0,100,0), -- 17:46:43
(@PATH,191,5804.18,638.688,610.1359,0,0,1,0,100,0), -- 17:46:45
(@PATH,192,5792.854,635.4862,610.1309,0,0,1,0,100,0), -- 17:46:48
(@PATH,193,5786.168,634.7509,609.4952,0,0,1,0,100,0), -- 17:46:49
(@PATH,194,5783.918,634.5009,609.4952,0,0,1,0,100,0), -- 17:46:49
(@PATH,195,5782.418,634.5009,610.4952,0,0,1,0,100,0), -- 17:46:49
(@PATH,196,5781.418,634.5009,610.9952,0,0,1,0,100,0), -- 17:46:49
(@PATH,197,5782.23,634.389,610.3091,0,0,1,0,100,0), -- 17:46:51
(@PATH,198,5781.23,634.389,611.0591,0,0,1,0,100,0), -- 17:46:51
(@PATH,199,5779.23,634.389,612.0591,0,0,1,0,100,0), -- 17:46:51
(@PATH,200,5778.23,635.389,612.5591,0,0,1,0,100,0), -- 17:46:51
(@PATH,201,5775.73,637.889,614.8091,0,0,1,0,100,0), -- 17:46:51
(@PATH,202,5773.956,639.8704,616.4454,0,0,1,0,100,0), -- 17:46:53
(@PATH,203,5772.456,641.3704,616.9454,0,0,1,0,100,0), -- 17:46:53
(@PATH,204,5772.206,641.6204,617.1954,0,0,1,0,100,0), -- 17:46:53
(@PATH,205,5771.206,642.3704,617.6954,0,0,1,0,100,0), -- 17:46:53
(@PATH,206,5766.706,645.1204,617.6954,0,0,1,0,100,0), -- 17:46:53
(@PATH,207,5761.375,648.278,617.9376,0,0,1,0,100,0), -- 17:46:56
(@PATH,208,5759.875,649.278,617.6876,0,0,1,0,100,0), -- 17:46:56
(@PATH,209,5758.625,650.278,617.9376,0,0,1,0,100,0), -- 17:46:56
(@PATH,210,5757.67,652.2993,618.3185,0,0,1,0,100,0), -- 17:46:58
(@PATH,211,5759.17,653.2993,618.3185,0,0,1,0,100,0), -- 17:46:58
(@PATH,212,5760.92,654.5493,618.5685,0,0,1,0,100,0), -- 17:46:58
(@PATH,213,5762.17,655.5493,618.8185,0,0,1,0,100,0), -- 17:46:58
(@PATH,214,5763.629,656.9517,618.8355,0,0,1,0,100,0), -- 17:46:59
(@PATH,215,5765.379,661.2017,618.8355,0,0,1,0,100,0), -- 17:46:59
(@PATH,216,5769.263,664.3608,618.6702,0,0,1,0,100,0), -- 17:47:01
(@PATH,217,5773.755,666.7302,618.8483,0,0,1,0,100,0), -- 17:47:02
(@PATH,218,5774.306,667.0947,618.7543,0,0,1,0,100,0), -- 17:47:03
(@PATH,219,5776.306,666.0947,618.7543,0,0,1,0,100,0), -- 17:47:03
(@PATH,220,5776.556,665.8447,619.0043,0,0,1,0,100,0), -- 17:47:03
(@PATH,221,5778.556,667.5947,619.0043,0,0,1,0,100,0), -- 17:47:03
(@PATH,222,5781.24,670.0711,619.0645,0,0,1,0,100,0), -- 17:47:04
(@PATH,223,5786.377,671.8536,619.2012,0,0,1,0,100,0), -- 17:47:06
(@PATH,224,5788.669,677.6926,619.214,0,0,1,0,100,0), -- 17:47:07
(@PATH,225,5788.669,678.9426,619.214,0,0,1,0,100,0), -- 17:47:07
(@PATH,226,5788.923,679.4878,619.0298,0,0,1,0,100,0), -- 17:47:08
(@PATH,227,5789.673,680.2378,619.0298,0,0,1,0,100,0), -- 17:47:08
(@PATH,228,5791.423,682.4878,619.0298,0,0,1,0,100,0), -- 17:47:08
(@PATH,229,5792.423,682.9878,619.2798,0,0,1,0,100,0), -- 17:47:08
(@PATH,230,5794.02,683.6155,619.2227,0,0,1,0,100,0), -- 17:47:09
(@PATH,231,5798.77,686.8655,619.2227,0,0,1,0,100,0), -- 17:47:09
(@PATH,232,5799.506,689.4122,619.0743,0,0,1,0,100,0), -- 17:47:10
(@PATH,233,5799.006,690.9122,619.0743,0,0,1,0,100,0), -- 17:47:10
(@PATH,234,5798.506,692.1622,619.0743,0,0,1,0,100,0), -- 17:47:10
(@PATH,235,5797.256,695.1622,619.0743,0,0,1,0,100,0), -- 17:47:10
(@PATH,236,5796.256,698.1622,619.0743,0,0,1,0,100,0), -- 17:47:10
(@PATH,237,5795.756,699.6622,619.3243,0,0,1,0,100,0), -- 17:47:10
(@PATH,238,5795.712,700.3739,619.2347,0,0,1,0,100,0), -- 17:47:13
(@PATH,239,5795.462,702.8739,619.2347,0,0,1,0,100,0), -- 17:47:13
(@PATH,240,5796.152,707.1231,619.7043,0,0,1,0,100,0), -- 17:47:15
(@PATH,241,5796.652,708.1231,619.7043,0,0,1,0,100,0), -- 17:47:15
(@PATH,242,5797.652,709.1231,619.4543,0,0,1,0,100,0), -- 17:47:15
(@PATH,243,5798.298,709.5776,619.3361,0,0,1,0,100,0), -- 17:47:16
(@PATH,244,5800.298,709.3276,619.3361,0,0,1,0,100,0), -- 17:47:16
(@PATH,245,5805.703,712.6086,619.0933,0,0,1,0,100,0), -- 17:47:17
(@PATH,246,5805.453,714.8586,619.0933,0,0,1,0,100,0), -- 17:47:17
(@PATH,247,5805.453,716.1086,619.0933,0,0,1,0,100,0), -- 17:47:17
(@PATH,248,5805.642,716.5522,619.5599,0,0,1,0,100,0), -- 17:47:18
(@PATH,249,5805.642,717.0522,619.5599,0,0,1,0,100,0), -- 17:47:18
(@PATH,250,5812.082,724.9027,624.3082,0,0,1,0,100,0), -- 17:47:20
(@PATH,251,5812.286,725.2038,624.2163,0,0,1,0,100,0); -- 17:47:21

-- Pathing for Underbelly Rat Entry: 32428 'TDB FORMAT' 
SET @NPC := 112316;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5650.283,`position_y`=859.0229,`position_z`=571.1886 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5650.283,859.0229,571.1886,0,0,1,0,100,0), -- 16:14:32
(@PATH,2,5653.515,856.0323,571.1707,0,0,1,0,100,0), -- 16:14:35
(@PATH,3,5670.484,841.5376,582.4416,0,0,1,0,100,0), -- 16:14:37
(@PATH,4,5687.539,826.0508,591.1404,0,0,1,0,100,0), -- 16:14:43
(@PATH,5,5701.289,812.3008,593.8904,0,0,1,0,100,0), -- 16:14:43
(@PATH,6,5704.789,808.8008,594.8904,0,0,1,0,100,0), -- 16:14:43
(@PATH,7,5710.128,803.3888,596.3097,0,0,1,0,100,0), -- 16:14:52
(@PATH,8,5723.128,792.1388,599.5597,0,0,1,0,100,0), -- 16:14:52
(@PATH,9,5724.628,790.8888,600.5597,0,0,1,0,100,0), -- 16:14:52
(@PATH,10,5733.628,782.8888,608.0597,0,0,1,0,100,0), -- 16:14:52
(@PATH,11,5737.265,778.5158,611.3041,0,0,1,0,100,0), -- 16:14:59
(@PATH,12,5742.015,772.2658,613.8041,0,0,1,0,100,0), -- 16:14:59
(@PATH,13,5746.515,766.5158,617.0541,0,0,1,0,100,0), -- 16:14:59
(@PATH,14,5750.793,762.6057,619.7878,0,0,1,0,100,0), -- 16:15:04
(@PATH,15,5753.543,760.8557,619.5378,0,0,1,0,100,0), -- 16:15:04
(@PATH,16,5763.043,755.6057,620.7878,0,0,1,0,100,0), -- 16:15:04
(@PATH,17,5764.293,755.1057,621.0378,0,0,1,0,100,0), -- 16:15:04
(@PATH,18,5769.043,752.3557,621.2878,0,0,1,0,100,0), -- 16:15:04
(@PATH,19,5770.268,751.4404,621.4811,0,0,1,0,100,0), -- 16:15:09
(@PATH,20,5776.518,745.4404,620.9811,0,0,1,0,100,0), -- 16:15:09
(@PATH,21,5776.768,744.6904,620.7311,0,0,1,0,100,0), -- 16:15:09
(@PATH,22,5778.323,743.4258,620.5052,0,0,1,0,100,0), -- 16:15:11
(@PATH,23,5780.823,741.4258,619.5052,0,0,1,0,100,0), -- 16:15:11
(@PATH,24,5782.027,740.5856,619.0101,0,0,1,0,100,0), -- 16:15:13
(@PATH,25,5783.527,742.3356,619.0101,0,0,1,0,100,0), -- 16:15:13
(@PATH,26,5779.737,745.7886,618.8125,0,0,1,0,100,0), -- 16:15:14
(@PATH,27,5787.284,745.8883,618.6033,0,0,1,0,100,0), -- 16:15:15
(@PATH,28,5790.284,743.3883,618.8533,0,0,1,0,100,0), -- 16:15:15
(@PATH,29,5795.118,739.8246,618.873,0,0,1,0,100,0), -- 16:15:18
(@PATH,30,5792.629,737.5529,618.8592,0,0,1,0,100,0), -- 16:15:19
(@PATH,31,5783.301,728.3273,618.8666,0,0,1,0,100,0), -- 16:15:20
(@PATH,32,5783.337,728.0176,618.8483,0,0,1,0,100,0), -- 16:15:21
(@PATH,33,5781.837,727.0176,618.8483,0,0,1,0,100,0), -- 16:15:21
(@PATH,34,5781.337,724.0176,618.8483,0,0,1,0,100,0), -- 16:15:21
(@PATH,35,5780.837,722.5176,618.8483,0,0,1,0,100,0), -- 16:15:21
(@PATH,36,5780.337,720.0176,618.8483,0,0,1,0,100,0), -- 16:15:21
(@PATH,37,5779.337,716.2676,618.8483,0,0,1,0,100,0), -- 16:15:21
(@PATH,38,5774.164,714.2116,618.8179,0,0,1,0,100,0), -- 16:15:25
(@PATH,39,5772.414,714.4616,618.8179,0,0,1,0,100,0), -- 16:15:25
(@PATH,40,5769.005,714.0853,618.8335,0,0,1,0,100,0), -- 16:15:26
(@PATH,41,5763.755,714.0853,618.5835,0,0,1,0,100,0), -- 16:15:26
(@PATH,42,5759.819,713.6582,618.7951,0,0,1,0,100,0), -- 16:15:29
(@PATH,43,5759.069,712.9082,618.7951,0,0,1,0,100,0), -- 16:15:29
(@PATH,44,5755.638,710.6156,618.8008,0,0,1,0,100,0), -- 16:15:30
(@PATH,45,5746.335,704.4907,618.808,0,0,1,0,100,0), -- 16:15:31
(@PATH,46,5750.018,702.1482,618.8112,0,0,1,0,100,0), -- 16:15:32
(@PATH,47,5758.679,708.1224,618.7933,0,0,1,0,100,0), -- 16:15:35
(@PATH,48,5760.795,704.0508,618.7969,0,0,1,0,100,0), -- 16:15:36
(@PATH,49,5761.01,699.34,618.8027,0,0,1,0,100,0), -- 16:15:37
(@PATH,50,5755.76,692.84,618.8027,0,0,1,0,100,0), -- 16:15:37
(@PATH,51,5754.76,692.09,618.8027,0,0,1,0,100,0), -- 16:15:37
(@PATH,52,5753.962,691.2664,618.8077,0,0,1,0,100,0), -- 16:15:40
(@PATH,53,5748.369,690.7922,618.833,0,0,1,0,100,0), -- 16:15:41
(@PATH,54,5747.619,690.0422,618.833,0,0,1,0,100,0), -- 16:15:41
(@PATH,55,5747.197,689.2921,618.8251,0,0,1,0,100,0), -- 16:15:42
(@PATH,56,5750.266,681.3962,618.9155,0,0,1,0,100,0), -- 16:15:43
(@PATH,57,5749.266,682.6462,618.9155,0,0,1,0,100,0), -- 16:15:43
(@PATH,58,5743.016,688.8962,613.9155,0,0,1,0,100,0), -- 16:15:43
(@PATH,59,5738.654,689.4673,613.6896,0,0,1,0,100,0), -- 16:15:47
(@PATH,60,5737.154,689.4673,613.6896,0,0,1,0,100,0), -- 16:15:47
(@PATH,61,5736.978,686.3589,613.4945,0,0,1,0,100,0), -- 16:15:48
(@PATH,62,5733.56,684.1531,613.4932,0,0,1,0,100,0), -- 16:15:49
(@PATH,63,5730.135,677.58,613.4932,0,0,1,0,100,0), -- 16:15:51
(@PATH,64,5726.457,675.5121,613.4932,0,0,1,0,100,0), -- 16:15:52
(@PATH,65,5724.421,667.7317,613.4932,0,0,1,0,100,0), -- 16:15:53
(@PATH,66,5727.515,664.7499,613.4932,0,0,1,0,100,0), -- 16:15:54
(@PATH,67,5734.917,671.2552,613.4932,0,0,1,0,100,0), -- 16:15:57
(@PATH,68,5749.247,678.9826,613.4949,0,0,1,0,100,0), -- 16:15:59
(@PATH,69,5751.447,678.4545,613.4927,0,0,1,0,100,0), -- 16:16:02
(@PATH,70,5751.198,678.1135,613.2466,0,0,1,0,100,0), -- 16:16:05
(@PATH,71,5746.315,680.7532,613.4939,0,0,1,0,100,0), -- 16:16:07
(@PATH,72,5743.315,682.0032,613.4939,0,0,1,0,100,0), -- 16:16:07
(@PATH,73,5743.031,682.0266,613.4927,0,0,1,0,100,0), -- 16:16:08
(@PATH,74,5742.531,682.2766,613.4927,0,0,1,0,100,0), -- 16:16:08
(@PATH,75,5734.784,669.1796,613.4932,0,0,1,0,100,0), -- 16:16:12
(@PATH,76,5724.512,667.5809,613.4932,0,0,1,0,100,0), -- 16:16:14
(@PATH,77,5722.986,670.8528,613.4932,0,0,1,0,100,0), -- 16:16:15
(@PATH,78,5728.049,675.2232,613.4932,0,0,1,0,100,0), -- 16:16:16
(@PATH,79,5729.3,679.3695,613.4932,0,0,1,0,100,0), -- 16:16:18
(@PATH,80,5733.373,684.2302,613.4932,0,0,1,0,100,0), -- 16:16:19
(@PATH,81,5737.212,689.38,613.487,0,0,1,0,100,0), -- 16:16:20
(@PATH,82,5738.462,689.38,613.487,0,0,1,0,100,0), -- 16:16:20
(@PATH,83,5742.366,689.6543,613.689,0,0,1,0,100,0), -- 16:16:21
(@PATH,84,5743.116,688.9043,613.939,0,0,1,0,100,0), -- 16:16:21
(@PATH,85,5749.116,682.6543,618.689,0,0,1,0,100,0), -- 16:16:21
(@PATH,86,5751.858,684.0981,618.7845,0,0,1,0,100,0), -- 16:16:24
(@PATH,87,5751.939,684.1434,618.7609,0,0,1,0,100,0), -- 16:16:25
(@PATH,88,5752.439,685.1434,618.7609,0,0,1,0,100,0), -- 16:16:25
(@PATH,89,5748.244,690.5693,618.8226,0,0,1,0,100,0), -- 16:16:26
(@PATH,90,5749.485,692.1129,618.8344,0,0,1,0,100,0), -- 16:16:27
(@PATH,91,5755.502,692.8773,618.8097,0,0,1,0,100,0), -- 16:16:29
(@PATH,92,5761.164,699.276,618.8109,0,0,1,0,100,0), -- 16:16:30
(@PATH,93,5760.932,703.9943,618.8033,0,0,1,0,100,0), -- 16:16:31
(@PATH,94,5762.46,706.2981,618.8008,0,0,1,0,100,0), -- 16:16:32
(@PATH,95,5758.46,708.2981,618.8008,0,0,1,0,100,0), -- 16:16:32
(@PATH,96,5756.85,709.1187,618.791,0,0,1,0,100,0), -- 16:16:34
(@PATH,97,5750.122,702.084,618.8142,0,0,1,0,100,0), -- 16:16:35
(@PATH,98,5746.29,704.5815,618.8041,0,0,1,0,100,0), -- 16:16:36
(@PATH,99,5759.648,713.4418,618.8074,0,0,1,0,100,0), -- 16:16:39
(@PATH,100,5759.953,713.6576,618.5587,0,0,1,0,100,0), -- 16:16:40
(@PATH,101,5760.703,714.1576,618.8087,0,0,1,0,100,0), -- 16:16:40
(@PATH,102,5763.453,714.1576,618.8087,0,0,1,0,100,0), -- 16:16:40
(@PATH,103,5773.857,714.0711,618.8163,0,0,1,0,100,0), -- 16:16:42
(@PATH,104,5778.107,714.0711,618.8163,0,0,1,0,100,0), -- 16:16:42
(@PATH,105,5777.944,714.274,618.8197,0,0,1,0,100,0), -- 16:16:43
(@PATH,106,5778.444,714.274,618.8197,0,0,1,0,100,0), -- 16:16:43
(@PATH,107,5778.944,716.274,618.8197,0,0,1,0,100,0), -- 16:16:43
(@PATH,108,5779.944,720.024,618.8197,0,0,1,0,100,0), -- 16:16:43
(@PATH,109,5780.444,722.274,618.8197,0,0,1,0,100,0), -- 16:16:43
(@PATH,110,5780.944,724.024,618.8197,0,0,1,0,100,0), -- 16:16:43
(@PATH,111,5781.226,724.3087,618.8374,0,0,1,0,100,0), -- 16:16:46
(@PATH,112,5781.976,727.0587,618.8374,0,0,1,0,100,0), -- 16:16:46
(@PATH,113,5783.476,728.0587,618.8374,0,0,1,0,100,0), -- 16:16:46
(@PATH,114,5786.476,730.5587,618.8374,0,0,1,0,100,0), -- 16:16:46
(@PATH,115,5792.619,737.4194,618.8751,0,0,1,0,100,0), -- 16:16:48
(@PATH,116,5794.882,739.73,618.8389,0,0,1,0,100,0), -- 16:16:50
(@PATH,117,5790.382,743.23,618.8389,0,0,1,0,100,0), -- 16:16:50
(@PATH,118,5787.132,745.98,618.8389,0,0,1,0,100,0), -- 16:16:50
(@PATH,119,5780.194,747.6804,618.821,0,0,1,0,100,0), -- 16:16:53
(@PATH,120,5779.756,745.7902,618.8091,0,0,1,0,100,0), -- 16:16:54
(@PATH,121,5780.814,741.4368,619.417,0,0,1,0,100,0), -- 16:16:56
(@PATH,122,5779.314,742.9368,620.417,0,0,1,0,100,0), -- 16:16:56
(@PATH,123,5778.416,743.634,620.3975,0,0,1,0,100,0), -- 16:16:57
(@PATH,124,5776.916,744.634,620.6475,0,0,1,0,100,0), -- 16:16:57
(@PATH,125,5764.335,754.9359,620.9836,0,0,1,0,100,0), -- 16:16:59
(@PATH,126,5763.085,755.6859,620.7336,0,0,1,0,100,0), -- 16:16:59
(@PATH,127,5753.585,760.9359,619.9836,0,0,1,0,100,0), -- 16:16:59
(@PATH,128,5750.835,762.4359,619.9836,0,0,1,0,100,0), -- 16:16:59
(@PATH,129,5746.658,766.3828,617.2808,0,0,1,0,100,0), -- 16:17:04
(@PATH,130,5742.408,771.8828,614.0308,0,0,1,0,100,0), -- 16:17:04
(@PATH,131,5737.908,777.6328,612.0308,0,0,1,0,100,0), -- 16:17:04
(@PATH,132,5723.007,791.8114,599.489,0,0,1,0,100,0), -- 16:17:09
(@PATH,133,5710.257,803.5614,596.239,0,0,1,0,100,0), -- 16:17:09
(@PATH,134,5704.813,808.7985,594.8409,0,0,1,0,100,0), -- 16:17:17
(@PATH,135,5701.313,812.2985,593.8409,0,0,1,0,100,0), -- 16:17:17
(@PATH,136,5687.563,826.0485,591.3409,0,0,1,0,100,0), -- 16:17:17
(@PATH,137,5682.813,830.7985,588.5909,0,0,1,0,100,0), -- 16:17:17
(@PATH,138,5670.488,841.3165,582.2974,0,0,1,0,100,0), -- 16:17:25
(@PATH,139,5650.221,859.0325,570.9788,0,0,1,0,100,0); -- 16:17:33

-- Pathing for Underbelly Rat Entry: 32428 'TDB FORMAT' 
SET @NPC := 112317;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5932.637,`position_y`=560.9154,`position_z`=609.7726 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5932.637,560.9154,609.7726,0,0,1,0,100,0), -- 17:52:18
(@PATH,2,5929.887,559.4154,610.0226,0,0,1,0,100,0), -- 17:52:18
(@PATH,3,5924.16,562.6399,610.0771,0,0,1,0,100,0), -- 17:52:19
(@PATH,4,5923.41,563.6399,610.0771,0,0,1,0,100,0), -- 17:52:19
(@PATH,5,5922.568,564.0256,610.0319,0,0,1,0,100,0), -- 17:52:21
(@PATH,6,5920.568,563.7756,610.2819,0,0,1,0,100,0), -- 17:52:21
(@PATH,7,5919.818,563.5256,610.2819,0,0,1,0,100,0), -- 17:52:21
(@PATH,8,5919.068,562.0256,610.0319,0,0,1,0,100,0), -- 17:52:21
(@PATH,9,5917.318,559.2756,610.0319,0,0,1,0,100,0), -- 17:52:21
(@PATH,10,5912.753,557.5631,610.0347,0,0,1,0,100,0), -- 17:52:23
(@PATH,11,5916.578,562.7064,609.9109,0,0,1,0,100,0), -- 17:52:24
(@PATH,12,5917.078,563.7064,610.1609,0,0,1,0,100,0), -- 17:52:24
(@PATH,13,5918.578,565.4564,610.1609,0,0,1,0,100,0), -- 17:52:24
(@PATH,14,5918.574,565.3858,610.2579,0,0,1,0,100,0), -- 17:52:26
(@PATH,15,5919.574,566.8858,610.2579,0,0,1,0,100,0), -- 17:52:26
(@PATH,16,5915.942,569.4524,611.0398,0,0,1,0,100,0), -- 17:52:27
(@PATH,17,5914.692,570.4524,611.0398,0,0,1,0,100,0), -- 17:52:27
(@PATH,18,5913.692,571.9524,611.0398,0,0,1,0,100,0), -- 17:52:27
(@PATH,19,5911.692,574.7024,611.7898,0,0,1,0,100,0), -- 17:52:27
(@PATH,20,5910.942,575.7024,611.7898,0,0,1,0,100,0), -- 17:52:27
(@PATH,21,5909.692,577.4524,611.7898,0,0,1,0,100,0), -- 17:52:27
(@PATH,22,5908.942,578.7024,611.7898,0,0,1,0,100,0), -- 17:52:27
(@PATH,23,5909.448,577.5765,611.9888,0,0,1,0,100,0), -- 17:52:29
(@PATH,24,5908.698,578.8265,611.9888,0,0,1,0,100,0), -- 17:52:29
(@PATH,25,5906.948,580.8265,612.4888,0,0,1,0,100,0), -- 17:52:29
(@PATH,26,5898.948,586.3265,612.9888,0,0,1,0,100,0), -- 17:52:29
(@PATH,27,5897.698,587.3265,613.2388,0,0,1,0,100,0), -- 17:52:29
(@PATH,28,5888.133,593.8323,614.5677,0,0,1,0,100,0), -- 17:52:34
(@PATH,29,5868.403,608.2256,616.2552,0,0,1,0,100,0), -- 17:52:39
(@PATH,30,5867.403,608.9756,616.0052,0,0,1,0,100,0), -- 17:52:39
(@PATH,31,5863.653,611.2256,617.2552,0,0,1,0,100,0), -- 17:52:39
(@PATH,32,5867.005,608.8441,616.1553,0,0,1,0,100,0), -- 17:52:40
(@PATH,33,5863.755,611.0941,617.1553,0,0,1,0,100,0), -- 17:52:40
(@PATH,34,5863.005,611.5941,617.1553,0,0,1,0,100,0), -- 17:52:40
(@PATH,35,5862.755,610.0941,617.4053,0,0,1,0,100,0), -- 17:52:40
(@PATH,36,5862.716,609.9548,617.6683,0,0,1,0,100,0), -- 17:52:42
(@PATH,37,5862.466,607.4548,617.9183,0,0,1,0,100,0), -- 17:52:42
(@PATH,38,5861.716,605.4548,618.4183,0,0,1,0,100,0), -- 17:52:42
(@PATH,39,5859.642,601.2751,619.6371,0,0,1,0,100,0), -- 17:52:43
(@PATH,40,5859.803,596.2305,620.6752,0,0,1,0,100,0), -- 17:52:44
(@PATH,41,5854.399,592.0137,622.5385,0,0,1,0,100,0), -- 17:52:45
(@PATH,42,5853.606,591.7081,622.5364,0,0,1,0,100,0), -- 17:52:47
(@PATH,43,5852.856,590.7081,622.7864,0,0,1,0,100,0), -- 17:52:47
(@PATH,44,5852.356,590.2081,623.0364,0,0,1,0,100,0), -- 17:52:47
(@PATH,45,5851.106,589.4581,623.2864,0,0,1,0,100,0), -- 17:52:47
(@PATH,46,5848.088,586.9359,623.8063,0,0,1,0,100,0), -- 17:52:48
(@PATH,47,5846.588,585.1859,624.0563,0,0,1,0,100,0), -- 17:52:48
(@PATH,48,5838.51,583.7482,624.8914,0,0,1,0,100,0), -- 17:52:50
(@PATH,49,5837.691,585.6058,625.1302,0,0,1,0,100,0), -- 17:52:52
(@PATH,50,5837.691,586.8558,625.1302,0,0,1,0,100,0), -- 17:52:52
(@PATH,51,5837.441,588.3558,624.8802,0,0,1,0,100,0), -- 17:52:52
(@PATH,52,5836.941,589.3558,624.8802,0,0,1,0,100,0), -- 17:52:52
(@PATH,53,5835.691,591.3558,624.6302,0,0,1,0,100,0), -- 17:52:52
(@PATH,54,5834.941,592.1058,624.6302,0,0,1,0,100,0), -- 17:52:52
(@PATH,55,5835.415,591.4377,624.7817,0,0,1,0,100,0), -- 17:52:53
(@PATH,56,5834.665,592.1877,624.7817,0,0,1,0,100,0), -- 17:52:53
(@PATH,57,5834.415,592.6877,624.7817,0,0,1,0,100,0), -- 17:52:53
(@PATH,58,5831.665,592.9377,625.0317,0,0,1,0,100,0), -- 17:52:53
(@PATH,59,5829.415,592.9377,625.0317,0,0,1,0,100,0), -- 17:52:53
(@PATH,60,5831.489,593.141,624.9569,0,0,1,0,100,0), -- 17:52:54
(@PATH,61,5828.989,593.141,624.9569,0,0,1,0,100,0), -- 17:52:54
(@PATH,62,5827.989,593.391,624.9569,0,0,1,0,100,0), -- 17:52:54
(@PATH,63,5826.489,594.891,624.7069,0,0,1,0,100,0), -- 17:52:54
(@PATH,64,5824.989,596.141,624.7069,0,0,1,0,100,0), -- 17:52:54
(@PATH,65,5823.989,597.141,624.7069,0,0,1,0,100,0), -- 17:52:54
(@PATH,66,5823.284,602.2316,624.696,0,0,1,0,100,0), -- 17:52:56
(@PATH,67,5824.034,603.4816,624.446,0,0,1,0,100,0), -- 17:52:56
(@PATH,68,5825.496,604.9807,624.1569,0,0,1,0,100,0), -- 17:52:58
(@PATH,69,5832.577,609.1123,622.6941,0,0,1,0,100,0), -- 17:52:59
(@PATH,70,5832.577,610.3623,622.4441,0,0,1,0,100,0), -- 17:52:59
(@PATH,71,5832.645,613.0908,621.8396,0,0,1,0,100,0), -- 17:53:00
(@PATH,72,5833.895,614.5908,621.3396,0,0,1,0,100,0), -- 17:53:00
(@PATH,73,5834.645,616.0908,620.5896,0,0,1,0,100,0), -- 17:53:00
(@PATH,74,5835.895,618.0908,620.5896,0,0,1,0,100,0), -- 17:53:00
(@PATH,75,5836.239,617.9567,620.214,0,0,1,0,100,0), -- 17:53:01
(@PATH,76,5837.489,620.2067,619.964,0,0,1,0,100,0), -- 17:53:01
(@PATH,77,5839.739,620.2067,619.464,0,0,1,0,100,0), -- 17:53:01
(@PATH,78,5841.018,620.4529,619.0253,0,0,1,0,100,0), -- 17:53:03
(@PATH,79,5842.768,621.4529,618.5253,0,0,1,0,100,0), -- 17:53:03
(@PATH,80,5847.018,623.7029,617.7753,0,0,1,0,100,0), -- 17:53:03
(@PATH,81,5850.018,625.4529,617.2753,0,0,1,0,100,0), -- 17:53:03
(@PATH,82,5853.018,627.2029,616.7753,0,0,1,0,100,0), -- 17:53:03
(@PATH,83,5855.821,630.0739,616.2969,0,0,1,0,100,0), -- 17:53:06
(@PATH,84,5856.571,630.8239,616.2969,0,0,1,0,100,0), -- 17:53:06
(@PATH,85,5857.947,632.9325,616.1628,0,0,1,0,100,0), -- 17:53:07
(@PATH,86,5862.197,634.6825,615.9128,0,0,1,0,100,0), -- 17:53:07
(@PATH,87,5863.447,635.9325,615.9128,0,0,1,0,100,0), -- 17:53:07
(@PATH,88,5865.894,644.5748,615.8455,0,0,1,0,100,0), -- 17:53:10
(@PATH,89,5865.894,645.5748,615.3455,0,0,1,0,100,0), -- 17:53:10
(@PATH,90,5865.829,645.791,615.4341,0,0,1,0,100,0), -- 17:53:11
(@PATH,91,5865.829,646.041,615.4341,0,0,1,0,100,0), -- 17:53:11
(@PATH,92,5862.829,647.541,615.4341,0,0,1,0,100,0), -- 17:53:11
(@PATH,93,5861.579,648.041,615.1841,0,0,1,0,100,0), -- 17:53:11
(@PATH,94,5859.079,644.791,615.1841,0,0,1,0,100,0), -- 17:53:11
(@PATH,95,5857.829,643.541,614.9341,0,0,1,0,100,0), -- 17:53:11
(@PATH,96,5856.982,643.02,614.5778,0,0,1,0,100,0), -- 17:53:13
(@PATH,97,5855.482,644.27,614.0778,0,0,1,0,100,0), -- 17:53:13
(@PATH,98,5853.982,645.27,614.3278,0,0,1,0,100,0), -- 17:53:13
(@PATH,99,5848.046,652.5363,610.8051,0,0,1,0,100,0), -- 17:53:15
(@PATH,100,5847.546,653.0363,610.8051,0,0,1,0,100,0), -- 17:53:15
(@PATH,101,5843.546,659.2863,609.5551,0,0,1,0,100,0), -- 17:53:15
(@PATH,102,5842.796,660.2863,610.3051,0,0,1,0,100,0), -- 17:53:15
(@PATH,103,5842.046,661.2863,610.3051,0,0,1,0,100,0), -- 17:53:15
(@PATH,104,5842.085,661.6648,609.9584,0,0,1,0,100,0), -- 17:53:18
(@PATH,105,5840.085,664.4148,609.9584,0,0,1,0,100,0), -- 17:53:18
(@PATH,106,5843.085,670.6648,609.9584,0,0,1,0,100,0), -- 17:53:18
(@PATH,107,5842.802,678.5958,610.1359,0,0,1,0,100,0), -- 17:53:21
(@PATH,108,5839.953,683.5137,610.1359,0,0,1,0,100,0), -- 17:53:22
(@PATH,109,5834.206,685.7982,610.136,0,0,1,0,100,0), -- 17:53:24
(@PATH,110,5828.92,685.1238,610.1359,0,0,1,0,100,0), -- 17:53:26
(@PATH,111,5826.984,682.3601,610.1359,0,0,1,0,100,0), -- 17:53:27
(@PATH,112,5818.48,668.6338,610.1359,0,0,1,0,100,0), -- 17:53:28
(@PATH,113,5816.1,665.4202,610.1359,0,0,1,0,100,0), -- 17:53:31
(@PATH,114,5815.1,664.1702,609.6359,0,0,1,0,100,0), -- 17:53:31
(@PATH,115,5810.1,657.9202,609.6359,0,0,1,0,100,0), -- 17:53:31
(@PATH,116,5808.85,656.9202,610.1359,0,0,1,0,100,0), -- 17:53:31
(@PATH,117,5806.85,653.9202,610.1359,0,0,1,0,100,0), -- 17:53:31
(@PATH,118,5793.123,634.9679,610.1359,0,0,1,0,100,0), -- 17:53:37
(@PATH,119,5790.14,631.1789,610.1359,0,0,1,0,100,0), -- 17:53:39
(@PATH,120,5788.89,630.1789,609.6359,0,0,1,0,100,0), -- 17:53:39
(@PATH,121,5787.39,628.9289,609.6359,0,0,1,0,100,0), -- 17:53:39
(@PATH,122,5785.64,627.4289,609.6359,0,0,1,0,100,0), -- 17:53:39
(@PATH,123,5782.89,625.1789,609.6359,0,0,1,0,100,0), -- 17:53:39
(@PATH,124,5781.64,624.1789,610.1359,0,0,1,0,100,0), -- 17:53:39
(@PATH,125,5779.79,623.2709,610.2906,0,0,1,0,100,0), -- 17:53:43
(@PATH,126,5773.29,624.0209,610.2906,0,0,1,0,100,0), -- 17:53:43
(@PATH,127,5771.79,624.7709,609.5406,0,0,1,0,100,0), -- 17:53:43
(@PATH,128,5765.886,625.5369,612.6761,0,0,1,0,100,0), -- 17:53:45
(@PATH,129,5764.136,626.5369,613.6761,0,0,1,0,100,0), -- 17:53:45
(@PATH,130,5762.886,626.7869,614.1761,0,0,1,0,100,0), -- 17:53:45
(@PATH,131,5761.386,627.7869,614.9261,0,0,1,0,100,0), -- 17:53:45
(@PATH,132,5757.345,630.0953,616.8363,0,0,1,0,100,0), -- 17:53:48
(@PATH,133,5752.345,634.3453,617.8363,0,0,1,0,100,0), -- 17:53:48
(@PATH,134,5751.345,635.0953,617.3363,0,0,1,0,100,0), -- 17:53:48
(@PATH,135,5748.116,637.8995,618.5641,0,0,1,0,100,0), -- 17:53:50
(@PATH,136,5747.366,636.3995,618.8141,0,0,1,0,100,0), -- 17:53:50
(@PATH,137,5746.008,632.8196,618.8812,0,0,1,0,100,0), -- 17:53:51
(@PATH,138,5744.508,625.0696,618.8812,0,0,1,0,100,0), -- 17:53:51
(@PATH,139,5744.258,623.3196,619.1312,0,0,1,0,100,0), -- 17:53:51
(@PATH,140,5743.789,622.6664,619.2971,0,0,1,0,100,0), -- 17:53:54
(@PATH,141,5742.789,621.6664,619.2971,0,0,1,0,100,0), -- 17:53:54
(@PATH,142,5741.789,620.1664,619.2971,0,0,1,0,100,0), -- 17:53:54
(@PATH,143,5739.586,617.3193,619.2029,0,0,1,0,100,0), -- 17:53:55
(@PATH,144,5723.11,606.8483,618.9691,0,0,1,0,100,0), -- 17:53:59
(@PATH,145,5722.5,607.3009,619.1648,0,0,1,0,100,0), -- 17:54:00
(@PATH,146,5723.25,609.0509,619.1648,0,0,1,0,100,0), -- 17:54:00
(@PATH,147,5725.919,612.6741,619.2623,0,0,1,0,100,0), -- 17:54:01
(@PATH,148,5727.169,613.6741,619.2623,0,0,1,0,100,0), -- 17:54:01
(@PATH,149,5727.833,613.9911,619.2798,0,0,1,0,100,0), -- 17:54:02
(@PATH,150,5730.833,618.4911,619.2798,0,0,1,0,100,0), -- 17:54:02
(@PATH,151,5732.083,620.7411,619.2798,0,0,1,0,100,0), -- 17:54:02
(@PATH,152,5736.408,628.3324,619.2798,0,0,1,0,100,0), -- 17:54:05
(@PATH,153,5738.975,629.0027,619.2798,0,0,1,0,100,0), -- 17:54:06
(@PATH,154,5742.99,635.6492,619.2798,0,0,1,0,100,0), -- 17:54:07
(@PATH,155,5743.467,641.7768,619.2798,0,0,1,0,100,0), -- 17:54:09
(@PATH,156,5747.225,647.0936,619.0926,0,0,1,0,100,0), -- 17:54:10
(@PATH,157,5748.225,647.5936,619.0926,0,0,1,0,100,0), -- 17:54:10
(@PATH,158,5749.297,648.2242,618.9799,0,0,1,0,100,0), -- 17:54:11
(@PATH,159,5749.047,649.2242,619.2299,0,0,1,0,100,0), -- 17:54:11
(@PATH,160,5749.047,650.7242,619.2299,0,0,1,0,100,0), -- 17:54:11
(@PATH,161,5749.047,654.2242,619.4799,0,0,1,0,100,0), -- 17:54:11
(@PATH,162,5748.797,655.7242,619.4799,0,0,1,0,100,0), -- 17:54:11
(@PATH,163,5749.192,655.6202,619.7116,0,0,1,0,100,0), -- 17:54:12
(@PATH,164,5749.192,656.1202,619.7116,0,0,1,0,100,0), -- 17:54:12
(@PATH,165,5750.442,657.8702,619.7116,0,0,1,0,100,0), -- 17:54:12
(@PATH,166,5750.391,657.9781,619.7876,0,0,1,0,100,0), -- 17:54:13
(@PATH,167,5751.891,659.9781,619.5376,0,0,1,0,100,0), -- 17:54:13
(@PATH,168,5753.641,659.4781,619.5376,0,0,1,0,100,0), -- 17:54:13
(@PATH,169,5759.179,661.2788,619.2548,0,0,1,0,100,0), -- 17:54:15
(@PATH,170,5760.229,663.2921,619.3005,0,0,1,0,100,0), -- 17:54:16
(@PATH,171,5760.479,666.2921,619.3005,0,0,1,0,100,0), -- 17:54:16
(@PATH,172,5762.869,669.2735,619.6941,0,0,1,0,100,0), -- 17:54:17
(@PATH,173,5764.619,671.0235,619.6941,0,0,1,0,100,0), -- 17:54:17
(@PATH,174,5766.816,671.4822,619.3464,0,0,1,0,100,0), -- 17:54:18
(@PATH,175,5771.566,670.7322,619.3464,0,0,1,0,100,0), -- 17:54:18
(@PATH,176,5773.478,671.9761,619.1648,0,0,1,0,100,0), -- 17:54:19
(@PATH,177,5772.978,676.9761,619.1648,0,0,1,0,100,0), -- 17:54:19
(@PATH,178,5773.809,679.17,619.6726,0,0,1,0,100,0), -- 17:54:21
(@PATH,179,5775.309,680.92,619.6726,0,0,1,0,100,0), -- 17:54:21
(@PATH,180,5776.809,682.67,619.6726,0,0,1,0,100,0), -- 17:54:21
(@PATH,181,5775.323,680.9807,619.6566,0,0,1,0,100,0), -- 17:54:22
(@PATH,182,5776.823,682.7307,619.6566,0,0,1,0,100,0), -- 17:54:22
(@PATH,183,5777.323,683.2307,619.4066,0,0,1,0,100,0), -- 17:54:22
(@PATH,184,5780.438,683.3417,619.2777,0,0,1,0,100,0), -- 17:54:23
(@PATH,185,5782.188,683.5917,619.2777,0,0,1,0,100,0), -- 17:54:23
(@PATH,186,5783.188,683.5917,619.2777,0,0,1,0,100,0), -- 17:54:23
(@PATH,187,5783.938,684.3417,619.2777,0,0,1,0,100,0), -- 17:54:23
(@PATH,188,5783.903,684.5225,619.173,0,0,1,0,100,0), -- 17:54:24
(@PATH,189,5784.653,685.2725,619.173,0,0,1,0,100,0), -- 17:54:24
(@PATH,190,5784.403,686.5225,619.173,0,0,1,0,100,0), -- 17:54:24
(@PATH,191,5783.903,690.0225,619.173,0,0,1,0,100,0), -- 17:54:24
(@PATH,192,5783.28,683.6895,619.2,0,0,1,0,100,0), -- 17:54:26
(@PATH,193,5783.134,683.567,619.218,0,0,1,0,100,0), -- 17:54:27
(@PATH,194,5780.634,683.317,619.468,0,0,1,0,100,0), -- 17:54:27
(@PATH,195,5778.134,683.567,619.468,0,0,1,0,100,0), -- 17:54:27
(@PATH,196,5777.437,683.3219,619.3995,0,0,1,0,100,0), -- 17:54:28
(@PATH,197,5775.437,680.8219,619.6495,0,0,1,0,100,0), -- 17:54:28
(@PATH,198,5773.687,679.3219,619.6495,0,0,1,0,100,0), -- 17:54:28
(@PATH,199,5772.959,678.2682,619.4105,0,0,1,0,100,0), -- 17:54:29
(@PATH,200,5773.209,677.0182,619.1605,0,0,1,0,100,0), -- 17:54:29
(@PATH,201,5773.709,673.0182,619.1605,0,0,1,0,100,0), -- 17:54:29
(@PATH,202,5773.394,673.0062,619.2454,0,0,1,0,100,0), -- 17:54:31
(@PATH,203,5773.644,672.0062,619.2454,0,0,1,0,100,0), -- 17:54:31
(@PATH,204,5772.396,670.793,619.3744,0,0,1,0,100,0), -- 17:54:32
(@PATH,205,5766.896,671.793,619.3744,0,0,1,0,100,0), -- 17:54:32
(@PATH,206,5762.968,669.4083,619.7806,0,0,1,0,100,0), -- 17:54:33
(@PATH,207,5760.729,666.238,619.5159,0,0,1,0,100,0), -- 17:54:34
(@PATH,208,5760.479,663.488,619.2659,0,0,1,0,100,0), -- 17:54:34
(@PATH,209,5759.131,661.6943,619.3143,0,0,1,0,100,0), -- 17:54:36
(@PATH,210,5756.631,659.4443,619.3143,0,0,1,0,100,0), -- 17:54:36
(@PATH,211,5753.881,659.9443,619.3143,0,0,1,0,100,0), -- 17:54:36
(@PATH,212,5751.954,659.9012,619.4919,0,0,1,0,100,0), -- 17:54:37
(@PATH,213,5750.454,658.1512,619.7419,0,0,1,0,100,0), -- 17:54:37
(@PATH,214,5749.239,656.0627,619.7203,0,0,1,0,100,0), -- 17:54:38
(@PATH,215,5749.239,654.0627,619.4703,0,0,1,0,100,0), -- 17:54:38
(@PATH,216,5749.239,650.8127,619.2203,0,0,1,0,100,0), -- 17:54:38
(@PATH,217,5749.489,649.3127,619.2203,0,0,1,0,100,0), -- 17:54:38
(@PATH,218,5748.988,650.8058,619.2463,0,0,1,0,100,0), -- 17:54:39
(@PATH,219,5749.238,649.3058,619.2463,0,0,1,0,100,0), -- 17:54:39
(@PATH,220,5749.238,648.3058,618.9963,0,0,1,0,100,0), -- 17:54:39
(@PATH,221,5747.238,647.3058,619.2463,0,0,1,0,100,0), -- 17:54:39
(@PATH,222,5747.21,647.066,619.3192,0,0,1,0,100,0), -- 17:54:40
(@PATH,223,5744.96,646.066,619.3192,0,0,1,0,100,0), -- 17:54:40
(@PATH,224,5743.46,642.066,619.3192,0,0,1,0,100,0), -- 17:54:40
(@PATH,225,5742.853,635.8711,619.2798,0,0,1,0,100,0), -- 17:54:43
(@PATH,226,5767.506,624.4731,611.6431,0,0,1,0,100,0), -- 17:55:06
(@PATH,227,5771.256,625.4731,610.1431,0,0,1,0,100,0), -- 17:55:06
(@PATH,228,5772.006,625.2231,609.6431,0,0,1,0,100,0), -- 17:55:06
(@PATH,229,5772.506,624.9731,609.6431,0,0,1,0,100,0), -- 17:55:06
(@PATH,230,5775.756,624.4731,610.3931,0,0,1,0,100,0), -- 17:55:06
(@PATH,231,5781.39,624.2626,610.0007,0,0,1,0,100,0), -- 17:55:08
(@PATH,232,5782.64,625.2626,609.5007,0,0,1,0,100,0), -- 17:55:08
(@PATH,233,5785.39,627.7626,609.5007,0,0,1,0,100,0), -- 17:55:08
(@PATH,234,5787.14,628.7626,609.5007,0,0,1,0,100,0), -- 17:55:08
(@PATH,235,5788.89,630.2626,609.5007,0,0,1,0,100,0), -- 17:55:08
(@PATH,236,5790.14,631.2626,610.0007,0,0,1,0,100,0), -- 17:55:08
(@PATH,237,5789.247,630.4788,609.5232,0,0,1,0,100,0), -- 17:55:11
(@PATH,238,5790.497,631.4788,610.0232,0,0,1,0,100,0), -- 17:55:11
(@PATH,239,5791.497,632.2288,610.0232,0,0,1,0,100,0), -- 17:55:11
(@PATH,240,5792.497,634.2288,610.0232,0,0,1,0,100,0), -- 17:55:11
(@PATH,241,5808.938,656.4456,610.1359,0,0,1,0,100,0), -- 17:55:15
(@PATH,242,5809.938,657.6956,609.6359,0,0,1,0,100,0), -- 17:55:15
(@PATH,243,5815.188,664.1956,609.6359,0,0,1,0,100,0), -- 17:55:15
(@PATH,244,5816.188,665.4456,610.1359,0,0,1,0,100,0), -- 17:55:15
(@PATH,245,5818.914,671.4957,610.0309,0,0,1,0,100,0), -- 17:55:21
(@PATH,246,5820.774,678.6002,610.1359,0,0,1,0,100,0), -- 17:55:22
(@PATH,247,5833.884,685.7383,610.1359,0,0,1,0,100,0), -- 17:55:25
(@PATH,248,5839.521,683.5572,610.1359,0,0,1,0,100,0), -- 17:55:27
(@PATH,249,5842.875,678.5269,610.1359,0,0,1,0,100,0), -- 17:55:28
(@PATH,250,5842.727,670.9156,610.1359,0,0,1,0,100,0), -- 17:55:30
(@PATH,251,5842.025,661.4012,610.2211,0,0,1,0,100,0), -- 17:55:32
(@PATH,252,5842.775,660.4012,610.2211,0,0,1,0,100,0), -- 17:55:32
(@PATH,253,5843.525,659.1512,609.4711,0,0,1,0,100,0), -- 17:55:32
(@PATH,254,5847.025,653.9012,610.2211,0,0,1,0,100,0), -- 17:55:32
(@PATH,255,5847.525,653.1512,610.7211,0,0,1,0,100,0), -- 17:55:32
(@PATH,256,5848.025,652.6512,610.7211,0,0,1,0,100,0), -- 17:55:32
(@PATH,257,5854.674,644.4988,613.7783,0,0,1,0,100,0), -- 17:55:37
(@PATH,258,5858.877,645.0601,615.1895,0,0,1,0,100,0), -- 17:55:38
(@PATH,259,5862.704,647.3643,615.3469,0,0,1,0,100,0), -- 17:55:39
(@PATH,260,5866.175,643.2976,615.8401,0,0,1,0,100,0), -- 17:55:41
(@PATH,261,5863.666,636.2874,615.6055,0,0,1,0,100,0), -- 17:55:42
(@PATH,262,5858.989,633.2343,615.9945,0,0,1,0,100,0), -- 17:55:43
(@PATH,263,5856.424,631.0151,616.6328,0,0,1,0,100,0), -- 17:55:44
(@PATH,264,5855.924,630.0151,616.6328,0,0,1,0,100,0), -- 17:55:44
(@PATH,265,5854.174,628.0151,616.8828,0,0,1,0,100,0), -- 17:55:44
(@PATH,266,5852.924,627.2651,616.6328,0,0,1,0,100,0), -- 17:55:44
(@PATH,267,5850.174,625.7651,617.1328,0,0,1,0,100,0), -- 17:55:44
(@PATH,268,5847.174,624.0151,617.3828,0,0,1,0,100,0), -- 17:55:44
(@PATH,269,5842.674,621.2651,618.3828,0,0,1,0,100,0), -- 17:55:44
(@PATH,270,5839.754,620.274,619.3906,0,0,1,0,100,0), -- 17:55:48
(@PATH,271,5837.754,620.024,619.6406,0,0,1,0,100,0), -- 17:55:48
(@PATH,272,5836.254,618.024,620.1406,0,0,1,0,100,0), -- 17:55:48
(@PATH,273,5834.754,616.274,620.3906,0,0,1,0,100,0), -- 17:55:48
(@PATH,274,5833.754,614.774,621.3906,0,0,1,0,100,0), -- 17:55:48
(@PATH,275,5832.755,613.1848,621.7224,0,0,1,0,100,0), -- 17:55:51
(@PATH,276,5832.755,610.4348,622.2224,0,0,1,0,100,0), -- 17:55:51
(@PATH,277,5831.282,608.2042,622.824,0,0,1,0,100,0), -- 17:55:52
(@PATH,278,5829.532,606.7042,623.324,0,0,1,0,100,0), -- 17:55:52
(@PATH,279,5824.087,603.5916,624.4519,0,0,1,0,100,0), -- 17:55:53
(@PATH,280,5822.902,598.7023,625.1343,0,0,1,0,100,0), -- 17:55:55
(@PATH,281,5823.652,597.7023,624.8843,0,0,1,0,100,0), -- 17:55:55
(@PATH,282,5825.152,596.2023,624.6343,0,0,1,0,100,0), -- 17:55:55
(@PATH,283,5826.152,594.7023,624.6343,0,0,1,0,100,0), -- 17:55:55
(@PATH,284,5827.402,593.7023,624.6343,0,0,1,0,100,0), -- 17:55:55
(@PATH,285,5825.07,596.038,624.6668,0,0,1,0,100,0), -- 17:55:56
(@PATH,286,5826.57,594.788,624.6668,0,0,1,0,100,0), -- 17:55:56
(@PATH,287,5827.82,593.538,624.6668,0,0,1,0,100,0), -- 17:55:56
(@PATH,288,5827.82,593.288,624.9168,0,0,1,0,100,0), -- 17:55:56
(@PATH,289,5829.07,593.288,624.9168,0,0,1,0,100,0), -- 17:55:56
(@PATH,290,5830.82,593.038,624.9168,0,0,1,0,100,0), -- 17:55:56
(@PATH,291,5829.417,592.9346,625.0922,0,0,1,0,100,0), -- 17:55:57
(@PATH,292,5830.917,592.9346,624.8422,0,0,1,0,100,0), -- 17:55:57
(@PATH,293,5834.417,592.6846,624.5922,0,0,1,0,100,0), -- 17:55:57
(@PATH,294,5835.417,591.4346,624.8422,0,0,1,0,100,0), -- 17:55:57
(@PATH,295,5836.917,589.6846,624.8422,0,0,1,0,100,0), -- 17:55:57
(@PATH,296,5836.748,589.3402,624.8186,0,0,1,0,100,0), -- 17:55:58
(@PATH,297,5837.498,588.5902,624.8186,0,0,1,0,100,0), -- 17:55:58
(@PATH,298,5837.498,586.8402,625.0686,0,0,1,0,100,0), -- 17:55:58
(@PATH,299,5837.748,585.8402,625.0686,0,0,1,0,100,0), -- 17:55:58
(@PATH,300,5837.972,586.4098,624.9656,0,0,1,0,100,0), -- 17:55:59
(@PATH,301,5837.972,585.4098,625.2156,0,0,1,0,100,0), -- 17:55:59
(@PATH,302,5837.972,584.6598,625.2156,0,0,1,0,100,0), -- 17:55:59
(@PATH,303,5847.725,586.5244,623.9159,0,0,1,0,100,0), -- 17:56:01
(@PATH,304,5848.381,586.9231,623.4995,0,0,1,0,100,0), -- 17:56:03
(@PATH,305,5850.881,589.1731,623.4995,0,0,1,0,100,0), -- 17:56:03
(@PATH,306,5853.684,591.8207,622.5383,0,0,1,0,100,0), -- 17:56:04
(@PATH,307,5859.724,595.9813,620.9481,0,0,1,0,100,0), -- 17:56:06
(@PATH,308,5859.907,600.2466,619.8765,0,0,1,0,100,0), -- 17:56:07
(@PATH,309,5859.657,600.9966,619.8765,0,0,1,0,100,0), -- 17:56:07
(@PATH,310,5861.254,603.9108,618.8354,0,0,1,0,100,0), -- 17:56:08
(@PATH,311,5861.504,605.1608,618.5854,0,0,1,0,100,0), -- 17:56:08
(@PATH,312,5862.816,610.0886,617.6057,0,0,1,0,100,0), -- 17:56:09
(@PATH,313,5862.816,611.5886,617.1057,0,0,1,0,100,0), -- 17:56:09
(@PATH,314,5863.816,611.0886,617.1057,0,0,1,0,100,0), -- 17:56:09
(@PATH,315,5866.566,609.3386,616.1057,0,0,1,0,100,0), -- 17:56:09
(@PATH,316,5868.066,608.3386,616.6057,0,0,1,0,100,0), -- 17:56:09
(@PATH,317,5871.561,606.3478,616.0399,0,0,1,0,100,0), -- 17:56:12
(@PATH,318,5887.811,594.0978,614.7899,0,0,1,0,100,0), -- 17:56:12
(@PATH,319,5897.243,587.3519,613.1742,0,0,1,0,100,0), -- 17:56:17
(@PATH,320,5898.243,586.8519,613.1742,0,0,1,0,100,0), -- 17:56:17
(@PATH,321,5909.608,577.4766,611.9065,0,0,1,0,100,0), -- 17:56:20
(@PATH,322,5910.358,576.4766,611.9065,0,0,1,0,100,0), -- 17:56:20
(@PATH,323,5911.358,575.2266,611.9065,0,0,1,0,100,0), -- 17:56:20
(@PATH,324,5913.358,572.4766,611.4065,0,0,1,0,100,0), -- 17:56:20
(@PATH,325,5914.358,570.9766,611.1565,0,0,1,0,100,0), -- 17:56:20
(@PATH,326,5914.869,570.5132,611.2545,0,0,1,0,100,0), -- 17:56:23
(@PATH,327,5916.025,569.2449,611.0331,0,0,1,0,100,0), -- 17:56:24
(@PATH,328,5917.275,567.9949,611.0331,0,0,1,0,100,0), -- 17:56:24
(@PATH,329,5918.775,566.9949,610.7831,0,0,1,0,100,0), -- 17:56:24
(@PATH,330,5919.525,566.7449,610.2831,0,0,1,0,100,0), -- 17:56:24
(@PATH,331,5918.525,565.7449,610.2831,0,0,1,0,100,0), -- 17:56:24
(@PATH,332,5917.025,563.9949,610.2831,0,0,1,0,100,0), -- 17:56:24
(@PATH,333,5916.275,562.7449,610.2831,0,0,1,0,100,0), -- 17:56:24
(@PATH,334,5912.947,557.8387,609.8282,0,0,1,0,100,0), -- 17:56:26
(@PATH,335,5912.697,557.5887,609.8282,0,0,1,0,100,0), -- 17:56:26
(@PATH,336,5915.036,555.4799,609.9234,0,0,1,0,100,0), -- 17:56:28
(@PATH,337,5917.036,559.4799,609.9234,0,0,1,0,100,0), -- 17:56:28
(@PATH,338,5918.786,561.9799,609.9234,0,0,1,0,100,0), -- 17:56:28
(@PATH,339,5919.535,563.3184,610.3263,0,0,1,0,100,0), -- 17:56:29
(@PATH,340,5920.785,563.5684,610.3263,0,0,1,0,100,0), -- 17:56:29
(@PATH,341,5922.832,564.0054,610.0492,0,0,1,0,100,0), -- 17:56:30
(@PATH,342,5924.082,562.7554,610.0492,0,0,1,0,100,0), -- 17:56:30
(@PATH,343,5929.893,559.5189,610.0414,0,0,1,0,100,0), -- 17:56:31
(@PATH,344,5931.28,562.356,609.8469,0,0,1,0,100,0), -- 17:56:32
(@PATH,345,5930.53,563.356,609.8469,0,0,1,0,100,0), -- 17:56:32
(@PATH,346,5928.03,565.856,609.8469,0,0,1,0,100,0), -- 17:56:32
(@PATH,347,5927.28,566.856,609.8469,0,0,1,0,100,0), -- 17:56:32
(@PATH,348,5897.451,587.326,613.1277,0,0,1,0,100,0), -- 17:56:40
(@PATH,349,5896.701,588.076,613.3777,0,0,1,0,100,0), -- 17:56:40
(@PATH,350,5888.951,595.076,614.3777,0,0,1,0,100,0), -- 17:56:40
(@PATH,351,5887.915,596.0313,614.4434,0,0,1,0,100,0), -- 17:56:43
(@PATH,352,5868.819,610.8005,615.5193,0,0,1,0,100,0), -- 17:56:47
(@PATH,353,5866.819,612.0505,615.7693,0,0,1,0,100,0), -- 17:56:47
(@PATH,354,5865.069,613.3005,616.5193,0,0,1,0,100,0), -- 17:56:47
(@PATH,355,5866.63,612.3472,615.9749,0,0,1,0,100,0), -- 17:56:50
(@PATH,356,5865.13,613.5972,616.4749,0,0,1,0,100,0), -- 17:56:50
(@PATH,357,5864.63,613.8472,616.7249,0,0,1,0,100,0), -- 17:56:50
(@PATH,358,5864.38,615.5972,616.7249,0,0,1,0,100,0), -- 17:56:50
(@PATH,359,5863.88,617.3472,616.4749,0,0,1,0,100,0), -- 17:56:50
(@PATH,360,5863.63,618.5972,616.9749,0,0,1,0,100,0), -- 17:56:50
(@PATH,361,5864.248,615.8065,616.6554,0,0,1,0,100,0), -- 17:56:51
(@PATH,362,5863.998,617.8065,616.6554,0,0,1,0,100,0), -- 17:56:51
(@PATH,363,5863.748,618.8065,616.9054,0,0,1,0,100,0), -- 17:56:51
(@PATH,364,5863.498,618.8065,616.9054,0,0,1,0,100,0), -- 17:56:51
(@PATH,365,5865.998,623.0565,616.1554,0,0,1,0,100,0), -- 17:56:51
(@PATH,366,5866.748,624.0565,616.1554,0,0,1,0,100,0), -- 17:56:51
(@PATH,367,5866.979,624.3248,616.2649,0,0,1,0,100,0), -- 17:56:52
(@PATH,368,5869.412,631.2599,615.7915,0,0,1,0,100,0), -- 17:56:54
(@PATH,369,5873.593,633.4036,615.6859,0,0,1,0,100,0), -- 17:56:55
(@PATH,370,5872.663,634.2109,615.7021,0,0,1,0,100,0), -- 17:56:58
(@PATH,371,5869.663,631.2109,615.7021,0,0,1,0,100,0), -- 17:56:58
(@PATH,372,5866.861,624.7245,616.1404,0,0,1,0,100,0), -- 17:57:00
(@PATH,373,5866.361,623.4745,616.3904,0,0,1,0,100,0), -- 17:57:00
(@PATH,374,5864.396,615.572,616.6294,0,0,1,0,100,0), -- 17:57:02
(@PATH,375,5864.646,614.072,616.8794,0,0,1,0,100,0), -- 17:57:02
(@PATH,376,5866.896,612.322,615.8794,0,0,1,0,100,0), -- 17:57:02
(@PATH,377,5868.146,611.572,615.6294,0,0,1,0,100,0), -- 17:57:02
(@PATH,378,5869.896,610.322,615.8794,0,0,1,0,100,0), -- 17:57:02
(@PATH,379,5875.009,606.331,615.4817,0,0,1,0,100,0), -- 17:57:06
(@PATH,380,5896.355,588.4134,613.6219,0,0,1,0,100,0), -- 17:57:08
(@PATH,381,5897.355,587.4134,613.3719,0,0,1,0,100,0), -- 17:57:08
(@PATH,382,5898.605,586.1634,613.3719,0,0,1,0,100,0), -- 17:57:08
(@PATH,383,5910.67,576.61,611.9646,0,0,1,0,100,0), -- 17:57:13
(@PATH,384,5911.92,575.86,611.7146,0,0,1,0,100,0), -- 17:57:13
(@PATH,385,5914.42,574.11,611.2146,0,0,1,0,100,0), -- 17:57:13
(@PATH,386,5912.239,575.5333,611.792,0,0,1,0,100,0), -- 17:57:16
(@PATH,387,5914.739,573.7833,611.042,0,0,1,0,100,0), -- 17:57:16
(@PATH,388,5916.489,572.7833,610.792,0,0,1,0,100,0), -- 17:57:16
(@PATH,389,5918.239,572.0333,611.042,0,0,1,0,100,0), -- 17:57:16
(@PATH,390,5921.739,571.0333,610.792,0,0,1,0,100,0), -- 17:57:16
(@PATH,391,5922.739,570.5333,610.542,0,0,1,0,100,0), -- 17:57:16
(@PATH,392,5923.989,570.0333,610.292,0,0,1,0,100,0), -- 17:57:16
(@PATH,393,5925.293,569.5073,610.2241,0,0,1,0,100,0), -- 17:57:18
(@PATH,394,5927.293,566.7573,610.2241,0,0,1,0,100,0), -- 17:57:18
(@PATH,395,5928.043,566.0073,610.2241,0,0,1,0,100,0), -- 17:57:18
(@PATH,396,5930.543,563.2573,610.2241,0,0,1,0,100,0), -- 17:57:18
(@PATH,397,5931.293,562.5073,609.9741,0,0,1,0,100,0); -- 17:57:18
 
 
/* 
* sql\updates\world\2015_10_23_00_world.sql 
*/ 
-- 
-- Sandfury Cretin SAI
SET @ENTRY := 7789;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,2,0,6,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sandfury Cretin - On Just Died - Set Rooted On");

-- Sandfury Slave SAI
SET @ENTRY := 7787;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,6,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sandfury Slave - On Just Died - Set Rooted On");

-- Sandfury Drudge SAI
SET @ENTRY := 7788;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,6,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sandfury Drudge - On Just Died - Set Rooted On");

-- Sandfury Zealot SAI
SET @ENTRY := 8877;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,2,0,6,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sandfury Zealot - On Just Died - Set Rooted On");
 
 
/* 
* sql\updates\world\2015_10_23_01_world.sql 
*/ 
-- Cenarion Circle Reputation
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` IN (15335, 15727);
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES 
(15335, 609, 0, 7, 0, 6, 0, 0, 0, 0),
(15727, 609, 0, 7, 0, 1100, 0, 0, 0, 0);

DELETE FROM `creature_onkill_reputation` WHERE `creature_id` IN (15355, 15538, 15537, 15389, 15391, 15392, 15385, 15338, 15335, 15390, 15319, 15318, 15323, 15320, 15327, 15325, 15386, 15388, 15317, 15316, 15324, 15336);
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES 
(15335, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15317, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15316, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15324, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15338, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15386, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15325, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15336, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15327, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15320, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15323, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15318, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15319, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15385, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15390, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15392, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15391, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15389, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15537, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15538, 609, 0, 7, 0, 10, 0, 0, 0, 0),
(15355, 609, 0, 7, 0, 10, 0, 0, 0, 0);

UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`=11 WHERE  `creature_id` IN (15333, 15461, 15387, 15343);
UPDATE `creature_onkill_reputation` SET `RewOnKillRepFaction2`=609, `MaxStanding2`=7, `RewOnKillRepValue2`=73 WHERE  `creature_id` IN (15276, 15275);
 
 
/* 
* sql\updates\world\2015_10_23_02_world.sql 
*/ 
-- Azuremyst Isle

-- Duplicates
DELETE FROM creature WHERE guid IN (57365,57401,57367,57392);
DELETE FROM creature_addon WHERE guid IN (57365,57401,57367,57392);
-- Vale Moth
UPDATE creature SET position_x = -4056.166748, position_y = -13679.827148, position_z = 70.195099, orientation = 2.894147 WHERE guid = 57400;
UPDATE creature SET position_x = -4009.254883, position_y = -13751.575195, position_z = 69.994392, orientation = 1.271510 WHERE guid = 57362;
UPDATE creature SET position_x = -4002.972168, position_y = -13721.668945, position_z = 66.997993, orientation = 5.467894 WHERE guid = 57364;

-- Mutated Root Lasher
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id = 16517);
UPDATE creature SET position_x = -4072.798828, position_y = -13457.387695, position_z = 53.739014, orientation = 0.767300 WHERE guid = 57304;

-- Megelon
-- should kneel
DELETE FROM `creature_template_addon` WHERE `entry`=16475;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(16475,0,0,8,1,0, '');

-- Red Crystal Bunny
UPDATE creature_template SET inhabittype = 4 WHERE entry = 17947;

UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid IN (57429,57418,57435,57419,57417,57425,57431);
UPDATE creature SET position_x = -4494.916016, position_y = -13426.375977, position_z = 50.020802, orientation = 0.199758 WHERE guid = 57424;
UPDATE creature SET position_x = -4493.666016, position_y = -13412.100586, position_z = 49.711666, orientation = 5.910391 WHERE guid = 57426;
UPDATE creature SET position_x = -4489.001953, position_y = -13347.736328, position_z = 55.123600, spawndist = 5 WHERE guid = 57433;
UPDATE creature SET position_x = -4558.07, position_y = -13383, position_z = 84.0283, orientation = 0.980421, spawndist = 0, MovementType = 0 WHERE guid = 57415;
UPDATE creature SET position_x = -4561.61, position_y = -13332, position_z = 78.297, orientation = 4.36313, spawndist = 0, MovementType = 0 WHERE guid = 57438;
UPDATE creature SET position_x = -4495.072754, position_y = -13341.267578, position_z = 54.948174, orientation = 0.872046, spawndist = 0, MovementType = 2 WHERE guid = 57432;
UPDATE creature SET spawndist = 0, MovementType = 2 WHERE guid IN (57436,57420);

SET @NPC := 57420;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH,  1, -4570.33, -13342, 79.7079),
(@PATH,  2, -4572.42, -13338.7, 81.9836),
(@PATH,  3, -4573.8, -13332.1, 85.5403),
(@PATH,  4, -4573.62, -13325.4, 88.0573),
(@PATH,  5, -4571.77, -13319.3, 88.317),
(@PATH,  6, -4558.65, -13302.6, 85.9795),
(@PATH,  7, -4550.41, -13299, 82.8511),
(@PATH,  8, -4542.54, -13296.4, 79.706),
(@PATH,  9, -4551.81, -13299.4, 83.4887),
(@PATH,  10, -4558, -13302.1, 85.7307),
(@PATH,  11, -4569.98, -13314.4, 87.7967),
(@PATH,  12, -4574.35, -13325.8, 87.9575),
(@PATH,  13, -4574.1, -13333.5, 84.9354),
(@PATH,  14, -4572.79, -13338.5, 82.1879),
(@PATH,  15, -4570.21, -13342.1, 79.6678),
(@PATH,  16, -4565.7, -13343.3, 78.4452);

SET @NPC := 57436;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH,  1, -4537.6, -13317.9, 77.7301),
(@PATH,  2, -4531.29, -13317.2, 77.917),
(@PATH,  3, -4538.35, -13312.8, 77.9808),
(@PATH,  4, -4538.11, -13320.2, 77.6869),
(@PATH,  5, -4536.77, -13324.9, 77.5682),
(@PATH,  6, -4537, -13320.7, 77.6223),
(@PATH,  7, -4533.12, -13307.4, 77.7173),
(@PATH,  8, -4525.5, -13301.3, 77.8192),
(@PATH,  9, -4516, -13301.1, 76.9484),
(@PATH,  10, -4508.35, -13305, 74.2754),
(@PATH,  11, -4503.76, -13309.2, 70.6749),
(@PATH,  12, -4502.26, -13315, 68.1374),
(@PATH,  13, -4500.93, -13322.2, 64.4202),
(@PATH,  14, -4502.32, -13314.8, 68.1939),
(@PATH,  15, -4505.17, -13307.9, 71.7238),
(@PATH,  16, -4511.36, -13302.8, 75.8496),
(@PATH,  17, -4521.51, -13300.4, 77.5693),
(@PATH,  18, -4529.88, -13303.2, 77.7191),
(@PATH,  19, -4536.49, -13312.7, 77.9282),
(@PATH,  20, -4542.37, -13324.8, 77.5282),
(@PATH,  21, -4550.38, -13333.2, 77.7908),
(@PATH,  22, -4550.78, -13344.5, 78.0558),
(@PATH,  23, -4548.2, -13347.2, 77.6171),
(@PATH,  24, -4544.49, -13348.3, 76.6312),
(@PATH,  25, -4550.57, -13355.2, 78.4657),
(@PATH,  26, -4541.91, -13366.4, 75.7633),
(@PATH,  27, -4537.09, -13379.5, 72.2425),
(@PATH,  28, -4526.18, -13391.8, 63.0653),
(@PATH,  29, -4535.68, -13382.6, 70.6931),
(@PATH,  30, -4540.1, -13371.5, 74.4121),
(@PATH,  31, -4543.29, -13364.2, 76.4836),
(@PATH,  32, -4549.18, -13357.4, 78.4678),
(@PATH,  33, -4553.56, -13358.2, 78.9982),
(@PATH,  34, -4556.42, -13365.6, 82.0062),
(@PATH,  35, -4557.25, -13379.6, 84.2324),
(@PATH,  36, -4556.48, -13368.8, 83.0642),
(@PATH,  37, -4554.17, -13357.4, 78.9413),
(@PATH,  38, -4550.83, -13348.5, 78.0941),
(@PATH,  39, -4551.95, -13326, 78.1122),
(@PATH,  40, -4552.54, -13331.4, 77.8854),
(@PATH,  41, -4555.86, -13336.1, 77.8128),
(@PATH,  42, -4560.8, -13337.2, 77.8925),
(@PATH,  43, -4561.78, -13335, 78.0228),
(@PATH,  44, -4560.34, -13337.7, 77.8832),
(@PATH,  45, -4551.95, -13333.7, 77.7376),
(@PATH,  46, -4543.65, -13322.2, 77.7184);

SET @NPC := 57432;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH,  1, -4503.06, -13357.7, 54.1247),
(@PATH,  2, -4506.78, -13373.2, 53.7056),
(@PATH,  3, -4507.36, -13387, 53.8641),
(@PATH,  4, -4506.39, -13372.9, 53.7694),
(@PATH,  5, -4502.84, -13357.5, 54.1533),
(@PATH,  6, -4495.22, -13341.5, 54.8385);

UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid IN (57473,57466,57319,57321,57468,57467,57320,57470,57472,57474,57471,57316,57457,57458,57450,57462,57318,57463,57465,57464,57461);
UPDATE creature SET position_x = -4471.007813, position_y = -14096.670898, position_z = 109.848373, orientation = 2.725909 WHERE guid = 57464;
UPDATE creature SET position_x = -4643.638672, position_y = -13940.991211, position_z = 85.342995, orientation = 5.246780 WHERE guid = 57474;
-- missing added - -- UDB free guid used

DELETE FROM creature WHERE guid IN (
75958,
75959,
75960,
75961,
75962,
75963,
75964,
75965,
75966,
75967);

INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, curhealth, curmana, MovementType) VALUES 
(75958,16537,530,1,1,0,0,-4434.66,-13759.4,56.6934,6.16494,300,0,71,0,2),
(75959,16537,530,1,1,0,0,-4447.7,-13871.1,100.039,0.550673,300,0,71,0,2),
(75960,16537,530,1,1,0,0,-4589.24,-13965.9,82.7032,3.97444,300,0,71,0,2),
(75961,16537,530,1,1,0,0,-4594.7,-14003.5,86.0174,1.36692,300,0,71,0,2),
(75962,16537,530,1,1,0,0,-4654.6,-13981.2,85.2454,0.550101,300,5,71,0,1),
 -- Nestlewwod Owlkin
(75963,16518,530,1,1,0,0,-4523.47,-14045.3,108.254,1.15354,300,0,86,0,2),
(75964,16518,530,1,1,0,0,-4622.08,-13980.5,83.0399,5.28298,300,0,86,0,0),
(75965,16518,530,1,1,0,0,-4637.72,-13935.3,86.0136,5.21538,300,0,71,0,0),
(75966,16518,530,1,1,0,0,-4667.34,-13966,87.076,5.68662,300,0,86,0,0),
(75967,16518,530,1,1,0,0,-4646.43,-14010,88.6244,2.11305,300,0,71,0,0);

SET @NPC := 75961;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH,  1, -4592.98, -13982.5, 84.4159),
(@PATH,  2, -4586.16, -13971.4, 82.9927),
(@PATH,  3, -4580.24, -13956.1, 83.3117),
(@PATH,  4, -4572.24, -13945.5, 83.977),
(@PATH,  5, -4553.06, -13927.5, 84.9424),
(@PATH,  6, -4540.27, -13916, 87.0233),
(@PATH,  7, -4533.76, -13907.4, 89.6782),
(@PATH,  8, -4526.08, -13901.9, 91.075),
(@PATH,  9, -4511.39, -13896.2, 93.3214),
(@PATH,  10, -4501.98, -13896, 95.7497),
(@PATH,  11, -4513.02, -13896.4, 92.8177),
(@PATH,  12, -4524.08, -13900.5, 91.1834),
(@PATH,  13, -4533.81, -13907.2, 89.7356),
(@PATH,  14, -4537.63, -13911.7, 87.7131),
(@PATH,  15, -4543.6, -13919.2, 87.4545),
(@PATH,  16, -4552.8, -13927.3, 84.9588),
(@PATH,  17, -4576.24, -13949, 83.6602),
(@PATH,  18, -4589.23, -13952, 83.2427),
(@PATH,  19, -4604.19, -13952, 83.5327),
(@PATH,  20, -4616.22, -13947.2, 83.8974),
(@PATH,  21, -4627.14, -13943.9, 84.4674),
(@PATH,  22, -4637.3, -13944.4, 85.009),
(@PATH,  23, -4649.9, -13949.8, 85.5586),
(@PATH,  24, -4657.77, -13959.4, 86.2783),
(@PATH,  25, -4664.29, -13969.3, 86.5976),
(@PATH,  26, -4662.94, -13981.2, 86.5135),
(@PATH,  27, -4659.69, -13991.1, 87.4205),
(@PATH,  28, -4659.05, -14002.6, 88.7217),
(@PATH,  29, -4658.11, -13991.3, 87.3414),
(@PATH,  30, -4652.72, -13982.8, 85.1681),
(@PATH,  31, -4644.96, -13980.1, 83.6062),
(@PATH,  32, -4629.25, -13979.6, 82.8775),
(@PATH,  33, -4612.33, -13973.1, 83.1243),
(@PATH,  34, -4597.79, -13975.3, 83.3084),
(@PATH,  35, -4592.27, -13985.8, 84.9837),
(@PATH,  36, -4594.39, -14003.7, 86.0171);

SET @NPC := 75960;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH,  1, -4592.27, -13969.7, 82.8063),
(@PATH,  2, -4598.27, -13970.8, 82.8528),
(@PATH,  3, -4602.71, -13969, 82.9031),
(@PATH,  4, -4605.37, -13963.2, 82.86),
(@PATH,  5, -4604.43, -13957.7, 82.9402),
(@PATH,  6, -4599.52, -13953.3, 83.2446),
(@PATH,  7, -4593.36, -13953.8, 83.11),
(@PATH,  8, -4588.46, -13958.5, 82.7968),
(@PATH,  9, -4588.68, -13965.4, 82.7122);

SET @NPC := 75963;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH,  1, -4517.82, -14036.6, 109.638),
(@PATH,  2, -4512.34, -14031.9, 111.705),
(@PATH,  3, -4504.76, -14032, 115.22),
(@PATH,  4, -4495.7, -14035, 120.769),
(@PATH,  5, -4485.96, -14035.7, 125.867),
(@PATH,  6, -4477.07, -14034.1, 130.216),
(@PATH,  7, -4468.08, -14026.7, 135.697),
(@PATH,  8, -4463.56, -14019.2, 139.389),
(@PATH,  9, -4462.25, -14008.6, 144.543),
(@PATH,  10, -4462.15, -13995.7, 151.398),
(@PATH,  11, -4459.33, -13989.3, 155.012),
(@PATH,  12, -4453.88, -13984, 158.884),
(@PATH,  13, -4442.96, -13977.9, 162.913),
(@PATH,  14, -4437.08, -13973.9, 163.54),
(@PATH,  15, -4442.83, -13978.1, 162.882),
(@PATH,  16, -4447.89, -13981.6, 160.698),
(@PATH,  17, -4454.41, -13984.3, 158.621),
(@PATH,  18, -4459.15, -13988.9, 155.249),
(@PATH,  19, -4462.06, -13995.7, 151.433),
(@PATH,  20, -4463.62, -14005.8, 145.88),
(@PATH,  21, -4464.5, -14015.9, 140.278),
(@PATH,  22, -4465.92, -14022.3, 137.806),
(@PATH,  23, -4473.41, -14032, 132.139),
(@PATH,  24, -4480.65, -14035.1, 128.564),
(@PATH,  25, -4489.53, -14035.6, 123.745),
(@PATH,  26, -4499.66, -14033.4, 118.385),
(@PATH,  27, -4509.38, -14031.3, 113.055),
(@PATH,  28, -4516.56, -14033.5, 110.339),
(@PATH,  29, -4522.55, -14042.1, 108.413),
(@PATH,  30, -4522.58, -14049.5, 108.513),
(@PATH,  31, -4511.73, -14069.1, 108.323),
(@PATH,  32, -4494.98, -14092.5, 108.716),
(@PATH,  33, -4480.21, -14106.9, 109.008),
(@PATH,  34, -4476.78, -14106.6, 109.331),
(@PATH,  35, -4480.54, -14107, 109.074),
(@PATH,  36, -4501.89, -14085, 108.471),
(@PATH,  37, -4513.44, -14066.2, 108.282),
(@PATH,  38, -4523.29, -14045.9, 108.31),
(@PATH,  39, -4531.47, -14045.2, 107.159),
(@PATH,  40, -4540.48, -14042.7, 104.373),
(@PATH,  41, -4545.76, -14038.1, 101.742),
(@PATH,  42, -4549.34, -14028.7, 97.4769),
(@PATH,  43, -4550.8, -14014.1, 91.238),
(@PATH,  44, -4549.57, -14028.6, 97.381),
(@PATH,  45, -4545.99, -14038.1, 101.736),
(@PATH,  46, -4540.46, -14042.4, 104.306),
(@PATH,  47, -4531.34, -14045, 107.178),
(@PATH,  48, -4522.13, -14050.4, 108.592),
(@PATH,  49, -4503.35, -14075.6, 108.32),
(@PATH,  50, -4475.96, -14095.1, 109.774),
(@PATH,  51, -4473.36, -14101.2, 109.944),
(@PATH,  52, -4474.57, -14105.7, 109.152),
(@PATH,  53, -4480.68, -14108, 109.006),
(@PATH,  54, -4502.26, -14085.2, 108.472),
(@PATH,  55, -4522.41, -14050.8, 108.626),
(@PATH,  56, -4522.98, -14042.5, 108.354);

SET @NPC := 75959;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH,  1, -4438.31, -13862.6, 91.776),
(@PATH,  2, -4431.32, -13855.8, 84.8948),
(@PATH,  3, -4426.89, -13851, 80.9621),
(@PATH,  4, -4425.11, -13841, 79.7135),
(@PATH,  5, -4425.27, -13831.5, 80.3198),
(@PATH,  6, -4428.9, -13821.8, 80.8588),
(@PATH,  7, -4431.14, -13808.6, 82.159),
(@PATH,  8, -4428.98, -13822, 80.8303),
(@PATH,  9, -4425.5, -13831.3, 80.3171),
(@PATH,  10, -4425.99, -13848.9, 80.3403),
(@PATH,  11, -4422.94, -13853.1, 79.9921),
(@PATH,  12, -4405.51, -13848.8, 71.1473),
(@PATH,  13, -4394.64, -13843.8, 69.9378),
(@PATH,  14, -4373.31, -13829.4, 69.2241),
(@PATH,  15, -4367.44, -13827.8, 69.2241),
(@PATH,  16, -4374.24, -13829.8, 69.2241),
(@PATH,  17, -4395.14, -13844.2, 69.9654),
(@PATH,  18, -4401.71, -13847.1, 70.3372),
(@PATH,  19, -4408.22, -13846.1, 70.6981),
(@PATH,  20, -4410.12, -13840.5, 68.5303),
(@PATH,  21, -4407.06, -13825, 62.3528),
(@PATH,  22, -4406.01, -13816.6, 60.4572),
(@PATH,  23, -4401.2, -13811.8, 58.4539),
(@PATH,  24, -4395.99, -13804.2, 55.897),
(@PATH,  25, -4401.33, -13812.3, 58.5553),
(@PATH,  26, -4405.57, -13815.9, 60.3377),
(@PATH,  27, -4407.42, -13829.5, 63.9209),
(@PATH,  28, -4409.96, -13840.7, 68.609),
(@PATH,  29, -4407.79, -13845.8, 70.5699),
(@PATH,  30, -4401.1, -13847.4, 70.3476),
(@PATH,  31, -4393.45, -13843.7, 69.9347),
(@PATH,  32, -4373.67, -13829.4, 69.2235),
(@PATH,  33, -4366.85, -13827.6, 69.2235),
(@PATH,  34, -4374.52, -13829.8, 69.228),
(@PATH,  35, -4397.51, -13845.3, 70.0348),
(@PATH,  36, -4405.96, -13849.2, 71.4118),
(@PATH,  37, -4420.98, -13853.4, 79.1551),
(@PATH,  38, -4425.01, -13851.3, 80.4895),
(@PATH,  39, -4426.2, -13842.6, 79.8567),
(@PATH,  40, -4425.92, -13830.4, 80.3672),
(@PATH,  41, -4429.15, -13820.9, 80.9154),
(@PATH,  42, -4431.09, -13808.4, 82.1788),
(@PATH,  43, -4429.49, -13822.1, 80.7973),
(@PATH,  44, -4425.68, -13831.3, 80.2927),
(@PATH,  45, -4425.49, -13843.3, 79.8208),
(@PATH,  46, -4426.59, -13851.3, 80.9487),
(@PATH,  47, -4431.98, -13856.3, 85.4742),
(@PATH,  48, -4438.4, -13862.8, 91.9377),
(@PATH,  49, -4446.83, -13869.7, 99.5607),
(@PATH,  50, -4450.92, -13879.3, 102.427),
(@PATH,  51, -4447.55, -13889, 107.062),
(@PATH,  52, -4439.39, -13901.1, 116.042),
(@PATH,  53, -4435.46, -13912.5, 124.001),
(@PATH,  54, -4434.29, -13919.4, 128.474),
(@PATH,  55, -4429.09, -13933.4, 138.171),
(@PATH,  56, -4429.81, -13941.6, 143.975),
(@PATH,  57, -4426.58, -13948.8, 149.331),
(@PATH,  58, -4424.46, -13957.5, 154.731),
(@PATH,  59, -4424.99, -13971.4, 161.606),
(@PATH,  60, -4425, -13966.8, 160.317),
(@PATH,  61, -4424.71, -13954.9, 153.1),
(@PATH,  62, -4426.49, -13948.2, 149.01),
(@PATH,  63, -4429.64, -13942, 144.229),
(@PATH,  64, -4429.46, -13931.9, 137.163),
(@PATH,  65, -4433.91, -13920.2, 129.02),
(@PATH,  66, -4436.84, -13906.8, 119.518),
(@PATH,  67, -4439.42, -13900.3, 115.63),
(@PATH,  68, -4445.36, -13893.5, 110.394),
(@PATH,  69, -4449.88, -13882.6, 103.797),
(@PATH,  70, -4450.84, -13875.1, 101.276),
(@PATH,  71, -4448.44, -13870.8, 100.18);

SET @NPC := 75958;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH,  1, -4397.45, -13759, 52.5403),
(@PATH,  2, -4387.6, -13750.7, 51.187),
(@PATH,  3, -4384.44, -13738.6, 50.5713),
(@PATH,  4, -4385.32, -13731.1, 50.4359),
(@PATH,  5, -4391.07, -13724.8, 50.5065),
(@PATH,  6, -4426.98, -13722.3, 51.7162),
(@PATH,  7, -4437.56, -13719.7, 51.5869),
(@PATH,  8, -4446.66, -13713.5, 49.9453),
(@PATH,  9, -4450.02, -13707.3, 48.3929),
(@PATH,  10, -4448.54, -13698.3, 47.5457),
(@PATH,  11, -4440.44, -13690.5, 45.7925),
(@PATH,  12, -4434.76, -13689.6, 45.5794),
(@PATH,  13, -4430.11, -13694, 46.9106),
(@PATH,  14, -4423.66, -13715.8, 51.0542),
(@PATH,  15, -4418.28, -13721.3, 51.1114),
(@PATH,  16, -4391.7, -13722.8, 50.4426),
(@PATH,  17, -4381.61, -13727.8, 50.2699),
(@PATH,  18, -4380.06, -13739.4, 50.4521),
(@PATH,  19, -4383.25, -13752.4, 50.4515),
(@PATH,  20, -4392.68, -13769.2, 52.2511),
(@PATH,  21, -4390.35, -13775.7, 52.1454),
(@PATH,  22, -4370.44, -13787.6, 52.2808),
(@PATH,  23, -4368.16, -13791.2, 52.3032),
(@PATH,  24, -4369.71, -13795.9, 52.4165),
(@PATH,  25, -4379.54, -13798.8, 52.1976),
(@PATH,  26, -4391, -13795.6, 53.3708),
(@PATH,  27, -4392.48, -13786.4, 52.7211),
(@PATH,  28, -4409.88, -13759.7, 53.5569),
(@PATH,  29, -4434.79, -13759.4, 56.6967);
 
 
/* 
* sql\updates\world\2015_10_23_03_world.sql 
*/ 
SET @OGUID:=77266;
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+430 AND `eventEntry`=12;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+430;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0,180415, 571, 1, 1, 5759.221, 574.9567, 649.9132, 2.967041, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+1,180415, 571, 1, 1, 5755.542, 570.8301, 650.9344, 6.19592, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+2,180415, 571, 1, 1, 5757.676, 573.3919, 650.1688, 5.061456, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+3,180415, 571, 1, 1, 5746.643, 578.5375, 650.8829, 0.9599299, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+4,180415, 571, 1, 1, 5748.668, 581.0043, 650.151, 4.450591, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+5,180415, 571, 1, 1, 5749.933, 582.6556, 649.8248, 4.642576, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+6,180406, 571, 1, 1, 5728.36, 610.9005, 649.4632, 2.373644, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+7,180415, 571, 1, 1, 5715.421, 644.4554, 648.6602, 2.18166, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+8,180415, 571, 1, 1, 5715.515, 646.4188, 648.6602, 4.537859, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+9,180415, 571, 1, 1, 5753.461, 568.1178, 651.6292, 1.047198, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+10,180415, 571, 1, 1, 5744.647, 575.9879, 651.6357, 3.543024, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+11,180415, 571, 1, 1, 5715.134, 648.1215, 648.6602, 0.122173, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+12,180415, 571, 1, 1, 5751.013, 565.1844, 651.9471, 0.4712385, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+13,180472, 571, 1, 1, 5732.004, 677.9211, 653.3353, 4.71239, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: -1)
(@OGUID+14,180472, 571, 1, 1, 5728.826, 680.5181, 653.5024, 2.809975, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: -1)
(@OGUID+15,180415, 571, 1, 1, 5741.146, 571.6998, 652.0657, 0.9773831, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+16,180415, 571, 1, 1, 5714.502, 642.7459, 648.6602, 4.468043, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+17,180407, 571, 1, 1, 5732.993, 687.059, 647.7728, 4.398232, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+18,180406, 571, 1, 1, 5743.645, 693.545, 622.6204, 6.161013, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+19,180406, 571, 1, 1, 5731.452, 685.2674, 647.8353, 4.34587, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+20,180472, 571, 1, 1, 5767.736, 709.554, 623.3895, 3.246347, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: -1)
(@OGUID+21,180415, 571, 1, 1, 5712.989, 641.5297, 648.6602, 4.363324, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+22,180415, 571, 1, 1, 5885.288, 649.3917, 648.3478, 4.223697, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+23,180415, 571, 1, 1, 5884.635, 650.209, 648.3451, 5.445428, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+24,180415, 571, 1, 1, 5857.195, 694.9765, 642.7598, 3.438303, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+25,180415, 571, 1, 1, 5884.362, 655.5961, 647.7375, 0.8377575, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+26,180415, 571, 1, 1, 5884.462, 651.8329, 648.3445, 3.455756, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+27,180415, 571, 1, 1, 5884.962, 652.7103, 648.349, 0.087266, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+28,180415, 571, 1, 1, 5882.854, 654.217, 647.4544, 0.8901166, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+29,180415, 571, 1, 1, 5882.08, 652.5934, 646.7969, 5.113817, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+30,180415, 571, 1, 1, 5881.939, 650.6448, 646.3702, 0.2268925, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+31,180415, 571, 1, 1, 5887.319, 654.8732, 647.7352, 0.157079, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+32,180415, 571, 1, 1, 5872.773, 683.941, 643.9858, 1.029743, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+33,180415, 571, 1, 1, 5888.374, 653.126, 648.3439, 5.148723, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+34,180415, 571, 1, 1, 5888.698, 649.7112, 648.3463, 3.979355, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+35,180415, 571, 1, 1, 5886.394, 656.2161, 647.7482, 3.839725, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+36,180415, 571, 1, 1, 5887.868, 649.1268, 648.3483, 4.293513, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+37,180415, 571, 1, 1, 5887.483, 653.6826, 648.3387, 4.76475, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+38,180415, 571, 1, 1, 5887.04, 648.8273, 648.3465, 3.700105, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+39,180406, 571, 1, 1, 5867.473, 689.6141, 643.0695, 5.93412, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: -1)
(@OGUID+40,180415, 571, 1, 1, 5885.699, 653.4232, 648.3426, 2.111848, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+41,180415, 571, 1, 1, 5853.894, 697.7454, 642.7382, 4.642576, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+42,180415, 571, 1, 1, 5886.554, 653.7294, 648.3412, 2.35619, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+43,180415, 571, 1, 1, 5886.262, 649.0009, 648.3515, 3.752462, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+44,180415, 571, 1, 1, 5868.731, 687.4305, 643.9653, 3.839725, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+45,180415, 571, 1, 1, 5859.763, 697.9153, 644.2113, 0.4363316, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+46,180415, 571, 1, 1, 5870.243, 688.5043, 644.9064, 4.921829, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+47,180415, 571, 1, 1, 5856.464, 700.5812, 644.1898, 1.099556, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+48,180415, 571, 1, 1, 5889.053, 652.2928, 648.3411, 3.595379, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+49,180415, 571, 1, 1, 5889.22, 650.639, 648.3416, 0.5410506, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+50,180415, 571, 1, 1, 5873.591, 685.6783, 644.8956, 1.221729, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+51,180415, 571, 1, 1, 5831.401, 719.1722, 641.9816, 2.932139, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+52,180415, 571, 1, 1, 5836.437, 717.9185, 642.9285, 5.602507, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+53,180415, 571, 1, 1, 5835.081, 716.1272, 642.0018, 1.919862, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+54,180415, 571, 1, 1, 5832.815, 720.7052, 642.9305, 3.926996, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+55,180472, 571, 1, 1, 5814.139, 724.2066, 628.9741, 1.117009, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: -1)
(@OGUID+56,180411, 571, 1, 1, 5852.397, 719.2882, 645.0352, 0.2967052, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: -1)
(@OGUID+57,180411, 571, 1, 1, 5776.054, 717.1719, 621.5515, 0.4886912, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: -1)
(@OGUID+58,180407, 571, 1, 1, 5774.249, 718.1202, 624.7645, 1.343901, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+59,180407, 571, 1, 1, 5776.448, 568.1436, 650.5096, 2.600535, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: -1)
(@OGUID+60,180415, 571, 1, 1, 5712.064, 650.5781, 648.6602, 5.567601, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+61,180415, 571, 1, 1, 5713.762, 649.6603, 648.6602, 3.647741, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+62,180415, 571, 1, 1, 5711.214, 640.9504, 648.6602, 1.256636, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: -1)
(@OGUID+63,180415, 571, 1, 1, 5743.377, 555.9014, 652.7935, 4.904376, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+64,180415, 571, 1, 1, 5748.702, 562.2153, 652.2548, 0.8552105, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+65,180415, 571, 1, 1, 5739.39, 569.5277, 652.2971, 4.939284, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+66,180415, 571, 1, 1, 5746.047, 559.1688, 652.5618, 0.122173, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+67,180415, 571, 1, 1, 5736.597, 566.2489, 652.5988, 1.692969, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+68,180415, 571, 1, 1, 5740.009, 551.746, 653.0452, 6.230826, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+69,180415, 571, 1, 1, 5733.646, 562.5793, 652.8564, 0.8377575, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+70,180415, 571, 1, 1, 5703.292, 611.9144, 646.913, 0.2617982, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+71,180415, 571, 1, 1, 5706.292, 643.5551, 648.6602, 5.235988, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+72,180415, 571, 1, 1, 5705.489, 608.3424, 646.913, 1.553341, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+73,180415, 571, 1, 1, 5707.491, 642.0325, 648.6602, 0.9599299, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+74,180415, 571, 1, 1, 5709.232, 641.1325, 648.6602, 6.265733, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+75,180415, 571, 1, 1, 5730.303, 558.2949, 653.1008, 6.073746, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+76,180415, 571, 1, 1, 5727.385, 554.3962, 653.2108, 4.450591, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+77,180415, 571, 1, 1, 5736.26, 546.9634, 653.2068, 4.956738, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+78,180415, 571, 1, 1, 5710.064, 650.7815, 648.6602, 0.2617982, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+79,180407, 571, 1, 1, 5819.17, 537.0236, 654.2689, 3.508117, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+80,180406, 571, 1, 1, 5825.69, 539.1132, 654.2733, 3.57793, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+81,180429, 571, 1, 1, 5890.736, 547.4893, 649.311, 3.159062, 0, 0, 0, 1, 120, 255, 1), -- 180429 (Area: 4613)
(@OGUID+82,180406, 571, 1, 1, 5881.452, 527.659, 641.7739, 3.42085, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+83,180472, 571, 1, 1, 5858.2, 635.0283, 654.1966, 0.8552105, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+84,180411, 571, 1, 1, 5843.23, 641.0156, 651.1626, 5.724681, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 4613)
(@OGUID+85,180472, 571, 1, 1, 5885.185, 523.5266, 649.183, 3.735006, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+86,180415, 571, 1, 1, 5883.065, 523.7357, 642.2219, 4.555311, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+87,180415, 571, 1, 1, 5884.091, 519.3121, 641.5697, 2.862335, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+88,180429, 571, 1, 1, 5900.888, 555.5231, 649.303, 3.944446, 0, 0, 0, 1, 120, 255, 1), -- 180429 (Area: 4613)
(@OGUID+89,180415, 571, 1, 1, 5886.866, 524.562, 642.2232, 3.298687, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+90,180472, 571, 1, 1, 5885.981, 520.1681, 649.2055, 0.6108634, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+91,180415, 571, 1, 1, 5881.253, 512.0975, 641.5697, 3.717554, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+92,180411, 571, 1, 1, 5851.213, 642.0174, 651.0532, 2.844883, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 4613)
(@OGUID+93,180415, 571, 1, 1, 5882.032, 509.4985, 641.5697, 5.777041, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+94,180415, 571, 1, 1, 5811.41, 654.3241, 647.392, 4.415683, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+95,180415, 571, 1, 1, 5860.809, 639.9338, 648.7387, 2.286379, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+96,180415, 571, 1, 1, 5857.7, 642.8248, 648.7574, 1.727875, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+97,180415, 571, 1, 1, 5821.589, 653.7233, 647.4023, 4.904376, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+98,180407, 571, 1, 1, 5874.733, 503.2205, 644.0117, 0.6806767, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+99,180472, 571, 1, 1, 5854.177, 643.7856, 621.9326, 0.9599299, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+100,180415, 571, 1, 1, 5887.842, 520.2131, 641.5697, 2.809975, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+101,180415, 571, 1, 1, 5882.763, 505.9572, 641.5697, 6.03884, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+102,180415, 571, 1, 1, 5806.485, 653.2708, 609.8859, 1.902409, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+103,180472, 571, 1, 1, 5911.032, 576.6434, 619.5021, 5.253442, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+104,180415, 571, 1, 1, 5908.835, 572.4176, 612.8084, 6.248279, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+105,180415, 571, 1, 1, 5909.355, 557.9609, 616.0233, 3.944446, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+106,180415, 571, 1, 1, 5914.888, 579.7658, 612.8085, 3.351047, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+107,180415, 571, 1, 1, 5917.828, 556.0546, 616.0338, 0.4886912, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+108,180407, 571, 1, 1, 5922.737, 572.6234, 612.5124, 4.869471, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+109,180415, 571, 1, 1, 5857.261, 647.3333, 648.7574, 2.33874, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+110,180406, 571, 1, 1, 5861.599, 649.9679, 658.3734, 5.183629, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+111,180407, 571, 1, 1, 5861.045, 644.9129, 658.374, 4.66003, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+112,180472, 571, 1, 1, 5853.057, 649.1964, 665.2919, 1.082103, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+113,180415, 571, 1, 1, 5928.843, 579.6561, 616.0331, 3.019413, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+114,180407, 571, 1, 1, 5934.309, 611.9305, 652.9676, 3.961899, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+115,180415, 571, 1, 1, 5856.715, 651.5797, 648.7574, 4.084071, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+116,180415, 571, 1, 1, 5893.633, 514.4703, 641.5697, 0.4188786, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+117,180411, 571, 1, 1, 5849.691, 655.1979, 651.0836, 2.984498, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 4613)
(@OGUID+118,180415, 571, 1, 1, 5934.673, 573.1963, 616.0229, 0.4188786, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+119,180411, 571, 1, 1, 5841.72, 654.2864, 651.1182, 1.308995, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 4613)
(@OGUID+120,180415, 571, 1, 1, 5856.279, 656.2487, 648.7574, 2.775069, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+121,180415, 571, 1, 1, 5928.253, 556.8299, 616.0229, 5.131269, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+122,180415, 571, 1, 1, 5933.573, 563.7382, 616.0335, 2.216565, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+123,180415, 571, 1, 1, 5893.986, 512.0244, 641.5697, 1.448622, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+124,180415, 571, 1, 1, 5894.723, 508.7653, 641.5697, 3.001947, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+125,180415, 571, 1, 1, 5858.74, 659.7316, 648.7386, 2.82743, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+126,180415, 571, 1, 1, 5935.716, 564.6371, 610.6148, 3.47321, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+127,180415, 571, 1, 1, 5930.358, 557.245, 610.5422, 5.044002, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+128,180472, 571, 1, 1, 5846.67, 654.1088, 618.3235, 0.1396245, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+129,180410, 571, 1, 1, 5850.755, 664.9973, 658.8376, 3.961899, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 4613)
(@OGUID+130,180415, 571, 1, 1, 5841.599, 664.91, 609.8859, 2.879789, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+131,180472, 571, 1, 1, 5855.111, 663.9308, 654.1978, 1.954769, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+132,180407, 571, 1, 1, 5948.633, 614.5261, 650.6004, 4.188792, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+133,180415, 571, 1, 1, 5836.036, 660.7959, 609.8859, 3.176533, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+134,180406, 571, 1, 1, 5939.868, 564.8651, 612.0865, 4.834563, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+135,180410, 571, 1, 1, 5844.364, 664.4332, 647.9496, 5.707228, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 4613)
(@OGUID+136,180411, 571, 1, 1, 5893.518, 492.6269, 644.5281, 3.543024, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 4616)
(@OGUID+137,180407, 571, 1, 1, 5875.965, 497.4745, 657.2557, 5.288348, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4616)
(@OGUID+138,180407, 571, 1, 1, 5863.621, 487.1664, 641.5697, 1.919862, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4616)
(@OGUID+139,180406, 571, 1, 1, 5864.623, 480.571, 641.5697, 2.111848, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4616)
(@OGUID+140,180406, 571, 1, 1, 5877.73, 489.3853, 657.3113, 5.218536, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4616)
(@OGUID+141,180415, 571, 1, 1, 5892.837, 490.0521, 641.2783, 4.537859, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+142,180415, 571, 1, 1, 5891.826, 490.1104, 641.5697, 6.003934, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+143,180415, 571, 1, 1, 5895.737, 492.6667, 640.7758, 0.8901166, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+144,180472, 571, 1, 1, 5864.557, 470.3632, 647.7255, 3.281239, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4616)
(@OGUID+145,180415, 571, 1, 1, 5893.601, 489.979, 641.0445, 6.230826, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+146,180415, 571, 1, 1, 5902.456, 493.8513, 640.7816, 4.031712, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+147,180415, 571, 1, 1, 5895.705, 475.3102, 641.3199, 4.71239, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+148,180415, 571, 1, 1, 5894.93, 474.8922, 641.5697, 0.122173, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+149,180407, 571, 1, 1, 5883.147, 462.4044, 657.2766, 5.358162, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4616)
(@OGUID+150,180415, 571, 1, 1, 5896.422, 475.6479, 641.0445, 4.310966, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+151,180411, 571, 1, 1, 5899.214, 464.7854, 644.7711, 5.515242, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 4616)
(@OGUID+152,180415, 571, 1, 1, 5906.314, 475.4718, 640.7803, 4.81711, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+153,180411, 571, 1, 1, 5880.079, 459.3812, 662.5659, 1.431168, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 4616)
(@OGUID+154,180415, 571, 1, 1, 5899.555, 474.0015, 640.776, 4.206246, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+155,180415, 571, 1, 1, 5825.489, 463.355, 658.7728, 5.969027, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+156,180415, 571, 1, 1, 5820.489, 466.2061, 658.7727, 2.18166, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+157,180415, 571, 1, 1, 5814.865, 467.4187, 658.7726, 0.2617982, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+158,180406, 571, 1, 1, 5877.546, 452.3022, 657.9406, 4.206246, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4616)
(@OGUID+159,180415, 571, 1, 1, 5831.669, 453.8633, 658.7728, 2.35619, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+160,180415, 571, 1, 1, 5829.311, 459.1713, 658.7728, 1.553341, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+161,180410, 571, 1, 1, 5873.148, 451.0983, 642.2259, 1.658062, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 4616)
(@OGUID+162,180410, 571, 1, 1, 5907.471, 449.2349, 642.2161, 1.902409, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 4616)
(@OGUID+163,180415, 571, 1, 1, 5809.19, 466.7998, 658.7725, 0.5934101, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+164,180415, 571, 1, 1, 5831.065, 442.6467, 658.7728, 1.448622, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+165,180415, 571, 1, 1, 5803.969, 464.4766, 658.7724, 2.862335, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+166,180415, 571, 1, 1, 5832.148, 448.1182, 658.7727, 1.256636, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+167,180415, 571, 1, 1, 5828.126, 437.6552, 658.7726, 3.246347, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+168,180406, 571, 1, 1, 5814.591, 573.3528, 649.9803, 0.7155849, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 0)
(@OGUID+169,180406, 571, 1, 1, 5965.314, 596.2342, 650.6269, 3.071766, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4616)
(@OGUID+170,180406, 571, 1, 1, 5943.678, 636.6887, 652.9681, 5.148723, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4616)
(@OGUID+171,180410, 571, 1, 1, 5851.691, 630.7206, 658.9904, 2.600535, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 4616)
(@OGUID+172,180415, 571, 1, 1, 5849.42, 630.6858, 648.6568, 3.857183, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+173,180415, 571, 1, 1, 5850.446, 631.7395, 647.5121, 1.431168, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+174,180472, 571, 1, 1, 5845.358, 629.1765, 623.5621, 4.729844, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4616)
(@OGUID+175,180407, 571, 1, 1, 5979.741, 625.2219, 650.6269, 0.03490625, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4616)
(@OGUID+176,180410, 571, 1, 1, 5842.257, 636.217, 647.894, 0.9773831, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 4616)
(@OGUID+177,180415, 571, 1, 1, 5846.326, 633.0816, 648.738, 4.520406, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+178,180415, 571, 1, 1, 5847.134, 634.3536, 647.5121, 4.939284, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4616)
(@OGUID+179,180407, 571, 1, 1, 5818.687, 619.2923, 613.1467, 4.363324, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4616)
(@OGUID+180,180415, 571, 1, 1, 5820.354, 632.9934, 647.3919, 3.089183, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+181,180415, 571, 1, 1, 5814.812, 625.3407, 647.392, 3.68265, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+182,180406, 571, 1, 1, 5808.426, 620.7781, 649.5657, 3.857183, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+183,180415, 571, 1, 1, 5809.522, 628.6146, 647.392, 0.3665176, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+184,180472, 571, 1, 1, 5835.432, 637.2127, 619.9534, 2.530723, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+185,180415, 571, 1, 1, 5816.108, 637.7375, 647.392, 0.087266, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+186,180415, 571, 1, 1, 5814.764, 643.3781, 647.3929, 4.24115, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+187,180415, 571, 1, 1, 5806.706, 634.3302, 648.2245, 4.694937, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+188,180415, 571, 1, 1, 5803.731, 634.0671, 648.2162, 1.099556, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+189,180415, 571, 1, 1, 5803.088, 629.0997, 647.3966, 3.071766, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+190,180415, 571, 1, 1, 5817.476, 648.9861, 647.392, 5.969027, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+191,180415, 571, 1, 1, 5798.526, 625.1855, 647.392, 0.3490652, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+192,180415, 571, 1, 1, 5809.953, 641.7255, 648.2184, 0.157079, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+193,180407, 571, 1, 1, 5800.643, 620.0817, 649.5657, 3.281239, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+194,180415, 571, 1, 1, 5810.266, 638.7852, 648.2237, 2.007128, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+195,180415, 571, 1, 1, 5814.763, 631.7408, 609.8859, 6.161013, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+196,180415, 571, 1, 1, 5824.873, 659.8167, 647.4612, 5.480334, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+197,180415, 571, 1, 1, 5795.606, 621.2239, 647.3924, 3.909541, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+198,180415, 571, 1, 1, 5805.514, 645.3051, 648.2424, 3.996807, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+199,180415, 571, 1, 1, 5815.022, 659.305, 647.4066, 1.815142, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+200,180415, 571, 1, 1, 5817.596, 637.9969, 609.8859, 0.6806767, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+201,180415, 571, 1, 1, 5806.178, 650.1483, 647.3949, 4.572764, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+202,180415, 571, 1, 1, 5799.287, 637.6236, 648.2151, 3.595379, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+203,180415, 571, 1, 1, 5799.006, 640.5789, 648.2176, 5.916668, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+204,180415, 571, 1, 1, 5809.311, 627.6649, 609.8859, 1.256636, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+205,180415, 571, 1, 1, 5802.596, 644.9901, 648.22, 5.689774, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+206,180406, 571, 1, 1, 5799.613, 575.9578, 633.1762, 1.448622, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+207,180415, 571, 1, 1, 5791.946, 630.3287, 647.392, 3.525572, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+208,180415, 571, 1, 1, 5794.709, 635.8553, 647.3961, 3.490667, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+209,180415, 571, 1, 1, 5816.86, 644.9385, 609.8859, 5.619962, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+210,180415, 571, 1, 1, 5793.807, 640.3995, 647.3958, 5.340709, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+211,180415, 571, 1, 1, 5801.429, 649.8392, 647.4017, 5.846854, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+212,180415, 571, 1, 1, 5789.164, 626.7645, 647.3924, 1.902409, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+213,180415, 571, 1, 1, 5819.923, 663.9031, 647.4847, 3.857183, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+214,180415, 571, 1, 1, 5802.309, 626.9839, 609.8859, 3.47321, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+215,180415, 571, 1, 1, 5790.742, 604.8807, 609.8859, 0.3141584, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+216,180415, 571, 1, 1, 5812.88, 650.5403, 609.8859, 2.321287, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+217,180415, 571, 1, 1, 5796.077, 629.7592, 609.8859, 4.66003, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+218,180415, 571, 1, 1, 5787.88, 598.5773, 609.8859, 1.727875, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+219,180415, 571, 1, 1, 5788.278, 648.998, 647.2794, 5.270896, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+220,180415, 571, 1, 1, 5792.746, 654.9274, 647.4214, 5.637414, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+221,180415, 571, 1, 1, 5829.179, 660.076, 609.8859, 1.919862, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+222,180415, 571, 1, 1, 5822.864, 662.8907, 609.8859, 2.82743, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+223,180415, 571, 1, 1, 5790.068, 611.6815, 609.8859, 2.897245, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+224,180415, 571, 1, 1, 5844.557, 671.1918, 609.8859, 2.251473, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+225,180415, 571, 1, 1, 5782.394, 594.4963, 609.8859, 1.97222, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+226,180415, 571, 1, 1, 5799.559, 652.5767, 609.8859, 1.675514, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+227,180415, 571, 1, 1, 5785.96, 617.3203, 609.8859, 2.740162, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+228,180415, 571, 1, 1, 5818.826, 668.4368, 609.8859, 3.351047, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+229,180415, 571, 1, 1, 5791.192, 642.2432, 609.8859, 2.129301, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+230,180415, 571, 1, 1, 5791.933, 635.3745, 609.8859, 3.665196, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+231,180415, 571, 1, 1, 5818.045, 675.3859, 609.8859, 5.567601, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+232,180415, 571, 1, 1, 5794.031, 648.5314, 609.8859, 1.815142, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+233,180415, 571, 1, 1, 5843.832, 678.011, 609.8859, 1.413715, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+234,180415, 571, 1, 1, 5839.708, 683.6341, 609.8859, 3.38594, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+235,180415, 571, 1, 1, 5772.786, 619.4384, 609.8859, 4.799657, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+236,180415, 571, 1, 1, 5779.674, 620.1669, 609.8859, 5.462882, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+237,180415, 571, 1, 1, 5775.475, 593.8323, 609.8859, 2.286379, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+238,180415, 571, 1, 1, 5820.88, 681.6428, 609.8859, 0.802851, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+239,180415, 571, 1, 1, 5833.342, 686.4538, 609.8859, 4.939284, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+240,180406, 571, 1, 1, 5770.311, 581.2781, 619.9363, 2.82743, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+241,180415, 571, 1, 1, 5769.2, 596.6345, 609.8859, 1.640607, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+242,180407, 571, 1, 1, 5753.431, 594.8392, 619.9331, 3.106652, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+243,180415, 571, 1, 1, 5767.191, 615.3619, 609.8859, 0.4537851, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+244,180415, 571, 1, 1, 5765.103, 602.2392, 609.8859, 0.5235979, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+245,180415, 571, 1, 1, 5764.401, 609.0145, 609.8859, 2.286379, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+246,180415, 571, 1, 1, 5799.662, 460.6987, 658.7724, 1.884953, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4598)
(@OGUID+247,180415, 571, 1, 1, 5796.819, 455.7213, 658.7723, 4.398232, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4598)
(@OGUID+248,180415, 571, 1, 1, 5796.333, 444.3685, 658.772, 3.612838, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4598)
(@OGUID+249,180415, 571, 1, 1, 5795.719, 450.095, 658.7721, 3.857183, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4598)
(@OGUID+250,180415, 571, 1, 1, 5798.614, 439.1821, 658.7722, 5.462882, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4598)
(@OGUID+251,180415, 571, 1, 1, 5818.679, 431.5019, 658.7725, 3.560473, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4598)
(@OGUID+252,180415, 571, 1, 1, 5823.953, 433.8398, 658.7726, 4.921829, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4598)
(@OGUID+253,180415, 571, 1, 1, 5802.473, 434.9366, 658.7722, 2.879789, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4564)
(@OGUID+254,180415, 571, 1, 1, 5807.424, 432.0813, 658.7723, 4.06662, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4564)
(@OGUID+255,180415, 571, 1, 1, 5812.94, 430.9195, 658.7723, 4.485497, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4564)
(@OGUID+256,180415, 571, 1, 1, 5754.749, 614.3086, 650.5781, 0.9948372, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+257,180415, 571, 1, 1, 5752.304, 612.6968, 650.5865, 3.717554, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+258,180415, 571, 1, 1, 5749.63, 613.0443, 650.5931, 6.248279, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+259,180415, 571, 1, 1, 5747.075, 615.2822, 650.555, 0.4014249, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+260,180415, 571, 1, 1, 5744.621, 617.712, 649.0058, 3.874631, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+261,180472, 571, 1, 1, 5762.698, 626.3858, 622.6323, 0.2967052, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+262,180472, 571, 1, 1, 5751.257, 635.6403, 625.4073, 5.201083, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+263,180472, 571, 1, 1, 5772.164, 641.6515, 625.404, 5.637414, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+264,180472, 571, 1, 1, 5780.46, 648.5278, 623.1652, 5.689774, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+265,180415, 571, 1, 1, 5699.396, 613.3456, 646.913, 4.188792, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4567)
(@OGUID+266,180406, 571, 1, 1, 5715.341, 537.7757, 654.431, 2.722713, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4567)
(@OGUID+267,180415, 571, 1, 1, 5694.938, 612.3784, 646.913, 3.560473, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4567)
(@OGUID+268,180415, 571, 1, 1, 5741.505, 643.7399, 648.7906, 3.351047, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4567)
(@OGUID+269,180415, 571, 1, 1, 5739.154, 636.8212, 648.0576, 6.108654, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4567)
(@OGUID+270,180407, 571, 1, 1, 5684.432, 627.8524, 647.1506, 2.565632, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4567)
(@OGUID+271,180415, 571, 1, 1, 5705.729, 645.3735, 648.6602, 5.253442, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4567)
(@OGUID+272,180415, 571, 1, 1, 5705.89, 647.2834, 648.6602, 3.57793, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4567)
(@OGUID+273,180415, 571, 1, 1, 5706.852, 649.0601, 648.6602, 1.326448, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4567)
(@OGUID+274,180415, 571, 1, 1, 5708.286, 650.1924, 648.6602, 5.916668, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4567)
(@OGUID+275,180415, 571, 1, 1, 5744.292, 647.872, 650.5656, 1.134463, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4567)
(@OGUID+276,180472, 571, 1, 1, 5759.925, 650.0181, 625.4079, 5.98648, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4567)
(@OGUID+277,180415, 571, 1, 1, 5747.346, 650.718, 650.5872, 4.136433, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4567)
(@OGUID+278,180415, 571, 1, 1, 5751.074, 649.3328, 650.5782, 0.9424766, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4567)
(@OGUID+279,180472, 571, 1, 1, 5772.861, 661.1832, 625.4011, 2.495818, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4567)
(@OGUID+280,180411, 571, 1, 1, 5725.395, 683.3143, 650.6137, 2.495818, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 4613)
(@OGUID+281,180407, 571, 1, 1, 5718.163, 673.8229, 647.5087, 2.82743, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+282,180407, 571, 1, 1, 5778.422, 682.1052, 643.6171, 4.380776, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+283,180406, 571, 1, 1, 5702.005, 692.7043, 655.5365, 1.047198, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+284,180415, 571, 1, 1, 5783.094, 693.3018, 647.382, 5.305802, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+285,180415, 571, 1, 1, 5784.806, 690.4636, 647.4271, 0.9424766, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+286,180407, 571, 1, 1, 5663.047, 663.5198, 654.332, 1.97222, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+287,180472, 571, 1, 1, 5697.199, 694.4003, 650.3392, 3.246347, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+288,180411, 571, 1, 1, 5705.412, 698.7116, 659.8047, 1.797689, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 4613)
(@OGUID+289,180406, 571, 1, 1, 5796.241, 685.36, 622.4468, 3.612838, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+290,180415, 571, 1, 1, 5782.856, 691.076, 619.1068, 1.343901, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+291,180407, 571, 1, 1, 5776.292, 694.8016, 620.0498, 1.815142, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+292,180406, 571, 1, 1, 5710.861, 703.6387, 655.5365, 5.323256, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+293,180415, 571, 1, 1, 5773.052, 697.6647, 618.808, 0.2094394, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+294,180415, 571, 1, 1, 5770.577, 700.3301, 618.9056, 0.3490652, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+295,180415, 571, 1, 1, 5777.162, 695.6837, 618.886, 6.213374, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+296,180411, 571, 1, 1, 5762.035, 699.783, 621.4487, 4.590216, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 4613)
(@OGUID+297,180472, 571, 1, 1, 5695.049, 700.8595, 658.7589, 0.6283169, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4568)
(@OGUID+298,180472, 571, 1, 1, 5692.463, 698.1651, 646.9638, 5.532695, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4568)
(@OGUID+299,180406, 571, 1, 1, 5656.161, 674.6107, 651.9675, 2.984498, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4568)
(@OGUID+300,180406, 571, 1, 1, 5673.89, 687.817, 654.3331, 0.8726639, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4568)
(@OGUID+301,180407, 571, 1, 1, 5680.124, 714.1534, 653.8931, 1.466076, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4568)
(@OGUID+302,180407, 571, 1, 1, 5643.794, 704.9396, 651.9927, 6.108654, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4568)
(@OGUID+303,180472, 571, 1, 1, 5711.498, 710.7621, 658.8002, 2.18166, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4568)
(@OGUID+304,180472, 571, 1, 1, 5682.352, 717.6917, 660.2382, 1.448622, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4568)
(@OGUID+305,180472, 571, 1, 1, 5713.616, 713.4178, 659.8443, 4.34587, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4568)
(@OGUID+306,180472, 571, 1, 1, 5707.959, 708.0295, 650.3406, 6.178466, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4568)
(@OGUID+307,180472, 571, 1, 1, 5680.694, 719.1438, 648.2689, 5.305802, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4568)
(@OGUID+308,180472, 571, 1, 1, 5701.399, 708.7687, 658.7588, 4.81711, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4568)
(@OGUID+309,180407, 571, 1, 1, 5672.957, 714.2048, 642.0627, 4.293513, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4568)
(@OGUID+310,180406, 571, 1, 1, 5677.349, 729.4107, 653.3925, 6.126106, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4568)
(@OGUID+311,180407, 571, 1, 1, 5654.972, 745.8715, 643.2557, 5.969027, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4568)
(@OGUID+312,180407, 571, 1, 1, 5629.459, 729.5208, 643.1681, 2.076939, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4568)
(@OGUID+313,180406, 571, 1, 1, 5647.172, 752.6823, 643.2747, 5.916668, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4568)
(@OGUID+314,180411, 571, 1, 1, 5740.034, 730.2188, 646.2493, 1.099556, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 4568)
(@OGUID+315,180415, 571, 1, 1, 5757.258, 714.6268, 621.7719, 3.735006, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4568)
(@OGUID+316,180410, 571, 1, 1, 5754.624, 713.8906, 618.7103, 5.602507, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 4568)
(@OGUID+317,180411, 571, 1, 1, 5759.559, 714.3611, 646.4409, 3.019413, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 4568)
(@OGUID+318,180415, 571, 1, 1, 5760.468, 718.4333, 621.6825, 3.525572, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4568)
(@OGUID+319,180410, 571, 1, 1, 5760.893, 721.6644, 618.6522, 5.654869, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 4568)
(@OGUID+320,180415, 571, 1, 1, 5783.688, 696.0384, 647.3867, 3.298687, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+321,180415, 571, 1, 1, 5785.933, 698.4983, 647.3533, 2.251473, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+322,180415, 571, 1, 1, 5788.838, 701.0469, 645.5853, 5.585054, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+323,180415, 571, 1, 1, 5787.46, 697.2659, 619.1364, 2.513274, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+324,180415, 571, 1, 1, 5782.752, 703.0441, 618.8907, 4.625124, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+325,180415, 571, 1, 1, 5790.956, 702.4618, 645.574, 3.839725, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+326,180415, 571, 1, 1, 5793.381, 703.7379, 645.5629, 2.007128, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+327,180415, 571, 1, 1, 5780.374, 706.554, 618.8164, 4.590216, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+328,180415, 571, 1, 1, 5777.6, 709.0973, 618.8805, 0.6981314, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+329,180415, 571, 1, 1, 5798.407, 704.9445, 643.7188, 0.087266, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+330,180415, 571, 1, 1, 5798.076, 707.0781, 643.2503, 4.729844, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+331,180407, 571, 1, 1, 5796.173, 707.6254, 641.702, 3.490667, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+332,180415, 571, 1, 1, 5797.557, 709.8958, 642.1785, 2.059488, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+333,180406, 571, 1, 1, 5805.458, 708.4065, 641.4847, 3.68265, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+334,180415, 571, 1, 1, 5803.493, 707.8524, 643.1374, 0.6283169, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+335,180415, 571, 1, 1, 5808.656, 705.1858, 645.5119, 4.136433, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+336,180406, 571, 1, 1, 5810.498, 684.2795, 613.1106, 1.343901, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+337,180415, 571, 1, 1, 5815.443, 686.139, 620.7764, 3.57793, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+338,180429, 571, 1, 1, 5820.363, 685.0911, 651.8358, 4.031712, 0, 0, 0, 1, 120, 255, 1), -- 180429 (Area: 4613)
(@OGUID+339,180415, 571, 1, 1, 5814.018, 684.253, 620.7783, 2.042035, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+340,180415, 571, 1, 1, 5803.706, 705.5712, 643.6826, 2.530723, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+341,180415, 571, 1, 1, 5819.794, 694.0382, 647.324, 5.270896, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+342,180415, 571, 1, 1, 5818.243, 689.6962, 620.7728, 1.204277, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+343,180415, 571, 1, 1, 5813.675, 703.7327, 645.5302, 5.829401, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+344,180415, 571, 1, 1, 5811.034, 704.5538, 645.5168, 3.769912, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+345,180415, 571, 1, 1, 5816.901, 687.9096, 620.7746, 5.044002, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+346,180415, 571, 1, 1, 5803.448, 710.5295, 642.1144, 1.466076, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+347,180415, 571, 1, 1, 5821.086, 697.1408, 647.4297, 1.588249, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+348,180415, 571, 1, 1, 5817.18, 701.6979, 647.2963, 3.979355, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+349,180428, 571, 1, 1, 5770.154, 735.5269, 641.4877, 2.583081, 0, 0, 0, 1, 120, 255, 1), -- 180428 (Area: 4613)
(@OGUID+350,180415, 571, 1, 1, 5819.856, 699.8424, 647.4349, 2.059488, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+351,180415, 571, 1, 1, 5826.483, 685.6487, 609.8859, 0.6283169, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4613)
(@OGUID+352,180406, 571, 1, 1, 5759.826, 735.288, 619.8346, 1.186823, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+353,180408, 571, 1, 1, 5771.545, 737.5035, 643.0945, 1.274088, 0, 0, 0, 1, 120, 255, 1), -- 180408 (Area: 4613)
(@OGUID+354,180472, 571, 1, 1, 5778.527, 742.8954, 628.8207, 3.316144, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 4613)
(@OGUID+355,180406, 571, 1, 1, 5715.729, 758.2275, 641.7689, 0.9948372, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+356,180407, 571, 1, 1, 5849.386, 695.0423, 618.1664, 5.951575, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+357,180407, 571, 1, 1, 5824.359, 760.3876, 640.3284, 6.126106, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4613)
(@OGUID+358,180406, 571, 1, 1, 5817.995, 795.4424, 636.5713, 6.161013, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4613)
(@OGUID+359,180411, 571, 1, 1, 5866.639, 738.9694, 644.7529, 0.5934101, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 4619)
(@OGUID+360,180415, 571, 1, 1, 5863.78, 735.2543, 640.5769, 5.602507, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4619)
(@OGUID+361,180415, 571, 1, 1, 5863.101, 737.2114, 641.4838, 2.146753, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4619)
(@OGUID+362,180415, 571, 1, 1, 5867.234, 738.8976, 641.493, 4.433136, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4619)
(@OGUID+363,180415, 571, 1, 1, 5868.181, 737.1629, 640.6047, 5.235988, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4619)
(@OGUID+364,180411, 571, 1, 1, 5866.184, 738.7732, 642.8267, 3.403396, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 4619)
(@OGUID+365,180406, 571, 1, 1, 5868.594, 725.371, 639.2031, 4.136433, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 4619)
(@OGUID+366,180407, 571, 1, 1, 5876.713, 739.0898, 639.2625, 0.4712385, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 4619)
(@OGUID+367,180415, 571, 1, 1, 5881.346, 740.5377, 641.2245, 0.5585039, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4619)
(@OGUID+368,180415, 571, 1, 1, 5881.581, 738.4108, 640.2767, 5.567601, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4619)
(@OGUID+369,180415, 571, 1, 1, 5885.815, 741.3719, 641.2227, 0.8377575, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+370,180415, 571, 1, 1, 5886.161, 739.3089, 640.2971, 6.03884, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+371,180415, 571, 1, 1, 5894.53, 711.022, 642.7033, 2.18166, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+372,180415, 571, 1, 1, 5899.31, 745.5648, 641.9313, 2.879789, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+373,180415, 571, 1, 1, 5898.649, 743.8654, 640.9814, 0.5934101, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+374,180415, 571, 1, 1, 5892.321, 708.2484, 643.9171, 4.398232, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+375,180415, 571, 1, 1, 5913.069, 726.2639, 642.1484, 4.32842, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+376,180415, 571, 1, 1, 5903.729, 744.6061, 642.0323, 6.108654, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+377,180411, 571, 1, 1, 5906.245, 742.7525, 644.4848, 0.8901166, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 0)
(@OGUID+378,180415, 571, 1, 1, 5903.366, 742.7047, 641.1063, 5.637414, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+379,180415, 571, 1, 1, 5915.093, 726.1569, 643.0661, 5.218536, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+380,180415, 571, 1, 1, 5915.276, 730.6907, 643.0677, 4.32842, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+381,180415, 571, 1, 1, 5913.209, 731.0977, 642.1209, 3.001947, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+382,180415, 571, 1, 1, 5914.37, 712.4825, 643.2484, 3.839725, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+383,180415, 571, 1, 1, 5897.809, 708.4827, 642.675, 4.171338, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+384,180415, 571, 1, 1, 5912.41, 712.7233, 642.2968, 0.6981314, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+385,180415, 571, 1, 1, 5912.094, 708.0308, 642.4371, 5.846854, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+386,180415, 571, 1, 1, 5914.194, 707.9479, 643.3494, 4.76475, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+387,180415, 571, 1, 1, 5895.294, 705.7078, 643.9164, 0.8203033, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+388,180407, 571, 1, 1, 5899.475, 704.617, 641.8773, 2.740162, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+389,180411, 571, 1, 1, 5895.397, 691.5417, 647.283, 1.134463, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 0)
(@OGUID+390,180415, 571, 1, 1, 5897.531, 684.7337, 643.5082, 0.7504908, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4560)
(@OGUID+391,180415, 571, 1, 1, 5900.777, 688.1335, 643.5274, 4.258607, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4560)
(@OGUID+392,180415, 571, 1, 1, 5899.163, 683.2125, 644.4352, 2.809975, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4560)
(@OGUID+393,180415, 571, 1, 1, 5902.085, 686.6057, 644.4786, 5.602507, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 4560)
(@OGUID+394,180429, 571, 1, 1, 5951.905, 675.3125, 656.6282, 5.899214, 0, 0, 0, 1, 120, 255, 1), -- 180429 (Area: 4570)
(@OGUID+395, 180405, 571, 1, 1, 5760.702, 701.1509, 624.7817, 0.6457717, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: -1)
(@OGUID+396, 180405, 571, 1, 1, 5775.396, 533.9785, 643.1385, 2.042035, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+397, 180405, 571, 1, 1, 5847.228, 553.8382, 655.0237, 3.071766, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+398, 180405, 571, 1, 1, 5722.783, 531.7375, 654.4309, 3.141593, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+399, 180405, 571, 1, 1, 5822.742, 502.0839, 657.3818, 0.4712385, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+400, 180405, 571, 1, 1, 5869.858, 617.1184, 619.7509, 4.694937, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+401, 180405, 571, 1, 1, 5854.306, 634.2508, 647.5121, 4.380776, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+402, 180405, 571, 1, 1, 5886.771, 528.7459, 641.8399, 3.787367, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+403, 180405, 571, 1, 1, 5863.885, 640.6849, 647.049, 1.448622, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+404, 180405, 571, 1, 1, 5917.715, 566.2281, 612.521, 3.595379, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+405, 180405, 571, 1, 1, 5860.379, 654.9897, 658.3739, 5.532695, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+406, 180405, 571, 1, 1, 5899.553, 509.2794, 643.4328, 0.4014249, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+407, 180405, 571, 1, 1, 5865.935, 488.1068, 657.8251, 2.775069, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4616)
(@OGUID+408, 180405, 571, 1, 1, 5899.716, 457.0769, 643.6509, 3.368496, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4616)
(@OGUID+409, 180405, 571, 1, 1, 5804.67, 572.4031, 650.2531, 6.248279, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4616)
(@OGUID+410, 180405, 571, 1, 1, 5952.642, 625.262, 650.6025, 5.270896, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4616)
(@OGUID+411, 180405, 571, 1, 1, 5779.202, 595.5325, 651.0052, 5.532695, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+412, 180405, 571, 1, 1, 5904.518, 662.9713, 643.8431, 6.056293, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+413, 180405, 571, 1, 1, 5764.936, 593.0349, 615.7024, 2.879789, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+414, 180405, 571, 1, 1, 5742.553, 629.7415, 648.2349, 5.096362, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+415, 180405, 571, 1, 1, 5795.288, 666.0266, 613.8831, 0.3665176, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4567)
(@OGUID+416, 180405, 571, 1, 1, 5772.321, 675.5978, 643.5193, 5.532695, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+417, 180405, 571, 1, 1, 5715.069, 682.2311, 647.5992, 1.762782, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+418, 180405, 571, 1, 1, 5723.762, 693.092, 647.5992, 0.7853968, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+419, 180405, 571, 1, 1, 5627.806, 677.0311, 651.9927, 2.984498, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4568)
(@OGUID+420, 180405, 571, 1, 1, 5661.1, 685.0604, 651.9661, 0.122173, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4568)
(@OGUID+421, 180405, 571, 1, 1, 5668.602, 719.249, 653.3779, 2.373644, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4568)
(@OGUID+422, 180405, 571, 1, 1, 5688.877, 724.2303, 645.729, 0.2094394, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4568)
(@OGUID+423, 180405, 571, 1, 1, 5629.213, 732.0972, 643.1825, 1.989672, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4568)
(@OGUID+424, 180405, 571, 1, 1, 5706.784, 747.1557, 641.7341, 1.553341, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4568)
(@OGUID+425, 180405, 571, 1, 1, 5783.512, 703.9484, 620.0486, 0.3665176, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+426, 180405, 571, 1, 1, 5821.932, 693.4803, 643.1427, 2.687807, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+427, 180405, 571, 1, 1, 5771.341, 737.5543, 641.4539, 1.623156, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+428, 180405, 571, 1, 1, 5790.703, 741.6038, 623.3499, 0.2094394, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4613)
(@OGUID+429, 180405, 571, 1, 1, 5862, 734.8575, 639.8586, 0.7679439, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 4619)
(@OGUID+430, 180405, 571, 1, 1, 5912.15, 721.3925, 641.4152, 4.97419, 0, 0, 0, 1, 120, 255, 1); -- 180405 (Area: 0)

SET @OGUID:=77266;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(12, @OGUID+0),
(12, @OGUID+1),
(12, @OGUID+2),
(12, @OGUID+3),
(12, @OGUID+4),
(12, @OGUID+5),
(12, @OGUID+6),
(12, @OGUID+7),
(12, @OGUID+8),
(12, @OGUID+9),
(12, @OGUID+10),
(12, @OGUID+11),
(12, @OGUID+12),
(12, @OGUID+13),
(12, @OGUID+14),
(12, @OGUID+15),
(12, @OGUID+16),
(12, @OGUID+17),
(12, @OGUID+18),
(12, @OGUID+19),
(12, @OGUID+20),
(12, @OGUID+21),
(12, @OGUID+22),
(12, @OGUID+23),
(12, @OGUID+24),
(12, @OGUID+25),
(12, @OGUID+26),
(12, @OGUID+27),
(12, @OGUID+28),
(12, @OGUID+29),
(12, @OGUID+30),
(12, @OGUID+31),
(12, @OGUID+32),
(12, @OGUID+33),
(12, @OGUID+34),
(12, @OGUID+35),
(12, @OGUID+36),
(12, @OGUID+37),
(12, @OGUID+38),
(12, @OGUID+39),
(12, @OGUID+40),
(12, @OGUID+51),
(12, @OGUID+52),
(12, @OGUID+53),
(12, @OGUID+54),
(12, @OGUID+55),
(12, @OGUID+56),
(12, @OGUID+57),
(12, @OGUID+58),
(12, @OGUID+59),
(12, @OGUID+60),
(12, @OGUID+61),
(12, @OGUID+62),
(12, @OGUID+63),
(12, @OGUID+64),
(12, @OGUID+65),
(12, @OGUID+66),
(12, @OGUID+67),
(12, @OGUID+68),
(12, @OGUID+69),
(12, @OGUID+70),
(12, @OGUID+71),
(12, @OGUID+72),
(12, @OGUID+73),
(12, @OGUID+74),
(12, @OGUID+75),
(12, @OGUID+76),
(12, @OGUID+77),
(12, @OGUID+78),
(12, @OGUID+79),
(12, @OGUID+80),
(12, @OGUID+81),
(12, @OGUID+82),
(12, @OGUID+83),
(12, @OGUID+84),
(12, @OGUID+85),
(12, @OGUID+86),
(12, @OGUID+87),
(12, @OGUID+88),
(12, @OGUID+89),
(12, @OGUID+90),
(12, @OGUID+91),
(12, @OGUID+92),
(12, @OGUID+93),
(12, @OGUID+94),
(12, @OGUID+95),
(12, @OGUID+96),
(12, @OGUID+97),
(12, @OGUID+98),
(12, @OGUID+99),
(12, @OGUID+100),
(12, @OGUID+101),
(12, @OGUID+102),
(12, @OGUID+103),
(12, @OGUID+104),
(12, @OGUID+105),
(12, @OGUID+106),
(12, @OGUID+107),
(12, @OGUID+108),
(12, @OGUID+109),
(12, @OGUID+110),
(12, @OGUID+111),
(12, @OGUID+112),
(12, @OGUID+113),
(12, @OGUID+114),
(12, @OGUID+115),
(12, @OGUID+116),
(12, @OGUID+117),
(12, @OGUID+118),
(12, @OGUID+119),
(12, @OGUID+120),
(12, @OGUID+121),
(12, @OGUID+122),
(12, @OGUID+123),
(12, @OGUID+124),
(12, @OGUID+125),
(12, @OGUID+126),
(12, @OGUID+127),
(12, @OGUID+128),
(12, @OGUID+129),
(12, @OGUID+130),
(12, @OGUID+131),
(12, @OGUID+132),
(12, @OGUID+133),
(12, @OGUID+134),
(12, @OGUID+135),
(12, @OGUID+136),
(12, @OGUID+137),
(12, @OGUID+138),
(12, @OGUID+139),
(12, @OGUID+140),
(12, @OGUID+141),
(12, @OGUID+142),
(12, @OGUID+143),
(12, @OGUID+144),
(12, @OGUID+145),
(12, @OGUID+146),
(12, @OGUID+147),
(12, @OGUID+148),
(12, @OGUID+149),
(12, @OGUID+150),
(12, @OGUID+151),
(12, @OGUID+152),
(12, @OGUID+153),
(12, @OGUID+154),
(12, @OGUID+155),
(12, @OGUID+156),
(12, @OGUID+157),
(12, @OGUID+158),
(12, @OGUID+159),
(12, @OGUID+160),
(12, @OGUID+161),
(12, @OGUID+162),
(12, @OGUID+163),
(12, @OGUID+164),
(12, @OGUID+165),
(12, @OGUID+166),
(12, @OGUID+167),
(12, @OGUID+168),
(12, @OGUID+169),
(12, @OGUID+170),
(12, @OGUID+171),
(12, @OGUID+172),
(12, @OGUID+173),
(12, @OGUID+174),
(12, @OGUID+175),
(12, @OGUID+176),
(12, @OGUID+177),
(12, @OGUID+178),
(12, @OGUID+179),
(12, @OGUID+180),
(12, @OGUID+181),
(12, @OGUID+182),
(12, @OGUID+183),
(12, @OGUID+184),
(12, @OGUID+185),
(12, @OGUID+186),
(12, @OGUID+187),
(12, @OGUID+188),
(12, @OGUID+189),
(12, @OGUID+190),
(12, @OGUID+191),
(12, @OGUID+192),
(12, @OGUID+193),
(12, @OGUID+194),
(12, @OGUID+195),
(12, @OGUID+196),
(12, @OGUID+197),
(12, @OGUID+198),
(12, @OGUID+199),
(12, @OGUID+200),
(12, @OGUID+201),
(12, @OGUID+202),
(12, @OGUID+203),
(12, @OGUID+204),
(12, @OGUID+205),
(12, @OGUID+206),
(12, @OGUID+207),
(12, @OGUID+208),
(12, @OGUID+209),
(12, @OGUID+210),
(12, @OGUID+211),
(12, @OGUID+212),
(12, @OGUID+213),
(12, @OGUID+214),
(12, @OGUID+215),
(12, @OGUID+216),
(12, @OGUID+217),
(12, @OGUID+218),
(12, @OGUID+219),
(12, @OGUID+220),
(12, @OGUID+221),
(12, @OGUID+222),
(12, @OGUID+223),
(12, @OGUID+224),
(12, @OGUID+225),
(12, @OGUID+226),
(12, @OGUID+227),
(12, @OGUID+228),
(12, @OGUID+229),
(12, @OGUID+230),
(12, @OGUID+231),
(12, @OGUID+232),
(12, @OGUID+233),
(12, @OGUID+234),
(12, @OGUID+235),
(12, @OGUID+236),
(12, @OGUID+237),
(12, @OGUID+238),
(12, @OGUID+239),
(12, @OGUID+240),
(12, @OGUID+241),
(12, @OGUID+242),
(12, @OGUID+243),
(12, @OGUID+244),
(12, @OGUID+245),
(12, @OGUID+246),
(12, @OGUID+247),
(12, @OGUID+248),
(12, @OGUID+249),
(12, @OGUID+250),
(12, @OGUID+251),
(12, @OGUID+252),
(12, @OGUID+253),
(12, @OGUID+254),
(12, @OGUID+255),
(12, @OGUID+256),
(12, @OGUID+257),
(12, @OGUID+258),
(12, @OGUID+259),
(12, @OGUID+260),
(12, @OGUID+261),
(12, @OGUID+262),
(12, @OGUID+263),
(12, @OGUID+264),
(12, @OGUID+265),
(12, @OGUID+266),
(12, @OGUID+267),
(12, @OGUID+268),
(12, @OGUID+269),
(12, @OGUID+270),
(12, @OGUID+271),
(12, @OGUID+272),
(12, @OGUID+273),
(12, @OGUID+274),
(12, @OGUID+275),
(12, @OGUID+276),
(12, @OGUID+277),
(12, @OGUID+278),
(12, @OGUID+279),
(12, @OGUID+280),
(12, @OGUID+281),
(12, @OGUID+282),
(12, @OGUID+283),
(12, @OGUID+284),
(12, @OGUID+285),
(12, @OGUID+286),
(12, @OGUID+287),
(12, @OGUID+288),
(12, @OGUID+289),
(12, @OGUID+290),
(12, @OGUID+291),
(12, @OGUID+292),
(12, @OGUID+293),
(12, @OGUID+294),
(12, @OGUID+295),
(12, @OGUID+296),
(12, @OGUID+297),
(12, @OGUID+298),
(12, @OGUID+299),
(12, @OGUID+300),
(12, @OGUID+301),
(12, @OGUID+302),
(12, @OGUID+303),
(12, @OGUID+304),
(12, @OGUID+305),
(12, @OGUID+306),
(12, @OGUID+307),
(12, @OGUID+308),
(12, @OGUID+309),
(12, @OGUID+310),
(12, @OGUID+311),
(12, @OGUID+312),
(12, @OGUID+313),
(12, @OGUID+314),
(12, @OGUID+315),
(12, @OGUID+316),
(12, @OGUID+317),
(12, @OGUID+318),
(12, @OGUID+319),
(12, @OGUID+320),
(12, @OGUID+321),
(12, @OGUID+322),
(12, @OGUID+323),
(12, @OGUID+324),
(12, @OGUID+325),
(12, @OGUID+326),
(12, @OGUID+327),
(12, @OGUID+328),
(12, @OGUID+329),
(12, @OGUID+330),
(12, @OGUID+331),
(12, @OGUID+332),
(12, @OGUID+333),
(12, @OGUID+334),
(12, @OGUID+335),
(12, @OGUID+336),
(12, @OGUID+337),
(12, @OGUID+338),
(12, @OGUID+339),
(12, @OGUID+340),
(12, @OGUID+341),
(12, @OGUID+342),
(12, @OGUID+343),
(12, @OGUID+344),
(12, @OGUID+345),
(12, @OGUID+346),
(12, @OGUID+347),
(12, @OGUID+348),
(12, @OGUID+349),
(12, @OGUID+350),
(12, @OGUID+351),
(12, @OGUID+352),
(12, @OGUID+353),
(12, @OGUID+354),
(12, @OGUID+355),
(12, @OGUID+356),
(12, @OGUID+357),
(12, @OGUID+358),
(12, @OGUID+359),
(12, @OGUID+360),
(12, @OGUID+361),
(12, @OGUID+362),
(12, @OGUID+363),
(12, @OGUID+364),
(12, @OGUID+365),
(12, @OGUID+366),
(12, @OGUID+367),
(12, @OGUID+368),
(12, @OGUID+369),
(12, @OGUID+370),
(12, @OGUID+371),
(12, @OGUID+372),
(12, @OGUID+373),
(12, @OGUID+374),
(12, @OGUID+375),
(12, @OGUID+376),
(12, @OGUID+377),
(12, @OGUID+378),
(12, @OGUID+379),
(12, @OGUID+380),
(12, @OGUID+381),
(12, @OGUID+382),
(12, @OGUID+383),
(12, @OGUID+384),
(12, @OGUID+385),
(12, @OGUID+386),
(12, @OGUID+387),
(12, @OGUID+388),
(12, @OGUID+389),
(12, @OGUID+390),
(12, @OGUID+391),
(12, @OGUID+392),
(12, @OGUID+393),
(12, @OGUID+394),
(12, @OGUID+395),
(12, @OGUID+396),
(12, @OGUID+397),
(12, @OGUID+398),
(12, @OGUID+399),
(12, @OGUID+400),
(12, @OGUID+401),
(12, @OGUID+402),
(12, @OGUID+403),
(12, @OGUID+404),
(12, @OGUID+405),
(12, @OGUID+406),
(12, @OGUID+407),
(12, @OGUID+408),
(12, @OGUID+409),
(12, @OGUID+410),
(12, @OGUID+411),
(12, @OGUID+412),
(12, @OGUID+413),
(12, @OGUID+414),
(12, @OGUID+415),
(12, @OGUID+416),
(12, @OGUID+417),
(12, @OGUID+418),
(12, @OGUID+419),
(12, @OGUID+420),
(12, @OGUID+421),
(12, @OGUID+422),
(12, @OGUID+423),
(12, @OGUID+424),
(12, @OGUID+425),
(12, @OGUID+426),
(12, @OGUID+427),
(12, @OGUID+428),
(12, @OGUID+429),
(12, @OGUID+430);
 
 
/* 
* sql\updates\world\2015_10_27_00_world335.sql 
*/ 
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5667;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(5667, 0, 0, 'Hey Knot - I''m a Leatherworker. Think you could teach me how to make the ogre suit?', 9403, 1, 1, 0, 0, 0, 0, '', 0),
(5667, 1, 0, 'Hey Knot - I''m a Tailor. Think you could teach me how to make the ogre suit?', 9404, 1, 1, 0, 0, 0, 0, '', 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=5667;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 5667, 0, 0, 0, 7, 0, 165, 275, 0, 0, 0, 0, '', 'Only show gossip option if player has Leatherworking with skill level 275'),
(15, 5667, 1, 0, 0, 7, 0, 197, 275, 0, 0, 0, 0, '', 'Only show gossip option if player has Tailoring with skill level 275');

DELETE FROM `smart_scripts` WHERE `entryorguid`=14338 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=1433800 AND `source_type`=9;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(14338, 0, 0, 0, 20, 0, 100, 1, 5525, 0, 0, 0, 80, 1433800, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Knot - On Free Knot! Reward - run script'),
(14338, 0, 1, 0, 20, 0, 100, 1, 7429, 0, 0, 0, 80, 1433800, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Knot - On Free Knot! Reward - run script'),
(14338, 0, 2, 0, 34, 0, 100, 0, 0, 1, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Knot - On Point Reached - Despawn'),
(14338, 0, 3, 0, 25, 0, 100, 0, 0, 0, 0, 0, 50, 179511, 43200, 0, 0, 0, 0, 8, 0, 0, 0, 581.241, 524.321, -25.4027, -2.79252, 'Knot - On Reset - Spawn Ball and Chain'),
(14338, 0, 4, 6, 62, 0, 100, 0, 5667, 0, 0, 0, 85, 22816, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Knot - On Gossip Select  - Cast Gordok Ogre Suit'),
(14338, 0, 5, 6, 62, 0, 100, 0, 5667, 1, 0, 0, 85, 22814, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Knot - On Gossip Select  - Cast Gordok Ogre Suit'),
(14338, 0, 6, 0, 61, 0, 100, 0, 5667, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Knot - On Gossip Select  - Close Gossip'),

(1433800, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Knot - Script - Say 0'),
(1433800, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 83, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Knot - Script - Remove npc flag'),
(1433800, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 70, 43200, 0, 0, 0, 0, 0, 20, 179511, 10, 0, 0, 0, 0, 0, 'Knot - Script - Despawn Ball and Chain'),
(1433800, 9, 3, 0, 0, 0, 100, 0, 500, 500, 0, 0, 50, 179501, 43200, 0, 0, 0, 0, 8, 0, 0, 0, 583.6, 523.44, -25.4, 3.1848, 'Knot - Script - Spawn Cache'),
(1433800, 9, 4, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 69, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 500.42, 540.966, -25.3194, 2.72271, 'Knot - Script - Move Point');

DELETE FROM `creature_text` WHERE `entry`=14338;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(14338, 0, 0, '$n, I\'ll make sure all my friends in the Cartel know that you\'ve saved my life today.  Here - I\'m going to need to be able to travel light, so please help yourself to my cache of tailoring and leatherworking supplies!  Thanks again - see ya!', 12, 0, 0, 0, 0, 0, 9346, 0, 'Knot');
 
 
/* 
* sql\updates\world\2015_10_27_01_world.sql 
*/ 
    UPDATE `smart_scripts` SET `event_phase_mask`=1 WHERE  `entryorguid`=32257 AND `source_type`=0 AND `id` in(0,1,2);


    DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=32257 AND `id`>2;
    DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=3225700;
    DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=3214901;

    DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=32149 AND `id`=1;

    INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
    (32257, 0, 3, 0, 1, 0, 100, 0, 5000, 5000, 5000, 5000, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scourge Converter - OOC - Set Phase 2'),
    (32257, 0, 4, 0, 4, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scourge Converter - On Agro - Set Phase 1'),
    (32257, 0, 5, 0, 75, 2,33, 0, 0, 32149, 40, 120000, 80, 3225700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scourge Converter - On Fallen Heros Spirit within 30 yards (Phase 2/5% Chance) - Run Script'),
    (32149, 0, 1, 0, 8, 0, 100, 1, 60231, 0, 0, 0, 80, 3214901, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero\'s Spirit - On Spellhit "Grip of the Scourge" - Run Script'),
    (3214901, 9, 0, 0, 0, 0, 100, 0, 10, 10, 0, 0, 75, 60231, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fallen Heros Spirit - Script - Add Aura Grip of the Scourge'),
    (3214901, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 89, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fallen Heros Spirit - Script - Turn random movement off'),

    (3214901, 9, 2, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 7464.0068, 2445.8369, 384.2378, 0, 'Fallen Heros Spirit - Script - Move to Position'),
    (3214901, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 10000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fallen Heros Spirit - Script - Despawn'),
    (3225700, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 60212, 64, 0, 0, 0, 0, 19, 32149, 0, 0, 0, 0, 0, 0, 'Scourge Converter - Script - Cast Grip of the Scourge');

    DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=66719 AND  `ConditionTypeOrReference`=1;

    INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
    (17, 0, 66719, 0, 0, 1, 1, 60231, 0, 0, 1, 0, 0, '', 'Blessing of Peace cannot be cast on unit with Grip of the Scourge');
 
 
/* 
* sql\updates\world\2015_10_27_02_world.sql 
*/ 
SET @OGUID:=77697;
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+325 AND `eventEntry`=12;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+325;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0, 180431, 530, 1, 1, -1534.655, 5289.483, 11.84585, 1.204277, 0, 0, 0, 1, 120, 255, 1), -- 180431 (Area: -1)
(@OGUID+1, 180431, 530, 1, 1, -1551.18, 5096.325, -18.82875, 1.326448, 0, 0, 0, 1, 120, 255, 1), -- 180431 (Area: -1)
(@OGUID+2, 180431, 530, 1, 1, -1995.255, 5121.023, 8.559834, 6.230826, 0, 0, 0, 1, 120, 255, 1), -- 180431 (Area: -1)
(@OGUID+3, 180408, 530, 1, 1, -1827.292, 5290.855, -12.42814, 2.548179, 0, 0, 0, 1, 120, 255, 1), -- 180408 (Area: -1)
(@OGUID+4, 180431, 530, 1, 1, -1885.991, 4967.481, -21.06316, 0.8726639, 0, 0, 0, 1, 120, 255, 1), -- 180431 (Area: -1)
(@OGUID+5, 180431, 530, 1, 1, -2215.704, 5421.465, 51.26691, 3.543024, 0, 0, 0, 1, 120, 255, 1), -- 180431 (Area: -1)
(@OGUID+6, 180431, 530, 1, 1, -2170.908, 5149.174, -19.88593, 6.0912, 0, 0, 0, 1, 120, 255, 1), -- 180431 (Area: -1)
(@OGUID+7, 185434, 530, 1, 1, -1730.203, 5241.882, -48.3983, 0.5061446, 0, 0, 0, 1, 120, 255, 1), -- 185434 (Area: 3899)
(@OGUID+8, 180415, 530, 1, 1, -1713.155, 5189.252, -40.20916, 4.555311, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+9, 180407, 530, 1, 1, -1726.565, 5195.366, -40.20916, 5.742135, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 3899)
(@OGUID+10, 180472, 530, 1, 1, -1711.832, 5189.654, -35.45917, 0.2792516, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 3899)
(@OGUID+11, 185434, 530, 1, 1, -1695.124, 5272.625, -50.12435, 5.654869, 0, 0, 0, 1, 120, 255, 1), -- 185434 (Area: 3899)
(@OGUID+12, 180415, 530, 1, 1, -1668.301, 5242.631, -51.47162, 5.445428, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+13, 180415, 530, 1, 1, -1746.134, 5166.982, -35.90804, 3.68265, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+14, 180407, 530, 1, 1, -1694.59, 5185.016, -40.20916, 2.35619, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 3899)
(@OGUID+15, 180415, 530, 1, 1, -1746.674, 5164.065, -35.90804, 3.141593, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+16, 180415, 530, 1, 1, -1767.908, 5170.395, -38.40183, 6.230826, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+17, 180415, 530, 1, 1, -1665.969, 5242.099, -51.50999, 4.642576, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+18, 180415, 530, 1, 1, -1697.149, 5183.031, -40.20916, 4.694937, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+19, 180415, 530, 1, 1, -1746.348, 5166.079, -35.90804, 2.18166, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+20, 180415, 530, 1, 1, -1666.871, 5242.716, -51.67263, 4.921829, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+21, 180415, 530, 1, 1, -1749.273, 5163.449, -37.20491, 5.323256, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+22, 180405, 530, 1, 1, -1666.335, 5238.355, -50.38025, 5.567601, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 3899)
(@OGUID+23, 180415, 530, 1, 1, -1754.351, 5174.463, -38.41282, 3.054327, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+24, 180415, 530, 1, 1, -1721.349, 5167.382, -40.20916, 3.944446, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+25, 180415, 530, 1, 1, -1746.573, 5164.723, -35.90804, 5.026549, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+26, 180415, 530, 1, 1, -1664.876, 5241.221, -51.22554, 0.9424766, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+27, 180415, 530, 1, 1, -1746.429, 5165.326, -35.90803, 5.445428, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+28, 180415, 530, 1, 1, -1726.724, 5175.467, -40.20916, 5.462882, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+29, 180415, 530, 1, 1, -1731.426, 5173.524, -40.20916, 0, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+30, 180406, 530, 1, 1, -1771.68, 5173.339, -40.20917, 3.595379, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 3899)
(@OGUID+31, 180415, 530, 1, 1, -1746.179, 5167.779, -35.90804, 5.323256, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+32, 180415, 530, 1, 1, -1663.543, 5236.966, -50.02916, 3.368496, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+33, 180415, 530, 1, 1, -1790.927, 5177.194, -41.12518, 5.497789, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+34, 180415, 530, 1, 1, -1701.983, 5172.746, -40.20916, 1.151916, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+35, 180415, 530, 1, 1, -1663.604, 5235.882, -49.77483, 1.937312, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+36, 180415, 530, 1, 1, -1792.114, 5174.076, -40.86684, 2.111848, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+37, 180415, 530, 1, 1, -1663.852, 5235.025, -49.56621, 0.4712385, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+38, 180407, 530, 1, 1, -1739.737, 5159.344, -34.7813, 5.515242, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 3899)
(@OGUID+39, 180415, 530, 1, 1, -1664.292, 5240.016, -50.89723, 1.570796, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+40, 180415, 530, 1, 1, -1745.957, 5161.741, -35.90803, 3.508117, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+41, 180415, 530, 1, 1, -1706.435, 5167.831, -40.20916, 2.967041, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+42, 180415, 530, 1, 1, -1737.001, 5157.635, -36.06097, 3.33359, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+43, 180415, 530, 1, 1, -1748.725, 5161.841, -37.20491, 1.099556, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+44, 180415, 530, 1, 1, -1663.867, 5238.99, -50.61524, 3.979355, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+45, 180415, 530, 1, 1, -1745.184, 5160.036, -35.90804, 2.44346, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+46, 180415, 530, 1, 1, -1739.258, 5162.583, -36.06791, 1.518436, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+47, 180415, 530, 1, 1, -1663.598, 5238.002, -50.30962, 5.166176, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+48, 180415, 530, 1, 1, -1744.431, 5157.619, -35.90803, 0.1396245, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+49, 180415, 530, 1, 1, -1770.254, 5159.312, -35.90804, 2.548179, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+50, 180415, 530, 1, 1, -1768.823, 5157.79, -35.90805, 2.094393, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+51, 180415, 530, 1, 1, -1691.969, 5171.893, -40.20916, 0.4537851, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+52, 180415, 530, 1, 1, -1742.25, 5152.299, -35.90804, 4.625124, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+53, 180415, 530, 1, 1, -1766.36, 5158.437, -37.20492, 4.415683, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+54, 180415, 530, 1, 1, -1769.767, 5158.846, -35.90805, 2.33874, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+55, 180415, 530, 1, 1, -1765.703, 5156.897, -37.20491, 1.117009, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+56, 180415, 530, 1, 1, -1743.057, 5154.369, -35.90804, 3.455756, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+57, 180415, 530, 1, 1, -1778.556, 5162.756, -40.20917, 1.308995, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+58, 180415, 530, 1, 1, -1678.028, 5180.92, -40.20916, 0.6283169, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+59, 180415, 530, 1, 1, -1769.271, 5158.336, -35.90804, 1.745327, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+60, 180415, 530, 1, 1, -1768.123, 5155.603, -35.90804, 5.009095, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+61, 180415, 530, 1, 1, -1771.096, 5160.236, -35.90804, 0.1047193, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+62, 180415, 530, 1, 1, -1746.076, 5154.508, -37.2049, 2.792518, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+63, 180415, 530, 1, 1, -1743.914, 5156.47, -35.90803, 4.97419, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+64, 180415, 530, 1, 1, -1770.592, 5159.727, -35.90804, 0.4363316, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+65, 180415, 530, 1, 1, -1745.323, 5152.098, -37.20491, 1.692969, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+66, 180415, 530, 1, 1, -1680.046, 5182.063, -40.20916, 5.602507, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+67, 180415, 530, 1, 1, -1743.301, 5155.08, -35.90803, 5.742135, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+68, 180415, 530, 1, 1, -1663.519, 5293.407, -49.5914, 4.747296, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+69, 180415, 530, 1, 1, -1767.19, 5150.615, -35.90804, 4.834563, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+70, 180415, 530, 1, 1, -1797.811, 5163.908, -40.20916, 4.520406, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+71, 180415, 530, 1, 1, -1763.264, 5146.753, -37.20491, 5.93412, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+72, 180415, 530, 1, 1, -1664.684, 5293.219, -49.66723, 1.692969, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+73, 180415, 530, 1, 1, -1766.92, 5149.255, -35.90804, 1.117009, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+74, 180415, 530, 1, 1, -1763.881, 5149.05, -37.20491, 3.68265, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+75, 180415, 530, 1, 1, -1781.224, 5155.466, -40.20916, 2.548179, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+76, 180415, 530, 1, 1, -1766.588, 5147.896, -35.90804, 3.752462, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+77, 180415, 530, 1, 1, -1774.051, 5152.581, -36.06793, 3.298687, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+78, 180415, 530, 1, 1, -1767.712, 5153.141, -35.90804, 2.949595, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+79, 180406, 530, 1, 1, -1727.872, 5151.118, -34.72747, 0.7330382, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 3899)
(@OGUID+80, 180415, 530, 1, 1, -1647.858, 5322.972, -40.20916, 5.567601, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+81, 180415, 530, 1, 1, -1653.098, 5316.989, -40.20916, 2.687807, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+82, 180415, 530, 1, 1, -1623.009, 5353.79, -39.90628, 5.829401, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+83, 180415, 530, 1, 1, -1650.696, 5301.975, -40.15569, 2.530723, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+84, 180415, 530, 1, 1, -1627.55, 5350.804, -39.69448, 4.66003, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+85, 180415, 530, 1, 1, -1649.128, 5294.073, -40.33651, 0.2094394, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+86, 180415, 530, 1, 1, -1656.347, 5308.329, -40.20916, 5.305802, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+87, 180415, 530, 1, 1, -1640.815, 5324.775, -40.0241, 3.054327, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+88, 180415, 530, 1, 1, -1630.996, 5346.603, -39.8759, 3.612838, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+89, 180415, 530, 1, 1, -1650.263, 5289.858, -40.64635, 2.687807, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+90, 180415, 530, 1, 1, -1640.641, 5328.2, -40.13517, 3.857183, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+91, 180415, 530, 1, 1, -1604.216, 5327.811, -40.20916, 5.235988, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+92, 180415, 530, 1, 1, -1620.229, 5273.603, -40.8573, 5.201083, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+93, 180415, 530, 1, 1, -1615.813, 5287.19, -40.76569, 4.380776, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+94, 180415, 530, 1, 1, -1643.108, 5261.086, -41.00774, 0.9075702, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+95, 180415, 530, 1, 1, -1610.787, 5322.729, -40.20916, 3.560473, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+96, 180415, 530, 1, 1, -1614.804, 5285.652, -40.81396, 5.567601, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+97, 180415, 530, 1, 1, -1641.931, 5257.188, -40.93716, 2.583081, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+98, 180415, 530, 1, 1, -1618.817, 5355.966, -40.20382, 0.4363316, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+99, 180415, 530, 1, 1, -1614.204, 5284.298, -40.8007, 1.047198, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+100, 180415, 530, 1, 1, -1604.152, 5341.309, -40.20916, 2.565632, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+101, 180415, 530, 1, 1, -1616.99, 5277.182, -40.82001, 4.642576, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+102, 180415, 530, 1, 1, -1616.733, 5288.768, -40.65269, 1.221729, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+103, 180415, 530, 1, 1, -1615.797, 5268.268, -40.774, 4.24115, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+104, 180407, 530, 1, 1, -1620.341, 5252.917, -40.79367, 4.642576, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 3899)
(@OGUID+105, 180415, 530, 1, 1, -1615.02, 5261.716, -40.74166, 5.480334, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+106, 180415, 530, 1, 1, -1593.996, 5360.147, -40.20916, 3.787367, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+107, 180415, 530, 1, 1, -1600.158, 5344.43, -40.20916, 5.759588, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+108, 180407, 530, 1, 1, -1592.862, 5307.45, -38.57781, 5.67232, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 3899)
(@OGUID+109, 180415, 530, 1, 1, -1594.889, 5261.762, -13.97506, 2.199115, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+110, 180415, 530, 1, 1, -1597.819, 5264.682, -14.05011, 5.009095, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+111, 180415, 530, 1, 1, -1597.493, 5366.856, -40.20916, 6.248279, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+112, 180406, 530, 1, 1, -1592.3, 5357.065, -40.20916, 4.852017, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 3899)
(@OGUID+113, 180415, 530, 1, 1, -1596.895, 5263.488, -14.02306, 0.8377575, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+114, 180415, 530, 1, 1, -1612.543, 5247.093, -40.65835, 5.201083, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+115, 180415, 530, 1, 1, -1622.793, 5243.489, -40.80069, 1.343901, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+116, 180415, 530, 1, 1, -1595.962, 5262.593, -13.99772, 5.602507, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+117, 180415, 530, 1, 1, -1616.154, 5244.095, -40.70304, 1.97222, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+118, 180415, 530, 1, 1, -1620.814, 5239.755, -40.75924, 1.518436, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+119, 180431, 530, 1, 1, -1688.561, 5666.329, 130.5969, 3.700105, 0, 0, 0, 1, 120, 255, 1), -- 180431 (Area: 3899)
(@OGUID+120, 180415, 530, 1, 1, -1593.098, 5260.721, -13.94664, 2.548179, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+121, 180410, 530, 1, 1, -1617.977, 5403.792, -38.17708, 3.263772, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 3899)
(@OGUID+122, 180405, 530, 1, 1, -1612.946, 5424.752, -38.85912, 4.694937, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+123, 180415, 530, 1, 1, -1614.504, 5415.917, -38.86249, 2.530723, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+124, 180415, 530, 1, 1, -1614.682, 5413.557, -38.85962, 6.073746, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+125, 180415, 530, 1, 1, -1614.065, 5412.168, -38.85929, 4.886924, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+126, 180415, 530, 1, 1, -1614.54, 5414.432, -38.86086, 2.82743, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+127, 180415, 530, 1, 1, -1615.161, 5408.31, -39.67566, 0, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+128, 180415, 530, 1, 1, -1615.594, 5407.222, -40.56182, 5.689774, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+129, 180415, 530, 1, 1, -1613.32, 5410.315, -38.85626, 5.724681, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+130, 180415, 530, 1, 1, -1617.042, 5407.143, -41.05295, 2.495818, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+131, 180415, 530, 1, 1, -1614.408, 5409.302, -38.85281, 6.213374, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+132, 180415, 530, 1, 1, -1613.731, 5407.422, -39.67501, 1.97222, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+133, 180410, 530, 1, 1, -1618.031, 5406.084, -37.86068, 3.036838, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 0)
(@OGUID+134, 180472, 530, 1, 1, -1648.206, 5544.745, 15.57858, 1.431168, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 0)
(@OGUID+135, 180431, 530, 1, 1, -1822.676, 5698.866, 129.1411, 2.33874, 0, 0, 0, 1, 120, 255, 1), -- 180431 (Area: 0)
(@OGUID+136, 180431, 530, 1, 1, -1910.552, 5698.088, 124.9568, 2.635444, 0, 0, 0, 1, 120, 255, 1), -- 180431 (Area: 0)
(@OGUID+137, 180405, 530, 1, 1, -1648.345, 5544.776, 16.72861, 0.7679439, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+138, 185434, 530, 1, 1, -1598.392, 5396.745, -40.17126, 3.769912, 0, 0, 0, 1, 120, 255, 1), -- 185434 (Area: 0)
(@OGUID+139, 185455, 530, 1, 1, -1709.808, 5632.51, 127.9465, 5.480334, 0, 0, 0, 1, 120, 255, 1), -- 185455 (Area: 3899)
(@OGUID+140, 180415, 530, 1, 1, -1710.33, 5634.917, 127.9465, 0.2792516, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+141, 180415, 530, 1, 1, -1711.769, 5633.732, 127.9465, 6.178466, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+142, 180429, 530, 1, 1, -1707.317, 5645.849, 130.3365, 5.305802, 0, 0, 0, 1, 120, 255, 1), -- 180429 (Area: 3899)
(@OGUID+143, 180415, 530, 1, 1, -1591.131, 5260.113, -13.96355, 3.68265, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+144, 180407, 530, 1, 1, -1650.866, 5190.316, -38.87681, 2.91469, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 3899)
(@OGUID+145, 180406, 530, 1, 1, -1645.201, 5199.991, -38.8768, 5.951575, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 3899)
(@OGUID+146, 180415, 530, 1, 1, -1618.823, 5181.593, -33.82702, 3.351047, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+147, 180415, 530, 1, 1, -1601.915, 5171.649, -30.58988, 1.727875, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+148, 180415, 530, 1, 1, -1608.95, 5160.993, -30.56009, 5.375615, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+149, 180415, 530, 1, 1, -1624.757, 5172.668, -33.79735, 3.735006, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+150, 180415, 530, 1, 1, -1602.198, 5152.721, -28.87143, 0.2268925, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+151, 180415, 530, 1, 1, -1591.732, 5168.822, -28.87342, 1.099556, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+152, 180406, 530, 1, 1, -1723.19, 5136.492, -35.09916, 3.525572, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 3899)
(@OGUID+153, 180415, 530, 1, 1, -1584.816, 5160.914, -27.39262, 5.201083, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+154, 180411, 530, 1, 1, -1742.706, 5137.688, -30.48351, 4.171338, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 3899)
(@OGUID+155, 180415, 530, 1, 1, -1593.068, 5148.36, -27.30097, 3.874631, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+156, 180415, 530, 1, 1, -1566.594, 5148.008, -23.49201, 1.082103, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+157, 180415, 530, 1, 1, -1575.762, 5134.228, -23.58824, 4.81711, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+158, 185434, 530, 1, 1, -1744.142, 5123.62, -35.82451, 2.024579, 0, 0, 0, 1, 120, 255, 1), -- 185434 (Area: 0)
(@OGUID+159, 180411, 530, 1, 1, -1758.289, 5131.851, -30.40018, 4.886924, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 0)
(@OGUID+160, 180415, 530, 1, 1, -1766.187, 5145.766, -35.90804, 0.157079, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+161, 180405, 530, 1, 1, -1756.477, 5130.035, -36.26126, 3.543024, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+162, 180415, 530, 1, 1, -1773.81, 5148.538, -36.06519, 4.24115, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+163, 180415, 530, 1, 1, -1772.502, 5143.563, -36.23128, 4.625124, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+164, 180415, 530, 1, 1, -1774.292, 5139.007, -36.21167, 2.932139, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+165, 180415, 530, 1, 1, -1775.087, 5137.319, -36.26489, 1.710422, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+166, 180405, 530, 1, 1, -1777.374, 5136.409, -34.72696, 0.3665176, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+167, 180405, 530, 1, 1, -1773.338, 5121.479, -35.0905, 3.787367, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+168, 180415, 530, 1, 1, -1769.995, 5125.528, -36.02662, 0.9250238, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+169, 180415, 530, 1, 1, -1772.336, 5122.282, -35.83616, 4.031712, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+170, 180415, 530, 1, 1, -1787.647, 5148.141, -40.20916, 5.462882, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+171, 180415, 530, 1, 1, -1781.443, 5131.746, -34.77077, 6.03884, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+172, 180415, 530, 1, 1, -1771.183, 5123.882, -35.90277, 0.1745321, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+173, 180415, 530, 1, 1, -1782.792, 5132.561, -34.69776, 5.183629, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+174, 180415, 530, 1, 1, -1776.1, 5136.846, -35.92095, 3.106652, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+175, 180415, 530, 1, 1, -1778.352, 5124.249, -34.69559, 0.1919852, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+176, 180415, 530, 1, 1, -1800.136, 5141.807, -40.20917, 6.265733, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+177, 180415, 530, 1, 1, -1804.512, 5157.381, -40.20917, 1.239183, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+178, 180415, 530, 1, 1, -1779.405, 5125.828, -34.73515, 4.310966, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+179, 180407, 530, 1, 1, -1798.805, 5132.179, -40.20916, 3.700105, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+180, 180415, 530, 1, 1, -1793.893, 5143.439, -40.20916, 5.724681, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+181, 180415, 530, 1, 1, -1853.723, 5200.164, -40.20916, 3.857183, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+182, 180406, 530, 1, 1, -1829.19, 5132.753, -36.21552, 4.555311, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 0)
(@OGUID+183, 180415, 530, 1, 1, -1852.917, 5204.884, -40.20917, 5.969027, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+184, 180415, 530, 1, 1, -1846.027, 5211.841, -40.20916, 5.829401, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+185, 180407, 530, 1, 1, -1830.194, 5129.449, -36.20708, 4.729844, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+186, 180415, 530, 1, 1, -1849.075, 5210.507, -40.20917, 2.932139, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+187, 180405, 530, 1, 1, -1828.722, 5136.165, -36.61174, 2.391098, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+188, 180407, 530, 1, 1, -1845.585, 5181.297, -48.83864, 6.143561, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+189, 180415, 530, 1, 1, -1802.642, 5133.133, -40.20916, 0.9075702, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+190, 180415, 530, 1, 1, -1851.821, 5208.425, -40.20916, 0.3665176, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+191, 180415, 530, 1, 1, -1857.086, 5210.439, -40.20916, 2.286379, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+192, 180415, 530, 1, 1, -1859.659, 5207.607, -40.20916, 1.047198, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+193, 180415, 530, 1, 1, -1856.036, 5214.328, -40.20916, 4.258607, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+194, 180415, 530, 1, 1, -1848.79, 5084.666, -33.83941, 3.246347, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+195, 180410, 530, 1, 1, -1913.184, 5138.171, -37.93413, 2.321287, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 0)
(@OGUID+196, 180407, 530, 1, 1, -1874.145, 5136.215, -40.20916, 2.722713, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+197, 180411, 530, 1, 1, -1879.563, 5125.416, -28.39666, 3.892087, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 0)
(@OGUID+198, 180406, 530, 1, 1, -1896.112, 5150.331, -38.65614, 2.862335, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 0)
(@OGUID+199, 180415, 530, 1, 1, -1859.411, 5085.3, -33.84349, 4.223697, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+200, 180415, 530, 1, 1, -1848.927, 5065.024, -30.60378, 3.874631, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+201, 180415, 530, 1, 1, -1865.414, 5055.882, -28.88485, 4.71239, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+202, 180407, 530, 1, 1, -1908.842, 5158.162, -40.20916, 2.844883, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+203, 180472, 530, 1, 1, -1924.396, 5137.794, -30.42237, 2.391098, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 0)
(@OGUID+204, 180415, 530, 1, 1, -1846.269, 5054.519, -28.83364, 2.844883, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+205, 180415, 530, 1, 1, -1910.569, 5159.94, -40.20916, 5.201083, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+206, 180472, 530, 1, 1, -1924.554, 5144.456, -30.56359, 3.543024, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 0)
(@OGUID+207, 180415, 530, 1, 1, -1912.345, 5164.043, -40.20916, 3.612838, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+208, 180410, 530, 1, 1, -1922.556, 5136.9, -37.5277, 1.884953, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 0)
(@OGUID+209, 180415, 530, 1, 1, -1862.386, 5205.07, -40.20916, 0.5934101, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+210, 180415, 530, 1, 1, -1861.724, 5065.828, -30.52389, 0.4363316, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+211, 180415, 530, 1, 1, -1849.668, 5044.827, -27.33423, 0.5759573, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+212, 180410, 530, 1, 1, -1933.896, 5139.628, -36.7346, 0.1745321, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 0)
(@OGUID+213, 180410, 530, 1, 1, -1933.745, 5142.19, -36.79674, 5.951575, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 0)
(@OGUID+214, 180415, 530, 1, 1, -1946.493, 5150.041, -40.20916, 5.096362, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+215, 180407, 530, 1, 1, -1932.899, 5165.837, -40.20917, 3.525572, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+216, 180415, 530, 1, 1, -1864.642, 5045.729, -27.34014, 5.93412, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+217, 180415, 530, 1, 1, -1935.678, 5168, -40.20916, 0.7330382, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+218, 180405, 530, 1, 1, -1946.298, 5152.045, 19.95769, 5.881761, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+219, 180415, 530, 1, 1, -1851.71, 5022.643, -23.50557, 3.892087, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+220, 180415, 530, 1, 1, -1868.281, 5023.652, -23.48158, 0.8203033, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+221, 180339, 530, 1, 1, -1837.953, 4921.162, -18.875, 0, 0, 0, 0, 1, 120, 255, 1), -- 180339 (Area: 0)
(@OGUID+222, 180338, 530, 1, 1, -1783.58, 4937.418, -22.87706, 0, 0, 0, 0, 1, 120, 255, 1), -- 180338 (Area: 0)
(@OGUID+223, 180415, 530, 1, 1, -1956.957, 5150.171, -40.20916, 0.03490625, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+224, 180415, 530, 1, 1, -1956.558, 5153.624, -40.20916, 1.151916, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+225, 180415, 530, 1, 1, -1946.968, 5183.813, -40.20916, 0.5061446, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+226, 180415, 530, 1, 1, -1976.524, 5163.211, -37.86652, 4.782203, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+227, 180406, 530, 1, 1, -1964.799, 5158.828, 20.03405, 0.2094394, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 0)
(@OGUID+228, 180405, 530, 1, 1, -1966.638, 5166.105, -38.13643, 2.897245, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+229, 180415, 530, 1, 1, -1960.333, 5168.675, -37.84088, 5.201083, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+230, 180406, 530, 1, 1, -2002.535, 5178.877, -40.20916, 3.438303, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 0)
(@OGUID+231, 180415, 530, 1, 1, -1975.752, 5182.889, -40.20917, 1.500983, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+232, 180415, 530, 1, 1, -1966.224, 5179.32, -37.85986, 5.93412, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+233, 180415, 530, 1, 1, -1990.585, 5176.176, -40.20916, 3.001947, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+234, 180415, 530, 1, 1, -1984.641, 5181.01, -40.20916, 6.265733, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+235, 180415, 530, 1, 1, -1975.384, 5162.208, -37.85071, 4.729844, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+236, 180415, 530, 1, 1, -2019.362, 5190.989, -35.6937, 4.34587, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+237, 180415, 530, 1, 1, -2021.95, 5196.345, -35.69493, 1.570796, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+238, 180415, 530, 1, 1, -1940.617, 5186.5, -40.20917, 1.413715, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+239, 180415, 530, 1, 1, -2010.293, 5209.039, -35.69574, 2.984498, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+240, 180407, 530, 1, 1, -2004.333, 5223.759, -35.69689, 2.844883, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+241, 180415, 530, 1, 1, -2002.867, 5221.198, -35.69662, 4.939284, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+242, 180415, 530, 1, 1, -2007.341, 5224.245, -35.697, 0.8901166, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+243, 180431, 530, 1, 1, -1746.621, 5620.082, 127.9465, 4.991644, 0, 0, 0, 1, 120, 255, 1), -- 180431 (Area: 0)
(@OGUID+244, 180405, 530, 1, 1, -2040.23, 5272.147, -39.39414, 0.1919852, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+245, 180472, 530, 1, 1, -2037.333, 5278.771, -34.47883, 6.003934, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 0)
(@OGUID+246, 180415, 530, 1, 1, -2063.034, 5263.798, -38.4651, 4.799657, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+247, 180415, 530, 1, 1, -2047.227, 5279.073, -38.46528, 4.049168, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+248, 180415, 530, 1, 1, -2049.917, 5283.648, -38.46651, 4.607672, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+249, 180472, 530, 1, 1, -2061.579, 5254.934, -33.4444, 0.7155849, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 0)
(@OGUID+250, 180415, 530, 1, 1, -2066.363, 5251.825, -38.46505, 3.647741, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+251, 180415, 530, 1, 1, -2094.274, 5197.883, -30.58273, 3.560473, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+252, 180415, 530, 1, 1, -2088.683, 5180.594, -29.04385, 0.3141584, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+253, 180415, 530, 1, 1, -2072.257, 5204.007, -33.86522, 1.797689, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+254, 180415, 530, 1, 1, -2080.019, 5211.397, -33.80571, 5.026549, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+255, 180415, 530, 1, 1, -2075.596, 5271.93, -37.32354, 3.246347, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+256, 180415, 530, 1, 1, -2084.991, 5189.033, -30.6074, 2.478367, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+257, 180415, 530, 1, 1, -2076.316, 5273.985, -37.32354, 2.146753, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+258, 180415, 530, 1, 1, -2098.523, 5174.088, -27.32298, 2.44346, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+259, 180415, 530, 1, 1, -2126.393, 5169.769, -23.65068, 1.745327, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+260, 180415, 530, 1, 1, -2114.375, 5158.421, -23.51009, 1.151916, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+261, 180415, 530, 1, 1, -2109.443, 5184.435, -27.30091, 0.5235979, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+262, 180415, 530, 1, 1, -2103.463, 5192.882, -28.88327, 0.8203033, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+263, 180415, 530, 1, 1, -2051.785, 5314.479, -39.39214, 4.258607, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+264, 180406, 530, 1, 1, -2051.922, 5310.453, -38.68298, 1.500983, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 3899)
(@OGUID+265, 180415, 530, 1, 1, -2071.595, 5291.309, -37.32354, 3.141593, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+266, 180415, 530, 1, 1, -2067.464, 5305.053, -37.32354, 1.937312, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+267, 180415, 530, 1, 1, -2051.43, 5296.361, -38.53338, 6.108654, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+268, 180415, 530, 1, 1, -2084.633, 5291.633, -37.32354, 3.665196, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 3899)
(@OGUID+269, 180415, 530, 1, 1, -2074.696, 5328.799, -37.32354, 2.076939, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+270, 180415, 530, 1, 1, -2068.033, 5319.889, -37.32354, 2.600535, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+271, 180415, 530, 1, 1, -2093.221, 5313.236, -37.32355, 3.926996, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+272, 180472, 530, 1, 1, -2066.37, 5326.438, -32.57355, 3.455756, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 0)
(@OGUID+273, 180415, 530, 1, 1, -2070.872, 5322.3, -37.32354, 1.989672, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+274, 180415, 530, 1, 1, -2087.761, 5329.484, -34.30538, 1.274088, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+275, 180405, 530, 1, 1, -2097.77, 5327.023, -35.3358, 1.221729, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+276, 180415, 530, 1, 1, -2073.631, 5338.689, -37.32354, 2.391098, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+277, 180472, 530, 1, 1, -2087.516, 5309.336, -32.71938, 5.951575, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 0)
(@OGUID+278, 180415, 530, 1, 1, -2097.917, 5305.059, -37.32355, 0.6283169, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+279, 180407, 530, 1, 1, -2104.679, 5301.78, -37.32354, 1.343901, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+280, 180415, 530, 1, 1, -2104.488, 5299.115, -37.32354, 2.600535, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+281, 180415, 530, 1, 1, -2075.449, 5347.141, -37.23588, 5.585054, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+282, 180472, 530, 1, 1, -2290.313, 5517.61, 69.03755, 2.146753, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 0)
(@OGUID+283, 180472, 530, 1, 1, -2302.897, 5520.82, 68.41949, 0.2617982, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 3898)
(@OGUID+284, 180407, 530, 1, 1, -2268.796, 5537.234, 66.99442, 3.211419, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 3898)
(@OGUID+285, 180410, 530, 1, 1, -2244.775, 5558.765, 83.47392, 3.036838, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 0)
(@OGUID+286, 180472, 530, 1, 1, -2209.612, 5545.717, 74.61052, 5.846854, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 0)
(@OGUID+287, 180410, 530, 1, 1, -2245.656, 5556.635, 83.39277, 2.792518, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 0)
(@OGUID+288, 180410, 530, 1, 1, -2248.23, 5552.896, 83.42593, 2.33874, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 0)
(@OGUID+289, 180410, 530, 1, 1, -2246.702, 5554.45, 83.38676, 2.548179, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 0)
(@OGUID+290, 180472, 530, 1, 1, -2314.44, 5528.929, 68.49589, 2.530723, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 0)
(@OGUID+291, 180410, 530, 1, 1, -2244.457, 5563.03, 83.45087, 3.298687, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 0)
(@OGUID+292, 180410, 530, 1, 1, -2244.639, 5560.766, 83.45145, 3.054327, 0, 0, 0, 1, 120, 255, 1), -- 180410 (Area: 0)
(@OGUID+293, 180415, 530, 1, 1, -2271.303, 5563.579, 101.4032, 3.543024, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+294, 180415, 530, 1, 1, -2269.602, 5568.494, 101.4043, 1.919862, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+295, 180415, 530, 1, 1, -2284.665, 5565.351, 101.7906, 2.600535, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+296, 180415, 530, 1, 1, -2289.344, 5567.648, 100.985, 3.926996, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+297, 180415, 530, 1, 1, -2268.372, 5565.401, 105.0102, 0.1396245, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+298, 180415, 530, 1, 1, -2290.393, 5569.944, 100.9936, 4.206246, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+299, 180415, 530, 1, 1, -2281.353, 5575.188, 101.7809, 1.553341, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+300, 180407, 530, 1, 1, -2225.354, 5587.122, 64.07227, 2.652894, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+301, 180415, 530, 1, 1, -2290.132, 5572.43, 100.9957, 1.570796, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+302, 180415, 530, 1, 1, -2288.95, 5574.736, 100.9939, 3.68265, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+303, 180415, 530, 1, 1, -2286.49, 5576.088, 100.9853, 2.862335, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+304, 180405, 530, 1, 1, -2241.581, 5617.456, 64.07227, 1.850049, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+305, 180406, 530, 1, 1, -2306.073, 5572.37, 64.07227, 4.049168, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 0)
(@OGUID+306, 180472, 530, 1, 1, -2299.912, 5575.924, 73.04609, 2.809975, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 0)
(@OGUID+307, 180405, 530, 1, 1, -2302.336, 5582.462, 64.07227, 4.886924, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+308, 180472, 530, 1, 1, -2313.528, 5589.7, 68.47504, 1.221729, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 0)
(@OGUID+309, 180472, 530, 1, 1, -2299.703, 5602.162, 69.12782, 1.797689, 0, 0, 0, 1, 120, 255, 1), -- 180472 (Area: 0)
(@OGUID+310, 185455, 530, 1, 1, -1931.683, 5771.58, 130.6861, 5.131269, 0, 0, 0, 1, 120, 255, 1), -- 185455 (Area: 0)
(@OGUID+311, 180429, 530, 1, 1, -1897.193, 5764.772, 132.3861, 0.8726639, 0, 0, 0, 1, 120, 255, 1), -- 180429 (Area: 0)
(@OGUID+312, 180429, 530, 1, 1, -1754.127, 5644.799, 130.0099, 1.06465, 0, 0, 0, 1, 120, 255, 1), -- 180429 (Area: 0)
(@OGUID+313, 180415, 530, 1, 1, -1754.441, 5844.208, 146.4398, 4.520406, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+314, 180429, 530, 1, 1, -1759.247, 5830.715, 151.03, 2.513274, 0, 0, 0, 1, 120, 255, 1), -- 180429 (Area: 0)
(@OGUID+315, 185455, 530, 1, 1, -1752.689, 5842.345, 146.4398, 5.93412, 0, 0, 0, 1, 120, 255, 1), -- 185455 (Area: 0)
(@OGUID+316, 180415, 530, 1, 1, -1755.557, 5841.976, 146.4398, 1.343901, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+317, 180407, 530, 1, 1, -1694.201, 5803.418, 150.5294, 1.675514, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+318, 180406, 530, 1, 1, -1682.232, 5716.45, 132.2278, 6.021387, 0, 0, 0, 1, 120, 255, 1), -- 180406 (Area: 0)
(@OGUID+319, 180471, 530, 1, 1, -1660.319, 5724.346, 138.4462, 3.787367, 0, 0, 0, 1, 120, 255, 1), -- 180471 (Area: 0)
(@OGUID+320, 180471, 530, 1, 1, -1661.021, 5725.675, 138.5542, 0.4014249, 0, 0, 0, 1, 120, 255, 1), -- 180471 (Area: 0)
(@OGUID+321, 180407, 530, 1, 1, -1664.092, 5696.812, 129.5579, 4.450591, 0, 0, 0, 1, 120, 255, 1), -- 180407 (Area: 0)
(@OGUID+322, 180405, 530, 1, 1, -1652.332, 5660.17, 132.697, 3.071766, 0, 0, 0, 1, 120, 255, 1), -- 180405 (Area: 0)
(@OGUID+323, 180415, 530, 1, 1, -1656.486, 5683.149, 132.9795, 3.368496, 0, 0, 0, 1, 120, 255, 1), -- 180415 (Area: 0)
(@OGUID+324, 180411, 530, 1, 1, -1657.563, 5686.755, 135.8198, 5.98648, 0, 0, 0, 1, 120, 255, 1), -- 180411 (Area: 0)
(@OGUID+325, 180429, 530, 1, 1, -1647.701, 5660.5, 134.0306, 0.4712385, 0, 0, 0, 1, 120, 255, 1); -- 180429 (Area: 0)

INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(12, @OGUID+0),
(12, @OGUID+1),
(12, @OGUID+2),
(12, @OGUID+3),
(12, @OGUID+4),
(12, @OGUID+5),
(12, @OGUID+6),
(12, @OGUID+7),
(12, @OGUID+8),
(12, @OGUID+9),
(12, @OGUID+10),
(12, @OGUID+11),
(12, @OGUID+12),
(12, @OGUID+13),
(12, @OGUID+14),
(12, @OGUID+15),
(12, @OGUID+16),
(12, @OGUID+17),
(12, @OGUID+18),
(12, @OGUID+19),
(12, @OGUID+20),
(12, @OGUID+21),
(12, @OGUID+22),
(12, @OGUID+23),
(12, @OGUID+24),
(12, @OGUID+25),
(12, @OGUID+26),
(12, @OGUID+27),
(12, @OGUID+28),
(12, @OGUID+29),
(12, @OGUID+30),
(12, @OGUID+31),
(12, @OGUID+32),
(12, @OGUID+33),
(12, @OGUID+34),
(12, @OGUID+35),
(12, @OGUID+36),
(12, @OGUID+37),
(12, @OGUID+38),
(12, @OGUID+39),
(12, @OGUID+40),
(12, @OGUID+51),
(12, @OGUID+52),
(12, @OGUID+53),
(12, @OGUID+54),
(12, @OGUID+55),
(12, @OGUID+56),
(12, @OGUID+57),
(12, @OGUID+58),
(12, @OGUID+59),
(12, @OGUID+60),
(12, @OGUID+61),
(12, @OGUID+62),
(12, @OGUID+63),
(12, @OGUID+64),
(12, @OGUID+65),
(12, @OGUID+66),
(12, @OGUID+67),
(12, @OGUID+68),
(12, @OGUID+69),
(12, @OGUID+70),
(12, @OGUID+71),
(12, @OGUID+72),
(12, @OGUID+73),
(12, @OGUID+74),
(12, @OGUID+75),
(12, @OGUID+76),
(12, @OGUID+77),
(12, @OGUID+78),
(12, @OGUID+79),
(12, @OGUID+80),
(12, @OGUID+81),
(12, @OGUID+82),
(12, @OGUID+83),
(12, @OGUID+84),
(12, @OGUID+85),
(12, @OGUID+86),
(12, @OGUID+87),
(12, @OGUID+88),
(12, @OGUID+89),
(12, @OGUID+90),
(12, @OGUID+91),
(12, @OGUID+92),
(12, @OGUID+93),
(12, @OGUID+94),
(12, @OGUID+95),
(12, @OGUID+96),
(12, @OGUID+97),
(12, @OGUID+98),
(12, @OGUID+99),
(12, @OGUID+100),
(12, @OGUID+101),
(12, @OGUID+102),
(12, @OGUID+103),
(12, @OGUID+104),
(12, @OGUID+105),
(12, @OGUID+106),
(12, @OGUID+107),
(12, @OGUID+108),
(12, @OGUID+109),
(12, @OGUID+110),
(12, @OGUID+111),
(12, @OGUID+112),
(12, @OGUID+113),
(12, @OGUID+114),
(12, @OGUID+115),
(12, @OGUID+116),
(12, @OGUID+117),
(12, @OGUID+118),
(12, @OGUID+119),
(12, @OGUID+120),
(12, @OGUID+121),
(12, @OGUID+122),
(12, @OGUID+123),
(12, @OGUID+124),
(12, @OGUID+125),
(12, @OGUID+126),
(12, @OGUID+127),
(12, @OGUID+128),
(12, @OGUID+129),
(12, @OGUID+130),
(12, @OGUID+131),
(12, @OGUID+132),
(12, @OGUID+133),
(12, @OGUID+134),
(12, @OGUID+135),
(12, @OGUID+136),
(12, @OGUID+137),
(12, @OGUID+138),
(12, @OGUID+139),
(12, @OGUID+140),
(12, @OGUID+141),
(12, @OGUID+142),
(12, @OGUID+143),
(12, @OGUID+144),
(12, @OGUID+145),
(12, @OGUID+146),
(12, @OGUID+147),
(12, @OGUID+148),
(12, @OGUID+149),
(12, @OGUID+150),
(12, @OGUID+151),
(12, @OGUID+152),
(12, @OGUID+153),
(12, @OGUID+154),
(12, @OGUID+155),
(12, @OGUID+156),
(12, @OGUID+157),
(12, @OGUID+158),
(12, @OGUID+159),
(12, @OGUID+160),
(12, @OGUID+161),
(12, @OGUID+162),
(12, @OGUID+163),
(12, @OGUID+164),
(12, @OGUID+165),
(12, @OGUID+166),
(12, @OGUID+167),
(12, @OGUID+168),
(12, @OGUID+169),
(12, @OGUID+170),
(12, @OGUID+171),
(12, @OGUID+172),
(12, @OGUID+173),
(12, @OGUID+174),
(12, @OGUID+175),
(12, @OGUID+176),
(12, @OGUID+177),
(12, @OGUID+178),
(12, @OGUID+179),
(12, @OGUID+180),
(12, @OGUID+181),
(12, @OGUID+182),
(12, @OGUID+183),
(12, @OGUID+184),
(12, @OGUID+185),
(12, @OGUID+186),
(12, @OGUID+187),
(12, @OGUID+188),
(12, @OGUID+189),
(12, @OGUID+190),
(12, @OGUID+191),
(12, @OGUID+192),
(12, @OGUID+193),
(12, @OGUID+194),
(12, @OGUID+195),
(12, @OGUID+196),
(12, @OGUID+197),
(12, @OGUID+198),
(12, @OGUID+199),
(12, @OGUID+200),
(12, @OGUID+201),
(12, @OGUID+202),
(12, @OGUID+203),
(12, @OGUID+204),
(12, @OGUID+205),
(12, @OGUID+206),
(12, @OGUID+207),
(12, @OGUID+208),
(12, @OGUID+209),
(12, @OGUID+210),
(12, @OGUID+211),
(12, @OGUID+212),
(12, @OGUID+213),
(12, @OGUID+214),
(12, @OGUID+215),
(12, @OGUID+216),
(12, @OGUID+217),
(12, @OGUID+218),
(12, @OGUID+219),
(12, @OGUID+220),
(12, @OGUID+221),
(12, @OGUID+222),
(12, @OGUID+223),
(12, @OGUID+224),
(12, @OGUID+225),
(12, @OGUID+226),
(12, @OGUID+227),
(12, @OGUID+228),
(12, @OGUID+229),
(12, @OGUID+230),
(12, @OGUID+231),
(12, @OGUID+232),
(12, @OGUID+233),
(12, @OGUID+234),
(12, @OGUID+235),
(12, @OGUID+236),
(12, @OGUID+237),
(12, @OGUID+238),
(12, @OGUID+239),
(12, @OGUID+240),
(12, @OGUID+241),
(12, @OGUID+242),
(12, @OGUID+243),
(12, @OGUID+244),
(12, @OGUID+245),
(12, @OGUID+246),
(12, @OGUID+247),
(12, @OGUID+248),
(12, @OGUID+249),
(12, @OGUID+250),
(12, @OGUID+251),
(12, @OGUID+252),
(12, @OGUID+253),
(12, @OGUID+254),
(12, @OGUID+255),
(12, @OGUID+256),
(12, @OGUID+257),
(12, @OGUID+258),
(12, @OGUID+259),
(12, @OGUID+260),
(12, @OGUID+261),
(12, @OGUID+262),
(12, @OGUID+263),
(12, @OGUID+264),
(12, @OGUID+265),
(12, @OGUID+266),
(12, @OGUID+267),
(12, @OGUID+268),
(12, @OGUID+269),
(12, @OGUID+270),
(12, @OGUID+271),
(12, @OGUID+272),
(12, @OGUID+273),
(12, @OGUID+274),
(12, @OGUID+275),
(12, @OGUID+276),
(12, @OGUID+277),
(12, @OGUID+278),
(12, @OGUID+279),
(12, @OGUID+280),
(12, @OGUID+281),
(12, @OGUID+282),
(12, @OGUID+283),
(12, @OGUID+284),
(12, @OGUID+285),
(12, @OGUID+286),
(12, @OGUID+287),
(12, @OGUID+288),
(12, @OGUID+289),
(12, @OGUID+290),
(12, @OGUID+291),
(12, @OGUID+292),
(12, @OGUID+293),
(12, @OGUID+294),
(12, @OGUID+295),
(12, @OGUID+296),
(12, @OGUID+297),
(12, @OGUID+298),
(12, @OGUID+299),
(12, @OGUID+300),
(12, @OGUID+301),
(12, @OGUID+302),
(12, @OGUID+303),
(12, @OGUID+304),
(12, @OGUID+305),
(12, @OGUID+306),
(12, @OGUID+307),
(12, @OGUID+308),
(12, @OGUID+309),
(12, @OGUID+310),
(12, @OGUID+311),
(12, @OGUID+312),
(12, @OGUID+313),
(12, @OGUID+314),
(12, @OGUID+315),
(12, @OGUID+316),
(12, @OGUID+317),
(12, @OGUID+318),
(12, @OGUID+319),
(12, @OGUID+320),
(12, @OGUID+321),
(12, @OGUID+322),
(12, @OGUID+323),
(12, @OGUID+324),
(12, @OGUID+325);
 
 
/* 
* sql\updates\world\2015_10_28_00_world.sql 
*/ 
-- Fix for DB/Event: Add missing Hallow's End event spawns in Dalaran 
SET @OGUID:=77307;
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+9 AND `eventEntry`=12;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(12, @OGUID+0),
(12, @OGUID+1),
(12, @OGUID+2),
(12, @OGUID+3),
(12, @OGUID+4),
(12, @OGUID+5),
(12, @OGUID+6),
(12, @OGUID+7),
(12, @OGUID+8),
(12, @OGUID+9);

-- Fix for DB/Event: Add missing Hallow's End event spawns in Shattrath 
SET @OGUID:=77697;
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+9 AND `eventEntry`=12;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(12, @OGUID+0),
(12, @OGUID+1),
(12, @OGUID+2),
(12, @OGUID+3),
(12, @OGUID+4),
(12, @OGUID+5),
(12, @OGUID+6),
(12, @OGUID+7),
(12, @OGUID+8),
(12, @OGUID+9);
 
 
/* 
* sql\updates\world\2015_10_29_00_world.sql 
*/ 
--
SET @OGUID:=17765;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+5;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0, 180643, 530, 1, 1, 10362.4, -6414.424, 163.4537, 3.141593, 0, 0, 0, 1, 120, 255, 1), -- 180643 (Area: 3431)
(@OGUID+1, 181325, 530, 1, 1, 6810.514, -7413.837, 47.01349, 3.141593, 0, 0, 0, 1, 120, 255, 1), -- 181325 (Area: 3517)
(@OGUID+2, 184803, 530, 1, 1, 9748.917, -7075.639, 16.75368, 4.433136, 0, 0, 0, 1, 120, 255, 1), -- 184803 (Area: -1)
(@OGUID+3, 184804, 530, 1, 1, 9749.188, -7075.547, 16.75464, 2.617989, 0, 0, 0, 1, 120, 255, 1), -- 184804 (Area: -1)
(@OGUID+4, 186406, 530, 1, 1, 6738.535, -7607.16, 126.1211, 2.862331, 0, 0, 0, 1, 120, 255, 1), -- 186406 (Area: 3507)
(@OGUID+5, 186407, 530, 1, 1, 6795.697, -7574.934, 126.9773, 3.324856, 0, 0, 0, 1, 120, 255, 1); -- 186407 (Area: 3517)
 
 
/* 
* sql\updates\world\2015_10_30_00_world.sql 
*/ 
--
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=27292;
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
 
 
/* 
* sql\updates\world\2015_10_30_01_world_335.sql 
*/ 
--
UPDATE `creature_template` SET `dynamicflags`=0 WHERE `entry`=23667;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 14338;
 
 
/* 
* sql\updates\world\2015_10_30_02_world.sql 
*/ 
--
UPDATE `npc_spellclick_spells` SET `cast_flags`=1 WHERE `npc_entry`=26477 AND `spell_id`=61832;

UPDATE smart_scripts SET action_param1=48600 WHERE entryorguid=27292 AND source_type=0 AND id=3;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=48600;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES
(13, 1, 48600, 31, 0, 3, 27292, "Ride Flamebringer effect only on Flamebringer");
 
 
/* 
* sql\updates\world\2015_10_30_03_world.sql 
*/ 
--
UPDATE `creature_model_info` SET `DisplayID_Other_Gender`=0 WHERE `DisplayID` IN (16046, 3258, 14533);
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry` IN (22434,22435,22447,22383);
 
 
