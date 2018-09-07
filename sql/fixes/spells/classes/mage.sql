-- Fingers of Frost Proc on Arcane Blast self aura
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (74396, 'spell_mage_fingers_of_frost');

-- Pet Scaling
DELETE FROM spell_script_names WHERE spell_id IN(35657, 35658, 35659, 35660, -35657, -35658, -35659, -35660);
INSERT INTO spell_script_names VALUES (35657, 'spell_mage_pet_scaling');
INSERT INTO spell_script_names VALUES (35658, 'spell_mage_pet_scaling');
INSERT INTO spell_script_names VALUES (35659, 'spell_mage_pet_scaling');
INSERT INTO spell_script_names VALUES (35660, 'spell_mage_pet_scaling');


-- Ice Block
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=45438;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
(45438, -770, 1, 'Mage Ice Block cancels Faerie Fire'),
(45438, -44457, 1, 'Mage Ice Block cancels Living Bomb');

-- Brain Freeze
UPDATE `spell_proc_event` SET `Cooldown`=3 WHERE  `entry` IN (44546, 44548, 44549);

-- Dalaran Brilliance
DELETE FROM `spell_script_names` WHERE `spell_id`=61316;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (61316, 'spell_dalaran_brilliance');