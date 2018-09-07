-- Penance (Add Attr SPELL_ATTR0_CU_FORCE_REFLECT)
DELETE FROM `spell_custom_attr` WHERE `entry` IN ('47666', '52998', '52999', '53000');
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES
('47666', '4194304'),
('52998', '4194304'),
('52999', '4194304'),
('53000', '4194304');

-- Serendipity
DELETE FROM `spell_proc_event` WHERE (`entry`='-63730');
INSERT INTO `spell_proc_event` (`entry`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `Cooldown`) VALUES ('-63730', '6', '2048', '4', '0');
DELETE FROM `spell_script_names` WHERE (`spell_id`='-63730');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES ('-63730', 'spell_pri_serendipity');

-- Pet Scaling
DELETE FROM spell_script_names WHERE spell_id IN(35661, 35662, 35663, 35664, -35661, -35662, -35663, -35664);
INSERT INTO spell_script_names VALUES (35661, 'spell_pri_pet_scaling');
INSERT INTO spell_script_names VALUES (35662, 'spell_pri_pet_scaling');
INSERT INTO spell_script_names VALUES (35663, 'spell_pri_pet_scaling');
INSERT INTO spell_script_names VALUES (35664, 'spell_pri_pet_scaling');
