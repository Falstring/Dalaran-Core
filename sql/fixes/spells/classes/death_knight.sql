-- Anti-Magic Shell - Cyclone Immunity
DELETE FROM `spell_linked_spell` WHERE (`spell_trigger`='48707') AND (`spell_effect`='-33786') AND (`type`='2');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES ('48707', '-33786', '2', 'Anti-Magic Shell (Self) - Cyclone Immunity');#

-- Dancing Rune Weapon - Spell proc flags and pet script
DELETE FROM `spell_proc_event` WHERE `entry`=49028 AND `procFlags`=86096;
INSERT INTO `spell_proc_event` (`entry`, `procFlags`, `procEx`) VALUES
('49028','86096','65536');
UPDATE `creature_template` SET `ScriptName`='npc_pet_dk_dancing_rune_weapon' WHERE  `entry`=27893;

-- Pet Scaling
DELETE FROM `spell_script_names` WHERE `spell_id` IN ('54566', '51996', '61697');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
('54566', 'spell_dk_pet_scaling'),
('51996', 'spell_dk_pet_scaling'),
('61697', 'spell_dk_pet_scaling');

-- Rune of the Fallen Crusader
UPDATE `spell_enchant_proc_data` SET `PPMChance`=2 WHERE (`entry`=3368);

-- Gargoyle Strike
DELETE FROM spell_bonus_data WHERE entry=51963;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `comments`) VALUES (51963, 1, 'Pet Death Knight Gargoyle Strike');

-- Killing Machine
UPDATE `spell_proc_event` SET `ppmRate`=3 WHERE (`entry`=51128);
UPDATE `spell_proc_event` SET `ppmRate`=3 WHERE (`entry`=51129);
UPDATE `spell_proc_event` SET `ppmRate`=3 WHERE (`entry`=51130);
DELETE FROM `spell_script_names` WHERE `spell_id`=-51123;
INSERT INTO `spell_script_names` VALUES (-51123, 'spell_dk_killing_machine');

-- Scent of Blood
UPDATE `spell_proc_event` SET `Cooldown`=1 WHERE (`entry`=50421);
DELETE FROM `spell_script_names` WHERE `spell_id`=-49004;
INSERT INTO `spell_script_names` VALUES (-49004, 'spell_gen_proc_from_direct_damage');

-- Rune of the Fallen Crusader
UPDATE `spell_enchant_proc_data` SET `PPMChance`=2 WHERE (`entry`=3368);

-- [Death Knight] Death and Decay
DELETE FROM `spell_threat` WHERE `entry` IN (52212, 43265, 49936, 49937, 49938);
INSERT INTO `spell_threat` (`entry`, `flatMod`, `pctMod`, `apPctMod`) VALUES 
(49936, NULL, 1.9, 0),
(49937, NULL, 1.9, 0),
(49938, NULL, 1.9, 0),
(52212, NULL, 1.9, 0);

-- Passive Threat for tanks
DELETE FROM `spell_linked_spell` WHERE `spell_effect` IN (57339, 57340, -57339, -57340);
INSERT INTO `spell_linked_spell` VALUES (7376, 57339, 2, 'Defensive Stance Passive - Tank Class Passive Threat');
INSERT INTO `spell_linked_spell` VALUES (21178, 57339, 2, 'Bear Form (Passive2) - Tank Class Passive Threat');
INSERT INTO `spell_linked_spell` VALUES (25780, 57340, 2, 'Righteous Fury - Tank Class Passive Threat');
INSERT INTO `spell_linked_spell` VALUES (48263, 57340, 2, 'Frost Presence - Tank Class Passive Threat');
INSERT INTO `spell_linked_spell` VALUES (-7376, -57339, 0, 'Defensive Stance Passive - Tank Class Passive Threat Remove');
INSERT INTO `spell_linked_spell` VALUES (-21178, -57339, 0, 'Bear Form (Passive2) - Tank Class Passive Threat Remove');
INSERT INTO `spell_linked_spell` VALUES (-25780, -57340, 0, 'Righteous Fury - Tank Class Passive Threat Remove');
INSERT INTO `spell_linked_spell` VALUES (-48263, -57340, 0, 'Frost Presence - Tank Class Passive Threat Remove');

-- Blood Worm
UPDATE `creature_template` SET `ScriptName`='npc_pet_dk_guardian', `AIName`='' WHERE `entry`=28017;

-- Risen Ghoul
DELETE FROM `pet_levelstats` WHERE `creature_entry`=26125;
INSERT INTO `pet_levelstats` (`creature_entry`, `level`, `hp`, `mana`, `armor`, `str`, `agi`, `sta`, `inte`, `spi`) VALUES 
(26125, 1, 48, 80, 10, 20, 16, 13, 20, 8),
(26125, 2, 105, 106, 67, 22, 17, 14, 21, 9),
(26125, 3, 162, 132, 124, 24, 18, 15, 22, 10),
(26125, 4, 219, 158, 181, 26, 19, 16, 23, 11),
(26125, 5, 276, 184, 238, 28, 20, 17, 24, 12),
(26125, 6, 333, 210, 295, 30, 21, 18, 25, 13),
(26125, 7, 390, 236, 352, 32, 22, 19, 26, 14),
(26125, 8, 447, 262, 409, 34, 23, 20, 27, 15),
(26125, 9, 504, 288, 466, 36, 24, 21, 28, 16),
(26125, 10, 561, 314, 523, 38, 25, 22, 29, 17),
(26125, 11, 618, 340, 580, 40, 26, 23, 30, 18),
(26125, 12, 675, 366, 637, 42, 27, 24, 31, 19),
(26125, 13, 732, 392, 694, 44, 28, 25, 32, 20),
(26125, 14, 789, 418, 751, 46, 29, 26, 33, 21),
(26125, 15, 846, 444, 808, 48, 30, 27, 34, 22),
(26125, 16, 903, 470, 865, 50, 31, 28, 35, 23),
(26125, 17, 960, 496, 922, 52, 32, 29, 36, 24),
(26125, 18, 1017, 522, 979, 54, 33, 30, 37, 25),
(26125, 19, 1074, 548, 1036, 56, 34, 31, 38, 26),
(26125, 20, 1131, 574, 1093, 58, 35, 32, 39, 27),
(26125, 21, 1188, 600, 1150, 60, 36, 33, 40, 28),
(26125, 22, 1245, 626, 1207, 62, 37, 34, 41, 29),
(26125, 23, 1302, 652, 1264, 64, 38, 35, 42, 30),
(26125, 24, 1359, 678, 1321, 66, 39, 36, 43, 31),
(26125, 25, 1416, 704, 1378, 68, 40, 37, 44, 32),
(26125, 26, 1473, 730, 1435, 70, 41, 38, 45, 33),
(26125, 27, 1530, 756, 1492, 72, 42, 39, 46, 34),
(26125, 28, 1587, 782, 1549, 74, 43, 40, 47, 35),
(26125, 29, 1644, 808, 1606, 76, 44, 41, 48, 36),
(26125, 30, 1701, 834, 1663, 78, 45, 42, 49, 37),
(26125, 31, 1758, 860, 1720, 80, 46, 43, 50, 38),
(26125, 32, 1815, 886, 1777, 82, 47, 44, 51, 39),
(26125, 33, 1872, 912, 1834, 84, 48, 45, 52, 40),
(26125, 34, 1929, 938, 1891, 86, 49, 46, 53, 41),
(26125, 35, 1986, 964, 1948, 88, 50, 47, 54, 42),
(26125, 36, 2043, 990, 2005, 90, 51, 48, 55, 43),
(26125, 37, 2100, 1016, 2062, 92, 52, 49, 56, 44),
(26125, 38, 2157, 1042, 2119, 94, 53, 50, 57, 45),
(26125, 39, 2214, 1068, 2176, 96, 54, 51, 58, 46),
(26125, 40, 2271, 1094, 2233, 98, 55, 52, 59, 47),
(26125, 41, 2328, 1120, 2290, 100, 56, 53, 60, 48),
(26125, 42, 2385, 1146, 2347, 102, 57, 54, 61, 49),
(26125, 43, 2442, 1172, 2404, 104, 58, 55, 62, 50),
(26125, 44, 2499, 1198, 2461, 106, 59, 56, 63, 51),
(26125, 45, 2556, 1224, 2518, 108, 60, 57, 64, 52),
(26125, 46, 2613, 1250, 2575, 110, 61, 58, 65, 53),
(26125, 47, 2670, 1276, 2632, 112, 62, 59, 66, 54),
(26125, 48, 2727, 1302, 2689, 114, 63, 60, 67, 55),
(26125, 49, 2784, 1328, 2746, 116, 64, 61, 68, 56),
(26125, 50, 2841, 1354, 2803, 118, 65, 62, 69, 57),
(26125, 51, 2898, 1380, 2860, 120, 66, 63, 70, 58),
(26125, 52, 2955, 1406, 2917, 122, 67, 64, 71, 59),
(26125, 53, 3012, 1432, 2974, 124, 68, 65, 72, 60),
(26125, 54, 3069, 1458, 3031, 126, 69, 66, 73, 61),
(26125, 55, 3126, 1484, 3088, 128, 70, 67, 74, 62),
(26125, 56, 3183, 1510, 3145, 130, 71, 68, 75, 63),
(26125, 57, 3240, 1536, 3202, 132, 72, 69, 76, 64),
(26125, 58, 3297, 1562, 3259, 134, 73, 70, 77, 65),
(26125, 59, 3354, 1588, 3316, 136, 74, 71, 78, 66),
(26125, 60, 3411, 1614, 3373, 138, 75, 72, 79, 67),
(26125, 61, 3468, 1640, 3430, 140, 76, 73, 80, 68),
(26125, 62, 3525, 1666, 3487, 142, 77, 74, 81, 69),
(26125, 63, 3582, 1692, 3544, 144, 78, 75, 82, 70),
(26125, 64, 3639, 1718, 3601, 146, 79, 76, 83, 71),
(26125, 65, 3696, 1744, 3658, 148, 80, 77, 84, 72),
(26125, 66, 3753, 1770, 3715, 150, 81, 78, 85, 73),
(26125, 67, 3810, 1796, 3772, 152, 82, 79, 86, 74),
(26125, 68, 3867, 1822, 3829, 154, 83, 80, 87, 75),
(26125, 69, 3924, 1848, 3886, 156, 84, 81, 88, 76),
(26125, 70, 3981, 1874, 3943, 158, 85, 82, 89, 77),
(26125, 71, 4046, 1902, 4233, 160, 88, 84, 91, 78),
(26125, 72, 4112, 1931, 4528, 162, 88, 84, 92, 80),
(26125, 73, 4179, 1960, 4828, 163, 90, 86, 94, 81),
(26125, 74, 4247, 1990, 5133, 164, 90, 87, 95, 82),
(26125, 75, 4315, 2021, 5438, 166, 94, 88, 97, 84),
(26125, 76, 4384, 2051, 5748, 168, 95, 90, 98, 86),
(26125, 77, 4454, 2084, 6058, 170, 95, 91, 99, 87),
(26125, 78, 4525, 2116, 6368, 174, 96, 92, 100, 88),
(26125, 79, 4597, 2149, 6683, 178, 97, 92, 101, 88),
(26125, 80, 4665, 2186, 6993, 331, 247, 361, 103, 90);

-- Army of the Dead Ghoul SAI
SET @ENTRY := 24207;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,11,7398,0,0,0,0,0,1,0,0,0,0,0,0,0,"Army of the Dead Ghoul - Out of Combat - Cast 'Birth' (No Repeat)"),
(@ENTRY,0,1,0,1,0,100,1,0,0,0,0,11,43264,0,0,0,0,0,1,0,0,0,0,0,0,0,"Army of the Dead Ghoul - Out of Combat - Cast 'Periodic Taunt' (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,0,2000,2000,30000,30000,11,47482,0,0,0,0,0,2,0,0,0,0,0,0,0,"Army of the Dead Ghoul - In Combat - Cast 'Leap'"),
(@ENTRY,0,3,0,0,0,100,0,1000,1000,4000,5000,11,47468,3,0,0,0,0,2,0,0,0,0,0,0,0,"Army of the Dead Ghoul - In Combat - Cast 'Claw'");

DELETE FROM `spell_script_names` WHERE `spell_id` = 43263;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(43263, 'spell_dk_ghul_taunt');


DELETE FROM `spell_group_stack_rules` WHERE `group_id`= 1039;
INSERT INTO `spell_group_stack_rules` VALUES ('1039', '16');
-- Group of Death Wish (Warrior enrages) and DK Hysteria, effect exclusive
INSERT INTO `spell_group` VALUES ('1039', '12292');
INSERT INTO `spell_group` VALUES ('1039', '49016');
INSERT INTO `spell_group` VALUES ('1039', '12880');
INSERT INTO `spell_group` VALUES ('1039', '57518');
INSERT INTO `spell_group` VALUES ('1039', '57933');
INSERT INTO `spell_group` VALUES ('1039', '31884');
INSERT INTO `spell_group` VALUES ('1039', '34471');
INSERT INTO `spell_group` VALUES ('1039', '48391');