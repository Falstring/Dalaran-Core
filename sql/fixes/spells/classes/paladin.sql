-- Hand of Sacrifice can't be casted on targets with Divine Sacrifice
DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=17 AND `SourceEntry`=6940; 
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `NegativeCondition`, `ErrorType`, `Comment`) VALUES ('17', '6940', '1', '1', '64205', '1', '173', 'Cant use Hand of Sacrifice while Divine Sacrifice is active');

-- Pursuit of Justice linked mount speed
DELETE FROM spell_linked_spell WHERE spell_trigger IN(26022, 26023, -26022, -26023);
INSERT INTO spell_linked_spell VALUES (26022, 61417, 2, 'Pursuit of Justice add');
INSERT INTO spell_linked_spell VALUES (26023, 61418, 2, 'Pursuit of Justice add');
INSERT INTO spell_linked_spell VALUES (-26022, -61417, 0, 'Pursuit of Justice remove');
INSERT INTO spell_linked_spell VALUES (-26023, -61418, 0, 'Pursuit of Justice remove');
UPDATE `spell_dbc` SET `AttributesEx3`=0x100000 WHERE `Id` IN (61417, 61418);

-- Judgement of Wisdom
DELETE FROM `spell_proc_event` WHERE (`entry`='20186');
INSERT INTO `spell_proc_event` (`entry`, `ppmRate`) VALUES ('20186', '15');

-- Judgement of Light
DELETE FROM `spell_proc_event` WHERE (`entry`='20185');
INSERT INTO `spell_proc_event` (`entry`, `ppmRate`) VALUES ('20185', '15');

-- Seal of Command
DELETE FROM `spell_proc_event` WHERE (`entry`='20375');
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `Cooldown`) VALUES ('20375', '3', '1');

-- Remove bugged spell_scripts
DELETE FROM `spell_script_names` WHERE `spell_id` IN (31821, 64364, -20254, -20138, 31869, -53379, 63510, 63514, 63531);

-- Hand of Protection
DELETE FROM `spell_custom_attr` WHERE `entry` IN (1022, 5599, 10278);
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES
('1022', '524288'),
('5599', '524288'),
('10278', '524288');

-- Seal of Command
DELETE FROM `spell_proc_event` WHERE (`entry`='20375');
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`) VALUES ('20375', '3');
DELETE FROM spell_script_names WHERE spell_id IN (20375, 20424);
INSERT INTO spell_script_names VALUES (20375, 'spell_pal_seal_of_command');
INSERT INTO spell_script_names VALUES (20424, 'spell_pal_seal_of_command');

-- [Paladin] Reckoning
DELETE FROM `spell_proc_event` WHERE `entry`=20182;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(20182, 0, 0, 0, 0, 0, 0, 262211, 0, 0, 0);
