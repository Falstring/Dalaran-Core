-- WANTED: Murkdeep! (4740)
UPDATE creature_template SET AIName="", ScriptName="npc_murkdeep" WHERE entry=10323;
DELETE FROM creature WHERE id=10323;
INSERT INTO `creature` VALUES (7444651, 10323, 1, 0, 0, 1, 1, 0, 1, 4986, 604, -0.964006, 5.75207, 300, 0, 0, 517, 0, 0, 0, 0, 0, 0);

