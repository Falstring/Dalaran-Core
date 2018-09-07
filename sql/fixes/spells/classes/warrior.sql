-- spell_warr_intervene
DELETE FROM `spell_script_names` WHERE  `spell_id` IN (3411);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(3411, 'spell_warr_intervene');

-- Warrior Enrage
DELETE FROM `spell_script_names` WHERE (`ScriptName`='spell_warr_enrage');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(-12317, 'spell_warr_enrage'),
(-46867, 'spell_warr_enrage'),
(-29593, 'spell_warr_enrage');

-- Warrior Revenge
DELETE FROM `spell_script_names` WHERE (`ScriptName`='spell_warr_revenge');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (-6572, 'spell_warr_revenge');

-- Sweeping Strike trigger
DELETE FROM `spell_custom_attr` WHERE (`entry`= 12723);
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES (12723, 32768);

-- Intervene
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES (59667, 64);

-- Taste for Blood
DELETE FROM `spell_script_names` WHERE  `spell_id` IN (-56636);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(-56636, 'spell_warr_taste_for_blood');
