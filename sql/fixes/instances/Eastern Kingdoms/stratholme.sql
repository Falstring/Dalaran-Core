-- -------------------------------------------
-- STRATHOLME
-- -------------------------------------------


-- Houses of the Holy - [A][H] http://www.wowhead.com/quest=5243/houses-of-the-holy
-- Collection of Goods - [A] http://www.wowhead.com/quest=7642/collection-of-goods

-- GO Supply Crate (176304)
UPDATE gameobject_template SET AIName='SmartGameObjectAI', ScriptName='' WHERE entry=176304;
DELETE FROM smart_scripts WHERE entryorguid=176304 AND source_type=1;
INSERT INTO smart_scripts VALUES (176304, 1, 0, 1, 64, 0, 100, 0, 1, 0, 0, 0, 67, 1, 5000, 5000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (176304, 1, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 16369, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Gossip Hello - Cast Bugs');
INSERT INTO smart_scripts VALUES (176304, 1, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 131, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Gossip Hello - Set Gameobject State');
INSERT INTO smart_scripts VALUES (176304, 1, 3, 0, 59, 0, 100, 0, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Timed Event - Set Loot State');

-- GO Supply Crate (176307)
UPDATE gameobject_template SET AIName='SmartGameObjectAI', ScriptName='' WHERE entry=176307;
DELETE FROM smart_scripts WHERE entryorguid=176307 AND source_type=1;
INSERT INTO smart_scripts VALUES (176307, 1, 0, 1, 64, 0, 100, 0, 1, 0, 0, 0, 67, 1, 5000, 5000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (176307, 1, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 16370, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Gossip Hello - Cast Maggots');
INSERT INTO smart_scripts VALUES (176307, 1, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 131, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Gossip Hello - Set Gameobject State');
INSERT INTO smart_scripts VALUES (176307, 1, 3, 0, 59, 0, 100, 0, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Timed Event - Set Loot State');

-- GO Supply Crate (176308)
UPDATE gameobject_template SET AIName='SmartGameObjectAI', ScriptName='' WHERE entry=176308;
DELETE FROM smart_scripts WHERE entryorguid=176308 AND source_type=1;
INSERT INTO smart_scripts VALUES (176308, 1, 0, 1, 64, 0, 100, 0, 1, 0, 0, 0, 67, 1, 5000, 5000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (176308, 1, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 16371, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Gossip Hello - Cast Rats');
INSERT INTO smart_scripts VALUES (176308, 1, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 131, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Gossip Hello - Set Gameobject State');
INSERT INTO smart_scripts VALUES (176308, 1, 3, 0, 59, 0, 100, 0, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Timed Event - Set Loot State');

-- GO Supply Crate (176309)
UPDATE gameobject_template SET AIName='SmartGameObjectAI', ScriptName='' WHERE entry=176309;
DELETE FROM smart_scripts WHERE entryorguid=176309 AND source_type=1;
INSERT INTO smart_scripts VALUES (176309, 1, 0, 1, 64, 0, 100, 0, 1, 0, 0, 0, 67, 1, 5000, 5000, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Gossip Hello - Create Timed Event');
INSERT INTO smart_scripts VALUES (176309, 1, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 16432, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Gossip Hello - Cast Plague Mist');
INSERT INTO smart_scripts VALUES (176309, 1, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 131, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Gossip Hello - Set Gameobject State');
INSERT INTO smart_scripts VALUES (176309, 1, 3, 0, 59, 0, 100, 0, 1, 0, 0, 0, 99, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Supply Crate - On Timed Event - Set Loot State');