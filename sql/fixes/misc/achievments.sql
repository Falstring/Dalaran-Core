-- Vehicular Gnomeslaughter
DELETE FROM `disables` WHERE (`sourceType`='4') AND (`entry`='7704');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`) VALUES ('7704', '6', '4197');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `ScriptName`) VALUES ('7704', '11', 'achievement_wg_vehicular_gnomeslaughter');
