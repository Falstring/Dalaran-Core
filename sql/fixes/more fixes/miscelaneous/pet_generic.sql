UPDATE creature_template SET scriptname="npc_pet_onyxian_whelpling" WHERE entry=36607;

DELETE FROM creature_text WHERE entry=36607;
INSERT INTO `creature_text` VALUES (36607, 0, 0, 'Onyxian Whelpling takes in a deep breath...', 16, 0, 100, 0, 0, 0, 0, 0, 'Deep Breath');
