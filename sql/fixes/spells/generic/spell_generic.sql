-- Spell generic
DELETE FROM `spell_script_names` WHERE `spell_id` = 35201 AND `ScriptName` = 'spell_gen_paralytic_poison';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (35201,'spell_gen_paralytic_poison');
-- spell_dragonblight_ice_cannon
DELETE FROM `spell_script_names` WHERE `spell_id` = 49316;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(49316, 'spell_dragonblight_ice_cannon');


-- Northsea Force Reaction 44017 

DELETE FROM spell_script_names WHERE spell_id=44017;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
    (44017, 'spell_northsea_force_reaction');

-- Contagion of Rot - prevent stacking
DELETE FROM `spell_custom_attr` WHERE `entry`=7103;
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES (7103, 2097152);

-- spell_taunka_transform
-- Taunka'le Refugee
UPDATE `creature_equip_template` SET `ItemID1`=0 WHERE  `CreatureID` IN (26184, 26179);
DELETE FROM `spell_script_names` WHERE `spell_id`=47024;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(47024, 'spell_taunka_transform');