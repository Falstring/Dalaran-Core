/* 
* sql\updates\world\2015_08_13_00_world.sql 
*/ 
-- Stratholme - King's Square
-- 3.x +4.x +6.x
-- rndmmovement
UPDATE `creature` SET `spawndist`=2 WHERE  `guid` IN (53148, 52999, 53000, 53000, 53149);
-- pathing
-- patchwerk 1
SET @NPC := 53954;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3656.723,`position_y`=-3513.025,`position_z`=136.9099 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3656.723,-3513.025,136.9099,0,0,0,0,100,0),
(@PATH,2,3657.473,-3512.525,136.9099,0,0,0,0,100,0),
(@PATH,3,3658.473,-3498.275,136.6599,0,0,0,0,100,0),
(@PATH,4,3658.507,-3497.959,136.9155,0,0,0,0,100,0),
(@PATH,5,3658.757,-3494.459,136.9155,0,0,0,0,100,0),
(@PATH,6,3654.507,-3492.959,136.9155,0,0,0,0,100,0),
(@PATH,7,3651.257,-3491.459,136.9155,0,0,0,0,100,0),
(@PATH,8,3645.507,-3488.959,137.4155,0,0,0,0,100,0),
(@PATH,9,3645.125,-3488.808,137.3199,0,0,0,0,100,0),
(@PATH,10,3643.375,-3488.058,137.5699,0,0,0,0,100,0),
(@PATH,11,3638.125,-3490.058,137.3199,0,0,0,0,100,0),
(@PATH,12,3635.125,-3491.308,137.5699,0,0,0,0,100,0),
(@PATH,13,3627.464,-3493.699,137.235,0,0,0,0,100,0),
(@PATH,14,3622.464,-3493.949,137.485,0,0,0,0,100,0),
(@PATH,15,3613.366,-3494.758,136.9154,0,0,0,0,100,0),
(@PATH,16,3609.366,-3491.258,136.6654,0,0,0,0,100,0),
(@PATH,17,3602.366,-3485.008,135.9154,0,0,0,0,100,0),
(@PATH,18,3595.843,-3479.371,135.1627,0,0,0,0,100,0),
(@PATH,19,3600.593,-3486.121,135.9127,0,0,0,0,100,0),
(@PATH,20,3605.343,-3493.371,136.6627,0,0,0,0,100,0),
(@PATH,21,3612.294,-3503.09,137.4564,0,0,0,0,100,0),
(@PATH,22,3613.294,-3504.09,137.4564,0,0,0,0,100,0),
(@PATH,23,3620.044,-3512.09,137.4564,0,0,0,0,100,0),
(@PATH,24,3622.044,-3514.34,137.2064,0,0,0,0,100,0),
(@PATH,25,3628.683,-3521.636,137.0146,0,0,0,0,100,0),
(@PATH,26,3632.433,-3521.136,136.7646,0,0,0,0,100,0),
(@PATH,27,3635.433,-3520.636,136.7646,0,0,0,0,100,0),
(@PATH,28,3639.933,-3519.886,137.0146,0,0,0,0,100,0),
(@PATH,29,3641.183,-3519.886,136.7646,0,0,0,0,100,0),
(@PATH,30,3647.269,-3518.891,136.7158,0,0,0,0,100,0),
(@PATH,31,3649.769,-3517.391,136.7158,0,0,0,0,100,0),
(@PATH,32,3656.769,-3513.141,136.9658,0,0,0,0,100,0);

-- patchwerk 2
SET @NPC := 53943;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3693.587,`position_y`=-3392.627,`position_z`=132.258 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3693.587,-3392.627,132.258,0,0,0,0,100,0),
(@PATH,2,3692.087,-3390.627,132.008,0,0,0,0,100,0),
(@PATH,3,3690.087,-3386.627,131.508,0,0,0,0,100,0),
(@PATH,4,3688.087,-3382.877,130.758,0,0,0,0,100,0),
(@PATH,5,3685.837,-3379.127,130.008,0,0,0,0,100,0),
(@PATH,6,3682.587,-3373.127,129.508,0,0,0,0,100,0),
(@PATH,7,3679.837,-3367.627,128.758,0,0,0,0,100,0),
(@PATH,8,3677.837,-3364.127,128.008,0,0,0,0,100,0),
(@PATH,9,3677.505,-3363.911,127.5753,0,0,0,0,100,0),
(@PATH,10,3676.505,-3361.911,127.0753,0,0,0,0,100,0),
(@PATH,11,3675.255,-3360.161,126.8253,0,0,0,0,100,0),
(@PATH,12,3674.505,-3358.911,126.3253,0,0,0,0,100,0),
(@PATH,13,3671.505,-3354.411,125.8253,0,0,0,0,100,0),
(@PATH,14,3669.005,-3350.161,125.5753,0,0,0,0,100,0),
(@PATH,15,3667.255,-3347.411,125.3253,0,0,0,0,100,0),
(@PATH,16,3662.255,-3339.911,124.5753,0,0,0,0,100,0),
(@PATH,17,3659.744,-3335.81,124.2587,0,0,0,0,100,0),
(@PATH,18,3661.244,-3333.56,124.0087,0,0,0,0,100,0),
(@PATH,19,3666.244,-3325.56,124.0087,0,0,0,0,100,0),
(@PATH,20,3667.994,-3322.81,124.0087,0,0,0,0,100,0),
(@PATH,21,3668.494,-3321.31,124.5087,0,0,0,0,100,0),
(@PATH,22,3673.494,-3313.06,126.5087,0,0,0,0,100,0),
(@PATH,23,3676.687,-3308.217,127.0456,0,0,0,0,100,0),
(@PATH,24,3678.437,-3301.217,127.5456,0,0,0,0,100,0),
(@PATH,25,3680.437,-3292.967,128.0456,0,0,0,0,100,0),
(@PATH,26,3681.687,-3288.717,128.2956,0,0,0,0,100,0),
(@PATH,27,3682.687,-3285.467,128.0456,0,0,0,0,100,0),
(@PATH,28,3683.687,-3280.967,128.0456,0,0,0,0,100,0),
(@PATH,29,3684.886,-3277.052,127.8707,0,0,0,0,100,0),
(@PATH,30,3691.386,-3272.302,128.1207,0,0,0,0,100,0),
(@PATH,31,3696.886,-3268.552,128.1207,0,0,0,0,100,0),
(@PATH,32,3703.386,-3263.302,127.8707,0,0,0,0,100,0),
(@PATH,33,3703.537,-3263.307,127.8513,0,0,0,0,100,0),
(@PATH,34,3696.787,-3268.307,128.1013,0,0,0,0,100,0),
(@PATH,35,3691.537,-3272.307,128.1013,0,0,0,0,100,0),
(@PATH,36,3684.775,-3277.28,127.9393,0,0,0,0,100,0),
(@PATH,37,3683.775,-3281.03,127.9393,0,0,0,0,100,0),
(@PATH,38,3682.525,-3285.28,127.9393,0,0,0,0,100,0),
(@PATH,39,3681.775,-3288.78,128.1893,0,0,0,0,100,0),
(@PATH,40,3680.775,-3292.78,127.9393,0,0,0,0,100,0),
(@PATH,41,3678.525,-3301.28,127.4393,0,0,0,0,100,0),
(@PATH,42,3676.775,-3307.78,126.9393,0,0,0,0,100,0),
(@PATH,43,3676.495,-3308.055,126.7956,0,0,0,0,100,0),
(@PATH,44,3676.495,-3308.305,126.7956,0,0,0,0,100,0),
(@PATH,45,3673.495,-3313.055,126.2956,0,0,0,0,100,0),
(@PATH,46,3668.495,-3321.305,124.5456,0,0,0,0,100,0),
(@PATH,47,3667.995,-3322.555,124.0456,0,0,0,0,100,0),
(@PATH,48,3666.245,-3325.555,124.0456,0,0,0,0,100,0),
(@PATH,49,3661.245,-3333.555,124.0456,0,0,0,0,100,0),
(@PATH,50,3661.398,-3333.665,124.0029,0,0,0,0,100,0),
(@PATH,51,3659.898,-3336.165,124.2529,0,0,0,0,100,0),
(@PATH,52,3662.398,-3339.915,124.5029,0,0,0,0,100,0),
(@PATH,53,3667.148,-3347.165,125.2529,0,0,0,0,100,0),
(@PATH,54,3668.898,-3349.915,125.2529,0,0,0,0,100,0),
(@PATH,55,3671.648,-3354.415,125.7529,0,0,0,0,100,0),
(@PATH,56,3674.398,-3358.915,126.2529,0,0,0,0,100,0),
(@PATH,57,3675.398,-3360.165,126.7529,0,0,0,0,100,0);

-- patchwerk 3
SET @NPC := 53953;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3548.131,`position_y`=-3350.274,`position_z`=129.7909 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3548.131,-3350.274,129.7909,0,0,0,0,100,0),
(@PATH,2,3553.131,-3348.024,129.2909,0,0,0,0,100,0),
(@PATH,3,3559.131,-3345.524,129.2909,0,0,0,0,100,0),
(@PATH,4,3566.631,-3342.524,129.7909,0,0,0,0,100,0),
(@PATH,5,3568.131,-3341.774,129.5409,0,0,0,0,100,0),
(@PATH,6,3575.881,-3338.274,128.7909,0,0,0,0,100,0),
(@PATH,7,3578.131,-3337.274,128.5409,0,0,0,0,100,0),
(@PATH,8,3586.131,-3334.024,128.0409,0,0,0,0,100,0),
(@PATH,9,3586.197,-3333.996,128.0313,0,0,0,0,100,0),
(@PATH,10,3586.697,-3333.746,128.0313,0,0,0,0,100,0),
(@PATH,11,3576.947,-3333.746,128.7813,0,0,0,0,100,0),
(@PATH,12,3569.697,-3333.496,129.2813,0,0,0,0,100,0),
(@PATH,13,3565.197,-3333.496,129.5313,0,0,0,0,100,0),
(@PATH,14,3560.02,-3333.251,129.5826,0,0,0,0,100,0),
(@PATH,15,3542.77,-3327.501,129.5826,0,0,0,0,100,0),
(@PATH,16,3537.52,-3325.501,129.5826,0,0,0,0,100,0),
(@PATH,17,3533.931,-3324.1,130.2483,0,0,0,0,100,0),
(@PATH,18,3526.181,-3320.85,130.9983,0,0,0,0,100,0),
(@PATH,19,3526.113,-3320.813,131.0822,0,0,0,0,100,0),
(@PATH,20,3534.17,-3324.386,129.9323,0,0,0,0,100,0),
(@PATH,21,3537.67,-3325.636,129.6823,0,0,0,0,100,0),
(@PATH,22,3542.67,-3327.386,129.6823,0,0,0,0,100,0),
(@PATH,23,3560.328,-3333.262,129.4392,0,0,0,0,100,0),
(@PATH,24,3565.078,-3333.262,129.4392,0,0,0,0,100,0),
(@PATH,25,3569.578,-3333.262,129.1892,0,0,0,0,100,0),
(@PATH,26,3577.078,-3333.262,128.6892,0,0,0,0,100,0),
(@PATH,27,3586.078,-3333.512,128.1892,0,0,0,0,100,0),
(@PATH,28,3586.124,-3333.573,128.1801,0,0,0,0,100,0),
(@PATH,29,3586.624,-3333.573,127.9301,0,0,0,0,100,0),
(@PATH,30,3578.124,-3337.323,128.6801,0,0,0,0,100,0),
(@PATH,31,3576.374,-3338.073,128.6801,0,0,0,0,100,0),
(@PATH,32,3568.124,-3341.823,129.4301,0,0,0,0,100,0),
(@PATH,33,3566.624,-3342.323,129.6801,0,0,0,0,100,0),
(@PATH,34,3559.124,-3345.573,129.4301,0,0,0,0,100,0),
(@PATH,35,3553.124,-3348.073,129.4301,0,0,0,0,100,0),
(@PATH,36,3547.868,-3350.434,130.0947,0,0,0,0,100,0),
(@PATH,37,3546.368,-3354.684,130.8447,0,0,0,0,100,0),
(@PATH,38,3543.118,-3365.184,131.8447,0,0,0,0,100,0),
(@PATH,39,3540.868,-3371.184,132.5947,0,0,0,0,100,0),
(@PATH,40,3538.868,-3376.434,132.5947,0,0,0,0,100,0);

-- ghoul 1
SET @NPC := 53594;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH, 1, 3473.78, -3366.93, 136.507, 0, 0, 0, 0, 100, 0),
(@PATH, 2, 3490.31, -3376.55, 135.208, 0, 0, 0, 0, 100, 0),
(@PATH, 3, 3503.41, -3381.49, 134.565, 0, 0, 0, 0, 100, 0),
(@PATH, 4, 3535.2, -3388.79, 132.377, 0, 0, 0, 0, 100, 0),
(@PATH, 5, 3537.69, -3394.79, 132.377, 0, 0, 0, 0, 100, 0),
(@PATH, 6, 3547.23, -3422.23, 135.428, 0, 0, 0, 0, 100, 0),
(@PATH, 7, 3542.17, -3409.17, 133.978, 0, 0, 0, 0, 100, 0),
(@PATH, 8, 3534.93, -3390.99, 132.376, 0, 0, 0, 0, 100, 0),
(@PATH, 9, 3514.6, -3385.83, 132.954, 0, 0, 0, 0, 100, 0),
(@PATH, 10, 3490.51, -3379.59, 135.276, 0, 0, 0, 0, 100, 0);

-- ghoul 2
SET @NPC := 53650;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH, 1, 3540.4, -3368.09, 132.121, 0, 0, 0, 0, 100, 0),
(@PATH, 2, 3542.78, -3361.51, 131.314, 0, 0, 0, 0, 100, 0),
(@PATH, 3, 3549.92, -3341.76, 129.224, 0, 0, 0, 0, 100, 0),
(@PATH, 4, 3560.03, -3335.19, 129.328, 0, 0, 0, 0, 100, 0),
(@PATH, 5, 3574.02, -3335.48, 128.637, 0, 0, 0, 0, 100, 0),
(@PATH, 6, 3573.64, -3335.16, 128.678, 0, 0, 0, 0, 100, 0),
(@PATH, 7, 3555.43, -3333.6, 129.334, 0, 0, 0, 0, 100, 0),
(@PATH, 8, 3551.14, -3346.93, 129.178, 0, 0, 0, 0, 100, 0),
(@PATH, 9, 3543.94, -3366.65, 131.755, 0, 0, 0, 0, 100, 0),
(@PATH, 10, 3538.8, -3383.53, 132.376, 0, 0, 0, 0, 100, 0),
(@PATH, 11, 3541.21, -3408.97, 133.924, 0, 0, 0, 0, 100, 0),
(@PATH, 12, 3543.48, -3415.58, 134.695, 0, 0, 0, 0, 100, 0),
(@PATH, 13, 3544.42, -3415.4, 134.705, 0, 0, 0, 0, 100, 0),
(@PATH, 14, 3540.17, -3402.06, 133.109, 0, 0, 0, 0, 100, 0),
(@PATH, 15, 3539.67, -3377.05, 132.376, 0, 0, 0, 0, 100, 0);

-- ghoul 3
SET @NPC := 53674;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH, 1, 3522.5, -3323, 131.049, 0, 0, 0, 0, 100, 0),
(@PATH, 2, 3502.3, -3316.38, 130.224, 0, 0, 0, 0, 100, 0),
(@PATH, 3, 3526.88, -3322.32, 130.737, 0, 0, 0, 0, 100, 0),
(@PATH, 4, 3540.5, -3325.57, 129.385, 0, 0, 0, 0, 100, 0),
(@PATH, 5, 3560.99, -3330.15, 129.396, 0, 0, 0, 0, 100, 0),
(@PATH, 6, 3584.68, -3334.31, 127.753, 0, 0, 0, 0, 100, 0),
(@PATH, 7, 3571, -3331.47, 129.071, 0, 0, 0, 0, 100, 0),
(@PATH, 8, 3557.25, -3328.84, 129.396, 0, 0, 0, 0, 100, 0),
(@PATH, 9, 3532.13, -3323.54, 130.087, 0, 0, 0, 0, 100, 0);

 -- cadaver emote
 -- Mangled Cadaver SAI
SET @ENTRY := 10382;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,3,0,0,30000,30000,11,16143,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mangled Cadaver - In Combat - Cast 'Cadaver Worms' (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,1,0,6,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mangled Cadaver - On Just Died - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=10382;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(10382, 0, 0, '%s collapses but the broken body rises again!', 16, 0, 100, 0, 0, 0, 5772, 'Mangled Cadaver');
 
 
/* 
* sql\updates\world\2015_08_13_01_world.sql 
*/ 
-- Patchwork Horror 
-- Pathing for Entry: 53943 'TDB FORMAT'
SET @NPC := 53953;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x` = 3560.001, `position_y` = -3333.560, `position_z` = 129.3446 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH, 1, 3560, -3333.56, 129.345),
(@PATH, 2, 3586.66, -3333.67, 127.532),
(@PATH, 3, 3547.96, -3350.48, 129.671),
(@PATH, 4, 3535.26, -3386.41, 132.376),
(@PATH, 5, 3547.32, -3425.53, 135.592),
(@PATH, 6, 3535.26, -3386.41, 132.376),
(@PATH, 7, 3547.96, -3350.48, 129.671),
(@PATH, 8, 3586.66, -3333.67, 127.532),
(@PATH, 9, 3560, -3333.56, 129.345),
(@PATH, 10, 3534.01, -3324.43, 129.798),
(@PATH, 11, 3514.71, -3316.2, 131.367),
(@PATH, 12, 3534.01, -3324.43, 129.798);

-- Pathing for Entry: 53943 'TDB FORMAT'
SET @NPC := 53943;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2, `position_x` = 3658.833, `position_y` = -3494.780, `position_z` = 136.6372 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH, 1, 3658.83, -3494.78, 136.637),
(@PATH, 2, 3643.47, -3488.16, 137.328),
(@PATH, 3, 3627.43, -3493.95, 136.949),
(@PATH, 4, 3613.32, -3494.96, 136.837),
(@PATH, 5, 3595.51, -3479.3, 134.85),
(@PATH, 6, 3611.96, -3502.99, 137.218),
(@PATH, 7, 3628.52, -3521.97, 136.803),
(@PATH, 8, 3646.97, -3519.17, 136.667),
(@PATH, 9, 3657.54, -3512.66, 136.748);

-- Pathing for Entry: 53954 'TDB FORMAT'
SET @NPC := 53954;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2, `position_x` = 3659.589, `position_y` = -3336.161, `position_z` = 123.8126 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH, 1, 3659.59, -3336.16, 123.813),
(@PATH, 2, 3676.39, -3362, 126.91),
(@PATH, 3, 3684.48, -3376.63, 129.534),
(@PATH, 4, 3692.16, -3390.77, 131.803),
(@PATH, 5, 3704.82, -3409.99, 132.136),
(@PATH, 6, 3707.44, -3415.75, 131.862),
(@PATH, 7, 3713.12, -3429.09, 131.052),
(@PATH, 8, 3707.44, -3415.75, 131.862),
(@PATH, 9, 3704.82, -3409.99, 132.136),
(@PATH, 10, 3692.16, -3390.77, 131.803),
(@PATH, 11, 3684.48, -3376.63, 129.534),
(@PATH, 12, 3676.56, -3362.26, 126.988),
(@PATH, 13, 3659.59, -3336.16, 123.813),
(@PATH, 14, 3676.38, -3308.39, 126.575),
(@PATH, 15, 3684.71, -3277.38, 127.788),
(@PATH, 16, 3710.36, -3258.23, 127.414),
(@PATH, 17, 3684.71, -3277.38, 127.788),
(@PATH, 18, 3676.38, -3308.39, 126.575);

UPDATE `creature_template` SET `speed_walk` = 1 WHERE `Entry` = 10414;
 
 
/* 
* sql\updates\world\2015_08_13_02_world.sql 
*/ 
-- Stratholme - Hall of Light
-- 1.
SET @NPC := 54085;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3616.438,`position_y`=-3097.423,`position_z`=134.3719 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=3616.438,`position_y`=-3097.423,`position_z`=134.3719 WHERE `guid`=54071;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3616.438,-3097.423,134.3719,0,0,0,0,100,0),
(@PATH,2,3614.938,-3098.173,134.3719,0,0,0,0,100,0),
(@PATH,3,3612.438,-3099.173,134.3719,0,0,0,0,100,0),
(@PATH,4,3606.938,-3101.423,134.3719,0,0,0,0,100,0),
(@PATH,5,3606.734,-3101.405,134.6407,0,0,0,0,100,0),
(@PATH,6,3604.484,-3102.155,134.6407,0,0,0,0,100,0),
(@PATH,7,3600.234,-3096.655,134.6407,0,0,0,0,100,0),
(@PATH,8,3598.984,-3095.155,135.8907,0,0,0,0,100,0),
(@PATH,9,3598.234,-3094.155,135.8907,0,0,0,0,100,0),
(@PATH,10,3595.816,-3091.076,135.9108,0,0,0,0,100,0),
(@PATH,11,3587.79,-3079.112,135.9129,0,0,0,0,100,0),
(@PATH,12,3587.842,-3079.453,135.662,0,0,0,0,100,0),
(@PATH,13,3588.163,-3079.576,135.9112,0,0,0,0,100,0),
(@PATH,14,3596.181,-3091.539,135.891,0,0,0,0,100,0),
(@PATH,15,3598.431,-3094.289,135.891,0,0,0,0,100,0),
(@PATH,16,3598.931,-3095.039,135.891,0,0,0,0,100,0),
(@PATH,17,3599.931,-3096.539,134.891,0,0,0,0,100,0),
(@PATH,18,3604.416,-3102.23,134.1847,0,0,0,0,100,0),
(@PATH,19,3606.416,-3101.48,134.1847,0,0,0,0,100,0),
(@PATH,20,3612.416,-3098.98,134.1847,0,0,0,0,100,0),
(@PATH,21,3614.166,-3098.23,134.1847,0,0,0,0,100,0),
(@PATH,22,3614.522,-3098.114,134.3642,0,0,0,0,100,0),
(@PATH,23,3616.772,-3097.114,134.3642,0,0,0,0,100,0),
(@PATH,24,3621.522,-3093.864,134.3642,0,0,0,0,100,0),
(@PATH,25,3623.522,-3092.114,134.3642,0,0,0,0,100,0),
(@PATH,26,3632.772,-3086.114,134.3642,0,0,0,0,100,0),
(@PATH,27,3633.048,-3085.9,134.3664,0,0,0,0,100,0),
(@PATH,28,3634.048,-3085.4,134.3664,0,0,0,0,100,0),
(@PATH,29,3636.548,-3083.65,134.3664,0,0,0,0,100,0),
(@PATH,30,3638.048,-3082.9,134.3664,0,0,0,0,100,0),
(@PATH,31,3639.548,-3081.9,134.3664,0,0,0,0,100,0),
(@PATH,32,3639.528,-3081.807,134.366,0,0,0,0,100,0),
(@PATH,33,3638.028,-3082.807,134.366,0,0,0,0,100,0),
(@PATH,34,3636.778,-3083.557,134.366,0,0,0,0,100,0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=54085;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(54085, 54085, 0, 0, 2, 0, 0),
(54085, 54071, 3, 0, 2, 0, 0);

-- 2.
SET @NPC := 52141;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3535.722,`position_y`=-3057.91,`position_z`=135.3322 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=3535.722,`position_y`=-3057.91,`position_z`=135.3322 WHERE `guid`=54169;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3535.722,-3057.91,135.3322,0,0,0,0,100,0),
(@PATH,2,3540.984,-3066.577,135.6673,0,0,0,0,100,0),
(@PATH,3,3537.299,-3060.883,135.6673,0,0,0,0,100,0),
(@PATH,4,3535.783,-3058.649,135.6673,0,0,0,0,100,0),
(@PATH,5,3535.532,-3058.017,135.5822,0,0,0,0,100,0),
(@PATH,6,3533.794,-3055.673,134.997,0,0,0,0,100,0),
(@PATH,7,3529.241,-3048.929,134.997,0,0,0,0,100,0),
(@PATH,8,3530.385,-3053.843,134.997,0,0,0,0,100,0),
(@PATH,9,3529.099,-3054.688,135.247,0,0,0,0,100,0),
(@PATH,10,3524.849,-3056.438,135.247,0,0,0,0,100,0),
(@PATH,11,3524.898,-3057.071,135.247,0,0,0,0,100,0),
(@PATH,12,3517.685,-3062.228,134.997,0,0,0,0,100,0),
(@PATH,13,3515.195,-3063.973,134.997,0,0,0,0,100,0),
(@PATH,14,3517.849,-3062.096,134.997,0,0,0,0,100,0),
(@PATH,15,3512.628,-3065.658,135.247,0,0,0,0,100,0),
(@PATH,16,3512.88,-3065.546,134.997,0,0,0,0,100,0),
(@PATH,17,3512.397,-3065.865,135.247,0,0,0,0,100,0),
(@PATH,18,3507.873,-3069.02,134.997,0,0,0,0,100,0),
(@PATH,19,3501.293,-3073.773,134.997,0,0,0,0,100,0),
(@PATH,20,3502.973,-3072.586,134.997,0,0,0,0,100,0),
(@PATH,21,3500.175,-3074.654,135.247,0,0,0,0,100,0),
(@PATH,22,3498.175,-3076.154,135.247,0,0,0,0,100,0),
(@PATH,23,3498.078,-3076.195,134.997,0,0,0,0,100,0),
(@PATH,24,3497.885,-3076.195,135.247,0,0,0,0,100,0),
(@PATH,25,3496.635,-3077.195,135.247,0,0,0,0,100,0),
(@PATH,26,3498.074,-3076.204,134.997,0,0,0,0,100,0),
(@PATH,27,3500.452,-3074.542,135.247,0,0,0,0,100,0),
(@PATH,28,3503.016,-3072.576,134.997,0,0,0,0,100,0),
(@PATH,29,3509.555,-3067.772,134.997,0,0,0,0,100,0),
(@PATH,30,3507.929,-3069.026,134.997,0,0,0,0,100,0),
(@PATH,31,3512.387,-3065.935,135.247,0,0,0,0,100,0),
(@PATH,32,3512.517,-3065.823,135.247,0,0,0,0,100,0),
(@PATH,33,3519.535,-3060.917,134.997,0,0,0,0,100,0),
(@PATH,34,3517.873,-3062.076,134.997,0,0,0,0,100,0),
(@PATH,35,3524.547,-3057.446,134.997,0,0,0,0,100,0),
(@PATH,36,3522.894,-3058.655,134.997,0,0,0,0,100,0),
(@PATH,37,3525.393,-3056.905,135.247,0,0,0,0,100,0),
(@PATH,38,3528.643,-3054.905,135.247,0,0,0,0,100,0),
(@PATH,39,3527.923,-3055.323,134.997,0,0,0,0,100,0),
(@PATH,40,3528.969,-3054.581,135.247,0,0,0,0,100,0),
(@PATH,41,3532.499,-3054.48,134.997,0,0,0,0,100,0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=52141;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(52141, 52141, 0, 0, 2, 0, 0),
(52141, 54169, 3, 0, 2, 0, 0);

-- 3.
SET @NPC := 52144;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3443.406,`position_y`=-3083.562,`position_z`=135.0021 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=3443.406,`position_y`=-3083.562,`position_z`=135.0021 WHERE `guid`=54170;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3443.406,-3083.562,135.0021,0,0,0,0,100,0),
(@PATH,2,3438.447,-3078.663,135.5136,0,0,0,0,100,0),
(@PATH,3,3438.595,-3078.601,135.0019,0,0,0,0,100,0),
(@PATH,4,3442.701,-3082.71,135.0021,0,0,0,0,100,0),
(@PATH,5,3444.575,-3084.654,135.0022,0,0,0,0,100,0),
(@PATH,6,3445.956,-3083.634,135.0022,0,0,0,0,100,0),
(@PATH,7,3446.778,-3083.367,135.2478,0,0,0,0,100,0),
(@PATH,8,3449.778,-3082.867,135.2478,0,0,0,0,100,0),
(@PATH,9,3449.807,-3082.485,135.2462,0,0,0,0,100,0),
(@PATH,10,3457.698,-3077.302,134.9976,0,0,0,0,100,0),
(@PATH,11,3455.978,-3078.373,134.9957,0,0,0,0,100,0),
(@PATH,12,3458.637,-3076.211,135.2484,0,0,0,0,100,0),
(@PATH,13,3460.387,-3075.211,135.2484,0,0,0,0,100,0),
(@PATH,14,3460.28,-3075.071,135.2505,0,0,0,0,100,0),
(@PATH,15,3465.067,-3071.659,135.2512,0,0,0,0,100,0),
(@PATH,16,3465.241,-3071.764,135.2516,0,0,0,0,100,0),
(@PATH,17,3472.513,-3066.586,135.0025,0,0,0,0,100,0),
(@PATH,18,3470.79,-3067.797,135.0025,0,0,0,0,100,0),
(@PATH,19,3474.771,-3064.983,135.2522,0,0,0,0,100,0),
(@PATH,20,3474.693,-3065.094,135.2523,0,0,0,0,100,0),
(@PATH,21,3482.48,-3059.7,135.0017,0,0,0,0,100,0),
(@PATH,22,3480.787,-3060.873,135.0018,0,0,0,0,100,0),
(@PATH,23,3478.327,-3062.577,135.002,0,0,0,0,100,0),
(@PATH,24,3476.108,-3064.115,135.0021,0,0,0,0,100,0),
(@PATH,25,3475.113,-3064.708,135.2523,0,0,0,0,100,0),
(@PATH,26,3472.919,-3066.325,135.0025,0,0,0,0,100,0),
(@PATH,27,3471.327,-3067.427,135.0025,0,0,0,0,100,0),
(@PATH,28,3465.504,-3071.557,135.2518,0,0,0,0,100,0),
(@PATH,29,3466.285,-3070.921,135.0025,0,0,0,0,100,0),
(@PATH,30,3465.06,-3071.76,135.2514,0,0,0,0,100,0),
(@PATH,31,3460.56,-3074.76,135.2514,0,0,0,0,100,0),
(@PATH,32,3461.687,-3074.164,135.0022,0,0,0,0,100,0),
(@PATH,33,3460.227,-3075.276,135.2483,0,0,0,0,100,0),
(@PATH,34,3458.727,-3076.276,135.2483,0,0,0,0,100,0),
(@PATH,35,3456.701,-3077.72,134.9965,0,0,0,0,100,0),
(@PATH,36,3450.072,-3082.449,134.9891,0,0,0,0,100,0),
(@PATH,37,3451.695,-3081.291,134.9909,0,0,0,0,100,0),
(@PATH,38,3449.717,-3082.664,135.247,0,0,0,0,100,0),
(@PATH,39,3447.467,-3084.164,135.247,0,0,0,0,100,0),
(@PATH,40,3447.448,-3084.141,135.2488,0,0,0,0,100,0),
(@PATH,41,3445.289,-3083.674,135.0022,0,0,0,0,100,0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=52144;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(52144, 52144, 0, 0, 2, 0, 0),
(52144, 54170, 3, 0, 2, 0, 0);

-- 4.
SET @NPC := 54205;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3581.3,`position_y`=-2994.275,`position_z`=125.25 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3581.3,-2994.275,125.25,0,0,0,0,100,0),
(@PATH,2,3582.05,-2995.275,125.25,0,0,0,0,100,0),
(@PATH,3,3581.05,-2995.775,125.25,0,0,0,0,100,0),
(@PATH,4,3575.3,-2999.775,125.25,0,0,0,0,100,0),
(@PATH,5,3573.05,-3001.275,125.25,0,0,0,0,100,0),
(@PATH,6,3571.8,-3002.025,125.25,0,0,0,0,100,0),
(@PATH,7,3569.3,-3004.025,125.25,0,0,0,0,100,0),
(@PATH,8,3565.3,-3006.775,125.25,0,0,0,0,100,0),
(@PATH,9,3562.695,-3008.538,125.2498,0,0,0,0,100,0),
(@PATH,10,3555.445,-3014.038,125.2498,0,0,0,0,100,0),
(@PATH,11,3553.945,-3015.288,125.2498,0,0,0,0,100,0),
(@PATH,12,3551.945,-3016.788,125.2498,0,0,0,0,100,0),
(@PATH,13,3546.965,-3020.639,125.3795,0,0,0,0,100,0),
(@PATH,14,3550.465,-3026.139,125.3795,0,0,0,0,100,0),
(@PATH,15,3550.965,-3027.139,125.3795,0,0,0,0,100,0),
(@PATH,16,3552.215,-3028.389,125.3795,0,0,0,0,100,0),
(@PATH,17,3552.715,-3029.889,125.3795,0,0,0,0,100,0),
(@PATH,18,3553.965,-3031.639,126.1295,0,0,0,0,100,0),
(@PATH,19,3553.932,-3031.731,126.1293,0,0,0,0,100,0),
(@PATH,20,3552.932,-3029.731,125.3793,0,0,0,0,100,0),
(@PATH,21,3552.182,-3028.981,125.3793,0,0,0,0,100,0),
(@PATH,22,3551.182,-3026.981,125.3793,0,0,0,0,100,0),
(@PATH,23,3550.432,-3025.981,125.3793,0,0,0,0,100,0),
(@PATH,24,3546.863,-3020.401,125.2494,0,0,0,0,100,0),
(@PATH,25,3551.863,-3016.651,125.2494,0,0,0,0,100,0),
(@PATH,26,3553.863,-3015.401,125.2494,0,0,0,0,100,0),
(@PATH,27,3555.363,-3014.151,125.2494,0,0,0,0,100,0),
(@PATH,28,3562.876,-3008.442,125.2495,0,0,0,0,100,0),
(@PATH,29,3565.126,-3006.692,125.2495,0,0,0,0,100,0),
(@PATH,30,3569.376,-3003.942,125.2495,0,0,0,0,100,0),
(@PATH,31,3571.876,-3002.192,125.2495,0,0,0,0,100,0),
(@PATH,32,3573.126,-3001.442,125.2495,0,0,0,0,100,0),
(@PATH,33,3575.376,-2999.942,125.2495,0,0,0,0,100,0),
(@PATH,34,3581.126,-2995.942,125.2495,0,0,0,0,100,0);
 
 
/* 
* sql\updates\world\2015_08_13_03_world.sql 
*/ 
-- Stratholme - The Gauntlet
-- 1. Ghoul
SET @NPC := 53675;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH, 1, 3711.96, -3428.02, 131.083, 0, 0, 0, 0, 100, 0),
(@PATH, 2, 3715.35, -3439.06, 129.468, 0, 0, 0, 0, 100, 0),
(@PATH, 3, 3719.55, -3452.41, 129.604, 0, 0, 0, 0, 100, 0),
(@PATH, 4, 3723.87, -3470.47, 129.838, 0, 0, 0, 0, 100, 0),
(@PATH, 5, 3711.6, -3485.74, 129.702, 0, 0, 0, 0, 100, 0),
(@PATH, 6, 3696.91, -3487.86, 131.216, 0, 0, 0, 0, 100, 0),
(@PATH, 7, 3675.95, -3489.1, 135.379, 0, 0, 0, 0, 100, 0),
(@PATH, 8, 3650.84, -3490.4, 136.889, 0, 0, 0, 0, 100, 0),
(@PATH, 9, 3664.74, -3488.84, 136.633, 0, 0, 0, 0, 100, 0),
(@PATH, 10, 3692.63, -3486.4, 132.018, 0, 0, 0, 0, 100, 0),
(@PATH, 11, 3713.54, -3482.02, 129.701, 0, 0, 0, 0, 100, 0),
(@PATH, 12, 3719.24, -3466.01, 129.741, 0, 0, 0, 0, 100, 0),
(@PATH, 13, 3717.94, -3444.6, 129.36, 0, 0, 0, 0, 100, 0),
(@PATH, 14, 3716.43, -3439.47, 129.393, 0, 0, 0, 0, 100, 0);
-- 2 . ghoul
SET @NPC := 53601;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH, 1, 3590.12, -3472.24, 135.046, 0, 0, 0, 0, 100, 0),
(@PATH, 2, 3605.83, -3487.43, 135.938, 0, 0, 0, 0, 100, 0),
(@PATH, 3, 3615.36, -3497.68, 137.061, 0, 0, 0, 0, 100, 0),
(@PATH, 4, 3627.56, -3514.74, 136.693, 0, 0, 0, 0, 100, 0),
(@PATH, 5, 3638.86, -3523.51, 136.974, 0, 0, 0, 0, 100, 0),
(@PATH, 6, 3654.2, -3517.46, 136.842, 0, 0, 0, 0, 100, 0),
(@PATH, 7, 3661.21, -3505.25, 136.721, 0, 0, 0, 0, 100, 0),
(@PATH, 8, 3655.99, -3491.83, 136.798, 0, 0, 0, 0, 100, 0),
(@PATH, 9, 3640.93, -3487.52, 137.452, 0, 0, 0, 0, 100, 0),
(@PATH, 10, 3631.02, -3489.32, 137.395, 0, 0, 0, 0, 100, 0),
(@PATH, 11, 3613.42, -3495.94, 136.891, 0, 0, 0, 0, 100, 0),
(@PATH, 12, 3601.41, -3489.18, 135.84, 0, 0, 0, 0, 100, 0);

-- texts
-- Undead Postman SAI
SET @ENTRY := 11142;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,40,0,0,0,0,0,0,"Undead Postman - On Just Summoned - Start Attacking"),
(@ENTRY,0,1,0,0,0,50,0,0,1000,20000,30000,11,5137,64,0,0,0,0,2,0,0,0,0,0,0,0,"Undead Postman - In Combat - Cast 'Call of the Grave'"),
(@ENTRY,0,2,0,0,0,75,0,3000,4000,8000,9000,11,7713,64,0,0,0,0,2,0,0,0,0,0,0,0,"Undead Postman - In Combat - Cast 'Wailing Dead'"),
(@ENTRY,0,3,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undead Postman - On Aggro - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=11142;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(11142, 0, 0, 'No tampering with the mail!', 12, 0, 100, 0, 0, 0, 6470, 'Undead Postman');

-- enable flying
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=10408;
-- ghoul
SET @NPC := 53696;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH, 1, 3874.56, -3680.21, 142.696, 0, 0, 0, 0, 100, 0),
(@PATH, 2, 3888.33, -3677.68, 141.623, 0, 0, 0, 0, 100, 0),
(@PATH, 3, 3910.54, -3669.96, 138.655, 0, 0, 0, 0, 100, 0),
(@PATH, 4, 3927.9, -3660.86, 139.4, 0, 0, 0, 0, 100, 0),
(@PATH, 5, 3937.1, -3653.54, 140.085, 0, 0, 0, 0, 100, 0),
(@PATH, 6, 3951.33, -3644.09, 135.489, 0, 0, 0, 0, 100, 0),
(@PATH, 7, 3966.27, -3637.04, 132.434, 0, 0, 0, 0, 100, 0),
(@PATH, 8, 3981.49, -3626.32, 130.01, 0, 0, 0, 0, 100, 0),
(@PATH, 9, 3994.5, -3616.13, 129.41, 0, 0, 0, 0, 100, 0),
(@PATH, 10, 3984.25, -3625.25, 130.021, 0, 0, 0, 0, 100, 0),
(@PATH, 11, 3972.75, -3635.49, 131.203, 0, 0, 0, 0, 100, 0),
(@PATH, 12, 3956.89, -3644.66, 134.041, 0, 0, 0, 0, 100, 0),
(@PATH, 13, 3941.59, -3650.12, 139.218, 0, 0, 0, 0, 100, 0),
(@PATH, 14, 3930.15, -3658.18, 139.569, 0, 0, 0, 0, 100, 0),
(@PATH, 15, 3918.7, -3666.25, 137.71, 0, 0, 0, 0, 100, 0),
(@PATH, 16, 3902.74, -3674.09, 139.385, 0, 0, 0, 0, 100, 0),
(@PATH, 17, 3896.26, -3676.72, 140.59, 0, 0, 0, 0, 100, 0);

-- Plague Ghoul SAI
SET @ENTRY := 10405;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,4,0,1,0,100,0,3000,5000,8000,12000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Plague Ghoul - Out of Combat - Play Emote 1");

-- Ghoul Ravener SAI
SET @ENTRY := 10406;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,2,0,1,0,100,0,3000,5000,8000,12000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ghoul Ravener - Out of Combat - Play Emote 1");

-- Fleshflayer Ghoul SAI
SET @ENTRY := 10407;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,2,0,1,0,100,0,3000,5000,8000,12000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fleshflayer Ghoul - Out of Combat - Play Emote 1");
 
 
/* 
* sql\updates\world\2015_08_13_04_world.sql 
*/ 
-- 
SET @QUEST              := 13343; -- Mystery of the Infinite 2 (13343)
SET @NPC_HoE            := 32327; -- Hourglass of Eternity
SET @NPC_PU             := 32331; -- Past You
SET @SPELL_SUMMON_PU    := 60790; -- Mystery of the Infinite: Force Cast to Player of Summon Past You
SET @SPELL_MIRROR       := 49889; -- Mystery of the Infinite: Future You's Mirror Image Aura
SET @SPELL_NEARBY       := 50867; -- Hourglass of Eternity Nearby
SET @AURA_VISUAL        := 50057; -- Mystery of the Infinite: Hourglass of Eternity Visual/Sound Aura
SET @SPELL_ASSAILANT    := 49900; -- Summon Infinite Assailant
SET @SPELL_DESTROYER    := 49901; -- Summon Infinite Destroyer
SET @SPELL_MAGUS        := 49902; -- Summon Infinite Chrono-Magus
SET @SPELL_TIMERENDER   := 60887; -- Summon Infinite Timerender
SET @NPC_IT             := 32352; -- Infinite Timerender

-- Infinite Timerender
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPC_IT;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@NPC_IT;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_IT,0,0,0,0,0,100,0,5000,6000,12000,17000,11,51020,0,0,0,0,0,2,0,0,0,0,0,0,0,'Infinite Timerender - IC - Cast Time Lapse'),
(@NPC_IT,0,1,0,6,0,100,0,0,0,0,0,45,2,1,0,0,0,0,19,@NPC_HoE,20,0,0,0,0,0,'Infinite Timerender - On Death - Set Data on HoE');

UPDATE `spell_area` SET `quest_start_status`=66, `quest_end_status`=0 WHERE `spell`=50012 AND `area`=4175;

-- Hourglass of Eternity
UPDATE `creature_template` SET `AIName`='SmartAI',`RegenHealth`=0 WHERE `entry`=@NPC_HoE;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=@NPC_HoE AND `source_type`=0) OR (`entryorguid`IN (@NPC_HoE*100,@NPC_HoE*100+1) AND `source_type`=9);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_HoE,0,0,1,54,0,100,1,0,0,0,0,85,@SPELL_SUMMON_PU,0,0,0,0,0,7,0,0,0,0,0,0,0,'Hourglass of Eternity - On spawn - Invoker Cast'),
(@NPC_HoE,0,1,2,61,0,100,0,0,0,0,0,11,@SPELL_NEARBY,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On link - Cast Spell'),
(@NPC_HoE,0,2,3,61,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - Set passive - Self'),
(@NPC_HoE,0,3,6,61,0,100,0,0,0,0,0,80,@NPC_HoE*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On link - Start timed script'),
(@NPC_HoE,0,4,0,6,0,100,0,0,0,0,0,6,@QUEST,0,0,0,0,0,16,0,0,0,0,0,0,0,'Hourglass of Eternity - On Death - Fail Quest'),
(@NPC_HoE,0,5,0,38,0,100,0,2,1,0,0,80,@NPC_HoE*100+1,2,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On Data Set  - Start timed script two'),
(@NPC_HoE,0,6,0,61,0,100,0,0,0,0,0,11,@AURA_VISUAL,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On link - Cast Spell'),
(@NPC_HoE,0,7,0,54,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,'Hourglass of Eternity - On spawn - Store target'),

-- Wave 1 
(@NPC_HoE*100,9,0,0,0,0,100,1,3000,3000,0,0,45,1,1,0,0,0,0,19,@NPC_PU,20,0,0,0,0,0,'Hourglass of Eternity - On update - Set Data on Past You'),
(@NPC_HoE*100,9,1,0,0,0,100,1,5000,5000,0,0,45,1,2,0,0,0,0,19,@NPC_PU,20,0,0,0,0,0,'Hourglass of Eternity - On update - Set Data on Past You'),
(@NPC_HoE*100,9,2,0,0,0,100,1,5000,5000,0,0,11,@SPELL_MAGUS,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On update - Cast Spell on self'),
(@NPC_HoE*100,9,3,0,0,0,100,1,0,0,0,0,11,@SPELL_ASSAILANT,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On update - Cast Spell on self'),
-- Wave 2 
(@NPC_HoE*100,9,4,0,0,0,100,1,5000,5000,0,0,45,1,3,0,0,0,0,19,@NPC_PU,20,0,0,0,0,0,'Hourglass of Eternity - On update - Set Data on Past You'),
(@NPC_HoE*100,9,5,0,0,0,100,1,6000,6000,0,0,45,1,4,0,0,0,0,19,@NPC_PU,20,0,0,0,0,0,'Hourglass of Eternity - On update - Set Data on Past You'),
(@NPC_HoE*100,9,6,0,0,0,100,1,19000,19000,0,0,11,@SPELL_MAGUS,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On update - Cast Spell on self'),
(@NPC_HoE*100,9,7,0,0,0,100,1,0,0,0,0,11,@SPELL_MAGUS,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On update - Cast Spell on self'),
-- Wave 3 
(@NPC_HoE*100,9,8,0,0,0,100,1,5000,5000,0,0,45,1,5,0,0,0,0,19,@NPC_PU,20,0,0,0,0,0,'Hourglass of Eternity - On update - Set Data on Past You'),
(@NPC_HoE*100,9,9,0,0,0,100,1,6000,6000,0,0,45,1,6,0,0,0,0,19,@NPC_PU,20,0,0,0,0,0,'Hourglass of Eternity - On update - Set Data on Past You'),
(@NPC_HoE*100,9,10,0,0,0,100,1,5000,5000,0,0,45,1,7,0,0,0,0,19,@NPC_PU,20,0,0,0,0,0,'Hourglass of Eternity - On update - Set Data on Past You'),
(@NPC_HoE*100,9,11,0,0,0,100,1,14000,14000,0,0,11,@SPELL_MAGUS,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On update - Cast Spell on self'),
(@NPC_HoE*100,9,12,0,0,0,100,1,0,0,0,0,11,@SPELL_ASSAILANT,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On update - Cast Spell on self'),
(@NPC_HoE*100,9,13,0,0,0,100,1,0,0,0,0,11,@SPELL_DESTROYER,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On update - Cast Spell on self'),
-- Wave 4 
(@NPC_HoE*100,9,14,0,0,0,100,1,5000,5000,0,0,45,1,8,0,0,0,0,19,@NPC_PU,20,0,0,0,0,0,'Hourglass of Eternity - On update - Set Data on Past You'),
(@NPC_HoE*100,9,15,0,0,0,100,1,9000,9000,0,0,45,1,9,0,0,0,0,19,@NPC_PU,20,0,0,0,0,0,'Hourglass of Eternity - On update - Set Data on Past You'),
(@NPC_HoE*100,9,16,0,0,0,100,1,7000,7000,0,0,45,1,10,0,0,0,0,19,@NPC_PU,20,0,0,0,0,0,'Hourglass of Eternity - On update - Set Data on Past You'),
(@NPC_HoE*100,9,17,0,0,0,100,1,9000,9000,0,0,11,@SPELL_MAGUS,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On update - Set Data on Past You'),
(@NPC_HoE*100,9,18,0,0,0,100,1,0,0,0,0,11,@SPELL_ASSAILANT,0,0,0,0,0,1,0,0,0,0,0,0,0,'OHourglass of Eternity - On update - Cast Spell on self'),
(@NPC_HoE*100,9,19,0,0,0,100,1,0,0,0,0,11,@SPELL_DESTROYER,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On update - Cast Spell on self'),
-- Wave 5 final 
(@NPC_HoE*100,9,20,0,0,0,100,1,23000,23000,0,0,11,@SPELL_TIMERENDER,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On update - Cast Spell on self'),
-- End Text Script
(@NPC_HoE*100+1,9,0,0,0,0,100,1,4000,4000,0,0,45,2,1,0,0,0,0,19,@NPC_PU,20,0,0,0,0,0,'Hourglass of Eternity - On update - Set Data on Past You'),
(@NPC_HoE*100+1,9,1,0,0,0,100,1,0,0,0,0,15,@QUEST,0,0,0,0,0,12,1,0,0,0,0,0,0,'Hourglass of Eternity - On update - Give Quest Credit'),
(@NPC_HoE*100+1,9,2,0,0,0,100,1,8000,8000,0,0,45,2,2,0,0,0,0,19,@NPC_PU,20,0,0,0,0,0,'Hourglass of Eternity - On update - Set Data on Past You'),
(@NPC_HoE*100+1,9,3,0,0,0,100,1,4000,4000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hourglass of Eternity - On update -Despawn after timer');

-- Past You
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC_PU AND `source_type`=0;
UPDATE `creature_template` SET `faction`=2141,`AIName`='SmartAI',`unit_flags`=0,`RegenHealth`=0, `minlevel`=75, `maxlevel`=75 WHERE `entry`=@NPC_PU;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_PU,0,0,1,54,0,100,1,0,0,0,0,85,@SPELL_MIRROR,2,0,0,0,0,1,0,0,0,0,0,0,0,'Past You - On spawn - Invoker Cast Spell - Self'),
(@NPC_PU,0,1,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,11,@NPC_HoE,10,0,0,0,0,0,'Past You - On link - Set Orientation'),
(@NPC_PU,0,2,0,38,0,100,0,1,1,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Past You - On Data set - Whisper 1'),
(@NPC_PU,0,3,0,38,0,100,0,1,2,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Past You - On Data set - Whisper 2'),
(@NPC_PU,0,4,0,38,0,100,0,1,3,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Past You - On Data set - Whisper 3'),
(@NPC_PU,0,5,0,38,0,100,0,1,4,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Past You - On Data set - Whisper 4'),
(@NPC_PU,0,6,0,38,0,100,0,1,5,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Past You - On Data set - Whisper 5'),
(@NPC_PU,0,7,0,38,0,100,0,1,6,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Past You - On Data set - Whisper 6'),
(@NPC_PU,0,8,0,38,0,100,0,1,7,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'Past You - On Data set - Whisper 7'),
(@NPC_PU,0,9,0,38,0,100,0,1,8,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Past You - On Data set - Whisper 8'),
(@NPC_PU,0,10,0,38,0,100,0,1,9,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'Past You - On Data set - Whisper 9'),
(@NPC_PU,0,11,0,38,0,100,0,1,10,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,'Past You - On Data set - Whisper 10'),
(@NPC_PU,0,12,0,38,0,100,0,2,1,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0,'Past You - On Data set - Whisper 11'),
(@NPC_PU,0,13,14,38,0,100,0,2,2,0,0,1,12,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,'Future You - On Data Set - Whisper 12'),
(@NPC_PU,0,14,0,61,0,100,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Past You - On Link - Despawn after timer'),
(@NPC_PU,0,15,16,7,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Past You - On Evade - Despawn after timer'),
(@NPC_PU,0,16,0,61,0,100,0,0,0,0,0,85,@SPELL_SUMMON_PU,0,0,0,0,0,7,0,0,0,0,0,0,0,'Past You - On Link - Cast Summon Clone');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@SPELL_MIRROR AND `ConditionValue2`=@NPC_PU;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,7,@SPELL_MIRROR,0,1,31,0,3,@NPC_PU,0,0,0,'','Spell target Past You');

DELETE FROM `creature_template_addon` WHERE `entry` IN (@NPC_PU);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(@NPC_PU,0,0x0,0x1,'');

-- Past You's text
DELETE FROM `creature_text` WHERE `entry`=@NPC_PU;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`, `BroadcastTextId`) VALUES
(@NPC_PU,1,0,'Whoa! You''re me, but from the future! Hey, my equipment got an upgrade! Cool!',15,0,100,396,0,0,'Past You', 32764), 
(@NPC_PU,2,0,'Here come the Infinites! I''ve got to keep the hourglass safe. Can you help?',15,0,100,396,0,0,'Past You', 32769), 
(@NPC_PU,3,0,'This equipment looks cool and all, but couldn''t we have done a little better? Are you even raiding?',15,0,100,396,0,0,'Past You', 32770), 
(@NPC_PU,4,0,'So, how does it all turn out in Icecrown?',15,0,100,396,0,0,'Past You', 32771),
(@NPC_PU,5,0,'It might help if you could tell me how many of these guys we''re going to fight.  You can remember that, right, grandpa?',15,0,100,396,0,0,'Past You', 32775),
(@NPC_PU,6,0,'Chromie said that if I don''t do this just right, I might wink out of existence. If I go, then you go!',15,0,100,396,0,0,'Past You', 32772), 
(@NPC_PU,7,0,'I just want you to know that if we get through this alive, I''m making sure that we turn out better than you. No offense.',15,0,100,396,0,0,'Past You', 32776), 
(@NPC_PU,8,0,'Looks like I''m an underachiever.',15,0,100,396,0,0,'Past You', 32773), 
(@NPC_PU,9,0,'Wait a minute! If you''re here, then that means that in the not-so-distant future I''m going to be you helping me? Are we stuck in a time loop?!',15,0,100,396,0,0,'Past You', 32777), 
(@NPC_PU,10,0,'I think I''m going to turn to drinking after this.',15,0,100,396,0,0,'Past You', 32774), 
(@NPC_PU,11,0,'What the heck? Nozdormu is up there!',15,0,100,396,0,0,'Past You', 32781), 
(@NPC_PU,12,0,'I feel like I''m being pulled away through time. Thanks for the help....',15,0,100,396,0,0,'Past You', 32782);
 
 
/* 
* sql\updates\world\2015_08_21_00_world.sql 
*/ 
DELETE FROM `reference_loot_template` WHERE `Entry`=10018 AND `Item`=54469;
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(10018, 54469, 0, 5, 0, 1, 3, 1, 1, NULL);
 
 
/* 
* sql\updates\world\2015_08_21_01_world.sql 
*/ 
DELETE FROM `command` WHERE `name` = 'debug loadcells';
INSERT INTO `command` (`name`, `permission`, `help`) VALUES ('debug loadcells', 835, 'Syntax: .debug loadcells [mapId]\nLoads all cells for debugging purposes');
 
 
/* 
* sql\updates\world\2015_08_21_02_world.sql 
*/ 
DELETE FROM `spell_script_names` WHERE `spell_id` = 35941 AND `ScriptName` = 'spell_kael_gravity_lapse';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (35941, 'spell_kael_gravity_lapse');

UPDATE `gameobject_template` SET `flags` = `flags`|33 WHERE `entry` = 184069;

UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `guid` IN (12567, 12568, 12569, 12570);

DELETE FROM `creature_text` WHERE `entry` = 19622 AND `groupid` = 14;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(19622, 14, 0, '%s begins to cast Pyroblast!', 41, 0, 100, 0, 0, 0, 20775, 0, 'kaelthas EMOTE_PYROBLAST');
 
 
/* 
* sql\updates\world\2015_08_23_00_world.sql 
*/ 
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=58694;

DELETE FROM `spell_script_names` WHERE `ScriptName` IN (
'spell_cyanigosa_arcane_vacuum',
'spell_ichoron_splatter',
'spell_ichoron_protective_bubble',
'spell_ichoron_drained',
'spell_ichoron_merge',
'spell_moragg_ray',
'spell_moragg_ray_of_pain',
'spell_moragg_ray_of_suffering',
'spell_xevozz_summon_ethereal_sphere',
'spell_violet_hold_destroy_door_seal',
'spell_violet_hold_portal_periodic',
'spell_violet_hold_teleport_player',
'spell_crystal_activation'
);
INSERT INTO `spell_script_names`(`spell_id`,`ScriptName`) values
(58694,'spell_cyanigosa_arcane_vacuum'),
(54259,'spell_ichoron_splatter'),
(54306,'spell_ichoron_protective_bubble'),
(59820,'spell_ichoron_drained'),
(54269,'spell_ichoron_merge'),
(54438,'spell_moragg_ray'),
(54442,'spell_moragg_ray'),
(59523,'spell_moragg_ray'),
(59524,'spell_moragg_ray'),
(58040,'spell_violet_hold_destroy_door_seal'),
(58008,'spell_violet_hold_portal_periodic'),
(62138,'spell_violet_hold_teleport_player');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 and `SourceEntry` IN (57912, 57930, 58152, 54258, 54264, 54265, 54266, 54267, 54269);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,57912,0,0,31,0,3,29425,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,57930,0,0,31,0,3,30857,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,0,31,0,3,30661,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,1,31,0,3,30662,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,2,31,0,3,30663,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,3,31,0,3,30664,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,4,31,0,3,30665,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,5,31,0,3,30666,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,6,31,0,3,30667,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,7,31,0,3,30668,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,8,31,0,3,30918,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,9,31,0,3,30961,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,10,31,0,3,30962,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,11,31,0,3,30963,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,12,31,0,3,31007,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,13,31,0,3,31008,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,14,31,0,3,31009,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,15,31,0,3,31010,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,16,31,0,3,31118,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,58152,0,17,31,0,3,32191,0,0,0,0,'','Defense System - Arcane Lightning'),
(13,1,54258,0,0,31,0,3,29326,102906,0,0,0,'','Ichoron - Water Globule'),
(13,1,54264,0,0,31,0,3,29326,102905,0,0,0,'','Ichoron - Water Globule'),
(13,1,54265,0,0,31,0,3,29326,102904,0,0,0,'','Ichoron - Water Globule'),
(13,1,54266,0,0,31,0,3,29326,102901,0,0,0,'','Ichoron - Water Globule'),
(13,1,54267,0,0,31,0,3,29326,102902,0,0,0,'','Ichoron - Water Globule'),
(13,1,54269,0,0,31,0,3,29313,0,0,0,0,'','Ichoron - Merge');

UPDATE `creature_template` SET `gossip_menu_id`=9997 WHERE `entry`=30658;

UPDATE `gossip_menu_option` SET `action_menu_id`=9998 WHERE `menu_id`=9997;

UPDATE `creature_template` SET `ScriptName`='npc_violet_hold_teleportation_portal' WHERE `entry`=30679;
UPDATE `creature_template` SET `ScriptName`='npc_violet_hold_teleportation_portal_elite' WHERE `entry`=32174;
UPDATE `creature_template` SET `ScriptName`='npc_violet_hold_teleportation_portal_intro' WHERE `entry`=31011;

UPDATE `creature_template` SET `ScriptName`='npc_violet_hold_defense_system' WHERE `entry`=30837;

UPDATE `creature_template` SET `unit_flags`=832 WHERE `entry` IN (31134, 31506); -- Cyanigosa

UPDATE `creature_template` SET `speed_walk`=2.22222/2.5, `speed_run`=8.0/7.0, `unit_flags`=768 WHERE `entry` IN (31079, 31492); -- Azure Saboteur

UPDATE `creature_template` SET `speed_walk`=4.0/2.5, `speed_run`=12.0/7.0, `unit_flags`=832 WHERE `entry` IN (29266, 31511, 32231, 32552); -- Xevozz
UPDATE `creature_template` SET `speed_walk`=3.0/2.5, `speed_run`=3.0/7.0 WHERE `entry` IN (29271, 31514, 32582, 32583); -- Ethereal Sphere
UPDATE `creature_template` SET `speed_walk`=4.0/2.5, `speed_run`=12.0/7.0, `unit_flags`=832 WHERE `entry` IN (29312, 31509, 32237, 32553); -- Lavanthor
UPDATE `creature_template` SET `speed_walk`=4.0/2.5, `speed_run`=12.0/7.0, `unit_flags`=832 WHERE `entry` IN (29313, 31508, 32234, 32554); -- Ichoron
UPDATE `creature_template` SET `speed_walk`=4.0/2.5, `speed_run`=4.0/7.0, `unit_flags`=33587200 WHERE `entry` IN (29321, 31515); -- Ichor Globule
UPDATE `creature_template` SET `speed_walk`=4.0/2.5, `speed_run`=12.0/7.0, `unit_flags`=832 WHERE `entry` IN (29314, 31512, 32230, 32555); -- Zuramat
UPDATE `creature_template` SET `speed_walk`=4.0/2.5, `speed_run`=10.0/7.0, `unit_flags`=33600 WHERE `entry` IN (29315, 31507, 32226, 32550); -- Erekem
UPDATE `creature_template` SET `speed_walk`=4.0/2.5, `speed_run`=10.0/7.0, `unit_flags`=33600 WHERE `entry` IN (29395, 31513, 32228, 32549); -- Erekem Guard
UPDATE `creature_template` SET `speed_walk`=4.0/2.5, `speed_run`=12.0/7.0, `unit_flags`=33600 WHERE `entry` IN (29316, 31510, 32235, 32551); -- Moragg

UPDATE `creature_template` SET `minlevel`=77, `maxlevel`=77, `ScriptName`='boss_xevozz' WHERE `entry`=32231; -- Xevozz
UPDATE `creature_template` SET `minlevel`=77, `maxlevel`=77, `ScriptName`='boss_lavanthor' WHERE `entry`=32237; -- Lavanthor
UPDATE `creature_template` SET `minlevel`=77, `maxlevel`=77, `ScriptName`='boss_ichoron' WHERE `entry`=32234; -- Ichoron
UPDATE `creature_template` SET `minlevel`=77, `maxlevel`=77, `ScriptName`='boss_zuramat' WHERE `entry`=32230; -- Zuramat
UPDATE `creature_template` SET `minlevel`=77, `maxlevel`=77, `ScriptName`='boss_erekem' WHERE `entry`=32226; -- Erekem
UPDATE `creature_template` SET `minlevel`=76, `maxlevel`=76, `ScriptName`='npc_erekem_guard' WHERE `entry`=32228; -- Erekem Guard
UPDATE `creature_template` SET `minlevel`=77, `maxlevel`=77, `ScriptName`='boss_moragg' WHERE `entry`=32235; -- Moragg

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (29364, 29365); -- Void Sentry
UPDATE `creature_template` SET `flags_extra`=0, `AIName`='', `ScriptName`='npc_void_sentry' WHERE `entry`=29364; -- Void Sentry
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=29365; -- Void Sentry
UPDATE `creature_template` SET `unit_flags`=0, `unit_flags2`=0 WHERE `entry` IN (29364, 31518);
UPDATE `creature_template` SET `unit_flags`=33554432, `unit_flags2`=2080 WHERE `entry` IN (29365, 31519); -- Void Sentry

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x1 WHERE `entry` IN (32552, 32553, 32554, 32555, 32550, 32551);
UPDATE `creature_template` SET `mechanic_immune_mask`=536941137 WHERE `entry` IN (32231, 32552, 32237, 32553, 32234, 32554, 32230, 32555, 32226, 32550, 32228, 32549, 32235, 32551);

UPDATE `creature_template` SET `InhabitType`=4, `flags_extra`=128 WHERE `entry`=30837;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (29326, 30896);
UPDATE `creature` SET `modelid`=0, `spawndist`=0, `MovementType`=0 WHERE `id` IN (29326, 30896);

UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (32226,32228,32230,32231,32234,32235,32237);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (32226,32228,32230,32231,32234,32235,32237);

DELETE FROM `creature_template_addon` WHERE `entry` IN (30837, 30896, 31079, 29364, 29365, 31518, 31519);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(30837, 0, 0x3000000, 0x1, '57886 57887'),
(30896, 0, 0x3000000, 0x1, ''),
(31079, 0, 0x0, 0x1, '31635'),
(29364, 0, 0x0, 0x1, '54351 54341'),
(29365, 0, 0x0, 0x1, '54351 54342'),
(31518, 0, 0x0, 0x1, '54351 54341'),
(31519, 0, 0x0, 0x1, '54351 59747');

DELETE FROM `creature_text` WHERE `entry` IN (30658, 32204, 29271);
DELETE FROM `creature_text` WHERE `entry`=29313 AND `groupid`=7;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(30658, 0, 0, 'Prison guards, we are leaving! These adventurers are taking over! Go go go!', 14, 0, 100, 5, 0, 0, 31474, 3, 'Lieutenant Sinclari - Intro 1'),
(30658, 1, 0, 'I''m locking the door. Good luck, and thank you for doing this.', 12, 0, 100, 396, 0, 0, 31475, 3, 'Lieutenant Sinclari - Intro 2'),
(30658, 2, 0, 'You did it! You held the Blue Dragonflight back and defeated their commander. Amazing work!', 12, 0, 100, 396, 0, 0, 31694, 3, 'Lieutenant Sinclari - Outro'),

(32204, 0, 0, 'An elite Blue Dragonflight squad appears from the portal!', 41, 0, 100, 0, 0, 0, 32994, 3, 'Lieutenant Sinclari - Blue Dragonflight squad'),
(32204, 1, 0, 'A Portal Guardian defends the new portal!', 41, 0, 100, 0, 0, 0, 32995, 3, 'Lieutenant Sinclari - Portal Guardian'),
(32204, 2, 0, 'A Portal Keeper emerges from the portal!', 41, 0, 100, 0, 0, 0, 32996, 3, 'Lieutenant Sinclari - Portal Keeper'),
(32204, 3, 0, 'Adventurers, the door is beginning to weaken!', 14, 0, 100, 0, 0, 0, 32557, 3, 'Lieutenant Sinclari - Door weaken'),
(32204, 4, 0, 'Only half of the door seal''s strength remains! You must fight on!', 14, 0, 100, 0, 0, 0, 32558, 3, 'Lieutenant Sinclari - Half Door Seal reains'),
(32204, 5, 0, 'The door seal is about to collapse! All is lost if the Blue Dragonflight breaks through the door!', 14, 0, 100, 0, 0, 0, 32559, 3, 'Lieutenant Sinclari - Door Seal broken'),

(29313, 7, 0, '%s''s Protective Bubble shatters!', 41, 0, 100, 0, 0, 0, 30086, 0, 'Ichoron - Emote Shatter'),

(29271, 0, 0, '%s begins to summon!', 41, 0, 100, 0, 0, 0, 30087, 3, 'Ethereal Sphere');

UPDATE `creature_text` SET `sound`=14499 WHERE `entry`=29266 AND `groupid`=0;
UPDATE `creature_text` SET `emote`=396 WHERE `entry`=29266 AND `groupid`=3;
UPDATE `creature_text` SET `emote`=15 WHERE `entry`=29315 AND `groupid`=3;
UPDATE `creature_text` SET `emote`=396 WHERE `entry`=31134 AND `groupid`=3;

DELETE FROM `spell_target_position` WHERE `ID` IN (54102, 54137, 54138, 61337, 61338, 61339, 62139);
INSERT INTO `spell_target_position` (`ID`, `EffectIndex`, `MapID`, `PositionX`, `PositionY`, `PositionZ`, `VerifiedBuild`) VALUES
(54102, 0, 608, 1854.36, 802.65, 44.3,  12340),
(54137, 0, 608, 1899.18, 824.7,  38.72333, 12340),
(54138, 0, 608, 1891.42, 788.04, 38.64, 12340),
(61337, 0, 608, 1854.36, 802.65, 44.3,  12340),
(61338, 0, 608, 1899.18, 824.7,  38.72333, 12340),
(61339, 0, 608, 1891.42, 788.04, 38.64, 12340),
(62139, 0, 608, 1857.24, 803.877, 44.0085, 12340);

-- 3.3.5 only
DELETE FROM `spelldifficulty_dbc` WHERE `spellid0` IN (54102, 54137, 54138, 54207, 54438, 54442);
INSERT INTO `spelldifficulty_dbc` (`id`, `spellid0`, `spellid1`) VALUES
(54207, 54207, 59476),
(54438, 54438, 59523),
(54442, 54442, 59524);
 
 
/* 
* sql\updates\world\2015_08_25_00_world.sql 
*/ 
--
UPDATE `creature_template` SET `unit_flags` = 33554432 WHERE `entry` = 34098; 
 
 
/* 
* sql\updates\world\2015_08_25_01_world.sql 
*/ 
-- Achievement The Culling of Time
DELETE FROM `disables` WHERE `entry`=7494 AND `sourceType`=4;
 
 
/* 
* sql\updates\world\2015_08_26_00_world.sql 
*/ 
DELETE FROM `trinity_string` WHERE `entry` = 364;
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES (364, 'Taxinodes: %s.');
 
 
/* 
* sql\updates\world\2015_08_26_01_world.sql 
*/ 
UPDATE `game_event_battleground_holiday` SET `bgflag` = 1073741824 WHERE `eventEntry` = 54 ;
 
 
/* 
* sql\updates\world\2015_08_27_00_world.sql 
*/ 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 36450;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`,`ConditionValue2`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 3, 36450, 0, 0, 31, 0, 3, 20060, 0, 0, 0, '', 'Kael\'thas Ressurection hit only Lord Sanguinar'),
(13, 3, 36450, 0, 1, 31, 0, 3, 20062, 0, 0, 0, '', 'Kael\'thas Ressurection hit only Grand Astromancer Capernian'),
(13, 3, 36450, 0, 2, 31, 0, 3, 20063, 0, 0, 0, '', 'Kael\'thas Ressurection hit only Master Engineer Telonicus'),
(13, 3, 36450, 0, 3, 31, 0, 3, 20064, 0, 0, 0, '', 'Kael\'thas Ressurection hit only Thaladred the Darkener');
 
 
/* 
* sql\updates\world\2015_08_29_00_world.sql 
*/ 
--
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (32682, 27932);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (32682, 27932) AND `source_type`=0;
UPDATE `creature_template` SET `InhabitType`=4, `speed_run`=2.5 WHERE `entry` IN (32682, 27932);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(32682, 0, 0, 0, 27, 0, 100, 1, 0, 0, 0, 0, 53, 1, 32682, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,0,'Harry''s Bomber- On passeger rided - Start wp'),
(27932, 0, 0, 0, 27, 0, 100, 1, 0, 0, 0, 0, 53, 1, 27932, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,0,'Harry''s Bomber- On passeger rided - Start wp'),
(32682, 0, 1, 0, 58, 0, 100, 1, 9, 32682, 0, 0, 11, 50630, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,0,'Harry''s Bomber- On waypoint ended - Eject passengers'),
(27932, 0, 1, 0, 58, 0, 100, 1, 9, 27932, 0, 0, 11, 50630, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,0,'Harry''s Bomber- On passeger ended - Eject passengers');

UPDATE `smart_scripts` SET `action_type`=85 WHERE `entryorguid`=28277 AND `source_type`=0 AND `id`=0;
DELETE FROM `waypoints` WHERE `entry` IN (32682, 27932);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(32682, 1, 61.83957, -6228.992, 19.07242, 'Harry''s Bomber'),
(32682, 2, -64.6518, -5908.95, 29.8502, 'Harry''s Bomber'),
(32682, 3, -158.0859, -5631.193, 29.8502, 'Harry''s Bomber'),
(32682, 4, -436.5865, -5223.862, 32.1002, 'Harry''s Bomber'),
(32682, 5, -412.989, -5012.779, 45.7391, 'Harry''s Bomber'),
(32682, 6, -75.09814, -4341.288, 64.29379, 'Harry''s Bomber'),
(32682, 7, -51.86116, -4023.003, 70.12712, 'Harry''s Bomber'),
(32682, 8, -136.1673, -3716.832, 59.96046, 'Harry''s Bomber'),
(32682, 9, -170.8945, -3578.378, 4.988236, 'Harry''s Bomber'),
(27932, 1, -136.1673, -3716.832, 59.96046, 'Harry''s Bomber'),
(27932, 2, -51.86116, -4023.003, 70.12712, 'Harry''s Bomber'),
(27932, 3, -75.09814, -4341.288, 64.29379, 'Harry''s Bomber'),
(27932, 4, -412.989, -5012.779, 45.7391, 'Harry''s Bomber'),
(27932, 5, -436.5865, -5223.862, 32.1002, 'Harry''s Bomber'),
(27932, 6, -158.0859, -5631.193, 29.8502, 'Harry''s Bomber'),
(27932, 7, -64.6518, -5908.95, 29.8502, 'Harry''s Bomber'),
(27932, 8, 61.83957, -6228.992, 19.07242, 'Harry''s Bomber'),
(27932, 9, 89.63259, -6287.430, -0.739605, 'Harry''s Bomber');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=10218;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`Scriptname`,`Comment`) VALUES
(15,10218,0,0,0,23,0,495,0,0,0,0 ,'' , 'Harry''s Bomber - Show gossip option if the npc is in the area 495'),
(15,10218,0,0,0,9,0,11567,0,0,0,0 ,'' , 'Harry''s Bomber - Show gossip option if player has taken quest 11567'),
(15,10218,0,0,1,28,0,11567,0,0,0,0 ,'' , 'Harry''s Bomber - Show gossip option if player has quest 11567 completed');
 
 
