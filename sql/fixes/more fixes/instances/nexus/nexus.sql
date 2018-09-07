DELETE FROM creature_text WHERE entry=26793;
INSERT INTO `creature_text` VALUES (26793, 0, 0, 'Crystalline Frayer begins to emerge from its Seed Pod', 16, 0, 100, 0, 0, 0, 0, 0, 'Crystalline Frayer');

UPDATE creature_template SET RegenHealth=1, AIName='', ScriptName='npc_crystalline_frayer' WHERE entry=26793;
UPDATE creature_template SET RegenHealth=1, AIName='', ScriptName='' WHERE entry=30528;
DELETE FROM smart_scripts WHERE entryorguid=26793 and source_type=0;