UPDATE `creature_text` SET `sound` = 0 WHERE `CreatureID` = 8035 AND `groupid` = 1 AND `id` = 0; 

-- Dark Iron Agent SAI
SET @ENTRY := 6212;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,1000,2000,31000,31000,11,11802,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Agent - In Combat - Cast 'Dark Iron Land Mine' (Normal Dungeon)");

-- Dark Iron Land Mine SAI
SET @ENTRY := 8035;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,3,0,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - On Just Summoned - Run Script (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,1,2,61,0,100,3,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - On Just Summoned - Say Line 0 (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,2,3,60,0,100,3,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - On Update - Say Line 1 (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,3,6,60,0,100,3,10000,10000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - On Update - Say Line 2 (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,4,5,9,0,100,3,0,9,0,0,11,4043,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dark Iron Land Mine - Within 0-9 Range - Cast 'Detonation' (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,5,0,61,0,100,3,0,9,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - Within 0-9 Range - Despawn Instant (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,6,4,61,0,100,3,10000,10000,0,0,19,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - On Update - Remove Flag Pacified (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,7,0,60,0,100,3,30000,30000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - On Update - Despawn Instant (No Repeat) (Normal Dungeon)");

-- Actionlist SAI
SET @ENTRY := 803500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,18,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Flag Pacified"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Rooted On"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - On Script - Set Active On");

-- Blastmaster Emi Shortfuse
UPDATE `creature_text` SET `language`=0 WHERE `entry`=7998 AND `groupid`=11;

-- Grubbis combat reach correction, it was to 60, haha
UPDATE `creature_model_info` SET `CombatReach`=2.25 WHERE `displayid`=6533;

-- Leprous Machinesmith (6224)
DELETE FROM creature_text WHERE entry=6224;
INSERT INTO creature_text VALUES (6224, 0, 0, 'A foul trogg if ever I saw one. Die!', 12, 0, 100, 0, 0, 0, 0, 0, 'Leprous Machinesmith');
INSERT INTO creature_text VALUES (6224, 0, 1, 'No gnome will be left behind.', 12, 0, 100, 0, 0, 0,  0, 0, 'Leprous Machinesmith');
INSERT INTO creature_text VALUES (6224, 0, 2, 'The troggs...they never stop coming. Die trogg! Die!', 12, 0, 100, 0, 0,  0, 0, 0, 'Leprous Machinesmith');
INSERT INTO creature_text VALUES (6224, 0, 3, 'This sickness clouds my vision, but I know you must be a trogg. Die foul invader!', 12, 0, 100, 0, 0,  0, 0, 0, 'Leprous Machinesmith');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=6224;
DELETE FROM smart_scripts WHERE entryorguid=6224 AND source_type=0;
INSERT INTO smart_scripts VALUES (6224, 0, 0, 0, 4, 0, 30, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Leprous Machinesmith - On Aggro - Say Line 0');
INSERT INTO smart_scripts VALUES (6224, 0, 1, 0, 0, 0, 100, 0, 4000, 5000, 20000, 25000, 11, 10732, 0, 0, 0, 0, 0, 19, 6224, 50, 0, 0, 0, 0, 0, 'Leprous Machinesmith - In Combat - Cast Supercharge');
INSERT INTO smart_scripts VALUES (6224, 0, 2, 0, 0, 0, 100, 0, 2000, 5000, 4000, 6000, 11, 13398, 64, 0, 0, 0, 0, 21, 30, 0, 0, 0, 0, 0, 0, 'Leprous Machinesmith - In Combat - Cast Throw Wrench');
INSERT INTO smart_scripts VALUES (6224, 0, 3, 0, 2, 0, 100, 1, 0, 90, 0, 0, 11, 10348, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Leprous Machinesmith - Between 0-90% Health - Cast Tune Up');

-- Mechano-Frostwalker (6227)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=6227;
DELETE FROM smart_scripts WHERE entryorguid=6227 AND source_type=0;
INSERT INTO smart_scripts VALUES (6227, 0, 0, 1, 0, 0, 100, 0, 4000, 11000, 24000, 24000, 11, 11264, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mechano-Frostwalker - In Combat - Cast Ice Blast');
INSERT INTO smart_scripts VALUES (6227, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 10737, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mechano-Frostwalker - In Combat - Cast Hail Storm');

-- Leprous Defender (6223)
DELETE FROM creature_text WHERE entry=6223;
INSERT INTO creature_text VALUES (6223, 0, 0, 'A foul trogg if ever I saw one. Die!', 12, 0, 100, 0, 0, 0, 0, 0, 'Leprous Defender');
INSERT INTO creature_text VALUES (6223, 0, 1, 'No gnome will be left behind.', 12, 0, 100, 0, 0, 0, 0, 0, 'Leprous Defender');
INSERT INTO creature_text VALUES (6223, 0, 2, 'The troggs...they never stop coming. Die trogg! Die!', 12, 0, 100, 0, 0, 0, 0, 0, 'Leprous Defender');
INSERT INTO creature_text VALUES (6223, 0, 3, 'This sickness clouds my vision, but I know you must be a trogg. Die foul invader!', 12, 0, 100, 0, 0, 0, 0, 0, 'Leprous Defender');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=6223;
DELETE FROM smart_scripts WHERE entryorguid=6223 AND source_type=0;
INSERT INTO smart_scripts VALUES (6223, 0, 0, 0, 4, 0, 30, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Leprous Defender - On Aggro - Say Line 0');
INSERT INTO smart_scripts VALUES (6223, 0, 1, 0, 0, 0, 100, 0, 500, 1000, 2000, 2500, 11, 6660, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Leprous Defender - In Combat - Cast Shoot');
INSERT INTO smart_scripts VALUES (6223, 0, 2, 0, 0, 0, 100, 0, 5000, 12000, 9000, 18000, 11, 14443, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Leprous Defender - In Combat - Cast Multi-Shot');

-- Leprous Assistant (7603)
DELETE FROM creature_text WHERE entry=7603;
INSERT INTO creature_text VALUES (7603, 0, 0, 'A foul trogg if ever I saw one. Die!', 12, 0, 100, 0, 0, 0, 0, 0, 'Leprous Assistant');
INSERT INTO creature_text VALUES (7603, 0, 1, 'No gnome will be left behind.', 12, 0, 100, 0, 0, 0, 0, 0, 'Leprous Assistant');
INSERT INTO creature_text VALUES (7603, 0, 2, 'The troggs...they never stop coming. Die trogg! Die!', 12, 0, 100, 0, 0, 0, 0, 0, 'Leprous Assistant');
INSERT INTO creature_text VALUES (7603, 0, 3, 'This sickness clouds my vision, but I know you must be a trogg. Die foul invader!', 12, 0, 100, 0, 0, 0, 0, 0, 'Leprous Assistant');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=7603;
DELETE FROM smart_scripts WHERE entryorguid=7603 AND source_type=0;
INSERT INTO smart_scripts VALUES (7603, 0, 0, 0, 4, 0, 30, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Leprous Assistant - On Aggro - Say Line 0');
INSERT INTO smart_scripts VALUES (7603, 0, 1, 0, 0, 0, 100, 0, 5000, 12000, 9000, 18000, 11, 12024, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Leprous Assistant - In Combat - Cast Net');

-- Leprous Technician (6222)
DELETE FROM creature_text WHERE entry=6222;
INSERT INTO creature_text VALUES (6222, 0, 0, 'A foul trogg if ever I saw one. Die!', 12, 0, 100, 0, 0, 0, 0, 0, 'Leprous Technician');
INSERT INTO creature_text VALUES (6222, 0, 1, 'No gnome will be left behind.', 12, 0, 100, 0, 0, 0, 0, 0, 'Leprous Technician');
INSERT INTO creature_text VALUES (6222, 0, 2, 'The troggs...they never stop coming. Die trogg! Die!', 12, 0, 100, 0, 0, 0, 0, 0, 'Leprous Technician');
INSERT INTO creature_text VALUES (6222, 0, 3, 'This sickness clouds my vision, but I know you must be a trogg. Die foul invader!', 12, 0, 100, 0, 0, 0, 0, 0, 'Leprous Technician');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=6222;
DELETE FROM smart_scripts WHERE entryorguid=6222 AND source_type=0;
INSERT INTO smart_scripts VALUES (6222, 0, 0, 0, 4, 0, 30, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Leprous Technician - On Aggro - Say Line 0');
INSERT INTO smart_scripts VALUES (6222, 0, 1, 0, 0, 0, 100, 0, 5000, 12000, 9000, 18000, 11, 12024, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Leprous Technician - In Combat - Cast Net');
INSERT INTO smart_scripts VALUES (6222, 0, 2, 0, 0, 0, 100, 0, 5000, 12000, 9000, 18000, 11, 13398, 0, 0, 0, 0, 0, 5, 30, 0, 0, 0, 0, 0, 0, 'Leprous Technician - In Combat - Cast Throw Wrench');

-- Mobile Alert System (7849)
REPLACE INTO creature_addon VALUES (30140, 0, 0, 0, 4097, 0, '8279');
REPLACE INTO creature_addon VALUES (30141, 0, 0, 0, 4097, 0, '8279');
REPLACE INTO creature_addon VALUES (30142, 0, 0, 0, 4097, 0, '8279');
REPLACE INTO creature_addon VALUES (30143, 301430, 0, 0, 0, 0, '8279');
REPLACE INTO creature_addon VALUES (30144, 0, 0, 0, 4097, 0, '8279');
DELETE FROM creature_text WHERE entry=7849;
INSERT INTO creature_text VALUES (7849, 0, 0, 'Warning! Warning! Intruder alert! Intruder alert!', 14, 0, 100, 0, 0, 0, 0, 0, 'Mobile Alert System');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=7849;
DELETE FROM smart_scripts WHERE entryorguid=7849 AND source_type=0;
INSERT INTO smart_scripts VALUES (7849, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mobile Alert System - On Reset - Disable Combat Movement');
INSERT INTO smart_scripts VALUES (7849, 0, 1, 0, 0, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mobile Alert System - In Combat - Say Line 0');
INSERT INTO smart_scripts VALUES (7849, 0, 2, 0, 0, 0, 100, 1, 5000, 5000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mobile Alert System - In Combat - Say Line 0');
INSERT INTO smart_scripts VALUES (7849, 0, 3, 4, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mobile Alert System - In Combat - Say Line 0');
INSERT INTO smart_scripts VALUES (7849, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 12, 7603, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 5, 0, 0, 0, 'Mobile Alert System - In Combat - Summon Creature');
INSERT INTO smart_scripts VALUES (7849, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 12, 6223, 4, 30000, 0, 0, 0, 1, 0, 0, 0, -5, 0, 0, 0, 'Mobile Alert System - In Combat - Summon Creature');

-- Arcane Nullifier X-21 (6232)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=6232;
DELETE FROM smart_scripts WHERE entryorguid=6232 AND source_type=0;
INSERT INTO smart_scripts VALUES (6232, 0, 0, 0, 0, 0, 100, 0, 4000, 6000, 20000, 20000, 11, 10831, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Arcane Nullifier X-21 - In Combat - Cast Reflection Field');
INSERT INTO smart_scripts VALUES (6232, 0, 1, 0, 0, 0, 100, 0, 8000, 9000, 15000, 15000, 11, 10832, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Arcane Nullifier X-21 - In Combat - Cast Mass Nullify');

-- Mechanized Guardian (6234)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=6234;
DELETE FROM smart_scripts WHERE entryorguid=6234 AND source_type=0;
INSERT INTO smart_scripts VALUES (6234, 0, 0, 0, 0, 0, 100, 0, 3000, 5000, 15000, 15000, 11, 11825, 0, 0, 0, 0, 0, 5, 20, 0, 0, 0, 0, 0, 0, 'Mechanized Guardian - In Combat - Cast Electrified Net');



-- -------------------------------------------
--                BOSSES
-- -------------------------------------------
-- Mekgineer Thermaplugg
UPDATE creature_template SET mechanic_immune_mask=mechanic_immune_mask|1024, flags_extra=flags_extra|256, AIName='', HealthModifier=11, ScriptName='boss_mekgineer_thermaplugg' WHERE entry=7800;

DELETE FROM `creature_text` WHERE `entry`=7800;
INSERT INTO `creature_text` VALUES (7800, 0, 0, 'Usurpers! Gnomeregan is mine!', 14, 0, 100, 0, 0, 5807, 6173, 0, 'Mekgineer Thermaplugg');
INSERT INTO `creature_text` VALUES (7800, 1, 0, 'My machines are the future! They\'ll destroy you all!', 14, 0, 100, 0, 0, 5808, 6174, 0, 'Mekgineer Thermaplugg');
INSERT INTO `creature_text` VALUES (7800, 2, 0, 'Explosions! MORE explosions! I\'ve got to have more explosions!', 14, 0, 100, 0, 0, 5809, 6176, 0, 'Mekgineer Thermaplugg');
INSERT INTO `creature_text` VALUES (7800, 3, 0, '...and stay dead! He got served!', 14, 0, 100, 0, 0, 5810, 6175, 0, 'Mekgineer Thermaplugg');


-- Walking bombs
UPDATE creature_template SET mechanic_immune_mask=650854271, AIName='', ScriptName='npc_walking_bomb' WHERE entry=7915;

-- Gnome face and buttons
UPDATE gameobject_template SET ScriptName="go_button" WHERE entry IN(142214, 142215, 142216, 142217, 142218, 142219);
UPDATE gameobject_template SET ScriptName="go_gnome_face" WHERE entry IN(142208, 142209, 142210, 142211, 142212, 142213);

-- SPELL Activate Bomb A (11511)
DELETE FROM spell_target_position WHERE id IN(11511);
INSERT INTO spell_target_position VALUES (11511, 0, 90, -531.14, 670.136, -310.0, 0.0);
DELETE FROM spell_linked_spell WHERE spell_trigger=11511;

-- SPELL Activate Bomb (11518)
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=11518;
INSERT INTO conditions VALUES (13, 2, 11518, 0, 0, 31, 0, 5, 142208, 0, 0, 0, 0, '', 'Target Gnome Face 04');
INSERT INTO conditions VALUES (13, 2, 11518, 0, 1, 31, 0, 5, 142209, 0, 0, 0, 0, '', 'Target Gnome Face 03');
INSERT INTO conditions VALUES (13, 2, 11518, 0, 2, 31, 0, 5, 142210, 0, 0, 0, 0, '', 'Target Gnome Face 02');
INSERT INTO conditions VALUES (13, 2, 11518, 0, 3, 31, 0, 5, 142211, 0, 0, 0, 0, '', 'Target Gnome Face 01');
INSERT INTO conditions VALUES (13, 2, 11518, 0, 4, 31, 0, 5, 142212, 0, 0, 0, 0, '', 'Target Gnome Face 06');
INSERT INTO conditions VALUES (13, 2, 11518, 0, 5, 31, 0, 5, 142213, 0, 0, 0, 0, '', 'Target Gnome Face 05');

-- World trigger spawn.
DELETE FROM `creature` WHERE `id` = 22515 AND `guid` IN (78642,78643,78644,78645,78646,78647);
INSERT INTO `creature` VALUES (78642, 22515, 90, 0, 0, 1, 1, 0, 0, -554.483, 642.027, -327.32, 0.950046, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (78643, 22515, 90, 0, 0, 1, 1, 0, 0, -524.438, 634.191, -327.317, 1.87463, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (78644, 22515, 90, 0, 0, 1, 1, 0, 0, -497.889, 654.676, -327.316, 2.87318, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (78645, 22515, 90, 0, 0, 1, 1, 0, 0, -501.013, 684.974, -327.23, 3.74755, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (78646, 22515, 90, 0, 0, 1, 1, 0, 0, -520.222, 706.081, -327.33, 4.19248, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (78647, 22515, 90, 0, 0, 1, 1, 0, 0, -553.031, 700.236, -327.328, 5.28619, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0, 0);

-- Electrocutioner 6000 SAI
UPDATE creature_template SET mechanic_immune_mask=mechanic_immune_mask|1024, AIName='SmartAI', ScriptName='' WHERE entry=6235;
DELETE FROM creature_text WHERE entry=6235;
INSERT INTO creature_text VALUES (6235, 0, 0, 'Electric justice!', 14, 0, 100, 0, 0, 5811, 0, 0, 'Electrocutioner 6000');
SET @ENTRY := 6235;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Electrocutioner 6000 - On Aggro - Say Line 0"),
(@ENTRY,0,1,0,0,0,100,0,5000,5000,14000,16000,11,11084,0,0,0,0,0,5,20,0,0,0,0,0,0,"Electrocutioner 6000 - In Combat - Cast 'Shock'"),
(@ENTRY,0,2,0,0,0,100,0,8000,8000,15000,15000,11,11082,0,0,0,0,0,2,0,0,0,0,0,0,0,"Electrocutioner 6000 - In Combat - Cast 'Megavolt'"),
(@ENTRY,0,3,0,0,0,100,0,3000,3000,21000,21000,11,11085,0,0,0,0,0,2,0,0,0,0,0,0,0,"Electrocutioner 6000 - In Combat - Cast 'Chain Bolt'");
