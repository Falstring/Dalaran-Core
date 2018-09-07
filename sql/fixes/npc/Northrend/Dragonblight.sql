-- -------------------------------------------
-- DRAGONBLIGHT
-- -------------------------------------------

-- Quartermaster Bartlett -- http://www.wowhead.com/npc=27267/quartermaster-bartlett
-- Adding repair Gossip option

UPDATE `creature_template` SET `gossip_menu_id`=9487 WHERE `entry`=27267;

DELETE FROM `gossip_menu` WHERE `entry`=9487 AND `text_id`=12759;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(9487,12759);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=9487 AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9487,0,1,'Let me browse your goods.',3,128,0,0,0,0,'');


-- Respawn all spawns for: -- Risen Wintergarde Defender http://www.wowhead.com/npc=27284/risen-wintergarde-defender
--                         -- Risen Wintergarde Miner http://www.wowhead.com/npc=27401/risen-wintergarde-miner
-- Adding SAI, Pathing for both and emote to the Miners

SET @CGUID:=132940;
DELETE FROM `creature` WHERE `id` IN (27284,27401);
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+31;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `curhealth`) VALUES 
(@CGUID+0 , 27284, 571, 3970.129, -831.1373, 123.1972, 1.419617, 120, 10, 0),
(@CGUID+1 , 27284, 571, 3892.15, -898.545, 116.7031, 4.747295, 120, 0, 0), -- idle no waypoints
(@CGUID+2 , 27284, 571, 3877.338, -886.6799, 119.6563, 5.410521, 120, 0, 0), -- idle no waitpoints
(@CGUID+3 , 27284, 571, 3981.821, -915.338, 103.8165, 0.4941546, 120, 10, 0), 
(@CGUID+4 , 27284, 571, 4063.601, -863.5172, 112.0916, 3.294994, 120, 10, 0), 
(@CGUID+5 , 27284, 571, 4029.796, -817.8798, 122.6137, 5.148721, 120, 10, 0), 
(@CGUID+6 , 27284, 571, 4020.966, -913.8099, 107.1895, 1.902651, 120, 0, 0), 
(@CGUID+7 , 27401, 571, 4012.309, -778.3416, 119.4081, 5.117236, 120, 10, 0), 
(@CGUID+8 , 27401, 571, 3957.39, -879.4473, 120.6337, 1.665177, 120, 10, 0),
(@CGUID+9 , 27401, 571, 3979.763, -878.6928, 118.7674, 2.167667, 120, 0, 0),
(@CGUID+10, 27401, 571, 3891.449, -871.9622, 110.0855, 4.131083, 120, 10, 0),
(@CGUID+11, 27401, 571, 3908.99, -867.735, 108.25, 0.07704493, 120, 0, 0),
(@CGUID+12, 27401, 571, 4005.749, -911.3463, 107.528, 3.572126, 120, 10, 0),
(@CGUID+13, 27401, 571, 4018.18, -838.5659, 120.1189, 3.396627, 120, 10, 0),
(@CGUID+14, 27401, 571, 3997.235, -935.1, 104.7279, 0.895307, 120, 10, 0),
(@CGUID+15, 27401, 571, 4046.337, -872.1385, 115.5023, 2.777797, 120, 10, 0),
(@CGUID+16, 27401, 571, 4040.803, -824.1927, 119.995, 3.689994, 120, 10, 0), 
(@CGUID+17, 27401, 571, 4079.794, -860.7454, 111.5424, 3.844261, 120, 10, 0), 
(@CGUID+18, 27401, 571, 4112.891, -862.1273, 114.5041, 5.726786, 120, 0, 0),
(@CGUID+19, 27401, 571, 3962.095, -841.9584, 121.1146, 1.314913, 120, 10, 0), 
(@CGUID+20, 27401, 571, 3972.828, -817.3924, 124.1117, 1.684451, 120, 10, 0), 
(@CGUID+21, 27401, 571, 3927.054, -862.1707, 121.9197, 5.969274, 120, 10, 0), 
(@CGUID+22, 27401, 571, 3983.165, -884.7412, 117.6653, 3.801475, 120, 10, 0), 
(@CGUID+23, 27401, 571, 4000.266, -806.4115, 124.4378, 2.8901, 120, 10, 0), 
(@CGUID+24, 27401, 571, 3995.780, -802.8200, 123.5410, 4.96206, 120, 10, 0),
(@CGUID+25, 27401, 571, 4029.540, -842.3110, 117.1140, 5.81106, 120, 10, 0), 
(@CGUID+26, 27401, 571, 4063.478, -903.8126, 115.2312, 3.785855, 120, 10, 0), 
(@CGUID+27, 27401, 571, 3971.025, -913.7602, 104.5964, 1.58825, 120, 0, 0), 
(@CGUID+28, 27401, 571, 3992.506, -939.1702, 105.5502, 4.213991, 120, 0, 0), 
(@CGUID+29, 27401, 571, 3930.066, -870.2675, 104.4508, 0.4872836, 120, 10, 0), 
(@CGUID+30, 27401, 571, 3961.272, -872.5833, 104.2002, 2.95032, 120, 0, 0),
(@CGUID+31, 27401, 571, 3912.686, -865.0364, 120.8479, 6.199958, 120, 0, 0); 
UPDATE `creature` SET `MovementType`='1' WHERE `guid` IN (@CGUID+17, @CGUID+25, @CGUID+28, @CGUID+30);


-- Risen Wintergarde Defender SAI -- http://www.wowhead.com/npc=27284/risen-wintergarde-defender
SET @ENTRY := 27284;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `creature_template` SET `spell1`='51307' WHERE  `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,40000,60000,11,51307,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Defender - IC - Self cast Unwavering Will (No Repeat)');

-- Risen Wintergarde Miner SAI  -- http://www.wowhead.com/npc=27401/risen-wintergarde-miner
SET @ENTRY := 27401;
SET @CGUID := -132940;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `creature_template` SET `spell1`='48374' WHERE  `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`IN (@ENTRY, @CGUID-8, @CGUID-9, @CGUID-10, @CGUID-11, @CGUID-12, @CGUID-13, @CGUID-14, @CGUID-18, @CGUID-23, @CGUID-24) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-8,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-8,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-9,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-9,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-10,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-10,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-11,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-11,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-12,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-12,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-13,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-13,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-14,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-14,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-18,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-18,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-23,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-23,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound'),
(@CGUID-24,0,0,0,1,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,'Risen Wintergarde Miner - OOC - Emote Mining'),
(@CGUID-24,0,1,0,0,0,100,0,0,1000,7000,9000,11,48374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Risen Wintergarde Miner - IC - Cast Puncture Wound');

-- Pathing for Risen Wintergarde Defender 1
SET @NPC := 132940;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3962.255,`position_y`=-845.7626,`position_z`=120.7226 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3962.255,-845.7626,120.7226,0,0,0,0,100,0), 
(@PATH,2,3964.674,-842.7882,121.4607,0,0,0,0,100,0), 
(@PATH,3,3967.174,-837.5382,122.2107,0,0,0,0,100,0), 
(@PATH,4,3971.408,-823.0021,124.1822,0,0,0,0,100,0), 
(@PATH,5,3972.536,-818.4142,124.181,0,0,0,0,100,0), 
(@PATH,6,3974.286,-811.9142,124.181,0,0,0,0,100,0), 
(@PATH,7,3977.374,-807.4382,123.8934,0,0,0,0,100,0), 
(@PATH,8,3990.374,-797.4382,122.8934,0,0,0,0,100,0), 
(@PATH,9,3996.358,-796.3887,122.3552,0,0,0,0,100,0), 
(@PATH,10,4002.608,-795.8887,121.8552,0,0,0,0,100,0),
(@PATH,11,4005.141,-794.809,121.2954,0,0,0,0,100,0),
(@PATH,12,3991.292,-796.7651,122.3158,0,0,0,0,100,0),
(@PATH,13,3989.065,-798.5057,122.8027,0,0,0,0,100,0),
(@PATH,14,3977.315,-807.5057,123.8027,0,0,0,0,100,0),
(@PATH,15,3973.799,-814.1797,124.0833,0,0,0,0,100,0),
(@PATH,16,3972.049,-819.9297,124.0833,0,0,0,0,100,0),
(@PATH,17,3971.736,-820.819,124.0339,0,0,0,0,100,0),
(@PATH,18,3970.236,-831.069,123.5339,0,0,0,0,100,0),
(@PATH,19,3967.212,-837.6317,122.1643,0,0,0,0,100,0),
(@PATH,20,3964.712,-842.6317,121.4143,0,0,0,0,100,0),
(@PATH,21,3955.197,-848.4968,121.6359,0,0,0,0,100,0),
(@PATH,22,3950.197,-850.4968,122.3859,0,0,0,0,100,0),
(@PATH,23,3946.476,-852.2645,122.539,0,0,0,0,100,0),
(@PATH,24,3938.226,-855.0145,122.289,0,0,0,0,100,0),
(@PATH,25,3935.217,-855.6635,122.2252,0,0,0,0,100,0),
(@PATH,26,3928.967,-856.4135,121.7252,0,0,0,0,100,0),
(@PATH,27,3935.146,-855.8206,122.0987,0,0,0,0,100,0),
(@PATH,28,3938.241,-854.9574,122.219,0,0,0,0,100,0),
(@PATH,29,3946.491,-852.2074,122.719,0,0,0,0,100,0),
(@PATH,30,3954.914,-848.747,121.6653,0,0,0,0,100,0);

-- Pathing for Risen Wintergarde Defender 4
SET @NPC := 132943;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3954.649,`position_y`=-896.4279,`position_z`=104.172 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3954.649,-896.4279,104.172,0,0,0,0,100,0),
(@PATH,2,3956.389,-893.2208,104.3171,0,0,0,0,100,0),
(@PATH,3,3950.639,-880.2208,104.8171,0,0,0,0,100,0),
(@PATH,4,3948.071,-877.5638,104.6277,0,0,0,0,100,0),
(@PATH,5,3934.321,-870.3138,103.8777,0,0,0,0,100,0),
(@PATH,6,3933.527,-870.0614,103.9755,0,0,0,0,100,0),
(@PATH,7,3922.027,-870.3114,105.9755,0,0,0,0,100,0),
(@PATH,8,3917.903,-870.4968,106.363,0,0,0,0,100,0),
(@PATH,9,3905.903,-870.4968,108.363,0,0,0,0,100,0),
(@PATH,10,3897.389,-869.1989,109.0091,0,0,0,0,100,0),
(@PATH,11,3895.139,-868.6989,109.0091,0,0,0,0,100,0),
(@PATH,12,3893.163,-868.3932,109.3621,0,0,0,0,100,0),
(@PATH,13,3903.502,-871.1569,108.7203,0,0,0,0,100,0),
(@PATH,14,3918.319,-872.118,105.7782,0,0,0,0,100,0),
(@PATH,15,3935.749,-871.7728,103.4062,0,0,0,0,100,0),
(@PATH,16,3937.464,-872.5975,104.0017,0,0,0,0,100,0),
(@PATH,17,3946.714,-877.3475,104.5017,0,0,0,0,100,0),
(@PATH,18,3953.698,-875.124,104.5628,0,0,0,0,100,0),
(@PATH,19,3959.198,-868.874,104.0628,0,0,0,0,100,0),
(@PATH,20,3964.888,-870.4577,104.2536,0,0,0,0,100,0),
(@PATH,21,3960.319,-875.5621,104.8488,0,0,0,0,100,0),
(@PATH,22,3955.069,-879.8121,104.8488,0,0,0,0,100,0),
(@PATH,23,3953.761,-883.5623,104.9101,0,0,0,0,100,0),
(@PATH,24,3954.511,-894.0623,104.4101,0,0,0,0,100,0);

-- Pathing for Risen Wintergarde Defender 5
SET @NPC := 132944;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4070.011,`position_y`=-911.9304,`position_z`=115.397 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4070.011,-911.9304,115.397,0,0,0,0,100,0),
(@PATH,2,4063.844,-904.7043,115.3745,0,0,0,0,100,0),
(@PATH,3,4058.64,-895.9709,115.1423,0,0,0,0,100,0),
(@PATH,4,4057.89,-894.7209,115.1423,0,0,0,0,100,0),
(@PATH,5,4055.97,-891.5008,115.2825,0,0,0,0,100,0),
(@PATH,6,4052.97,-881.5008,114.5325,0,0,0,0,100,0),
(@PATH,7,4052.165,-878.6388,114.2091,0,0,0,0,100,0),
(@PATH,8,4051.415,-864.6388,113.4591,0,0,0,0,100,0),
(@PATH,9,4054.136,-862.9764,112.8409,0,0,0,0,100,0),
(@PATH,10,4066.636,-860.9764,112.3409,0,0,0,0,100,0),
(@PATH,11,4072.034,-859.8044,112.1062,0,0,0,0,100,0),
(@PATH,12,4086.284,-857.0544,112.1062,0,0,0,0,100,0),
(@PATH,13,4091.908,-853.9102,112.7256,0,0,0,0,100,0),
(@PATH,14,4101.408,-844.1602,113.7256,0,0,0,0,100,0),
(@PATH,15,4105.021,-846.8843,114.2492,0,0,0,0,100,0),
(@PATH,16,4106.521,-848.6343,114.2492,0,0,0,0,100,0),
(@PATH,17,4109.933,-852.9023,114.737,0,0,0,0,100,0),
(@PATH,18,4111.266,-854.6176,115.0273,0,0,0,0,100,0),
(@PATH,19,4108.093,-862.4123,113.6716,0,0,0,0,100,0),
(@PATH,20,4093.593,-861.4123,113.6716,0,0,0,0,100,0),
(@PATH,21,4087.883,-860.7225,112.5768,0,0,0,0,100,0),
(@PATH,22,4084.479,-860.3036,112.2872,0,0,0,0,100,0),
(@PATH,23,4063.229,-863.3036,112.5372,0,0,0,0,100,0),
(@PATH,24,4059.42,-867.1846,112.8684,0,0,0,0,100,0),
(@PATH,25,4058.17,-873.9346,113.6184,0,0,0,0,100,0),
(@PATH,26,4058.563,-877.7594,113.9066,0,0,0,0,100,0),
(@PATH,27,4060.313,-890.0094,114.1566,0,0,0,0,100,0),
(@PATH,28,4065.274,-896.5776,114.7585,0,0,0,0,100,0),
(@PATH,29,4071.021,-903.6585,115.7979,0,0,0,0,100,0),
(@PATH,30,4073.021,-911.4085,115.0479,0,0,0,0,100,0);


-- Pathing for Risen Wintergarde Defender 6
SET @NPC := 132945;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4008.271,`position_y`=-870.0803,`position_z`=117.5745 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4008.271,-870.0803,117.5745,0,0,0,0,100,0),
(@PATH,2,3996.876,-880.48,118.3026,0,0,0,0,100,0),
(@PATH,3,3991.834,-882.1507,118.5546,0,0,0,0,100,0),
(@PATH,4,3961.252,-886.0806,119.2003,0,0,0,0,100,0),
(@PATH,5,3958.834,-887.8701,119.2766,0,0,0,0,100,0),
(@PATH,6,3958.712,-888.809,119.2599,0,0,0,0,100,0),
(@PATH,7,3983.712,-886.309,118.0099,0,0,0,0,100,0),
(@PATH,8,3990.516,-884.9421,118.4627,0,0,0,0,100,0),
(@PATH,9,4001.527,-882.609,118.6914,0,0,0,0,100,0),
(@PATH,10,4009.196,-881.325,118.3849,0,0,0,0,100,0),
(@PATH,11,4017.301,-863.9352,116.9195,0,0,0,0,100,0),
(@PATH,12,4023.301,-849.1852,116.9195,0,0,0,0,100,0),
(@PATH,13,4025.668,-847.6936,116.7459,0,0,0,0,100,0),
(@PATH,14,4036.918,-842.1936,116.7459,0,0,0,0,100,0),
(@PATH,15,4041.683,-837.2839,117.6779,0,0,0,0,100,0),
(@PATH,16,4031.176,-820.0336,121.8801,0,0,0,0,100,0),
(@PATH,17,4027.651,-834.1048,118.0815,0,0,0,0,100,0),
(@PATH,18,4023.714,-843.688,117.5524,0,0,0,0,100,0),
(@PATH,19,4020.757,-848.9363,117.5502,0,0,0,0,100,0),
(@PATH,20,4010.505,-867.1548,117.3328,0,0,0,0,100,0);

-- Pathing for Risen Wintergarde Defender 7
SET @NPC := 132946;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3998.09,`position_y`=-941.3831,`position_z`=105.5378 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3998.09,-941.3831,105.5378,0,0,0,0,100,0),
(@PATH,2,3982.87,-921.863,104.2338,0,0,0,0,100,0),
(@PATH,3,3980.532,-918.3081,104.4937,0,0,0,0,100,0),
(@PATH,4,3980.812,-915.6993,104.2544,0,0,0,0,100,0),
(@PATH,5,3993.312,-909.1993,106.0044,0,0,0,0,100,0),
(@PATH,6,4001.392,-906.8644,107.0495,0,0,0,0,100,0),
(@PATH,7,4005.606,-907.3997,107.3568,0,0,0,0,100,0),
(@PATH,8,4018.356,-914.8997,106.8568,0,0,0,0,100,0),
(@PATH,9,4019.2,-915.515,107.0822,0,0,0,0,100,0),
(@PATH,10,4016.712,-901.4606,107.2446,0,0,0,0,100,0),
(@PATH,11,4006.091,-900.8485,107.6517,0,0,0,0,100,0),
(@PATH,12,3999.341,-903.3485,107.4017,0,0,0,0,100,0),
(@PATH,13,3990.741,-907.1246,106.0392,0,0,0,0,100,0),
(@PATH,14,3981.241,-911.3746,104.0392,0,0,0,0,100,0),
(@PATH,15,3998.09,-941.3831,105.5378,0,0,0,0,100,0);

-- Frigid Ghoul Attacker
UPDATE creature_template SET flags_extra=64 WHERE  entry=27685;


-- Corrupted Rager
SET @CORRUPTER_RAGER := 21223;

UPDATE creature_template SET InhabitType=3 WHERE entry=@CORRUPTER_RAGER;
DELETE FROM `creature_loot_template` WHERE `Entry`=@CORRUPTER_RAGER AND `item`=37705;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
    (@CORRUPTER_RAGER, 37705, 0, 40, 0, 1, 0, 2, 4, NULL);

INSERT INTO creature_loot_template (Entry,`Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
SELECT (@CORRUPTER_RAGER) AS Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment FROM creature_loot_template AS clt2
WHERE clt2.Entry=24228 AND clt2.Item NOT IN(SELECT clt3.Item From creature_loot_template AS clt3 WHERE clt3.Entry=@CORRUPTER_RAGER);

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@CORRUPTER_RAGER;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@CORRUPTER_RAGER AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@CORRUPTER_RAGER,0,0,0,0,0,100,0,2000,8000,45000,50000,11,51613,65,0,0,0,0,2,0,0,0,0,0,0,0,"Corrupted Rager - In Combat - Cast 'Corrode Armor'");
 

-- Inquisitor Hallard SAI
SET @ENTRY := 27316;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,2,0,64,0,100,0,0,0,0,0,54,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Inquisitor Hallard - On Gossip Hello - Pause Waypoint");


-- Kilix the Unraveler and Azjol-anak Battleguards

UPDATE creature_template SET flags_extra=2, unit_flags=33536 WHERE entry IN(26653, 26662);


-- Rabid Grizzly and Blighted Elk

DELETE FROM creature WHERE guid IN(97981, 119442, 97955, 97973, 119466, 119430, 97948, 119436, 119494, 97976, 97946, 97947, 97950, 119431, 119475, 119441, 97974, 119496, 119462, 119461, 97969, 97959, 97958, 119497, 119455, 97971, 119493, 119433, 97951, 119439, 119439, 97965, 97964, 119468, 97963, 119465, 97952, 119432) AND id IN(26643, 26616);


-- Fordragon Battle Steed

DELETE FROM `creature` WHERE id=27535;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=27761;
DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (27761);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, seat_id, `minion`, `description`, `summontype`, summontimer)
VALUES
    (27761, 27535, 0, 1, "Fordragon Battle Steed", 7, 0);
    
-- Anub'ar Blightbeast
DELETE FROM `creature_addon` WHERE `guid` IN (
118459,
118460,
118461,
118462,
118463,
118464,
118465,
118466,
118467,
118468,
118469,
118470,
118471,
118472,
118473,
118474,
118475,
118476,
118477,
118478,
118479,
118480,
118481,
118482,
118483,
118484,
118485,
118486,
118487,
118488,
118489,
118490,
118494,
118495,
118496,
131831,
131832,
131833,
131834,
131835,
131836,
131837);

DELETE FROM `creature_template_addon` WHERE `entry`=26607;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(26607, 0, 0, 50331648, 1, 0, NULL);

-- Abbey Bell Rope SAI
SET @ENTRY := 188713;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,1,70,0,100,0,2,0,0,0,45,1,1,0,0,0,0,10,105877,27245,0,0,0,0,0,"Abbey Bell Rope - On Gameobject State Changed - Set Data 1 1"),
(@ENTRY,1,1,2,61,0,100,0,2,0,0,0,85,48753,0,0,0,0,0,7,0,0,0,0,0,0,0,"Abbey Bell Rope - On Gameobject State Changed - Invoker Cast 'A Fall from Grace: Bell Rung Dummy Aura'"),
(@ENTRY,1,2,0,61,0,100,0,2,0,0,0,45,10,10,0,0,0,0,19,27202,10,0,0,0,0,0,"Abbey Bell Rope - On Gameobject State Changed - Set Data 10 10");

DELETE FROM `creature_text` WHERE `entry` = 27202 AND `groupid` = 3;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES 
(27202, 3, 0, 'Gah! What are you doing?', 12, 0, 100, 5, 0, 7256, 'Onslaught Raven Priest', 26637);

-- Onslaught Raven Priest SAI
SET @ENTRY := 27202;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=16;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,16,0,38,0,100,0,10,10,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Raven Priest - On Data Set 10 10 - Say Line 3");

-- Commander Jordan delete an extra spawn.
DELETE FROM `creature` WHERE `guid`= 105029;
DELETE FROM `creature_addon` WHERE `guid`= 105029;

-- Goramosh SAI
SET @ENTRY := 26349;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,113473,26298,0,0,0,0,0,"Goramosh - Out of Combat - Cast 'Surge Needle Beam' (No Repeat)"),
(@ENTRY,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,113473,26298,0,0,0,0,0,"Goramosh - On Reached Home - Cast 'Surge Needle Beam'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,20828,0,0,0,0,0,2,0,0,0,0,0,0,0,"Goramosh - Between 0-50% Health - Cast 'Cone of Cold' (No Repeat)"),
(@ENTRY,0,3,0,0,0,100,0,3500,3500,6000,8000,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,"Goramosh - In Combat - Cast 'Frostbolt'"),
(@ENTRY,0,4,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Goramosh - On Aggro - Say Line 0");

DELETE FROM `creature_text` WHERE `Entry` IN (26349, 26496);
INSERT INTO `creature_text` (`Entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(26349,0,0,'You\'re too late! The accord has been negotiated. Only the details remain. Small details... like you!',12,0,100,0,0,0,0,0,'Goramosh'),
(26496,0,0,'What\'s this, more delays?',12,0,100,0,0,0,0,0,'Wind Trader Mu\'fah');

-- Wind Trader Mu'fah SAI
SET @ENTRY := 26496;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,20,6000,8000,11,51817,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wind Trader Mu'fah - Within 0-20 Range - Cast 'Typhoon'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Mu'fah - On Aggro - Say Line 0");

-- Remove the experience for Wretched Ghould for the quest "The Sacred and the Corrupt"
UPDATE `creature_template` SET `flags_extra`=64 WHERE `entry`=37881;