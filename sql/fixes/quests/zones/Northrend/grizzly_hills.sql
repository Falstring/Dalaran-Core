-- -------------------------------------------
-- GRIZZLY_HILLS
-- -------------------------------------------


-- Shredder Repair -- [A] http://www.wowhead.com/quest=12244/shredder-repair 
-- Shred the Alliance -- [H] http://www.wowhead.com/quest=12270/shred-the-alliance


UPDATE creature_template SET npcflag=16777216 WHERE entry=27354;


-- Deciphering the Journal-- [H] http://www.wowhead.com/quest=12054/deciphering-the-journal

UPDATE creature_loot_template SET Chance=100 WHERE Item=36740 AND entry=26681;

-- [Q] Escape From Silverbrook - http://de.wowhead.com/quest=12308/flucht-aus-silberwasser
-- npc_ducals_horse
DELETE FROM `waypoints` WHERE `entry`=27409;
DELETE FROM `waypoint_data` WHERE `id`=2740900;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `move_type`) VALUES
(2740900, 2, 4449.24, -2471.33, 242.36, 1),
(2740900, 3, 4461.93, -2462.85, 239.52, 1),
(2740900, 4, 4462.99, -2448.24, 237.881, 1),
(2740900, 5, 4479.58, -2434.09, 235.04, 1),
(2740900, 6, 4488.5, -2420.69, 233.043, 1),
(2740900, 7, 4494.65, -2414.14, 230.241, 1),
(2740900, 8, 4499.73, -2414.86, 230.953, 1),
(2740900, 9, 4510.85, -2401.81, 226.619, 1),
(2740900, 10, 4517.01, -2388.02, 220.151, 1),
(2740900, 11, 4520.02, -2373.92, 213.042, 1),
(2740900, 12, 4524.58, -2355.4, 202.208, 1),
(2740900, 13, 4520.5, -2332.2, 190.854, 1),
(2740900, 14, 4509.68, -2314.53, 182.408, 1),
(2740900, 15, 4488.28, -2309.13, 184.352, 1),
(2740900, 16, 4480.72, -2311.42, 185.421, 1),
(2740900, 17, 4470.29, -2314.58, 183.929, 1),
(2740900, 18, 4453.35, -2318.29, 189.487, 1),
(2740900, 19, 4442.95, -2311.86, 192.656, 1),
(2740900, 20, 4414.56, -2297.74, 191.105, 1),
(2740900, 21, 4396.02, -2286.89, 192.638, 1),
(2740900, 22, 4383.11, -2278.55, 188.321, 1),
(2740900, 23, 4369.12, -2256.09, 187.593, 1),
(2740900, 24, 4339.65, -2250.22, 188.637, 1),
(2740900, 25, 4299.78, -2260.09, 205.304, 1),
(2740900, 26, 4292.07, -2261.81, 209.1, 1),
(2740900, 27, 4258.07, -2270.73, 212.054, 1),
(2740900, 28, 4224.15, -2276.5, 214.878, 1),
(2740900, 29, 4210.62, -2280.83, 214.911, 1),
(2740900, 30, 4193.76, -2285.94, 219.886, 1),
(2740900, 31, 4168.56, -2272.44, 221.375, 1),
(2740900, 32, 4151.02, -2269.35, 223.433, 1),
(2740900, 33, 4131.85, -2271.16, 221.921, 1),
(2740900, 34, 4112.48, -2276.04, 219.917, 1),
(2740900, 35, 4103.6, -2274.2, 219.276, 1),
(2740900, 36, 4093.84, -2276.39, 219.043, 1),
(2740900, 37, 4084.73, -2272.29, 217.87, 1),
(2740900, 38, 4063.24, -2261.99, 215.989, 1),
(2740900, 39, 4059.94, -2260.47, 216.993, 1),
(2740900, 40, 4028.19, -2252.87, 218.259, 1),
(2740900, 41, 4020.98, -2249.35, 217.13, 1),
(2740900, 42, 4005.43, -2256.11, 218.452, 1),
(2740900, 43, 3988.11, -2262.06, 217.11, 1),
(2740900, 44, 3968.36, -2267.24, 215.268, 1),
(2740900, 45, 3953.14, -2268.63, 212.391, 1),
(2740900, 46, 3935.73, -2276.52, 209.67, 1),
(2740900, 47, 3922.17, -2282.02, 211.201, 1),
(2740900, 48, 3913.77, -2300.28, 209.62, 1),
(2740900, 49, 3914.16, -2317.61, 208.95, 1),
(2740900, 50, 3911.53, -2330.58, 207.752, 1),
(2740900, 51, 3907.1, -2346.11, 204.631, 1),
(2740900, 52, 3901.43, -2362.48, 206.198, 1),
(2740900, 53, 3885.37, -2368.48, 202.271, 1),
(2740900, 54, 3871.68, -2371.44, 196.694, 1),
(2740900, 55, 3858.81, -2374.24, 194.039, 1),
(2740900, 56, 3833.32, -2390.12, 187.584, 1),
(2740900, 57, 3818.71, -2403.77, 183.719, 1),
(2740900, 58, 3812.4, -2425.27, 185.086, 1),
(2740900, 59, 3812.61, -2432.79, 186.024, 1),
(2740900, 60, 3812.22, -2453.93, 188.508, 1),
(2740900, 61, 3815.67, -2479.36, 192.388, 1),
(2740900, 62, 3819.47, -2503.68, 195.025, 1),
(2740900, 63, 3822.26, -2517.94, 194.068, 1),
(2740900, 64, 3825.49, -2534.36, 196.38, 1),
(2740900, 65, 3829.2, -2554.68, 196.714, 1),
(2740900, 66, 3836.67, -2578.53, 196.706, 1),
(2740900, 67, 3847.54, -2609.35, 200.06, 1),
(2740900, 68, 3861.53, -2624.76, 202.315, 1),
(2740900, 69, 3882.06, -2655.94, 203.425, 1),
(2740900, 70, 3886.7, -2663.55, 208.092, 1),
(2740900, 71, 3900.58, -2672.41, 212.663, 1),
(2740900, 72, 3909.82, -2687.58, 217.099, 1),
(2740900, 73, 3911.78, -2695.85, 220.364, 1),
(2740900, 74, 3916.01, -2703.19, 221.175, 1),
(2740900, 75, 3912.54, -2712.18, 221.06, 1),
(2740900, 76, 3900.4, -2743.33, 219.152, 1),
(2740900, 77, 3889.82, -2751.59, 221.799, 1),
(2740900, 78, 3883.42, -2756.96, 223.886, 1),
(2740900, 79, 3851.1, -2769.91, 227.46, 1),
(2740900, 80, 3837.9, -2769.54, 226.115, 1),
(2740900, 81, 3813.29, -2770.59, 220.927, 1),
(2740900, 82, 3801.16, -2771.02, 219.535, 1),
(2740900, 83, 3780.5, -2772.39, 213.906, 1),
(2740900, 84, 3767.55, -2775.39, 211.282, 1),
(2740900, 85, 3759.78, -2782.29, 209.166, 1),
(2740900, 86, 3752.76, -2787.6, 206.496, 1),
(2740900, 87, 3729.98, -2803.81, 210.023, 1),
(2740900, 88, 3723.95, -2808.09, 211.656, 1),
(2740900, 89, 3705.99, -2819.68, 215.066, 1),
(2740900, 90, 3685.56, -2832.99, 217.602, 1),
(2740900, 91, 3674.41, -2843.8, 217.875, 1),
(2740900, 92, 3662.46, -2853.29, 216.582, 1),
(2740900, 93, 3647.39, -2857.28, 213.151, 1),
(2740900, 94, 3630.63, -2860.27, 214.962, 1),
(2740900, 95, 3610.74, -2858.62, 208.904, 1),
(2740900, 96, 3587.92, -2854.56, 203.448, 1),
(2740900, 97, 3562.79, -2842.61, 197.044, 1),
(2740900, 98, 3534.27, -2828.21, 197.155, 1),
(2740900, 99, 3515.69, -2829.38, 201.276, 1),
(2740900, 100, 3487.66, -2829.19, 202.144, 1),
(2740900, 101, 3472.46, -2821.6, 201.429, 1),
(2740900, 102, 3460.58, -2817.21, 201.805, 1),
(2740900, 103, 3443.64, -2811.33, 202.098, 1);

UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_ducals_horse' WHERE  `entry`=27409;
DELETE FROM `smart_scripts` WHERE `entryorguid`=27409;

-- Silverbrook Worgen SAI
SET @ENTRY := 27417;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,2,54,0,100,0,9,0,0,0,49,0,0,0,0,0,0,19,27409,60,0,0,0,0,0,"Silverbrook Worgen - On Just Summoned - Start Attacking"),
(@ENTRY,0,1,0,4,0,100,0,9,0,0,0,11,36589,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silverbrook Worgen - On Aggro - Cast 'Dash'"),
(@ENTRY,0,2,0,61,0,100,0,9,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silverbrook Worgen - On Just Summoned - Set Active On"),
(@ENTRY,0,3,0,1,0,100,0,3000,3000,3000,3000,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silverbrook Worgen - Out of Combat - Despawn Instant");
UPDATE `creature_template` SET `minlevel`=80, `maxlevel`=80 WHERE  `entry`=27409;
UPDATE `creature_template` SET `minlevel`=80, `maxlevel`=80 WHERE  `entry`=27411;

-- Conquest Hold Marauder SAI
SET @ENTRY := 27424;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,1,0,9,0,100,0,0,5,7000,10000,11,25710,0,0,0,0,0,2,0,0,0,0,0,0,0,"Conquest Hold Marauder - Within 0-5 Range - Cast 'Heroic Strike'"),
(@ENTRY,0,2,0,0,0,100,0,9000,12000,12000,18000,11,13730,1,0,0,0,0,1,0,0,0,0,0,0,0,"Conquest Hold Marauder - In Combat - Cast 'Demoralizing Shout'");

-- DB/Spell: Escape from Silverbrook
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=2 AND `SourceEntry`=48682;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,2,48682,0,0,31,0,3,27417,0,0,"","Escape from Silverbrook - Periodic Dummy - Only targets Worgs");


-- Eyes Above -- [H] http://www.wowhead.com/quest=12453/eyes-above
-- Imperial Eagle SAI
SET @ENTRY := 26369;
SET @SPELL := 49546;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,7000,5000,9000,11,55079,0,0,0,0,0,2,0,0,0,0,0,0,0,"Imperial Eagle - In Combat - Cast 'Swoop'"),
(@ENTRY,0,1,2,8,0,100,0,@SPELL,0,0,0,53,1,@ENTRY,0,0,0,0,1,0,0,0,0,0,0,0,"Imperial Eagle - On Spellhit 'Eagle Eyes' - Fly Up"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,80,@ENTRY*100,2,0,0,0,0,1,0,0,0,0,0,0,0,"Imperial Eagle - On Spellhit 'Eagle Eyes' - Run Script"),
(@ENTRY,0,3,0,11,0,100,0,0,0,0,0,47,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Imperial Eagle - On Respawn - Set Visibility On"),
(@ENTRY,0,4,0,21,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Imperial Eagle - Home Reached - Despawn Instant"),

(@ENTRY*100,9,0,0,0,0,100,0,7000,7000,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Imperial Eagle - Script - Set Visibility Off"),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,55,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Imperial Eagle - Script - Stop WP Movement"),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,201,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Imperial Eagle - Script - Move Home Position");

-- Siting Eagles Movement Type fix
UPDATE `creature` SET `MovementType`='0' AND `spawndist`='0' WHERE  `id`=@ENTRY AND `guid`IN(95613,95632,95633,95644,95657,95715,95731,95734,95735,95737,95747,95750,95770,95782,95783,95784,95786,95807,95810,95820,95821,95847,95848,95849,95860,95861,95885,95922,95924,95927,95930,95946,95947,95948,95983,95985,95986,95991,95992,96020,96025,96026,96072,96080,96125,96127,96129,96130,96136,96141,96143);

-- Spell target condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=@SPELL AND `ConditionValue2`=@ENTRY;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(17,0,@SPELL,0,0,31,1,3,@ENTRY,0,0,12,0,'','Target needs to be Imperial Eagle');

-- Imperial Eagles WP for the quest
DELETE FROM `waypoints` WHERE `entry`=@ENTRY AND `pointid`=1;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY,1,4000,-3130,700,'Imperial Eagle');

-- Chill Out, Mon -- [A][H] www.wowhead.com/quest=12137/chill-out-mon
UPDATE `gameobject` SET `phaseMask`='2' WHERE  `guid`=58833;

-- Riding the Red Rocket - [A] http://www.wowhead.com/quest=12437/riding-the-red-rocket - [H] http://www.wowhead.com/quest=12432/riding-the-red-rocket

UPDATE creature SET curhealth=4920 WHERE id=27593;
DELETE FROM conditions WHERE SourceTypeOrReferenceId=18 AND SourceGroup IN(27593);
INSERT INTO conditions VALUES(18, 27593, 49177, 0, 0, 2, 0, 37664, 1, 0, 0, 0, 0, '', '');
UPDATE creature_template SET AIName="", ScriptName="npc_riding_the_red_rocket" WHERE entry=27593;


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


-- Fix requisites for:
-- Secrets of the Flamebinders - [A] http://www.wowhead.com/quest=12222/secrets-of-the-flamebinders
-- Thinning the ranks - [A] http://www.wowhead.com/quest=12223/thinning-the-ranks
-- The Thane of Voldrune - [A] http://www.wowhead.com/quest=12255/the-thane-of-voldrune

UPDATE quest_template_addon SET PrevQuestID=12292, NextQuestID=12255, ExclusiveGroup=-12222 WHERE ID IN(12222, 12223);


-- [Quest][GrizzlyHills]Life or Death/Kick 'EM While They are Down - Wounded Skirmisher +Wounded Westfall Infantry
SET @cguid:=5005372;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+11;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID+0, 27463, 571, 0, 0, 1, 1, 0, 0, 4203.006, -3047.501, 281.2304, 4.415683, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27463 (Area: -1)
(@CGUID+1, 27482, 571, 0, 0, 1, 1, 0, 0, 4184.69, -2980.583, 284.83, 3.543018, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27482 (Area: -1)
(@CGUID+2, 27457, 571, 0, 0, 1, 1, 0, 0, 4137.022, -3007.063, 285.8553, 5.51524, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27457 (Area: -1) (Auras: 29266 - 29266)
(@CGUID+3, 27481, 571, 0, 0, 1, 1, 0, 0, 4141.247, -3012.803, 285.4366, 0.2443461, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27481 (Area: -1) (Auras: 29266 - 29266)
(@CGUID+4, 27463, 571, 0, 0, 1, 1, 0, 0, 4166.682, -2964.984, 283.2789, 2.740167, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27463 (Area: -1)
(@CGUID+5, 27482, 571, 0, 0, 1, 1, 0, 0, 4206.615, -3002.458, 282.8639, 3.176499, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27482 (Area: -1)
(@CGUID+6, 27482, 571, 0, 0, 1, 1, 0, 0, 4180.862, -3014.165, 280.0445, 5.497787, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27482 (Area: -1)
(@CGUID+7, 27463, 571, 0, 0, 1, 1, 0, 0, 4139.789, -3021.132, 285.5673, 5.899213, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27463 (Area: -1)
(@CGUID+8, 27482, 571, 0, 0, 1, 1, 0, 0, 4147.580, -2955.251, 283.479, 5.757801, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27463 (Area: -1)
(@CGUID+9, 27482, 571, 0, 0, 1, 1, 0, 0, 4140.755, -3006.965, 285.378, 4.524723, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27463 (Area: -1)
(@CGUID+10, 27482, 571, 0, 0, 1, 1, 0, 0, 4201.036, -2985.048, 283.169, 0.860837, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27463 (Area: -1)
(@CGUID+11, 27482, 571, 0, 0, 1, 1, 0, 0, 4128.313, -2937.812, 281.963, 0.605581, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420); -- 27463 (Area: -1)

DELETE FROM `creature_addon` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+11;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 102453 AND 102457;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 102459 AND 102463;
DELETE FROM `creature_addon` WHERE `guid` IN (102466, 102467, 102469);
DELETE FROM `creature_addon` WHERE `guid` IN (104181, 104182, 104184, 104185);
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 104187 AND 104189;

DELETE FROM `creature_addon` WHERE `guid` BETWEEN 102034 AND 102038;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 102041 AND 102047;

DELETE FROM `creature_addon` WHERE `guid` BETWEEN 103956 AND 103960;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 103972 AND 103978;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 103984 AND 103987;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(102034, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102035, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102036, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102037, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102038, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102041, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102042, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102043, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102044, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102045, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102046, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102047, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103956, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103957, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103958, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103959, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103960, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103972, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103973, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103974, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103975, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103976, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103977, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103978, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103984, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103985, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103986, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103987, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(@CGUID+0, 0, 0, 8, 257, 0, ''), -- 27463
(@CGUID+1, 0, 0, 8, 257, 0, ''), -- 27482
(@CGUID+2, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(@CGUID+3, 0, 0, 0, 1, 0, '29266'), -- 27481 - 29266 - 29266
(@CGUID+4, 0, 0, 8, 257, 0, ''), -- 27463
(@CGUID+5, 0, 0, 8, 257, 0, ''), -- 27482
(@CGUID+6, 0, 0, 8, 257, 0, ''), -- 27482
(@CGUID+7, 0, 0, 8, 257, 0, ''), -- 27463
(@CGUID+8, 0, 0, 8, 257, 0, ''), -- 27463
(@CGUID+9, 0, 0, 8, 257, 0, ''), -- 27463
(@CGUID+10, 0, 0, 8, 257, 0, ''), -- 27463
(@CGUID+11, 0, 0, 8, 257, 0, ''), -- 27463
(102453, 0, 0, 8, 257, 0, ''), -- 27463
(102454, 0, 0, 8, 257, 0, ''), -- 27463
(102455, 0, 0, 8, 257, 0, ''), -- 27463
(102456, 0, 0, 8, 257, 0, ''), -- 27463
(102457, 0, 0, 8, 257, 0, ''), -- 27463
(102459, 0, 0, 8, 257, 0, ''), -- 27463
(102460, 0, 0, 8, 257, 0, ''), -- 27463
(102461, 0, 0, 8, 257, 0, ''), -- 27463
(102462, 0, 0, 8, 257, 0, ''), -- 27463
(102463, 0, 0, 8, 257, 0, ''), -- 27463
(102466, 0, 0, 8, 257, 0, ''), -- 27463
(102467, 0, 0, 8, 257, 0, ''), -- 27463
(102469, 0, 0, 8, 257, 0, ''), -- 27463
(104181, 0, 0, 8, 257, 0, ''), -- 27463
(104182, 0, 0, 8, 257, 0, ''), -- 27463
(104184, 0, 0, 8, 257, 0, ''), -- 27463
(104185, 0, 0, 8, 257, 0, ''), -- 27463
(104187, 0, 0, 8, 257, 0, ''), -- 27463
(104188, 0, 0, 8, 257, 0, ''), -- 27463
(104189, 0, 0, 8, 257, 0, '');


DELETE FROM `creature` WHERE `guid` IN (104190, 102458, 102464);
DELETE FROM `creature_addon` WHERE `guid` IN (104190, 102458, 102464);


UPDATE `creature` SET `position_x` = 4018.115 , `position_y` = -2835.341 , `position_z` = 279.326 , `orientation` = 1.795531 WHERE `guid` = 102466; 
UPDATE `creature` SET `position_x` = 4133.794 , `position_y` = -2896.201 , `position_z` = 279.241 , `orientation` = 5.215924 WHERE `guid` = 102457; 
UPDATE `creature` SET `orientation` = 3.488043 WHERE `guid` = 102462; 
UPDATE `creature` SET `orientation` = 2.486658 WHERE `guid` = 102464; 
UPDATE `creature` SET `position_x` = 4190.735 , `position_y` = -2958.304 , `position_z` = 283.319 , `orientation` = 0.719515 WHERE `guid` = 102463; 
UPDATE `creature` SET `position_x` = 4172.601 , `position_y` = -2906.019 , `position_z` = 282.077 , `orientation` = 4.351964 , `spawndist` = 0 , `MovementType` = 0 WHERE `guid` = 104181; 
UPDATE `creature` SET `equipment_id`=1 WHERE  `id` IN (27482, 27463);

-- Add Pooling for Horde and alliance creatures
UPDATE `creature` SET `spawntimesecs`=1 WHERE  `id` IN (27482, 27463);
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|64|2 WHERE `entry` IN (27482, 27463);

SET @POOLID := 202484;
DELETE FROM `pool_template` WHERE `entry` = @POOLID;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@POOLID, 8, 'Spawn pool forWounded Westfall Infantry (27482)');

DELETE FROM `pool_creature` WHERE `pool_entry`=202484;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(5005383,  @POOLID, 'Wounded Westfall Infantry'),
(5005382,  @POOLID, 'Wounded Westfall Infantry'),
(104187,   @POOLID, 'Wounded Westfall Infantry'),
(104185,   @POOLID, 'Wounded Westfall Infantry'),
(104184,   @POOLID, 'Wounded Westfall Infantry'),
(104182,   @POOLID, 'Wounded Westfall Infantry'),
(104181,   @POOLID, 'Wounded Westfall Infantry'),
(5005373,  @POOLID, 'Wounded Westfall Infantry'),
(104188,   @POOLID, 'Wounded Westfall Infantry'),
(104189,   @POOLID, 'Wounded Westfall Infantry'),
(5005380,  @POOLID, 'Wounded Westfall Infantry'),
(5005378,  @POOLID, 'Wounded Westfall Infantry'),
(5005377,  @POOLID, 'Wounded Westfall Infantry'),
(5005381,  @POOLID, 'Wounded Westfall Infantry');

SET @POOLID := 202485;
DELETE FROM `pool_template` WHERE `entry` = @POOLID;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@POOLID, 8, 'Spawn pool for Wounded Skirmisher (27463)');

DELETE FROM `pool_creature` WHERE `pool_entry`=202485;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(102469,  @POOLID, 'Wounded Skirmisher'),
(102467,  @POOLID, 'Wounded Skirmisher'),
(102466,  @POOLID, 'Wounded Skirmisher'),
(102463,  @POOLID, 'Wounded Skirmisher'),
(102462,  @POOLID, 'Wounded Skirmisher'),
(102461,  @POOLID, 'Wounded Skirmisher'),
(102460,  @POOLID, 'Wounded Skirmisher'),
(102459,  @POOLID, 'Wounded Skirmisher'),
(102457,  @POOLID, 'Wounded Skirmisher'),
(102456,  @POOLID, 'Wounded Skirmisher'),
(102455,  @POOLID, 'Wounded Skirmisher'),
(102454,  @POOLID, 'Wounded Skirmisher'),
(102453,  @POOLID, 'Wounded Skirmisher'),
(5005372, @POOLID, 'Wounded Skirmisher'),
(5005379, @POOLID, 'Wounded Skirmisher'),
(5005376, @POOLID, 'Wounded Skirmisher');

-- Wounded Skirmisher SAI
SET @ENTRY := 27463;
UPDATE `creature_template` SET `AIName`="SmartAI", `ScriptName`='' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,48812,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - On Spellhit 'Renew Skirmisher' - Set Event Phase 1"),
(@ENTRY,0,1,0,1,1,100,0,0,0,3000,3000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - Out of Combat - Say Line 0 (Phase 1)"),
(@ENTRY,0,2,3,1,1,100,0,2000,2000,2000,2000,53,1,27463,0,12289,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - Out of Combat - Start Waypoint (Phase 1)"),
(@ENTRY,0,3,4,61,1,100,0,0,0,0,0,18,128,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - Out of Combat - Set Flag Not Attackable (Phase 1)"),
(@ENTRY,0,4,5,61,1,100,0,0,0,0,0,11,48813,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wounded Skirmisher - Out of Combat - Cast 'Kill Credit' (Phase 1)"),
(@ENTRY,0,5,8,61,1,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - Out of Combat - Remove Flag Standstate Kneel (Phase 1)"),
(@ENTRY,0,6,0,40,2,100,0,2,27463,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - On Waypoint 2 Reached - Despawn Instant (Phase 2)"),
(@ENTRY,0,7,0,25,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - On Reset - Set Reactstate Defensive"),
(@ENTRY,0,8,0,61,1,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - Out of Combat - Set Event Phase 2 (Phase 1)"),
(@ENTRY,0,9,0,0,0,100,0,2000,3000,4000,6000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wounded Skirmisher - In Combat - Cast 'Cleave'"),
(@ENTRY,0,10,0,0,0,100,0,5000,6000,12000,14000,11,9080,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wounded Skirmisher - In Combat - Cast 'Hamstring'"),
(@ENTRY,0,11,0,0,0,100,0,5000,6000,8000,12000,11,32736,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wounded Skirmisher - In Combat - Cast 'Mortal Strike'");

-- Wounded Westfall Infantry SAI
SET @ENTRY := 27482;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - On Spellhit - Set Event Phase 1"),
(@ENTRY,0,1,0,1,1,100,0,0,0,3000,3000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - Out of Combat - Say Line 0 (Phase 1)"),
(@ENTRY,0,2,3,1,1,100,0,2000,2000,2000,2000,53,1,27482,0,12296,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - Out of Combat - Start Waypoint (Phase 1)"),
(@ENTRY,0,3,4,61,1,100,0,0,0,0,0,18,128,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - Out of Combat - Set Flag Not Attackable (Phase 1)"),
(@ENTRY,0,4,5,61,1,100,0,0,0,0,0,11,48813,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wounded Westfall Infantry - Out of Combat - Cast 'Kill Credit' (Phase 1)"),
(@ENTRY,0,5,8,61,1,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - Out of Combat - Remove Flag Standstate Kneel (Phase 1)"),
(@ENTRY,0,6,0,40,2,100,0,2,27482,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - On Waypoint 2 Reached - Despawn Instant (Phase 2)"),
(@ENTRY,0,7,0,25,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - On Reset - Set Reactstate Defensive"),
(@ENTRY,0,8,0,61,1,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - Out of Combat - Set Event Phase 2 (Phase 1)"),
(@ENTRY,0,9,0,4,0,100,0,0,0,0,0,11,29385,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - On Aggro - Cast 'Seal of Command'"),
(@ENTRY,0,10,0,0,0,100,0,2000,3000,6000,10000,11,32771,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wounded Westfall Infantry - In Combat - Cast 'Holy Shock'");

DELETE FROM `waypoints` WHERE `entry`=27463;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(27463,1,4105.278809,-2917.963867,280.320129,'Wounded Skirmisher'),
(27463,2,4048.682861,-2936.736572,275.191681,'Wounded Skirmisher');

-- [Q] Dun-da-Dun-tah! - http://www.wowhead.com/quest=12082/dun-da-dun-tah
-- Harrison Jones SAI
SET @ENTRY := 26814;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,11,0,100,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Respawn - Set Faction 0"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Respawn - Set Invincibility Hp 1"),
(@ENTRY,0,2,33,61,0,100,0,0,0,0,0,71,0,3,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Respawn - Change Equipment"),
(@ENTRY,0,3,4,19,0,100,0,12082,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Quest 'Dun-da-Dun-tah!' Taken - Run Script"),
(@ENTRY,0,4,0,61,0,100,0,12082,0,0,0,64,1,0,0,0,0,0,16,0,0,0,0,0,0,0,"Harrison Jones - On Quest 'Dun-da-Dun-tah!' Taken - Store Targetlist"),
(@ENTRY,0,5,6,40,0,100,0,7,26814,0,0,54,8500,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 7 Reached - Pause Waypoint"),
(@ENTRY,0,6,0,61,0,100,0,7,26814,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 7 Reached - Say Line 1"),
(@ENTRY,0,7,32,52,0,100,0,1,26814,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Text 1 Over - Say Line 2"),
(@ENTRY,0,8,9,40,0,100,0,9,26814,0,0,54,12000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 9 Reached - Pause Waypoint"),
(@ENTRY,0,9,0,61,0,100,0,9,26814,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 9 Reached - Run Script"),
(@ENTRY,0,10,11,40,0,100,0,11,26814,0,0,54,18000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 11 Reached - Pause Waypoint"),
(@ENTRY,0,11,0,61,0,100,0,11,26814,0,0,80,@ENTRY*100+02,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 11 Reached - Run Script"),
(@ENTRY,0,12,13,40,0,100,0,13,26814,0,0,54,4600,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 13 Reached - Pause Waypoint"),
(@ENTRY,0,13,0,61,0,100,0,13,26814,0,0,1,4,4600,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 13 Reached - Say Line 4"),
(@ENTRY,0,14,0,52,0,100,0,4,26814,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Text 4 Over - Say Line 5"),
(@ENTRY,0,15,0,40,0,100,0,16,26814,0,0,9,0,0,0,0,0,0,20,188480,50,0,0,0,0,0,"Harrison Jones - On Waypoint 16 Reached - Activate Gameobject"),
(@ENTRY,0,16,17,40,0,100,0,17,26814,0,0,54,500,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 17 Reached - Pause Waypoint"),
(@ENTRY,0,17,0,61,0,100,0,17,26814,0,0,12,26865,2,300000,0,0,0,8,0,0,0,4906.59,-4818.92,32.6393,2.53073,"Harrison Jones - On Waypoint 17 Reached - Summon Creature 'Tecahuna'"),
(@ENTRY,0,18,0,40,0,100,0,18,26814,0,0,80,@ENTRY*100+03,2,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 18 Reached - Run Script"),
(@ENTRY,0,19,20,2,0,100,1,0,0,0,0,32,0,0,0,0,0,0,20,188480,50,0,0,0,0,0,"Harrison Jones - Between 0-0% Health - Reset Gameobject (No Repeat)"),
(@ENTRY,0,20,21,61,0,100,0,0,0,0,0,6,12082,0,0,0,0,0,12,1,0,0,0,0,0,0,"Harrison Jones - Between 0-0% Health - Fail Quest 'Dun-da-Dun-tah!' (No Repeat)"),
(@ENTRY,0,21,0,61,0,100,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - Between 0-0% Health - Kill Self (No Repeat)"),
(@ENTRY,0,22,23,56,0,100,0,17,26814,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint Resumed - Say Line 6"),
(@ENTRY,0,23,0,61,0,100,0,17,26814,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint Resumed - Set Run On"),
(@ENTRY,0,24,0,38,0,100,0,0,1,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Data Set 0 1 - Set Event Phase 1"),
(@ENTRY,0,25,0,7,1,100,0,0,0,0,0,80,@ENTRY*100+04,2,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Evade - Run Script (Phase 1)"),
(@ENTRY,0,26,27,40,0,100,0,21,268140,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 21 Reached - Pause Waypoint"),
(@ENTRY,0,27,0,61,0,100,0,21,268140,0,0,1,9,0,0,0,0,0,21,100,0,0,0,0,0,0,"Harrison Jones - On Waypoint 21 Reached - Say Line 9"),
(@ENTRY,0,28,29,56,0,100,0,21,268140,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint Resumed - Set Run On"),
(@ENTRY,0,29,0,61,0,100,0,21,268140,0,0,15,12082,0,0,0,0,0,12,1,0,0,0,0,0,0,"Harrison Jones - On Waypoint Resumed - Quest Credit 'Dun-da-Dun-tah!'"),
(@ENTRY,0,30,0,40,0,100,0,25,268140,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 25 Reached - Despawn Instant"),
(@ENTRY,0,31,0,4,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Aggro - Set Reactstate Aggressive"),
(@ENTRY,0,32,0,61,0,100,0,1,26814,0,0,45,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Text 1 Over - Set Data 7 0"),
(@ENTRY,0,33,0,61,0,100,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Respawn - Add Npc Flag Questgiver"),
(@ENTRY,0,34,0,6,0,100,0,0,0,0,0,45,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Just Died - Set Data 7 0"),
(@ENTRY,0,35,0,40,0,100,0,2,268140,0,0,45,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 2 Reached - Set Data 7 0");

-- Actionlist SAI
SET @ENTRY := 2681400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"Harrison Jones - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,500,500,0,0,9,0,0,0,0,0,0,20,188465,5,0,0,0,0,0,"Harrison Jones - On Script - Activate Gameobject"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Faction 250"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,71,0,2,0,2081,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Change Equipment"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Remove Npc Flags Gossip & Questgiver"),
(@ENTRY,9,5,0,0,0,100,0,2500,2500,0,0,53,0,26814,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Start Waypoint"),
(@ENTRY,9,6,0,0,0,100,0,7000,7000,0,0,9,0,0,0,0,0,0,20,188465,50,0,0,0,0,0,"Harrison Jones - On Script - Activate Gameobject"),
(@ENTRY,9,7,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Active On");

-- Actionlist SAI
SET @ENTRY := 2681401;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,17,133,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Emote State 133"),
(@ENTRY,9,1,0,0,0,100,0,2500,2500,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Emote State 0"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Say Line 3"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,9,0,0,0,0,0,0,20,188487,5,0,0,0,0,0,"Harrison Jones - On Script - Activate Gameobject"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,24405,5,0,0,0,0,0,"Harrison Jones - On Script - Set Data 0 1"),
(@ENTRY,9,5,0,0,0,100,0,10000,10000,0,0,9,0,0,0,0,0,0,20,188487,5,0,0,0,0,0,"Harrison Jones - On Script - Activate Gameobject");

-- Actionlist SAI
SET @ENTRY := 2681402;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,6.14356,"Harrison Jones - On Script - Set Orientation 6.14356"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Flag Standstate Kneel"),
(@ENTRY,9,2,0,0,0,100,0,2400,2400,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.67748,"Harrison Jones - On Script - Set Orientation 4.67748"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Remove Flag Standstate Kneel"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,71,0,1,32246,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Change Equipment"),
(@ENTRY,9,5,0,0,0,100,0,2500,2500,0,0,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Play Emote 36"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,4,12827,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Play Sound 12827"),
(@ENTRY,9,7,0,0,0,100,0,0,0,0,0,11,47533,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Cast 'Camera Shake - Small'"),
(@ENTRY,9,8,0,0,0,100,0,2500,2500,0,0,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Play Emote 36"),
(@ENTRY,9,9,0,0,0,100,0,0,0,0,0,4,12827,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Play Sound 12827"),
(@ENTRY,9,10,0,0,0,100,0,0,0,0,0,11,47533,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Cast 'Camera Shake - Small'"),
(@ENTRY,9,11,0,0,0,100,0,2500,2500,0,0,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Play Emote 36"),
(@ENTRY,9,12,0,0,0,100,0,0,0,0,0,4,12827,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Play Sound 12827"),
(@ENTRY,9,13,0,0,0,100,0,0,0,0,0,11,47533,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Cast 'Camera Shake - Small'"),
(@ENTRY,9,14,0,0,0,100,0,2000,2000,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4902.23,-4827.56,32.6125,2.44346,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,15,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4876.61,-4805.58,32.5825,6.17846,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,16,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4877.39,-4815.75,32.5835,0.15708,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,17,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4883.1,-4823.98,32.5884,0.872665,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,18,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4892.31,-4828.58,32.5958,1.5708,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,19,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4908.68,-4794.35,32.6706,3.97935,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,20,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4899.54,-4789.86,32.5981,4.76475,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,21,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4889.96,-4790.65,32.5985,5.20108,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,22,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4914.76,-4813.24,32.5866,3.01942,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,23,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4914.13,-4802.8,32.6696,3.42085,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'");

-- Actionlist SAI
SET @ENTRY := 2681403;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Say Line 7"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Home Position"),
(@ENTRY,9,2,0,0,0,100,0,7200,7200,0,0,1,8,0,0,0,0,0,21,100,0,0,0,0,0,0,"Harrison Jones - On Script - Say Line 8"),
(@ENTRY,9,3,0,0,0,100,0,6000,6000,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Reactstate Aggressive");

-- Actionlist SAI
SET @ENTRY := 2681404;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,53,1,268140,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Start Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Event Phase 0");

UPDATE `creature_template` SET `ScriptName`='npc_harrison_jones_grizzly' WHERE  `entry`=26814;

-- Remove the incorrect value for [A] Ursoc, the Bear God
UPDATE `quest_template` SET `RewardNextQuest`=0 WHERE `id`=12249;