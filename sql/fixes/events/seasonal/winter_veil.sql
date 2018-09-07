-- Crashin' Trashin'
UPDATE creature_template SET modelid1=11686, modelid2=0, modelid3=0, modelid4=0 WHERE entry=27674;
REPLACE INTO creature_template_addon VALUES(27664, 0, 0, 0, 1, 0, "49384");
REPLACE INTO creature_template_addon VALUES(40281, 0, 0, 0, 1, 0, "75110");
UPDATE creature_template SET spell1=49297 WHERE entry IN(27664, 40281);
DELETE FROM spell_script_names WHERE spell_id IN(49297, 49325);
INSERT INTO spell_script_names VALUES(49297, "spell_winter_veil_racer_rocket_slam");
INSERT INTO spell_script_names VALUES(49325, "spell_winter_veil_racer_slam_hit");
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(49325);
INSERT INTO conditions VALUES(13, 1, 49325, 0, 0, 31, 0, 3, 27664, 0, 0, 0, 0, '', 'Crashin Trashin');
INSERT INTO conditions VALUES(13, 1, 49325, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, '', 'Crashin Trashin');
INSERT INTO conditions VALUES(13, 1, 49325, 0, 1, 31, 0, 3, 40281, 0, 0, 0, 0, '', 'Crashin Trashin');
INSERT INTO conditions VALUES(13, 1, 49325, 0, 1, 36, 0, 0, 0, 0, 0, 0, 0, '', 'Crashin Trashin');

-- Crashin' & Thrashin' (1295)
DELETE FROM achievement_criteria_data WHERE criteria_id IN(4090);
DELETE FROM disables WHERE sourceType=4 AND entry IN(4090);
INSERT INTO achievement_criteria_data VALUES(4090, 0, 0, 0, "");
INSERT INTO achievement_criteria_data VALUES(4090, 16, 141, 0, "");

-- Preserved Holly, update spell to avoid confusions.
UPDATE `item_template` SET `spellid_1`=25860 WHERE `entry`=21213;
