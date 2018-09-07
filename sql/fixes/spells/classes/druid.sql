
DELETE FROM `spell_script_names` WHERE `spell_id` = 17770;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES ('17770', 'spell_gen_wolfshead_energy');

-- Nature's Grasp internal cooldown
DELETE FROM `spell_proc_event` WHERE `entry` = -16689;
INSERT INTO `spell_proc_event` (`entry`, `Cooldown`) VALUES ('-16689', '2');

-- Enrage armor reduce
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dru_bear_form_passive';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(1178,'spell_dru_bear_form_passive'),
(9635,'spell_dru_bear_form_passive');

-- Primal Fury
DELETE FROM `spell_custom_attr` WHERE `entry` IN ('16954', '16961');
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES
('16954', '1048576'),
('16961', '1048576');

-- Force of Nature
DELETE FROM `creature_template_addon` WHERE (`entry`='1964');
INSERT INTO `creature_template_addon` (`entry`, `bytes1`, `bytes2`, `auras`) VALUES ('1964', '0', '4097', '50419');
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dru_brambles_treant';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES ('50419', 'spell_dru_brambles_treant');

-- Pet Scaling
DELETE FROM spell_script_names WHERE spell_id IN(35669, 35670, 35671, 35672, -35669, -35670, -35671, -35672);
INSERT INTO spell_script_names VALUES (35669, 'spell_dru_pet_scaling');
INSERT INTO spell_script_names VALUES (35670, 'spell_dru_pet_scaling');
INSERT INTO spell_script_names VALUES (35671, 'spell_dru_pet_scaling');
INSERT INTO spell_script_names VALUES (35672, 'spell_dru_pet_scaling');
