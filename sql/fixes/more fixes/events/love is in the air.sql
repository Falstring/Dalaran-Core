
UPDATE creature_template SET ScriptName="npc_love_in_air_hummel" WHERE entry=36296;

DELETE FROM item_loot_template WHERE entry=54537;
INSERT INTO item_loot_template VALUES(54537, 49927, 0, 100, 0, 1, 1, 5, 10, NULL);
INSERT INTO item_loot_template VALUES(54537, 50250, 0, 2, 0, 1, 1, 1, 1, NULL);
-- INSERT INTO item_loot_template VALUES(54537, 1, 0, 15, 0, 1, 0, -50011, 1);