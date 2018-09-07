-- Wind Rider Cub (49663)
REPLACE INTO creature_template_addon VALUES(36909, 0, 0, 0, 0, 0, '');
UPDATE creature_template SET InhabitType=5, AIName='', ScriptName='npc_pet_gen_wind_rider_cub_gryphon_hatch' WHERE entry=36909;

-- Gryphon Hatchling (36908)
REPLACE INTO creature_template_addon VALUES(36908, 0, 0, 0, 0, 0, '');
UPDATE creature_template SET InhabitType=5, AIName='', ScriptName='npc_pet_gen_wind_rider_cub_gryphon_hatch' WHERE entry=36908;

-- Turkey Cage (44810)
REPLACE INTO creature_text VALUES(32818, 0, 0, '%s senses his destiny!', 16, 0, 100, 0, 0, 0, 0, 0, 'Plump Turkey');
UPDATE creature_template SET AIName='', ScriptName='npc_pet_gen_plump_turkey' WHERE entry=32818;

-- Lil' XT (54847)
REPLACE INTO creature_text VALUES(40703, 0, 0, "I'm ready to play!", 12, 0, 100, 0, 0, 15726, 0, 0,'Lil XT');
REPLACE INTO creature_text VALUES(40703, 1, 0, "So tired... I'll rest for just a moment...", 12, 0, 100, 0, 0, 15725, 0, 0, 'Lil XT');
REPLACE INTO creature_text VALUES(40703, 2, 0, "I guess it doesn't bend that way!", 12, 0, 100, 0, 0, 15729, 0, 0, 'Lil XT');
REPLACE INTO creature_text VALUES(40703, 2, 1, "I think I broke it...", 12, 0, 100, 0, 0, 15728, 0, 0, 'Lil XT');
REPLACE INTO creature_text VALUES(40703, 3, 0, "New toys? For me?", 12, 0, 100, 0, 0, 15724, 0, 0, 'Lil XT');
REPLACE INTO creature_template_addon VALUES(40703, 0, 0, 0, 0, 0, '76099');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=40703;
DELETE FROM smart_scripts WHERE entryorguid=40703 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=40703*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (40703, 0, 0, 1, 25, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Talk');
INSERT INTO smart_scripts VALUES (40703, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set Phase');
INSERT INTO smart_scripts VALUES (40703, 0, 2, 3, 60, 1, 100, 0, 35000, 45000, 120000, 120000, 11, 76116, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Cast Spell Sleep');
INSERT INTO smart_scripts VALUES (40703, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 'On Update - Talk');
INSERT INTO smart_scripts VALUES (40703, 0, 4, 0, 60, 1, 100, 0, 100000, 105000, 120000, 120000, 11, 76114, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Cast Spell Dance');
INSERT INTO smart_scripts VALUES (40703, 0, 5, 0, 60, 0, 100, 0, 5000, 5000, 30000, 30000, 80, 40703*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Script9');

INSERT INTO smart_scripts VALUES (40703*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Phase');
INSERT INTO smart_scripts VALUES (40703*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Talk');
INSERT INTO smart_scripts VALUES (40703*100, 9, 2, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 97, 10, 10, 1, 0, 0, 0, 20, 193963, 15, 0, 0, 0, 0, 0, 'Script9 - Jump To Target');
INSERT INTO smart_scripts VALUES (40703*100, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 11, 76092, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Spell');
INSERT INTO smart_scripts VALUES (40703*100, 9, 4, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Phase');
INSERT INTO smart_scripts VALUES (40703*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 29, 1, 1.57, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Follow');
INSERT INTO smart_scripts VALUES (40703*100, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Talk');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry=76098;
INSERT INTO conditions VALUES(13, 1, 76098, 0, 0, 31, 0, 3, 32345, 0, 0, 0, 0, "", "Lil' XT find Grindgear Toy Gorilla");
INSERT INTO conditions VALUES(13, 1, 76098, 0, 1, 31, 0, 3, 17299, 0, 0, 0, 0, "", "Lil' XT find Crashin Trashin Robot");
INSERT INTO conditions VALUES(13, 1, 76098, 0, 2, 31, 0, 3, 27664, 0, 0, 0, 0, "", "Lil' XT find Crashin Trashin Racer");
INSERT INTO conditions VALUES(13, 1, 76098, 0, 3, 31, 0, 3, 40281, 0, 0, 0, 0, "", "Lil' XT find Crashin Trashin Racer Blue");
INSERT INTO conditions VALUES(13, 1, 76098, 0, 4, 31, 0, 3, 24968, 0, 0, 0, 0, "", "Lil' XT find Clockwork Rocket Bot");
INSERT INTO conditions VALUES(13, 1, 76098, 0, 5, 31, 0, 3, 40295, 0, 0, 0, 0, "", "Lil' XT find Blue Clockwork Rocket Bot");
INSERT INTO conditions VALUES(13, 1, 76098, 0, 6, 31, 0, 3, 32247, 0, 0, 0, 0, "", "Lil' XT find Zippy Copper Racer");
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry=76092;
INSERT INTO conditions VALUES(13, 1, 76092, 0, 0, 31, 0, 5, 193963, 0, 0, 0, 0, "", "Lil' XT target Toy Train Set");
DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND sourceEntry=40703;
INSERT INTO conditions VALUES(22, 6, 40703, 0, 0, 30, 1, 193963, 10, 0, 0, 0, 0, "", "Run Action if GO Near");
DELETE FROM spell_script_names WHERE spell_id IN(76098, 76096);
INSERT INTO spell_script_names VALUES(76096, "spell_item_lil_xt");
INSERT INTO spell_script_names VALUES(76098, "spell_item_lil_xt");


-- Lil' Phylactery (49693)
REPLACE INTO creature_template_addon VALUES(36979, 0, 0, 0, 0, 0, '69683');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry=69682;
INSERT INTO conditions VALUES(13, 1, 69682, 0, 0, 31, 0, 3, 0, 0, 0, 0, 0, "", "Lil' K.T find target");
DELETE FROM spell_script_names WHERE spell_id IN(69682);
INSERT INTO spell_script_names VALUES(69682, "spell_item_sleepy_willy");
DELETE FROM spell_script_names WHERE spell_id IN(69732);
INSERT INTO spell_script_names VALUES(69732, "spell_item_lil_phylactery");
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=36979;
DELETE FROM smart_scripts WHERE entryorguid=36979 AND source_type=0;
-- Lil' K.T. SAI
SET @ENTRY := 36979;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,60,0,100,1,0,0,0,0,86,69732,2,23,0,0,0,23,0,0,0,0,0,0,0,"On Update - Cross Cast (Never Repeat)"),
(@ENTRY,0,1,0,60,0,100,0,20000,60000,120000,120000,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Update - Play Emote"),
(@ENTRY,0,2,0,5,0,100,0,0,0,0,0,4,16493,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Kill Unit - Play Sound"),
(@ENTRY,0,3,0,8,0,100,0,69731,0,0,0,4,16493,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Spell Hit - Play Sound");

-- Elwynn Lamb (44974)
REPLACE INTO creature_template_addon VALUES (33200, 0, 0, 0, 0, 0, '62703'); -- Lamb With Periodic Summon Aura
UPDATE creature_template SET unit_flags=2, AIName='SmartAI', flags_extra=2, ScriptName='' WHERE entry=33286;
DELETE FROM smart_scripts WHERE entryorguid=33286 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=33286*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (33286, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 19, 33200, 50, 0, 2, 2, 0, 0, 'On Rest - Move Point');
INSERT INTO smart_scripts VALUES (33286, 0, 1, 0, 34, 0, 100, 0, 8, 1, 0, 0, 80, 33286*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Movement Inform - Script9');
INSERT INTO smart_scripts VALUES (33286, 0, 2, 0, 31, 0, 100, 0, 62701, 0, 0, 0, 51, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spellhit Target - Kill Unit');
INSERT INTO smart_scripts VALUES (33286*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, 33200, 10, 0, 0, 0, 0, 0, 'Script9 - Set Facing');
INSERT INTO smart_scripts VALUES (33286*100, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 11, 62701, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Spell');
INSERT INTO smart_scripts VALUES (33286*100, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 11, 46765, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Spell');
INSERT INTO smart_scripts VALUES (33286*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 5500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Despawn');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry=62701;
INSERT INTO conditions VALUES(13, 1, 62701, 0, 0, 31, 0, 3, 33200, 0, 0, 0, 0, "", "Target Closest Elwynn Lamb");

-- Sleepy Willy (32617)
REPLACE INTO creature_template_addon VALUES(23231, 0, 0, 0, 0, 0, '40619');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry=40638;
INSERT INTO conditions VALUES(13, 1, 40638, 0, 0, 31, 0, 3, 0, 0, 0, 0, 0, "", "Sleepy Willy laser");
DELETE FROM spell_script_names WHERE spell_id=40638;
INSERT INTO spell_script_names VALUES(40638, "spell_item_sleepy_willy");

-- Teldrassil Sproutling (44965)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=33188;
DELETE FROM smart_scripts WHERE entryorguid=33188 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(33188*100, 33188*100+1) AND source_type=9;
INSERT INTO smart_scripts VALUES (33188, 0, 0, 0, 60, 0, 40, 0, 30000, 30000, 30000, 30000, 87, 33188*100, 33188*100+1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Update - Random Action List');
INSERT INTO smart_scripts VALUES (33188*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 62504, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Spell Dance');
INSERT INTO smart_scripts VALUES (33188*100, 9, 1, 0, 0, 0, 100, 0, 10000, 25000, 0, 0, 28, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Remove All Auras');
INSERT INTO smart_scripts VALUES (33188*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 62499, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Spell Sleep');
INSERT INTO smart_scripts VALUES (33188*100+1, 9, 1, 0, 0, 0, 100, 0, 10000, 25000, 0, 0, 28, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Remove All Auras');

-- Troll Patrol: Done to Death (12568)
UPDATE creature SET id=28156 WHERE id=28260;
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=51276;
INSERT INTO conditions VALUES (13, 1, 51276, 0, 0, 31, 0, 3, 28156, 0, 0, 0, 0, '', '');
UPDATE creature_template SET AIName="SmartAI" WHERE entry=28156;
DELETE FROM smart_scripts WHERE entryorguid=28156 AND source_type=0;
INSERT INTO smart_scripts VALUES (28156, 0, 0, 1, 8, 0, 100, 0, 51276, 0, 0, 0, 33, 28316, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Kill credit on spell hit");
INSERT INTO smart_scripts VALUES (28156, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 41, 10000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Forced despawn linked");
INSERT INTO smart_scripts VALUES (28156, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 59216, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Cast spell linked");


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


-- Hyldsmeet Drakerider SAI
SET @ENTRY := 29694;
UPDATE `creature_template` SET `AIName`="SmartAI", `ScriptName`="" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,1,0,6,0,100,0,0,0,0,0,33,29800,0,0,0,0,0,21,85,0,0,0,0,0,0,"Hyldsmeet Drakerider - On Death - Kill credit Spell");

-- If he can not be turned. 
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x40000000 WHERE  `entry` IN (29860, 29858, 29859);

-- Deathbringer's Cache, spawn on phasemask 2.
UPDATE `gameobject` SET `phaseMask`=2 WHERE `id` IN (202239, 202240, 202238, 202241);

-- Hyldsmeet Drakerider SAI
UPDATE `creature_template` SET `InhabitType`=4, `ScriptName`="" WHERE `entry`=29694;

-- [A][H]Assault by Ground.
UPDATE `creature_template` SET `ScriptName`='npc_assault_by_ground_squad_leader' WHERE  `entry` IN(31833, 31737);

-- Kor'kron Squad Leader SAI
SET @ENTRY := 31833;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,13301,0,0,0,53,1,31833,0,0,5000,2,7,0,0,0,0,0,0,0,"Kor'kron Squad Leader - On Quest '' Taken - Start Waypoint"),
(@ENTRY,0,1,2,61,0,100,0,13301,0,0,0,45,1,1,0,0,0,0,10,122301,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest '' Taken - Set Data 1 1"),
(@ENTRY,0,2,3,61,0,100,0,13301,0,0,0,45,1,2,0,0,0,0,10,122302,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest '' Taken - Set Data 1 2"),
(@ENTRY,0,3,4,61,0,100,0,13301,0,0,0,45,1,3,0,0,0,0,10,122303,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest '' Taken - Set Data 1 3"),
(@ENTRY,0,4,5,61,0,100,0,13301,0,0,0,45,1,4,0,0,0,0,10,122304,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest '' Taken - Set Data 1 4"),
(@ENTRY,0,5,6,61,0,100,0,13301,0,0,0,45,1,5,0,0,0,0,10,122305,31832,0,0,0,0,0,"Kor'kron Squad Leader - On Quest '' Taken - Set Data 1 5"),
(@ENTRY,0,6,0,61,0,100,0,13301,0,0,0,45,1,6,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Squad Leader - On Quest '' Taken - Set Data 1 6 on self."),
(@ENTRY,0,7,8,40,0,100,0,30,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Squad Leader - On Waypoint 30 Reached - Say Line 1"),
(@ENTRY,0,8,0,61,0,100,0,30,0,0,0,45,1,20,0,0,0,0,11,31832,150,0,0,0,0,0,"Kor'kron Squad Leader - On Waypoint 30 Reached - Set Data 1 20"),
(@ENTRY,0,9,10,40,0,100,0,8,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7421.68,1857.33,412.63,5.9,"Kor'kron Squad Leader - On Waypoint 8 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,10,11,61,0,100,0,8,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7416.69,1851.82,417.24,5.89,"Kor'kron Squad Leader - On Waypoint 8 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,11,12,61,0,100,0,8,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7421.9,1844.2,415.36,0.33,"Kor'kron Squad Leader - On Waypoint 8 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,12,0,61,0,100,0,8,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7426.77,1847.52,410.5,0,"Kor'kron Squad Leader - On Waypoint 8 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,13,0,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,11,31832,50,0,0,0,0,0,"Kor'kron Squad Leader - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,14,0,40,0,100,0,0,0,0,0,45,1,10,0,0,0,0,11,31832,50,0,0,0,0,0,"Kor'kron Squad Leader - On Waypoint 0 Reached - Set Data 1 10"),
(@ENTRY,0,15,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Squad Leader - On Aggro - Say Line 0");


-- Skybreaker Squad Leader SAI
SET @ENTRY := 31737;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,19,0,100,0,13284,0,0,0,53,1,31737,0,0,5000,2,7,0,0,0,0,0,0,0,"Skybreaker Squad Leader - On Quest 'Assault by Ground' Taken - Start Waypoint"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,10,124407,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 1"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,45,1,2,0,0,0,0,10,124408,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 2"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,45,1,3,0,0,0,0,10,124409,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 3"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,45,1,4,0,0,0,0,10,124410,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 4"),
(@ENTRY,0,5,6,61,0,100,0,0,0,0,0,45,1,5,0,0,0,0,10,124411,31701,0,0,0,0,0,"Skybreaker Squad Leader - On Quest Taken - Set Data 1 5"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,45,1,6,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Squad Leader - On Quest '' Taken - Set Data 1 6 on self."),

(@ENTRY,0,7,8,40,0,100,0,42,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Squad Leader - On Waypoint 42 Reached - Say Line 1"),
(@ENTRY,0,8,0,61,0,100,0,0,0,0,0,45,1,20,0,0,0,0,11,31701,150,0,0,0,0,0,"Skybreaker Squad Leader - On Waypoint 0 Reached - Set Data 1 20"),
(@ENTRY,0,9,10,40,0,100,0,14,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7214,1591.2,380.7,6.1,"Skybreaker Squad Leader - On Waypoint 14 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,10,11,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7225.5,1603,379.47,3.8,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,11,12,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7228.9,1597.9,380.28,3.7,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),

(@ENTRY,0,12,0,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7235.4,1599.8,380.97,3.4,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,13,14,40,0,100,0,26,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7352,1654.8,432.78,4.6,"Skybreaker Squad Leader - On Waypoint 26 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,14,15,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7343.97,1656.06,433.3,4.5,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,15,0,61,0,100,0,0,0,0,0,12,31746,4,30000,0,0,0,8,0,0,0,7335.12,1648.5,431.61,5.57,"Skybreaker Squad Leader - On Waypoint 0 Reached - Summon Creature 'Ymirheim Defender'"),
(@ENTRY,0,16,0,6,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,11,31701,50,0,0,0,0,0,"Skybreaker Squad Leader - On Just Died - Despawn In 5000 ms"),
(@ENTRY,0,17,0,40,0,100,0,0,0,0,0,45,1,10,0,0,0,0,11,31701,50,0,0,0,0,0,"Skybreaker Squad Leader - On Waypoint 0 Reached - Set Data 1 10"),
(@ENTRY,0,18,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Squad Leader - On Aggro - Say Line 0"),
(@ENTRY,0,19,0,40,0,100,0,3,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Squad Leader - On Waypoint 3 Reached - Say Line 2");


-- Ymirheim Defender SAI
SET @ENTRY := 31746;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,5000,14000,15000,11,60988,2,0,0,0,0,2,0,0,0,0,0,0,0,"Ymirheim Defender - In Combat - Cast 'Poisoned Spear'");

-- Remove one spawn from a defender.
DELETE FROM `creature` WHERE `guid`=120899 AND `id`=31746;

-- Earthen Oath improvements

UPDATE `quest_template` SET `RequiredNpcOrGo1`=29984 WHERE `id`=13005;
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x40000000 WHERE  `entry` IN (29980, 30270, 29981);

-- Iron Sentinel SAI
SET @ENTRY := 29984;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,6,0,100,0,0,0,0,0,33,29984,0,0,0,0,0,17,0,100,0,0,0,0,0,"Iron Sentinel - On Just Died - Quest Credit ''"),
(@ENTRY,0,1,0,9,0,100,0,0,10,12000,24000,11,56490,2,0,0,0,0,1,0,0,0,0,0,0,0,"Iron Sentinel - Within 0-10 Range - Cast 'Stomp'"),
(@ENTRY,0,2,0,0,0,100,0,0,3000,5000,8000,11,55811,0,0,0,0,0,2,0,0,0,0,0,0,0,"Iron Sentinel - In Combat - Cast 'Throw Boulder'"),
(@ENTRY,0,3,0,9,0,100,0,0,5,5000,7000,11,5568,0,0,0,0,0,1,0,0,0,0,0,0,0,"Iron Sentinel - Within 0-5 Range - Cast 'Trample'");


-- Brann's Communicator drop.
DELETE FROM `conditions` WHERE `sourceentry` = 40971;
INSERT INTO `conditions` VALUES (1, 29695, 40971, 0, 3, 28, 0, 12855, 0, 0, 0, 0, 0, '', 'Item 40971, drop only if have quest');
INSERT INTO `conditions` VALUES (1, 29695, 40971, 0, 2, 28, 0, 12910, 0, 0, 0, 0, 0, '', 'Item 40971, drop only if have quest');
INSERT INTO `conditions` VALUES (1, 29695, 40971, 0, 1, 9, 0, 12855, 0, 0, 0, 0, 0, '', 'Item 40971, drop only if have quest');
INSERT INTO `conditions` VALUES (1, 29695, 40971, 0, 0, 9, 0, 12910, 0, 0, 0, 0, 0, '', 'Item 40971, drop only if have quest');

DELETE FROM `gossip_menu_option` WHERE `menu_id`=9854;
INSERT INTO `gossip_menu_option` VALUES (9854, 1, 0, 'I\'ve lost my Brann\'s Communicator', 0, 1, 1, 0, 0, 0, 0, '', 0, 0);

DELETE FROM `conditions` WHERE `sourcegroup` = 9854 AND `sourcetypeorreferenceid` = 15;
INSERT INTO `conditions` VALUES (15, 9854, 1, 0, 0, 8, 0, 12910, 0, 0, 0, 0, 0, '', 'Must complete 12910 before this option is visible');
INSERT INTO `conditions` VALUES (15, 9854, 1, 0, 0, 2, 0, 40971, 1, 0, 1, 0, 0, '', 'Must not have item 40971');

-- Moteha Windborn SAI
SET @ENTRY := 29937;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,9854,1,0,0,56,40971,1,0,0,0,0,7,0,0,0,0,0,0,0,"On gossip select add item"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"On gossip linked close gossip");

-- Anzu Intro
INSERT IGNORE INTO `creature_text`(`entry`, `groupid`, `text`, `type`, `probability`, `comment`) VALUES (23035, 3, 'No! How can this be?', 14, 100, 'Anzu - Intro 1');
INSERT IGNORE INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `type`, `probability`, `comment`) VALUES (23035, 3, 0, 'Pain will be the price for your insolence! You cannot stop me from claiming the Emerald Dream as my own!', 14, 100, 'Anzu - Intro 2');

-- Anzu Size
UPDATE `creature_template` SET `scale` = 1 WHERE `entry` = 23035;

-- Brood of Anzu (23132)
UPDATE creature_template SET InhabitType=4, AIName='SmartAI', ScriptName='' WHERE entry=23132;
DELETE FROM smart_scripts WHERE entryorguid=23132 AND source_type=0;
INSERT INTO smart_scripts VALUES (23132, 0, 0, 0, 0, 0, 100, 0, 4000, 6000, 10000, 15000, 11, 31273, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Brood of Anzu - In Combat - Cast Screech');

-- Invis Raven God Portal (23046)
UPDATE creature_template SET modelid1=19595, modelid2=0, unit_flags=33554432, InhabitType=4, flags_extra=130 WHERE entry=23046;
DELETE FROM smart_scripts WHERE entryorguid=23046 AND source_type=0;
DELETE FROM creature WHERE id=23046;
INSERT INTO `creature` VALUES (NULL, 23046, 556, 0, 0, 2, 1, 0, 0, -87.5742, 287.856, 26.4832, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);

-- Invis Raven God Target (23057)
UPDATE creature_template SET modelid1=21072, modelid2=0, speed_walk=0.6, speed_run=0.3, unit_flags=33554432, InhabitType=4, flags_extra=130 WHERE entry=23057;
DELETE FROM smart_scripts WHERE entryorguid=23057 AND source_type=0;
DELETE FROM creature WHERE id=23057;
INSERT INTO `creature` VALUES (NULL, 23057, 556, 0, 0, 2, 1, 0, 0, -87.5742, 287.856, 72.1732, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);

-- Invis Raven God Caster (23058)
UPDATE creature_template SET modelid1=19595, modelid2=0, unit_flags=33554432, InhabitType=4, flags_extra=130 WHERE entry=23058;
DELETE FROM smart_scripts WHERE entryorguid=23058 AND source_type=0;
DELETE FROM creature WHERE id=23058;

INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -78.6406, 314.065, 50.6387, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -55.7182, 259.118, 52.0431, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -59.9812, 259.033, 51.1026, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -108.501, 259.119, 51.9147, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -112.741, 259.033, 51.113, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -113.93, 314.073, 51.9899, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -109.626, 314.156, 51.0432, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -54.6649, 314.158, 51.2, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -58.9482, 314.073, 51.9842, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -82.6343, 314.15, 49.8822, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -88.0673, 259.12, 50.7045, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -79.9473, 259.116, 50.7386, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -84.1384, 258.797, 49.4472, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -86.8518, 314.041, 50.8063, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);

-- Beam Spell
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=39978;
INSERT INTO conditions VALUES(13, 1, 39978, 0, 0, 31, 0, 3, 23057, 0, 0, 0, 0, '', '');

-- Anzu Spirits
UPDATE `creature_template` SET `unit_flags`=4104, `ScriptName`='npc_anzu_spirit' WHERE `Entry` IN (23134, 23136, 23135);

-- The Raven's Claw (185554)
UPDATE gameobject_template SET data3=60000 WHERE entry=185554;
DELETE FROM event_scripts WHERE id=14797;
UPDATE gameobject_template SET ScriptName='go_ravens_claw' WHERE entry=185554;

UPDATE `quest_template` SET `RewardFactionValue1` = 6 WHERE `ID` = 914;

UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` = 29455; 
UPDATE `creature` SET `spawndist` = 0 , `MovementType` = 0 WHERE `guid` = 98405; 
UPDATE `creature_template` SET `dynamicflags` = 32 WHERE `entry` = 29454; 

DELETE FROM `vehicle_accessory` WHERE `guid`=29625;
INSERT INTO `vehicle_accessory` (`guid`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES 
(29625, 29694, 0, 1, "Hyldsmeet DrakeRider", 5, 30000);

DELETE FROM `vehicle_template_accessory` WHERE `entry`=29625;
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES 
(29625, 29694, 0, 1, "Hyldsmeet Proto-Drake", 5, 30000);