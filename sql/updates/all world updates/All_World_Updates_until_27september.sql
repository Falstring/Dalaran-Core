/* 
* sql\updates\world\2015_09_11_99_world_335.sql 
*/ 
UPDATE `trinity_string`
SET `content_default` = 'Object GUID is: %s'
WHERE `entry`=201;
 

/* 
* sql\updates\world\2015_09_21_00_world.sql 
*/ 
-- 
DELETE FROM `creature` WHERE `guid`=84939 AND `id`=22023;
 
 
/* 
* sql\updates\world\2015_09_21_01_world.sql 
*/ 
-- 
DELETE FROM `smart_scripts` WHERE `entryorguid`=3518 AND `source_type`=0;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=3518;
UPDATE `waypoint_scripts` SET `dataint`=1102 WHERE `id`=273 ;
 
 
/* 
* sql\updates\world\2015_09_21_02_world.sql 
*/ 
-- 
-- Defias Conjurer SAI "Comments and event_flags fix"
SET @ENTRY := 619;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,1800000,1800000,11,12544,1,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Conjurer - Out of Combat - Cast 'Frost Armor'"),
(@ENTRY,0,1,0,0,0,100,0,0,0,2400,3800,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,"Defias Conjurer - Combat CMC - Cast 'Fireball'"),
(@ENTRY,0,2,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Conjurer - On Health - Flee for assist (No Repeat)");

-- Crushridge Warmonger SAI "Comments and event_flags fix"
SET @ENTRY := 2287;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,10,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Crushridge Warmonger - On Aggro - Say Line 0 (No Repeat)"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,39,15,1,0,0,0,0,1,0,0,0,0,0,0,0,"Crushridge Warmonger - Between 0-50% Health - Call For Help (No Repeat)"),
(@ENTRY,0,2,3,74,0,100,1,0,15,0,0,11,8269,1,0,0,0,0,9,0,0,0,0,0,0,0,"Crushridge Warmonger - On Friendly Between 0-15% Health - Cast 'Frenzy' (No Repeat)"),
(@ENTRY,0,3,0,61,0,100,1,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Crushridge Warmonger - On Friendly Between 0-15% Health - Say Line 1 (No Repeat)");

-- Dustbelcher Lord SAI "Line numbering and event_flags fix"
SET @ENTRY := 2719;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7800,12100,11200,30000,11,9128,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dustbelcher Lord - In Combat - Cast 'Battle Shout'"),
(@ENTRY,0,1,0,0,0,100,0,6600,18700,30800,32400,11,13730,1,0,0,0,0,1,0,0,0,0,0,0,0,"Dustbelcher Lord - In Combat - Cast 'Demoralizing Shout'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,39,15,1,0,0,0,0,1,0,0,0,0,0,0,0,"Dustbelcher Lord - Between 0-50% Health - Call For Help (No Repeat)");

-- Duggan Wildhammer & Sentinel Leader & Dal Bloodclaw SAI "event_flags fix"
UPDATE `smart_scripts` SET `event_flags`=1 WHERE `entryorguid` IN (10817,17210) AND `source_type`=0 AND `id`=2;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE `entryorguid` IN (3987) AND `source_type`=0 AND `id`=1;
 
 
/* 
* sql\updates\world\2015_09_21_03_world.sql 
*/ 
-- 
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 29320;
INSERT INTO `spell_linked_spell` VALUES (29320, 29321, 0, 'Charge-Fear');
 
 
/* 
* sql\updates\world\2015_09_21_04_world.sql 
*/ 
-- 
UPDATE `gossip_menu_option` SET `action_menu_id`=9753 WHERE `menu_id`=9754;

-- Pathing for Death Knight Cavalier Entry: 16163 'TDB FORMAT' 
SET @NPC := 127753;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2926.023,`position_y`=-3200.403,`position_z`=273.3712 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,25278,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2926.023,-3200.403,273.3712,0,0,0,0,100,0),
(@PATH,2,2931.457,-3188.328,273.3712,0,0,0,0,100,0),
(@PATH,3,2925.778,-3167.298,273.787,0,0,0,0,100,0),
(@PATH,4,2907.542,-3166.655,273.787,0,0,0,0,100,0),
(@PATH,5,2873.219,-3165.419,273.787,0,0,0,0,100,0),
(@PATH,6,2861.632,-3165.088,273.787,0,0,0,0,100,0),
(@PATH,7,2860.526,-3185.717,273.787,0,0,0,0,100,0),
(@PATH,8,2860.435,-3203.401,273.787,0,0,0,0,100,0),
(@PATH,9,2875.204,-3203.906,273.4088,0,0,0,0,100,0),
(@PATH,10,2892.834,-3204.38,273.3965,0,0,0,0,100,0),
(@PATH,11,2911.993,-3204.611,273.3846,0,0,0,0,100,0);

DELETE FROM `creature_template_addon` WHERE `entry` =16400;

-- Pathing for Toxic Tunnel Entry: 16400 'TDB FORMAT' 
SET @NPC := 127631;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3223.018,`position_y`=-3218.725,`position_z`=316.3705 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '28370');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3223.018,-3218.725,316.3705,0,0,0,0,100,0),
(@PATH,2,3230.179,-3211.59,316.5933,0,0,0,0,100,0);

-- Pathing for Toxic Tunnel Entry: 16400 'TDB FORMAT' 
SET @NPC := 127632;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3208.167,`position_y`=-3234.595,`position_z`=315.4565 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '28370');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3208.167,-3234.595,315.4565,0,0,0,0,100,0),
(@PATH,2,3200.392,-3242.829,315.141,0,0,0,0,100,0);

-- Pathing for Toxic Tunnel Entry: 16400 'TDB FORMAT' 
SET @NPC := 127633;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3178.613,`position_y`=-3263.671,`position_z`=316.4281 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '28370');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3178.613,-3263.671,316.4281,0,0,0,0,100,0),
(@PATH,2,3174.119,-3267.95,316.7845,0,0,0,0,100,0);

-- Pathing for Toxic Tunnel Entry: 16400 'TDB FORMAT' 
SET @NPC := 127634;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3217.316,`position_y`=-3224.753,`position_z`=316.0583 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '28370');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3217.316,-3224.753,316.0583,0,0,0,0,100,0),
(@PATH,2,3209.847,-3232.841,315.5579,0,0,0,0,100,0);

-- Pathing for Toxic Tunnel Entry: 16400 'TDB FORMAT' 
SET @NPC := 127635;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3190.628,`position_y`=-3252.565,`position_z`=315.5675 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '28370');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3190.628,-3252.565,315.5675,0,0,0,0,100,0),
(@PATH,2,3196.852,-3246.524,315.0298,0,0,0,0,100,0);

-- Pathing for Toxic Tunnel Entry: 16400 'TDB FORMAT' 
SET @NPC := 127636;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3244.748,`position_y`=-3198.743,`position_z`=317.3646 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '28370');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3244.748,-3198.743,317.3646,0,0,0,0,100,0),
(@PATH,2,3236.25,-3205.753,316.6993,0,0,0,0,100,0);

-- Pathing for Toxic Tunnel Entry: 16400 'TDB FORMAT' 
SET @NPC := 127637;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3246.763,`position_y`=-3193.856,`position_z`=317.3302 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '28370');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3246.763,-3193.856,317.3302,0,0,0,0,100,0),
(@PATH,2,3252.532,-3188.566,318.1087,0,0,0,0,100,0);

-- Pathing for Stitched Colossus Entry: 30071 'TDB FORMAT' 
SET @NPC := 128058;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3454.427,`position_y`=-3187.954,`position_z`=294.6607 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3454.427,-3187.954,294.6607,0,0,0,0,100,0),
(@PATH,2,3453.837,-3215.978,284.005,0,0,0,0,100,0),
(@PATH,3,3453.848,-3237.722,272.597,0,0,0,0,100,0),
(@PATH,4,3453.705,-3262.583,267.5943,0,0,0,0,100,0),
(@PATH,5,3453.507,-3285.881,267.5923,0,0,0,0,100,0),
(@PATH,6,3450.008,-3299.009,267.593,0,0,0,0,100,0),
(@PATH,7,3434.539,-3314.597,267.592,0,0,0,0,100,0),
(@PATH,8,3423.135,-3338.302,267.593,0,0,0,0,100,0),
(@PATH,9,3430.531,-3358.816,267.592,0,0,0,0,100,0),
(@PATH,10,3450.598,-3369.066,267.5927,0,0,0,0,100,0),
(@PATH,11,3472.296,-3362.288,267.5991,0,0,0,0,100,0),
(@PATH,12,3483.6,-3341.974,267.5938,0,0,0,0,100,0),
(@PATH,13,3477.419,-3326.692,267.5933,0,0,0,0,100,0),
(@PATH,14,3466.747,-3312.542,267.5925,0,0,0,0,100,0),
(@PATH,15,3455.716,-3299.394,267.5929,0,0,0,0,100,0),
(@PATH,16,3453.988,-3285.853,267.5922,0,0,0,0,100,0),
(@PATH,17,3454.239,-3262.38,267.5943,0,0,0,0,100,0),
(@PATH,18,3454.453,-3237.651,272.6341,0,0,0,0,100,0),
(@PATH,19,3454.135,-3215.837,284.079,0,0,0,0,100,0);

-- Pathing for Stitched Colossus Entry: 30071 'TDB FORMAT' 
SET @NPC := 128057;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3331.301,`position_y`=-3008.488,`position_z`=294.6606 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3331.301,-3008.488,294.6606,0,0,0,0,100,0),
(@PATH,2,3352.705,-3027.659,294.6606,0,0,0,0,100,0),
(@PATH,3,3378.292,-3052.875,294.6657,0,0,0,0,100,0),
(@PATH,4,3400.806,-3075.215,294.6628,0,0,0,0,100,0),
(@PATH,5,3420.535,-3095.16,294.6607,0,0,0,0,100,0),
(@PATH,6,3423.608,-3104.254,294.6607,0,0,0,0,100,0),
(@PATH,7,3424.381,-3122.999,294.6599,0,0,0,0,100,0),
(@PATH,8,3428.679,-3145.677,294.659,0,0,0,0,100,0),
(@PATH,9,3444.718,-3157.384,294.6608,0,0,0,0,100,0),
(@PATH,10,3466.77,-3155.3,294.6603,0,0,0,0,100,0),
(@PATH,11,3481.494,-3139.173,294.6597,0,0,0,0,100,0),
(@PATH,12,3480.309,-3114.887,294.6596,0,0,0,0,100,0),
(@PATH,13,3467.193,-3102.655,294.6595,0,0,0,0,100,0),
(@PATH,14,3448.526,-3099.575,294.6612,0,0,0,0,100,0),
(@PATH,15,3428.409,-3099.175,294.6607,0,0,0,0,100,0),
(@PATH,16,3420.901,-3094.735,294.6607,0,0,0,0,100,0),
(@PATH,17,3401.064,-3074.813,294.6629,0,0,0,0,100,0),
(@PATH,18,3378.616,-3052.372,294.6658,0,0,0,0,100,0),
(@PATH,19,3352.98,-3027.292,294.6606,0,0,0,0,100,0),
(@PATH,20,3331.301,-3008.488,294.6606,0,0,0,0,100,0),
(@PATH,21,3311.187,-2990.615,294.6598,0,0,0,0,100,0),
(@PATH,22,3311.187,-2990.615,294.6598,2.505866,0,0,0,100,0),
(@PATH,23,3311.187,-2990.615,294.6598,2.251878,0,0,0,100,0),
(@PATH,24,3311.187,-2990.615,294.6598,3.254467,0,0,0,100,0),
(@PATH,25,3311.187,-2990.615,294.6598,5.113917,0,0,0,100,0);

-- Pathing for Stitched Colossus Entry: 30071 'TDB FORMAT' 
SET @NPC := 128056;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3425.885,`position_y`=-3100.784,`position_z`=294.6607 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3425.885,-3100.784,294.6607,0,0,0,0,100,0),
(@PATH,2,3400.279,-3075.093,294.6628,0,0,0,0,100,0),
(@PATH,3,3373.177,-3047.739,294.6664,0,0,0,0,100,0),
(@PATH,4,3344.838,-3019.543,294.6606,0,0,0,0,100,0),
(@PATH,5,3341.914,-3012.742,294.6606,0,0,0,0,100,0),
(@PATH,6,3339.663,-2995.398,294.6601,0,0,0,0,100,0),
(@PATH,7,3337.08,-2977.52,294.6604,0,0,0,0,100,0),
(@PATH,8,3323.939,-2963.499,294.6603,0,0,0,0,100,0),
(@PATH,9,3299.76,-2962.284,294.6606,0,0,0,0,100,0),
(@PATH,10,3286.439,-2972.35,294.6593,0,0,0,0,100,0),
(@PATH,11,3280.707,-2995.567,294.6606,0,0,0,0,100,0),
(@PATH,12,3288.473,-3011.645,294.6597,0,0,0,0,100,0),
(@PATH,13,3307.809,-3020.176,294.659,0,0,0,0,100,0),
(@PATH,14,3325.226,-3018.351,294.6606,0,0,0,0,100,0),
(@PATH,15,3338.513,-3016.632,294.6606,0,0,0,0,100,0),
(@PATH,16,3344.342,-3020.255,294.6606,0,0,0,0,100,0),
(@PATH,17,3372.666,-3048.441,294.6662,0,0,0,0,100,0),
(@PATH,18,3399.818,-3075.62,294.6627,0,0,0,0,100,0),
(@PATH,19,3425.406,-3101.135,294.6607,0,0,0,0,100,0),
(@PATH,20,3451.888,-3127.903,294.6607,0,0,0,0,100,0),
(@PATH,21,3451.888,-3127.903,294.6607,1.541391,0,0,0,100,0),
(@PATH,22,3456.634,-3133.219,294.6606,0,0,0,0,100,0),
(@PATH,23,3455.112,-3131.514,294.6606,6.06443,0,0,0,100,0),
(@PATH,24,3455.112,-3131.514,294.6606,4.858006,0,0,0,100,0),
(@PATH,25,3455.112,-3131.514,294.6606,2.345938,0,0,0,100,0);

-- Pathing for Stitched Colossus Entry: 30071 'TDB FORMAT' 
SET @NPC := 128054;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3250.639,`position_y`=-2986.463,`position_z`=294.6606 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3250.639,-2986.463,294.6606,0,0,0,0,100,0),
(@PATH,2,3218.217,-2985.765,281.2667,0,0,0,0,100,0),
(@PATH,3,3198.772,-2985.637,271.0636,0,0,0,0,100,0),
(@PATH,4,3178.061,-2985.433,267.5943,0,0,0,0,100,0),
(@PATH,5,3159.365,-2985.343,267.5929,0,0,0,0,100,0),
(@PATH,6,3139.7,-2981.853,267.5929,0,0,0,0,100,0),
(@PATH,7,3126.553,-2971.708,267.5919,0,0,0,0,100,0),
(@PATH,8,3114.558,-2959.215,267.5926,0,0,0,0,100,0),
(@PATH,9,3095.302,-2956.31,267.5921,0,0,0,0,100,0),
(@PATH,10,3078.464,-2964.795,267.5918,0,0,0,0,100,0),
(@PATH,11,3070.598,-2982.696,267.5929,0,0,0,0,100,0),
(@PATH,12,3076.846,-3004.052,267.592,0,0,0,0,100,0),
(@PATH,13,3096.726,-3015.381,267.5934,0,0,0,0,100,0),
(@PATH,14,3115.124,-3011.505,267.5921,0,0,0,0,100,0),
(@PATH,15,3127.605,-2998.091,267.5924,0,0,0,0,100,0),
(@PATH,16,3139.447,-2989.035,267.5929,0,0,0,0,100,0),
(@PATH,17,3159.26,-2985.907,267.5929,0,0,0,0,100,0),
(@PATH,18,3178.106,-2985.838,267.5943,0,0,0,0,100,0),
(@PATH,19,3198.909,-2986.179,271.1352,0,0,0,0,100,0),
(@PATH,20,3218.02,-2986.236,281.1633,0,0,0,0,100,0);

-- Pathing for Shade of Naxxramas Entry: 16164 'TDB FORMAT' 
SET @NPC := 127755;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2915.294,`position_y`=-3343.234,`position_z`=298.1457 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2915.294,-3343.234,298.1457,0,0,0,0,100,0),
(@PATH,2,2898.639,-3327.008,298.1457,0,0,0,0,100,0),
(@PATH,3,2915.294,-3343.234,298.1457,0,0,0,0,100,0),
(@PATH,4,2898.639,-3327.008,298.1457,0,0,0,0,100,0),
(@PATH,5,2915.294,-3343.234,298.1457,0,0,0,0,100,0),
(@PATH,6,2898.639,-3327.008,298.1457,0,0,0,0,100,0);

-- Sludge Belcher SAI On Reset - Cast Disease Cloud was set to OOC
UPDATE `smart_scripts` SET `event_type`=25 WHERE `entryorguid`=16029 AND `source_type`=0 AND `id`=0;
-- These npc's should not be moving
UPDATE creature SET `spawndist`=0, `MovementType`=0 WHERE `guid` IN (128070,128071,128072,128073,128074,128067,130957);
 
 
/* 
* sql\updates\world\2015_09_21_05_world.sql 
*/ 
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry`in(23392,23257,23334,23208,23335,22982);


DELETE FROM `creature_text` WHERE `entry` in(23392,23257,23334,23208,23335,22982);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(23392, 0, 0, '$n is an officer and a $g gentleman : gentlewoman;.', 12, 0, 100, 0, 0, 0, 21940, 0, 'Skyguard Stable Master <Stable Master>'),
(23257, 0, 0, 'Look who''s here.  It''s $n, our top gun.', 12, 0, 100, 0, 0, 0, 21885, 0, 'Skyguard Windcharger'),
(23257, 0, 1, '$n, terror of the skies, how are you doing?', 12, 0, 100, 0, 0, 0, 21893, 0, 'Skyguard Windcharger'),
(23257, 0, 2, 'A-TEN-HUT, officer $n on the deck!', 12, 0, 100, 0, 0, 0, 21891, 0, 'Skyguard Windcharger'),
(23257, 0, 3, '$G Mister : Lady; $n, what an unexpected pleasure, $g sir : ma''am;.', 12, 0, 100, 0, 0, 0, 21890, 0, 'Skyguard Windcharger'),
(23257, 0, 4, 'Heh, the skies aren''t so friendly with $n flying them!', 12, 0, 100, 0, 0, 0, 21895, 0, 'Skyguard Windcharger'),
(23257, 0, 5, '$n, you and I should race sometime.', 12, 0, 100, 0, 0, 0, 21937, 0, 'Skyguard Windcharger'),
(23257, 0, 6, '$n, how''s your mount holding up?  Pretty rough up there these days?', 12, 0, 100, 0, 0, 0, 21897, 0, 'Skyguard Windcharger'),
(23334, 0, 0, 'Maybe one day $n will teach us a few of $g his : her; tricks?', 12, 0, 100, 0, 0, 0, 21942, 0, 'Sky Commander Keller'),
(23208, 0, 0, 'Maybe one day $n will teach us a few of $g his : her; tricks?', 12, 0, 100, 0, 0, 0, 21942, 0, 'Skyguard Pyrotechnician'),
(23335, 0, 0, 'You''re a peach!  I''ll make sure that the ray is properly cared for.', 12, 0, 100, 0, 0, 0, 21371, 0, 'Skyguard Khatie'),
(23335, 0, 1, 'Wow!  Thanks for bringing it all the way back here.  You didn''t have to do that.', 12, 0, 100, 0, 0, 0, 21370, 0, 'Skyguard Khatie'),
(22982, 0, 0, '$n, do you feel the need -- the need for speed?', 12, 0, 100, 0, 0, 0, 21886, 0, 'Skyguard Navigator'),
(22982, 0, 1, '$n, how''s your mount holding up?  Pretty rough up there these days?', 12, 0, 100, 0, 0, 0, 21897, 0, 'Skyguard Navigator'),
(22982, 0, 3, 'Heh, the skies aren''t so friendly with $n flying them!', 12, 0, 100, 0, 0, 0, 21895, 0, 'Skyguard Navigator'),
(22982, 0, 4, '$n, terror of the skies, how are you doing?', 12, 0, 100, 0, 0, 0, 21893, 0, 'Skyguard Navigator');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN(23392,23257,23334,23208,23335,22982) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(23392, 0, 0, 0, 10, 0, 100, 0, 1, 10, 300000, 300000, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Skyguard Stable Master <Stable Master> - OOC LOS - Say'),
(23257, 0, 0, 0, 10, 0, 100, 0, 1, 10, 150000, 150000, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Skyguard Stable Master - OOC LOS - Say'),
(23334, 0, 0, 0, 10, 0, 100, 0, 1, 10, 300000, 300000, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sky Commander Keller - OOC LOS - Say'),
(23208, 0, 0, 0, 10, 0, 100, 0, 1, 10, 300000, 300000, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Skyguard Pyrotechnician - OOC LOS - Say'),
(23335, 0, 0, 0, 10, 0, 100, 0, 1, 10, 300000, 300000, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Skyguard Khatie - OOC LOS - Say'),
(22982, 0, 0, 0, 10, 0, 100, 0, 1, 10, 150000, 150000, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Skyguard Navigator - OOC LOS - Say');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry` IN(23392,23257,23334,23208,23335,22982);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, 23392, 0, 0, 5, 0, 1031, 128, 0, 0, 0, 0, '', 'requires shatari skyguard exhalted'),
(22, 1, 23257, 0, 0, 5, 0, 1031, 128, 0, 0, 0, 0, '', 'requires shatari skyguard exhalted'),
(22, 1, 23334, 0, 0, 5, 0, 1031, 128, 0, 0, 0, 0, '', 'requires shatari skyguard exhalted'),
(22, 1, 23208, 0, 0, 5, 0, 1031, 128, 0, 0, 0, 0, '', 'requires shatari skyguard exhalted'),
(22, 1, 23335, 0, 0, 28, 0, 11023, 0, 0, 0, 0, 0, '', 'requires Bomb Them Again complete in quest log'),
(22, 1, 23335, 0, 1, 28, 0, 11010, 0, 0, 0, 0, 0, '', 'requires Bombing run complete in quest log'),
(22, 1, 23335, 0, 2, 28, 0, 11102, 0, 0, 0, 0, 0, '', 'requires Bombing run complete in quest log'),
(22, 1, 22982, 0, 0, 5, 0, 1031, 128, 0, 0, 0, 0, '', 'requires shatari skyguard exhalted');
 
 
/* 
* sql\updates\world\2015_09_21_06_world.sql 
*/ 
-- 
-- North Sea Kraken SAI
SET @ENTRY := 34925;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,9000,7000,9000,11,66514,0,0,0,0,0,1,0,0,0,0,0,0,0,'North Sea Kraken - IC - Cast Frost Breath'),
(@ENTRY,0,1,0,8,0,40,0,66588,0,0,0,80,@ENTRY*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'North Sea Kraken - On Spell hit Flaming Spear - ActionList'),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,11,50142,2,0,0,0,0,1,0,0,0,0,0,0,0,'North Sea Kraken - actionList - Cast Submerge'),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,'North Sea Kraken - actionList - Add unitflag not selectable'),
(@ENTRY*100,9,2,0,0,0,100,0,3000,3000,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'North Sea Kraken - actionList - Turn Invisible'),
(@ENTRY*100,9,3, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 47, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Northsea Kraken - actionList - Turn Visible'),
(@ENTRY*100,9,4,0,0,0,100,0,0,0,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,'North Sea Kraken - actionList - Remove unitflag not selectable'),
(@ENTRY, 0, 2, 3, 2, 0, 100, 1, 1, 6, 0, 0, 11, 66994, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Northsea Kraken - On Between 1 and 6% HP - Cast Kraken Tooth Explosion'),
(@ENTRY, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Northsea Kraken - Linked With Previous Event - Die'),
(@ENTRY, 0, 4, 0, 1, 0, 100, 0, 30000, 30000, 30000, 30000, 11, 68909, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Northsea Kraken - OOC - Cast Submerge '),
(@ENTRY, 0, 5, 0, 0, 0, 100, 0, 15000, 20000, 15000, 20000, 11, 66511, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Northsea Kraken - IC - Cast Whirl'),
(@ENTRY,0,6,0,8,0,100,0,66588,0,0,0,11,66717,2,0,0,0,0,7,0,0,0,0,0,0,0,'North Sea Kraken - On spell Hit - Cast Quest credit');
 
 
/* 
* sql\updates\world\2015_09_21_07_world.sql 
*/ 
-- 
DELETE FROM `smart_scripts` WHERE `entryorguid`=23899 AND `source_type`=0 AND `id` IN (8,9);
UPDATE `smart_scripts` SET `link`=9 WHERE `entryorguid`=23899 AND `source_type`=0 AND `id`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(23899,0,8,0,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tethyr - On Just Summoned - Set Active ON"),
(23899,0,9,0,61,0,100,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tethyr - On wp reached - Set Active OFF");
 
 
/* 
* sql\updates\world\2015_09_21_08_world.sql 
*/ 
-- Update formation points
UPDATE `creature_formations` SET `point_1`=1, `point_2`=19 WHERE `leaderGUID`=127045 AND `memberGUID`=127058;
UPDATE `creature_formations` SET `point_1`=4, `point_2`=8 WHERE `leaderGUID`=201706 AND `memberGUID`=201764;
UPDATE `creature_formations` SET `angle`=270,`point_1`=4, `point_2`=7 WHERE `leaderGUID`=201713 AND `memberGUID`=201735;
UPDATE `creature_formations` SET `angle`=260, `point_1`=4, `point_2`=8 WHERE `leaderGUID`=202628 AND `memberGUID` IN (202680);
UPDATE `creature_formations` SET `angle`=100, `point_1`=4, `point_2`=8 WHERE `leaderGUID`=202628 AND `memberGUID` IN (202682);
UPDATE `creature_formations` SET `point_1`=2, `point_2`=7 WHERE `leaderGUID`=202629 AND `memberGUID` IN (202681,202684);
UPDATE `creature_formations` SET `point_1`=1, `point_2`=10 WHERE `leaderGUID`=202692 AND `memberGUID` IN (202695,202696);
UPDATE `creature_formations` SET `point_1`=2, `point_2`=7 WHERE `leaderGUID`=202814 AND `memberGUID` IN (202803,202804);
UPDATE `creature_formations` SET `point_1`=3, `point_2`=6 WHERE `leaderGUID`=202815 AND `memberGUID` IN (202805,202806);
 
 
/* 
* sql\updates\world\2015_09_21_09_world.sql 
*/ 
--
UPDATE `creature_template` SET `npcflag`=4194305 WHERE `entry`=9988;
UPDATE `conditions` SET `ConditionValue1` =4 WHERE `SourceGroup`=9576 AND `SourceTypeOrReferenceId`=15;
UPDATE `creature_template` SET `npcflag`=4194305 WHERE  `npcflag`=4194304 ;
UPDATE `creature_template` SET `npcflag`=4194307 WHERE  `npcflag`=4194306 ;
UPDATE `creature_template` SET `gossip_menu_id`=9821 WHERE `entry` IN (9976,9978,9979,9982,9985,9986,10048,10049,10051,10052,10057,10058,11105,13616,15131,16094,16586,16656,16824,17896,18984,19018,21336,21517,22469,9896,19325,22551,22577,23392,24905,24974,25037,25519,29251,30155,31991,32105,35290);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14) AND `SourceGroup`=9821;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`, `NegativeCondition`) VALUES
(14, 9821, 13557, 0, 15, 4, 0, 0, 0, '', 'Show gossip text if player is a hunter', 0),
(14, 9821, 13584, 0, 15, 4, 0, 0, 0, '', 'Show gossip text if player is not a hunter', 1);

UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1, `action_menu_id`=9820 WHERE `menu_id`=9821 AND `id`=1;

DELETE FROM `gossip_menu` WHERE `entry`=11971 AND `text_id`=16788;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (11971,16788);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14) AND `SourceGroup`=11971;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`, `NegativeCondition`) VALUES
(14, 11971, 16788, 0, 15, 4, 0, 0, 0, '', 'Show gossip text if player is a hunter', 0),
(14, 11971, 16789, 0, 15, 4, 0, 0, 0, '', 'Show gossip text if player is not a hunter', 1);

DELETE FROM `npc_text` WHERE id=16788;
INSERT INTO `npc_text` (`ID`, `text0_0`, `BroadcastTextID0`, `Probability0`) VALUES 
(16788, "Hey der, mon.$B$BDid ya want ta be stablin' yer pets, or were ya lookin' for a lost companion?", 45395, 1);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 11971;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`OptionBroadcastTextID`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`,`BoxBroadcastTextID`) VALUES
(11971,0,0,'I''d like to stable my pet here.',30181,14,4194304,0,0,0,0,'',0),
(11971,1,1,'I''m looking for a lost companion.',56613,1,1,9820,0,0,0,'',0);

DELETE FROM `gossip_menu` WHERE `entry`=9864 AND `text_id`=13662;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (9864,13662);

UPDATE `npc_text` SET `text0_0`="", `text0_1`="Well met, Battle-Sister. I can help stable your pets or assist you in recovering lost companions.", `BroadcastTextID0`=30667 WHERE `ID`=13662;

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 9864;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`OptionBroadcastTextID`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`,`BoxBroadcastTextID`) VALUES
(9864,0,0,'I''d like to stable my pet here.',30181,14,4194304,0,0,0,0,'',0),
(9864,1,1,'I''m looking for a lost companion.',56613,1,1,9820,0,0,0,'',0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14) AND `SourceGroup`=9864;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`, `NegativeCondition`) VALUES
(14, 9864, 13662, 0, 15, 4, 0, 0, 0, '', 'Show gossip text if player is a hunter', 0),
(14, 9864, 13661, 0, 15, 4, 0, 0, 0, '', 'Show gossip text if player is not a hunter', 1);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 9212 AND `id`=1;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`OptionBroadcastTextID`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`,`BoxBroadcastTextID`) VALUES
(9212,1,0,'I''d like to stable my pet here.',30181,14,4194304,0,0,0,0,'',0);

DELETE FROM `gossip_menu` WHERE `entry`=9820 AND `text_id`=13584;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (9820,13584);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 9820;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`OptionBroadcastTextID`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`,`BoxBroadcastTextID`) VALUES
(9820,0,0,'I''ve lost Miniwing.',30182,1,1,0,0,0,0,'',0),
(9820,1,0,'I''ve lost my Jubling.',30183,1,1,0,0,0,0,'',0),
(9820,2,0,'I''ve lost my sprite darter hatchling.',30192,1,1,0,0,0,0,'',0),
(9820,3,0,'I''ve lost my worg pup.',30196,1,1,0,0,0,0,'',0),
(9820,4,0,'I''ve lost my Smolderweb hatchling.',30197,1,1,0,0,0,0,'',0),
(9820,5,0,'I''ve lost my Prairie Chicken.',30217,1,1,0,0,0,0,'',0),
(9820,6,0,'I''ve lost my wolpertinger.',30224,1,1,0,0,0,0,'',0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup`=9820;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`, `NegativeCondition`) VALUES
(15, 9820, 0, 0, 8, 10898, 0, 0, 0, '', 'Show the gossip option if the player rewarded the quest', 0),
(15, 9820, 0, 0, 2, 31760, 1, 1, 0, '', 'Show the gossip option if the player Didn''t have the item', 1),
(15, 9820, 0, 0, 25, 39181, 0, 0, 0, '', 'Show the gossip option if the player Didn''t lear the spell', 1),
(15, 9820, 1, 0, 8, 7946, 0, 0, 0, '', 'Show the gossip option if the player rewarded the quest', 0),
(15, 9820, 1, 0, 2, 19450, 1, 1, 0, '', 'Show the gossip option if the player Didn''t have the item', 1),
(15, 9820, 1, 0, 2, 19462, 1, 1, 0, '', 'Show the gossip option if the player Didn''t have the item', 1),
(15, 9820, 1, 0, 25, 23811, 0, 0, 0, '', 'Show the gossip option if the player Didn''t lear the spell', 1),
(15, 9820, 2, 0, 8, 4298, 0, 0, 0, '', 'Show the gossip option if the player rewarded the quest', 0),
(15, 9820, 2, 0, 2, 11474, 1, 1, 0, '', 'Show the gossip option if the player Didn''t have the item', 1),
(15, 9820, 2, 0, 25, 15067, 0, 0, 0, '', 'Show the gossip option if the player Didn''t lear the spell', 1),
(15, 9820, 3, 0, 8, 4729, 0, 0, 0, '', 'Show the gossip option if the player rewarded the quest', 0),
(15, 9820, 3, 0, 2, 12264, 1, 1, 0, '', 'Show the gossip option if the player Didn''t have the item', 1),
(15, 9820, 3, 0, 25, 15999, 0, 0, 0, '', 'Show the gossip option if the player Didn''t lear the spell', 1),
(15, 9820, 4, 0, 8, 4862, 0, 0, 0, '', 'Show the gossip option if the player rewarded the quest', 0),
(15, 9820, 4, 0, 2, 12529, 1, 1, 0, '', 'Show the gossip option if the player Didn''t have the item', 1),
(15, 9820, 4, 0, 25, 16450, 0, 0, 0, '', 'Show the gossip option if the player Didn''t lear the spell', 1),
(15, 9820, 5, 0, 8, 3861, 0, 0, 0, '', 'Show the gossip option if the player rewarded the quest', 0),
(15, 9820, 5, 0, 2, 11110, 1, 1, 0, '', 'Show the gossip option if the player Didn''t have the item', 1),
(15, 9820, 5, 0, 25, 13548, 0, 0, 0, '', 'Show the gossip option if the player Didn''t lear the spell', 1),   
(15, 9820, 5, 1, 8, 13840, 0, 0, 0, '', 'Show the gossip option if the player rewarded the quest', 0),
(15, 9820, 5, 1, 2, 11110, 1, 1, 0, '', 'Show the gossip option if the player Didn''t have the item', 1),
(15, 9820, 5, 1, 25, 13548, 0, 0, 0, '', 'Show the gossip option if the player Didn''t lear the spell', 1),
(15, 9820, 6, 0, 8, 11117, 0, 0, 0, '', 'Show the gossip option if the player rewarded the quest', 0),
(15, 9820, 6, 0, 2, 32233, 1, 1, 0, '', 'Show the gossip option if the player Didn''t have the item', 1),
(15, 9820, 6, 0, 25, 39709, 0, 0, 0, '', 'Show the gossip option if the player Didn''t lear the spell', 1),
(15, 9820, 6, 1, 8, 11431, 0, 0, 0, '', 'Show the gossip option if the player rewarded the quest', 0),
(15, 9820, 6, 1, 2, 32233, 1, 1, 0, '', 'Show the gossip option if the player Didn''t have the item', 1),
(15, 9820, 6, 1, 25, 39709, 0, 0, 0, '', 'Show the gossip option if the player Didn''t lear the spell', 1);

UPDATE `creature_template` SET `ScriptName`="npc_stable_master" WHERE `entry` IN (10052, 9978, 33854, 16764, 9986, 9987, 9989, 10045, 10046, 10047, 10048, 10049, 10050, 10051, 10053, 10054, 10055, 10056, 10057, 10058, 10059, 10060, 10061, 10062, 10063, 10085, 11069, 11104, 11105, 11117, 11119, 13616, 9983,  9982,  15131, 9981,  16094, 16185, 9985,  16656, 9980, 16824, 17485, 17666, 17896, 18244, 18250, 18984, 19018, 9979,  19368, 19476, 21336, 21517, 21518, 22468, 22469, 9896,  19325, 23392, 24905, 24974, 25037, 27010, 27385,  24066, 24067, 24154, 24350, 25519, 9977,  16586, 9976,  26597, 26721, 9984,  6749,  27056, 27065, 27068, 27150, 27183, 27194, 27948, 28057, 28690, 28790, 29250, 29251, 29658, 29740, 29906, 29948, 29959, 29967, 35344, 30039, 30155, 30304, 35290, 35291, 30008, 9988);
 
 
/* 
* sql\updates\world\2015_09_21_10_world.sql 
*/ 
-- Hall of Stone formation fixes
UPDATE `creature_formations` SET `angle`=310, `point_1`=1, `point_2`=3 WHERE `leaderGUID`=126709 AND `memberGUID`=126692;
UPDATE `creature_formations` SET `angle`=50, `point_1`=1, `point_2`=3 WHERE `leaderGUID`=126709 AND `memberGUID`=126693;
UPDATE `creature_formations` SET `angle`=310, `point_1`=3, `point_2`=7 WHERE `leaderGUID`=126687 AND `memberGUID`=126705;
UPDATE `creature_formations` SET `angle`=50, `point_1`=3, `point_2`=7 WHERE `leaderGUID`=126687 AND `memberGUID`=126700;
UPDATE `creature_formations` SET `angle`=310, `point_1`=2, `point_2`=6 WHERE `leaderGUID`=126690 AND `memberGUID`=126707;
UPDATE `creature_formations` SET `angle`=50, `point_1`=2, `point_2`=6 WHERE `leaderGUID`=126690 AND `memberGUID`=126701;
UPDATE `creature_formations` SET `angle`=310, `point_1`=4, `point_2`=8 WHERE `leaderGUID`=126695 AND `memberGUID`=126713;
UPDATE `creature_formations` SET `angle`=50, `point_1`=4, `point_2`=8 WHERE `leaderGUID`=126695 AND `memberGUID`=126703;
UPDATE `creature_formations` SET `angle`=50, `point_1`=4, `point_2`=8 WHERE `leaderGUID`=126696 AND `memberGUID`=126714;
UPDATE `creature_formations` SET `angle`=310, `point_1`=4, `point_2`=8 WHERE `leaderGUID`=126696 AND `memberGUID`=126704;
UPDATE `creature_formations` SET `dist`=4, `point_1`=2, `point_2`=4 WHERE `leaderGUID`=126715 AND `memberGUID`=126716;
UPDATE `creature_formations` SET `angle`=310, `point_1`=1, `point_2`=3 WHERE `leaderGUID`=126694 AND `memberGUID`=126711;
UPDATE `creature_formations` SET `angle`=50, `point_1`=1, `point_2`=3 WHERE `leaderGUID`=126694 AND `memberGUID`=126712;
 
 
/* 
* sql\updates\world\2015_09_22_00_world.sql 
*/ 
DELETE FROM `creature_text` WHERE `entry` =23257 and `groupid`=0 and `id` in(7,8,9);
DELETE FROM `creature_text` WHERE `entry` =22982 and `groupid`=0 and `id` in(5,6);

INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 

(23257, 0, 7, 'Well one thing''s for sure, $n''s not a nugget any more!', 12, 0, 100, 0, 0, 0, 21896, 0, 'Skyguard Windcharger'),
(23257, 0, 8, 'Buzz the landing pad lately, $n?', 12, 0, 100, 0, 0, 0, 21889, 0, 'Skyguard Windcharger'),
(23257, 0, 9, 'The list of Skyguard members is long and distinguished.  $n tops that list.', 12, 0, 100, 0, 0, 0, 21939, 0, 'Skyguard Windcharger'),
(22982, 0, 5, 'Well, if it isn''t our resident $g flyboy : flygirl;, $n.  How''s it going, ace?', 12, 0, 100, 0, 0, 0, 21898, 0, 'Skyguard Navigator'),
(22982, 0, 6, 'Hey, it''s our ace flyer, $n!', 12, 0, 100, 0, 0, 0, 21883, 0, 'Skyguard Navigator');
 
 
/* 
* sql\updates\world\2015_09_22_01_world.sql 
*/ 
--
-- Pathing for Death Knight Cavalier Entry: 16163 'TDB FORMAT'
SET @NPC := 127751;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2828.418,`position_y`=-3128.86,`position_z`=273.8336 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,25278,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2828.418,-3128.86,273.8336,0,0,0,0,100,0),
(@PATH,2,2828.67,-3097.49,273.8114,0,0,0,0,100,0),
(@PATH,3,2824.122,-3127.451,273.8372,0,0,0,0,100,0),
(@PATH,4,2813.568,-3143.734,273.8355,0,0,0,0,100,0),
(@PATH,5,2801.097,-3163.161,273.787,0,0,0,0,100,0),
(@PATH,6,2799.644,-3189.22,273.787,0,0,0,0,100,0),
(@PATH,7,2820.002,-3202.299,273.7898,0,0,0,0,100,0),
(@PATH,8,2844.853,-3200.758,273.787,0,0,0,0,100,0),
(@PATH,9,2848.53,-3180.427,273.787,0,0,0,0,100,0),
(@PATH,10,2827.984,-3152.95,273.787,0,0,0,0,100,0);

-- Pathing for Death Knight Cavalier Entry: 16163 'TDB FORMAT'
SET @NPC := 127752;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2831.418,`position_y`=-3128.86,`position_z`=273.8336 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,25278,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2828.418,-3128.86,273.8336,0,0,0,0,100,0),
(@PATH,2,2828.67,-3097.49,273.8114,0,0,0,0,100,0),
(@PATH,3,2824.122,-3127.451,273.8372,0,0,0,0,100,0),
(@PATH,4,2813.568,-3143.734,273.8355,0,0,0,0,100,0),
(@PATH,5,2801.097,-3163.161,273.787,0,0,0,0,100,0),
(@PATH,6,2799.644,-3189.22,273.787,0,0,0,0,100,0),
(@PATH,7,2820.002,-3202.299,273.7898,0,0,0,0,100,0),
(@PATH,8,2844.853,-3200.758,273.787,0,0,0,0,100,0),
(@PATH,9,2848.53,-3180.427,273.787,0,0,0,0,100,0),
(@PATH,10,2827.984,-3152.95,273.787,0,0,0,0,100,0);

-- Pathing for Death Knight Cavalier Entry: 16163 'TDB FORMAT' 
SET @NPC := 127746; -- 127747
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2561.589,`position_y`=-3158.63,`position_z`=240.5253 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,25278,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2561.589,-3158.63,240.5253,0,0,0,0,100,0), -- 00:55:40
(@PATH,2,2577.802,-3151.077,240.5241,0,0,0,0,100,0), -- 00:55:45
(@PATH,3,2585.239,-3138.162,240.5253,0,0,0,0,100,0), -- 00:55:52
(@PATH,4,2585.295,-3121.586,240.5244,0,0,0,0,100,0), -- 00:55:58
(@PATH,5,2580.453,-3111.228,240.5249,0,0,0,0,100,0), -- 00:56:05
(@PATH,6,2584.915,-3101.806,240.5252,0,0,0,0,100,0), -- 00:56:09
(@PATH,7,2608.073,-3078.412,240.5271,0,0,0,0,100,0), -- 00:56:14
(@PATH,8,2627.942,-3058.567,240.5237,0,0,0,0,100,0), -- 00:56:27
(@PATH,9,2645.011,-3041.33,240.523,0,0,0,0,100,0), -- 00:56:38
(@PATH,10,2664.399,-3022.119,240.5253,0,0,0,0,100,0), -- 00:56:47
(@PATH,11,2673.592,-3015.558,240.5253,0,0,0,0,100,0), -- 00:56:58
(@PATH,12,2692.232,-3014.315,240.5253,0,0,0,0,100,0), -- 00:57:02
(@PATH,13,2715.057,-3011.801,240.5254,0,0,0,0,100,0), -- 00:57:10
(@PATH,14,2728.214,-2992.568,240.5253,0,0,0,0,100,0), -- 00:57:19
(@PATH,15,2725.241,-2970.892,240.5249,0,0,0,0,100,0), -- 00:57:29
(@PATH,16,2710.557,-2958.161,240.5251,0,0,0,0,100,0), -- 00:57:38
(@PATH,17,2685.363,-2959.393,240.5253,0,0,0,0,100,0), -- 00:57:45
(@PATH,18,2671.24,-2977.426,240.5248,0,0,0,0,100,0), -- 00:57:56
(@PATH,19,2671.708,-2994.812,240.5246,0,0,0,0,100,0), -- 00:58:04
(@PATH,20,2670.703,-3012.506,240.5252,0,0,0,0,100,0), -- 00:58:12
(@PATH,21,2663.621,-3021.305,240.5253,0,0,0,0,100,0), -- 00:58:19
(@PATH,22,2644.285,-3041.24,240.523,0,0,0,0,100,0), -- 00:58:24
(@PATH,23,2627.018,-3058.662,240.5237,0,0,0,0,100,0), -- 00:58:35
(@PATH,24,2607.562,-3078.047,240.5271,0,0,0,0,100,0), -- 00:58:44
(@PATH,25,2583.966,-3101.257,240.5253,0,0,0,0,100,0), -- 00:58:55
(@PATH,26,2575.257,-3105.696,240.5253,0,0,0,0,100,0), -- 00:59:08
(@PATH,27,2561.672,-3099.622,240.5251,0,0,0,0,100,0), -- 00:59:11
(@PATH,28,2542.95,-3102.525,240.5249,0,0,0,0,100,0), -- 00:59:17
(@PATH,29,2529.021,-3116.719,240.5249,0,0,0,0,100,0), -- 00:59:26
(@PATH,30,2527.216,-3133.08,240.5253,0,0,0,0,100,0), -- 00:59:33
(@PATH,31,2530.838,-3143.624,240.5245,0,0,0,0,100,0), -- 00:59:40
(@PATH,32,2537.175,-3152.094,240.524,0,0,0,0,100,0), -- 00:59:44
(@PATH,33,2547.807,-3157.692,240.5253,0,0,0,0,100,0); -- 00:59:49

-- Pathing for Death Knight Cavalier Entry: 16163 'TDB FORMAT' 
SET @NPC := 127747; -- 127746
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2561.589,`position_y`=-3158.63,`position_z`=240.5253 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,25278,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2561.589,-3158.63,240.5253,0,0,0,0,100,0), -- 00:55:40
(@PATH,2,2577.802,-3151.077,240.5241,0,0,0,0,100,0), -- 00:55:45
(@PATH,3,2585.239,-3138.162,240.5253,0,0,0,0,100,0), -- 00:55:52
(@PATH,4,2585.295,-3121.586,240.5244,0,0,0,0,100,0), -- 00:55:58
(@PATH,5,2580.453,-3111.228,240.5249,0,0,0,0,100,0), -- 00:56:05
(@PATH,6,2584.915,-3101.806,240.5252,0,0,0,0,100,0), -- 00:56:09
(@PATH,7,2608.073,-3078.412,240.5271,0,0,0,0,100,0), -- 00:56:14
(@PATH,8,2627.942,-3058.567,240.5237,0,0,0,0,100,0), -- 00:56:27
(@PATH,9,2645.011,-3041.33,240.523,0,0,0,0,100,0), -- 00:56:38
(@PATH,10,2664.399,-3022.119,240.5253,0,0,0,0,100,0), -- 00:56:47
(@PATH,11,2673.592,-3015.558,240.5253,0,0,0,0,100,0), -- 00:56:58
(@PATH,12,2692.232,-3014.315,240.5253,0,0,0,0,100,0), -- 00:57:02
(@PATH,13,2715.057,-3011.801,240.5254,0,0,0,0,100,0), -- 00:57:10
(@PATH,14,2728.214,-2992.568,240.5253,0,0,0,0,100,0), -- 00:57:19
(@PATH,15,2725.241,-2970.892,240.5249,0,0,0,0,100,0), -- 00:57:29
(@PATH,16,2710.557,-2958.161,240.5251,0,0,0,0,100,0), -- 00:57:38
(@PATH,17,2685.363,-2959.393,240.5253,0,0,0,0,100,0), -- 00:57:45
(@PATH,18,2671.24,-2977.426,240.5248,0,0,0,0,100,0), -- 00:57:56
(@PATH,19,2671.708,-2994.812,240.5246,0,0,0,0,100,0), -- 00:58:04
(@PATH,20,2670.703,-3012.506,240.5252,0,0,0,0,100,0), -- 00:58:12
(@PATH,21,2663.621,-3021.305,240.5253,0,0,0,0,100,0), -- 00:58:19
(@PATH,22,2644.285,-3041.24,240.523,0,0,0,0,100,0), -- 00:58:24
(@PATH,23,2627.018,-3058.662,240.5237,0,0,0,0,100,0), -- 00:58:35
(@PATH,24,2607.562,-3078.047,240.5271,0,0,0,0,100,0), -- 00:58:44
(@PATH,25,2583.966,-3101.257,240.5253,0,0,0,0,100,0), -- 00:58:55
(@PATH,26,2575.257,-3105.696,240.5253,0,0,0,0,100,0), -- 00:59:08
(@PATH,27,2561.672,-3099.622,240.5251,0,0,0,0,100,0), -- 00:59:11
(@PATH,28,2542.95,-3102.525,240.5249,0,0,0,0,100,0), -- 00:59:17
(@PATH,29,2529.021,-3116.719,240.5249,0,0,0,0,100,0), -- 00:59:26
(@PATH,30,2527.216,-3133.08,240.5253,0,0,0,0,100,0), -- 00:59:33
(@PATH,31,2530.838,-3143.624,240.5245,0,0,0,0,100,0), -- 00:59:40
(@PATH,32,2537.175,-3152.094,240.524,0,0,0,0,100,0), -- 00:59:44
(@PATH,33,2547.807,-3157.692,240.5253,0,0,0,0,100,0); -- 00:59:49

-- Pathing for Death Knight Cavalier Entry: 16163 'TDB FORMAT' 
SET @NPC := 127748;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2529.461,`position_y`=-3350.972,`position_z`=267.5927 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,25278,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2529.461,-3350.972,267.5927,0,0,0,0,100,0), -- 00:55:41
(@PATH,2,2530.323,-3325.176,267.5925,0,0,0,0,100,0), -- 00:55:47
(@PATH,3,2543.675,-3311.973,267.593,0,0,0,0,100,0), -- 00:55:58
(@PATH,4,2556.406,-3299.54,267.593,0,0,0,0,100,0), -- 00:56:05
(@PATH,5,2555.974,-3276.286,267.5939,0,0,0,0,100,0), -- 00:56:13
(@PATH,6,2556.132,-3255.743,258.8458,0,0,0,0,100,0), -- 00:56:21
(@PATH,7,2556.734,-3215.111,240.5262,0,0,0,0,100,0), -- 00:56:31
(@PATH,8,2556.227,-3191.951,240.5252,0,0,0,0,100,0), -- 00:56:49
(@PATH,9,2556.103,-3169.521,240.5253,0,0,0,0,100,0), -- 00:56:58
(@PATH,10,2544.249,-3156.771,240.5248,0,0,0,0,100,0), -- 00:57:07
(@PATH,11,2530.144,-3142.768,240.5245,0,0,0,0,100,0), -- 00:57:13
(@PATH,12,2526.182,-3127.083,240.5254,0,0,0,0,100,0), -- 00:57:22
(@PATH,13,2529.482,-3115.22,240.5248,0,0,0,0,100,0), -- 00:57:28
(@PATH,14,2541.532,-3103.333,240.5248,0,0,0,0,100,0), -- 00:57:33
(@PATH,15,2554.839,-3099.154,240.5252,0,0,0,0,100,0), -- 00:57:40
(@PATH,16,2573.704,-3104.429,240.5253,0,0,0,0,100,0), -- 00:57:45
(@PATH,17,2584.594,-3120.166,240.5245,0,0,0,0,100,0), -- 00:57:53
(@PATH,18,2579.713,-3142.299,240.5249,0,0,0,0,100,0), -- 00:58:01
(@PATH,19,2568.922,-3153.001,240.5249,0,0,0,0,100,0), -- 00:58:10
(@PATH,20,2556.966,-3168.974,240.5253,0,0,0,0,100,0), -- 00:58:16
(@PATH,21,2556.745,-3191.808,240.5251,0,0,0,0,100,0), -- 00:58:24
(@PATH,22,2556.038,-3215.004,240.5273,0,0,0,0,100,0), -- 00:58:33
(@PATH,23,2555.711,-3255.515,258.7258,0,0,0,0,100,0), -- 00:58:42
(@PATH,24,2555.592,-3276.532,267.5936,0,0,0,0,100,0), -- 00:59:00
(@PATH,25,2556.91,-3299.243,267.5934,0,0,0,0,100,0), -- 00:59:10
(@PATH,26,2565.721,-3309.663,267.5924,0,0,0,0,100,0), -- 00:59:18
(@PATH,27,2580.893,-3321.083,267.5922,0,0,0,0,100,0), -- 00:59:23
(@PATH,28,2586.392,-3342.971,267.5935,0,0,0,0,100,0), -- 00:59:32
(@PATH,29,2578.376,-3360.212,267.5924,0,0,0,0,100,0), -- 00:59:40
(@PATH,30,2556.463,-3369.452,267.593,0,0,0,0,100,0), -- 00:59:47
(@PATH,31,2538.893,-3363.072,267.592,0,0,0,0,100,0); -- 00:59:57
-- 0x1C2F4042A00FC8C0004C5C00017F5587 .go 2529.461 -3350.972 267.5927

-- Pathing for Death Knight Cavalier Entry: 16163 'TDB FORMAT' 
SET @NPC := 127749;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2529.461,`position_y`=-3350.972,`position_z`=267.5927 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,25278,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2529.461,-3350.972,267.5927,0,0,0,0,100,0), -- 00:55:41
(@PATH,2,2530.323,-3325.176,267.5925,0,0,0,0,100,0), -- 00:55:47
(@PATH,3,2543.675,-3311.973,267.593,0,0,0,0,100,0), -- 00:55:58
(@PATH,4,2556.406,-3299.54,267.593,0,0,0,0,100,0), -- 00:56:05
(@PATH,5,2555.974,-3276.286,267.5939,0,0,0,0,100,0), -- 00:56:13
(@PATH,6,2556.132,-3255.743,258.8458,0,0,0,0,100,0), -- 00:56:21
(@PATH,7,2556.734,-3215.111,240.5262,0,0,0,0,100,0), -- 00:56:31
(@PATH,8,2556.227,-3191.951,240.5252,0,0,0,0,100,0), -- 00:56:49
(@PATH,9,2556.103,-3169.521,240.5253,0,0,0,0,100,0), -- 00:56:58
(@PATH,10,2544.249,-3156.771,240.5248,0,0,0,0,100,0), -- 00:57:07
(@PATH,11,2530.144,-3142.768,240.5245,0,0,0,0,100,0), -- 00:57:13
(@PATH,12,2526.182,-3127.083,240.5254,0,0,0,0,100,0), -- 00:57:22
(@PATH,13,2529.482,-3115.22,240.5248,0,0,0,0,100,0), -- 00:57:28
(@PATH,14,2541.532,-3103.333,240.5248,0,0,0,0,100,0), -- 00:57:33
(@PATH,15,2554.839,-3099.154,240.5252,0,0,0,0,100,0), -- 00:57:40
(@PATH,16,2573.704,-3104.429,240.5253,0,0,0,0,100,0), -- 00:57:45
(@PATH,17,2584.594,-3120.166,240.5245,0,0,0,0,100,0), -- 00:57:53
(@PATH,18,2579.713,-3142.299,240.5249,0,0,0,0,100,0), -- 00:58:01
(@PATH,19,2568.922,-3153.001,240.5249,0,0,0,0,100,0), -- 00:58:10
(@PATH,20,2556.966,-3168.974,240.5253,0,0,0,0,100,0), -- 00:58:16
(@PATH,21,2556.745,-3191.808,240.5251,0,0,0,0,100,0), -- 00:58:24
(@PATH,22,2556.038,-3215.004,240.5273,0,0,0,0,100,0), -- 00:58:33
(@PATH,23,2555.711,-3255.515,258.7258,0,0,0,0,100,0), -- 00:58:42
(@PATH,24,2555.592,-3276.532,267.5936,0,0,0,0,100,0), -- 00:59:00
(@PATH,25,2556.91,-3299.243,267.5934,0,0,0,0,100,0), -- 00:59:10
(@PATH,26,2565.721,-3309.663,267.5924,0,0,0,0,100,0), -- 00:59:18
(@PATH,27,2580.893,-3321.083,267.5922,0,0,0,0,100,0), -- 00:59:23
(@PATH,28,2586.392,-3342.971,267.5935,0,0,0,0,100,0), -- 00:59:32
(@PATH,29,2578.376,-3360.212,267.5924,0,0,0,0,100,0), -- 00:59:40
(@PATH,30,2556.463,-3369.452,267.593,0,0,0,0,100,0), -- 00:59:47
(@PATH,31,2538.893,-3363.072,267.592,0,0,0,0,100,0); -- 00:59:57

-- Pathing for Death Knight Cavalier Entry: 16163 'TDB FORMAT'
SET @NPC := 127753;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2907.542,`position_y`=-3166.655,`position_z`=273.787 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,25278,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2907.542,-3166.655,273.787,0,0,0,0,100,0), -- 00:46:47
(@PATH,2,2873.219,-3165.419,273.787,0,0,0,0,100,0), -- 00:46:54
(@PATH,3,2861.632,-3165.088,273.787,0,0,0,0,100,0), -- 00:47:09
(@PATH,4,2860.526,-3185.717,273.787,0,0,0,0,100,0), -- 00:47:13
(@PATH,5,2860.435,-3203.401,273.787,0,0,0,0,100,0), -- 00:47:21
(@PATH,6,2875.204,-3203.906,273.4088,0,0,0,0,100,0), -- 00:47:28
(@PATH,7,2892.834,-3204.38,273.3965,0,0,0,0,100,0), -- 00:47:34
(@PATH,8,2911.993,-3204.611,273.3846,0,0,0,0,100,0), -- 00:47:42
(@PATH,9,2926.023,-3200.403,273.3712,0,0,0,0,100,0), -- 00:47:49
(@PATH,10,2931.457,-3188.328,273.3712,0,0,0,0,100,0), -- 00:47:55
(@PATH,11,2925.778,-3167.298,273.787,0,0,0,0,100,0); -- 00:48:00

-- Pathing for Death Knight Cavalier Entry: 16163 'TDB FORMAT'
SET @NPC := 127743;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2907.542,`position_y`=-3171.655,`position_z`=273.787 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,25278,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2907.542,-3166.655,273.787,0,0,0,0,100,0), -- 00:46:47
(@PATH,2,2873.219,-3165.419,273.787,0,0,0,0,100,0), -- 00:46:54
(@PATH,3,2861.632,-3165.088,273.787,0,0,0,0,100,0), -- 00:47:09
(@PATH,4,2860.526,-3185.717,273.787,0,0,0,0,100,0), -- 00:47:13
(@PATH,5,2860.435,-3203.401,273.787,0,0,0,0,100,0), -- 00:47:21
(@PATH,6,2875.204,-3203.906,273.4088,0,0,0,0,100,0), -- 00:47:28
(@PATH,7,2892.834,-3204.38,273.3965,0,0,0,0,100,0), -- 00:47:34
(@PATH,8,2911.993,-3204.611,273.3846,0,0,0,0,100,0), -- 00:47:42
(@PATH,9,2926.023,-3200.403,273.3712,0,0,0,0,100,0), -- 00:47:49
(@PATH,10,2931.457,-3188.328,273.3712,0,0,0,0,100,0), -- 00:47:55
(@PATH,11,2925.778,-3167.298,273.787,0,0,0,0,100,0); -- 00:48:00

-- Pathing for Death Knight Cavalier Entry: 16163 'TDB FORMAT'
SET @NPC := 127742;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2787.931,`position_y`=-3363.628,`position_z`=267.6847 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,25278,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2787.931,-3363.628,267.6847,0,0,0,0,100,0),
(@PATH,2,2787.864,-3320.595,267.6845,0,0,0,0,100,0),
(@PATH,3,2787.388,-3287.191,267.6845,0,0,0,0,100,0),
(@PATH,4,2787.864,-3320.595,267.6845,0,0,0,0,100,0);

-- Pathing for Death Knight Cavalier Entry: 16163 'TDB FORMAT'
SET @NPC := 127754;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2790.931,`position_y`=-3363.628,`position_z`=267.6847 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,25278,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2787.931,-3363.628,267.6847,0,0,0,0,100,0),
(@PATH,2,2787.864,-3320.595,267.6845,0,0,0,0,100,0),
(@PATH,3,2787.388,-3287.191,267.6845,0,0,0,0,100,0),
(@PATH,4,2787.864,-3320.595,267.6845,0,0,0,0,100,0);

-- Pathing for Death Knight Cavalier Entry: 16163 'TDB FORMAT'
SET @NPC := 127745;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2910.233,`position_y`=-2955.379,`position_z`=267.593 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,25278,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2910.233,-2955.379,267.593,0,0,0,0,100,0), -- 00:55:44
(@PATH,2,2892.628,-2961.647,267.5928,0,0,0,0,100,0), -- 00:55:51
(@PATH,3,2884.039,-2971.864,267.5928,0,0,0,0,100,0), -- 00:56:00
(@PATH,4,2870.617,-2985.568,267.593,0,0,0,0,100,0), -- 00:56:05
(@PATH,5,2847.519,-2985.616,267.5938,0,0,0,0,100,0), -- 00:56:17
(@PATH,6,2831.011,-2985.781,260.82,0,0,0,0,100,0), -- 00:56:26
(@PATH,7,2811.443,-2985.972,250.9583,0,0,0,0,100,0), -- 00:56:34
(@PATH,8,2781.199,-2986.169,240.5266,0,0,0,0,100,0), -- 00:56:42
(@PATH,9,2763.189,-2986.039,240.5251,0,0,0,0,100,0), -- 00:56:54
(@PATH,10,2744.237,-2985.519,240.5253,0,0,0,0,100,0), -- 00:57:02
(@PATH,11,2734.137,-2977.427,240.5253,0,0,0,0,100,0), -- 00:57:10
(@PATH,12,2722.754,-2967.005,240.5245,0,0,0,0,100,0), -- 00:57:15
(@PATH,13,2708.031,-2957.228,240.5251,0,0,0,0,100,0), -- 00:57:21
(@PATH,14,2691.098,-2957.404,240.525,0,0,0,0,100,0), -- 00:57:28
(@PATH,15,2676.669,-2966.855,240.5253,0,0,0,0,100,0), -- 00:57:34
(@PATH,16,2671.321,-2976.635,240.5248,0,0,0,0,100,0), -- 00:57:42
(@PATH,17,2671.421,-2993.49,240.5246,0,0,0,0,100,0), -- 00:57:47
(@PATH,18,2680.976,-3008.883,240.5253,0,0,0,0,100,0), -- 00:57:53
(@PATH,19,2697.444,-3015.56,240.5247,0,0,0,0,100,0), -- 00:58:00
(@PATH,20,2713.618,-3012.186,240.5255,0,0,0,0,100,0), -- 00:58:07
(@PATH,21,2724.357,-3002.94,240.5247,0,0,0,0,100,0), -- 00:58:14
(@PATH,22,2734.208,-2991.862,240.5253,0,0,0,0,100,0), -- 00:58:19
(@PATH,23,2743.945,-2987.434,240.5253,0,0,0,0,100,0), -- 00:58:25
(@PATH,24,2763.65,-2986.421,240.5252,0,0,0,0,100,0), -- 00:58:30
(@PATH,25,2781.449,-2986.182,240.5266,0,0,0,0,100,0), -- 00:58:37
(@PATH,26,2811.903,-2985.583,251.1997,0,0,0,0,100,0), -- 00:58:45
(@PATH,27,2830.531,-2985.851,260.8194,0,0,0,0,100,0), -- 00:58:58
(@PATH,28,2847.362,-2985.841,267.5938,0,0,0,0,100,0), -- 00:59:07
(@PATH,29,2870.534,-2986.177,267.593,0,0,0,0,100,0), -- 00:59:14
(@PATH,30,2882.414,-2997.007,267.593,0,0,0,0,100,0), -- 00:59:22
(@PATH,31,2895.966,-3012.106,267.5926,0,0,0,0,100,0), -- 00:59:30
(@PATH,32,2915.716,-3014.353,267.5935,0,0,0,0,100,0), -- 00:59:37
(@PATH,33,2931.21,-3007.478,267.5931,0,0,0,0,100,0), -- 00:59:45
(@PATH,34,2938.199,-2994.229,267.5933,0,0,0,0,100,0), -- 00:59:53
(@PATH,35,2937.735,-2977.154,267.593,0,0,0,0,100,0), -- 00:59:59
(@PATH,36,2927.648,-2962.08,267.5935,0,0,0,0,100,0); -- 01:00:05

-- Pathing for Death Knight Cavalier Entry: 16163 'TDB FORMAT'
SET @NPC := 127744;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2910.233,`position_y`=-2955.379,`position_z`=267.593 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,25278,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2910.233,-2955.379,267.593,0,0,0,0,100,0), -- 00:55:44
(@PATH,2,2892.628,-2961.647,267.5928,0,0,0,0,100,0), -- 00:55:51
(@PATH,3,2884.039,-2971.864,267.5928,0,0,0,0,100,0), -- 00:56:00
(@PATH,4,2870.617,-2985.568,267.593,0,0,0,0,100,0), -- 00:56:05
(@PATH,5,2847.519,-2985.616,267.5938,0,0,0,0,100,0), -- 00:56:17
(@PATH,6,2831.011,-2985.781,260.82,0,0,0,0,100,0), -- 00:56:26
(@PATH,7,2811.443,-2985.972,250.9583,0,0,0,0,100,0), -- 00:56:34
(@PATH,8,2781.199,-2986.169,240.5266,0,0,0,0,100,0), -- 00:56:42
(@PATH,9,2763.189,-2986.039,240.5251,0,0,0,0,100,0), -- 00:56:54
(@PATH,10,2744.237,-2985.519,240.5253,0,0,0,0,100,0), -- 00:57:02
(@PATH,11,2734.137,-2977.427,240.5253,0,0,0,0,100,0), -- 00:57:10
(@PATH,12,2722.754,-2967.005,240.5245,0,0,0,0,100,0), -- 00:57:15
(@PATH,13,2708.031,-2957.228,240.5251,0,0,0,0,100,0), -- 00:57:21
(@PATH,14,2691.098,-2957.404,240.525,0,0,0,0,100,0), -- 00:57:28
(@PATH,15,2676.669,-2966.855,240.5253,0,0,0,0,100,0), -- 00:57:34
(@PATH,16,2671.321,-2976.635,240.5248,0,0,0,0,100,0), -- 00:57:42
(@PATH,17,2671.421,-2993.49,240.5246,0,0,0,0,100,0), -- 00:57:47
(@PATH,18,2680.976,-3008.883,240.5253,0,0,0,0,100,0), -- 00:57:53
(@PATH,19,2697.444,-3015.56,240.5247,0,0,0,0,100,0), -- 00:58:00
(@PATH,20,2713.618,-3012.186,240.5255,0,0,0,0,100,0), -- 00:58:07
(@PATH,21,2724.357,-3002.94,240.5247,0,0,0,0,100,0), -- 00:58:14
(@PATH,22,2734.208,-2991.862,240.5253,0,0,0,0,100,0), -- 00:58:19
(@PATH,23,2743.945,-2987.434,240.5253,0,0,0,0,100,0), -- 00:58:25
(@PATH,24,2763.65,-2986.421,240.5252,0,0,0,0,100,0), -- 00:58:30
(@PATH,25,2781.449,-2986.182,240.5266,0,0,0,0,100,0), -- 00:58:37
(@PATH,26,2811.903,-2985.583,251.1997,0,0,0,0,100,0), -- 00:58:45
(@PATH,27,2830.531,-2985.851,260.8194,0,0,0,0,100,0), -- 00:58:58
(@PATH,28,2847.362,-2985.841,267.5938,0,0,0,0,100,0), -- 00:59:07
(@PATH,29,2870.534,-2986.177,267.593,0,0,0,0,100,0), -- 00:59:14
(@PATH,30,2882.414,-2997.007,267.593,0,0,0,0,100,0), -- 00:59:22
(@PATH,31,2895.966,-3012.106,267.5926,0,0,0,0,100,0), -- 00:59:30
(@PATH,32,2915.716,-3014.353,267.5935,0,0,0,0,100,0), -- 00:59:37
(@PATH,33,2931.21,-3007.478,267.5931,0,0,0,0,100,0), -- 00:59:45
(@PATH,34,2938.199,-2994.229,267.5933,0,0,0,0,100,0), -- 00:59:53
(@PATH,35,2937.735,-2977.154,267.593,0,0,0,0,100,0), -- 00:59:59
(@PATH,36,2927.648,-2962.08,267.5935,0,0,0,0,100,0); -- 01:00:05

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127751,127752,127746,127747,127748,127749,127753,127743,127742,127754,127744,127745);
DELETE FROM `creature_formations` WHERE `memberGUID` IN (127751,127752,127746,127747,127748,127749,127753,127743,127742,127754,127744,127745);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127751,127751,0,0,2,0,0),
(127751,127752,3,90,2,2,0),
(127746,127746,0,0,2,0,0),
(127746,127747,3,270,2,0,0),
(127748,127748,0,0,2,0,0),
(127748,127749,3,270,2,0,0),
(127753,127753,0,0,2,0,0),
(127753,127743,3,270,2,0,0),
(127742,127742,0,0,2,0,0),
(127742,127754,3,270,2,1,3),
(127744,127744,0,0,2,0,0),
(127744,127745,3,270,2,0,0);

-- Pathing for Death Knight Entry: 16146 'TDB FORMAT' 
SET @NPC := 127668;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2828.432,`position_y`=-3176.265,`position_z`=298.1476 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2828.432,-3176.265,298.1476,0,0,0,0,100,0), -- 00:46:45
(@PATH,2,2839.448,-3185.542,298.1487,0,0,0,0,100,0), -- 00:46:49
(@PATH,3,2848.306,-3195.512,298.1775,0,0,0,0,100,0), -- 00:46:54
(@PATH,4,2860.46,-3207.91,298.1058,0,0,0,0,100,0), -- 00:46:58
(@PATH,5,2871.515,-3216.969,298.1441,0,0,0,0,100,0), -- 00:47:02
(@PATH,6,2886.36,-3218.305,298.146,0,0,0,0,100,0), -- 00:47:07
(@PATH,7,2871.515,-3216.969,298.1441,0,0,0,0,100,0), -- 00:47:13
(@PATH,8,2860.46,-3207.91,298.1058,0,0,0,0,100,0), -- 00:47:17
(@PATH,9,2848.306,-3195.512,298.1775,0,0,0,0,100,0), -- 00:47:22
(@PATH,10,2839.448,-3185.542,298.1487,0,0,0,0,100,0), -- 00:47:27
(@PATH,11,2828.432,-3176.265,298.1476,0,0,0,0,100,0), -- 00:47:30
(@PATH,12,2813.296,-3175.835,298.1458,0,0,0,0,100,0), -- 00:47:35
(@PATH,13,2790.895,-3179.5,298.1464,0,0,0,0,100,0), -- 00:47:40
(@PATH,14,2813.296,-3175.835,298.1458,0,0,0,0,100,0); -- 00:47:49

-- Pathing for Dark Touched Warrior Entry: 16156 'TDB FORMAT' 
SET @NPC := 127699;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2830.432,`position_y`=-3173.265,`position_z`=298.1476 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2828.432,-3176.265,298.1476,0,0,0,0,100,0), -- 00:46:45
(@PATH,2,2839.448,-3185.542,298.1487,0,0,0,0,100,0), -- 00:46:49
(@PATH,3,2848.306,-3195.512,298.1775,0,0,0,0,100,0), -- 00:46:54
(@PATH,4,2860.46,-3207.91,298.1058,0,0,0,0,100,0), -- 00:46:58
(@PATH,5,2871.515,-3216.969,298.1441,0,0,0,0,100,0), -- 00:47:02
(@PATH,6,2886.36,-3218.305,298.146,0,0,0,0,100,0), -- 00:47:07
(@PATH,7,2871.515,-3216.969,298.1441,0,0,0,0,100,0), -- 00:47:13
(@PATH,8,2860.46,-3207.91,298.1058,0,0,0,0,100,0), -- 00:47:17
(@PATH,9,2848.306,-3195.512,298.1775,0,0,0,0,100,0), -- 00:47:22
(@PATH,10,2839.448,-3185.542,298.1487,0,0,0,0,100,0), -- 00:47:27
(@PATH,11,2828.432,-3176.265,298.1476,0,0,0,0,100,0), -- 00:47:30
(@PATH,12,2813.296,-3175.835,298.1458,0,0,0,0,100,0), -- 00:47:35
(@PATH,13,2790.895,-3179.5,298.1464,0,0,0,0,100,0), -- 00:47:40
(@PATH,14,2813.296,-3175.835,298.1458,0,0,0,0,100,0); -- 00:47:49

-- Pathing for Dark Touched Warrior Entry: 16156 'TDB FORMAT' 
SET @NPC := 127700;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2827.432,`position_y`=-3178.265,`position_z`=298.1476 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2828.432,-3176.265,298.1476,0,0,0,0,100,0), -- 00:46:45
(@PATH,2,2839.448,-3185.542,298.1487,0,0,0,0,100,0), -- 00:46:49
(@PATH,3,2848.306,-3195.512,298.1775,0,0,0,0,100,0), -- 00:46:54
(@PATH,4,2860.46,-3207.91,298.1058,0,0,0,0,100,0), -- 00:46:58
(@PATH,5,2871.515,-3216.969,298.1441,0,0,0,0,100,0), -- 00:47:02
(@PATH,6,2886.36,-3218.305,298.146,0,0,0,0,100,0), -- 00:47:07
(@PATH,7,2871.515,-3216.969,298.1441,0,0,0,0,100,0), -- 00:47:13
(@PATH,8,2860.46,-3207.91,298.1058,0,0,0,0,100,0), -- 00:47:17
(@PATH,9,2848.306,-3195.512,298.1775,0,0,0,0,100,0), -- 00:47:22
(@PATH,10,2839.448,-3185.542,298.1487,0,0,0,0,100,0), -- 00:47:27
(@PATH,11,2828.432,-3176.265,298.1476,0,0,0,0,100,0), -- 00:47:30
(@PATH,12,2813.296,-3175.835,298.1458,0,0,0,0,100,0), -- 00:47:35
(@PATH,13,2790.895,-3179.5,298.1464,0,0,0,0,100,0), -- 00:47:40
(@PATH,14,2813.296,-3175.835,298.1458,0,0,0,0,100,0); -- 00:47:49

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127668);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127668,127668,0,0,2,0,0),
(127668,127699,3,270,2,5,12),
(127668,127700,3,90,2,5,12);

-- Pathing for Death Knight Captain Entry: 16145 'TDB FORMAT' 
SET @NPC := 127647;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2863.143,`position_y`=-3303.327,`position_z`=298.1498 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2863.593,-3303.907,298.1498,0,0,0,0,100,0), -- 00:46:45
(@PATH,2,2869.523,-3320.972,298.1457,0,0,0,0,100,0), -- 00:46:50
(@PATH,3,2883.242,-3330.484,298.1457,0,0,0,0,100,0), -- 00:46:56
(@PATH,4,2869.523,-3320.972,298.1457,0,0,0,0,100,0), -- 00:47:03
(@PATH,5,2863.593,-3303.907,298.1498,0,0,0,0,100,0), -- 00:47:07
(@PATH,6,2865.348,-3285.952,298.0973,0,0,0,0,100,0), -- 00:47:12
(@PATH,7,2874.288,-3265.404,298.1561,0,0,0,0,100,0), -- 00:47:18
(@PATH,8,2865.348,-3285.952,298.0973,0,0,0,0,100,0); -- 00:47:27

-- Pathing for Death Knight Captain Entry: 16145 'TDB FORMAT' 
SET @NPC := 127648;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2867.593,`position_y`=-3304.907,`position_z`=298.1498 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2863.593,-3303.907,298.1498,0,0,0,0,100,0), -- 00:46:45
(@PATH,2,2869.523,-3320.972,298.1457,0,0,0,0,100,0), -- 00:46:50
(@PATH,3,2883.242,-3330.484,298.1457,0,0,0,0,100,0), -- 00:46:56
(@PATH,4,2869.523,-3320.972,298.1457,0,0,0,0,100,0), -- 00:47:03
(@PATH,5,2863.593,-3303.907,298.1498,0,0,0,0,100,0), -- 00:47:07
(@PATH,6,2865.348,-3285.952,298.0973,0,0,0,0,100,0), -- 00:47:12
(@PATH,7,2874.288,-3265.404,298.1561,0,0,0,0,100,0), -- 00:47:18
(@PATH,8,2865.348,-3285.952,298.0973,0,0,0,0,100,0); -- 00:47:27

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127647);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127647,127647,0,0,2,0,0),
(127647,127648,4,270,2,2,6);

-- Pathing for Shade of Naxxramas Entry: 16164 'TDB FORMAT' 
SET @NPC := 127755;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2915.294,`position_y`=-3343.234,`position_z`=298.1457 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2915.294,-3343.234,298.1457,0,9000,0,0,100,0),
(@PATH,2,2898.639,-3327.008,298.1457,0,9000,0,0,100,0);

UPDATE `creature` SET `orientation`=5.51352 WHERE `guid` IN (127755,127758,127759);
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127755);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127755,127755,0,0,2,0,0),
(127755,127758,2,360,2,1,2),
(127755,127759,2,180,2,1,2);

UPDATE `creature` SET `modelid`=0 WHERE `id` IN (16145,16146,16156,16163);

-- Pathing for Unholy Staff Entry: 16215 'TDB FORMAT' 
SET @NPC := 127816;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2724.483,`position_y`=-3142.47,`position_z`=267.6181 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2724.483,-3142.47,267.6181,0,0,0,0,100,0), -- 00:55:47
(@PATH,2,2740.318,-3170.808,267.576,0,0,0,0,100,0); -- 00:56:00

-- Pathing for Unholy Staff Entry: 16215 'TDB FORMAT' 
SET @NPC := 127817;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2721.483,`position_y`=-3144.47,`position_z`=267.6181 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2724.483,-3142.47,267.6181,0,0,0,0,100,0), -- 00:55:47
(@PATH,2,2740.318,-3170.808,267.576,0,0,0,0,100,0); -- 00:56:00

-- Pathing for Unholy Staff Entry: 16215 'TDB FORMAT' 
SET @NPC := 127819;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2687.124,`position_y`=-3143.13,`position_z`=267.6205 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2687.124,-3143.13,267.6205,0,0,0,0,100,0), -- 00:55:49
(@PATH,2,2667.474,-3173.004,267.634,0,0,0,0,100,0); -- 00:56:04

-- Pathing for Unholy Staff Entry: 16215 'TDB FORMAT' 
SET @NPC := 127820;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2684.124,`position_y`=-3142.13,`position_z`=267.6205 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2687.124,-3143.13,267.6205,0,0,0,0,100,0), -- 00:55:49
(@PATH,2,2667.474,-3173.004,267.634,0,0,0,0,100,0); -- 00:56:04

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127816,127819);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127816,127816,0,0,2,0,0),
(127816,127817,3,270,2,1,2),
(127819,127819,0,0,2,0,0),
(127819,127820,3,270,2,1,2);

-- Pathing for Unholy Axe Entry: 16194 'TDB FORMAT' 
SET @NPC := 127796;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2690.577,`position_y`=-3156.689,`position_z`=267.6078 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2690.577,-3156.689,267.6078,0,0,0,0,100,0), -- 00:55:41
(@PATH,2,2706.089,-3166.321,267.5782,0,0,0,0,100,0), -- 00:55:49
(@PATH,3,2721.288,-3159.098,267.5903,0,0,0,0,100,0), -- 00:55:56
(@PATH,4,2723.902,-3133.336,267.6333,0,0,0,0,100,0), -- 00:56:04
(@PATH,5,2706.458,-3124.162,267.6098,0,0,0,0,100,0), -- 00:56:13
(@PATH,6,2688.671,-3133.302,267.6201,0,0,0,0,100,0); -- 00:56:22

-- Pathing for Unholy Axe Entry: 16194 'TDB FORMAT' 
SET @NPC := 127797;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2693.577,`position_y`=-3154.689,`position_z`=267.6078 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2690.577,-3156.689,267.6078,0,0,0,0,100,0), -- 00:55:41
(@PATH,2,2706.089,-3166.321,267.5782,0,0,0,0,100,0), -- 00:55:49
(@PATH,3,2721.288,-3159.098,267.5903,0,0,0,0,100,0), -- 00:55:56
(@PATH,4,2723.902,-3133.336,267.6333,0,0,0,0,100,0), -- 00:56:04
(@PATH,5,2706.458,-3124.162,267.6098,0,0,0,0,100,0), -- 00:56:13
(@PATH,6,2688.671,-3133.302,267.6201,0,0,0,0,100,0); -- 00:56:22

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127796);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127796,127796,0,0,2,0,0),
(127796,127797,3,270,2,0,0);

-- Pathing for Unholy Swords Entry: 16216 'TDB FORMAT' 
SET @NPC := 127822;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2740.497,`position_y`=-3216.551,`position_z`=267.6155 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2740.497,-3216.551,267.6155,0,0,0,0,100,0), -- 00:55:46
(@PATH,2,2735.71,-3191.704,267.4987,0,0,0,0,100,0), -- 00:55:54
(@PATH,3,2721.61,-3178.054,267.5587,0,0,0,0,100,0), -- 00:56:05
(@PATH,4,2735.71,-3191.704,267.4987,0,0,0,0,100,0), -- 00:56:14
(@PATH,5,2740.497,-3216.551,267.6155,0,0,0,0,100,0), -- 00:56:21
(@PATH,6,2734.737,-3239.713,267.602,0,0,0,0,100,0), -- 00:56:30
(@PATH,7,2717.949,-3253.626,267.6629,0,0,0,0,100,0), -- 00:56:40
(@PATH,8,2734.737,-3239.713,267.602,0,0,0,0,100,0); -- 00:56:50

-- Pathing for Unholy Swords Entry: 16216 'TDB FORMAT' 
SET @NPC := 127823;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2743.497,`position_y`=-3216.551,`position_z`=267.6155 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2740.497,-3216.551,267.6155,0,0,0,0,100,0), -- 00:55:46
(@PATH,2,2735.71,-3191.704,267.4987,0,0,0,0,100,0), -- 00:55:54
(@PATH,3,2721.61,-3178.054,267.5587,0,0,0,0,100,0), -- 00:56:05
(@PATH,4,2735.71,-3191.704,267.4987,0,0,0,0,100,0), -- 00:56:14
(@PATH,5,2740.497,-3216.551,267.6155,0,0,0,0,100,0), -- 00:56:21
(@PATH,6,2734.737,-3239.713,267.602,0,0,0,0,100,0), -- 00:56:30
(@PATH,7,2717.949,-3253.626,267.6629,0,0,0,0,100,0), -- 00:56:40
(@PATH,8,2734.737,-3239.713,267.602,0,0,0,0,100,0); -- 00:56:50

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127822);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127822,127822,0,0,2,0,0),
(127822,127823,4,90,2,3,7);

-- Pathing for Instructor Razuvious Entry: 16061 'TDB FORMAT' 
SET @NPC := 128312;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2758.932,`position_y`=-3107.118,`position_z`=267.6845 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2758.932,-3107.118,267.6845,0,0,0,0,100,0),
(@PATH,2,2758.409,-3091.983,267.6845,0,0,0,0,100,0),
(@PATH,3,2772.748,-3085.515,267.6845,0,0,0,0,100,0),
(@PATH,4,2783.736,-3101.491,267.6845,0,0,0,0,100,0),
(@PATH,5,2772.544,-3112.944,267.6845,0,0,0,0,100,0);
 
 
/* 
* sql\updates\world\2015_09_23_00_world.sql 
*/ 
-- Pathing for Venom Stalker Entry: 15976 'TDB FORMAT' 
SET @NPC := 127866;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3454.462,`position_y`=-3562.112,`position_z`=267.593 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3454.462,-3562.112,267.593,0,0,0,0,100,0), -- 18:40:27
(@PATH,2,3454.662,-3548.537,267.593,0,0,0,0,100,0), -- 18:40:38
(@PATH,3,3464.026,-3545.334,267.593,0,0,0,0,100,0), -- 18:40:43
(@PATH,4,3469.727,-3539.112,267.593,0,0,0,0,100,0), -- 18:40:47
(@PATH,5,3471.318,-3524.515,267.593,0,0,0,0,100,0), -- 18:40:50
(@PATH,6,3465.038,-3515.349,267.593,0,0,0,0,100,0), -- 18:40:56
(@PATH,7,3454.185,-3511.259,267.593,0,0,0,0,100,0), -- 18:41:01
(@PATH,8,3442.813,-3514.244,267.593,0,0,0,0,100,0), -- 18:41:06
(@PATH,9,3435.952,-3524.05,267.593,0,0,0,0,100,0), -- 18:41:11
(@PATH,10,3436.82,-3538.214,267.593,0,0,0,0,100,0), -- 18:41:16
(@PATH,11,3445.783,-3546.556,267.593,0,0,0,0,100,0), -- 18:41:21
(@PATH,12,3453.797,-3548.311,267.593,0,0,0,0,100,0), -- 18:41:25
(@PATH,13,3453.227,-3570.022,267.593,0,0,0,0,100,0), -- 18:41:29
(@PATH,14,3453.297,-3589.868,267.593,0,0,0,0,100,0), -- 18:41:38
(@PATH,15,3452.981,-3624.833,269.3551,0,0,0,0,100,0), -- 18:41:46
(@PATH,16,3453.006,-3638.403,276.4746,0,0,0,0,100,0), -- 18:41:59
(@PATH,17,3453.413,-3650.563,282.8547,0,0,0,0,100,0), -- 18:42:06
(@PATH,18,3453.339,-3674.839,294.1114,0,0,0,0,100,0), -- 18:42:12
(@PATH,19,3453.625,-3707.783,294.6607,0,0,0,0,100,0), -- 18:42:23
(@PATH,20,3453.646,-3719.333,294.6607,0,0,0,0,100,0), -- 18:42:36
(@PATH,21,3440.435,-3724.057,294.6607,0,0,0,0,100,0), -- 18:42:41
(@PATH,22,3433.669,-3735.089,294.6609,0,0,0,0,100,0), -- 18:42:46
(@PATH,23,3435.129,-3747.669,294.6607,0,0,0,0,100,0), -- 18:42:50
(@PATH,24,3444.191,-3756.717,294.6607,0,0,0,0,100,0), -- 18:42:55
(@PATH,25,3457.736,-3759.273,294.6607,0,0,0,0,100,0), -- 18:43:01
(@PATH,26,3468.683,-3752.32,294.6607,0,0,0,0,100,0), -- 18:43:06
(@PATH,27,3473.417,-3741.013,294.6607,0,0,0,0,100,0), -- 18:43:12
(@PATH,28,3469.141,-3727.593,294.6607,0,0,0,0,100,0), -- 18:43:17
(@PATH,29,3461.402,-3721.552,294.6607,0,0,0,0,100,0), -- 18:43:22
(@PATH,30,3453.865,-3719.445,294.6607,0,0,0,0,100,0), -- 18:43:27
(@PATH,31,3453.944,-3707.97,294.6607,0,0,0,0,100,0), -- 18:43:29
(@PATH,32,3453.922,-3674.717,294.0525,0,0,0,0,100,0), -- 18:43:34
(@PATH,33,3454.177,-3650.563,282.855,0,0,0,0,100,0), -- 18:43:47
(@PATH,34,3454.576,-3638.243,276.3913,0,0,0,0,100,0), -- 18:43:58
(@PATH,35,3454.075,-3614.297,267.5918,0,0,0,0,100,0), -- 18:44:03
(@PATH,36,3454.152,-3589.311,267.593,0,0,0,0,100,0); -- 18:44:14

-- Pathing for Venom Stalker Entry: 15976 'TDB FORMAT' 
SET @NPC := 127867;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3454.462,`position_y`=-3569.112,`position_z`=267.593 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3454.462,-3562.112,267.593,0,0,0,0,100,0), -- 18:40:27
(@PATH,2,3454.662,-3548.537,267.593,0,0,0,0,100,0), -- 18:40:38
(@PATH,3,3464.026,-3545.334,267.593,0,0,0,0,100,0), -- 18:40:43
(@PATH,4,3469.727,-3539.112,267.593,0,0,0,0,100,0), -- 18:40:47
(@PATH,5,3471.318,-3524.515,267.593,0,0,0,0,100,0), -- 18:40:50
(@PATH,6,3465.038,-3515.349,267.593,0,0,0,0,100,0), -- 18:40:56
(@PATH,7,3454.185,-3511.259,267.593,0,0,0,0,100,0), -- 18:41:01
(@PATH,8,3442.813,-3514.244,267.593,0,0,0,0,100,0), -- 18:41:06
(@PATH,9,3435.952,-3524.05,267.593,0,0,0,0,100,0), -- 18:41:11
(@PATH,10,3436.82,-3538.214,267.593,0,0,0,0,100,0), -- 18:41:16
(@PATH,11,3445.783,-3546.556,267.593,0,0,0,0,100,0), -- 18:41:21
(@PATH,12,3453.797,-3548.311,267.593,0,0,0,0,100,0), -- 18:41:25
(@PATH,13,3453.227,-3570.022,267.593,0,0,0,0,100,0), -- 18:41:29
(@PATH,14,3453.297,-3589.868,267.593,0,0,0,0,100,0), -- 18:41:38
(@PATH,15,3452.981,-3624.833,269.3551,0,0,0,0,100,0), -- 18:41:46
(@PATH,16,3453.006,-3638.403,276.4746,0,0,0,0,100,0), -- 18:41:59
(@PATH,17,3453.413,-3650.563,282.8547,0,0,0,0,100,0), -- 18:42:06
(@PATH,18,3453.339,-3674.839,294.1114,0,0,0,0,100,0), -- 18:42:12
(@PATH,19,3453.625,-3707.783,294.6607,0,0,0,0,100,0), -- 18:42:23
(@PATH,20,3453.646,-3719.333,294.6607,0,0,0,0,100,0), -- 18:42:36
(@PATH,21,3440.435,-3724.057,294.6607,0,0,0,0,100,0), -- 18:42:41
(@PATH,22,3433.669,-3735.089,294.6609,0,0,0,0,100,0), -- 18:42:46
(@PATH,23,3435.129,-3747.669,294.6607,0,0,0,0,100,0), -- 18:42:50
(@PATH,24,3444.191,-3756.717,294.6607,0,0,0,0,100,0), -- 18:42:55
(@PATH,25,3457.736,-3759.273,294.6607,0,0,0,0,100,0), -- 18:43:01
(@PATH,26,3468.683,-3752.32,294.6607,0,0,0,0,100,0), -- 18:43:06
(@PATH,27,3473.417,-3741.013,294.6607,0,0,0,0,100,0), -- 18:43:12
(@PATH,28,3469.141,-3727.593,294.6607,0,0,0,0,100,0), -- 18:43:17
(@PATH,29,3461.402,-3721.552,294.6607,0,0,0,0,100,0), -- 18:43:22
(@PATH,30,3453.865,-3719.445,294.6607,0,0,0,0,100,0), -- 18:43:27
(@PATH,31,3453.944,-3707.97,294.6607,0,0,0,0,100,0), -- 18:43:29
(@PATH,32,3453.922,-3674.717,294.0525,0,0,0,0,100,0), -- 18:43:34
(@PATH,33,3454.177,-3650.563,282.855,0,0,0,0,100,0), -- 18:43:47
(@PATH,34,3454.576,-3638.243,276.3913,0,0,0,0,100,0), -- 18:43:58
(@PATH,35,3454.075,-3614.297,267.5918,0,0,0,0,100,0), -- 18:44:03
(@PATH,36,3454.152,-3589.311,267.593,0,0,0,0,100,0); -- 18:44:14

-- Pathing for Venom Stalker Entry: 15976 'TDB FORMAT' 
SET @NPC := 127862;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3234.124,`position_y`=-3743.281,`position_z`=280.9517 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3234.124,-3743.281,280.9517,0,0,0,0,100,0), -- 18:45:33
(@PATH,2,3234.624,-3733.446,282.4194,0,0,0,0,100,0), -- 18:45:43
(@PATH,3,3252.519,-3730.217,279.2638,0,0,0,0,100,0), -- 18:45:46
(@PATH,4,3276.249,-3724.284,275.8947,0,0,0,0,100,0), -- 18:45:54
(@PATH,5,3309.417,-3714.943,266.8448,0,0,0,0,100,0), -- 18:46:03
(@PATH,6,3322.029,-3700.557,262.8869,0,0,0,0,100,0), -- 18:46:18
(@PATH,7,3298.23,-3700.239,271.5519,0,0,0,0,100,0), -- 18:46:26
(@PATH,8,3280.485,-3698.461,278.4746,0,0,0,0,100,0), -- 18:46:36
(@PATH,9,3298.23,-3700.239,271.5519,0,0,0,0,100,0), -- 18:46:45
(@PATH,10,3321.937,-3700.525,262.8836,0,0,0,0,100,0), -- 18:46:52
(@PATH,11,3309.417,-3714.943,266.8448,0,0,0,0,100,0), -- 18:47:02
(@PATH,12,3276.249,-3724.284,275.8947,0,0,0,0,100,0), -- 18:47:10
(@PATH,13,3252.581,-3730.202,279.2548,0,0,0,0,100,0), -- 18:47:25
(@PATH,14,3234.624,-3733.446,282.4194,0,0,0,0,100,0), -- 18:47:34
(@PATH,15,3234.132,-3743.128,280.9408,0,0,0,0,100,0), -- 18:47:42
(@PATH,16,3247.629,-3762.814,277.5423,0,0,0,0,100,0), -- 18:47:45
(@PATH,17,3232.144,-3779.076,273.1304,0,0,0,0,100,0), -- 18:47:55
(@PATH,18,3247.629,-3762.814,277.5423,0,0,0,0,100,0); -- 18:48:06

-- Pathing for Venom Stalker Entry: 15976 'TDB FORMAT' 
SET @NPC := 127863;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3232.124,`position_y`=-3751.281,`position_z`=280.9517 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3234.124,-3743.281,280.9517,0,0,0,0,100,0), -- 18:45:33
(@PATH,2,3234.624,-3733.446,282.4194,0,0,0,0,100,0), -- 18:45:43
(@PATH,3,3252.519,-3730.217,279.2638,0,0,0,0,100,0), -- 18:45:46
(@PATH,4,3276.249,-3724.284,275.8947,0,0,0,0,100,0), -- 18:45:54
(@PATH,5,3309.417,-3714.943,266.8448,0,0,0,0,100,0), -- 18:46:03
(@PATH,6,3322.029,-3700.557,262.8869,0,0,0,0,100,0), -- 18:46:18
(@PATH,7,3298.23,-3700.239,271.5519,0,0,0,0,100,0), -- 18:46:26
(@PATH,8,3280.485,-3698.461,278.4746,0,0,0,0,100,0), -- 18:46:36
(@PATH,9,3298.23,-3700.239,271.5519,0,0,0,0,100,0), -- 18:46:45
(@PATH,10,3321.937,-3700.525,262.8836,0,0,0,0,100,0), -- 18:46:52
(@PATH,11,3309.417,-3714.943,266.8448,0,0,0,0,100,0), -- 18:47:02
(@PATH,12,3276.249,-3724.284,275.8947,0,0,0,0,100,0), -- 18:47:10
(@PATH,13,3252.581,-3730.202,279.2548,0,0,0,0,100,0), -- 18:47:25
(@PATH,14,3234.624,-3733.446,282.4194,0,0,0,0,100,0), -- 18:47:34
(@PATH,15,3234.132,-3743.128,280.9408,0,0,0,0,100,0), -- 18:47:42
(@PATH,16,3247.629,-3762.814,277.5423,0,0,0,0,100,0), -- 18:47:45
(@PATH,17,3232.144,-3779.076,273.1304,0,0,0,0,100,0), -- 18:47:55
(@PATH,18,3247.629,-3762.814,277.5423,0,0,0,0,100,0); -- 18:48:06

-- Pathing for Venom Stalker Entry: 15976 'TDB FORMAT' 
SET @NPC := 127872;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3282.724,`position_y`=-3894.288,`position_z`=294.6608 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3282.724,-3894.288,294.6608,0,0,0,0,100,0), -- 18:48:08
(@PATH,2,3280.431,-3878.874,294.6607,0,0,0,0,100,0), -- 18:48:14
(@PATH,3,3288.137,-3862.199,294.6597,0,0,0,0,100,0), -- 18:48:21
(@PATH,4,3300.762,-3854.986,294.6609,0,0,0,0,100,0), -- 18:48:28
(@PATH,5,3317.737,-3854.183,294.6609,0,0,0,0,100,0), -- 18:48:34
(@PATH,6,3337.437,-3853.406,294.6607,0,0,0,0,100,0), -- 18:48:41
(@PATH,7,3359.545,-3831.036,294.662,0,0,0,0,100,0), -- 18:48:48
(@PATH,8,3383.364,-3807.658,294.6969,0,0,0,0,100,0), -- 18:49:02
(@PATH,9,3407.369,-3783.911,294.661,0,0,0,0,100,0), -- 18:49:15
(@PATH,10,3425.444,-3761.708,294.6607,0,0,0,0,100,0), -- 18:49:29
(@PATH,11,3425.071,-3748.542,294.6605,0,0,0,0,100,0), -- 18:49:39
(@PATH,12,3425.387,-3729.456,294.6607,0,0,0,0,100,0), -- 18:49:44
(@PATH,13,3435.633,-3715.143,294.6598,0,0,0,0,100,0), -- 18:49:53
(@PATH,14,3453.195,-3709.209,294.6607,0,0,0,0,100,0), -- 18:49:59
(@PATH,15,3465.947,-3712.353,294.6602,0,0,0,0,100,0), -- 18:50:07
(@PATH,16,3477.195,-3720.679,294.6599,0,0,0,0,100,0), -- 18:50:12
(@PATH,17,3483.336,-3735.452,294.6605,0,0,0,0,100,0), -- 18:50:17
(@PATH,18,3481.773,-3748.506,294.66,0,0,0,0,100,0), -- 18:50:24
(@PATH,19,3474.602,-3761.479,294.6591,0,0,0,0,100,0), -- 18:50:29
(@PATH,20,3459.724,-3768.537,294.6591,0,0,0,0,100,0), -- 18:50:35
(@PATH,21,3444.191,-3767.875,294.6595,0,0,0,0,100,0), -- 18:50:41
(@PATH,22,3431.064,-3767.097,294.6601,0,0,0,0,100,0), -- 18:50:49
(@PATH,23,3410.49,-3782.893,294.6607,0,0,0,0,100,0), -- 18:50:53
(@PATH,24,3385.208,-3808.768,294.6991,0,0,0,0,100,0), -- 18:51:03
(@PATH,25,3361.281,-3832.754,294.662,0,0,0,0,100,0), -- 18:51:18
(@PATH,26,3338.748,-3854.621,294.6607,0,0,0,0,100,0), -- 18:51:32
(@PATH,27,3338.51,-3872.156,294.6597,0,0,0,0,100,0), -- 18:51:44
(@PATH,28,3339.48,-3888.635,294.6605,0,0,0,0,100,0), -- 18:51:51
(@PATH,29,3325.759,-3908.016,294.6607,0,0,0,0,100,0), -- 18:51:58
(@PATH,30,3310.214,-3913.58,294.6595,0,0,0,0,100,0), -- 18:52:08
(@PATH,31,3292.234,-3906.752,294.6605,0,0,0,0,100,0); -- 18:52:14

-- Pathing for Venom Stalker Entry: 15976 'TDB FORMAT' 
SET @NPC := 127873;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3286.724,`position_y`=-3902.288,`position_z`=294.6608 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3282.724,-3894.288,294.6608,0,0,0,0,100,0), -- 18:48:08
(@PATH,2,3280.431,-3878.874,294.6607,0,0,0,0,100,0), -- 18:48:14
(@PATH,3,3288.137,-3862.199,294.6597,0,0,0,0,100,0), -- 18:48:21
(@PATH,4,3300.762,-3854.986,294.6609,0,0,0,0,100,0), -- 18:48:28
(@PATH,5,3317.737,-3854.183,294.6609,0,0,0,0,100,0), -- 18:48:34
(@PATH,6,3337.437,-3853.406,294.6607,0,0,0,0,100,0), -- 18:48:41
(@PATH,7,3359.545,-3831.036,294.662,0,0,0,0,100,0), -- 18:48:48
(@PATH,8,3383.364,-3807.658,294.6969,0,0,0,0,100,0), -- 18:49:02
(@PATH,9,3407.369,-3783.911,294.661,0,0,0,0,100,0), -- 18:49:15
(@PATH,10,3425.444,-3761.708,294.6607,0,0,0,0,100,0), -- 18:49:29
(@PATH,11,3425.071,-3748.542,294.6605,0,0,0,0,100,0), -- 18:49:39
(@PATH,12,3425.387,-3729.456,294.6607,0,0,0,0,100,0), -- 18:49:44
(@PATH,13,3435.633,-3715.143,294.6598,0,0,0,0,100,0), -- 18:49:53
(@PATH,14,3453.195,-3709.209,294.6607,0,0,0,0,100,0), -- 18:49:59
(@PATH,15,3465.947,-3712.353,294.6602,0,0,0,0,100,0), -- 18:50:07
(@PATH,16,3477.195,-3720.679,294.6599,0,0,0,0,100,0), -- 18:50:12
(@PATH,17,3483.336,-3735.452,294.6605,0,0,0,0,100,0), -- 18:50:17
(@PATH,18,3481.773,-3748.506,294.66,0,0,0,0,100,0), -- 18:50:24
(@PATH,19,3474.602,-3761.479,294.6591,0,0,0,0,100,0), -- 18:50:29
(@PATH,20,3459.724,-3768.537,294.6591,0,0,0,0,100,0), -- 18:50:35
(@PATH,21,3444.191,-3767.875,294.6595,0,0,0,0,100,0), -- 18:50:41
(@PATH,22,3431.064,-3767.097,294.6601,0,0,0,0,100,0), -- 18:50:49
(@PATH,23,3410.49,-3782.893,294.6607,0,0,0,0,100,0), -- 18:50:53
(@PATH,24,3385.208,-3808.768,294.6991,0,0,0,0,100,0), -- 18:51:03
(@PATH,25,3361.281,-3832.754,294.662,0,0,0,0,100,0), -- 18:51:18
(@PATH,26,3338.748,-3854.621,294.6607,0,0,0,0,100,0), -- 18:51:32
(@PATH,27,3338.51,-3872.156,294.6597,0,0,0,0,100,0), -- 18:51:44
(@PATH,28,3339.48,-3888.635,294.6605,0,0,0,0,100,0), -- 18:51:51
(@PATH,29,3325.759,-3908.016,294.6607,0,0,0,0,100,0), -- 18:51:58
(@PATH,30,3310.214,-3913.58,294.6595,0,0,0,0,100,0), -- 18:52:08
(@PATH,31,3292.234,-3906.752,294.6605,0,0,0,0,100,0); -- 18:52:14

-- Pathing for Venom Stalker Entry: 15976 'TDB FORMAT' 
SET @NPC := 127864;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3118.083,`position_y`=-3883.491,`position_z`=267.593 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3118.083,-3883.491,267.593,0,0,0,0,100,0), -- 18:36:24
(@PATH,2,3114.162,-3894.186,267.593,0,0,0,0,100,0), -- 18:36:33
(@PATH,3,3104.3,-3900.575,267.593,0,0,0,0,100,0), -- 18:36:38
(@PATH,4,3093.041,-3899.523,267.593,0,0,0,0,100,0), -- 18:36:43
(@PATH,5,3083.292,-3890.907,267.593,0,0,0,0,100,0), -- 18:36:48
(@PATH,6,3082.536,-3878.924,267.593,0,0,0,0,100,0), -- 18:36:53
(@PATH,7,3088.724,-3868.493,267.593,0,0,0,0,100,0), -- 18:36:57
(@PATH,8,3103.835,-3863.884,267.593,0,0,0,0,100,0), -- 18:37:02
(@PATH,9,3114.156,-3873.857,267.593,0,0,0,0,100,0), -- 18:37:08
(@PATH,10,3118.014,-3882.239,267.593,0,0,0,0,100,0), -- 18:37:14
(@PATH,11,3142.844,-3882.002,267.593,0,0,0,0,100,0), -- 18:37:18
(@PATH,12,3166.273,-3881.469,267.5934,0,0,0,0,100,0), -- 18:37:28
(@PATH,13,3194.12,-3881.767,268.6533,0,0,0,0,100,0), -- 18:37:37
(@PATH,14,3207.929,-3881.54,275.8944,0,0,0,0,100,0), -- 18:37:48
(@PATH,15,3221.411,-3881.945,282.9668,0,0,0,0,100,0), -- 18:37:54
(@PATH,16,3241.861,-3882.487,292.3779,0,0,0,0,100,0), -- 18:38:01
(@PATH,17,3260.216,-3882.229,294.6607,0,0,0,0,100,0), -- 18:38:10
(@PATH,18,3279.568,-3882.604,294.6607,0,0,0,0,100,0), -- 18:38:17
(@PATH,19,3290.396,-3881.747,294.6607,0,0,0,0,100,0), -- 18:38:25
(@PATH,20,3296.476,-3869.041,294.6607,0,0,0,0,100,0), -- 18:38:30
(@PATH,21,3307.822,-3864.203,294.6607,0,0,0,0,100,0), -- 18:46:32
(@PATH,22,3321.301,-3868.157,294.6607,0,0,0,0,100,0), -- 18:46:37
(@PATH,23,3328.406,-3877.447,294.6597,0,0,0,0,100,0), -- 18:46:43
(@PATH,24,3327.705,-3889.598,294.6607,0,0,0,0,100,0), -- 18:46:47
(@PATH,25,3320.085,-3897.669,294.6607,0,0,0,0,100,0), -- 18:46:52
(@PATH,26,3312.01,-3901.51,294.6607,0,0,0,0,100,0), -- 18:46:57
(@PATH,27,3297.603,-3897.307,294.6607,0,0,0,0,100,0), -- 18:47:00
(@PATH,28,3292.267,-3890.234,294.6607,0,0,0,0,100,0), -- 18:47:07
(@PATH,29,3290.384,-3882.75,294.6607,0,0,0,0,100,0), -- 18:47:10
(@PATH,30,3279.155,-3882.98,294.6607,0,0,0,0,100,0), -- 18:47:14
(@PATH,31,3260.253,-3882.767,294.6607,0,0,0,0,100,0), -- 18:47:17
(@PATH,32,3241.78,-3882.872,292.339,0,0,0,0,100,0), -- 18:47:25
(@PATH,33,3221.214,-3882.398,282.8636,0,0,0,0,100,0), -- 18:47:33
(@PATH,34,3207.818,-3881.953,275.8358,0,0,0,0,100,0), -- 18:47:42
(@PATH,35,3194.124,-3882.38,268.655,0,0,0,0,100,0), -- 18:47:48
(@PATH,36,3166.121,-3882.08,267.5934,0,0,0,0,100,0), -- 18:47:54
(@PATH,37,3142.54,-3882.999,267.593,0,0,0,0,100,0); -- 18:48:06

-- Pathing for Venom Stalker Entry: 15976 'TDB FORMAT' 
SET @NPC := 127865;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3126.083,`position_y`=-3882.491,`position_z`=267.593 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3118.083,-3883.491,267.593,0,0,0,0,100,0), -- 18:36:24
(@PATH,2,3114.162,-3894.186,267.593,0,0,0,0,100,0), -- 18:36:33
(@PATH,3,3104.3,-3900.575,267.593,0,0,0,0,100,0), -- 18:36:38
(@PATH,4,3093.041,-3899.523,267.593,0,0,0,0,100,0), -- 18:36:43
(@PATH,5,3083.292,-3890.907,267.593,0,0,0,0,100,0), -- 18:36:48
(@PATH,6,3082.536,-3878.924,267.593,0,0,0,0,100,0), -- 18:36:53
(@PATH,7,3088.724,-3868.493,267.593,0,0,0,0,100,0), -- 18:36:57
(@PATH,8,3103.835,-3863.884,267.593,0,0,0,0,100,0), -- 18:37:02
(@PATH,9,3114.156,-3873.857,267.593,0,0,0,0,100,0), -- 18:37:08
(@PATH,10,3118.014,-3882.239,267.593,0,0,0,0,100,0), -- 18:37:14
(@PATH,11,3142.844,-3882.002,267.593,0,0,0,0,100,0), -- 18:37:18
(@PATH,12,3166.273,-3881.469,267.5934,0,0,0,0,100,0), -- 18:37:28
(@PATH,13,3194.12,-3881.767,268.6533,0,0,0,0,100,0), -- 18:37:37
(@PATH,14,3207.929,-3881.54,275.8944,0,0,0,0,100,0), -- 18:37:48
(@PATH,15,3221.411,-3881.945,282.9668,0,0,0,0,100,0), -- 18:37:54
(@PATH,16,3241.861,-3882.487,292.3779,0,0,0,0,100,0), -- 18:38:01
(@PATH,17,3260.216,-3882.229,294.6607,0,0,0,0,100,0), -- 18:38:10
(@PATH,18,3279.568,-3882.604,294.6607,0,0,0,0,100,0), -- 18:38:17
(@PATH,19,3290.396,-3881.747,294.6607,0,0,0,0,100,0), -- 18:38:25
(@PATH,20,3296.476,-3869.041,294.6607,0,0,0,0,100,0), -- 18:38:30
(@PATH,21,3307.822,-3864.203,294.6607,0,0,0,0,100,0), -- 18:46:32
(@PATH,22,3321.301,-3868.157,294.6607,0,0,0,0,100,0), -- 18:46:37
(@PATH,23,3328.406,-3877.447,294.6597,0,0,0,0,100,0), -- 18:46:43
(@PATH,24,3327.705,-3889.598,294.6607,0,0,0,0,100,0), -- 18:46:47
(@PATH,25,3320.085,-3897.669,294.6607,0,0,0,0,100,0), -- 18:46:52
(@PATH,26,3312.01,-3901.51,294.6607,0,0,0,0,100,0), -- 18:46:57
(@PATH,27,3297.603,-3897.307,294.6607,0,0,0,0,100,0), -- 18:47:00
(@PATH,28,3292.267,-3890.234,294.6607,0,0,0,0,100,0), -- 18:47:07
(@PATH,29,3290.384,-3882.75,294.6607,0,0,0,0,100,0), -- 18:47:10
(@PATH,30,3279.155,-3882.98,294.6607,0,0,0,0,100,0), -- 18:47:14
(@PATH,31,3260.253,-3882.767,294.6607,0,0,0,0,100,0), -- 18:47:17
(@PATH,32,3241.78,-3882.872,292.339,0,0,0,0,100,0), -- 18:47:25
(@PATH,33,3221.214,-3882.398,282.8636,0,0,0,0,100,0), -- 18:47:33
(@PATH,34,3207.818,-3881.953,275.8358,0,0,0,0,100,0), -- 18:47:42
(@PATH,35,3194.124,-3882.38,268.655,0,0,0,0,100,0), -- 18:47:48
(@PATH,36,3166.121,-3882.08,267.5934,0,0,0,0,100,0), -- 18:47:54
(@PATH,37,3142.54,-3882.999,267.593,0,0,0,0,100,0); -- 18:48:06

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127862,127863,127864,127865,127866,127867,127872,127873);
DELETE FROM `creature_formations` WHERE `memberGUID` IN (127862,127863,127864,127865,127866,127867,127872,127873);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127866,127866,0,0,2,0,0),
(127866,127867,8,360,2,0,0),
(127862,127862,0,0,2,0,0),
(127862,127863,8,360,2,0,0),
(127872,127872,0,0,2,0,0),
(127872,127873,8,360,2,0,0),
(127864,127864,0,0,2,0,0),
(127864,127865,8,360,2,0,0);

-- Pathing for Poisonous Skitterer Entry: 15977 'TDB FORMAT' 
SET @NPC := 127907;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3074.529,`position_y`=-3897.057,`position_z`=267.593 WHERE `guid` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@NPC+1,@PATH,0,0,1,0, ''),(@NPC+2,@PATH,0,0,1,0, ''),(@NPC+3,@PATH,0,0,1,0, ''),
(@NPC+4,@PATH,0,0,1,0, ''),(@NPC+5,@PATH,0,0,1,0, ''),(@NPC+6,@PATH,0,0,1,0, ''),(@NPC+7,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3074.529,-3897.057,267.593,0,0,1,0,100,0), -- 18:49:16
(@PATH,2,3079.677,-3905.275,267.5924,0,0,1,0,100,0), -- 18:49:18
(@PATH,3,3100.693,-3912.941,267.593,0,0,1,0,100,0), -- 18:49:19
(@PATH,4,3117.195,-3907.615,267.5934,0,0,1,0,100,0), -- 18:49:21
(@PATH,5,3127.366,-3895.706,267.593,0,0,1,0,100,0), -- 18:49:22
(@PATH,6,3140.936,-3884.294,267.593,0,0,1,0,100,0), -- 18:49:24
(@PATH,7,3158.318,-3883.925,267.593,0,0,1,0,100,0), -- 18:49:26
(@PATH,8,3174.53,-3883.984,267.5941,0,0,1,0,100,0), -- 18:49:27
(@PATH,9,3194.791,-3884.305,269.0044,0,0,1,0,100,0), -- 18:49:30
(@PATH,10,3205.072,-3884.625,274.395,0,0,1,0,100,0), -- 18:49:31
(@PATH,11,3215.293,-3885.147,279.7566,0,0,1,0,100,0), -- 18:49:32
(@PATH,12,3223.794,-3885.607,284.2162,0,0,1,0,100,0), -- 18:49:33
(@PATH,13,3237.89,-3886.143,290.4647,0,0,1,0,100,0), -- 18:49:35
(@PATH,14,3247.501,-3886.756,294.6604,0,0,1,0,100,0), -- 18:49:36
(@PATH,15,3267.746,-3887.45,294.6607,0,0,1,0,100,0), -- 18:49:37
(@PATH,16,3282.858,-3895.334,294.6606,0,0,1,0,100,0), -- 18:49:39
(@PATH,17,3295.857,-3909.075,294.6605,0,0,1,0,100,0), -- 18:49:41
(@PATH,18,3313.104,-3913.105,294.6597,0,0,1,0,100,0), -- 18:49:43
(@PATH,19,3331.879,-3904.76,294.6607,0,0,1,0,100,0), -- 18:49:44
(@PATH,20,3338.559,-3891.88,294.6608,0,0,1,0,100,0), -- 18:49:47
(@PATH,21,3339.517,-3878.169,294.6594,0,0,1,0,100,0), -- 18:49:48
(@PATH,22,3332.953,-3864.011,294.6603,0,0,1,0,100,0), -- 18:49:49
(@PATH,23,3319.689,-3854.916,294.6607,0,0,1,0,100,0), -- 18:49:50
(@PATH,24,3304.591,-3853.372,294.6609,0,0,1,0,100,0), -- 18:49:53
(@PATH,25,3288.425,-3861.284,294.6596,0,0,1,0,100,0), -- 18:49:54
(@PATH,26,3280.122,-3870.386,294.6606,0,0,1,0,100,0), -- 18:49:56
(@PATH,27,3267.866,-3880.449,294.6615,0,0,1,0,100,0), -- 18:49:58
(@PATH,28,3247.675,-3880.42,294.6608,0,0,1,0,100,0), -- 18:49:59
(@PATH,29,3237.588,-3880.728,290.3199,0,0,1,0,100,0), -- 18:50:01
(@PATH,30,3224.797,-3880.583,284.7434,0,0,1,0,100,0), -- 18:50:02
(@PATH,31,3215.042,-3880.425,279.6261,0,0,1,0,100,0), -- 18:50:04
(@PATH,32,3195.322,-3880.004,269.2845,0,0,1,0,100,0), -- 18:50:05
(@PATH,33,3175.766,-3879.59,267.5942,0,0,1,0,100,0), -- 18:50:06
(@PATH,34,3158.302,-3879.587,267.593,0,0,1,0,100,0), -- 18:50:09
(@PATH,35,3140.589,-3879.343,267.593,0,0,1,0,100,0), -- 18:50:11
(@PATH,36,3127.137,-3869.814,267.5929,0,0,1,0,100,0), -- 18:50:12
(@PATH,37,3118.936,-3859.253,267.5927,0,0,1,0,100,0), -- 18:50:13
(@PATH,38,3103.765,-3853.207,267.5929,0,0,1,0,100,0), -- 18:50:15
(@PATH,39,3087.844,-3856.353,267.593,0,0,1,0,100,0), -- 18:50:17
(@PATH,40,3075.642,-3865.845,267.5934,0,0,1,0,100,0), -- 18:50:18
(@PATH,41,3070.007,-3884.099,267.593,0,0,1,0,100,0); -- 18:50:19
-- 0x1C3B1C42A00F9A400063AC0000019CDF .go 3074.529 -3897.057 267.593

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
DELETE FROM `creature_formations` WHERE `memberGUID` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@NPC+1,6,150,2,0,0),
(@NPC,@NPC+2,6,100,2,0,0),
(@NPC,@NPC+3,6,50,2,0,0),
(@NPC,@NPC+4,6,360,2,0,0),
(@NPC,@NPC+5,6,310,2,0,0),
(@NPC,@NPC+6,6,240,2,0,0),
(@NPC,@NPC+7,6,190,2,0,0);

-- Pathing for Poisonous Skitterer Entry: 15977 'TDB FORMAT' 
SET @NPC := 127963;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3224.441,`position_y`=-3876.754,`position_z`=284.5573 WHERE `guid` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@NPC+1,@PATH,0,0,1,0, ''),(@NPC+2,@PATH,0,0,1,0, ''),(@NPC+3,@PATH,0,0,1,0, ''),
(@NPC+4,@PATH,0,0,1,0, ''),(@NPC+5,@PATH,0,0,1,0, ''),(@NPC+6,@PATH,0,0,1,0, ''),(@NPC+7,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3224.441,-3876.754,284.5573,0,0,1,0,100,0), -- 18:48:59
(@PATH,2,3243.073,-3881.118,292.9622,0,0,1,0,100,0), -- 18:49:03
(@PATH,3,3264.531,-3885.239,294.6607,0,0,1,0,100,0), -- 18:49:04
(@PATH,4,3280.712,-3887.944,294.6607,0,0,1,0,100,0), -- 18:49:07
(@PATH,5,3286.485,-3901.147,294.66,0,0,1,0,100,0), -- 18:49:08
(@PATH,6,3299.353,-3910.954,294.6605,0,0,1,0,100,0), -- 18:49:10
(@PATH,7,3310.171,-3913.553,294.6593,0,0,1,0,100,0), -- 18:49:12
(@PATH,8,3320.141,-3911.575,294.6602,0,0,1,0,100,0), -- 18:49:13
(@PATH,9,3327.62,-3907.016,294.6607,0,0,1,0,100,0), -- 18:49:14
(@PATH,10,3337.314,-3895.928,294.6607,0,0,1,0,100,0), -- 18:49:15
(@PATH,11,3339.708,-3878.755,294.6594,0,0,1,0,100,0), -- 18:49:16
(@PATH,12,3333.498,-3863.702,294.6603,0,0,1,0,100,0), -- 18:49:18
(@PATH,13,3323.844,-3856.551,294.6607,0,0,1,0,100,0), -- 18:49:20
(@PATH,14,3309.547,-3852.652,294.6601,0,0,1,0,100,0), -- 18:49:21
(@PATH,15,3294.998,-3857.095,294.6609,0,0,1,0,100,0), -- 18:49:22
(@PATH,16,3284.745,-3868.869,294.6604,0,0,1,0,100,0), -- 18:49:24
(@PATH,17,3280.295,-3878.902,294.6607,0,0,1,0,100,0), -- 18:49:25
(@PATH,18,3264.526,-3882.421,294.6607,0,0,1,0,100,0), -- 18:49:26
(@PATH,19,3243.129,-3885.538,292.9888,0,0,1,0,100,0), -- 18:49:29
(@PATH,20,3225,-3889.948,284.8481,0,0,1,0,100,0), -- 18:49:30
(@PATH,21,3207.006,-3898.323,275.4061,0,0,1,0,100,0), -- 18:49:32
(@PATH,22,3182.24,-3901.498,267.5922,0,0,1,0,100,0), -- 18:49:35
(@PATH,23,3181.843,-3882.055,267.5952,0,0,1,0,100,0), -- 18:49:37
(@PATH,24,3181.309,-3863.954,267.6013,0,0,1,0,100,0), -- 18:49:39
(@PATH,25,3202.393,-3869.113,272.9927,0,0,1,0,100,0); -- 18:49:41
-- 0x1C3B1C42A00F9A400063AC0004019CDF .go 3224.441 -3876.754 284.5573

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
DELETE FROM `creature_formations` WHERE `memberGUID` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@NPC+1,6,150,2,0,0),
(@NPC,@NPC+2,6,100,2,0,0),
(@NPC,@NPC+3,6,50,2,0,0),
(@NPC,@NPC+4,6,360,2,0,0),
(@NPC,@NPC+5,6,310,2,0,0),
(@NPC,@NPC+6,6,240,2,0,0),
(@NPC,@NPC+7,6,190,2,0,0);

-- Pathing for Poisonous Skitterer Entry: 15977 'TDB FORMAT' 
SET @NPC := 127915;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3435.956,`position_y`=-3606.878,`position_z`=267.5925 WHERE `guid` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@NPC+1,@PATH,0,0,1,0, ''),(@NPC+2,@PATH,0,0,1,0, ''),(@NPC+3,@PATH,0,0,1,0, ''),
(@NPC+4,@PATH,0,0,1,0, ''),(@NPC+5,@PATH,0,0,1,0, ''),(@NPC+6,@PATH,0,0,1,0, ''),(@NPC+7,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3435.956,-3606.878,267.5925,0,0,1,0,100,0), -- 18:40:42
(@PATH,2,3435.056,-3623.646,268.7272,0,0,1,0,100,0), -- 18:40:43
(@PATH,3,3434.696,-3642.454,278.5947,0,0,1,0,100,0), -- 18:40:45
(@PATH,4,3451.302,-3657.603,286.5476,0,0,1,0,100,0), -- 18:40:47
(@PATH,5,3451.777,-3674.688,294.0381,0,0,1,0,100,0), -- 18:40:49
(@PATH,6,3450.148,-3687.086,294.6606,0,0,1,0,100,0), -- 18:40:52
(@PATH,7,3448.747,-3700.197,294.6606,0,0,1,0,100,0), -- 18:40:53
(@PATH,8,3441.068,-3712.697,294.6603,0,0,1,0,100,0), -- 18:40:54
(@PATH,9,3427.858,-3724.603,294.6606,0,0,1,0,100,0), -- 18:40:56
(@PATH,10,3424.089,-3742.215,294.6599,0,0,1,0,100,0), -- 18:40:58
(@PATH,11,3432.195,-3760.958,294.6607,0,0,1,0,100,0), -- 18:40:59
(@PATH,12,3446.482,-3768.38,294.6594,0,0,1,0,100,0), -- 18:41:02
(@PATH,13,3458.209,-3769.1,294.6591,0,0,1,0,100,0), -- 18:41:03
(@PATH,14,3474.842,-3761.217,294.6591,0,0,1,0,100,0), -- 18:41:04
(@PATH,15,3483.013,-3745.727,294.6602,0,0,1,0,100,0), -- 18:44:04
(@PATH,16,3482.468,-3731.778,294.6606,0,0,1,0,100,0), -- 18:43:22
(@PATH,17,3476.008,-3718.655,294.6598,0,0,1,0,100,0), -- 18:43:24
(@PATH,18,3463.966,-3711.199,294.6607,0,0,1,0,100,0), -- 18:43:25
(@PATH,19,3458.016,-3700.416,294.6607,0,0,1,0,100,0), -- 18:43:26
(@PATH,20,3456.704,-3687.183,294.6606,0,0,1,0,100,0), -- 18:43:27
(@PATH,21,3453.893,-3674.658,294.0241,0,0,1,0,100,0), -- 18:43:28
(@PATH,22,3453.96,-3657.726,286.6128,0,0,1,0,100,0), -- 18:43:30
(@PATH,23,3469.155,-3643.573,279.192,0,0,1,0,100,0), -- 18:43:32
(@PATH,24,3470.532,-3624.281,269.0706,0,0,1,0,100,0), -- 18:43:34
(@PATH,25,3470.325,-3607.22,267.5942,0,0,1,0,100,0), -- 18:43:37
(@PATH,26,3451.28,-3607.224,267.5939,0,0,1,0,100,0); -- 18:43:38
-- 0x1C3B1C42A00F9A400063AC0000019CE0 .go 3435.956 -3606.878 267.5925

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
DELETE FROM `creature_formations` WHERE `memberGUID` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@NPC+1,6,150,2,0,0),
(@NPC,@NPC+2,6,100,2,0,0),
(@NPC,@NPC+3,6,50,2,0,0),
(@NPC,@NPC+4,6,360,2,0,0),
(@NPC,@NPC+5,6,310,2,0,0),
(@NPC,@NPC+6,6,240,2,0,0),
(@NPC,@NPC+7,6,190,2,0,0);

-- Pathing for Poisonous Skitterer Entry: 15977 'TDB FORMAT' 
SET @NPC := 127971;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3295.49,`position_y`=-3908.793,`position_z`=294.6605 WHERE `guid` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@NPC+1,@PATH,0,0,1,0, ''),(@NPC+2,@PATH,0,0,1,0, ''),(@NPC+3,@PATH,0,0,1,0, ''),
(@NPC+4,@PATH,0,0,1,0, ''),(@NPC+5,@PATH,0,0,1,0, ''),(@NPC+6,@PATH,0,0,1,0, ''),(@NPC+7,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3295.49,-3908.793,294.6605,0,0,1,0,100,0), -- 18:51:17
(@PATH,2,3315.678,-3912.224,294.6599,0,0,1,0,100,0), -- 18:51:19
(@PATH,3,3333.155,-3901.934,294.6607,0,0,1,0,100,0), -- 18:51:21
(@PATH,4,3340.176,-3885.257,294.6602,0,0,1,0,100,0), -- 18:51:23
(@PATH,5,3340.906,-3871.007,294.6597,0,0,1,0,100,0), -- 18:51:24
(@PATH,6,3346.968,-3852.773,294.6607,0,0,1,0,100,0), -- 18:51:27
(@PATH,7,3351.746,-3834.469,294.661,0,0,1,0,100,0), -- 18:51:28
(@PATH,8,3355.633,-3811.367,294.6529,0,0,1,0,100,0), -- 18:51:30
(@PATH,9,3364.557,-3793.01,294.6719,0,0,1,0,100,0), -- 18:51:33
(@PATH,10,3373.259,-3788.029,294.6747,0,0,1,0,100,0), -- 18:51:34
(@PATH,11,3386.617,-3791.233,294.6732,0,0,1,0,100,0), -- 18:51:35
(@PATH,12,3403.893,-3786.905,294.6616,0,0,1,0,100,0), -- 18:51:36
(@PATH,13,3417.919,-3780.905,294.6603,0,0,1,0,100,0), -- 18:51:39
(@PATH,14,3435.631,-3777.892,294.6598,0,0,1,0,100,0), -- 18:51:40
(@PATH,15,3453.584,-3770.242,294.6595,0,0,1,0,100,0), -- 18:51:41
(@PATH,16,3473.68,-3761.83,294.6591,0,0,1,0,100,0), -- 18:51:44
(@PATH,17,3482.105,-3748.733,294.66,0,0,1,0,100,0), -- 18:51:46
(@PATH,18,3481.656,-3730.049,294.6605,0,0,1,0,100,0), -- 18:51:47
(@PATH,19,3466.719,-3713.448,294.6601,0,0,1,0,100,0), -- 18:51:50
(@PATH,20,3442.352,-3711.847,294.6607,0,0,1,0,100,0), -- 18:51:52
(@PATH,21,3425.655,-3728.148,294.6607,0,0,1,0,100,0), -- 18:51:55
(@PATH,22,3424.592,-3744.035,294.6601,0,0,1,0,100,0), -- 18:51:57
(@PATH,23,3425.272,-3756.561,294.6607,0,0,1,0,100,0), -- 18:51:58
(@PATH,24,3416.304,-3774.603,294.6607,0,0,1,0,100,0), -- 18:51:59
(@PATH,25,3405.274,-3797.244,294.6658,0,0,1,0,100,0), -- 18:52:02
(@PATH,26,3394.972,-3815.078,294.7111,0,0,1,0,100,0), -- 18:52:04
(@PATH,27,3377.224,-3831.485,294.6744,0,0,1,0,100,0), -- 18:52:06
(@PATH,28,3355.986,-3838.537,294.661,0,0,1,0,100,0), -- 18:52:08
(@PATH,29,3337.649,-3843.212,294.6607,0,0,1,0,100,0), -- 18:52:10
(@PATH,30,3316.94,-3850.059,294.6604,0,0,1,0,100,0), -- 18:52:13
(@PATH,31,3304.55,-3853.525,294.6609,0,0,1,0,100,0), -- 18:52:15
(@PATH,32,3288.827,-3861.687,294.6596,0,0,1,0,100,0), -- 18:52:16
(@PATH,33,3281.996,-3873.274,294.6607,0,0,1,0,100,0), -- 18:52:18
(@PATH,34,3281.982,-3891.924,294.6607,0,0,1,0,100,0); -- 18:52:19
-- 0x1C3B1C42A00F9A400063AC0004019CE0 .go 3295.49 -3908.793 294.6605

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
DELETE FROM `creature_formations` WHERE `memberGUID` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@NPC+1,6,150,2,0,0),
(@NPC,@NPC+2,6,100,2,0,0),
(@NPC,@NPC+3,6,50,2,0,0),
(@NPC,@NPC+4,6,360,2,0,0),
(@NPC,@NPC+5,6,310,2,0,0),
(@NPC,@NPC+6,6,240,2,0,0),
(@NPC,@NPC+7,6,190,2,0,0);

-- Pathing for Poisonous Skitterer Entry: 15977 'TDB FORMAT' 
SET @NPC := 127923;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3445.511,`position_y`=-3562.019,`position_z`=267.5927 WHERE `guid` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@NPC,@PATH,0,0,1,0, ''),(@NPC+1,@PATH,0,0,1,0, ''),(@NPC+2,@PATH,0,0,1,0, ''),(@NPC+3,@PATH,0,0,1,0, ''),
(@NPC+4,@PATH,0,0,1,0, ''),(@NPC+5,@PATH,0,0,1,0, ''),(@NPC+6,@PATH,0,0,1,0, ''),(@NPC+7,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3445.511,-3562.019,267.5927,0,0,1,0,100,0), -- 18:50:41
(@PATH,2,3436.16,-3553.894,267.5926,0,0,1,0,100,0), -- 18:50:40
(@PATH,3,3427.388,-3543.853,267.5927,0,0,1,0,100,0), -- 18:50:39
(@PATH,4,3424.374,-3524.575,267.593,0,0,1,0,100,0), -- 18:50:36
(@PATH,5,3430.726,-3510.367,267.5926,0,0,1,0,100,0), -- 18:50:35
(@PATH,6,3450.23,-3500.03,267.593,0,0,1,0,100,0), -- 18:50:33
(@PATH,7,3467.847,-3503.534,267.592,0,0,1,0,100,0), -- 18:50:32
(@PATH,8,3476.588,-3510.952,267.5963,0,0,1,0,100,0), -- 18:50:30
(@PATH,9,3481.654,-3519.189,267.599,0,0,1,0,100,0), -- 18:50:29
(@PATH,10,3483.025,-3534.862,267.5939,0,0,1,0,100,0), -- 18:50:28
(@PATH,11,3476.475,-3549.416,267.5925,0,0,1,0,100,0), -- 18:50:26
(@PATH,12,3462.348,-3561.076,267.5923,0,0,1,0,100,0), -- 18:50:24
(@PATH,13,3457.105,-3576.026,267.593,0,0,1,0,100,0), -- 18:50:22
(@PATH,14,3456.484,-3596.646,267.5931,0,0,1,0,100,0), -- 18:50:21
(@PATH,15,3456.006,-3616.097,267.5933,0,0,1,0,100,0), -- 18:50:18
(@PATH,16,3455.418,-3633.274,273.7843,0,0,1,0,100,0), -- 18:50:17
(@PATH,17,3455.296,-3644.975,279.9232,0,0,1,0,100,0), -- 18:50:16
(@PATH,18,3455.71,-3658.097,286.8079,0,0,1,0,100,0), -- 18:50:13
(@PATH,19,3454.985,-3676.887,294.6609,0,0,1,0,100,0), -- 18:50:12
(@PATH,20,3455.906,-3694.337,294.6607,0,0,1,0,100,0), -- 18:50:10
(@PATH,21,3467.804,-3706.619,294.66,0,0,1,0,100,0), -- 18:50:09
(@PATH,22,3476.442,-3720.346,294.6599,0,0,1,0,100,0), -- 18:50:06
(@PATH,23,3483.089,-3735.734,294.6605,0,0,1,0,100,0), -- 18:50:05
(@PATH,24,3480.588,-3752.523,294.6599,0,0,1,0,100,0), -- 18:50:04
(@PATH,25,3467.757,-3765.589,294.6591,0,0,1,0,100,0), -- 18:50:01
(@PATH,26,3453.585,-3770.197,294.6595,0,0,1,0,100,0), -- 18:50:00
(@PATH,27,3436.298,-3764.208,294.6599,0,0,1,0,100,0), -- 18:49:59
(@PATH,28,3426.811,-3752.177,294.6607,0,0,1,0,100,0), -- 18:49:56
(@PATH,29,3423.844,-3737.633,294.6601,0,0,1,0,100,0), -- 18:49:55
(@PATH,30,3429.387,-3722.426,294.6605,0,0,1,0,100,0), -- 18:49:54
(@PATH,31,3441.138,-3712.122,294.6603,0,0,1,0,100,0), -- 18:49:52
(@PATH,32,3449.993,-3694.774,294.6606,0,0,1,0,100,0), -- 18:49:50
(@PATH,33,3450.414,-3676.926,294.6604,0,0,1,0,100,0), -- 18:49:48
(@PATH,34,3451.136,-3657.843,286.6731,0,0,1,0,100,0), -- 18:49:47
(@PATH,35,3451.486,-3645.041,279.957,0,0,1,0,100,0), -- 18:49:46
(@PATH,36,3451.301,-3632.746,273.5061,0,0,1,0,100,0), -- 18:49:43
(@PATH,37,3451.295,-3615.899,267.594,0,0,1,0,100,0), -- 18:49:41
(@PATH,38,3451.307,-3596.557,267.5931,0,0,1,0,100,0), -- 18:49:39
(@PATH,39,3451.611,-3575.75,267.5927,0,0,1,0,100,0); -- 18:49:37
-- 0x1C3B1C42A00F9A400063AC0008019CDF .go 3445.511 -3562.019 267.5927

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
DELETE FROM `creature_formations` WHERE `memberGUID` IN (@NPC,@NPC+1,@NPC+2,@NPC+3,@NPC+4,@NPC+5,@NPC+6,@NPC+7);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(@NPC,@NPC,0,0,2,0,0),
(@NPC,@NPC+1,6,150,2,0,0),
(@NPC,@NPC+2,6,100,2,0,0),
(@NPC,@NPC+3,6,50,2,0,0),
(@NPC,@NPC+4,6,360,2,0,0),
(@NPC,@NPC+5,6,310,2,0,0),
(@NPC,@NPC+6,6,240,2,0,0),
(@NPC,@NPC+7,6,190,2,0,0);
 
 
/* 
* sql\updates\world\2015_09_23_01_world.sql 
*/ 
DELETE FROM `creature` WHERE `guid` IN (86098, 86097, 86092, 86091, 86090, 86088, 86089, 86087, 86086, 86085);

-- Pathing for Dragonmaw Shaman Entry: 21720 'TDB FORMAT' 
SET @NPC := 75806;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4178.686,`position_y`=490.5659,`position_z`=30.16439 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4178.686,490.5659,30.16439,0,0,0,0,100,0), -- 10:20:24
(@PATH,2,-4197.292,485.9068,30.38932,0,0,0,0,100,0), -- 10:20:35
(@PATH,3,-4225.723,467.5575,41.27721,0,0,0,0,100,0), -- 10:20:44
(@PATH,4,-4215.874,436.8994,48.21687,0,0,0,0,100,0), -- 10:20:57
(@PATH,5,-4237.429,402.9925,63.27236,0,0,0,0,100,0), -- 10:21:13
(@PATH,6,-4257.311,375.9668,78.98435,0,0,0,0,100,0), -- 10:21:30
(@PATH,7,-4218.265,427.3583,49.21005,0,0,0,0,100,0), -- 10:21:59
(@PATH,8,-4226.337,464.256,42.97073,0,0,0,0,100,0), -- 10:22:17
(@PATH,9,-4205.016,481.8601,31.38265,0,0,0,0,100,0), -- 10:22:32
(@PATH,10,-4193.525,487.0911,30.10522,0,0,0,0,100,0), -- 10:22:46
(@PATH,11,-4172.567,476.759,31.17034,0,0,0,0,100,0), -- 10:22:55
(@PATH,12,-4151.987,448.1165,33.53831,0,0,0,0,100,0), -- 10:23:06
(@PATH,13,-4113.85,424.8085,34.97233,0,0,0,0,100,0), -- 10:23:18
(@PATH,14,-4147.163,444.2449,34.1104,0,0,0,0,100,0), -- 10:23:38
(@PATH,15,-4157.673,454.7521,31.41072,0,0,0,0,100,0); -- 10:23:57

-- Pathing for Dragonmaw Shaman Entry: 21720 'TDB FORMAT' 
SET @NPC := 75803;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4294.086,`position_y`=400.621,`position_z`=81.62926 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,233, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4294.086,400.621,81.62926,0,25000,0,0,100,0), -- 10:13:30
(@PATH,2,-4292.586,399.621,81.62926,0,25000,0,0,100,0); -- 10:13:50

-- Pathing for Dragonmaw Shaman Entry: 21720 'TDB FORMAT' 
SET @NPC := 75798;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4244.082,`position_y`=315.9884,`position_z`=134.664 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4244.082,315.9884,134.664,0,0,0,0,100,0), -- 10:12:22
(@PATH,2,-4235.726,319.797,134.6712,0,0,0,0,100,0), -- 10:12:25
(@PATH,3,-4229.505,315.7428,134.6895,0,0,0,0,100,0), -- 10:12:28
(@PATH,4,-4194.724,303.9587,136.7709,0,0,0,0,100,0), -- 10:12:30
(@PATH,5,-4190.966,294.0813,135.7594,0,0,0,0,100,0), -- 10:12:45
(@PATH,6,-4183.756,287.0773,135.6553,0,0,0,0,100,0), -- 10:14:20
(@PATH,7,-4191.174,297.8928,136.033,0,0,0,0,100,0), -- 10:14:26
(@PATH,8,-4220.702,310.0533,134.9795,0,0,0,0,100,0), -- 10:14:30
(@PATH,9,-4229.358,315.7001,134.6958,0,0,0,0,100,0), -- 10:14:45
(@PATH,10,-4230.426,317.3666,134.676,0,0,0,0,100,0), -- 10:14:48
(@PATH,11,-4235.935,319.6286,134.6698,0,0,0,0,100,0), -- 10:14:50
(@PATH,12,-4255.562,318.7018,134.6108,0,0,0,0,100,0), -- 10:14:54
(@PATH,13,-4249.844,317.125,134.6809,0,0,0,0,100,0), -- 10:15:00
(@PATH,14,-4243.675,313.4105,134.6629,0,0,0,0,100,0), -- 10:15:06
(@PATH,15,-4235.89,308.923,134.6676,0,0,0,0,100,0), -- 10:15:08
(@PATH,16,-4230.517,310.4198,134.6871,0,0,0,0,100,0), -- 10:15:11
(@PATH,17,-4194.894,303.7994,136.77,0,0,0,0,100,0), -- 10:15:14
(@PATH,18,-4188.841,309.6393,135.933,0,0,0,0,100,0), -- 10:15:29
(@PATH,19,-4175.213,316.2365,135.7092,0,0,0,0,100,0), -- 10:15:34
(@PATH,20,-4161.508,360.043,141.9081,0,0,0,0,100,0), -- 10:15:40
(@PATH,21,-4171.737,320.0564,135.9073,0,0,0,0,100,0), -- 10:16:01
(@PATH,22,-4185.639,313.6697,135.3489,0,0,0,0,100,0), -- 10:16:20
(@PATH,23,-4191.21,305.0679,136.4015,0,0,0,0,100,0), -- 10:16:26
(@PATH,24,-4220.617,309.9903,134.8077,0,0,0,0,100,0), -- 10:16:31
(@PATH,25,-4229.755,310.8228,134.6904,0,0,0,0,100,0), -- 10:16:45
(@PATH,26,-4235.208,308.5773,134.6808,0,0,0,0,100,0), -- 10:16:48
(@PATH,27,-4243.492,313.3849,134.6674,0,0,0,0,100,0), -- 10:16:51
(@PATH,28,-4255.519,318.5628,134.6098,0,0,0,0,100,0), -- 10:16:54
(@PATH,29,-4249.62,317.301,134.6521,0,0,0,0,100,0); -- 10:17:00

-- Pathing for Dragonmaw Shaman Entry: 21720 'TDB FORMAT' 
SET @NPC := 75801;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4263.521,`position_y`=408.381,`position_z`=79.67068 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4263.521,408.381,79.67068,0,0,0,0,100,0), -- 10:12:48
(@PATH,2,-4275.601,391.1442,81.45609,0,0,0,0,100,0), -- 10:13:03
(@PATH,3,-4276.916,384.2662,79.99209,0,0,0,0,100,0), -- 10:13:13
(@PATH,4,-4272.852,367.3383,83.40826,0,0,0,0,100,0), -- 10:13:19
(@PATH,5,-4299.143,333.1703,109.8589,0,0,0,0,100,0), -- 10:13:24
(@PATH,6,-4291.638,298.5769,121.6239,0,0,0,0,100,0), -- 10:13:44
(@PATH,7,-4284.62,294.5884,122.3762,0,0,0,0,100,0), -- 10:14:00
(@PATH,8,-4265.867,286.0486,122.6935,0,0,0,0,100,0), -- 10:14:11
(@PATH,9,-4231.655,272.0292,122.6157,0,0,0,0,100,0), -- 10:14:22
(@PATH,10,-4221.664,271.404,122.5952,0,0,0,0,100,0), -- 10:14:30
(@PATH,11,-4221.826,271.2171,122.3309,0,0,0,0,100,0), -- 10:14:42
(@PATH,12,-4241.433,272.7845,122.9299,0,0,0,0,100,0), -- 10:14:50
(@PATH,13,-4243.721,273.0889,123.1742,0,0,0,0,100,0), -- 10:15:00
(@PATH,14,-4287.71,296.0865,122.0869,0,0,0,0,100,0), -- 10:15:09
(@PATH,15,-4299.358,330.6028,110.9833,0,0,0,0,100,0), -- 10:15:20
(@PATH,16,-4274.684,364.696,85.32684,0,0,0,0,100,0), -- 10:15:36
(@PATH,17,-4269.528,373.963,80.26889,0,0,0,0,100,0), -- 10:15:57
(@PATH,18,-4276.889,385.2,79.98441,0,0,0,0,100,0); -- 10:16:01

-- Dragonmaw Subjugator SAI
SET @ENTRY := 21718;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Subjugator - Out of Combat - Enable Combat Movement (No Repeat)"),
(@ENTRY,0,1,2,4,0,100,1,0,0,0,0,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dragonmaw Subjugator - On Aggro - Cast 'Shadow Bolt' (No Repeat)"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Subjugator - On Aggro - Increment Phase By 1 (No Repeat)"),
(@ENTRY,0,3,0,9,1,100,0,0,40,2400,3800,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dragonmaw Subjugator - Within 0-40 Range - Cast 'Shadow Bolt' (No Repeat)"),
(@ENTRY,0,4,5,3,1,100,1,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Subjugator - Between 0-15% Mana - Enable Combat Movement (Phase 1) (No Repeat)"),
(@ENTRY,0,5,0,61,1,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Subjugator - Between 0-15% Mana - Increment Phase By 1 (Phase 1) (No Repeat)"),
(@ENTRY,0,6,0,9,1,100,1,35,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Subjugator - Within 35-80 Range - Enable Combat Movement (Phase 1) (No Repeat)"),
(@ENTRY,0,7,0,9,1,100,1,5,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Subjugator - Within 5-15 Range - Disable Combat Movement (Phase 1) (No Repeat)"),
(@ENTRY,0,8,0,9,1,100,1,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Subjugator - Within 0-5 Range - Enable Combat Movement (Phase 1) (No Repeat)"),
(@ENTRY,0,9,0,3,2,100,0,30,100,100,100,23,0,1,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Subjugator - Between 30-100% Mana - Decrement Phase By 1 (Phase 1) (No Repeat)"),
(@ENTRY,0,10,11,2,0,100,1,0,15,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Subjugator - Between 0-15% Health - Set Event Phase 3 (No Repeat)"),
(@ENTRY,0,11,12,61,0,100,0,0,0,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Subjugator - Between 0-15% Health - Enable Combat Movement (No Repeat)"),
(@ENTRY,0,12,0,61,0,100,0,0,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Dragonmaw Subjugator - Between 0-15% Health - Flee For Assist (No Repeat)"),
(@ENTRY,0,13,0,6,0,100,1,0,0,0,0,33,22197,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dragonmaw Subjugator - On Just Died - Quest Credit 'Infiltrating Dragonmaw Fortress' (No Repeat)");

-- Pathing for Dragonmaw Subjugator Entry: 21718 'TDB FORMAT' 
SET @NPC := 75774;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4102.015,`position_y`=377.2606,`position_z`=30.89463 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4102.015,377.2606,30.89463,0,0,0,0,100,0), -- 10:20:43
(@PATH,2,-4108.736,382.3355,30.58962,0,0,0,0,100,0), -- 10:20:47
(@PATH,3,-4115.181,384.7361,30.83398,0,0,0,0,100,0), -- 10:20:49
(@PATH,4,-4115.945,392.739,30.79796,0,0,0,0,100,0), -- 10:20:53
(@PATH,5,-4111.743,392.8836,30.53397,0,0,0,0,100,0), -- 10:20:54
(@PATH,6,-4106.752,389.3356,30.54209,0,0,0,0,100,0), -- 10:20:57
(@PATH,7,-4103.535,395.7037,30.67706,0,0,0,0,100,0), -- 10:21:00
(@PATH,8,-4103.445,396.1037,30.62162,0,0,0,0,100,0), -- 10:21:02
(@PATH,9,-4099.806,402.0006,30.79059,0,0,0,0,100,0), -- 10:21:14
(@PATH,10,-4099.44,401.964,30.87934,0,0,0,0,100,0), -- 10:21:15
(@PATH,11,-4086.569,405.2619,30.82691,0,0,0,0,100,0), -- 10:21:21
(@PATH,12,-4089.497,392.9045,30.76514,0,0,0,0,100,0), -- 10:21:26
(@PATH,13,-4089.03,381.2375,31.16474,0,0,0,0,100,0), -- 10:21:31
(@PATH,14,-4091.608,379.7381,30.97511,0,0,0,0,100,0); -- 10:21:33

-- Pathing for Dragonmaw Subjugator Entry: 21718 'TDB FORMAT' 
SET @NPC := 75780;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4192.549,`position_y`=463.3147,`position_z`=30.76653 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4192.549,463.3147,30.76653,0,0,0,0,100,0), -- 10:21:58
(@PATH,2,-4188.431,467.3629,30.58786,0,0,0,0,100,0); -- 10:22:00
 
 
/* 
* sql\updates\world\2015_09_23_02_world.sql 
*/ 
-- 
SET @GUID1 := -78496;
SET @GUID2 := -52330;
UPDATE `creature` SET `position_x`= -4236.136230, `position_y`= 313.865417, `position_z`= 160.389038, `orientation`= 3.5595 WHERE `guid`= 78496;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (22317, 23188, 22253);
UPDATE `creature_template` SET `InhabitType`= 4 WHERE `entry`=23225;
DELETE FROM `creature` WHERE `guid` IN (132815, 132816, 132817) AND `id`=23188; -- remove wrong spawns
UPDATE `smart_scripts` SET `event_type`=25 WHERE `entryorguid`=23311 AND `source_type`=0 AND `id`=11; -- Fix an aura set by spawn instead of reset
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@GUID1, -52330, 23188, 22253) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (22317*100, 22317*100+1, 22317*100+2, 2318800, 2318801, 2318802, 2318803, 22253*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID1,0,0,0,1,0,100,0,2000,4000,12000,16000,12,23188,7,0,0,0,0,8,0,0,0,-4236.136230, 313.865417, 160.389038, 3.9795,"Netherwing Drake Escape Dummy - OOC - Summon Creature 'Dragonmaw Transporter'"),
(@GUID1,0,1,0,63,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Netherwing Drake Escape Dummy - Just created - Set active"),
(23188,0,0,0,54,0,100,0,0,0,0,0,87,2318800,2318801,2318802,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Transporter - Just summoned  - action list"),
(2318800,9,0,0,0,0,100,0,0,0,0,0,53,1,231880,0,0,0,2,1,0,0,0,0,0,0,0,"Dragonmaw Transporter - Action list - Start Waypoint"),
(2318800,9,1,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Transporter - Action list - Set Active On"),
(2318801,9,0,0,0,0,100,0,0,0,0,0,53,1,231881,0,0,0,2,1,0,0,0,0,0,0,0,"Dragonmaw Transporter - Action list - Start Waypoint"),
(2318801,9,1,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Transporter - Action list - Set Active On"),
(2318802,9,0,0,0,0,100,0,0,0,0,0,53,1,231882,0,0,0,2,1,0,0,0,0,0,0,0,"Dragonmaw Transporter - Action list - Start Waypoint"),
(2318802,9,1,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Transporter - Action list - Set Active On"),
(23188,0,1,0,58,0,100,0,27,231880,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Transporter - On Waypoint Finished - Despawn Instant"),
(23188,0,2,0,58,0,100,0,31,231881,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Transporter - On Waypoint Finished - Despawn Instant"),
(23188,0,3,0,58,0,100,0,25,231882,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Transporter - On Waypoint Finished - Despawn Instant"),
(23188,0,4,0,58,0,100,0,26,231883,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Transporter - On Waypoint Finished - Despawn Instant"),
(22253, 0, 0, 0, 0, 0, 100, 0, 3000, 5000, 7000, 7000, 11, 15496, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Dragonmaw Ascendant - IC - Cast Cleave"),
(22253, 0, 1, 0, 0, 0, 100, 0, 5000, 7000, 8000, 10000, 11, 17547, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Dragonmaw Ascendant - IC - Cast Mortal Strike"),
(22253, 0, 2, 0, 0, 0, 100, 0, 4000, 7000, 9000, 12000, 11, 10966, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Dragonmaw Ascendant - IC - Cast Uppercut"),
(@GUID2, 0, 0, 0, 0, 0, 100, 0, 3000, 5000, 7000, 7000, 11, 15496, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Dragonmaw Ascendant - IC - Cast Cleave"),
(@GUID2, 0, 1, 0, 0, 0, 100, 0, 5000, 7000, 8000, 10000, 11, 17547, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Dragonmaw Ascendant - IC - Cast Mortal Strike"),
(@GUID2, 0, 2, 0, 0, 0, 100, 0, 4000, 7000, 9000, 12000, 11, 10966, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Dragonmaw Ascendant - IC - Cast Uppercut"),
(@GUID2,0,3,0,1,0,100,0,2000,5000,12000,16000,12,23188,7,0,0,0,0,8,0,0,0,-4933.316895, 31.134706, 61.772137, 0.480736,"Dragonmaw Ascendant - OOC - Summon Creature 'Dragonmaw Transporter'"),
(@GUID2,0,4,0,63,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Ascendant - Just created - Set active"),
(23188,0,5,0,54,0,100,0,0,0,0,0,80,2318803,2,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Transporter - Just summoned - action list"),
(2318803,9,0,0,0,0,100,0,0,0,0,0,53,1,231883,0,0,0,2,1,0,0,0,0,0,0,0,"Dragonmaw Transporter - action list - Start Waypoint"),
(2318803,9,1,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonmaw Transporter - action list - Set Active On"),
(23188, 0, 6, 0, 0, 0, 100, 0, 3000, 5000, 7000, 7000, 11, 38861, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Dragonmaw Transporter- IC - Aimed Shot"),
(23188, 0, 7, 0, 0, 0, 100, 0, 5000, 7000, 8000, 10000, 11, 19503, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Dragonmaw Transporter - IC - Scatter Shot"),
(23188, 0, 8, 0, 0, 0, 100, 0, 4000, 7000, 9000, 12000, 11, 38859, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Dragonmaw Transporter - IC - Serpent Sting"),
(23188, 0, 9, 0, 0, 0, 100, 0, 1000, 2000, 3000, 4000, 11, 38858, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Dragonmaw Transporter - IC - Shoot");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceEntry=23188;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorTextId, ScriptName, Comment) VALUES
(22, 1, 23188, 0, 0, 23, 0, 3939, 0, 0, 0, 0, '', 'Execute SmartAI for Dragonmaw Transporter if the area is 3759'),
(22, 6, 23188, 0, 0, 23, 0, 3759, 0, 0, 0, 0, '', 'Execute SmartAI for Dragonmaw Transporter if the area is 3759');

SET @PATH := 231880;
DELETE FROM `waypoints` WHERE `entry`=@PATH;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@PATH,1,-4234.259,316.7951,194.5695, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,2,-4278.778,291.9364,162.6098, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,3,-4315.755,272.5735,162.6098, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,4,-4332.82,267.5372,162.6098, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,5,-4354.233,260.8795,162.6098, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,6,-4391.55,249.5022,162.6098, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,7,-4429.059,238.4517,162.6098, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,8,-4470.008,227.2337,162.6098, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,9,-4489.761,222.9549,162.6098, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,10,-4502.434,220.6088,162.6098, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,11,-4528.817,218.5281,162.6098, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,12,-4546.15,218.6741,162.6098, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,13,-4595.704,217.5207,162.6098, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,14,-4641.978,205.2794,147.0265, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,15,-4662.014,198.3955,118.6931, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,16,-4686.042,195.7724,92.6098, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,17,-4720.744,183.9892,92.33202, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,18,-4745.649,173.8856,98.19311, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,19,-4756.257,154.736,105.7487, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,20,-4761.057,143.5172,108.3876, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,21,-4787.247,129.8356,110.6098, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,22,-4815.383,124.4918,109.6376, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,23,-4841.104,99.13585,116.1653, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,24,-4876.217,68.20888,99.16536, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,25,-4887.112,56.80024,92.74867, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,26,-4921.727,36.11827,73.94312, 'Dragonmaw Transporter'), -- 07:14:59
(@PATH,27,-4924.737,36.20354,61.87088, 'Dragonmaw Transporter'); -- 07:14:59
-- 0x1C09FC424016A500000019000022323C .go -4234.259 316.7951 194.5695
 
-- Pathing for Dragonmaw Transporter Entry: 23188 'TDB FORMAT'
SET @PATH := 231881;
DELETE FROM `waypoints` WHERE `entry`=@PATH;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@PATH,1,-4235.772,310.6806,195.9172, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,2,-4266.868,305.2986,170.0554, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,3,-4289.381,299.2866,169.0554, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,4,-4313.463,296.8451,169.0554, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,5,-4334.991,295.7913,169.0554, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,6,-4355.52,290.1741,169.0554, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,7,-4382.983,278.409,169.0554, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,8,-4419.237,271.8036,169.0554, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,9,-4448.44,268.7892,169.0554, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,10,-4463.974,265.9718,169.0554, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,11,-4486.522,265.1359,165.4998, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,12,-4515.319,266.4659,154.3332, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,13,-4538.145,266.9955,143.7777, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,14,-4565.51,267.0066,134.7498, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,15,-4574.724,266.6996,130.4999, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,16,-4585.344,265.8585,125.2221, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,17,-4610.452,266.8059,114.0276, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,18,-4648.119,265.0245,89.41651, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,19,-4679.999,264.3499,80.02769, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,20,-4726.6,265.6508,91.11095, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,21,-4757.61,263.9644,96.61092, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,22,-4790.494,252.6213,107.7221, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,23,-4830.46,243.5237,113.6109, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,24,-4850.946,232.3608,114.611, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,25,-4865.539,204.393,115.9165, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,26,-4867.515,184.822,112.5276, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,27,-4869.98,147.345,96.99986, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,28,-4875.779,115.5371,89.69432, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,29,-4900.512,79.47276,79.22215, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,30,-4920.873,41.16504,69.30544, 'Dragonmaw Transporter'), -- 07:15:20
(@PATH,31,-4924.737,36.20354,61.87088, 'Dragonmaw Transporter'); -- 07:15:20
-- 0x1C09FC424016A5000000190000223259 .go -4235.772 310.6806 195.9172
 
-- Pathing for Dragonmaw Transporter Entry: 23188 'TDB FORMAT'
SET @PATH := 231882;
DELETE FROM `waypoints` WHERE `entry`=@PATH;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@PATH,1,-4235.186,312.622,195.6112, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,2,-4234.272,312.2153,195.6112, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,3,-4293.566,245.1756,179.3634, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,4,-4305.508,238.4082,179.3634, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,5,-4329.843,217.8027,179.3634, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,6,-4362.729,186.0796,186.419, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,7,-4434.846,123.756,230.3912, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,8,-4459.073,85.18902,233.9189, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,9,-4482.534,56.35666,232.5023, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,10,-4493.029,34.64518,235.1689, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,11,-4503.293,2.772352,232.5856, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,12,-4536.873,-16.30306,224.7523, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,13,-4579.444,-18.38878,223.5301, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,14,-4611.417,9.642578,219.03, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,15,-4660.565,11.25814,228.7522, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,16,-4698.878,14.15853,227.3911, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,17,-4734.97,25.07422,223.0023, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,18,-4766.538,46.62153,220.8356, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,19,-4794.966,67.12045,197.8634, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,20,-4815.075,72.55089,183.6967, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,21,-4855.917,67.18316,133.6689, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,22,-4868.51,61.47526,116.2801, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,23,-4890.089,51.30317,92.11338, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,24,-4922.806,35.50499,72.91895, 'Dragonmaw Transporter'), -- 07:18:37
(@PATH,25,-4924.737,36.20354,61.87088, 'Dragonmaw Transporter'); -- 07:18:37
-- 0x1C09FC424016A50000001900002232FF .go -4235.186 312.622 195.6112
 
-- Pathing for Dragonmaw Transporter Entry: 23188 'TDB FORMAT'
SET @PATH := 231883;
DELETE FROM `waypoints` WHERE `entry`=@PATH;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@PATH,1,-4921.116,38.40239,62.79848, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,2,-4920.266,38.92785,62.79848, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,3,-4911.522,44.50662,65.54009, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,4,-4897.991,49.12988,69.23454, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,5,-4854.699,71.66743,69.23454, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,6,-4811.554,91.95888,69.23454, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,7,-4782.642,107.2382,69.23454, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,8,-4749.689,123.6898,102.4568, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,9,-4717.377,120.1987,102.5401, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,10,-4677.343,111.8249,122.37344, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,11,-4642.299,106.9923,122.62343, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,12,-4595.685,101.0696,122.23454, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,13,-4568.682,107.7912,122.23454, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,14,-4532.451,105.1658,122.23454, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,15,-4502.495,109.315,122.23454, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,16,-4478.215,118.6488,122.23454, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,17,-4437.049,132.6271,122.23454, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,18,-4401.484,131.5858,122.23454, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,19,-4360.693,156.9551,122.37343, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,20,-4324.191,184.9894,122.9568, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,21,-4299.081,216.2382,141.7901, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,22,-4292.715,227.4521,179.9077, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,23,-4281.613,263.6761,179.9077, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,24,-4260.6,294.3777,179.9077, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,25,-4240.507,326.8979,154.0465, 'Dragonmaw Transporter'), -- 07:15:14
(@PATH,26,-4240.507,326.8979,154.0465, 'Dragonmaw Transporter'); -- 07:15:14
-- 0x1C09FC424016A5000000190000223269 .go -4921.116 38.40239 62.79848
 
 
/* 
* sql\updates\world\2015_09_23_03_world.sql 
*/ 
-- 
SET @DredgeWorm:=      8925;
SET @DeepStinger:=     8926;
SET @DarkScreecher:=   8927;
SET @Burrowing:=       8928;
SET @Creeper:=         8933;
SET @Beetle:=          8932;
SET @Gorosh:=          9027;
SET @Grizzle:=         9028;
SET @Eviscerator:=     9029;
SET @Okthor:=          9030;
SET @Anubshiah:=       9031;
SET @Hedrum:=          9032;

UPDATE `creature_template` SET `AIName`="SmartAI", `ScriptName`='' WHERE `entry` IN (@DredgeWorm, @DeepStinger, @DarkScreecher, @Burrowing, @Creeper, @Beetle, @Gorosh, @Grizzle, @Eviscerator, @Okthor, @Anubshiah, @Hedrum);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@DredgeWorm, @DeepStinger, @DarkScreecher, @Burrowing, @Creeper, @Beetle, @Gorosh, @Grizzle, @Eviscerator, @Okthor, @Anubshiah, @Hedrum) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@DredgeWorm,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"@DredgeWorm - Just summoned - Start Attack"),
(@DeepStinger,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"@DredgeWorm - Just summoned - Start Attack"),
(@DarkScreecher,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"@DredgeWorm - Just summoned - Start Attack"),
(@Burrowing,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"@DredgeWorm - Just summoned - Start Attack"),
(@Creeper,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"@DredgeWorm - Just summoned - Start Attack"),
(@Beetle,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"@DredgeWorm - Just summoned - Start Attack"),
(@Gorosh,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"@DredgeWorm - Just summoned - Start Attack"),
(@Grizzle,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"@DredgeWorm - Just summoned - Start Attack"),
(@Eviscerator,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"@DredgeWorm - Just summoned - Start Attack"),
(@Okthor,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"@DredgeWorm - Just summoned - Start Attack"),
(@Anubshiah,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"@DredgeWorm - Just summoned - Start Attack"),
(@Hedrum,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"@DredgeWorm - Just summoned - Start Attack"),
(@DredgeWorm,0,1,0,0,0,100,0,3000,4000,10000,15000,11,14535,0,0,0,0,0,5,0,0,0,0,0,0,0,"Dredge Worm - In Combat - Cast Dredge Sickness"),
(@DredgeWorm,0,2,0,0,0,100,0,4000,4000,8000,8000,11,13298,32,0,0,0,0,5,0,0,0,0,0,0,0,"Dredge Worm - In Combat - Cast Poison"),
(@DredgeWorm,0,3,0,0,0,100,0,5000,6000,3000,3000,11,6917,0,0,0,0,0,5,0,0,0,0,0,0,0,"Dredge Worm - In Combat - Cast Venom Spit)"),
(@DeepStinger,0,1,0,0,0,100,0,2000,2000,6000,8000,11,14534,0,0,0,0,0,5,0,0,0,0,0,0,0,"Deep Stinger - In Combat - Cast Barbed Sting"),
(@DeepStinger,0,2,0,0,0,100,0,4000,4000,4000,4000,11,40504,0,0,0,0,0,2,0,0,0,0,0,0,0,"Deep Stinger - In Combat - Cast Cleave"),
(@DarkScreecher,0,1,0,0,0,100,0,2000,2000,6000,8000,11,14538,0,0,0,0,0,5,0,0,0,0,0,0,0,"Dark Screecher - In Combat - Cast Aural Shock"),
(@DarkScreecher,0,2,0,0,0,100,0,4000,4000,9000,10000,11,8281,0,0,0,0,0,5,0,0,0,0,0,0,0,"Dark Screecher - In Combat - Cast Sonic Burst"),
(@Burrowing,0,1,0,0,0,100,0,2000,2000,30000,30000,11,14533,0,0,0,0,0,5,0,0,0,0,0,0,0,"Burrowing Thundersnout - In Combat - Cast Disjonction"),
(@Burrowing,0,2,0,0,0,100,0,3000,3000,3000,3000,11,15611,0,0,0,0,0,5,0,0,0,0,0,0,0,"Burrowing Thundersnout - In Combat - Cast Lizard Bolt"),
(@Burrowing,0,3,0,0,0,100,0,5000,5000,8000,8000,11,15548,0,0,0,0,0,5,0,0,0,0,0,0,0,"Burrowing Thundersnout - In Combat - Cast Thunderclap"),
(@Creeper,0,1,0,0,0,100,0,2000,2000,20000,20000,11,14532,0,0,0,0,0,5,0,0,0,0,0,0,0,"Cave Creeper - In Combat - Cast Creeper Venom"),
(@Creeper,0,2,0,0,0,100,0,4000,4000,8000,8000,11,745,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cave Creeper - In Combat - Cast Web"),
(@Creeper,0,3,0,0,0,100,0,5000,6000,4000,8000,11,15656,0,0,0,0,0,5,0,0,0,0,0,0,0,"Cave Creeper - In Combat - Cast Poisonous Stab"),
(@Beetle,0,1,0,0,0,100,0,2000,2000,30000,30000,11,14539,0,0,0,0,0,2,0,0,0,0,0,0,0,"Borer Beetle - In Combat - Cast Putrid Enzyme"),
(@Beetle,0,2,0,0,0,100,0,4000,4000,15000,20000,11,6016,0,0,0,0,0,5,0,0,0,0,0,0,0,"Borer Beetle - In Combat - Cast Pierce Armor"),
(@Gorosh,0,1,0,0,0,100,0,2000,4000,6000,8000,11,13736,0,0,0,0,0,2,0,0,0,0,0,0,0,"Gorosh the Dervish - In Combat - Cast Whirlwind"),
(@Gorosh,0,2,0,0,0,100,0,4000,6000,5000,6000,11,15708,0,0,0,0,0,2,0,0,0,0,0,0,0,"Gorosh the Dervish - In Combat - Cast Mortal Strike"),
(@Gorosh,0,3,0,0,0,100,1,10000,15000,10000,15000,11,21049,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gorosh the Dervish - In Combat - Cast Bloodlust"),
(@Grizzle,0,1,0,0,0,100,0,2000,3000,4000,5000,11,40504,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grizzle the Dervish - In Combat - Cast Cleave"),
(@Grizzle,0,2,0,0,0,100,0,4000,5000,8000,9000,11,6524,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grizzle the Dervish - In Combat - Cast Ground Tremor"),
(@Grizzle,0,3,0,0,0,100,1,10000,15000,10000,15000,11,8269,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grizzle the Dervish - In Combat - Cast Frenzy"),
(@Grizzle,0,4,0,0,0,100,0,6000,7000,6000,9000,11,24458,0,0,0,0,0,5,0,0,0,0,0,0,0,"Grizzle the Dervish - In Combat - Cast Shadow Shock"),
(@Eviscerator,0,1,0,0,0,100,0,2000,3000,14000,15000,11,14331,0,0,0,0,0,2,0,0,0,0,0,0,0,"Eviscerator - In Combat - Cast Vicious Rend"),
(@Eviscerator,0,2,0,0,0,100,0,4000,5000,4000,5000,11,15245,0,0,0,0,0,2,0,0,0,0,0,0,0,"Eviscerator - In Combat - Cast Shadow Bolt Volley"),
(@Eviscerator,0,3,0,0,0,100,0,5000,6000,15000,16000,11,8269,0,0,0,0,0,1,0,0,0,0,0,0,0,"Eviscerator - In Combat - Cast Anti-Magic Shield"),
(@Okthor,0,1,0,0,0,100,0,2000,3000,4000,5000,11,15254,0,0,0,0,0,2,0,0,0,0,0,0,0,"Okthor - In Combat - Cast Arcane Bolt"),
(@Okthor,0,2,0,0,0,100,0,5000,6000,6000,7000,11,15453,0,0,0,0,0,2,0,0,0,0,0,0,0,"Okthor - In Combat - Cast Arcane Explosion"),
(@Okthor,0,3,0,0,0,100,0,9000,11000,11000,12000,11,13323,0,0,0,0,0,5,0,0,0,0,0,0,0,"Okthor - In Combat - Cast Polymorph"),
(@Okthor,0,4,0,0,0,100,0,7000,8000,9000,10000,11,13747,0,0,0,0,0,5,0,0,0,0,0,0,0,"Okthor - In Combat - Cast Slow"),
(@Anubshiah,0,1,0,0,0,100,0,5000,7000,10000,11000,11,8994,0,0,0,0,0,5,0,0,0,0,0,0,0,"Anubshiah - In Combat - Cast Banish"),
(@Anubshiah,0,2,0,0,0,100,0,2000,3000,8000,9000,11,15470,0,0,0,0,0,5,0,0,0,0,0,0,0,"Anubshiah - In Combat - Cast Curse of Tongues"),
(@Anubshiah,0,3,0,0,0,100,0,4000,5000,13000,15000,11,12493,0,0,0,0,0,5,0,0,0,0,0,0,0,"Anubshiah - In Combat - Cast Curse of Weakness"),
(@Anubshiah,0,4,0,0,0,100,0,1000,1000,300000,300000,11,13787,0,0,0,0,0,1,0,0,0,0,0,0,0,"Anubshiah - In Combat - Cast Demon Armor"),
(@Anubshiah,0,5,0,0,0,100,0,7000,8000,10000,13000,11,15471,0,0,0,0,0,5,0,0,0,0,0,0,0,"Anubshiah - In Combat - Cast Enveloping Web"),
(@Anubshiah,0,6,0,0,0,100,0,3000,4000,4000,5000,11,15472,0,0,0,0,0,5,0,0,0,0,0,0,0,"Anubshiah - In Combat - Cast Shadow Bolt"),
(@Hedrum,0,1,0,0,0,100,0,2000,2000,15000,18000,11,15475,0,0,0,0,0,5,0,0,0,0,0,0,0,"Hedrum - In Combat - Cast Baneful Poison"),
(@Hedrum,0,2,0,0,0,100,0,7000,9000,15000,18000,11,3609,0,0,0,0,0,5,0,0,0,0,0,0,0,"Hedrum - In Combat - Cast Paralyzing Poison"),
(@Hedrum,0,3,0,0,0,100,1,10000,15000,20000,25000,11,15474,0,0,0,0,0,5,0,0,0,0,0,0,0,"Hedrum - In Combat - Cast Web Explosion");

UPDATE `creature_template` SET `unit_flags`=131904 WHERE `entry`=10096;
DELETE FROM `creature_template_addon` WHERE `entry` IN (@DeepStinger);
INSERT INTO `creature_template_addon` (`entry`, `bytes2`, `auras`) VALUES 
(@DeepStinger, 1, '8601');

UPDATE `creature_text` SET `groupid`=4, `id`=1 WHERE `BroadcastTextId`=5441 AND `entry`=10096;
UPDATE `creature_text` SET `groupid`=0, `id`=1 WHERE `BroadcastTextId`=5442 AND `entry`=10096;
UPDATE `creature_text` SET `groupid`=1, `id`=1 WHERE `BroadcastTextId`=5443 AND `entry`=10096;
UPDATE `creature_text` SET `groupid`=5, `id`=1 WHERE `BroadcastTextId`=5444 AND `entry`=10096;
UPDATE `creature_text` SET `groupid`=2, `id`=1 WHERE `BroadcastTextId`=5445 AND `entry`=10096;
UPDATE `creature_text` SET `groupid`=3, `id`=1 WHERE `BroadcastTextId`=5446 AND `entry`=10096;
UPDATE `creature_text` SET `id`=0 WHERE `entry`=10096;
 
 
/* 
* sql\updates\world\2015_09_23_04_world.sql 
*/ 
UPDATE `creature_loot_template` SET `Chance`=100 WHERE  `Entry`=23188 AND `Item`=32509;
 
 
/* 
* sql\updates\world\2015_09_23_05_world.sql 
*/ 
--
UPDATE `creature_formations` SET `point_1`=2, `point_2`=8 WHERE `leaderGUID`=126083 AND `memberGUID`<>126083;
UPDATE `creature_formations` SET `point_1`=1, `point_2`=5 WHERE `leaderGUID`=201700 AND `memberGUID`<>201700;
UPDATE `creature_formations` SET `point_1`=5, `point_2`=11 WHERE `leaderGUID`=202823 AND `memberGUID`<>202823;
UPDATE `creature_formations` SET `point_1`=1, `point_2`=8 WHERE `leaderGUID`=126981 AND `memberGUID`<>126981;
UPDATE `creature_formations` SET `point_1`=3, `point_2`=7 WHERE `leaderGUID`=131931 AND `memberGUID`<>131931;
UPDATE `creature_formations` SET `point_1`=1, `point_2`=5 WHERE `leaderGUID`=131920 AND `memberGUID`<>131920;
UPDATE `creature_formations` SET `point_1`=1, `point_2`=5 WHERE `leaderGUID`=131926 AND `memberGUID`<>131926;
UPDATE `creature_formations` SET `point_1`=1, `point_2`=10 WHERE `leaderGUID`=202231 AND `memberGUID`<>202231;
 
 
/* 
* sql\updates\world\2015_09_24_00_world.sql 
*/ 
-- Pathing for Death Knight Captain Entry: 16145 'TDB FORMAT' 
SET @NPC := 127640;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2556.952,`position_y`=-3294.904,`position_z`=267.5933 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2556.952,`position_y`=-3294.904,`position_z`=267.5933 WHERE `guid` IN (127685,127686,127656,127657);
DELETE FROM `creature_addon` WHERE `guid` IN (127685,127686,127656,127657);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(127685,@PATH,0,0,1,0, ''), (127686,@PATH,0,0,1,0, ''), (127656,@PATH,0,0,1,0, ''), (127657,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2556.952,-3294.904,267.5933,0,0,0,0,100,0),
(@PATH,2,2556.655,-3273.629,266.7731,0,0,0,0,100,0),
(@PATH,3,2556.505,-3258.446,260.2637,0,0,0,0,100,0),
(@PATH,4,2556.29,-3229.774,245.2207,0,0,0,0,100,0),
(@PATH,5,2555.99,-3205.854,240.5267,0,0,0,0,100,0),
(@PATH,6,2555.881,-3183.735,240.5253,0,0,0,0,100,0),
(@PATH,7,2556.055,-3164.447,240.5253,0,0,0,0,100,0),
(@PATH,8,2556.121,-3141.804,240.5253,0,0,0,0,100,0),
(@PATH,9,2556.055,-3164.447,240.5253,0,0,0,0,100,0),
(@PATH,10,2555.881,-3183.735,240.5253,0,0,0,0,100,0),
(@PATH,11,2555.99,-3205.854,240.5267,0,0,0,0,100,0),
(@PATH,12,2556.29,-3229.774,245.2207,0,0,0,0,100,0),
(@PATH,13,2556.505,-3258.446,260.2637,0,0,0,0,100,0),
(@PATH,14,2556.655,-3273.629,266.7731,0,0,0,0,100,0),
(@PATH,15,2556.952,-3294.904,267.5933,0,0,0,0,100,0),
(@PATH,16,2556.716,-3318.195,267.593,0,0,0,0,100,0),
(@PATH,17,2556.767,-3335.356,267.593,0,0,0,0,100,0),
(@PATH,18,2556.716,-3318.195,267.593,0,0,0,0,100,0);

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127640);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127640,127640,0,0,2,0,0),
(127640,127685,3,360,2,8,17),
(127640,127686,3,40,2,8,17),
(127640,127656,3,320,2,8,17),
(127640,127657,3,260,2,8,17);

-- Pathing for Death Knight Captain Entry: 16145 'TDB FORMAT' 
SET @NPC := 127641;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2540.547,`position_y`=-3209.821,`position_z`=240.5256 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2540.547,`position_y`=-3209.821,`position_z`=240.5256 WHERE `guid` IN (127687,127688,127658,127659);
DELETE FROM `creature_addon` WHERE `guid` IN (127687,127688,127658,127659);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(127687,@PATH,0,0,1,0, ''), (127688,@PATH,0,0,1,0, ''), (127658,@PATH,0,0,1,0, ''), (127659,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2540.547,-3209.821,240.5256,0,0,0,0,100,0),
(@PATH,2,2550.174,-3195.296,240.5253,0,0,0,0,100,0),
(@PATH,3,2550.015,-3178.325,240.5252,0,0,0,0,100,0),
(@PATH,4,2542.807,-3161.292,240.5246,0,0,0,0,100,0),
(@PATH,5,2531.76,-3145.814,240.5244,0,0,0,0,100,0),
(@PATH,6,2526.761,-3124.435,240.5252,0,0,0,0,100,0),
(@PATH,7,2535.071,-3107.707,240.5244,0,0,0,0,100,0),
(@PATH,8,2553.146,-3099.002,240.5252,0,0,0,0,100,0),
(@PATH,9,2568.556,-3098.702,240.5253,0,0,0,0,100,0),
(@PATH,10,2586.523,-3091.121,240.5253,0,0,0,0,100,0),
(@PATH,11,2599.675,-3076.474,240.5264,0,0,0,0,100,0),
(@PATH,12,2599.267,-3055.494,240.5239,0,0,0,0,100,0),
(@PATH,13,2618.495,-3035.821,240.5235,0,0,0,0,100,0),
(@PATH,14,2634.81,-3052.702,240.5237,0,0,0,0,100,0),
(@PATH,15,2651.288,-3069.151,240.5216,0,0,0,0,100,0),
(@PATH,16,2628.244,-3086.696,240.5232,0,0,0,0,100,0),
(@PATH,17,2608.684,-3085.287,240.5264,0,0,0,0,100,0),
(@PATH,18,2595.005,-3098.484,240.5253,0,0,0,0,100,0),
(@PATH,19,2587.623,-3116.573,240.5246,0,0,0,0,100,0),
(@PATH,20,2586.39,-3131.935,240.525,0,0,0,0,100,0),
(@PATH,21,2577.873,-3150.335,240.524,0,0,0,0,100,0),
(@PATH,22,2565.028,-3163.529,240.5253,0,0,0,0,100,0),
(@PATH,23,2559.751,-3177.576,240.5253,0,0,0,0,100,0),
(@PATH,24,2559.432,-3195.028,240.5254,0,0,0,0,100,0),
(@PATH,25,2570.551,-3210.158,240.5293,0,0,0,0,100,0),
(@PATH,26,2555.933,-3210.18,240.5274,0,0,0,0,100,0);

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127641);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127641,127641,0,0,2,0,0),
(127641,127687,3,360,2,0,0),
(127641,127688,3,40,2,0,0),
(127641,127658,3,320,2,0,0),
(127641,127659,3,260,2,0,0);

-- Pathing for Death Knight Captain Entry: 16145 'TDB FORMAT' 
SET @NPC := 127642;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2781.675,`position_y`=-2973.126,`position_z`=240.5271 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2781.675,`position_y`=-2973.126,`position_z`=240.5271 WHERE `guid` IN (127689,127690,127660,127661);
DELETE FROM `creature_addon` WHERE `guid` IN (127689,127690,127660,127661);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(127689,@PATH,0,0,1,0, ''), (127690,@PATH,0,0,1,0, ''), (127660,@PATH,0,0,1,0, ''), (127661,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2781.675,-2973.126,240.5271,0,0,0,0,100,0),
(@PATH,2,2781.545,-2987.27,240.5265,0,0,0,0,100,0),
(@PATH,3,2781.296,-2999.196,240.5251,0,0,0,0,100,0),
(@PATH,4,2761.818,-2991.876,240.525,0,0,0,0,100,0),
(@PATH,5,2741.577,-2996.512,240.5255,0,0,0,0,100,0),
(@PATH,6,2720.587,-3007.503,240.5255,0,0,0,0,100,0),
(@PATH,7,2702.402,-3013.772,240.5244,0,0,0,0,100,0),
(@PATH,8,2678.602,-3021.83,240.5253,0,0,0,0,100,0),
(@PATH,9,2662.359,-3033.787,240.5253,0,0,0,0,100,0),
(@PATH,10,2656.579,-3044.628,240.5232,0,0,0,0,100,0),
(@PATH,11,2654.518,-3070.607,240.5216,0,0,0,0,100,0),
(@PATH,12,2642.806,-3082.523,240.5241,0,0,0,0,100,0),
(@PATH,13,2625.915,-3067.382,240.5231,0,0,0,0,100,0),
(@PATH,14,2613.159,-3055.652,240.5243,0,0,0,0,100,0),
(@PATH,15,2603.647,-3046.96,240.5242,0,0,0,0,100,0),
(@PATH,16,2613.084,-3036.567,240.5217,0,0,0,0,100,0),
(@PATH,17,2640.296,-3028.944,240.525,0,0,0,0,100,0),
(@PATH,18,2652.006,-3024.45,240.5253,0,0,0,0,100,0),
(@PATH,19,2664.795,-3009.59,240.5253,0,0,0,0,100,0),
(@PATH,20,2670.619,-2990.552,240.5244,0,0,0,0,100,0),
(@PATH,21,2679.347,-2964.029,240.5253,0,0,0,0,100,0),
(@PATH,22,2697.98,-2955.501,240.5241,0,0,0,0,100,0),
(@PATH,23,2719.132,-2962.616,240.5251,0,0,0,0,100,0),
(@PATH,24,2741.907,-2976.874,240.5253,0,0,0,0,100,0),
(@PATH,25,2760.453,-2981.653,240.5253,0,0,0,0,100,0);

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127642);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127642,127642,0,0,2,0,0),
(127642,127689,3,360,2,0,0),
(127642,127690,3,40,2,0,0),
(127642,127660,3,320,2,0,0),
(127642,127661,3,260,2,0,0);

-- Pathing for Death Knight Captain Entry: 16145 'TDB FORMAT' 
SET @NPC := 127645;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2584.613,`position_y`=-3100.685,`position_z`=240.5253 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2584.613,`position_y`=-3100.685,`position_z`=240.5253 WHERE `guid` IN (127691,127692,127664,127665);
DELETE FROM `creature_addon` WHERE `guid` IN (127691,127692,127664,127665);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(127691,@PATH,0,0,1,0, ''), (127692,@PATH,0,0,1,0, ''), (127664,@PATH,0,0,1,0, ''), (127665,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2584.613,-3100.685,240.5253,0,0,0,0,100,0),
(@PATH,2,2601.56,-3083.452,240.5258,0,0,0,0,100,0),
(@PATH,3,2629.143,-3055.421,240.5237,0,0,0,0,100,0),
(@PATH,4,2650.178,-3034.592,240.526,0,0,0,0,100,0),
(@PATH,5,2667.962,-3017.14,240.5253,0,0,0,0,100,0),
(@PATH,6,2680.883,-3004.51,240.5252,0,0,0,0,100,0),
(@PATH,7,2699.352,-2986.865,240.5253,0,0,0,0,100,0),
(@PATH,8,2680.883,-3004.51,240.5252,0,0,0,0,100,0),
(@PATH,9,2667.962,-3017.14,240.5253,0,0,0,0,100,0),
(@PATH,10,2650.178,-3034.592,240.526,0,0,0,0,100,0),
(@PATH,11,2629.143,-3055.421,240.5237,0,0,0,0,100,0),
(@PATH,12,2601.56,-3083.452,240.5258,0,0,0,0,100,0),
(@PATH,13,2584.613,-3100.685,240.5253,0,0,0,0,100,0),
(@PATH,14,2570.169,-3114.794,240.5253,0,0,0,0,100,0),
(@PATH,15,2556.747,-3128.429,240.5253,0,0,0,0,100,0),
(@PATH,16,2570.169,-3114.794,240.5253,0,0,0,0,100,0);

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127645);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127645,127645,0,0,2,0,0),
(127645,127691,3,360,2,7,15),
(127645,127692,3,40,2,7,15),
(127645,127664,3,320,2,7,15),
(127645,127665,3,260,2,7,15);

-- Pathing for Death Knight Captain Entry: 16145 'TDB FORMAT' 
SET @NPC := 127649;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2871.322,`position_y`=-2985.748,`position_z`=267.593 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2871.322,`position_y`=-2985.748,`position_z`=267.593 WHERE `guid` IN (127701,127702,127670,127671);
DELETE FROM `creature_addon` WHERE `guid` IN (127701,127702,127670,127671);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(127701,@PATH,0,0,1,0, ''), (127702,@PATH,0,0,1,0, ''), (127670,@PATH,0,0,1,0, ''), (127671,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2871.322,-2985.748,267.593,0,0,0,0,100,0),
(@PATH,2,2852.31,-2985.821,267.593,0,0,0,0,100,0),
(@PATH,3,2838.662,-2985.802,264.0277,0,0,0,0,100,0),
(@PATH,4,2807.427,-2985.919,248.8516,0,0,0,0,100,0),
(@PATH,5,2784.644,-2986.206,240.5265,0,0,0,0,100,0),
(@PATH,6,2760.957,-2986.261,240.5249,0,0,0,0,100,0),
(@PATH,7,2735.987,-2986.227,240.5253,0,0,0,0,100,0),
(@PATH,8,2716.594,-2986.268,240.5253,0,0,0,0,100,0),
(@PATH,9,2700.477,-2986.242,240.525,0,0,0,0,100,0),
(@PATH,10,2716.594,-2986.268,240.5253,0,0,0,0,100,0),
(@PATH,11,2735.987,-2986.227,240.5253,0,0,0,0,100,0),
(@PATH,12,2760.708,-2986.261,240.5253,0,0,0,0,100,0),
(@PATH,13,2784.644,-2986.206,240.5265,0,0,0,0,100,0),
(@PATH,14,2807.427,-2985.919,248.8516,0,0,0,0,100,0),
(@PATH,15,2838.662,-2985.802,264.0277,0,0,0,0,100,0),
(@PATH,16,2852.31,-2985.821,267.593,0,0,0,0,100,0),
(@PATH,17,2871.322,-2985.748,267.593,0,0,0,0,100,0),
(@PATH,18,2893.314,-2985.45,267.593,0,0,0,0,100,0),
(@PATH,19,2908.467,-2985.152,267.5937,0,0,0,0,100,0),
(@PATH,20,2893.314,-2985.45,267.593,0,0,0,0,100,0);

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127649);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127649,127649,0,0,2,0,0),
(127649,127701,3,360,2,9,19),
(127649,127702,3,40,2,9,19),
(127649,127670,3,320,2,9,19),
(127649,127671,3,260,2,9,19);
 
 
/* 
* sql\updates\world\2015_09_24_01_world.sql 
*/ 
--
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127640);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127640,127640,0,0,2,0,0),
(127640,127685,3,360,2,0,0),
(127640,127686,3,40,2,0,0),
(127640,127656,3,320,2,0,0),
(127640,127657,3,260,2,0,0);
 
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127645);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127645,127645,0,0,2,0,0),
(127645,127691,3,360,2,0,0),
(127645,127692,3,40,2,0,0),
(127645,127664,3,320,2,0,0),
(127645,127665,3,260,2,0,0);
 
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127649);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127649,127649,0,0,2,0,0),
(127649,127701,3,360,2,0,0),
(127649,127702,3,40,2,0,0),
(127649,127670,3,320,2,0,0),
(127649,127671,3,260,2,0,0);
 
 
/* 
* sql\updates\world\2015_09_24_02_world.sql 
*/ 
-- 
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `Entry` IN (29698, 26043);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (29698, 26043) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29698,0,0,0,4,0,100,0,0,0,0,0,11,54487,0,0,0,0,0,2,0,0,0,0,0,0,0,'Drakuru Raptor - On aggro - Cast Jump Attack'),
(26043,0,0,0,1,0,100,0,2000,8000,8000,15000,11,46400,0,0,0,0,0,1,0,0,0,0,0,0,0,'Steam Burst - OOC - Cast Steam Weapon');

UPDATE `creature_equip_template` SET `ItemID1`=21573, `ItemID2`=143 WHERE `creatureid`=27160;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `Entry`=27375;

DELETE FROM `creature_template_addon` WHERE `entry`= 27268;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES (27268,0,0,1,48553);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (13) AND `SourceEntry`=48551;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`, `NegativeCondition`) VALUES
(13, 1, 48551, 0, 31, 3, 27375, 0, 0, '', 'Vengeful Stormhammer only on Risen Gryphon Rider Target', 0);

DELETE FROM `creature_addon` WHERE `guid`= 86097;
DELETE FROM `waypoint_data` WHERE `id`= 860970;
 
 
/* 
* sql\updates\world\2015_09_24_03_world.sql 
*/ 
--
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127649);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127649,127649,0,0,2,0,0),
(127649,127701,3,360,2,9,19),
(127649,127702,3,40,2,9,19),
(127649,127670,3,320,2,9,19),
(127649,127671,3,260,2,9,19);

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127645);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127645,127645,0,0,2,0,0),
(127645,127691,3,360,2,7,15),
(127645,127692,3,40,2,7,15),
(127645,127664,3,320,2,7,15),
(127645,127665,3,260,2,7,15);

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (127640);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES
(127640,127640,0,0,2,0,0),
(127640,127685,3,360,2,8,17),
(127640,127686,3,40,2,8,17),
(127640,127656,3,320,2,8,17),
(127640,127657,3,260,2,8,17);
 
 
/* 
* sql\updates\world\2015_09_26_00_world.sql 
*/ 
-- 
SET @LAMENTER := 39048;
UPDATE `creature_template` SET `AIName`='SmartAI', `InhabitType`=4 WHERE `entry`=@LAMENTER;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@LAMENTER AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@LAMENTER*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@LAMENTER, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @LAMENTER*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sylvanas'' Lamenter - On Summoned - Action list'),
(@LAMENTER*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 37090, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sylvanas'' Lamenter - Action list - Cast Lament of the Highborne: Highborne Aura'),
(@LAMENTER*100, 9, 1, 0, 0, 0, 100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sylvanas'' Lamenter - Action list - Set run off"),
(@LAMENTER*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 114, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sylvanas'' Lamenter - Action list - Rise up'),
(@LAMENTER*100, 9, 3, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 4, 15095, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sylvanas'' Lamenter - Action list - Play Sound Lament of the Highborne');
 
 
/* 
* sql\updates\world\2015_09_26_01_world.sql 
*/ 
-- 
UPDATE `creature_template` SET `unit_flags`=33555200 WHERE `entry`=28253;

SET @ENTRY := 30736;
UPDATE `creature_template` SET `AIName`="SmartAI", `unit_flags`=33555200, `InhabitType`=4 WHERE `entry` IN (@ENTRY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,75,57806,0,0,0,0,0,1,0,0,0,0,0,0,0,"Released Soul - Just summoned - Add aura"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,4,37,0,0,0,0,0,1,0,0,0,0,0,0,0,"Released Soul - Just summoned - Play sound"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Released Soul - Just summoned - Set run off"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,114,40,0,0,0,0,0,1,0,0,0,0,0,0,0,"Released Soul - Just summoned - Rise up"),
(@ENTRY,0,4,0,54,0,100,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Released Soul - Just summoned - Despawn");

UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry` IN (30850,30852,30841);

UPDATE `creature_template` SET `unit_flags`=131076, `flags_extra`=66 WHERE `entry`=25534;

UPDATE `creature_template` SET `unit_flags`=32768 WHERE `entry`=26271;
UPDATE `creature` SET `unit_flags`=537166592 WHERE `guid` IN (110812, 110813, 110814, 110815, 110816, 110817);

DELETE FROM `creature_addon` WHERE `guid` IN (110812, 110813, 110814, 110815, 110816, 110817);
INSERT INTO `creature_addon` (`guid`, `bytes2`, `auras`) VALUES 
(110812, 1, "29266"),
(110813, 1, "29266"),
(110814, 1, "29266"),
(110815, 1, "29266"),
(110816, 1, "29266"),
(110817, 1, "29266");

UPDATE `creature_template` SET `unit_flags`=512 WHERE `entry`=31402;

UPDATE `creature_template` SET `unit_flags`=33536 WHERE `entry`=30501;

DELETE FROM `creature` WHERE `guid`=120496 AND `id`=28414;

DELETE FROM `creature_template_addon` WHERE `entry` IN (28413);
INSERT INTO `creature_template_addon` (`entry`, `bytes2`, `auras`) VALUES 
(28413, 0, "54450");

UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry` IN (28413);
 
 
/* 
* sql\updates\world\2015_09_26_02_world.sql 
*/ 
-- Eversong Ranger
DELETE FROM `smart_scripts` WHERE `entryorguid`=15938 AND `source_type`=0 AND `id`<14;
UPDATE `smart_scripts` SET `id`= `id`-12 WHERE `entryorguid`=15938 AND `source_type`=0 AND `id`>13;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(15938,0,0,0,0,0,100,0,0,0,2200,3800,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,"Eversong Ranger - In Combat CMC - Cast 'Shoot'"),
(15938,0,1,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Eversong Ranger - Between 0-15% Health - Flee For Assist (No Repeat)");
 
 
/* 
* sql\updates\world\2015_09_26_03_world.sql 
*/ 
-- Iceskin Sentry
UPDATE `creature` SET `movementtype`=0, `spawndist`=0 WHERE `id`=31012;
UPDATE `creature_addon` SET `bytes1`=50331657 WHERE `guid`=121512;
UPDATE `creature_template` SET `unit_flags`=2147778560 WHERE `entry`=31012;
UPDATE `creature_addon` SET `auras`="58269" WHERE `guid` IN (121497, 121498, 121499, 121500, 121502, 121503, 121504, 121505, 121506, 121507, 121508, 121509, 121510, 121511, 121512);
 
 
/* 
* sql\updates\world\2015_09_26_04_world.sql 
*/ 
UPDATE `creature` SET `movementtype`=0, `spawndist`=0 WHERE `id`=32264;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=32264;
DELETE FROM `smart_scripts` WHERE `entryorguid`=32262 AND `source_type`=0 AND `id`=3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(32262, 0, 3, 0, 1, 0, 100, 1, 0, 0, 0, 0, 11, 60309, 0, 0, 0, 0, 0, 19, 32264, 30, 0, 0, 0, 0, 0, 'Shadow Channeler - OOC - Cast Channel Souls');

SET @guid=120996;
DELETE FROM `creature` WHERE `guid` IN (@guid+0, @guid+1);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@guid+0, 32262, 571, 0, 0, 1, 1, 10631, 1, 8138.115, 2063.47, 550.596, 5.449381, 300, 0, 0, 9740, 8636, 0, 0, 0, 0),
(@guid+1, 32262, 571, 0, 0, 1, 1, 10631, 1, 8163.586, 2059.63, 550.596, 3.768629, 300, 0, 0, 9740, 8636, 0, 0, 0, 0);

UPDATE `creature_addon` SET `emote`=396 WHERE `guid`IN (121534,121535,121532);
 
 
/* 
* sql\updates\world\2015_09_26_05_world.sql 
*/ 
-- 
UPDATE `trinity_string` SET `content_default`='Invalid item count (%u) for item %u' WHERE  `entry`=52;
 
 
