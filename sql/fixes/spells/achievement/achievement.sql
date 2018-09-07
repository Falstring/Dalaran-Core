-- Achievement
-- Achiemement - Giggy Up - http://wotlk.openwow.com/achievement=891
-- spell_apprentice_riding
DELETE FROM `spell_script_names` WHERE `spell_id`=33388;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(33388, 'spell_gen_apprentice_riding');
-- http://wowwiki.wikia.com/wiki/Torch_Juggler 
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=6937 AND `type`=6 AND `value1`=4395;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(6937, 6, 4395, 0, '');
