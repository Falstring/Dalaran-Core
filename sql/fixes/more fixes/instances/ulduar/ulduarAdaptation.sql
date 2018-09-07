-- Ulduar Teleporter script.

UPDATE gameobject_template SET ScriptName="ulduar_teleporter" WHERE entry=194569;

-- Val'Anyr

UPDATE `gameobject_loot_template` SET `item`=45038 WHERE  `entry` IN(27081,26967,26963,26962,26960,27079,29650,26946,26955,26956) AND `item`=45083;

-- Yogg Saron maul, item spell conditions.

SET @DEAFENINGROAR        := 64189;
SET @INTHEMAWSOFTHEOLDGOD := 64184;
SET @NPC                  := 33288;
DELETE FROM `conditions` WHERE `SourceEntry`=@INTHEMAWSOFTHEOLDGOD AND `SourceTypeOrReferenceId`=17;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(17,0,@INTHEMAWSOFTHEOLDGOD,0,0,31,1,3,@NPC,0,0,0,'', 'In the Maws of the Old God -  It is only possible to target Yogg Saron'),
(17,0,@INTHEMAWSOFTHEOLDGOD,0,0,1,0,@DEAFENINGROAR,1,0,0,0,'', 'If Yogg Saron has DEAFENINGROAR aura - apply spell');



-- Thorim sigil conditions

-- INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (10, 26956, 45784, 0, 0, 9, 0, 13610, 0, 0, 0, 0, 0, '', NULL);




-- Loot
-- Thorim loot modes for 

UPDATE `gameobject_loot_template` SET `lootmode`=1 WHERE `entry` IN (26955, 26956, 27074);

-- Ulduar Trash

-- Superheated Winds
DELETE FROM creature_template_addon WHERE entry = 34194;
INSERT INTO creature_template_addon(entry, auras) VALUES(34194, 64724);
UPDATE `creature_template` SET `ScriptName`="npc_superheated_winds" WHERE `entry`=34194;
UPDATE `creature_template` SET `flags_extra`=`flags_extra` |128 WHERE `entry`=34189;

-- Magma Rager SAI
SET @ENTRY := 34086;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,6,5000,10000,5000,10000,11,0,0,0,0,0,0,5,0,0,0,0,0,0,0,"Magma Rager - Cast Fire Blast"),
(@ENTRY,0,1,0,0,0,100,6,8000,16000,8000,16000,11,64746,0,0,0,0,0,1,0,0,0,0,0,0,0,"Magma Rager casts Superheated Winds");


-- Forge Construct
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=34085;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34085;
INSERT INTO `smart_scripts` (`entryorguid`, `event_type`, `event_flags`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(34085, 4, 6, 11, 64719, 2, 'Forge Construct - Cast Charge');
INSERT INTO `smart_scripts` (`entryorguid`, `id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(34085, 1, 0, 2, 5000, 15000, 5000, 15000, 11, 64720, 2, 'Forge Construct - Cast Flame Emission'),
(34085, 2, 0, 4, 5000, 15000, 5000, 15000, 11, 64721, 2, 'Forge Construct - Cast Flame Emission');

-- making some objects be spawned in all versions of Ulduar
UPDATE `gameobject` SET `spawnMask`=3 WHERE `guid` IN (35446, 35393, 35413, 35417, 55630, 34041, 54961, 54971, 55043, 55194, 35381, 35462, 42047, 42076, 42520, 42543, 42649, 42868, 42916, 42918, 42919, 42958, 43112, 43115, 44885, 45021, 45090, 45094, 45096, 45097, 45116, 4784597, 4784598,
45175, 45209, 48905, 50363, 55002, 55692, 55702, 127, 55734, 55862, 55926, 55965, 34155, 281, 35467, 35497, 35516, 35517, 42960, 43113, 43114, 44883, 34057, 45225, 45229, 45230, 45500, 56130, 56244, 56245, 56295, 56296, 56301, 56312, 56351, 56359, 56372, 56411, 54995, 55078, 56422, 56424, 56426, 
289, 35524, 56107, 56125, 42867, 42879, 55974, 55647, 285) OR `id` IN (194569, 189973, 190170, 190171, 191019, 194905, 194907) AND `map`=603;


-- updating Razorscale Controller positions
DELETE FROM `creature` WHERE `guid` BETWEEN 48304 AND 48310;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`) VALUES
(48304, 33233, 603, 2, 560.133, -143.035, 393.823),
(48306, 33233, 603, 3, 588.673, -136.835, 391.517),
(48307, 33233, 603, 2, 603.931, -142.889, 391.517),
(48308, 33233, 603, 3, 572.654, -139.375, 391.517);

-- delete razorscale broken harpoons, they are spawned via scripts
DELETE FROM `gameobject` WHERE `id`=194565;

-- XD-175 Compactobot SAI
SET @ENTRY := 34271;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,10000,20000,10000,20000,11,65073,0,0,0,0,0,17,10,40,0,0,0,0,0,"XD-175 Compactobot - In Combat - Cast 'Trash Compactor' (Normal Dungeon)"),
(@ENTRY,0,1,0,0,0,100,4,10000,20000,10000,20000,11,65106,0,0,0,0,0,17,10,40,0,0,0,0,0,"XD-175 Compactobot - In Combat - Cast 'Trash Compactor' (Heroic Dungeon)"),
(@ENTRY,0,2,0,4,0,100,0,0,0,0,0,39,30,0,0,0,0,0,0,0,0,0,0,0,0,0,"XD-175 Compactobot - On Aggro - Call For Help");


-- Parts Recovery Technician SAI
SET @ENTRY := 34267;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,6,10000,20000,10000,20000,11,65071,0,0,0,0,0,2,0,0,0,0,0,0,0,"Parts Recovery Technician - In Combat - Cast 'Mechano Kick' (Dungeon)"),
(@ENTRY,0,1,0,0,0,100,6,5000,10000,20000,25000,11,65070,0,0,0,0,0,1,0,0,0,0,0,0,0,"Parts Recovery Technician - In Combat - Cast 'Defense Matrix' (Dungeon)"),
(@ENTRY,0,2,0,4,0,100,0,0,0,0,0,39,35,0,0,0,0,0,0,0,0,0,0,0,0,0,"Parts Recovery Technician - On Aggro - Call For Help");


-- XB-488 Disposalbot SAI
SET @ENTRY := 34273;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,2000,5000,5000,7000,11,65080,0,0,0,0,0,2,0,0,0,0,0,0,0,"XB-488 Disposalbot - In Combat - Cast 'Cut Scrap Metal' (Normal Dungeon)"),
(@ENTRY,0,1,0,0,0,100,4,2000,5000,5000,7000,11,65104,0,0,0,0,0,2,0,0,0,0,0,0,0,"XB-488 Disposalbot - In Combat - Cast 'Cut Scrap Metal' (Heroic Dungeon)"),
(@ENTRY,0,2,0,2,0,100,6,1,15,0,0,11,65084,0,0,0,0,0,1,0,0,0,0,0,0,0,"XB-488 Disposalbot - Between 1-15% Health - Cast 'Self Destruct' (Dungeon)"),
(@ENTRY,0,3,0,4,0,100,0,0,0,0,0,39,35,0,0,0,0,0,0,0,0,0,0,0,0,0,"XB-488 Disposalbot - On Aggro - Call For Help");

-- TODO: XR-949 Salvagebot

-- XR-949 Salvagebot SAI
SET @ENTRY := 34269;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,39,30,0,0,0,0,0,0,0,0,0,0,0,0,0,"XR-949 Salvagebot - On Aggro - Call For Help");


-- Lightning Charged Iron Dwarf
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=34199;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34199;
INSERT INTO `smart_scripts` (`entryorguid`, `id`, `event_type`, `event_flags`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(34199, 0, 4, 2, 11, 64889, 1, 'Lightning Charged Iron Dwarf - Cast Lightning Charged'),
(34199, 1, 4, 4, 11, 64975, 1, 'Lightning Charged Iron Dwarf - Cast Lightning Charged');

-- Hardened Iron Golem
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=34190;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34190;
INSERT INTO `smart_scripts` (`entryorguid`, `id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(34190, 0, 0, 2, 5000, 10000, 15000, 20000, 11, 64874, 2, 'Hardened Iron Golem - Cast Rune Punch'),
(34190, 1, 0, 4, 5000, 10000, 15000, 20000, 11, 64967, 2, 'Hardened Iron Golem - Cast Rune Punch'),
(34190, 2, 0, 6, 5000, 10000, 15000, 20000, 11, 64877, 1, 'Hardened Iron Golem - Cast Harden Fists');

-- Iron Mender
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=34198;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34198;
INSERT INTO `smart_scripts` (`entryorguid`, `id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(34198, 0, 0, 2, 5000, 10000, 10000, 20000, 11, 64918, 2, 'Iron Mender - Cast Electro Shock'),
(34198, 1, 0, 4, 5000, 10000, 10000, 20000, 11, 64971, 2, 'Iron Mender - Cast Electro Shock'),
(34198, 2, 0, 2, 5000, 10000, 20000, 25000, 11, 64903, 5, 'Iron Mender - Cast Fuse Lightning'),
(34198, 3, 0, 4, 5000, 10000, 20000, 25000, 11, 64970, 5, 'Iron Mender - Cast Fuse Lightning'),
(34198, 4, 14, 2, 20000, 40, 15000, 20000, 11, 64897, 7, 'Iron Mender - Cast Fuse Metal'),
(34198, 5, 14, 4, 50000, 40, 15000, 20000, 11, 64968, 7, 'Iron Mender - Cast Fuse Metal');

-- Rune Etched Sentry SAI
SET @ENTRY := 34196;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,6,5000,7000,10000,20000,11,64852,0,0,0,0,0,5,0,0,0,0,0,0,0,"Rune Etched Sentry - In Combat - Cast 'Flaming Rune' (Dungeon)"),
(@ENTRY,0,1,0,0,0,100,2,5000,10000,10000,15000,11,64870,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rune Etched Sentry - In Combat - Cast 'Lava Burst' (Normal Dungeon)"),
(@ENTRY,0,2,0,0,0,100,4,5000,10000,10000,15000,11,64991,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rune Etched Sentry - In Combat - Cast 'Lava Burst' (Heroic Dungeon)"),
(@ENTRY,0,3,0,0,0,100,2,7000,10000,10000,15000,11,64847,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rune Etched Sentry - In Combat - Cast 'Runed Flame Jets' (Normal Dungeon)"),
(@ENTRY,0,4,0,0,0,100,4,7000,10000,10000,15000,11,64988,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rune Etched Sentry - In Combat - Cast 'Runed Flame Jets' (Heroic Dungeon)"),
(@ENTRY,0,5,0,4,0,100,0,0,0,0,0,39,30,0,0,0,0,0,0,0,0,0,0,0,0,0,"Rune Etched Sentry - On Aggro - Call For Help");


-- Chamber Overseer
SET @ENTRY := 34197;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,10000,15000,10000,20000,11,64820,0,0,0,0,0,17,10,80,0,0,0,0,0,"Chamber Overseer - In Combat - Cast 'Devastating Leap' (Normal Dungeon)"),
(@ENTRY,0,1,0,0,0,100,4,10000,15000,10000,15000,11,64943,0,0,0,0,0,17,10,80,0,0,0,0,0,"Chamber Overseer - In Combat - Cast 'Devastating Leap' (Heroic Dungeon)"),
(@ENTRY,0,2,0,0,0,100,2,5000,10000,10000,15000,11,64825,0,0,0,0,0,2,0,0,0,0,0,0,0,"Chamber Overseer - In Combat - Cast 'Staggering Roar' (Normal Dungeon)"),
(@ENTRY,0,3,0,0,0,100,4,5000,10000,10000,15000,11,64944,0,0,0,0,0,2,0,0,0,0,0,0,0,"Chamber Overseer - In Combat - Cast 'Staggering Roar' (Heroic Dungeon)"),
(@ENTRY,0,4,0,0,0,100,6,6000,8000,25000,30000,11,64783,0,0,0,0,0,2,0,0,0,0,0,0,0,"Chamber Overseer - In Combat - Cast 'Displacement Device' (Dungeon)"); -- Device's behaviour scripted through the core.

-- 64783
-- Dark Rune Ravager
UPDATE `creature_template` SET `ScriptName`='', `AIName`='SmartAI' WHERE `entry`=33755;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33755;
INSERT INTO `smart_scripts` (`entryorguid`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(33755, 0, 6, 2000, 2000, 2000, 2000, 11, 63615, 2, 'Dark Rune Ravager - Cast Ravage Armor');

-- Dark Rune Thunderer
UPDATE `creature_template` SET `ScriptName`='', `AIName`='SmartAI' WHERE `entry`=33754;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33754;
INSERT INTO `smart_scripts` (`entryorguid`, `id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(33754, 0, 0, 2, 3000, 3000, 2000, 3000, 11, 63612, 2, 'Dark Rune Thunderer - Cast Lightning Brand'),
(33754, 1, 0, 4, 3000, 3000, 2000, 3000, 11, 63673, 2, 'Dark Rune Thunderer - Cast Lightning Brand');


-- Arachnopod Destroyer SAI
SET @ENTRY := 34183;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,6,0,0,0,0,11,64779,0,0,0,0,0,2,0,0,0,0,0,0,0,"Arachnopod Destroyer - On Aggro - Cast 'Charged Leap' (Dungeon)"),
(@ENTRY,0,1,0,0,0,100,6,5000,10000,10000,15000,11,64717,0,0,0,0,0,2,0,0,0,0,0,0,0,"Arachnopod Destroyer - In Combat - Cast 'Flame Spray' (Dungeon)"),
(@ENTRY,0,2,0,0,0,100,6,10000,20000,20000,30000,11,64776,0,0,0,0,0,2,0,0,0,0,0,0,0,"Arachnopod Destroyer - In Combat - Cast 'Machine Gun' (Dungeon)");



-- Clockwork Mechanic

UPDATE creature_template SET unit_flags=0 WHERE entry IN(34184, 34219);

-- Clockwork Mechanic SAI
SET @ENTRY := 34184;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,6,0,99,2000,20000,11,64966,0,0,0,0,0,1,0,0,0,0,0,0,0,"Clockwork Mechanic - Between 0-99% Health - Cast 'Ice Turret' (Dungeon)");


-- Ice Turret (spawned by Clockwork Mechanics)
UPDATE `creature_template` SET `unit_flags`=`unit_flags` |4, `AIName`='SmartAI' WHERE `entry`=34224;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34224;
INSERT INTO `smart_scripts` (`entryorguid`, `id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(34224, 0, 0, 2, 2000, 5000, 15000, 30000, 11, 66346, 1, 'Ice Turret - Cast Ice Nova'),
(34224, 1, 0, 4, 2000, 5000, 15000, 30000, 11, 64919, 1, 'Ice Turret - Cast ce Nova');

-- Champion of Hodir
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=34133;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34133;
INSERT INTO `smart_scripts` (`entryorguid`, `id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(34133, 0, 0, 2, 10000, 15000, 10000, 15000, 11, 64639, 1, 'Champion of Hodir - Cast Stomp'),
(34133, 1, 0, 4, 10000, 15000, 10000, 15000, 11, 64652, 1, 'Champion of Hodir - Cast Stomp'),
(34133, 2, 0, 6, 15000, 20000, 15000, 20000, 11, 64649, 2, 'Champion of Hodir - Cast Freezing Breath');

-- Winter Jormungar
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=34137;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34137;
INSERT INTO `smart_scripts` (`entryorguid`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(34137, 0, 6, 5000, 10000, 5000, 10000, 11, 64638, 2, 'Winter Jormungar - Cast Acidic Bite');

-- Winter Revenant
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=34134;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34134;
INSERT INTO `smart_scripts` (`entryorguid`, `id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(34134, 0, 0, 2, 5000, 15000, 10000, 15000, 11, 64642, 1, 'Winter Revenant - Cast Blizzard'),
(34134, 1, 0, 4, 5000, 15000, 10000, 15000, 11, 64653, 1, 'Winter Revenant - Cast Blizzard'),
(34134, 2, 4, 6, 0, 0, 0, 0, 11, 64644, 1, 'Winter Revenant - Cast Shield of the Winter Revenant'),
(34134, 3, 0, 6, 15000, 20000, 15000, 20000, 11, 64643, 1, 'Winter Revenant - Cast Whirling Strike');

-- Winter Rumbler
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=34135;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34135;
INSERT INTO `smart_scripts` (`entryorguid`, `id`, `event_type`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(34135, 0, 0, 2, 5000, 10000, 10000, 15000, 11, 64645, 2, 'Winter Rumbler - Cast Cone of Cold'),
(34135, 1, 0, 4, 5000, 10000, 10000, 15000, 11, 64655, 2, 'Winter Rumbler - Cast Cone of Cold'),
(34135, 2, 0, 2, 10000, 20000, 10000, 20000, 11, 64647, 6, 'Winter Rumbler - Cast Snow Blindness'),
(34135, 3, 0, 4, 10000, 20000, 10000, 20000, 11, 64654, 6, 'Winter Rumbler - Cast Snow Blindness');

UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry` IN (34153, 33395);

-- Thorims trap bunny shouldnt be able to move
-- UPDATE `creature_template` SET `unit_flags`=`unit_flags` |4 WHERE `entry`=33054;

-- Ulduar Trash
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_steelforged_defender' WHERE `entry`=33236;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_ironwork_cannon' WHERE `entry`=33264;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_corrupted_servitor' WHERE `entry`=33354;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_misguided_nymph' WHERE `entry`=33355;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_guardian_lasher' WHERE `entry`=33430;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_forest_swarmer' WHERE `entry`=33431;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_mangrove_ent' WHERE `entry`=33525;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_ironroot_lasher' WHERE `entry`=33526;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_natures_blade' WHERE `entry`=33527;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_guardian_of_life' WHERE `entry`=33528;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_storm_tempered_keeper' WHERE `entry` IN (33699, 33722);
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_charged_sphere' WHERE `entry`=33715;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_faceless_horror' WHERE `entry`=33772; 
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_twilight_adherent' WHERE `entry`=33818; 
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_twilight_frost_mage' WHERE `entry`=33819;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_twilight_pyromancer' WHERE `entry`=33820;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_enslaved_fire_elemental' WHERE `entry`=33838;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_twilight_guardian' WHERE `entry`=33822;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_twilight_slayer' WHERE `entry`=33823;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_twilight_shadowblade' WHERE `entry`=33824;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_molten_colossus' WHERE `entry`=34069;
UPDATE `creature_template` SET `ScriptName`='npc_runeforged_sentry' WHERE `entry`=34234;
UPDATE creature_template SET ScriptName="npc_clockwork_sapper" WHERE entry=34193;

UPDATE creature_template SET ScriptName="npc_void_beast" WHERE entry=33806;


DELETE FROM `spell_script_names` WHERE `spell_id`=63059;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(63059, 'spell_pollinate');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62317 AND `spell_effect`=57807 AND `type`=1;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(62317, 57807, 1, 'Twilight Guardian - Link Devastate to Sunder Armor');

-- Clockwork mechanic
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~(262144|33554432) WHERE `entry`=34184;


-- correcting Junk bot template
UPDATE `creature_template` SET `difficulty_entry_1`=34114 WHERE `entry`=33855;
UPDATE `creature_template` SET `faction`=16, `faction`=16 WHERE `entry`=34114;

-- correcting Enslaved Fire Elemental versions
UPDATE `creature_template` SET `difficulty_entry_1`=33839 WHERE `entry`=33838;
UPDATE `creature_template` SET `minlevel`= 82, `maxlevel`=82, `faction`=16, `faction`=16 WHERE `entry`=33839;







-- The Siege of Ulduar:


-- Flame Leviathan and Vehicles.

-- Demolisher seat correction. 
UPDATE vehicle_template_accessory SET seat_id=1 WHERE entry=33109;
-- Assign script to Liquid Pyrite
UPDATE creature_template SET ScriptName="npc_liquid_pyrite" WHERE entry=33189;








-- Kologarn
-- Add script to arms.
UPDATE `creature_template` SET `ScriptName`='npc_kologarn_arm' WHERE `entry` IN (32933,32934);

-- Add achievement scripts to corresponding criterias
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10284, 10722, 10285, 10095, 10290, 10133);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES 
(10284, 11, 0, 0, 'achievement_disarmed'),
(10284, 12, 0, 0, ''),
(10722, 11, 0, 0, 'achievement_disarmed_25'),
(10722, 12, 1, 0, ''),
(10285, 11, 0, 0, 'achievement_with_open_arms'),
(10285, 12, 0, 0, ''),
(10095, 11, 0, 0, 'achievement_with_open_arms_25'),
(10095, 12, 1, 0, ''),
(10290, 11, 0, 0, 'achievement_rubble_and_roll'),
(10290, 12, 0, 0, ''),
(10133, 11, 0, 0, 'achievement_rubble_and_roll_25'),
(10133, 12, 1, 0, '');



-- Armsweep Stalker Kologarn must not attack the players 
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128|2  WHERE `entry` IN (33661);

-- Focused beams triggers, make triggers invisible 
 UPDATE creature_template SET modelid1=11686, modelid2=0, flags_extra=0 WHERE entry IN(33632, 33802,33906, 33907);

 -- Focused beams, script names.
 UPDATE creature_template SET speed_run=1, ScriptName="npc_focused_eye_beam" WHERE entry IN(33632, 33802);

-- Rubble script.
UPDATE creature_template SET ScriptName="npc_rubble" WHERE entry=33768;



-- Assembly of Iron, Brundir:

UPDATE creature_template SET InhabitType=4 WHERE entry IN(32857,33694);

-- Immunities for Brundir, he should be stunneable by default, managed via core the rest.

UPDATE `creature_template` SET `mechanic_immune_mask`=1|2|4|8|16|32|64|256|512|4096|8192|65536|131072|524288|4194304|8388608|67108864|536870912, `flags_extra`=1 WHERE `entry` IN (32857, 33694);

-- Assembly of Iron
DELETE FROM `creature_text` WHERE `entry` IN (32867, 32927, 32857);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(32867, 0, 0, 'You will not defeat the Assembly of Iron so easily, invaders!', 14, 0, 100, 0, 0, 15674, 'Steelbreaker SAY_AGGRO'),
(32867, 1, 0, 'So fragile and weak!', 14, 0, 100, 0, 0, 15675, 'Steelbreaker SAY_SLAY_1'),
(32867, 1, 1, 'Flesh... such a hindrance.', 14, 0, 100, 0, 0, 15676, 'Steelbreaker SAY_SLAY_2'),
(32867, 2, 0, 'You seek the secrets of Ulduar? Then take them!', 14, 0, 100, 0, 0, 15677, 'Steelbreaker SAY_POWER'),
(32867, 3, 0, 'My death only serves to hasten your demise.', 14, 0, 100, 0, 0, 15678, 'Steelbreaker SAY_DEATH_1'),
(32867, 3, 1, 'Impossible!', 14, 0, 100, 0, 0, 15679, 'Steelbreaker SAY_DEATH_2'),
(32867, 4, 0, 'This meeting of the Assembly of Iron is adjourned!', 14, 0, 100, 0, 0, 15680, 'Steelbreaker SAY_BERSERK'),
(32927, 0, 0, 'Nothing short of total decimation will suffice.', 14, 0, 100, 0, 0, 15657, 'Molgeim SAY_AGGRO'),
(32927, 1, 0, 'The world suffers yet another insignificant loss.', 14, 0, 100, 0, 0, 15658, 'Molgeim SAY_SLAY_1'),
(32927, 1, 1, 'Death is the price of your arrogance.', 14, 0, 100, 0, 0, 15659, 'Molgeim SAY_SLAY_2'),
(32927, 2, 0, 'Decipher this!', 14, 0, 100, 0, 0, 15660, 'Molgeim SAY_RUNE_DEATH'),
(32927, 3, 0, 'Face the lightning surge!', 14, 0, 100, 0, 0, 15661, 'Molgeim SAY_SUMMON'),
(32927, 4, 0, 'The legacy of storms shall not be undone.', 14, 0, 100, 0, 0, 15662, 'Molgeim SAY_DEATH_1'),
(32927, 4, 1, 'What have you gained from my defeat? You are no less doomed, mortals!', 14, 0, 100, 0, 0, 15663, 'Molgeim SAY_DEATH_2'),
(32927, 5, 0, 'This meeting of the Assembly of Iron is adjourned!', 14, 0, 100, 0, 0, 15664, 'Molgeim SAY_BERSERK'),
(32857, 0, 0, 'Whether the world''s greatest gnats or the world''s greatest heroes, you''re still only mortal!', 14, 0, 100, 0, 0, 15684, 'Brundir SAY_AGGRO'),
(32857, 1, 0, 'A merciful kill!', 14, 0, 100, 0, 0, 15685, 'Brundir SAY_SLAY_1'),
(32857, 1, 1, 'HAH!', 14, 0, 100, 0, 0, 15686, 'Brundir SAY_SLAY_2'),
(32857, 2, 0, 'Stand still and stare into the light!', 14, 0, 100, 0, 0, 15687, 'Brundir SAY_SPECIAL'),
(32857, 3, 0, 'Let the storm clouds rise and rain down death from above!', 14, 0, 100, 0, 0, 15688, 'Brundir SAY_FLIGHT'),
(32857, 4, 0, 'The power of the storm lives on...', 14, 0, 100, 0, 0, 15689, 'Brundir SAY_DEATH_1'),
(32857, 4, 1, 'You rush headlong into the maw of madness!', 14, 0, 100, 0, 0, 15690, 'Brundir SAY_DEATH_2'),
(32857, 5, 0, 'This meeting of the Assembly of Iron is adjourned!', 14, 0, 100, 0, 0, 15691, 'Brundir SAY_BERSERK'),
(32857, 6, 0, 'Stormcaller Brundir begins to Overload!', 41, 0, 100, 0, 0, 0, 'Brundir EMOTE_OVERLOAD');


-- 

-- XT-002 Deconstructor
DELETE FROM `creature_text` WHERE `entry` IN (33293, 33343);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(33293, 0, 0, 'New toys? For me? I promise I won''t break them this time!', 14, 0, 100, 0, 0, 15724, 'XT002 SAY_AGGRO'),
(33293, 1, 0, 'So tired. I will rest for just a moment!', 14, 0, 100, 0, 0, 15725, 'XT002 SAY_HEART_OPENED'),
(33293, 2, 0, 'I''m ready to play!', 14, 0, 100, 0, 0, 15726, 'XT002 SAY_HEART_CLOSED'),
(33293, 3, 0, 'NO! NO! NO! NO! NO!', 14, 0, 100, 0, 0, 15727, 'XT002 SAY_TYMPANIC_TANTRUM'),
(33293, 4, 0, 'I... I think I broke it.', 14, 0, 100, 0, 0, 15728, 'XT002 SAY_SLAY_1'),
(33293, 4, 1, 'I guess it doesn''t bend that way.', 14, 0, 100, 0, 0, 15729, 'XT002 SAY_SLAY_2'),
(33293, 5, 0, 'I''m tired of these toys. I don''t want to play anymore!', 14, 0, 100, 0, 0, 15730, 'XT002 SAY_BERSERK'),
(33293, 6, 0, 'You are bad... Toys... Very... Baaaaad!', 14, 0, 100, 0, 0, 15731, 'XT002 SAY_DEATH'),
(33293, 7, 0, 'Time for a new game! My old toys will fight my new toys!', 14, 0, 100, 0, 0, 15732, 'XT002 SAY_SUMMON'),
(33293, 8, 0, 'XT-002 Deconstructor begins to cause the earth to quake.', 41, 0, 100, 0, 0, 0, 'XT002 EMOTE_TYMPANIC'),
(33293, 9, 0, 'XT-002 Deconstructor''s heart is exposed and leaking energy.', 41, 0, 100, 0, 0, 0, 'XT002 EMOTE_HEART'),
(33343, 0, 0, 'XT-002 Deconstructor consumes a scrap bot to repair himself!', 41, 0, 100, 0, 0, 0, 'XS-013 Scrapbot EMOTE_REPAIR');






-- Thorim
UPDATE `creature_template` SET `ScriptName`='boss_thorim' WHERE `entry`=32865;

DELETE FROM creature_template WHERE entry=251239;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (251239, 0, 0, 0, 0, 0, 16925, 16925, 0, 0, 'Thunder Orb', '', '', 0, 80, 80, 2, 14, 0, 1, 1.14286, 1, 1, 0, 2000, 0, 1, 33685508, 2048, 8, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_thunder_orb', 12340);

DELETE FROM creature where id=251239;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5883750, 251239, 603, 3, 1, 0, 0, 2164.91, -288.358, 432.682, 4.93519, 300, 0, 0, 12600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5883636, 251239, 603, 3, 1, 0, 0, 2146.63, -227.107, 432.813, 1.73251, 300, 0, 0, 12600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5883674, 251239, 603, 3, 1, 0, 0, 2163.5, -237.687, 433.267, 4.90128, 300, 0, 0, 12600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5883562, 251239, 603, 3, 1, 0, 0, 2109.19, -234.646, 433.267, 0.110063, 300, 0, 0, 12600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5883524, 251239, 603, 3, 1, 0, 0, 2127.57, -226.146, 432.886, 2.3799, 300, 0, 0, 12600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5883468, 251239, 603, 3, 1, 0, 0, 2106.17, -288.261, 432.68, 4.57971, 300, 0, 0, 12600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5883280, 251239, 603, 3, 1, 0, 0, 2096.77, -260.68, 433.159, 0.315299, 300, 0, 0, 12600, 0, 0, 0, 0, 0);




-- Thorim Runic Fortification
DELETE FROM `spell_script_names` WHERE `spell_id`=62942;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(62942, 'spell_thorim_runic_fortification');

-- Thorim berserk
DELETE FROM `spell_script_names` WHERE `spell_id`=62560;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(62560, 'spell_thorim_berserk');

-- Thorim Charge orb targeting
DELETE FROM `spell_script_names` WHERE `spell_id`=62016;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(62016, 'spell_thorim_charge_orb_targeting');

-- Thorim Lightning Destruction
DELETE FROM `spell_script_names` WHERE `spell_id`=62392;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(62392, 'spell_thorim_lightning_destruction');


-- Thunder orb flags
-- UPDATE `creature_template` SET `unit_flags`=`unit_flags` |4 WHERE `entry` IN(33054, 33378);


-- Thorim Trap bunny proper corretions, there are 2 bunnies with different ID.

UPDATE creature_template SET unit_flags=33685508, flags_extra=0 WHERE entry IN(33054,33725);


-- Thunder orbs are spawned via boss script
DELETE FROM `creature` WHERE `id`=33378;
-- Lightning orb scriptname and waypoints
UPDATE `creature_template` SET `ScriptName`='npc_lightning_orb' WHERE `entry`=33138;
DELETE FROM waypoint_data WHERE id = 33138;
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z) VALUES
(33138, 1, 2227.6, -263.7, 412.2),
(33138, 2, 2227.6, -432.6, 412.2),
(33138, 3, 2199.3, -433.7, 420),
(33138, 4, 2167.5 ,-440.2, 438.5),
(33138, 5, 2134.8 ,-440.2, 438.5),
(33138, 6, 2134.8 ,-303.4, 438.5);

-- update faction of Dark Rune Acolyte so hes correctly affected by Berserk
UPDATE `creature_template` SET `faction`=1692, `faction`=1692 WHERE `entry` IN (32886, 33159);

-- Controller
UPDATE `creature_template` SET `ScriptName`='npc_thorim_controller' WHERE `entry`=32879;
DELETE FROM `creature` WHERE `id`=32879;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(32879, 603, 3, 1, 0, 2134.77, -262.307, 420.694, 1.3439, 604800, 0, 0, 12600, 0, 0, 0, 0, 0);

-- Adds
-- Link spell "Stormhammer" to "Deafening Thunder"
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62042;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(62042, 62470, 1, 'Stormhammer => Deafening Thunder');

-- Register spell-script for target-selection.
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_stormhammer_targeting';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(62042, 'spell_stormhammer_targeting');

-- Charge Orb - implicit targeting only a special npc.
DELETE FROM `conditions` WHERE `SourceEntry`=62016;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES
(13, 1, 62016, 31, 3, 33378, 'Lightning Shock');

-- Pre-phase adds: Register scripts.
UPDATE `creature_template` SET `ScriptName`='npc_thorim_pre_phase_add' WHERE `entry` IN (32885,32883,32908,32907,32882,32886);

DELETE FROM `creature` WHERE `id` IN (32882,32908,32885,32886,32907,32883); -- NPCs are spawned by script.

-- Thorim Mini bosses : Runic Colossus, Ancient Rune Giant, Sif
UPDATE `creature_template` SET `mechanic_immune_mask`=1|2|4|8|16|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912, `flags_extra`=1, `ScriptName`='npc_runic_colossus' WHERE `entry`=32872;
UPDATE `creature_template` SET `mechanic_immune_mask`= 1|2|4|8|16|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912, `flags_extra`=1, `ScriptName`='npc_ancient_rune_giant' WHERE `entry`=32873;
UPDATE `creature_template` SET `mechanic_immune_mask`= 1|2|4|8|16|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912, `flags_extra`=1, `ScriptName`='npc_sif' WHERE `entry`=33196;

-- updating giant and Sif immunities
UPDATE `creature_template` SET `mechanic_immune_mask`=1|2|4|8|16|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (33149, 33148, 33196);
UPDATE `creature_template` SET `ScriptName`='npc_thorim_arena_phase_add' WHERE `entry` IN (32876, 32904, 32878, 32877, 32874, 32875, 33110);

DELETE FROM `creature_addon` WHERE `guid` IN (136059, 136816);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(136059, 0, 0, 0, 1, 0, '40775'),
(136816, 0, 0, 0, 1, 0, '40775');
DELETE FROM `creature` WHERE `id` IN (33140, 33141); -- Left and right runic smash bunnies are spawned in scripts
UPDATE `creature_template` SET `ScriptName`='npc_runic_smash' WHERE `entry` IN (33140, 33141);

-- adding Thorim Lever ScriptName
-- TODO: find out why entry 194264 doesnt work
UPDATE `gameobject_template` SET `ScriptName`='go_thorim_lever' WHERE `entry`=194264;
UPDATE `gameobject_template` SET `size`=3, `data2`=6000, `flags`=16|32, `ScriptName`='go_thorim_lever' WHERE `entry`=179148;
UPDATE `gameobject` SET `id`=179148 WHERE `guid`=55194;


DELETE FROM `creature_text` WHERE `entry` IN (33413, 32865, 32872);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(32865, 0, 0, 'Interlopers! You mortals who dare to interfere with my sport will pay... Wait--you...', 14, 0, 100, 0, 0, 15733, 'Thorim SAY_AGGRO_1'),
(32865, 1, 0, 'I remember you... In the mountains... But you... what is this? Where am\-\-', 14, 0, 100, 0, 0, 15734, 'Thorim SAY_AGGRO_2'),
(32865, 2, 0, 'Behold the power of the storms and despair!', 14, 0, 100, 0, 0, 15735, 'Thorim SAY_SPECIAL_1'),
(32865, 2, 1, 'Do not hold back! Destroy them!', 14, 0, 100, 0, 0, 15736, 'Thorim SAY_SPECIAL_2'),
(32865, 2, 2, 'Have you begun to regret your intrusion?', 14, 0, 100, 0, 0, 15737, 'Thorim SAY_SPECIAL_3'),
(32865, 3, 0, 'Impertinent whelps! You dare challenge me atop my pedestal! I will crush you myself!', 14, 0, 100, 0, 0, 15738, 'Thorim SAY_JUMPDOWN'),
(32865, 4, 0, 'Can''t you at least put up a fight!?', 14, 0, 100, 0, 0, 15739, 'Thorim SAY_SLAY_1'),
(32865, 4, 1, 'Pathetic!', 14, 0, 100, 0, 0, 15740, 'Thorim SAY_SLAY_2'),
(32865, 5, 0, 'My patience has reached its limit!', 14, 0, 100, 0, 0, 15741, 'Thorim SAY_BERSERK'),
(32865, 6, 0, 'Failures! Weaklings!', 14, 0, 100, 0, 0, 15742, 'Thorim SAY_WIPE'),
(32865, 7, 0, 'Stay your arms! I yield!', 14, 0, 100, 0, 0, 15743, 'Thorim SAY_DEATH'),
(32865, 8, 0, 'I feel as though I am awakening from a nightmare, but the shadows in this place yet linger.', 14, 0, 100, 0, 0, 15744, 'Thorim SAY_END_NORMAL_1'),
(32865, 8, 1, 'Sif... was Sif here? Impossible\-\-she died by my brother''s hand. A dark nightmare indeed....', 14, 0, 100, 0, 0, 15745, 'Thorim SAY_END_NORMAL_2'),
(32865, 8, 2, 'I need time to reflect.... I will aid your cause if you should require it. I owe you at least that much. Farewell.', 14, 0, 100, 0, 0, 15746, 'Thorim SAY_END_NORMAL_3'),
(32865, 9, 0, 'You! Fiend! You are not my beloved! Be gone!', 14, 0, 100, 0, 0, 15747, 'Thorim SAY_END_HARD_1'),
(32865, 9, 1, 'Behold the hand behind all the evil that has befallen Ulduar! Left my kingdom in ruins, corrupted my brother and slain my wife!', 14, 0, 100, 0, 0, 15748, 'Thorim SAY_END_HARD_2'),
(32865, 9, 2, 'And now it falls to you, champions, to avenge us all! The task before you is great, but I will lend you my aid as I am able. You must prevail!', 14, 0, 100, 0, 0, 15749, 'Thorim SAY_END_HARD_3'),
(32872, 0, 0, 'Runic Colossus surrounds itself with a crackling Runic Barrier!', 41, 0, 100, 0, 0, 0, 'Runic Colossus EMOTE_BARRIER');


-- Thorims trap bunny shouldnt be able to move
-- UPDATE `creature_template` SET `unit_flags`=`unit_flags` |4 WHERE `entry` IN(33054);

UPDATE creature_template SET unit_flags=33685508 WHERE entry=33378;

-- Thorim tunnel adds are spawned via scripts
DELETE FROM `creature` WHERE `id` IN (33110, 32874, 32875);




























-- Auriaya

UPDATE `creature_template` SET `mechanic_immune_mask`=1|2|4|8|16|32|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|67108864|536870912 AND `flags_extra`=1 WHERE `entry` IN (33515, 34175);


-- Full Immunity to Sanctum Sentry and Feral defender BUT needs to be stunned

UPDATE `creature_template` SET `mechanic_immune_mask`=1|2|4|8|16|32|64|256|512|1024|4096|8192|65536|131072|524288|4194304|8388608|67108864|536870912 where `entry` IN (34035, 34171);


-- Auriaya
DELETE FROM `spell_group` WHERE `id`=64381;
DELETE FROM `spell_group_stack_rules` WHERE `group_id`=64381;
INSERT INTO `spell_group` (`id`, `spell_id`) VALUES
(64381, 64381);
INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES
(64381, 1);


-- Auriaya

DELETE FROM `creature_text` WHERE `entry`=33515;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(33515, 0, 0, 'Some things are better left alone!', 14, 0, 100, 0, 0, 15473, 'Auriaya SAY_AGGRO'),
(33515, 1, 0, 'The secret dies with you!', 14, 0, 100, 0, 0, 15474, 'Auriaya SAY_SLAY_1'),
(33515, 1, 1, 'There is no escape!', 14, 0, 100, 0, 0, 15475, 'Auriaya SAY_SLAY_2'),
(33515, 2, 0, 'Auriaya screams in agony.', 14, 0, 100, 0, 0, 15476, 'Auriaya SAY_DEATH'),
(33515, 3, 0, 'You waste my time!', 14, 0, 100, 0, 0, 15477, 'Auriaya SAY_BERSERK'),
(33515, 4, 0, 'Auriaya begins to cast Terrifying Screech.', 41, 0, 100, 0, 0, 0, 'Auriaya - EMOTE_FEAR'),
(33515, 5, 0, 'Auriaya begins to activate the Feral Defender!', 41, 0, 100, 0, 0, 0, 'Auriaya - EMOTE_DEFENDER');

-- Auriaya Sanctum Sentries are spawned via scripts
DELETE FROM `creature` WHERE `id`=34014;
-- correct damage of Sanctum sentries and Feral Defender
-- UPDATE `creature_template` SET `dmg_multiplier` = 7.5 WHERE `entry` IN (34035, 34014);
-- UPDATE `creature_template` SET `dmg_multiplier` = 13 WHERE `entry` IN (34171, 34166);





-- Hodir

-- Hodir
DELETE FROM `creature_text` WHERE `entry`=32845;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(32845, 0, 0, 'You will suffer for this trespass!', 14, 0, 100, 0, 0, 15552, 'Hodir SAY_AGGRO'),
(32845, 1, 0, 'Tragic. To come so far, only to fail.', 14, 0, 100, 0, 0, 15553, 'Hodir SAY_SLAY_1'),
(32845, 1, 1, 'Welcome to the endless winter.', 14, 0, 100, 0, 0, 15554, 'Hodir SAY_SLAY_2'),
(32845, 2, 0, 'Winds of the north consume you!', 14, 0, 100, 0, 0, 15555, 'Hodir SAY_FLASH_FREEZE'),
(32845, 3, 0, 'Hodir roars furious.', 41, 0, 100, 0, 0, 15556, 'Hodir SAY_STALACTITE'),
(32845, 4, 0, 'I... I am released from his grasp... at last.', 14, 0, 100, 0, 0, 15557, 'Hodir SAY_DEATH'),
(32845, 5, 0, 'Enough! This ends now!', 14, 0, 100, 0, 0, 15558, 'Hodir SAY_BERSERK'),
(32845, 6, 0, 'Hodir shatters the Rare Cache of Hodir!', 41, 0, 100, 0, 0, 0, 'Hodir SAY_HARD_MODE_FAILED'),
(32845, 7, 0, 'Hodir begins to cast Flash Freeze!', 41, 0, 100, 0, 0, 0, 'Hodir - EMOTE_FREEZE'),
(32845, 8, 0, 'Hodir gains Frozen Blows!', 41, 0, 100, 0, 0, 0, 'Hodir - EMOTE_BLOW');



-- NPC corrections 

UPDATE creature_template SET ScriptName="npc_hodir_shaman", unit_flags=32768 WHERE entry=32900;

UPDATE creature_template SET ScriptName="npc_hodir_druid" WHERE entry=32901;

-- Cache fix for 25
UPDATE gameobject_template SET flags=16 WHERE entry=194201;


-- Hodir - spawning hardmode caches
DELETE FROM `gameobject` WHERE `id` IN (194200, 194201);
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(194200, 603, 1, 1, 2035.75, -195.046, 432.687, 3.68744, 0, 0, 0.962987, -0.269548, 604800, 255, 1),
(194201, 603, 2, 1, 2035.75, -195.046, 432.687, 3.68744, 0, 0, 0.962987, -0.269548, 604800, 255, 1);


-- Hodir
-- Achievement: Stayin buffed all winter.
-- Moved check to script.
-- 10 man handling.
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10223, 10240, 10241);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES 
(10223, 11, 0, 0, 'achievement_staying_buffed_all_winter'), 
(10223, 12, 0, 0, ''), 
(10240, 11, 0, 0, 'achievement_staying_buffed_all_winter'), 
(10240, 12, 0, 0, ''), 
(10241, 11, 0, 0, 'achievement_staying_buffed_all_winter'), 
(10241, 12, 0, 0, '');

-- 25 man handling.
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10229, 10238, 10239);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES 
(10229, 12, 1, 0, ''), 
(10229, 11, 0, 0, 'achievement_staying_buffed_all_winter_25'), 
(10238, 12, 1, 0, ''), 
(10238, 11, 0, 0, 'achievement_staying_buffed_all_winter_25'), 
(10239, 12, 1, 0, ''), 
(10239, 11, 0, 0, 'achievement_staying_buffed_all_winter_25');



-- Mimiron
DELETE FROM `spell_script_names` WHERE `spell_id`=64623;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(64623, 'spell_frost_bomb');


-- Spell stuff
DELETE FROM `spell_script_names` WHERE `spell_id` IN (63382, 63016, 63027);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(63382, 'spell_rapid_burst');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(63027, 'spell_proximity_mines');


-- Achievement "Firefighter" (3180 / 3189)
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10450, 10463);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES 
(10450, 12, 0, 0, ''), 
(10450, 11, 0, 0, 'achievement_firefighter'), 
(10463, 12, 1, 0, ''), 
(10463, 11, 0, 0, 'achievement_firefighter_25');


-- First gameobject for the tram from inner sanctuary -> Mimiron.
UPDATE `gameobject_template` SET `flags`=32, `data2`=3000, `ScriptName`='go_call_tram' WHERE `entry` IN (194914, 194912, 194437);
DELETE FROM `gameobject` WHERE id=194437;
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(194437, 603, 3, 1, 2306.87, 274.237, 424.288, 1.52255, 0, 0, 0.689847, 0.723956, 300, 0, 1);


UPDATE gameobject SET spawnMask=3 WHERE guid=1337040 AND id=194438;










-- Bandera 3


-- Mimiron Tram

DELETE FROM gameobject_template WHERE entry = '194438';
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `VerifiedBuild`) VALUES
('194438','1','8504','Activate Tram','','','','0','32','1','0','0','0','0','0','0','0','0','3000','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','go_call_tram','11159');

DELETE FROM gameobject WHERE id = '194438';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(194438, 603, 1,1,2306.99, 2589.35, 424.382, 4.71676, 0, 0, 0.705559, -0.708651, 300, 0, 1);

-- Mimirion
UPDATE `creature_template` SET `ScriptName`='boss_mimiron' WHERE `entry`=33350;
-- Leviathan MKII
UPDATE `creature_template` SET `vehicleid`=370, `ScriptName`='boss_leviathan_mk' WHERE `entry`=33432;
UPDATE `creature_template` SET `vehicleid`=370, `flags_extra`=`flags_extra` |1 WHERE `entry`=34106;
UPDATE `creature` SET `spawntimesecs`=604800 WHERE `id`=33236;
-- Leviathan MKII Turret
UPDATE `creature_template` SET `ScriptName`='boss_leviathan_mk_turret' WHERE `entry`=34071;
DELETE FROM `vehicle_template_accessory` WHERE `entry`=33432;
INSERT INTO `vehicle_template_accessory` VALUES
(33432, 34071, 3, 1, 'Leviathan Mk II turret', 8, 0);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=33432;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(33432, 46598, 1, 0);
-- Leviathan skills and skill-helper
UPDATE `creature_template` SET `ScriptName`='npc_proximity_mine' WHERE `entry`=34362;
UPDATE `creature_model_info` SET `bounding_radius`=0.5, `combat_reach`=7 WHERE `modelid` IN (28831, 28841, 28979);

-- VX-001
UPDATE `creature_template` SET `flags_extra`=`flags_extra` |1, `vehicleid`=371, `ScriptName`='boss_vx_001' WHERE `entry`=33651;
UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83, `flags_extra`=`flags_extra` |1 WHERE `entry`=34108;
UPDATE `creature_template` SET `faction`=35, `faction`=35 WHERE `entry`=34050;
UPDATE `creature_template` SET `unit_flags`=4|512|131072|33554432, `flags_extra`=`flags_extra` |2 WHERE `entry`=34211;
UPDATE `creature_template` SET `ScriptName`='npc_rocket_strike' WHERE `entry`=34047;

-- Aerial Command Unit
UPDATE `creature_template` SET `flags_extra`=`flags_extra` |1, `ScriptName`='boss_aerial_unit', `vehicleid`=372 WHERE `entry`=33670;
UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83, `flags_extra`=1 WHERE `entry`=34109;
UPDATE `creature_template` SET `ScriptName`='npc_magnetic_core' WHERE `entry`=34068;
UPDATE `creature_template` SET `ScriptName`='npc_assault_bot' WHERE `entry`=34057;
UPDATE `creature_template` SET `difficulty_entry_1`=34148, `ScriptName`='npc_emergency_bot' WHERE `entry`=34147;

-- HardMode
UPDATE `gameobject_template` SET `flags`=`flags` &~16, `ScriptName`='go_mimiron_hard_mode_activator' WHERE `entry`=194739;
UPDATE `creature_template` SET `difficulty_entry_1`=34361, `ScriptName`='npc_frost_bomb' WHERE `entry`=34149;
UPDATE `creature_template` SET `speed_walk`=0.07, `speed_run`=0.07, unit_flags=0,`ScriptName`='npc_mimiron_flame_trigger' WHERE `entry` =34363;
UPDATE `creature_template` SET `ScriptName`='npc_mimiron_flame_spread' WHERE `entry`=34121;
UPDATE `creature_template` SET `ScriptName`='npc_mimiron_bomb_bot' WHERE `entry`=33836;
UPDATE `creature_template` SET `ScriptName`='npc_boomer_xp' WHERE `entry`=34192;

-- Cleaning up Leviathan Mk II
DELETE FROM `creature` WHERE `id`=34071;
UPDATE `creature_template` SET `unit_flags`=`unit_flags` |2|33554432 WHERE `entry`=34143;

UPDATE creature SET SpawnMask=3 WHERE id=34143;


DELETE FROM `creature_text` WHERE `entry`=33350;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(33350, 0, 0, 'Oh, my! I wasn''t expecting company! The workshop is such a mess! How embarrassing!', 14, 0, 100, 0, 0, 15611, 'Mimiron SAY_AGGRO'),
(33350, 1, 0, 'Now why would you go and do something like that? Didn''t you see the sign that said ''DO NOT PUSH THIS BUTTON!''? How will we finish testing with the self-destruct mechanism active?', 14, 0, 100, 0, 0, 15629, 'Mimiron SAY_HARDMODE_ON'),
(33350, 2, 0, 'We haven''t much time, friends! You''re going to help me test out my latest and greatest creation. Now, before you change your minds, remember, that you kind of owe it to me after the mess you made with the XT-002.', 14, 0, 100, 0, 0, 15612, 'Mimiron SAY_MKII_ACTIVATE'),
(33350, 3, 0, 'MEDIC!', 14, 0, 100, 0, 0, 15613, 'Mimiron SAY_MKII_SLAY_1'),
(33350, 3, 1, 'I can fix that... or, maybe not! Sheesh, what a mess...', 14, 0, 100, 0, 0, 15614, 'Mimiron SAY_MKII_SLAY_2'),
(33350, 4, 0, 'WONDERFUL! Positively marvelous results! Hull integrity at 98.9 percent! Barely a dent! Moving right along.', 14, 0, 100, 0, 0, 15615, 'Mimiron SAY_MKII_DEATH'),
(33350, 5, 0, 'Behold the VX-001 Anti-personnel Assault Cannon! You might want to take cover.', 14, 0, 100, 0, 0, 15616, 'Mimiron SAY_VX001_ACTIVATE'),
(33350, 6, 0, 'Fascinating. I think they call that a "clean kill".', 14, 0, 100, 0, 0, 15617, 'Mimiron SAY_VX001_SLAY_1'),
(33350, 6, 1, 'Note to self: Cannon highly effective against flesh.', 14, 0, 100, 0, 0, 15618, 'Mimiron SAY_VX001_SLAY_2'),
(33350, 7, 0, 'Thank you, friends! Your efforts have yielded some fantastic data! Now, where did I put- oh, there it is!', 14, 0, 100, 0, 0, 15619, 'Mimiron SAY_VX001_DEATH'),
(33350, 8, 0, 'Isn''t it beautiful? I call it the magnificent aerial command unit!', 14, 0, 100, 0, 0, 15620, 'Mimiron SAY_AERIAL_ACTIVATE'),
(33350, 9, 0, 'Outplayed!', 14, 0, 100, 0, 0, 15621, 'Mimiron SAY_AERIAL_SLAY_1'),
(33350, 9, 1, 'You can do better than that!', 14, 0, 100, 0, 0, 15622, 'Mimiron SAY_AERIAL_SLAY_2'),
(33350, 10, 0, 'Preliminary testing phase complete. Now comes the true test!!', 14, 0, 100, 0, 0, 15623, 'Mimiron SAY_AERIAL_DEATH'),
(33350, 11, 0, 'Gaze upon its magnificence! Bask in its glorious, um, glory! I present you... V-07-TR-0N!', 14, 0, 100, 0, 0, 15624, 'Mimiron SAY_V07TRON_ACTIVATE'),
(33350, 12, 0, 'Prognosis: Negative!', 14, 0, 100, 0, 0, 15625, 'Mimiron SAY_V07TRON_SLAY_1'),
(33350, 12, 1, 'You''re not going to get up from that one, friend.', 14, 0, 100, 0, 0, 15626, 'Mimiron SAY_V07TRON_SLAY_2'),
(33350, 13, 0, 'It would appear that I''ve made a slight miscalculation. I allowed my mind to be corrupted by the fiend in the prison, overriding my primary directive. All systems seem to be functional now. Clear.', 14, 0, 100, 0, 0, 15627, 'Mimiron SAY_V07TRON_DEATH'),
(33350, 14, 0, 'Oh, my! It would seem that we are out of time, my friends!', 14, 0, 100, 0, 0, 15628, 'Mimiron SAY_BERSERK');



-- Mimirons Inferno Bunny - it should walk around.
DELETE FROM `waypoints` WHERE `entry`=33370;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(33370, 1, 266.689, -33.391, 409.99, 'Mimirons Inferno - Waypoint of dummy'),
(33370, 2, 379.158, -33.318, 409.81, 'Mimirons Inferno - Waypoint of dummy 2'),
(33370, 3, 266.611, -133.387, 409.81, 'Mimirons Inferno - Waypoint of dummy 3'),
(33370, 4, 158.411, -33.311, 409.81, 'Mimirons Inferno - Waypoint of dummy 4'),
(33370, 5, 266.699, 66.632, 409.81, 'Mimirons Inferno - Waypoint of dummy 5');












-- BANDERA 4





-- Creature Template Addon Entries
DELETE FROM `creature_template_addon` WHERE `entry` IN (33235,33956,33957,33874,33880,34011,33878,33877,33879,34032,33761,33861,33862,33876,34070);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(33235, 0, 0x0, 0x1, ''), -- 33235
(33956, 0, 0x0, 0x1, ''), -- 33956
(33957, 0, 0x0, 0x1, ''), -- 33957
(33874, 0, 0x0, 0x1, ''), -- 33874
(33880, 0, 0x3000000, 0x1, ''), -- 33880
(34011, 0, 0x3000000, 0x1, ''), -- 34011
(33878, 0, 0x3000000, 0x1, ''), -- 33878
(33877, 0, 0x3000000, 0x1, ''), -- 33877
(33879, 0, 0x3000000, 0x1, ''), -- 33879
(34032, 0, 0x3000000, 0x1, ''), -- 34032
(33761, 0, 0x3000000, 0x1, ''), -- 33761
(33861, 0, 0x3000000, 0x1, ''), -- 33861
(33862, 0, 0x3000000, 0x1, ''), -- 33862
(33876, 0, 0x3000000, 0x1, ''), -- 33876
(34070, 0, 0x3000000, 0x1, ''); -- 34070

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (33880,34011,33878,33877,33879,34032,33761,33861,33862,33876,34070,33874);



-- Model correction for the Archivum System.
UPDATE creature_template SET modelid1=11686, modelid2=0 WHERE entry=33874;








-- Mimiron
-- Aerial Unit Control
UPDATE creature_template SET InhabitType=4 WHERE entry IN(33670,34109);


-- Computer
DELETE from creature WHERE id=34143;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (200192, 34143, 603, 3, 1, 0, 0, 2742.95, 2568.09, 364.314, 0.303723, 300, 0, 0, 4121, 0, 0, 0, 0, 0);

-- Al final lo controlas a través del comienzo.
-- UPDATE `creature_template` SET `ScriptName` = 'npc_mimiron_computer' WHERE `entry` = 34143;

DELETE FROM `creature_text` WHERE `entry` = 34143;
INSERT INTO `creature_text` (`entry`, `groupid`, `text`, `type`, `probability`, `sound`) VALUES 
(34143, 0, 'Self-destruct sequence initiated.', 14, 100, 15413),
(34143, 1, 'Self-destruct sequence terminated. Override code A905..', 14, 100, 15414),
(34143, 2, 'This area will self-destruct in ten minutes.', 14, 100, 15415),
(34143, 3, 'This area will self-destruct in nine minutes.', 14, 100, 15416),
(34143, 4, 'This area will self-destruct in eight minutes.', 14, 100, 15417),
(34143, 5, 'This area will self-destruct in seven minutes.', 14, 100, 15418),
(34143, 6, 'This area will self-destruct in six minutes.', 14, 100, 15419),
(34143, 7, 'This area will self-destruct in five minutes.', 14, 100, 15420),
(34143, 8, 'This area will self-destruct in four minutes.', 14, 100, 15421),
(34143, 9, 'This area will self-destruct in three minutes.', 14, 100, 15422),
(34143, 10, 'This area will self-destruct in two minutes.', 14, 100, 15423),
(34143, 11, 'This area will self-destruct in one minute.', 14, 100, 15424),
(34143, 12, 'Self-destruct sequence finalized. Have a nice day.', 14, 100, 15425);


UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128|2  WHERE `entry` IN (34143);



-- Frost bomb correction, this way it will affect to the players (explosion)

UPDATE creature_template SET faction=16, faction=16 WHERE entry IN(34361,34149);


-- Emergency fire bot

UPDATE creature_template SET faction=16, faction=16 WHERE entry IN(34147, 34148);



-- Frost bomb condition. Asegurarte Laser Barrage y Spinning up: SELECT * FROM conditions where sourceentry IN(63274,66490,63300, 63414)

DELETE FROM conditions WHERE sourceentry=64623;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 64623, 0, 0, 31, 0, 3, 34363, 0, 0, 0, 0, '', 'Frost Bomb EFFECT_0 can only hit NPC_FLAME'),
(13, 1, 64623, 0, 1, 31, 0, 3, 34121, 0, 0, 0, 0, '', 'Frost Bomb EFFECT_0 can only hit NPC_FLAME_SPREAD');









-- Ancient Gate of the Keepers

UPDATE gameobject_template SET flags=30 WHERE entry=194255;



-- Freya - Sun bean 

-- UPDATE creature_template SET flags_extra=128 WHERE entry IN(33170, 33402);








-- BANDERA 5






-- Spell difficulties  ACORDARTE DE SPELLS COMO UNSTABLE SUNBEAN (LO QUE CASTEA EL NPC) ACORDARTE DE CORREGIR LA VIDA DE TODOS LOS NPCS, ALGUNOS TIENEN MUY POCA COMO LOS DE FREYA.

DELETE FROM spelldifficulty_dbc WHERE id IN(62623, 62437, 62648, 62649, 62451, 64587);
INSERT INTO `spelldifficulty_dbc` (`id`, `spellid0`, `spellid1`, `spellid2`, `spellid3`) VALUES 
-- Freya 

(62623, 62623, 62872, 0, 0), -- Sunbeam
(62437, 62437, 62859, 0, 0), -- Ground Tremor

-- Storm Lasher
(62648, 62648, 62939, 0, 0), -- Lightning Slash
(62649, 62649, 62938, 0, 0), -- Stormbolt 

-- Sun Beam
(62451, 62451, 62865, 0, 0), -- Unstable Energy

-- Nature Bomb
(64587, 64587, 64650, 0, 0) -- Nature Bomb
;


-- Elders essence spells.
DELETE FROM conditions WHERE SourceEntry IN(62386, 62387, 62385, 62483, 62484, 62485) AND SourceTypeOrReferenceId=13;
INSERT INTO conditions VALUES(13, 5, 62386, 0, 0, 31, 0, 3, 32906, 0, 0, 0, 0, '', 'Stonebark essence');
INSERT INTO conditions VALUES(13, 3, 62387, 0, 0, 31, 0, 3, 32906, 0, 0, 0, 0, '', 'Ironbranch essence');
INSERT INTO conditions VALUES(13, 3, 62385, 0, 0, 31, 0, 3, 32906, 0, 0, 0, 0, '', 'Brightleaf essence');
INSERT INTO conditions VALUES(13, 1, 62483, 0, 0, 31, 0, 3, 32906, 0, 0, 0, 0, '', 'Stonebark essence BASE');
INSERT INTO conditions VALUES(13, 1, 62484, 0, 0, 31, 0, 3, 32906, 0, 0, 0, 0, '', 'Ironbranch essence BASE');
INSERT INTO conditions VALUES(13, 1, 62485, 0, 0, 31, 0, 3, 32906, 0, 0, 0, 0, '', 'Brightleaf essence BASE');




-- Vezax

-- Aura of Despair complete Effects:

DELETE FROM spell_script_names where spell_id=62692;
INSERT INTO spell_script_names(spell_id, scriptname) VALUES(62692, "spell_aura_of_despair_aura");









-- Yogg Saron
-- Unbound Fragment of Val'anyr

DELETE FROM conditions WHERE SourceEntry=45897;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (1, 33955, 45897, 0, 0, 9, 0, 13629, 0, 0, 0, 0, 0, '', NULL);


-- Trigger invisibility correction.

UPDATE creature_template SET flags_extra=128 WHERE entry=33292;

UPDATE creature_template SET flags_extra=128 WHERE entry=33991;

UPDATE creature_template SET modelid1=17612, modelid2=0, ScriptName="npc_death_ray" WHERE entry=33881;

UPDATE creature_template SET modelid1=15880, modelid2=0 WHERE entry=33990;


UPDATE creature_template SET modelid1=15294, modelid2=0 WHERE entry=33280;


UPDATE creature_template SET modelid1=1126, modelid2=0, flags_extra=128 WHERE entry=33882;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (63802);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(63802,'spell_brain_link_periodic_dummy');



-- One more Ominous cloud:

INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33280, 0, 0, 33292, 1956.512329, 13.312986, 328.301849, 0, 6, 0);


-- Algalon trigger controller (distance)

-- INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (241905, 22515, 603, 3, 1, 0, 0, 1632.29, -309.275, 417.321, 2.85147, 300, 0, 0, 4121, 0, 0, 0, 0, 0);











INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5887907, 22517, 571, 1, 1, 0, 0, 5710.91, 645.5, 656.867, 0.540897, 300, 0, 0, 57, 0, 0, 0, 33554432, 0);





-- Flame Leviathan
-- Ulduar Texts
-- Flame Leviathan
DELETE FROM `creature_text` WHERE `entry`=33113;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(33113, 0, 0, 'Hostile entities detected. Threat assessment protocol active. Primary target engaged. Time minus thirty seconds to re-evaluation.', 14, 0, 0, 0, 0, 15506, 'Flame Leviathan SAY_AGGRO'),
(33113, 1, 0, 'Threat assessment routine modified. Current target threat level: zero. Acquiring new target.', 14, 0, 0, 0, 0, 15521, 'Flame Leviathan SAY_SLAY'),
(33113, 2, 0, 'Total systems failure. Defense protocols breached. Leviathan Unit shutting down.', 14, 0, 0, 0, 0, 15520, 'Flame Leviathan SAY_DEATH'),
(33113, 3, 0, 'Threat re-evaluated. Target assessment complete. Changing course.', 14, 0, 0, 0, 0, 15507, 'Flame Leviathan SAY_TARGET_1'),
(33113, 3, 1, 'Pursuit objective modified. Changing course.', 14, 0, 0, 0, 0, 15508, 'Flame Leviathan SAY_TARGET_2'),
(33113, 3, 2, 'Hostile entity stratagem predicted. Rerouting battle function. Changing course.', 14, 0, 0, 0, 0, 15509, 'Flame Leviathan SAY_TARGET_3'),
(33113, 4, 0, 'Orbital countermeasures enabled.', 14, 0, 0, 0, 0, 15510, 'Flame Leviathan SAY_HARDMODE'),
(33113, 5, 0, 'Alert! Static defense system failure. Orbital countermeasures disabled.', 14, 0, 0, 0, 0, 15511, 'Flame Leviathan SAY_TOWER_NONE'),
(33113, 6, 0, '''Hodir''s Fury'' online. Acquiring target.', 14, 0, 0, 0, 0, 15512, 'Flame Leviathan SAY_TOWER_FROST'),
(33113, 7, 0, '''Mimiron''s Inferno'' online. Acquiring target.', 14, 0, 0, 0, 0, 15513, 'Flame Leviathan SAY_TOWER_FLAME'),
(33113, 8, 0, '''Freya''s Ward'' online. Acquiring target.', 14, 0, 0, 0, 0, 15514, 'Flame Leviathan SAY_TOWER_NATURE'),
(33113, 9, 0, '''Thorim''s Hammer'' online. Acquiring target.', 14, 0, 0, 0, 0, 15515, 'Flame Leviathan SAY_TOWER_STORM'),
(33113, 10, 0, 'Unauthorized entity attempting circuit overload. Activating anti-personnel countermeasures.', 14, 0, 0, 0, 0, 15516, 'Flame Leviathan SAY_PLAYER_RIDING'),
(33113, 11, 0, 'System malfunction. Diverting power to support systems.', 14, 0, 0, 0, 0, 15517, 'Flame Leviathan SAY_OVERLOAD_1'),
(33113, 11, 1, 'Combat matrix overload. Powering do-o-o-own...', 14, 0, 0, 0, 0, 15518, 'Flame Leviathan SAY_OVERLOAD_2'),
(33113, 11, 2, 'System restart required. Deactivating weapon systems.', 14, 0, 0, 0, 0, 15519, 'Flame Leviathan SAY_OVERLOAD_3'),
(33113, 12, 0, 'Flame Leviathan pursues $N', 41, 0, 0, 0, 0, 0, 'Flame Leviathan EMOTE_PURSUE'),
(33113, 13, 0, 'Flame Leviathan''s circuits overloaded.', 41, 0, 0, 0, 0, 0, 'Flame Leviathan EMOTE_OVERLOAD'),
(33113, 14, 0, 'Automatic repair sequence initiated.', 41, 0, 0, 0, 0, 0, 'Flame Leviathan EMOTE_REPAIR');


















-- This spell break the ice tomb of SPELL_HODIRS_FURY
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(65044, 'spell_leviathan_blaze_flames_effect');


UPDATE creature_template SET speed_walk=1.4, speed_run=1.4 WHERE entry=33212;

-- PENDIENTE: QUITAR SPELLS QUE NO FUNCIONEN 

-- Turrets Leviathan

UPDATE vehicle_template_accessory SET accessory_entry=33142 WHERE entry=33113 AND seat_id=2;
UPDATE vehicle_template_accessory SET accessory_entry=33142 WHERE entry=33113 AND seat_id=3;




-- Lashers

UPDATE creature_template SET scriptname="npc_freya_ward_summon" WHERE entry=33387;



UPDATE creature_template SET HealthModifier=1700 WHERE entry IN(33139,34111);



-- Orbs (Hard Mode) HODIR ONLY.

UPDATE creature_template SET scale=5 WHERE entry=33108;




-- Ignis

-- Ignis Flame_Jets target filtering
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62680, 63472);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(62680, 'spell_ignis_flame_jets'),
(63472, 'spell_ignis_flame_jets');

-- Ignis Activate Construct targeting
DELETE FROM `spell_script_names` WHERE `spell_id`=62488;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(62488, 'spell_ignis_activate_construct');


-- Iron Constructs 25

UPDATE creature_template SET unit_flags=33554688 WHERE entry=33191;

-- Iron Constructs spawned via core script:

DELETE FROM creature WHERE id=33121;


-- Brittle Correction.
INSERT INTO `spelldifficulty_dbc` (`id`, `spellid0`, `spellid1`, `spellid2`, `spellid3`) VALUES (67114, 67114, 62382, 0, 0);




-- Magma rager's Superheated Winds
UPDATE creature_template SET modelid1=11686, modelid2=0, speed_walk=1.3, speed_run=1.3 WHERE entry=34194;









-- Bandera 6





-- Razorscale

UPDATE creature_template SET InhabitType=4 WHERE entry IN(33186, 33724);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (100000, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Mole machine controller', '', NULL, 0, 60, 60, 0, 114, 0, 1, 0.99206, 1, 0, 0, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 130, 'npc_mole_machine_controller', 12340);


-- XT-002 Toy pile corrections, in order to not have them stucked.

DELETE FROM creature WHERE id=33337;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (136256, 33337, 603, 3, 1, 11686, 0, 889.43, 43.5047, 409.803, 3.92699, 180, 5, 0, 12600, 0, 1, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (136257, 33337, 603, 3, 1, 11686, 0, 889.496, -74.24, 409.803, 2.23402, 180, 5, 0, 12600, 0, 1, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (136258, 33337, 603, 3, 1, 11686, 0, 804.772, -75.485, 409.803, 0.909107, 180, 5, 0, 12600, 0, 1, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (136259, 33337, 603, 3, 1, 11686, 0, 803.828, 48.87, 409.803, 5.20108, 180, 5, 0, 12600, 0, 1, 0, 0, 0);








-- Thorim Pre-Adds model corrections.

DELETE FROM creature_template where entry IN(32908, 32907, 33150, 33151);

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (32907, 33150, 0, 0, 0, 0, 21314, 21313, 0, 0, 'Captured Mercenary Captain', '', '', 0, 80, 80, 2, 1692, 0, 1, 1.14286, 1, 1, 0, 2000, 0, 2, 32768, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 45, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_thorim_pre_phase_add', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (32908, 33151, 0, 0, 0, 0, 21308, 21311, 0, 0, 'Captured Mercenary Captain', '', '', 0, 80, 80, 2, 1692, 0, 1, 1.14286, 1, 1, 0, 2000, 0, 2, 32768, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 15, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_thorim_pre_phase_add', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (33150, 0, 0, 0, 0, 0, 21314, 21313, 0, 0, 'Captured Mercenary Captain (1)', '', '', 0, 80, 80, 2, 1692, 0, 1, 1.14286, 1, 1, 0, 2000, 0, 2, 32768, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 45, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (33151, 0, 0, 0, 0, 0, 21308, 21311, 0, 0, 'Captured Mercenary Captain (1)', '', '', 0, 80, 80, 2, 1692, 0, 1, 1.14286, 1, 1, 0, 2000, 0, 2, 32768, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 60, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '', 12340);






-- Door managements.

-- Kologan and Archivum doors.
UPDATE gameobject SET state=1 WHERE id=194553;
UPDATE gameobject SET state=1 WHERE id=194556;

UPDATE gameobject_template SET data0=1 WHERE entry=194556; -- Archivum











-- Starting with Loot corrections (need a lot of work yet)

-- Thorim (no need to add custom lootmode, hardmode cache is spawned only when it should)
UPDATE `gameobject_loot_template` SET `lootmode`=1 WHERE `entry` IN (26955, 26956, 27074);

-- Yogg-saron 10m loot
DELETE FROM `creature_loot_template` WHERE `entry`=33288;
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES
(33288, 1, 100, 1, 0, 34375, 1),
(33288, 47241, 100, 1, 0, 1, 1),
(33288, 2, 100, 1, 0, 12034, 1),
(33288, 3, 100, 2, 0, 34349, 1),
(33288, 4, 100, 4, 0, 34350, 1),
(33288, 5, 10, 4, 0, 34154, 1),
(33288, 46097, 0, 8, 1, 1, 1),
(33288, 46096, 0, 8, 1, 1, 1),
(33288, 46095, 0, 8, 1, 1, 1),
(33288, 46068, 0, 8, 1, 1, 1),
(33288, 7, 100, 8, 0, 34154, 1),
(33288, 6, 100, 8, 0, 34349, 1),
(33288, 46067, 0, 8, 1, 1, 1),
(33288, 46312, 100, 16, 0, 1, 1);

-- Yogg-saron 25m loot
DELETE FROM `creature_loot_template` WHERE `entry`=33955;
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES
(33955, 1, 100, 1, 0, 34376, 2),
(33955, 47241, 100, 1, 0, 1, 1),
(33955, 4, 10, 1, 0, 34154, 1),
(33955, 2, 100, 1, 0, 12035, 2),
(33955, 3, 10, 1, 0, 34350, 1),
(33955, 5, 100, 2, 0, 34349, 1),
(33955, 6, 100, 4, 0, 34350, 1),
(33955, 45537, 0, 8, 1, 1, 1),
(33955, 45536, 0, 8, 1, 1, 1),
(33955, 45535, 0, 8, 1, 1, 1),
(33955, 45534, 0, 8, 1, 1, 1),
(33955, 8, 100, 8, 0, 34154, 1),
(33955, 7, 100, 8, 0, 34349, 1),
(33955, 45533, 0, 8, 1, 1, 1),
(33955, 45693, 100, 16, 0, 1, 1),
(33955, 45897, 100, 32, 0, 1, 1); -- Unbound Fragment of the Val'Anyr

-- Algalon's Sack of Ulduar Spoils (10m)
DELETE FROM `creature_loot_template` WHERE `entry`=45875;
DELETE FROM `item_loot_template` WHERE `entry`=45875;
INSERT INTO `item_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES
(45875, 45087, 100, 1, 0, 1, 1),
(45875, 45624, 100, 1, 0, 5, 5); -- Already Emblem of Conquest



UPDATE `creature_loot_template` SET `lootmode`=1 WHERE `entry` IN (33885, 33293, 33449, 33271) AND `lootmode`=3;



-- XT002 Deconstructor
DELETE FROM `creature_loot_template` WHERE `item`>=45442 AND `item`<=45446 AND `entry`=33293;
DELETE FROM `reference_loot_template` WHERE `item`>=45867 AND `item`<=45871 AND `entry`=34357;
DELETE FROM `creature_loot_template` WHERE `item`>=45867 AND `item`<=45871 AND `entry`=33293;
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`) VALUES
(33293, 45867, 0, 2, 1),
(33293, 45868, 0, 2, 1),
(33293, 45869, 0, 2, 1),
(33293, 45870, 0, 2, 1),
(33293, 45871, 0, 2, 1);

-- Assembly of Iron - Steelbreaker
UPDATE `creature_loot_template` SET `item`=45455 WHERE `item`=25455 AND `entry`=32867;
UPDATE `creature_loot_template` SET `lootmode`=2 WHERE `entry`=32867 AND `item` IN (45447, 45448, 45449, 45456, 45455);
UPDATE `creature_loot_template` SET `lootmode`=2 WHERE `entry`=33693 AND `item` IN (45241, 45242, 45243, 45244, 45245, 45607);



-- Removing Val'Anyr fragments from 10 HardMode

DELETE FROM gameobject_loot_template WHERE entry=27081 AND item=45038;



-- Ulduar Hard Mode's sigils from quests.


-- 10 man:

-- Quest:Hodir's sigil: 13609
-- Item: Hodir's sigil: 45786 
-- GO_HODIR_RARE_CACHE_OF_WINTER = 194200


-- Hodir 10 player sigil conditions

DELETE FROM gameobject_loot_template WHERE item=45786;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (27069, 45786, 100, 1, 0, 1, 1);

DELETE FROM conditions WHERE sourceentry=45786 AND sourceGroup=27069;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(4, 27069, 45786, 0, 0, 9, 0, 13609, 0, 0, 0, 0, 0, '', NULL);



-- Quest: Freya's sigil: 13606
-- Item: Freya's sigil:  45788
-- En teoría, el Chest es: 194327  lootid 27081


-- Freya 10 player sigil conditions

DELETE FROM gameobject_loot_template WHERE item=45788;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (27081, 45788, 100, 1, 0, 1, 1);

DELETE FROM conditions WHERE sourceentry=45788 AND sourceGroup=27081;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(4, 27081, 45788, 0, 0, 9, 0, 13606, 0, 0, 0, 0, 0, '', NULL);




-- Quest: Thorim's sigil: 13610
-- Item: Thorim's sigil: 45784
-- CACHE_OF_STORMS_HARDMODE_10 = 194313 lootid 27074


-- Thorim 10 player sigil conditions

DELETE FROM gameobject_loot_template WHERE item=45784;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (27074, 45784, 100, 1, 0, 1, 1);

DELETE FROM conditions WHERE sourceentry=45784 AND sourceGroup=27074;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(4, 27074, 45784, 0, 0, 9, 0, 13610, 0, 0, 0, 0, 0, '', NULL);





-- Quest: Mimiron's sigil: 13611
-- Item: Mimiron's sigil: 45787
-- CACHE_OF_INNOVATION_HARDMODE_10 = 194957,


-- Mimiron 10 player sigil conditions

DELETE FROM gameobject_loot_template WHERE item=45787;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (27086, 45787, 100, 1, 0, 1, 1);

DELETE FROM conditions WHERE sourceentry=45787 AND sourceGroup=27086;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(4, 27086, 45787, 0, 0, 9, 0, 13611, 0, 0, 0, 0, 0, '', NULL);






-- 25 man:



-- Quest: Heroic: Hodir's sigil: 13822

-- Item: Hodir's sigil: 45815

-- GO_HODIR_RARE_CACHE_OF_WINTER_HERO = 194201 lootid 26950


DELETE FROM gameobject_loot_template WHERE item=45815;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (26950, 45815, 100, 1, 0, 1, 1);

DELETE FROM conditions WHERE sourceentry=45815 AND sourceGroup=26950;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(4, 26950, 45815, 0, 0, 9, 0, 13822, 0, 0, 0, 0, 0, '', NULL);



-- Quest: Heroic: Freya's sigil: 13821
-- Item: Freya's sigil: 45814
-- Freya Summon: 194331 chest. loot id 26962


DELETE FROM gameobject_loot_template WHERE item=45814;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (26962, 45814, 100, 1, 0, 1, 1);

DELETE FROM conditions WHERE sourceentry=45814 AND sourceGroup=26962;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(4, 26962, 45814, 0, 0, 9, 0, 13821, 0, 0, 0, 0, 0, '', NULL);




-- Quest: Heroic: Thorim's sigil: 13823
-- Item: Thorim's sigil: 45817
-- CACHE_OF_STORMS_HARDMODE_25 = 194314 loot id 26955



DELETE FROM gameobject_loot_template WHERE item=45817;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (26955, 45817, 100, 1, 0, 1, 1);

DELETE FROM conditions WHERE sourceentry=45817 AND sourceGroup=26955;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(4, 26955, 45817, 0, 0, 9, 0, 13823, 0, 0, 0, 0, 0, '', NULL);




-- Quest: Heroic: Mimiron's Sigil: 13824
-- Item: Mimiron's sigil: 45816
-- CACHE_OF_INNOVATION_HARDMODE_25 = 194958 loot id 26967


DELETE FROM gameobject_loot_template WHERE item=45816;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (26967, 45816, 100, 1, 0, 1, 1);

DELETE FROM conditions WHERE sourceentry=45816 AND sourceGroup=26967;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(4, 26967, 45816, 0, 0, 9, 0, 13824, 0, 0, 0, 0, 0, '', NULL);





UPDATE creature_template SET modelid1=26753, modelid2=26753 WHERE entry IN(34004, 34005);










-- BANDERA 7








-- Vehicles will be spawned via core, Brann or Norgannon, it does depend on the mode what the players choses.

DELETE FROM creature WHERE id IN(33060, 33062, 33109);





-- Thorim stormhammer triggering deafening thunder, temporary.
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62042;






-- Vezax's elementals, increase the spawn time.

UPDATE creature SET spawntimesecs=6000000 WHERE id=33838;



-- Freya's sun beams.

UPDATE creature_template SET flags_extra=0 WHERE entry IN(33170, 33402);


-- Scrapbots speed corrections

UPDATE creature_template SET speed_walk=0.3, speed_run=0.3 WHERE entry IN(33343, 33887);

-- Scrapbots speed corrections

UPDATE creature_template SET speed_walk=0.7, speed_run=0.7 WHERE entry IN(33346, 33886);




-- Auriaya speed.

UPDATE creature_template SET speed_walk=1.4, speed_run=1 WHERE entry IN(33515, 34175);





-- Bosses immunities inmunidades full mask agregar flag extra 524288 - CREATURE_FLAG_EXTRA_TAUNT_DIMINISH

UPDATE `creature_template` SET `mechanic_immune_mask`=1|2|4|8|16|32|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912, `flags_extra`=1 WHERE `entry` IN (
33113, 34003, -- Flame Leviathan
33118, 33190, -- Ignis the Furnace Master
33186, 33724, -- Razorscale
33293, 33885, -- XT002
32867, 33693, -- Steelbreaker
32927, 33692, -- Runemaster Molgeim
32930, 33909, -- Kologarn
32906, 33360, -- Freya
32845, 32846, -- Hodir
33350,        -- Mimiron
33432, 34106, -- Leviathan MK II
34071,        -- Leviathan MK II turret
33651, 34108, -- VX-001
33670, 34109, -- Aerial Unit
32865, 33147, -- Thorim
33271, 33449, -- General Vezax
33524, 34152, -- Saronite Animus
33288, 33955, -- Yogg-Saron
33134, 34332, -- Sara
33890, 33954, -- Brain of Yogg-Saron
32871, 33070, -- Algalon
33052, 33116, -- Living Constellations

33228, 33385,  -- Eonar's Gift.

33988, 33989,   -- Immortal Guardian, Yogg Saron.
 
34197, 34226,    -- Chamber overseer.

32914, 33393, -- Elders from Freya.
32913, 33392, 
32915, 33391
);

-- Storm Tempered Keepers
UPDATE `creature_template` SET `mechanic_immune_mask`=1|2|4|8|16|32|64|256|512|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (
33699, 33700, 33722, 33723,  -- Storm Tempered Keepers
33715, 33756 -- Charged spheres
);



-- Remove the Vezax and Immortal Guardian immunity to Interrupt.
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` & ~33554432 WHERE `entry` IN (33271, 33449, 33988, 33989);

DELETE FROM spell_linked_spell WHERE spell_trigger=63277;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (63277, 65269, 2, 'Shadow Crash, apply haste and mana reduction.');



-- General Vezax

DELETE FROM `creature_text` WHERE `entry` IN (33271, 33488);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(33271, 0, 0, 'Your destruction will herald a new age of suffering!', 14, 0, 100, 0, 0, 15542, 'General Vezax SAY_AGGRO'),
(33271, 1, 0, 'You thought to stand before the legions of death... and survive?', 14, 0, 100, 0, 0, 15543, 'General Vezax SAY_SLAY_1'),
(33271, 1, 1, 'Defiance... a flaw of mortality.', 14, 0, 100, 0, 0, 15544, 'General Vezax SAY_SLAY_2'),
(33271, 2, 0, 'The black blood of Yogg-Saron courses through me! I. AM. UNSTOPPABLE!', 14, 0, 100, 0, 0, 15545, 'General Vezax SAY_SURGE_DARKNESS'),
(33271, 3, 0, 'Oh, what horrors await....', 14, 0, 100, 0, 0, 15546, 'General Vezax SAY_DEATH'),
(33271, 4, 0, 'Your defeat was inevitable!', 14, 0, 100, 0, 0, 15547, 'General Vezax SAY_BERSERK'),
(33271, 5, 0, 'Behold, now! Terror, absolute!', 14, 0, 100, 0, 0, 15548, 'General Vezax SAY_HARDMODE_ON'),
(33271, 6, 0, 'The saronite vapors mass and swirl violently, merging into a monstrous form!', 41, 0, 100, 0, 0, 0, 'General Vezax - EMOTE_ANIMUS'),
(33271, 7, 0, 'A saronite barrier appears around General Vezax!', 41, 0, 100, 0, 0, 0, 'General Vezax - EMOTE_BARRIER'),
(33271, 8, 0, 'General Vezax roars and surges with dark might!', 41, 0, 100, 0, 0, 0, 'General Vezax - EMOTE_SURGE_OF_DARKNESS'),
(33271, 10, 0, 'A cloud of saronite vapors coalesces nearby!', 41, 0, 100, 0, 0, 0, 'Saronite Vapor - EMOTE_VAPOR'),
(33271, 11, 0, '%s fires a Shadow Crash towards $N!', 41, 0, 100, 0, 0, 0, 'Shadow Crash - Shadowcrash');




-- Speed correction, in order to let the players position the boss properly.

UPDATE creature_template SET speed_walk=1.42857 WHERE entry IN(32906, 33360,32845, 32846, 32865, 33147, 33118, 33190);




-- Hitbox proper corrections after the beta.

-- The Assembly of Iron

UPDATE `creature_model_info` SET `bounding_radius`=1.085, `combat_reach`=5 WHERE `modelid` In(28344,28381,28324);




-- Enlarging hitbox of bosses
UPDATE `creature_model_info` SET `bounding_radius`=1.085, `combat_reach`=5 WHERE `modelid` IN (28787, 29185, 28611, 28651, 28777);

-- General Vezax hitbox , 
UPDATE `creature_model_info` SET `bounding_radius`=1.3, `combat_reach`=6 WHERE `modelid` IN (28548);


-- Yogg-Saron's Hit box.
UPDATE `creature_model_info` SET `bounding_radius`=2, `combat_reach`=25 WHERE `modelid` IN (28817);


-- Kologarn's arms.
UPDATE `creature_model_info` SET `bounding_radius`=1.2, `combat_reach`=28 WHERE `modelid` IN (28821,28822);


-- Guardians of Yogg-Saron ( and Immortals)
UPDATE `creature_model_info` SET `bounding_radius`=1, `combat_reach`=1 WHERE `modelid` IN (29024);

-- Thorim Lightning charge correction. 

DELETE FROM `conditions` WHERE `SourceEntry` IN (62466);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 5, 62466, 0, 0, 31, 0, 3, 32780, 0, 0, 0, 0, '', 'Lightning Charge release can only target Invisible stalkers');


DELETE FROM `conditions` WHERE `SourceEntry` IN (64098);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 64098, 0, 0, 31, 0, 3, 32865, 0, 0, 0, 0, '', 'Lightning Bolt from charged pilars, can only hit Thorim');


-- Sif texts. 
DELETE FROM creature_text WHERE entry=33196;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (33196, 0, 0, 'Thorim, my lord, why else would these invaders have come into your sanctum but to slay you? They must be stopped!', 14, 0, 100, 0, 0, 15668, 'Sif Intro');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (33196, 1, 0, 'Impossible! Lord Thorim, I will bring your foes a frigid death!', 14, 0, 100, 0, 0, 15670, 'Sif Hard Mode activated');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (33196, 2, 0, 'These pathetic mortals are harmless, beneath my station. Dispose of them!', 14, 0, 100, 0, 0, 15669, 'Sif Despawn');


-- Impale spell script.
DELETE from spell_script_names WHERE spell_id IN(62331,62418);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (62331, 'spell_thorim_impale');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (62418, 'spell_thorim_impale');



-- Delorah texts

DELETE FROM `creature_text` WHERE `entry` = 33701;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(33701, 0, 0, 'I heard a story or two of a Lore Keeper in Uldaman that fit your description. Do you serve a similar purpose?', 12, 0, 0, 0, 0, 0, 'Dellorah SAY_EVENT_1'),
(33701, 1, 0, 'Frontal defense systems? Is there something I should let Brann know before he has anyone attempt to enter the complex?', 12, 0, 0, 0, 0, 0, 'Dellorah SAY_EVENT_2'),
(33701, 2, 0, 'Can you detail the nature of these defense systems?', 12, 0, 0, 0, 0, 0, 'Dellorah SAY_EVENT_3'),
(33701, 3, 0, 'Got it. At least we don\'t have to deal with those orbital emplacements.', 12, 0, 0, 0, 0, 0, 'Dellorah SAY_EVENT_4'),
(33701, 4, 0, 'Rhydian, make sure you let Brann and Archmage Pentarus know about those defenses immediately.', 12, 0, 0, 0, 0, 0, 'Dellorah SAY_EVENT_5'),
(33701, 5, 0, 'And you mentioned an imprisoned entity? What is the nature of this entity and what is its status?', 12, 0, 0, 0, 0, 0, 'Dellorah SAY_EVENT_7'),
(33701, 6, 0, 'Yogg-Saron is here? It sounds like we really will have our hands full then.', 12, 0, 0, 0, 0, 0, 'Dellorah SAY_EVENT_8'),
(33701, 8, 0, 'What... What did you just do, $n?! Brann! Braaaaannn! ', 14, 0, 0, 0, 0, 0, 'Dellorah SAY_BRANN'),
(33701, 9, 0, 'Brann! $n just activated the orbital defense system! If we dont get out here soon, we re going to be toast!', 14, 0, 0, 0, 0, 0, 'Dellorah SAY_BRANN2');



-- Norgannon texts
DELETE FROM `creature_text` WHERE `entry` = 33686;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(33686, 0, 0, ' I was constructed to serve as a repository for essential information regarding this complex. My primary functions include communicating the status of the frontal defense systems and assessing the status of the entity that this complex was built to imprison.', 12, 0, 0, 0, 0, 0, 'Norgannon SAY_EVENT_1'),
(33686, 1, 0, 'Access to the interior of the complex is currently restricted. Primary defensive emplacements are active. Secondary systems are currently non-active.', 12, 0, 0, 0, 0, 0, 'Norgannon SAY_EVENT_2'),
(33686, 2, 0, 'Compromise of complex detected, security override enabled - query permitted.', 12, 0, 0, 0, 0, 0, 'Norgannon SAY_EVENT_3'),
(33686, 3, 0, 'Primary defensive emplacements consist of iron constructs and Storm Beacons, which will generate additional constructs as necessary. Secondary systems consist of orbital defense emplacements.', 12, 0, 0, 0, 0, 0, 'Norgannon SAY_EVENT_4'),
(33686, 4, 0, 'Entity designate: Yogg-Saron. Security has been compromised. Prison operational status unknown. Unable to contact Watchers for notification purposes.', 12, 0, 0, 0, 0, 0, 'Norgannon SAY_EVENT_8'),
(33686, 5, 0, 'Deactivate', 12, 0, 0, 0, 0, 0, 'Norgannon SAY_DEACTIVATE');


-- Rhydian emotes
DELETE FROM `creature_text` WHERE `entry` = 33696;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(33696, 0, 0, '%s nods.', 16, 0, 0, 0, 0, 0, 'Rhydian SAY_EVENT_6'),
(33696, 1, 0, '%s whispers something to Brann', 16, 0, 0, 0, 0, 0, 'Rhydian SAY_WHISPER'),
(33696, 2, 0, "Our friends fought well, Brann, but we're not done yet.", 14, 0, 0, 0, 0, 0, ' SAY_RHYDIAN'),
(33696, 3, 0, "None at all. I suspect it has something to do with that giant mechanical construct that our scouts spotted in front of the gate.", 14, 0, 0, 0, 0, 0, ' SAY_RHYDIAN'),
(33696, 4, 0, "The Kirin Tor can't possibly spare any additional resources to take on anything that size. We may not have to though.", 14, 0, 0, 0, 0, 0, ' SAY_RHYDIAN'),
(33696, 5, 0, "We can sneak past them. As long as we can take down that construct in front of the gate, we should be able to get inside.", 14, 0, 0, 0, 0, 0, ' SAY_RHYDIAN'),
(33696, 6, 0, "We're hunting an old god, Brann.", 14, 0, 0, 0, 0, 0, ' SAY_RHYDIAN')
;



-- Brann
DELETE FROM creature_text WHERE entry=33579;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(33579, 0, 0, 'Pentarus, you heard the man. Have your mages release the shield and let these brave souls through!', 14, 0, 0, 0, 0, 0, ' SAY_BRANN'),
(33579, 1, 0, 'Okay! Let\'s move out. Get into your machines; I\'ll speak to you from here via the radio.', 14, 0, 0, 0, 0, 0, ' SAY_BRANN'),
(33579, 2, 0, 'Our allies are ready. Bring down the shield and make way', 14, 0, 0, 0, 0, 0, ' SAY_BRANN'),
(33579, 3, 0, "Perhaps so, but it's only a matter of time until we break back into Ulduar. Any luck finding a way to teleport inside?", 14, 0, 0, 0, 0, 0, ' SAY_BRANN'),
(33579, 4, 0, 'What about the plated proto-drake and the fire giant that were spotted nearby? Think your mages can handle those?', 14, 0, 0, 0, 0, 0, ' SAY_BRANN'),
(33579, 5, 0, 'Sneak?! What do you think we are, marmots?', 14, 0, 0, 0, 0, 0, ' SAY_BRANN'),
(33579, 6, 0, "Fine. If our allies are going to be the ones getting their hands dirty, we'll leave it to them to decide how to proceed.", 14, 0, 0, 0, 0, 0, ' SAY_BRANN')
;



-- Archmage Pentarus 
DELETE FROM creature_text WHERE entry=33624;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(33624, 0, 0, 'Of course, Brann: We will have the shield down momentarily.', 14, 0, 0, 0, 0, 0, ' SAY_PENTARUS'),
(33624, 1, 0, 'Mages of the Kirin Tor, on Brann\'s Command, release the shield! Defend this platform and our allies with your lives! For Dalaran!', 14, 0, 0, 0, 0, 0, ' SAY_PENTARUS_2');





-- bandera 9








-- Ulduar Gauntlet Generator
UPDATE creature_template SET scriptName="npc_ulduar_gauntlet_generator" WHERE entry IN(33571,34159);
UPDATE creature_template SET HealthModifier=77 WHERE entry IN(33571, 34159); -- Both of them.

-- Ulduar Brann radio: poner modelid 11686 y forzar. Borrar el arma, aunque el NPC esté visible se ve el martillo y queda horrible.

UPDATE creature_template SET modelid2=11686, ScriptName="npc_bronzebeard_radio" WHERE entry=34054;
DELETE FROM creature_equip_template WHERE entry=34054;

 -- Bronzebeard radio texts 
 DELETE FROM `creature_text` WHERE `entry` = 34054;
 INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(34054, 0, 0, "Okay! Let's move out. Get into your machines; I'll speak to you from here via the radio.", 12, 0, 0, 0, 0, 15807, 'Bronzebeard Radio SAY_RADIO_START'),
(34054, 1, 0, "The iron dwarves have been seen emerging from the bunkers at the base of the pillars straight ahead of you. Destroy the bunkers and they will be forced to fall back.", 12, 0, 0, 0, 0, 15794, 'Bronzebeard Radio SAY_RADIO_FIRST_PULL'),
(34054, 2, 0, "There are four generators powering the defense structures. If you sabotage the generators, the missile attacks will stop!", 12, 0, 0, 0, 0, 15796, 'Bronzebeard Radio SAY_RADIO_FIRST_KILL'),
(34054, 3, 0, "You're approaching the tower of Freya. It contains the power to turn barren wastelands into jungles teeming with life overnight.", 12, 0, 0, 0, 0, 15798, 'Bronzebeard Radio SAY_RADIO_TOWER_OF_LIFE'),
(34054, 4, 0, "Watch out! Our air scouts report that the generators for the missile silos are coming online!", 12, 0, 0, 0, 0, 15795, 'Bronzebeard Radio SAY_RADIO_AIR_SCOUTS'),
(34054, 5, 0, "This generator powers Mimiron's Gaze. In moments, it can turn earth to ash, stone to magma--we cannot let it reach full power!", 12, 0, 0, 0, 0, 15799, 'Bronzebeard Radio SAY_RADIO_TOWER_OF_FLAMES'),
(34054, 6, 0, "This tower powers the hammer of Hodir. It is said to have the power to turn entire armies to ice!", 12, 0, 0, 0, 0, 15797, 'Bronzebeard Radio SAY_RADIO_TOWER_OF_FROST'),
(34054, 7, 0, "Aaaah, the tower of Krolmir. It is said that the power of Thorim has been used only once. And that it turned an entire continent to dust...", 12, 0, 0, 0, 0, 15801, 'Bronzebeard Radio SAY_RADIO_TOWER_OF_STORMS'),
(34054, 8, 0, "It appears you are near a repair station. Drive your vehicle on to the platform and it should be automatically repaired.", 12, 0, 0, 0, 0, 15803, 'Bronzebeard Radio SAY_RADIO_TOWER_OF_STORMS'),
(34054, 9, 0, "You've done it! You've broken the defenses of Ulduar. In a few moments, we will be dropping in to...", 12, 0, 0, 0, 0, 15804, 'Bronzebeard Radio SAY_RADIO_ULDUAR_DEFENSES'),
(34054, 10, 0, "What is that? Be careful! Something's headed your way!", 12, 0, 0, 0, 0, 15805, 'Bronzebeard Radio SAY_RADIO_PRE_LEVIATHAN'),
(34054, 11, 0, "Quicly! Evasive action! Evasive act--", 12, 0, 0, 0, 0, 15806, 'Bronzebeard Radio SAY_RADIO_EVASIVE_ACTION')
;

--  


--  Air Scouts mini event, http://www.wowhead.com/npc=34161 y http://www.wowhead.com/npc=33216

UPDATE creature_template SET ScriptName="npc_ulduar_mechanostriker", InhabitType=4, speed_run=1.6, speed_walk=1.6 WHERE entry IN(34161, 34162);



 -- Cambiar estas guids...

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5933992, 34054, 603, 3, 1, 0, 0, 194.694, -29.3511, 409.804, 3.24362, 300, 0, 0, 75600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5933990, 34054, 603, 3, 1, 0, 0, 290.861, -103.96, 409.804, 4.85473, 300, 0, 0, 75600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5933986, 34054, 603, 3, 1, 0, 0, 293.859, 53.738, 409.804, 0.0143641, 300, 0, 0, 75600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5929363, 34054, 603, 3, 1, 0, 0, -349.071, -109.465, 409.804, 4.6807, 300, 0, 0, 75600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5933988, 34054, 603, 3, 1, 0, 0, 292.74, -18.3393, 409.804, 4.69687, 300, 0, 0, 75600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5926802, 34054, 603, 3, 1, 0, 0, 126.698, -37.0057, 409.804, 0.0202954, 300, 0, 0, 75600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5926800, 34054, 603, 3, 1, 0, 0, 37.3319, -66.6018, 409.804, 0.677629, 300, 0, 0, 75600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5926706, 34054, 603, 3, 1, 0, 0, -537.327, 39.0794, 409.805, 6.25155, 300, 0, 0, 75600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5930660, 34054, 603, 3, 1, 0, 0, -510.209, -98.3763, 409.804, 6.25979, 300, 0, 0, 75600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5926702, 34054, 603, 3, 1, 0, 0, -614.438, -38.0614, 409.804, 3.16315, 300, 0, 0, 75600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5928110, 34054, 603, 3, 1, 0, 0, -414.856, 12.1853, 409.804, 5.2733, 300, 0, 0, 75600, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (5928108, 34054, 603, 3, 1, 0, 0, -182.255, 39.438, 409.808, 1.54497, 300, 0, 0, 75600, 0, 0, 0, 0, 0);




-- Clean those Battlemages, they will be summoned via core.

DELETE FROM creature WHERE guid IN(136525,136528);

-- Brann starting Gossip

DELETE FROM gossip_menu WHERE entry=33579;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (33579, 14369);

UPDATE creature_template SET gossip_menu_id=33579 WHERE entry=33579;


-- Ulduar shield bunny.
UPDATE creature_template SET InhabitType=4 WHERE entry=33779;



-- Yogg Saron LoS helper.
-- DELETE FROM creature_template where entry=225157;
-- INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
-- VALUES (225157, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Yogg-Saron - LoS Helper', '', NULL, 0, 60, 60, 0, 14, 14, 0, 1, 0.99206, 1, 0, 104, 138, 0, 252, 7.5, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 72, 106, 26, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_yogg_saron_los_helper', 12340);


-- Spawn

-- DELETE FROM creature WHERE id=225157;
-- INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
-- VALUES (200300, 225157, 603, 3, 1, 0, 0, 1909.1, -24.2009, 330.381, 3.10834, 300, 0, 0, 4121, 0, 0, 0, 0, 0);




-- Mimiron cosmetic details

DELETE FROM `creature_template_addon` WHERE `entry` IN (34047, 34148, 33836, 34149, 34147, 33670, 34363, 34121, 34109);
INSERT INTO `creature_template_addon` (`entry`, `bytes1`, `bytes2`, `auras`) VALUES
(33670, 50331648, 1, ''),
(34109, 50331648, 1, ''),
(34363, 0, 1, '64561'),
(34121, 0, 1, '64561'),
(34047, 0, 1, '64064'),
(34148, 0, 1, '64616 64617'),
(33836, 0, 1, '63767'),
(34149, 0, 1, '64624'),
(34147, 0, 1, '64617');

UPDATE `creature_template` SET `HoverHeight` = 15 WHERE `entry` = 33670;



DELETE FROM spell_script_names WHERE spell_id IN(64426,64425, 64621, 64620, 64398, 63820, 63339);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(64426, 'spell_mimiron_summon_assault_bot'),
(64425, 'spell_mimiron_summon_assault_bot_target'),
(64621, 'spell_mimiron_summon_fire_bot'),
(64620, 'spell_mimiron_summon_fire_bot_target'),
(64398, 'spell_mimiron_summon_junk_bot'),
(63820, 'spell_mimiron_summon_junk_bot_target'),
(63339, 'spell_mimiron_weld');

DELETE FROM conditions WHERE SourceEntry IN(64425, 63820, 64620);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 64425, 0, 0, 31, 0, 3, 33856, 0, 0, 0, 0, '', 'Summon Assault Bot Trigger EFFECT_0 can only hit NPC_BOT_SUMMON_TRIGGER'),
(13, 1, 63820, 0, 0, 31, 0, 3, 33856, 0, 0, 0, 0, '', 'Summon Junk Bot Trigger EFFECT_0 can only hit NPC_BOT_SUMMON_TRIGGER'),
(13, 1, 64620, 0, 0, 31, 0, 3, 33856, 0, 0, 0, 0, '', 'Summon Fire Bot Trigger EFFECT_0 can only hit NPC_BOT_SUMMON_TRIGGER');


-- Yogg Saron spell script name.
-- 
-- Yogg Saron Skulls corrections, inside the chamber of Illusions.

SET @LAUGHING_SKULL := 33990;
SET @BRAIN_OF_YOGG_SARON := 33890;

DELETE FROM creature_summon_groups where entry=@LAUGHING_SKULL;
INSERT INTO `creature_summon_groups` (`summonerId`,`summonerType`,`groupId`,`entry`,`position_x`,`position_y`,`position_z`,`orientation`,`summonType`,`summonTime`) VALUES
(@BRAIN_OF_YOGG_SARON,0,0,@LAUGHING_SKULL,2134.533,18.86881,239.8042,1.850049,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@LAUGHING_SKULL,2070.133,-73.0108,242.5237,1.308997,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@LAUGHING_SKULL,2088.254,5.053657,239.8672,0.9948376,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@LAUGHING_SKULL,2102.441,-75.04541,239.8635,1.658063,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@LAUGHING_SKULL,1880.897,-97.9364,240.073,5.235988,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@LAUGHING_SKULL,1964.457,-149.5943,240.073,3.385939,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@LAUGHING_SKULL,1992.463,-131.2119,240.073,3.455752,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@LAUGHING_SKULL,1905.937,-133.1651,240.073,5.77704,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@LAUGHING_SKULL,1898.55,75.37001,241.1263,0.1919862,3,60000), 
(@BRAIN_OF_YOGG_SARON,0,2,@LAUGHING_SKULL,1926.526,43.26215,239.7496,0.9948376,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@LAUGHING_SKULL,1955.173,85.26153,239.7496,4.049164,3,60000),



(@BRAIN_OF_YOGG_SARON,0,1,@LAUGHING_SKULL,1992.463,-131.2119,240.073,3.455752,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@LAUGHING_SKULL,1905.937,-133.1651,240.073,5.77704,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@LAUGHING_SKULL,1898.55,75.37001,241.1263,0.1919862,3,60000), 
(@BRAIN_OF_YOGG_SARON,0,2,@LAUGHING_SKULL,1926.526,43.26215,239.7496,0.9948376,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@LAUGHING_SKULL,1955.173,85.26153,239.7496,4.049164,3,60000);



-- BANDERA 9


-- New core, delete those references after the alter tables.

DELETE FROM creature_loot_template WHERE reference=1;



-- IMPORTANT: Harpoon fix. Razorscale Controller faction in order it to work properly, Harpoons activables by the players.

UPDATE creature_template SET faction = 35 WHERE entry = 33233;


-- Varios controllers - Aplicar cambios de world_new, todos el core. 


-- ******Aplicar cambios de BD, ALTERS, DROPS y demás.*****


-- Kologarn proper Rubble spawn. Temporary way.

DELETE FROM creature_template WHERE entry=198765;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (198765, 0, 0, 0, 0, 0, 1126, 11686, 0, 0, 'Rubble Stalker Kologarn - Right', '', '', 0, 81, 81, 2, 14, 0, 2.4, 0.85714, 1, 0, 0, 2000, 0, 1, 33554432, 2048, 8, 0, 0, 0, 0, 0, 10, 1024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 106, 1, 0, 130, '', 12340);


DELETE FROM creature WHERE id=198765;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (214567, 198765, 603, 3, 1, 0, 0, 1767.26, -3.75633, 448.807, 0.00979239, 300, 0, 0, 26066, 0, 0, 0, 0, 0);




-- Brann's Flying Machine - Flame Leviathan's OUTRO.

UPDATE creature_template SET VehicleId=397, InhabitType=4 WHERE entry=30134;




-- Flame Leviathan's OUTRO controller.
DELETE FROM creature_template where entry=225158;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (225158, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Flame Leviathan OUTRO controller', '', NULL, 0, 60, 60, 0, 14, 0, 1, 0.99206, 1, 0, 0, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_fl_outro_controller', 12340);

DELETE FROM creature where id=225158;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
 (216543, 225158, 603, 3, 1, 0, 0, 265.271, -74.8978, 450.1, 0.861672, 300, 0, 0, 4121, 0, 0, 0, 0, 0);




-- XT trash controller.
/*DELETE FROM creature_template where entry=225159;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (225159, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'XT - Trash controller', '', NULL, 0, 60, 60, 0, 14, 0, 1, 0.99206, 1, 0, 0, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_xt_trash_controller', 12340);

-- XT Trash Controller spawn.
DELETE FROM creature WHERE id=225159;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (214563, 225159, 603, 3, 1, 0, 0, 779.192, -52.0648, 409.804, 1.60078, 300, 0, 0, 4121, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (214564, 225159, 603, 3, 1, 0, 0, 783.38, 21.3021, 409.804, 1.36721, 300, 0, 0, 4121, 0, 0, 0, 0, 0);*/





-- Mirar las weapon, sistema de creature_equipment.
-- Proper weapons for pre-Vezax trash.


DELETE FROM creature_equip_template WHERE entry IN(33823, 33822, 33818, 33824, 33819, 33820);
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES 
(33823, 1, 45516, 0, 0),
(33822, 1, 46031, 45450, 0),
(33818, 1, 46025, 0, 0),
(33824, 1, 46024, 45930, 0),
(33819, 1, 21128, 0, 0),
(33820, 1, 41987, 0, 0)
;
-- Make Twilight Shadowblade attack faster, they are rogues. 
UPDATE creature_template SET unit_class=4, baseattacktime=1000 WHERE entry IN(33824,33831);
UPDATE creature_template SET unit_class=8 WHERE entry IN(33818,33827); -- Twilight Adherent correction, he needs to be mage.

-- Some replacements, before General Vezax.

UPDATE creature SET id=33823 WHERE guid=137553;
UPDATE creature SET modelid=29055, id=33824 WHERE guid=137542;
UPDATE creature SET id=33823 WHERE guid=137550;



-- Displacement Device, of the Chamber Overseers.

UPDATE creature_template SET ScriptName="npc_displacement_device" WHERE entry=34203;
UPDATE creature_template SET InhabitType=4, speed_run=1, speed_walk=1 WHERE entry IN(34203, 34227);






-- Ignis, Ground Scorch spell script

DELETE FROM spell_script_names WHERE spell_id IN(62549, 63475);
INSERT INTO spell_script_names(spell_id, scriptname) VALUES (62549, "spell_ignis_ground_scorch"); 
INSERT INTO spell_script_names(spell_id, scriptname) VALUES (63475, "spell_ignis_ground_scorch");





-- NPC vendor correction.

DELETE FROM npc_vendor WHERE entry=35790;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (35790, 0, 40753, 0, 0, 2707);




-- Freya, channel stalker  trigger combat bug fix.

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128|2  WHERE `entry` IN (33575);



-- Razorscale Reset controller

DELETE FROM creature_template where entry=225167;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (225167, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Razorscale - Reset Controller', '', NULL, 0, 60, 60, 0, 14, 0, 1, 0.99206, 1, 0, 0, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_razorscale_reset_controller', 12340);

-- SPAWN of Razorscale - Reset Controller CAMBIAR GUID

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) 
VALUES (5938042, 225167, 603, 3, 1, 0, 0, 586.407, -171.935, 391.517, 4.71514, 300, 0, 0, 4121, 0, 0, 0, 0, 0);



-- Algalon - Living Constellations

UPDATE creature_template SET speed_walk=0.7, speed_run=0.7 WHERE entry IN(33052, 33116);

-- Additional corrections; High Explorer Dellorah SAI removal, c++ script shall manage it.

UPDATE creature_template SET AIName="" WHERE entry=33701;

-- Void Zones Fix.

UPDATE creature_template SET unit_flags=33685508, ScriptName="npc_void_zone", flags_extra=0 WHERE entry IN(34001);


-- Hodir's flash freezes correction.

UPDATE creature_template SET flags_extra=0 WHERE entry IN(32938, 32926);


-- Leviathan MK Turret correction

UPDATE creature_template SET unit_flags=33554432 WHERE entry=34071;

-- VX001 Flags correction

UPDATE creature_template SET unit_flags=33554688 WHERE entry IN(33651,34108);

DELETE FROM `conditions` WHERE `SourceEntry` IN (65192, 64570, 63274, 66490, 63300, 63414, 64539, 64402, 65034, 63041, 65224, 64620, 63820, 64425, 64619, 64626, 65333, 65354, 64618, 64623, 64436, 64444, 65101, 64463);

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (13, 1, 64623, 0, 0, 31, 0, 3, 34363, 0, 0, 0, 0, '', 'Frost Bomb EFFECT_0 can only hit NPC_FLAME');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (13, 1, 64623, 0, 1, 31, 0, 3, 34121, 0, 0, 0, 0, '', 'Frost Bomb EFFECT_0 can only hit NPC_FLAME_SPREAD');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (13, 1, 64425, 0, 0, 31, 0, 3, 33856, 0, 0, 0, 0, '', 'Summon Assault Bot Trigger EFFECT_0 can only hit NPC_BOT_SUMMON_TRIGGER');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (13, 1, 63820, 0, 0, 31, 0, 3, 33856, 0, 0, 0, 0, '', 'Summon Junk Bot Trigger EFFECT_0 can only hit NPC_BOT_SUMMON_TRIGGER');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (13, 1, 64620, 0, 0, 31, 0, 3, 33856, 0, 0, 0, 0, '', 'Summon Fire Bot Trigger EFFECT_0 can only hit NPC_BOT_SUMMON_TRIGGER');

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 64402, 0, 0, 31, 0, 3, 34050, 0, 0, 0, 0, '', 'Rocket Strike EFFECT_0 can only hit NPC_ROCKET_MIMIRON_VISUAL'),
(13, 1, 65034, 0, 0, 31, 0, 3, 34050, 0, 0, 0, 0, '', 'Rocket Strike EFFECT_0 can only hit NPC_ROCKET_MIMIRON_VISUAL');

DELETE FROM `spell_script_names` WHERE `spell_id` IN (64402, 65034, 63041, 63681);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(64402, 'spell_mimiron_rocket_strike'),
(65034, 'spell_mimiron_rocket_strike'),
(63041, 'spell_mimiron_rocket_strike_damage'),
(63681, 'spell_mimiron_rocket_strike_target_select');


DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (34106, 33432);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (34106, 34071, 3, 1, 'Leviathan Mk II turret', 8, 0);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES (33432, 34071, 3, 1, 'Leviathan Mk II turret', 8, 0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (34106, 33432);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(34106, 46598, 1, 1),
(33432, 46598, 1, 1);


-- Yogg-Saron combat issue fix.

UPDATE creature_template SET flags_extra=0 WHERE entry=33280;



DELETE FROM creature_summon_groups where summonerId=33890;
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33523, 2117.71, -25.2707, 242.73, 3.14159, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33535, 2107.96, -37.2935, 242.73, 2.02458, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33536, 2092.35, -25.2604, 242.73, 6.26573, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33495, 2109.76, -14.3797, 242.73, 4.20624, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33720, 2146.88, -17.0312, 239.806, 3.35103, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33720, 2146.24, -34.4045, 239.806, 3.01942, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33717, 2113.33, -65.7101, 239.806, 1.78024, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33717, 2139.83, -50.2865, 239.806, 2.46091, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33719, 2116.93, 11.375, 239.806, 4.41568, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33719, 2136.64, -1.99653, 239.806, 3.83972, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33716, 2069.48, -5.69965, 239.806, 5.42797, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33716, 2069.3, -43.5317, 239.801, 0.471239, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33552, 2109.7, -25.0955, 222.325, 0, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33441, 1908.56, -152.443, 240.072, 4.32842, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33442, 1903.6, -160.358, 240.106, 1.0821, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33962, 1919.11, -160.966, 240.066, 2.70078, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33567, 1917.56, -135.745, 240.073, 4.18879, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33567, 1919.12, -140.957, 240.073, 3.97935, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33567, 1948.47, -136.295, 240.071, 3.4383, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33567, 1956.44, -138.403, 240.108, 3.36848, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33567, 1952.96, -130.529, 240.135, 3.80482, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33567, 1902.13, -111.359, 240.07, 4.85202, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33567, 1905.33, -104.786, 240.052, 4.76475, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33567, 1897.34, -106.608, 240.144, 4.93928, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33567, 1912.13, -136.934, 240.073, 4.18879, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33552, 1906.23, -155.894, 223.473, 0, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 2, 33990, 1955.17, 85.2615, 239.75, 4.04916, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 2, 33990, 1926.53, 43.2621, 239.75, 0.994838, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 2, 33990, 1898.55, 75.37, 241.126, 0.191986, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33990, 1905.94, -133.165, 240.073, 5.77704, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33990, 1992.46, -131.212, 240.073, 3.45575, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 2, 33436, 1931.06, 60.5659, 241.501, 2.08425, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 2, 33437, 1928.35, 66.0519, 242.46, 5.11381, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 2, 33433, 1956.5, 72.1946, 239.749, 3.28122, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 2, 33433, 1951.04, 49.8887, 239.749, 2.49582, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 2, 33433, 1931.14, 38.4695, 239.749, 1.71042, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 2, 33433, 1908.99, 44.2666, 239.749, 0.925025, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 2, 33433, 1897.34, 64.3142, 239.749, 0.139626, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 2, 33433, 1903.39, 86.6029, 239.749, 5.61996, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 2, 33433, 1923.34, 98.0123, 239.749, 4.83456, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 2, 33433, 1945.44, 92.1795, 239.749, 4.04916, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 2, 33552, 1929.16, 67.7569, 221.732, 0, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33990, 1964.46, -149.594, 240.073, 3.38594, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 1, 33990, 1880.9, -97.9364, 240.073, 5.23599, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33990, 2102.44, -75.0454, 239.863, 1.65806, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33990, 2088.25, 5.05366, 239.867, 0.994838, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33990, 2070.13, -73.0108, 242.524, 1.309, 3, 60000);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES (33890, 0, 0, 33990, 2134.53, 18.8688, 239.804, 1.85005, 3, 60000);


-- Spell Click correction on conditions, data is DATA_ILLUSION = 38.
UPDATE conditions SET ConditionValue1=38 WHERE SourceGroup=34072;

-- The Lich King's faction inside the Icecrown's Illusion - Yogg-Saron's brain.

UPDATE creature_template SET faction=35 WHERE entry=33441;





/* LOOT CORRECTIONS, ALSO SET THE CONDITIONS FOR THE SIGILS AND THE QUESTS. */




/*select * from creature_loot_template WHERE entry IN(
33113, 34003, -- Flame Leviathan
33118, 33190, -- Ignis the Furnace Master
33186, 33724, -- Razorscale
33293, 33885, -- XT002
32867, 33693, -- Steelbreaker
32857, 33694, -- Stormcaller Brundir.
32927, 33692, -- Runemaster Molgeim
33271, 33449, -- General Vezax
33288, 33955 -- Yogg-Saron
);*/

DELETE FROM creature_loot_template WHERE entry IN(
33113, 34003, -- Flame Leviathan
33118, 33190, -- Ignis the Furnace Master
33186, 33724, -- Razorscale
33293, 33885, -- XT002
32867, 33693, -- Steelbreaker
32857, 33694, -- Stormcaller Brundir.
32927, 33692, -- Runemaster Molgeim
33271, 33449, -- General Vezax
33288, 33955 -- Yogg-Saron
);

INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32857, 1, 100, 1, 0, 34359, 2, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32857, 40753, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32867, 1, 100, 1, 0, 34359, 2, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32867, 40753, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32867, 45087, 75, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32867, 45447, 0, 1, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32867, 45448, 0, 1, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32867, 45449, 0, 1, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32867, 45455, 0, 1, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32867, 45456, 0, 1, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32867, 45506, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32927, 1, 100, 1, 0, 34359, 2, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32927, 40753, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32927, 45087, 75, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (32927, 45506, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33113, 1, 100, 1, 0, 34349, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33113, 2, 100, 1, 0, 34351, 2, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33113, 8, 100, 8, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33113, 9, 100, 16, 0, 34349, 2, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33113, 12, 100, 16, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33113, 45087, 100, 28, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33113, 45293, 0, 16, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33113, 45295, 0, 16, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33113, 45296, 0, 16, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33113, 45297, 0, 16, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33113, 45300, 0, 16, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33118, 1, 100, 1, 0, 34353, 2, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33118, 40753, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33186, 1, 100, 1, 0, 34355, 2, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33186, 40753, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33190, 1, 100, 1, 0, 34354, 3, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33190, 3, 5, 1, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33190, 45038, 8, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33190, 45087, 75, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33190, 45624, 100, 1, 0, 0, 2, 0, 2);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33271, 1, 100, 1, 0, 34373, 2, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33271, 40753, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33271, 46032, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33271, 46033, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33271, 46034, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33271, 46035, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33271, 46036, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33288, 1, 100, 1, 0, 34375, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33288, 2, 100, 1, 0, 12034, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33288, 3, 100, 2, 0, 34349, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33288, 4, 100, 4, 0, 34350, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33288, 5, 10, 4, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33288, 6, 100, 8, 0, 34349, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33288, 7, 100, 8, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33288, 40753, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33288, 46067, 0, 8, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33288, 46068, 0, 8, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33288, 46095, 0, 8, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33288, 46096, 0, 8, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33288, 46097, 0, 8, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33288, 46312, 100, 16, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33293, 1, 100, 1, 0, 34357, 2, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33293, 2, 20, 2, 3, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33293, 40753, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33293, 45867, 0, 2, 2, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33293, 45868, 0, 2, 2, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33293, 45869, 0, 2, 2, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33293, 45870, 0, 2, 2, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33293, 45871, 0, 2, 2, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33449, 1, 100, 1, 0, 34374, 3, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33449, 2, 5, 1, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33449, 3, 10, 1, 0, 34350, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33449, 45498, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33449, 45511, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33449, 45516, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33449, 45517, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33449, 45518, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33449, 45519, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33449, 45520, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33449, 45624, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33692, 1, 100, 1, 0, 34360, 3, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33692, 2, 5, 1, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33692, 45038, 8, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33692, 45087, 75, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33692, 45624, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33692, 45857, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33693, 1, 100, 1, 0, 34360, 3, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33693, 2, 5, 1, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33693, 45038, 18, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33693, 45087, 75, 1, 0, 0, 2, 0, 2);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33693, 45241, 0, 1, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33693, 45242, 0, 1, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33693, 45243, 0, 1, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33693, 45244, 0, 1, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33693, 45245, 0, 1, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33693, 45607, 0, 1, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33693, 45624, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33693, 45857, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33694, 1, 100, 1, 0, 34360, 3, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33694, 2, 5, 1, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33694, 45038, 8, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33694, 45087, 75, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33694, 45624, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33724, 1, 100, 1, 0, 34356, 3, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33724, 2, 5, 1, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33724, 45038, 8, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33724, 45087, 75, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33724, 45624, 100, 1, 0, 0, 2, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33885, 1, 100, 1, 0, 34358, 3, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33885, 2, 5, 1, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33885, 45038, 8, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33885, 45087, 75, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33885, 45442, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33885, 45443, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33885, 45444, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33885, 45445, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33885, 45446, 0, 2, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33885, 45624, 100, 1, 0, 0, 2, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 1, 100, 1, 0, 34376, 2, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 2, 100, 1, 0, 12035, 2, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 3, 10, 1, 0, 34350, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 4, 5, 1, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 5, 100, 2, 0, 34349, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 6, 100, 4, 0, 34350, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 7, 100, 8, 0, 34349, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 8, 5, 8, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 45533, 0, 8, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 45534, 0, 8, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 45535, 0, 8, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 45536, 0, 8, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 45537, 0, 8, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 45624, 100, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 45693, 100, 16, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (33955, 45897, 100, 32, 0, 0, 1, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (34003, 2, 100, 1, 0, 34352, 3, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (34003, 8, 100, 8, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (34003, 9, 100, 16, 0, 34154, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (34003, 45038, 8, 1, 0, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (34003, 45086, 0, 16, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (34003, 45110, 0, 16, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (34003, 45132, 0, 16, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (34003, 45133, 0, 16, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (34003, 45134, 0, 16, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (34003, 45135, 0, 16, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (34003, 45136, 0, 16, 1, 0, 1, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`, `QuestRequired`, `MinCount`) VALUES (34003, 45624, 100, 1, 0, 0, 2, 0, 2);



-- Reference templates fro those bosses.

DELETE FROM reference_loot_template WHERE entry IN(34359,34359,34359,34349,34351,34154,34349,34154,34353,34355,34354,34154,34373,34375,12034,34349,34350,34154,34349,34154,34357,34154,34374,34154,34350,34360,34154,34360,34154,34360,34154,34356,34154,34358,34154,34376,12035,34350,34154,34349,34350,34349,34154,34352,34154,34154);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12034, 45635, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12034, 45636, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12034, 45637, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12035, 45656, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12035, 45657, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12035, 45658, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45088, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45089, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45090, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45091, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45092, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45093, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45094, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45095, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45096, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45097, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45098, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45099, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45100, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45101, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45102, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45103, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45104, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45105, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 46027, 1, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 46348, 1, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34349, 40753, 100, 1, 0, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34350, 45087, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34351, 45282, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34351, 45283, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34351, 45284, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34351, 45285, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34351, 45286, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34351, 45287, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34351, 45288, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34351, 45289, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34351, 45291, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34351, 45292, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34352, 45106, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34352, 45107, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34352, 45108, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34352, 45109, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34352, 45111, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34352, 45112, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34352, 45113, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34352, 45114, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34352, 45115, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34352, 45116, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34352, 45117, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34352, 45118, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34352, 45119, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34353, 45309, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34353, 45310, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34353, 45311, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34353, 45312, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34353, 45313, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34353, 45314, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34353, 45316, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34353, 45317, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34353, 45318, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34353, 45321, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45157, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45158, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45161, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45162, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45164, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45165, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45166, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45167, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45168, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45169, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45170, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45171, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45185, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45186, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34354, 45187, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34355, 45298, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34355, 45299, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34355, 45301, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34355, 45302, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34355, 45303, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34355, 45304, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34355, 45305, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34355, 45306, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34355, 45307, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34355, 45308, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45137, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45138, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45139, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45140, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45141, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45142, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45143, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45144, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45146, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45147, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45148, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45149, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45150, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45151, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34356, 45510, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34357, 45675, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34357, 45676, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34357, 45677, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34357, 45679, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34357, 45680, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34357, 45682, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34357, 45685, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34357, 45686, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34357, 45687, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34357, 45694, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45246, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45247, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45248, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45249, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45250, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45251, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45252, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45253, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45254, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45255, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45256, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45257, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45258, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45259, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34358, 45260, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34359, 45322, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34359, 45324, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34359, 45329, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34359, 45330, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34359, 45331, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34359, 45332, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34359, 45333, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34359, 45378, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34359, 45418, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34359, 45423, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45193, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45224, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45225, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45226, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45227, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45228, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45232, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45233, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45234, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45235, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45236, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45237, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45238, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45239, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34360, 45240, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34373, 45996, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34373, 45997, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34373, 46008, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34373, 46009, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34373, 46010, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34373, 46011, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34373, 46012, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34373, 46013, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34373, 46014, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34373, 46015, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34374, 45145, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34374, 45501, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34374, 45502, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34374, 45503, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34374, 45504, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34374, 45505, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34374, 45507, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34374, 45508, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34374, 45509, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34374, 45512, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34374, 45513, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34374, 45514, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34374, 45515, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34375, 46016, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34375, 46018, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34375, 46019, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34375, 46021, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34375, 46022, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34375, 46024, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34375, 46025, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34375, 46028, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34375, 46030, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34375, 46031, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34376, 45521, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34376, 45522, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34376, 45523, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34376, 45524, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34376, 45525, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34376, 45527, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34376, 45529, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34376, 45530, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34376, 45531, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34376, 45532, 0, 1, 1, 0, 1);





-- Loot from the Chests.

DELETE FROM gameobject_loot_template WHERE entry  IN(
27061, 26929, -- Kologarn
27068, 27069, -- Hodir 10
26946, 26950, -- Hodir 25
27073, 27074, -- Thorim 10
26956, 26955, -- Thorim 25 
27085, 27086, -- Mimiron 10
26963, 26967, -- Mimiron 255
27080, 27081, -- Freya 10
27079, 26962, -- Freya 25 
27030, 26974 -- Algalon 10/25
);

INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26929, 1, 100, 1, 0, 34362, 0, 1, 3);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26929, 2, 5, 1, 0, 34154, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26929, 45038, 8, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26929, 45087, 50, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26929, 45624, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26946, 1, 100, 1, 0, 34368, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26946, 2, 100, 1, 0, 12029, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26946, 3, 5, 1, 0, 34154, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26946, 45038, 10, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26946, 45087, 10, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26946, 45624, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26950, 1, 100, 1, 0, 34368, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26950, 2, 100, 1, 0, 12029, 0, 1, 2);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26950, 3, 15, 1, 0, 34154, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26950, 45038, 20, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26950, 45087, 10, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26950, 45457, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26950, 45459, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26950, 45460, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26950, 45461, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26950, 45462, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26950, 45612, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26950, 45624, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26950, 45815, 100, 1, 0, 0, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26955, 1, 100, 1, 0, 34372, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26955, 2, 100, 1, 0, 12033, 0, 1, 2);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26955, 3, 15, 1, 0, 34154, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26955, 45038, 22, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26955, 45087, 80, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26955, 45470, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26955, 45471, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26955, 45472, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26955, 45473, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26955, 45474, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26955, 45570, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26955, 45624, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26955, 45817, 100, 1, 0, 0, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26956, 1, 100, 1, 0, 34372, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26956, 2, 100, 1, 0, 12033, 0, 1, 2);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26956, 3, 10, 1, 0, 34154, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26956, 45038, 18, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26956, 45087, 10, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26956, 45624, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26962, 1, 100, 1, 0, 34366, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26962, 2, 100, 1, 0, 12027, 0, 1, 2);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26962, 3, 30, 1, 0, 34154, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26962, 45038, 18, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26962, 45087, 80, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26962, 45484, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26962, 45485, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26962, 45486, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26962, 45487, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26962, 45488, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26962, 45613, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26962, 45624, 100, 1, 0, 0, 0, 3, 3);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26962, 45814, 100, 1, 0, 0, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26962, 46110, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26963, 1, 100, 1, 0, 34370, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26963, 2, 100, 1, 0, 12031, 0, 1, 2);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26963, 3, 10, 1, 0, 34154, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26963, 45038, 8, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26963, 45087, 10, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26963, 45624, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26967, 1, 100, 1, 0, 34370, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26967, 2, 100, 1, 0, 12031, 0, 1, 2);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26967, 3, 15, 1, 0, 34154, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26967, 45038, 18, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26967, 45087, 10, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26967, 45494, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26967, 45495, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26967, 45496, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26967, 45497, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26967, 45620, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26967, 45624, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26967, 45663, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26967, 45816, 100, 1, 0, 0, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26974, 1, 100, 1, 0, 12023, 0, 1, 3);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26974, 2, 15, 1, 0, 34154, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26974, 45038, 20, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26974, 45624, 100, 1, 0, 0, 0, 2, 2);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (26974, 46053, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27030, 1, 100, 1, 0, 34134, 0, 1, 3);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27030, 40753, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27030, 46052, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27061, 1, 100, 1, 0, 34361, 0, 1, 2);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27061, 40753, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27068, 1, 100, 1, 0, 34367, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27068, 2, 100, 1, 0, 12028, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27068, 40753, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27069, 1, 100, 1, 0, 34367, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27069, 2, 100, 1, 0, 12028, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27069, 40753, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27069, 45786, 100, 1, 0, 0, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27069, 45876, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27069, 45877, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27069, 45886, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27069, 45887, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27069, 45888, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27073, 1, 100, 1, 0, 34371, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27073, 2, 100, 1, 0, 12032, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27073, 40753, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27074, 1, 100, 1, 0, 34371, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27074, 2, 100, 1, 0, 12032, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27074, 40753, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27074, 45784, 100, 1, 0, 0, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27074, 45928, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27074, 45929, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27074, 45930, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27074, 45931, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27074, 45933, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27079, 1, 100, 1, 0, 34366, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27079, 2, 100, 1, 0, 12027, 0, 1, 2);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27079, 3, 10, 1, 0, 34154, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27079, 45038, 8, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27079, 45087, 60, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27079, 45624, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27079, 46110, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27080, 1, 100, 1, 0, 34365, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27080, 2, 100, 1, 0, 12026, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27080, 40753, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27080, 46110, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27081, 1, 100, 1, 0, 34366, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27081, 2, 100, 1, 0, 12026, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27081, 5, 15, 1, 0, 34154, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27081, 40753, 100, 1, 0, 0, 0, 3, 3);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27081, 45294, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27081, 45788, 100, 1, 0, 0, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27081, 45943, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27081, 45945, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27081, 45946, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27081, 45947, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27081, 46110, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27085, 1, 100, 1, 0, 34369, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27085, 2, 100, 1, 0, 12030, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27085, 40753, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27086, 1, 100, 1, 0, 34369, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27086, 2, 100, 1, 0, 12030, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27086, 40753, 100, 1, 0, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27086, 45787, 100, 1, 0, 0, 1, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27086, 45982, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27086, 45988, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27086, 45989, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27086, 45990, 0, 1, 1, 0, 0, 1, 1);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `QuestRequired`, `MinCount`, `maxcount`) VALUES (27086, 45993, 0, 1, 1, 0, 0, 1, 1);




-- References for those Chests.


DELETE FROM reference_loot_template WHERE entry IN(34362,34154,34368,12029,34154,34368,12029,34154,34372,12033,34154,34372,12033,34154,34366,12027,34154,34370,12031,34154,34370,12031,34154,12023,34154,34134,34361,34367,12028,34367,12028,34371,12032,34371,12032,34366,12027,34154,34365,12026,34366,12026,34154,34369,12030,34369,12030);


INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45570, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45587, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45594, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45599, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45607, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45609, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45610, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45611, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45612, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45613, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45615, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45616, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45617, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45619, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45620, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12023, 45665, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12026, 45644, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12026, 45645, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12026, 45646, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12027, 45653, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12027, 45654, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12027, 45655, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12028, 45650, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12028, 45651, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12028, 45652, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12029, 45632, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12029, 45633, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12029, 45634, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12030, 45647, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12030, 45648, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12030, 45649, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12031, 45641, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12031, 45642, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12031, 45643, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12032, 45659, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12032, 45660, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12032, 45661, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12033, 45638, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12033, 45639, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (12033, 45640, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46037, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46038, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46039, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46040, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46041, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46042, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46043, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46044, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46045, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46046, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46047, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46048, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46049, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46050, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34134, 46051, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45088, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45089, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45090, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45091, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45092, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45093, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45094, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45095, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45096, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45097, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45098, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45099, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45100, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45101, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45102, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45103, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45104, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 45105, 4, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 46027, 1, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34154, 46348, 1, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34361, 45695, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34361, 45696, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34361, 45697, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34361, 45698, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34361, 45699, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34361, 45700, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34361, 45701, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34361, 45702, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34361, 45703, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34361, 45704, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45261, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45262, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45263, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45264, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45265, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45266, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45267, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45268, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45269, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45270, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45271, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45272, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45273, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45274, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34362, 45275, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34365, 45934, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34365, 45935, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34365, 45936, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34365, 45940, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34365, 45941, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34366, 45479, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34366, 45480, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34366, 45481, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34366, 45482, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34366, 45483, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34367, 45454, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34367, 45458, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34367, 45872, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34367, 45873, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34367, 45874, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34368, 45450, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34368, 45451, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34368, 45452, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34368, 45453, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34368, 45454, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34369, 45972, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34369, 45973, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34369, 45974, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34369, 45975, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34369, 45976, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34370, 45489, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34370, 45490, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34370, 45491, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34370, 45492, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34370, 45493, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34371, 45892, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34371, 45893, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34371, 45894, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34371, 45895, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34371, 45927, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34372, 45463, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34372, 45466, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34372, 45467, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34372, 45468, 0, 1, 1, 0, 1);
INSERT INTO `reference_loot_template` (`entry`, `item`, `Chance`, `lootmode`, `groupid`, `Reference`, `maxcount`) VALUES (34372, 45469, 0, 1, 1, 0, 1);





-- All Is Well That Ends Well correction.

UPDATE quest_template SET PrevQuestId=0 WHERE id=13631;






-- Remove the mounds from the Hodir's trash, they are giving some problems.

UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (34146, 34150, 34151);

DELETE FROM creature WHERE id IN(34146, 34150, 34151);



-- Correct the Boom xp and the Mimiron DB target.

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128|2  WHERE `entry` IN (33576);

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2  WHERE `entry` IN (34192);


-- Auriaya immunities
UPDATE creature_template SET mechanic_immune_mask=617299839 WHERE entry IN(33515, 34175);


-- Rubber Stalker Kologarn must be invisible

 UPDATE creature_template SET flags_extra=130 WHERE entry=33942;
 
 
 
 -- OVERLOAD Visual
 update creature_template SET flags_extra=130 WHERE entry IN(32866, 33690);
 
 
 
 -- SPELL Lightning Channel Pre-fight Visual (61942), used out of combat
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=61942;
INSERT INTO conditions VALUES (13, 1, 61942, 0, 0, 31, 0, 3, 32867, 0, 0, 0, 0, '', 'Target Steelbreaker');


DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(61920);
INSERT INTO conditions VALUES (13, 7, 61920, 0, 0, 31, 0, 3, 32867, 0, 0, 0, 0, '', 'Supercharge - target others');
INSERT INTO conditions VALUES (13, 7, 61920, 0, 1, 31, 0, 3, 32927, 0, 0, 0, 0, '', 'Supercharge - target others');
INSERT INTO conditions VALUES (13, 7, 61920, 0, 2, 31, 0, 3, 32857, 0, 0, 0, 0, '', 'Supercharge - target others');
INSERT INTO conditions VALUES (13, 7, 61920, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, '', 'Super Charge - target others');
INSERT INTO conditions VALUES (13, 7, 61920, 0, 1, 36, 0, 0, 0, 0, 0, 0, 0, '', 'Super Charge - target others');
INSERT INTO conditions VALUES (13, 7, 61920, 0, 2, 36, 0, 0, 0, 0, 0, 0, 0, '', 'Super Charge - target others');




-- Freya Nature Bomb
-- Nature Bomb (34129)

DELETE FROM creature_template WHERE entry IN(34129, 34153);
INSERT INTO `creature_template` VALUES (34129, 34153, 0, 0, 0, 0, 23258, 0, 0, 0, 'Nature Bomb', '', '', 0, 80, 80, 2, 16, 0, 1, 1.14286, 1, 0, 0, 2000, 2000, 1, 1, 1, 33554436, 2048, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 2, 1, 1, 1, 1, 0, 0, 1, 0, 128, 'npc_nature_bomb', 12340);
INSERT INTO `creature_template` VALUES (34153, 0, 0, 0, 0, 0, 23258, 0, 0, 0, 'Nature Bomb (1)', '', '', 0, 80, 80, 2, 16, 0, 1, 1.14286, 1, 0, 0, 2000, 2000, 1, 1, 1, 33554436, 2048, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 2, 1, 1, 15, 1, 0, 0, 1, 0, 128, '', 12340);




-- With Open Arms (10 player) (2951)
DELETE FROM disables WHERE sourceType=4 AND entry IN(10285);
DELETE FROM achievement_criteria_data WHERE criteria_id IN(10285);
INSERT INTO achievement_criteria_data VALUES(10285, 12, 0, 0, '');
INSERT INTO achievement_criteria_data VALUES(10285, 11, 0, 0, 'achievement_with_open_arms');

-- With Open Arms (25 player) (2952)
DELETE FROM disables WHERE sourceType=4 AND entry IN(10095);
DELETE FROM achievement_criteria_data WHERE criteria_id IN(10095);
INSERT INTO achievement_criteria_data VALUES(10095, 12, 1, 0, '');
INSERT INTO achievement_criteria_data VALUES(10095, 11, 0, 0, 'achievement_with_open_arms_25');


-- XT non combat.
DELETE FROM waypoint_data WHERE id=1360540;
INSERT INTO `waypoint_data` VALUES (1360540, 1, 886.275, -12.0545, 409.602, 0, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (1360540, 2, 886.041, -74.9557, 409.804, 0, 10000, 0, 1360540, 100, 0);
INSERT INTO `waypoint_data` VALUES (1360540, 3, 889.105, -6.64899, 409.409, 3.14159, 30000, 0, 1360541, 100, 0);
INSERT INTO `waypoint_data` VALUES (1360540, 4, 888.533, 37.1483, 409.803, 0, 10000, 0, 1360540, 100, 0);
DELETE FROM waypoint_scripts WHERE id IN(1360540, 1360541);
INSERT INTO `waypoint_scripts` VALUES (1360541, 0, 1, 401, 1, 0, 0, 0, 0, 0, 6);
INSERT INTO `waypoint_scripts` VALUES (1360540, 0, 1, 468, 1, 0, 0, 0, 0, 0, 5);


UPDATE creature_model_info SET CombatReach=8 WHERE displayid=29185;




INSERT INTO `conditions` VALUES (16, 0, 33060, 0, 2, 23, 0, 4652, 0, 0, 0, 0, 0, '', 'Salvaged Siege Engine, Formation Grounds Ulduar - Dismount player when not in intended zone');
INSERT INTO `conditions` VALUES (16, 0, 33060, 0, 1, 23, 0, 4650, 0, 0, 0, 0, 0, '', 'Salvaged Siege Engine, Iron Concourse Ulduar - Dismount player when not in intended zone');
INSERT INTO `conditions` VALUES (16, 0, 33060, 0, 0, 23, 0, 4665, 0, 0, 0, 0, 0, '', 'Salvaged Siege Engine, Expedition Base Camp Ulduar - Dismount player when not in intended zone');


INSERT INTO `conditions` VALUES (16, 0, 33109, 0, 2, 23, 0, 4652, 0, 0, 0, 0, 0, '', 'Demolisher, Formation Grounds Ulduar - Dismount player when not in intended zone');
INSERT INTO `conditions` VALUES (16, 0, 33109, 0, 1, 23, 0, 4650, 0, 0, 0, 0, 0, '', 'Demolisher, Iron Concourse Ulduar - Dismount player when not in intended zone');
INSERT INTO `conditions` VALUES (16, 0, 33109, 0, 0, 23, 0, 4665, 0, 0, 0, 0, 0, '', 'Demolisher, Expedition Base Camp Ulduar - Dismount player when not in intended zone');


-- Cosmic Smash's Algalon Stalker Asteroid Target 02
UPDATE `creature_template` SET `flags_extra`=128 WHERE  `entry`=34131;


-- Yogg-Saron should always drop a Fragment of Val'anyr.
DELETE FROM `creature_loot_template` WHERE `entry`= 33955 AND `item`=45038;
INSERT INTO `creature_loot_template` VALUES (33955, 45038, 0, 100, 0, 1, 0, 1, 1, NULL);

-- Ancient Gate of the Keepers flag
UPDATE gameobject_template SET flags=34 WHERE entry=194255;

-- Boomer XP-500 (34192, 34216)
UPDATE creature_template SET  AIName='', ScriptName='npc_boomer_xp' WHERE entry=34192;
UPDATE creature_template SET AIName='', ScriptName='' WHERE entry=34216;

DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(34192, 34216) AND `map`=603 AND SQRT( POW(position_x-2744.0, 2) + POW(position_y-2569.0, 2) ) < 150.0 );
DELETE FROM creature WHERE id IN(34192, 34216) AND `map`=603 AND SQRT( POW(position_x-2744.0, 2) + POW(position_y-2569.0, 2) ) < 150.0;
SET @pathid = 3419200;
SET @addval = 0;
DELETE FROM waypoint_data WHERE id >= @pathid AND id <= @pathid+19;
INSERT INTO `waypoint_data` VALUES (@pathid, 1, 2629.64, 2616.51, 372.361, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 2, 2654.94, 2654.57, 372.361, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 3, 2695.35, 2681.16, 372.204, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 4, 2741.47, 2690.39, 372.23, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 5, 2787.98, 2680.79, 372.133, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 6, 2826.61, 2654.66, 372.016, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 7, 2821.69, 2649.68, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 8, 2785.94, 2673.87, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 9, 2740.61, 2683.08, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 10, 2699.38, 2674.72, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 11, 2661.15, 2649.92, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 12, 2635.76, 2612.39, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 13, 2628.57, 2569.26, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 14, 2636.18, 2525.54, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 15, 2660.93, 2488.81, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 16, 2697.08, 2464.68, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 17, 2740.74, 2455.44, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 18, 2783.89, 2463.77, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 19, 2821.8, 2488.53, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 20, 2816.81, 2493.43, 372.293, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 21, 2782.55, 2470.39, 372.234, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 22, 2740.45, 2460.89, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 23, 2699.58, 2470.49, 372.176, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 24, 2665.73, 2493.91, 372.361, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 25, 2641.88, 2528.08, 372.083, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 26, 2635.42, 2569.58, 372.119, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 27, 2641.33, 2610.13, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 28, 2665.17, 2645.48, 372.052, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 29, 2699.96, 2668.64, 372.079, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 30, 2741.21, 2676.91, 372.082, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 31, 2782.39, 2668.78, 372.062, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 32, 2817.05, 2645.46, 372.131, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 33, 2824.61, 2651.82, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 34, 2786.6, 2676.5, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 35, 2741.81, 2685.92, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 36, 2695.92, 2677.58, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 37, 2659.35, 2652.44, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 38, 2633.26, 2613.82, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 39, 2624.58, 2569.48, 371.979, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (@pathid, 40, 2620.08, 2568.92, 372.361, 0, 0, 1, 0, 100, 0);
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO waypoint_data SELECT id+1, IF(point <= 2, point+40-2, point-2), position_x, position_y, position_z, orientation, delay, move_type, action, action_chance, wpguid FROM waypoint_data WHERE id=@pathid+@addval; SET @addval := @addval+1;
INSERT INTO creature SELECT NULL, 34192, 603, 0, 0, 3, 1, 0, 0, position_x, position_y, position_z, orientation, 900, 0, 0, 1, 0, 2, 0, 0, 0, 0 FROM waypoint_data WHERE id >= 3419200 AND id <= 3419219 AND point=40 ORDER BY point ASC;
SET @pathid := @pathid-1;
INSERT INTO creature_addon SELECT guid, (@pathid := @pathid+1), 0, 0, 1, 0, '' FROM creature WHERE id IN(34192, 34216) AND `map`=603 AND SQRT( POW(position_x-2744.0, 2) + POW(position_y-2569.0, 2) ) < 150.0 ORDER BY guid ASC;

-- Ancient Gate of the Keepers
DELETE FROM `creature_template` WHERE `entry`=381558;
INSERT INTO `creature_template` VALUES (381558, 0, 0, 0, 0, 0, 169, 11686, 0, 0, 'Ancient Gate of the Keepers voice', '', '', 0, 80, 80, 2, 35, 0, 1, 1.14286, 1, 1, 0, 2000, 2000, 1, 1, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 10, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 4, 1, 700, 500, 1, 7.5, 1, 0, 184, 1, 0, 128, '', 12340);
DELETE FROM `creature_text` WHERE `entry`=381558;
INSERT INTO `creature_text` VALUES (381558, 0, 0, 'The Ancient Gate of the Keepers unlocks!', 41, 0, 100, 0, 0, 0, 0, 3, 'Ancient Gate of the Keepers, General Vezax door.');


-- Correct Razorscale's Hitbox.
 UPDATE creature_model_info SET BoundingRadius = 1.5, combatreach=15 WHERE displayid=28787;