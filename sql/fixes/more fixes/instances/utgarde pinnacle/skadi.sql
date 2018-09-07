UPDATE gameobject_template SET ScriptName="go_harpoon_canon" WHERE entry IN(192175, 192176, 192177);

-- Grauf.
UPDATE creature_template SET InhabitType=5 WHERE entry in(26893,  30775);
UPDATE creature_template SET ScriptName="boss_skadi_grauf" WHERE entry=26893;

-- My Girl Loves to Skadi All the Time (2156)
DELETE FROM disables WHERE sourceType=4 AND entry IN(7595);
DELETE FROM achievement_criteria_data WHERE criteria_id IN(7595);
INSERT INTO achievement_criteria_data VALUES(7595, 12, 1, 0, "");
INSERT INTO achievement_criteria_data VALUES(7595, 18, 0, 0, "");


-- conditions
-- chains
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=48641;
INSERT INTO conditions VALUES(13, 1, 48641, 0, 0, 31, 0, 3, 26893, 0, 0, 0, 0, '', '');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=48642;
INSERT INTO conditions VALUES(13, 1, 48642, 0, 0, 31, 0, 3, 26893, 0, 0, 0, 0, '', '');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=56570;
INSERT INTO conditions VALUES(13, 1, 56570, 0, 0, 31, 0, 3, 26893, 0, 0, 0, 0, '', '');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=56578;
INSERT INTO conditions VALUES(13, 3, 56578, 0, 0, 31, 0, 3, 26893, 0, 0, 0, 0, '', '');
-- flame breath
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=47593;
INSERT INTO conditions VALUES(13, 1, 47593, 0, 0, 31, 0, 3, 28351, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(13, 1, 47593, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, '', '');
-- lodi dodi achievement
DELETE FROM achievement_criteria_data WHERE criteria_id IN(7181);
DELETE FROM disables WHERE sourceType=4 AND entry IN(7181);
INSERT INTO achievement_criteria_data VALUES(7181, 1, 26693, 0, "");