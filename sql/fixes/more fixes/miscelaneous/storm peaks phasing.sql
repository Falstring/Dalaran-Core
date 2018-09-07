


-- Fury of the Frostborn King (12879)

DELETE FROM spell_area WHERE spell IN(55782, 55783);

INSERT INTO `spell_area` VALUES (55782, 4431, 12879, 12973, 0, 0, 2, 1, 74, 1);
INSERT INTO `spell_area` VALUES (55782, 4432, 12879, 12973, 0, 0, 2, 1, 74, 8);
INSERT INTO `spell_area` VALUES (55782, 4473, 12879, 12973, 0, 0, 2, 1, 74, 1);
INSERT INTO `spell_area` VALUES (55783, 4432, 12879, 0, 0, 0, 2, 1, 10, 0);


UPDATE creature_template SET faction=1955 WHERE entry IN(30591, 30060);
UPDATE creature_template SET faction=1802 WHERE entry IN(30182, 30065);
UPDATE creature_template SET faction=2108 WHERE entry IN(30063, 30064);



-- The Brothers bronzebeard must have The Master Explorer
UPDATE quest_template_addon SET PrevQuestID=12880 WHERE id IN(12973, 13417);



-- Revert tot he last one with the hope that the prevquest for Brothers bronzebeard (the quest master explorer) fix it
DELETE FROM spell_area WHERE spell IN(55782, 55783);
INSERT INTO `spell_area` VALUES (55782, 4432, 12973, 0, 0, 0, 2, 1, 74, 0);
INSERT INTO `spell_area` VALUES (55783, 4432, 12879, 12973, 0, 0, 2, 1, 66, 1);
