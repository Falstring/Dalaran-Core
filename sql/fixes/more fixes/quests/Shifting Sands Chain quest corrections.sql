-- Maws 

DELETE FROM event_scripts WHERE id=9542;
INSERT INTO `event_scripts` VALUES (9542, 0, 10, 15571, 9000000, 0, 3504.19, -6637.86, -2.55, 1.12);

-- DELETE THE LAST QUEST OF THE CHAIN JUST TO BE SURE, YOU MUST ADD IT THE NEXT WEEK.

DELETE FROM creature_queststarter WHERE id=15693 AND quest=8745;
DELETE FROM creature_questender WHERE id=15693 AND quest=8745;
DELETE FROM gameobject_questender WHERE id=180718;
DELETE FROM gameobject_queststarter WHERE id=180718;

UPDATE quest_template_addon SET PrevQuestID=8743 WHERE id=8745;


/*







NO TE OLVIDES DE AGREGAR A JONATHAN THE REVELATOR LA ULTIMA QUEST 8745







*/


-- Bang a gong, last quests.

DELETE FROM gameobject_questender WHERE id=180718;
DELETE FROM gameobject_queststarter WHERE id=180718;
INSERT INTO `gameobject_questender` VALUES (180718, 8743);
INSERT INTO `gameobject_queststarter` VALUES (180718, 8743);

UPDATE gameobject_template SET type=2 WHERE entry=180718;


-- Jonathan the revelator quest.
DELETE FROM creature_queststarter WHERE id=15693 AND quest=8745;
DELETE FROM creature_questender WHERE id=15693 AND quest=8745;
INSERT INTO creature_queststarter VALUES(15693, 8745);
INSERT INTO creature_questender VALUES(15693, 8745);


UPDATE quest_template SET QuestType=2, QuestInfoID=0 WHERE id=8743;



DELETE FROM achievement_reward WHERE entry=416;
INSERT INTO achievement_reward VALUES(416, 46, 46, 0, 0, "", "", 0);





