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


-- -------------------------------------------
-- DRAGONMAW RACES
-- -------------------------------------------


-- Dragonmaw Race: The Ballad of Oldie McOld - [H] http://www.wowhead.com/quest=11064/dragonmaw-race-the-ballad-of-oldie-mcold

SET @JAY := 22433;

UPDATE creature SET position_x=-5142.74, position_Y=602.02, position_z=82.942, orientation=0.15 WHERE id=@JAY;

SET @MURG := 23340;

UPDATE creature SET spawntimesecs=30 WHERE id=@MURG;

DELETE FROM creature_text WHERE entry=@MURG;
INSERT INTO creature_text VALUES(@MURG, 0, 0, 'I may be old but I can still take on a young whippersnapper like you, $N. Try not to fall behind...', 12, 0, 100, 0, 0, 0, 0, 0, 'Murg Oldie Mackjaw');
INSERT INTO creature_text VALUES(@MURG, 1, 0, 'Well, you won... I guess.', 12, 0, 100, 0, 0, 0, 0, 0, 'Murg Oldie Mackjaw');

UPDATE creature_template SET InhabitType=5, AIName='SmartAI', ScriptName='' WHERE entry=@MURG;
DELETE FROM smart_scripts WHERE entryorguid=@MURG AND source_type=0;
INSERT INTO smart_scripts VALUES (@MURG, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set npc flag');
INSERT INTO smart_scripts VALUES (@MURG, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@MURG, 0, 2, 3, 19, 0, 100, 0, 11064, 0, 0, 0, 53, 0, @MURG, 0, 11064, 5000, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - WP Start');
INSERT INTO smart_scripts VALUES (@MURG, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Talk');
INSERT INTO smart_scripts VALUES (@MURG, 0, 4, 16, 61, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set npc flag');
INSERT INTO smart_scripts VALUES (@MURG, 0, 6, 18, 40, 0, 100, 0, 5, 0, 0, 0, 60, 1, 250, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Fly');
INSERT INTO smart_scripts VALUES (@MURG, 0, 7, 0, 40, 0, 100, 0, 7, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@MURG, 0, 8, 9, 40, 0, 100, 0, 38, 0, 0, 0, 54, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - WP Pause');
INSERT INTO smart_scripts VALUES (@MURG, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Remove Fly');
INSERT INTO smart_scripts VALUES (@MURG, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Talk');
INSERT INTO smart_scripts VALUES (@MURG, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Walk');
INSERT INTO smart_scripts VALUES (@MURG, 0, 12, 17, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@MURG, 0, 13, 0, 40, 0, 100, 0, 41, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set npc flag');
INSERT INTO smart_scripts VALUES (@MURG, 0, 14, 0, 60, 1, 100, 0, 10000, 10000, 2000, 2000, 6, 11064, 0, 0, 0, 0, 0, 17, 55, 300, 0, 0, 0, 0, 0, 'On Update - Fail quest (No Repeat)');
INSERT INTO smart_scripts VALUES (@MURG, 0, 15, 0, 40, 1, 100, 0, 0, 0, 0, 0, 11, 40890, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Cast Spell');
INSERT INTO smart_scripts VALUES (@MURG, 0, 16, 0, 61, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set Active');
INSERT INTO smart_scripts VALUES (@MURG, 0, 17, 0, 61, 0, 100, 0, 0, 0, 0, 0, 48, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Active');
INSERT INTO smart_scripts VALUES (@MURG, 0, 18, 0, 61, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Walk');

DELETE FROM waypoints WHERE entry=@MURG;
INSERT INTO waypoints
VALUES
    (@MURG, 1, -5094.56, 646.038, 87.2043, 'Murg "Oldie" Muckjaw'),
    (@MURG, 2, -5097.64, 660.054, 87.5581, 'Murg "Oldie" Muckjaw'),
    (@MURG, 3, -5095.23, 662.83, 87.6506, 'Murg "Oldie" Muckjaw'),
    (@MURG, 4, -5081.62, 663.375, 88.9826, 'Murg "Oldie" Muckjaw'),
    (@MURG, 5, -5026.09, 664.847, 98.0088, 'Murg "Oldie" Muckjaw'),
    (@MURG, 6, -4988.04, 667.552, 100.198, 'Murg "Oldie" Muckjaw'),
    (@MURG, 7, -4985.78, 705.424, 107.845, 'Murg "Oldie" Muckjaw'),
    (@MURG, 8, -4998.67, 747.661, 108.399, 'Murg "Oldie" Muckjaw'),
    (@MURG, 9, -5006.4, 776.745, 129.717, 'Murg "Oldie" Muckjaw'),
    (@MURG, 10, -5070.62, 786.927, 180.437, 'Murg "Oldie" Muckjaw'),
    (@MURG, 11, -5116.9, 777.487, 144.162, 'Murg "Oldie" Muckjaw'),
    (@MURG, 12, -5183.61, 676.925, 156.482, 'Murg "Oldie" Muckjaw'),
    (@MURG, 13, -5202.66, 581.352, 112.955, 'Murg "Oldie" Muckjaw'),
    (@MURG, 14, -5212.29, 498.071, 165.252, 'Murg "Oldie" Muckjaw'),
    (@MURG, 15, -5159.92, 471.803, 166.377, 'Murg "Oldie" Muckjaw'),
    (@MURG, 16, -5098.13, 473.925, 163.864, 'Murg "Oldie" Muckjaw'),
    (@MURG, 17, -5052.66, 476.555, 156.071, 'Murg "Oldie" Muckjaw'),
    (@MURG, 18, -5020.59, 494.831, 161.309, 'Murg "Oldie" Muckjaw'),
    (@MURG, 19, -4975.82, 516.719, 127.38, 'Murg "Oldie" Muckjaw'),
    (@MURG, 20, -4940.41, 527.58, 144.494, 'Murg "Oldie" Muckjaw'),
    (@MURG, 21, -4884.46, 496.736, 140.731, 'Murg "Oldie" Muckjaw'),
    (@MURG, 22, -4841.46, 488.188, 136.74, 'Murg "Oldie" Muckjaw'),
    (@MURG, 23, -4805.09, 508.387, 133.952, 'Murg "Oldie" Muckjaw'),
    (@MURG, 24, -4791.09, 450.373, 125.99, 'Murg "Oldie" Muckjaw'),
    (@MURG, 25, -4834.56, 416.905, 117.32, 'Murg "Oldie" Muckjaw'),
    (@MURG, 26, -4893.15, 382.526, 135.45, 'Murg "Oldie" Muckjaw'),
    (@MURG, 27, -4967.23, 399.009, 122.802, 'Murg "Oldie" Muckjaw'),
    (@MURG, 28, -4989.25, 440.067, 108.982, 'Murg "Oldie" Muckjaw'),
    (@MURG, 29, -5016.5, 476.014, 110.362, 'Murg "Oldie" Muckjaw'),
    (@MURG, 30, -4997.99, 521.923, 109.513, 'Murg "Oldie" Muckjaw'),
    (@MURG, 31, -4953.36, 544.093, 114.784, 'Murg "Oldie" Muckjaw'),
    (@MURG, 32, -4907.47, 550.216, 119.754, 'Murg "Oldie" Muckjaw'),
    (@MURG, 33, -4876.8, 619.307, 118.276, 'Murg "Oldie" Muckjaw'),
    (@MURG, 34, -4889.19, 654.449, 113.983, 'Murg "Oldie" Muckjaw'),
    (@MURG, 35, -4920.7, 672.807, 109.915, 'Murg "Oldie" Muckjaw'),
    (@MURG, 36, -4955.09, 668.963, 105.206, 'Murg "Oldie" Muckjaw'),
    (@MURG, 37, -5023.97, 666.12, 92.4113, 'Murg "Oldie" Muckjaw'),
    (@MURG, 38, -5071.54, 665.305, 89.4341, 'Murg "Oldie" Muckjaw'),
    (@MURG, 39, -5097.64, 664.896, 87.6522, 'Murg "Oldie" Muckjaw'),
    (@MURG, 40, -5098.6, 652.373, 87.5737, 'Murg "Oldie" Muckjaw'),
    (@MURG, 41, -5088.56, 640.835, 86.6143, 'Murg "Oldie" Muckjaw');     

DELETE FROM spell_script_names WHERE spell_id=40890;
INSERT INTO spell_script_names VALUES(40890, 'spell_quest_dragonmaw_race_generic');
UPDATE creature_template SET modelid1=15435, modelid2=0, minlevel=80, maxlevel=80, unit_flags=33554432, faction=14, AIName='NullCreatureAI', InhabitType=4, flags_extra=128 WHERE entry=23356;
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=40905;
INSERT INTO conditions VALUES (13, 3, 40905, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', "Target Players");
INSERT INTO conditions VALUES (13, 4, 40905, 0, 0, 31, 0, 3, 23356, 0, 0, 0, 0, '', "Target Trigger");


-- Dragonmaw Race: Trope the Filth-Belcher - [H] http://www.wowhead.com/quest=11067/dragonmaw-race-trope-the-filth-belcher

SET @TROPE := 23342;

UPDATE creature SET spawntimesecs=30 WHERE id=@TROPE;
DELETE FROM creature_text WHERE entry=@TROPE;
INSERT INTO creature_text VALUES(@TROPE, 0, 0, 'Trope will show you how to fly like a Dragonmaw... You will show Trope how to die like a scrub.', 12, 0, 100, 0, 0, 0, 0, 0, 'Trope the Filth-Belcher');
INSERT INTO creature_text VALUES(@TROPE, 1, 0, "You did well. Certainly a surprise to Trope... Report back to Ja'y.", 12, 0, 100, 0, 0, 0, 0, 0, 'Trope the Filth-Belcher');
UPDATE creature_template SET InhabitType=5, AIName='SmartAI', ScriptName='' WHERE entry=@TROPE;
DELETE FROM smart_scripts WHERE entryorguid=@TROPE AND source_type=0;
INSERT INTO smart_scripts VALUES (@TROPE, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set npc flag');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 2, 3, 19, 0, 100, 0, 11067, 0, 0, 0, 53, 0, @TROPE, 0, 11067, 5000, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - WP Start');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Talk');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 4, 16, 61, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set npc flag');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 6, 18, 40, 0, 100, 0, 5, 0, 0, 0, 60, 1, 270, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Fly');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 7, 0, 40, 0, 100, 0, 7, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 8, 9, 40, 0, 100, 0, 38, 0, 0, 0, 54, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - WP Pause');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Remove Fly');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Talk');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Walk');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 12, 17, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 13, 0, 40, 0, 100, 0, 41, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set npc flag');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 14, 0, 60, 1, 100, 0, 10000, 10000, 2000, 2000, 6, 11067, 0, 0, 0, 0, 0, 17, 55, 300, 0, 0, 0, 0, 0, 'On Update - Fail quest');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 15, 0, 40, 1, 100, 0, 0, 0, 0, 0, 11, 40909, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Cast Spell');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 16, 0, 61, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set Active');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 17, 0, 61, 0, 100, 0, 0, 0, 0, 0, 48, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Active');
INSERT INTO smart_scripts VALUES (@TROPE, 0, 18, 0, 61, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Walk');
DELETE FROM waypoints WHERE entry=@TROPE;
INSERT INTO waypoints
VALUES
    (@TROPE, 1, -5094.56, 646.038, 87.1043, 'Trope the Filth-Belcher'),
    (@TROPE, 2, -5097.64, 660.054, 87.5581, 'Trope the Filth-Belcher'),
    (@TROPE, 3, -5095.23, 662.83, 87.8506, 'Trope the Filth-Belcher'),
    (@TROPE, 4, -5081.62, 663.375, 89.3826, 'Trope the Filth-Belcher'),
    (@TROPE, 5, -5026.09, 664.847, 98.0088, 'Trope the Filth-Belcher'),
    (@TROPE, 6, -4988.04, 667.552, 100.198, 'Trope the Filth-Belcher'),
    (@TROPE, 7, -4985.78, 705.424, 107.845, 'Trope the Filth-Belcher'),
    (@TROPE, 8, -4998.67, 747.661, 108.399, 'Trope the Filth-Belcher'),
    (@TROPE, 9, -5006.4, 776.745, 129.717, 'Trope the Filth-Belcher'),
    (@TROPE, 10, -5070.62, 786.927, 180.437, 'Trope the Filth-Belcher'),
    (@TROPE, 11, -5116.9, 777.487, 144.162, 'Trope the Filth-Belcher'),
    (@TROPE, 12, -5183.61, 676.925, 156.482, 'Trope the Filth-Belcher'),
    (@TROPE, 13, -5202.66, 581.352, 112.955, 'Trope the Filth-Belcher'),
    (@TROPE, 14, -5212.29, 498.071, 165.252, 'Trope the Filth-Belcher'),
    (@TROPE, 15, -5159.92, 471.803, 166.377, 'Trope the Filth-Belcher'),
    (@TROPE, 16, -5098.13, 473.925, 163.864, 'Trope the Filth-Belcher'),
    (@TROPE, 17, -5052.66, 476.555, 156.071, 'Trope the Filth-Belcher'),
    (@TROPE, 18, -5020.59, 494.831, 161.309, 'Trope the Filth-Belcher'),
    (@TROPE, 19, -4975.82, 516.719, 127.38, 'Trope the Filth-Belcher'),
    (@TROPE, 20, -4940.41, 527.58, 144.494, 'Trope the Filth-Belcher'),
    (@TROPE, 21, -4884.46, 496.736, 140.731, 'Trope the Filth-Belcher'),
    (@TROPE, 22, -4841.46, 488.188, 136.74, 'Trope the Filth-Belcher'),
    (@TROPE, 23, -4805.09, 508.387, 133.952, 'Trope the Filth-Belcher'),
    (@TROPE, 24, -4791.09, 450.373, 125.99, 'Trope the Filth-Belcher'),
    (@TROPE, 25, -4834.56, 416.905, 117.32, 'Trope the Filth-Belcher'),
    (@TROPE, 26, -4893.15, 382.526, 135.45, 'Trope the Filth-Belcher'),
    (@TROPE, 27, -4967.23, 399.009, 122.802, 'Trope the Filth-Belcher'),
    (@TROPE, 28, -4989.25, 440.067, 108.982, 'Trope the Filth-Belcher'),
    (@TROPE, 29, -5016.5, 476.014, 110.362, 'Trope the Filth-Belcher'),
    (@TROPE, 30, -4997.99, 521.923, 109.513, 'Trope the Filth-Belcher'),
    (@TROPE, 31, -4953.36, 544.093, 114.784, 'Trope the Filth-Belcher'),
    (@TROPE, 32, -4907.47, 550.216, 119.754, 'Trope the Filth-Belcher'),
    (@TROPE, 33, -4876.8, 619.307, 118.276, 'Trope the Filth-Belcher'),
    (@TROPE, 34, -4889.19, 654.449, 113.983, 'Trope the Filth-Belcher'),
    (@TROPE, 35, -4920.7, 672.807, 109.915, 'Trope the Filth-Belcher'),
    (@TROPE, 36, -4955.09, 668.963, 105.206, 'Trope the Filth-Belcher'),
    (@TROPE, 37, -5023.97, 666.12, 92.4113, 'Trope the Filth-Belcher'),
    (@TROPE, 38, -5071.54, 665.305, 89.4341, 'Trope the Filth-Belcher'),
    (@TROPE, 39, -5097.64, 664.896, 87.6522, 'Trope the Filth-Belcher'),
    (@TROPE, 40, -5098.6, 652.373, 87.5737, 'Trope the Filth-Belcher'),
    (@TROPE, 41, -5081.62, 640.932, 86.6143, 'Trope the Filth-Belcher');

DELETE FROM spell_script_names WHERE spell_id=40909;
INSERT INTO spell_script_names VALUES(40909, 'spell_quest_dragonmaw_race_generic');


-- Dragonmaw Race: Corlok the Vet - [H] http://www.wowhead.com/quest=11068/dragonmaw-race-corlok-the-vet

SET @CORLOK := 23344;

UPDATE creature SET spawntimesecs=30 WHERE id=@CORLOK;
DELETE FROM creature_text WHERE entry=@CORLOK;
INSERT INTO creature_text VALUES(@CORLOK, 0, 0, "Let's get this over with...", 12, 0, 100, 0, 0, 0, 0, 0, 'Corlok the Vet');
INSERT INTO creature_text VALUES(@CORLOK, 1, 0, 'You put up a hell of a fight, newbie. Hell of a fight...', 12, 0, 100, 0, 0, 0, 0, 0, 'Corlok the Vet');
UPDATE creature_template SET InhabitType=5, AIName='SmartAI', ScriptName='' WHERE entry=@CORLOK;
DELETE FROM smart_scripts WHERE entryorguid=@CORLOK AND source_type=0;
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set npc flag');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 2, 3, 19, 0, 100, 0, 11068, 0, 0, 0, 53, 0, @CORLOK, 0, 11068, 5000, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - WP Start');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Talk');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 4, 16, 61, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set npc flag');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 6, 18, 40, 0, 100, 0, 5, 0, 0, 0, 60, 1, 290, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Fly');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 7, 0, 40, 0, 100, 0, 7, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 8, 9, 40, 0, 100, 0, 56, 0, 0, 0, 54, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - WP Pause');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Remove Fly');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Talk');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Walk');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 12, 17, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 13, 0, 40, 0, 100, 0, 59, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set npc flag');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 14, 0, 60, 1, 100, 0, 10000, 10000, 2000, 2000, 6, 11068, 0, 0, 0, 0, 0, 17, 55, 300, 0, 0, 0, 0, 0, 'On Update - Fail quest');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 15, 0, 40, 1, 100, 0, 0, 0, 0, 0, 11, 40894, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Cast Spell');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 16, 0, 61, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set Active');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 17, 0, 61, 0, 100, 0, 0, 0, 0, 0, 48, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Active');
INSERT INTO smart_scripts VALUES (@CORLOK, 0, 18, 0, 61, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Walk');
DELETE FROM waypoints WHERE entry=@CORLOK;
INSERT INTO waypoints
VALUES 
    (@CORLOK, 1, -5094.66, 642.169, 86.9278, 'Corlok the Vet'),
    (@CORLOK, 2, -5099.02, 653.186, 87.4071, 'Corlok the Vet'),
    (@CORLOK, 3, -5092.6, 664.835, 88.1206, 'Corlok the Vet'),
    (@CORLOK, 4, -5080.97, 664.741, 89.2517, 'Corlok the Vet'),
    (@CORLOK, 5, -5013.39, 664.365, 96.3073, 'Corlok the Vet'),
    (@CORLOK, 6, -5030.49, 641.083, 120.951, 'Corlok the Vet'),
    (@CORLOK, 7, -5011.5, 624.658, 128.945, 'Corlok the Vet'),
    (@CORLOK, 8, -4976.25, 609.167, 131.847, 'Corlok the Vet'),
    (@CORLOK, 9, -4968.57, 593.818, 128.138, 'Corlok the Vet'),
    (@CORLOK, 10, -4975.71, 567.568, 122.242, 'Corlok the Vet'),
    (@CORLOK, 11, -4992.93, 541.658, 124.877, 'Corlok the Vet'),
    (@CORLOK, 12, -5018.65, 525.73, 124.381, 'Corlok the Vet'),
    (@CORLOK, 13, -5062.31, 524.193, 131.825, 'Corlok the Vet'),
    (@CORLOK, 14, -5110.08, 515.493, 132.262, 'Corlok the Vet'),
    (@CORLOK, 15, -5136.43, 504.138, 124.353, 'Corlok the Vet'),
    (@CORLOK, 16, -5169.05, 471.514, 128.497, 'Corlok the Vet'),
    (@CORLOK, 17, -5215.87, 427.216, 123.842, 'Corlok the Vet'),
    (@CORLOK, 18, -5260.04, 381.145, 75.3805, 'Corlok the Vet'),
    (@CORLOK, 19, -5279.86, 351.083, 84.823, 'Corlok the Vet'),
    (@CORLOK, 20, -5278.54, 308.535, 81.3559, 'Corlok the Vet'),
    (@CORLOK, 21, -5257.15, 279.456, 77.8807, 'Corlok the Vet'),
    (@CORLOK, 22, -5231.97, 264.377, 75.0612, 'Corlok the Vet'),
    (@CORLOK, 23, -5212.85, 246.921, 75.6135, 'Corlok the Vet'),
    (@CORLOK, 24, -5208.43, 225.199, 76.1251, 'Corlok the Vet'),
    (@CORLOK, 25, -5207.37, 176.583, 73.1752, 'Corlok the Vet'),
    (@CORLOK, 26, -5181.27, 72.6699, 98.6859, 'Corlok the Vet'),
    (@CORLOK, 27, -5122.27, 46.2645, 124.749, 'Corlok the Vet'),
    (@CORLOK, 28, -5058.83, 37.3311, 132.444, 'Corlok the Vet'),
    (@CORLOK, 29, -5020.16, 8.79054, 144.253, 'Corlok the Vet'),
    (@CORLOK, 30, -5009.11, -41.4904, 140.305, 'Corlok the Vet'),
    (@CORLOK, 31, -5039.29, -101.374, 133.709, 'Corlok the Vet'),
    (@CORLOK, 32, -5076.44, -110.698, 133.671, 'Corlok the Vet'),
    (@CORLOK, 33, -5110.74, -107.132, 131.541, 'Corlok the Vet'),
    (@CORLOK, 34, -5160.48, -80.2224, 127.582, 'Corlok the Vet'),
    (@CORLOK, 35, -5180.68, 18.7902, 130.192, 'Corlok the Vet'),
    (@CORLOK, 36, -5239.71, 64.3641, 125.863, 'Corlok the Vet'),
    (@CORLOK, 37, -5272.64, 93.122, 102.861, 'Corlok the Vet'),
    (@CORLOK, 38, -5299.94, 147.154, 102.599, 'Corlok the Vet'),
    (@CORLOK, 39, -5284.9, 252.429, 97.7294, 'Corlok the Vet'),
    (@CORLOK, 40, -5232.04, 268.628, 75.8885, 'Corlok the Vet'),
    (@CORLOK, 41, -5200.06, 281.96, 75.8803, 'Corlok the Vet'),
    (@CORLOK, 42, -5179.37, 308.571, 75.2391, 'Corlok the Vet'),
    (@CORLOK, 43, -5174.71, 339.543, 74.8148, 'Corlok the Vet'),
    (@CORLOK, 44, -5183.03, 359.88, 79.2474, 'Corlok the Vet'),
    (@CORLOK, 45, -5194.4, 382.73, 84.4609, 'Corlok the Vet'),
    (@CORLOK, 46, -5173.2, 431.042, 90.3253, 'Corlok the Vet'),
    (@CORLOK, 47, -5145.51, 472.726, 102.904, 'Corlok the Vet'),
    (@CORLOK, 48, -5100.07, 500.221, 103.275, 'Corlok the Vet'),
    (@CORLOK, 49, -5057.29, 508.873, 104.392, 'Corlok the Vet'),
    (@CORLOK, 50, -4998.65, 529.313, 111.632, 'Corlok the Vet'),
    (@CORLOK, 51, -4978.84, 554.876, 114.642, 'Corlok the Vet'),
    (@CORLOK, 52, -4956.67, 599.9, 108.723, 'Corlok the Vet'),
    (@CORLOK, 53, -4968.9, 647.118, 100.11, 'Corlok the Vet'),
    (@CORLOK, 54, -4988.58, 659.373, 98.5294, 'Corlok the Vet'),
    (@CORLOK, 55, -5037.48, 662.584, 92.5092, 'Corlok the Vet'),
    (@CORLOK, 56, -5065.82, 664.006, 89.5423, 'Corlok the Vet'),
    (@CORLOK, 57, -5102.95, 662.805, 87.425, 'Corlok the Vet'),
    (@CORLOK, 58, -5094.39, 643.476, 87.2949, 'Corlok the Vet'),
    (@CORLOK, 59, -5072.99, 640.033, 86.4893, 'Corlok the Vet');

DELETE FROM spell_script_names WHERE spell_id=40894;
INSERT INTO spell_script_names VALUES(40894, 'spell_quest_dragonmaw_race_generic');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=40900;
INSERT INTO conditions VALUES (13, 3, 40900, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', "Target Players");
INSERT INTO conditions VALUES (13, 4, 40900, 0, 0, 31, 0, 3, 23356, 0, 0, 0, 0, '', "Target Trigger");


-- Dragonmaw Race: Wing Commander Ichman - [H] http://www.wowhead.com/quest=11069/dragonmaw-race-wing-commander-ichman

SET @ICHMAN := 23345;
DELETE FROM creature_queststarter WHERE quest=11069;
INSERT INTO creature_queststarter VALUES(@ICHMAN, 11069);
UPDATE creature SET spawntimesecs=30 WHERE id=@ICHMAN;
DELETE FROM creature_text WHERE entry=@ICHMAN;
INSERT INTO creature_text VALUES(@ICHMAN, 0, 0, "I'm taking this back to the old school. I'll be the Alliance and you be Frostwolf Village. BOMBS AWAY!", 12, 0, 100, 0, 0, 0, 0, 0, 'Wing Commander Ichman');
INSERT INTO creature_text VALUES(@ICHMAN, 1, 0, 'Thank you for that... It was humbling to be served in such a manner.', 12, 0, 100, 0, 0, 0, 0, 0, 'Wing Commander Ichman');
UPDATE creature_template SET InhabitType=5, npcflag=2, AIName='SmartAI', ScriptName='' WHERE entry=@ICHMAN;
DELETE FROM smart_scripts WHERE entryorguid=@ICHMAN AND source_type=0;
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set npc flag');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 2, 3, 19, 0, 100, 0, 11069, 0, 0, 0, 53, 0, @ICHMAN, 0, 11069, 5000, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - WP Start');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Talk');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 4, 17, 61, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set npc flag');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 5, 19, 40, 0, 100, 0, 4, 0, 0, 0, 60, 1, 305, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Fly');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 6, 0, 40, 0, 100, 0, 6, 0, 0, 0, 60, 1, 310, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Fly');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 7, 0, 40, 0, 100, 0, 7, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 8, 9, 40, 0, 100, 0, 80, 0, 0, 0, 54, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - WP Pause');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Remove Fly');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Talk');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Walk');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 12, 18, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 13, 0, 40, 0, 100, 0, 83, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set npc flag');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 14, 0, 60, 1, 100, 0, 10000, 10000, 2000, 2000, 6, 11069, 0, 0, 0, 0, 0, 17, 55, 300, 0, 0, 0, 0, 0, 'On Update - Fail quest');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 15, 0, 40, 1, 100, 0, 0, 0, 0, 0, 11, 40928, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Cast Spell');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 16, 0, 60, 1, 100, 0, 14000, 14000, 4000, 8000, 11, 40928, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Cast Spell');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 17, 0, 61, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set Active');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 18, 0, 61, 0, 100, 0, 0, 0, 0, 0, 48, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Active');
INSERT INTO smart_scripts VALUES (@ICHMAN, 0, 19, 0, 61, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Walk');
DELETE FROM waypoints WHERE entry=@ICHMAN;
INSERT INTO waypoints
VALUES 
    (@ICHMAN, 1, -5074.62, 639.673, 86.9331, 'Wing Commander Ichman'),
    (@ICHMAN, 2, -5091.72, 640.899, 86.9896, 'Wing Commander Ichman'),
    (@ICHMAN, 3, -5099.78, 661.451, 87.4432, 'Wing Commander Ichman'),
    (@ICHMAN, 4, -5090.78, 664.342, 88.3554, 'Wing Commander Ichman'),
    (@ICHMAN, 5, -5067.89, 664.518, 89.9139, 'Wing Commander Ichman'),
    (@ICHMAN, 6, -4974.12, 662.561, 93.8796, 'Wing Commander Ichman'),
    (@ICHMAN, 7, -4906.46, 640.801, 88.7705, 'Wing Commander Ichman'),
    (@ICHMAN, 8, -4921.31, 579.589, 88.8252, 'Wing Commander Ichman'),
    (@ICHMAN, 9, -4970.17, 540.006, 100.316, 'Wing Commander Ichman'),
    (@ICHMAN, 10, -5018.59, 499.593, 97.0844, 'Wing Commander Ichman'),
    (@ICHMAN, 11, -5001.56, 456.6, 94.0664, 'Wing Commander Ichman'),
    (@ICHMAN, 12, -4992.14, 436.068, 96.5439, 'Wing Commander Ichman'),
    (@ICHMAN, 13, -4979.81, 461.129, 96.0511, 'Wing Commander Ichman'),
    (@ICHMAN, 14, -4995.22, 465.137, 96.0437, 'Wing Commander Ichman'),
    (@ICHMAN, 15, -4979.78, 422.108, 96.2742, 'Wing Commander Ichman'),
    (@ICHMAN, 16, -4948.8, 384.394, 97.8985, 'Wing Commander Ichman'),
    (@ICHMAN, 17, -4941.75, 377.289, 95.2171, 'Wing Commander Ichman'),
    (@ICHMAN, 18, -4920.82, 377.354, 86.4916, 'Wing Commander Ichman'),
    (@ICHMAN, 19, -4863.89, 389.621, 100.531, 'Wing Commander Ichman'),
    (@ICHMAN, 20, -4799.8, 356.848, 100.664, 'Wing Commander Ichman'),
    (@ICHMAN, 21, -4816.32, 307.672, 98.9476, 'Wing Commander Ichman'),
    (@ICHMAN, 22, -4860.27, 253.41, 90.9479, 'Wing Commander Ichman'),
    (@ICHMAN, 23, -4928.57, 234.724, 73.3838, 'Wing Commander Ichman'),
    (@ICHMAN, 24, -4979.44, 234.729, 99.059, 'Wing Commander Ichman'),
    (@ICHMAN, 25, -4997.64, 187.217, 108.79, 'Wing Commander Ichman'),
    (@ICHMAN, 26, -4999.75, 133.452, 92.5512, 'Wing Commander Ichman'),
    (@ICHMAN, 27, -5006.28, 70.9775, 92.9455, 'Wing Commander Ichman'),
    (@ICHMAN, 28, -4984.59, 21.7855, 92.4787, 'Wing Commander Ichman'),
    (@ICHMAN, 29, -4939.45, -1.70913, 89.5908, 'Wing Commander Ichman'),
    (@ICHMAN, 30, -4904.5, -20.3318, 98.7926, 'Wing Commander Ichman'),
    (@ICHMAN, 31, -4876.37, -59.5791, 91.4677, 'Wing Commander Ichman'),
    (@ICHMAN, 32, -4883.15, -100.723, 103.205, 'Wing Commander Ichman'),
    (@ICHMAN, 33, -4944.32, -112.767, 137.646, 'Wing Commander Ichman'),
    (@ICHMAN, 34, -4971.8, -78.7316, 115.101, 'Wing Commander Ichman'),
    (@ICHMAN, 35, -4987.65, -30.5438, 91.9287, 'Wing Commander Ichman'),
    (@ICHMAN, 36, -5001.3, 12.3534, 86.9422, 'Wing Commander Ichman'),
    (@ICHMAN, 37, -5042.09, 46.6422, 105.125, 'Wing Commander Ichman'),
    (@ICHMAN, 38, -5106.43, 50.7488, 83.1864, 'Wing Commander Ichman'),
    (@ICHMAN, 39, -5154.69, 50.1247, 82.3862, 'Wing Commander Ichman'),
    (@ICHMAN, 40, -5217.06, 23.4145, 150.396, 'Wing Commander Ichman'),
    (@ICHMAN, 41, -5225.16, -39.4703, 174.652, 'Wing Commander Ichman'),
    (@ICHMAN, 42, -5307.91, -25.5939, 145.381, 'Wing Commander Ichman'),
    (@ICHMAN, 43, -5274.71, 26.4266, 172.198, 'Wing Commander Ichman'),
    (@ICHMAN, 44, -5208.27, 57.5883, 159.623, 'Wing Commander Ichman'),
    (@ICHMAN, 45, -5142.88, 97.5982, 149.853, 'Wing Commander Ichman'),
    (@ICHMAN, 46, -5115.44, 118.069, 136.045, 'Wing Commander Ichman'),
    (@ICHMAN, 47, -5105.17, 155.088, 134.461, 'Wing Commander Ichman'),
    (@ICHMAN, 48, -5106.37, 218.731, 147.258, 'Wing Commander Ichman'),
    (@ICHMAN, 49, -5094.3, 280.021, 161.935, 'Wing Commander Ichman'),
    (@ICHMAN, 50, -5084.01, 316.753, 172.277, 'Wing Commander Ichman'),
    (@ICHMAN, 51, -5052.64, 351.108, 172.987, 'Wing Commander Ichman'),
    (@ICHMAN, 52, -5033.05, 379.481, 174.407, 'Wing Commander Ichman'),
    (@ICHMAN, 53, -5028.54, 413.128, 179.762, 'Wing Commander Ichman'),
    (@ICHMAN, 54, -5017.09, 484.101, 168.921, 'Wing Commander Ichman'),
    (@ICHMAN, 55, -5020.9, 515.958, 120.09, 'Wing Commander Ichman'),
    (@ICHMAN, 56, -5062.5, 521.002, 97.215, 'Wing Commander Ichman'),
    (@ICHMAN, 57, -5103.9, 494.01, 104.071, 'Wing Commander Ichman'),
    (@ICHMAN, 58, -5151.95, 462.724, 111.081, 'Wing Commander Ichman'),
    (@ICHMAN, 59, -5080.26, 498.915, 109.875, 'Wing Commander Ichman'),
    (@ICHMAN, 60, -5157.65, 450.443, 106.745, 'Wing Commander Ichman'),
    (@ICHMAN, 61, -5193.28, 400.018, 108.903, 'Wing Commander Ichman'),
    (@ICHMAN, 62, -5189.23, 370.25, 113.73, 'Wing Commander Ichman'),
    (@ICHMAN, 63, -5185.8, 313.755, 132.317, 'Wing Commander Ichman'),
    (@ICHMAN, 64, -5195.96, 278.514, 132.06, 'Wing Commander Ichman'),
    (@ICHMAN, 65, -5224.53, 274.103, 131.872, 'Wing Commander Ichman'),
    (@ICHMAN, 66, -5271.16, 332.176, 120.293, 'Wing Commander Ichman'),
    (@ICHMAN, 67, -5284.09, 392.53, 121.367, 'Wing Commander Ichman'),
    (@ICHMAN, 68, -5234.58, 426.247, 124.65, 'Wing Commander Ichman'),
    (@ICHMAN, 69, -5204.57, 440.941, 125.71, 'Wing Commander Ichman'),
    (@ICHMAN, 70, -5238.07, 411.06, 122.894, 'Wing Commander Ichman'),
    (@ICHMAN, 71, -5154.52, 497.25, 110.277, 'Wing Commander Ichman'),
    (@ICHMAN, 72, -5062.88, 505.464, 107.491, 'Wing Commander Ichman'),
    (@ICHMAN, 73, -4998.45, 523.002, 102.513, 'Wing Commander Ichman'),
    (@ICHMAN, 74, -5047.71, 512.549, 101.472, 'Wing Commander Ichman'),
    (@ICHMAN, 75, -4975.4, 546.978, 98.4481, 'Wing Commander Ichman'),
    (@ICHMAN, 76, -4940.06, 582.665, 93.8702, 'Wing Commander Ichman'),
    (@ICHMAN, 77, -4936.29, 629.309, 91.3448, 'Wing Commander Ichman'),
    (@ICHMAN, 78, -4986.95, 667.351, 96.8044, 'Wing Commander Ichman'),
    (@ICHMAN, 79, -5036.81, 665.996, 92.8608, 'Wing Commander Ichman'),
    (@ICHMAN, 80, -5079.51, 664.887, 89.0742, 'Wing Commander Ichman'),
    (@ICHMAN, 81, -5094.95, 663.808, 87.6571, 'Wing Commander Ichman'),
    (@ICHMAN, 82, -5100.96, 648.648, 87.1004, 'Wing Commander Ichman'),
    (@ICHMAN, 83, -5066.31, 640.213, 86.4966, 'Wing Commander Ichman');

DELETE FROM spell_script_names WHERE spell_id=40928;
INSERT INTO spell_script_names VALUES(40928, 'spell_quest_dragonmaw_race_generic');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=40929;
INSERT INTO conditions VALUES (13, 3, 40929, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', "Target Players");
INSERT INTO conditions VALUES (13, 4, 40929, 0, 0, 31, 0, 3, 23356, 0, 0, 0, 0, '', "Target Trigger");


-- Dragonmaw Race: Wing Commander Mulverick - [H] http://www.wowhead.com/quest=11070/dragonmaw-race-wing-commander-mulverick

SET @MULVERICK := 23346;
UPDATE creature SET spawntimesecs=30 WHERE id=@MULVERICK;
DELETE FROM creature_text WHERE entry=@MULVERICK;
INSERT INTO creature_text VALUES(@MULVERICK, 0, 0, "You're in for a rough ride, $N. I hope you've already made funeral arrangements.", 12, 0, 100, 0, 0, 0, 0, 0, 'Wing Commander Mulverick');
INSERT INTO creature_text VALUES(@MULVERICK, 1, 0, "You're the best I've ever seen. I can't believe I'm saying this but you might have a chance against Skyshatter. And hey, if that doesn't go so well you can be my wing man...", 12, 0, 100, 0, 0, 0, 0, 0, 'Wing Commander Mulverick');
UPDATE creature_template SET InhabitType=5, AIName='SmartAI', ScriptName='' WHERE entry=@MULVERICK;
DELETE FROM smart_scripts WHERE entryorguid=@MULVERICK AND source_type=0;
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set npc flag');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 2, 3, 19, 0, 100, 0, 11070, 0, 0, 0, 53, 0, @MULVERICK, 0, 11070, 5000, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - WP Start');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Talk');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 4, 17, 61, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set npc flag');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 6, 19, 40, 0, 100, 0, 5, 0, 0, 0, 60, 1, 310, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Fly');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 7, 0, 40, 0, 100, 0, 7, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 8, 9, 40, 0, 100, 0, 137, 0, 0, 0, 54, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - WP Pause');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Remove Fly');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Talk');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Walk');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 12, 18, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 13, 0, 40, 0, 100, 0, 140, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set npc flag');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 14, 0, 60, 1, 100, 0, 10000, 10000, 2000, 2000, 6, 11070, 0, 0, 0, 0, 0, 17, 55, 300, 0, 0, 0, 0, 0, 'On Update - Fail quest');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 15, 0, 40, 1, 100, 0, 0, 0, 0, 0, 11, 40930, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Cast Spell');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 16, 0, 60, 1, 100, 0, 14000, 14000, 4000, 8000, 11, 40930, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Cast Spell');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 17, 0, 61, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set Active');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 18, 0, 61, 0, 100, 0, 0, 0, 0, 0, 48, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Active');
INSERT INTO smart_scripts VALUES (@MULVERICK, 0, 19, 0, 61, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Walk');
DELETE FROM waypoints WHERE entry=@MULVERICK;
INSERT INTO waypoints
VALUES 
    (@MULVERICK, 1, -5073.79, 640.175, 86.9597, 'Wing Commander Mulverick'),
    (@MULVERICK, 2, -5093.49, 642.838, 87.0724, 'Wing Commander Mulverick'),
    (@MULVERICK, 3, -5097.66, 661.13, 87.6415, 'Wing Commander Mulverick'),
    (@MULVERICK, 4, -5070.33, 664.518, 89.9677, 'Wing Commander Mulverick'),
    (@MULVERICK, 5, -4980.29, 664.857, 93.3151, 'Wing Commander Mulverick'),
    (@MULVERICK, 6, -4923.65, 661.955, 85.6817, 'Wing Commander Mulverick'),
    (@MULVERICK, 7, -4897.38, 687.397, 85.903, 'Wing Commander Mulverick'),
    (@MULVERICK, 8, -4894.5, 731.107, 94.2763, 'Wing Commander Mulverick'),
    (@MULVERICK, 9, -4909.02, 768.031, 88.1273, 'Wing Commander Mulverick'),
    (@MULVERICK, 10, -4944.72, 786.339, 89.3095, 'Wing Commander Mulverick'),
    (@MULVERICK, 11, -4978.84, 796.752, 122.538, 'Wing Commander Mulverick'),
    (@MULVERICK, 12, -5020.1, 794.71, 104.245, 'Wing Commander Mulverick'),
    (@MULVERICK, 13, -5051.79, 790.186, 90.4867, 'Wing Commander Mulverick'),
    (@MULVERICK, 14, -5094.32, 778.473, 79.7089, 'Wing Commander Mulverick'),
    (@MULVERICK, 15, -5139.05, 763.19, 68.1027, 'Wing Commander Mulverick'),
    (@MULVERICK, 16, -5179.04, 773.369, 61.2301, 'Wing Commander Mulverick'),
    (@MULVERICK, 17, -5255.2, 791.07, 49.3913, 'Wing Commander Mulverick'),
    (@MULVERICK, 18, -5276.02, 781.002, 47.2046, 'Wing Commander Mulverick'),
    (@MULVERICK, 19, -5272.19, 763.952, 49.0412, 'Wing Commander Mulverick'),
    (@MULVERICK, 20, -5280.86, 729.029, 52.1453, 'Wing Commander Mulverick'),
    (@MULVERICK, 21, -5269.54, 687.2, 53.4351, 'Wing Commander Mulverick'),
    (@MULVERICK, 22, -5260.46, 632.333, 53.8001, 'Wing Commander Mulverick'),
    (@MULVERICK, 23, -5260.06, 607.943, 59.746, 'Wing Commander Mulverick'),
    (@MULVERICK, 24, -5253.74, 659.762, 53.9552, 'Wing Commander Mulverick'),
    (@MULVERICK, 25, -5270.44, 641.98, 52.628, 'Wing Commander Mulverick'),
    (@MULVERICK, 26, -5259.89, 607.863, 56.4182, 'Wing Commander Mulverick'),
    (@MULVERICK, 27, -5188.08, 598.437, 88.6164, 'Wing Commander Mulverick'),
    (@MULVERICK, 28, -5176.6, 549.729, 89.9904, 'Wing Commander Mulverick'),
    (@MULVERICK, 29, -5168.49, 522.349, 91.4781, 'Wing Commander Mulverick'),
    (@MULVERICK, 30, -5143.6, 507.12, 92.2422, 'Wing Commander Mulverick'),
    (@MULVERICK, 31, -5091.26, 495.271, 94.0692, 'Wing Commander Mulverick'),
    (@MULVERICK, 32, -4973.18, 421.727, 90.9961, 'Wing Commander Mulverick'),
    (@MULVERICK, 33, -4965.04, 392.479, 89.3456, 'Wing Commander Mulverick'),
    (@MULVERICK, 34, -4971.82, 354.271, 87.915, 'Wing Commander Mulverick'),
    (@MULVERICK, 35, -4989.4, 301.984, 86.3694, 'Wing Commander Mulverick'),
    (@MULVERICK, 36, -5014.7, 279.451, 90.6383, 'Wing Commander Mulverick'),
    (@MULVERICK, 37, -5040.7, 225.805, 108.337, 'Wing Commander Mulverick'),
    (@MULVERICK, 38, -5062.34, 181.557, 129.365, 'Wing Commander Mulverick'),
    (@MULVERICK, 39, -5082.6, 168.477, 130.375, 'Wing Commander Mulverick'),
    (@MULVERICK, 40, -5100.59, 180.857, 138.101, 'Wing Commander Mulverick'),
    (@MULVERICK, 41, -5101.1, 229.947, 149.149, 'Wing Commander Mulverick'),
    (@MULVERICK, 42, -5093.44, 274.454, 160.411, 'Wing Commander Mulverick'),
    (@MULVERICK, 43, -5080.44, 309.374, 169.419, 'Wing Commander Mulverick'),
    (@MULVERICK, 44, -5056.87, 347.893, 174.217, 'Wing Commander Mulverick'),
    (@MULVERICK, 45, -5010.93, 365.086, 177.488, 'Wing Commander Mulverick'),
    (@MULVERICK, 46, -4968.65, 380.724, 173.173, 'Wing Commander Mulverick'),
    (@MULVERICK, 47, -5027.66, 364.737, 177.539, 'Wing Commander Mulverick'),
    (@MULVERICK, 48, -4917.15, 377.454, 173.836, 'Wing Commander Mulverick'),
    (@MULVERICK, 49, -4853.53, 360.39, 176.391, 'Wing Commander Mulverick'),
    (@MULVERICK, 50, -4835.68, 388.264, 168.752, 'Wing Commander Mulverick'),
    (@MULVERICK, 51, -4850.91, 422.375, 158.973, 'Wing Commander Mulverick'),
    (@MULVERICK, 52, -4864.4, 460.468, 150.407, 'Wing Commander Mulverick'),
    (@MULVERICK, 53, -4902.27, 500.825, 134.835, 'Wing Commander Mulverick'),
    (@MULVERICK, 54, -4946.1, 528.796, 121.743, 'Wing Commander Mulverick'),
    (@MULVERICK, 55, -4994.91, 527.295, 99.9505, 'Wing Commander Mulverick'),
    (@MULVERICK, 56, -5023.6, 508.386, 119.743, 'Wing Commander Mulverick'),
    (@MULVERICK, 57, -5055, 490.278, 169.672, 'Wing Commander Mulverick'),
    (@MULVERICK, 58, -5106.63, 462.668, 165.688, 'Wing Commander Mulverick'),
    (@MULVERICK, 59, -5146.6, 430.134, 159.699, 'Wing Commander Mulverick'),
    (@MULVERICK, 60, -5167.97, 405.528, 144.235, 'Wing Commander Mulverick'),
    (@MULVERICK, 61, -5178.58, 345.856, 127.211, 'Wing Commander Mulverick'),
    (@MULVERICK, 62, -5188.11, 313.544, 124.417, 'Wing Commander Mulverick'),
    (@MULVERICK, 63, -5199.91, 282.739, 112.936, 'Wing Commander Mulverick'),
    (@MULVERICK, 64, -5245.22, 271.312, 97.5307, 'Wing Commander Mulverick'),
    (@MULVERICK, 65, -5270.46, 271.393, 105.523, 'Wing Commander Mulverick'),
    (@MULVERICK, 66, -5288.75, 241.08, 101.587, 'Wing Commander Mulverick'),
    (@MULVERICK, 67, -5313.95, 195.752, 100.433, 'Wing Commander Mulverick'),
    (@MULVERICK, 68, -5289.44, 116.574, 101.397, 'Wing Commander Mulverick'),
    (@MULVERICK, 69, -5260.55, 69.3146, 106.89, 'Wing Commander Mulverick'),
    (@MULVERICK, 70, -5237.17, -12.7776, 120.017, 'Wing Commander Mulverick'),
    (@MULVERICK, 71, -5279.93, -67.19, 109.01, 'Wing Commander Mulverick'),
    (@MULVERICK, 72, -5349.6, -111.473, 116.548, 'Wing Commander Mulverick'),
    (@MULVERICK, 73, -5370.63, -98.7298, 109.358, 'Wing Commander Mulverick'),
    (@MULVERICK, 74, -5387.68, -63.1046, 111.659, 'Wing Commander Mulverick'),
    (@MULVERICK, 75, -5379.2, 3.21685, 121.526, 'Wing Commander Mulverick'),
    (@MULVERICK, 76, -5314.43, 32.0712, 113.405, 'Wing Commander Mulverick'),
    (@MULVERICK, 77, -5265.13, 11.6882, 110.016, 'Wing Commander Mulverick'),
    (@MULVERICK, 78, -5207.98, -36.7408, 103.694, 'Wing Commander Mulverick'),
    (@MULVERICK, 79, -5165.57, -80.167, 136.178, 'Wing Commander Mulverick'),
    (@MULVERICK, 80, -5118.2, -105.716, 122.108, 'Wing Commander Mulverick'),
    (@MULVERICK, 81, -5061.11, -96.3049, 117.942, 'Wing Commander Mulverick'),
    (@MULVERICK, 82, -5031.23, -66.0233, 104.849, 'Wing Commander Mulverick'),
    (@MULVERICK, 83, -4998.87, -11.7168, 81.3507, 'Wing Commander Mulverick'),
    (@MULVERICK, 84, -4980.24, 10.3058, 77.7177, 'Wing Commander Mulverick'),
    (@MULVERICK, 85, -4998.29, -7.4397, 78.78, 'Wing Commander Mulverick'),
    (@MULVERICK, 86, -4971.93, 15.0586, 76.1905, 'Wing Commander Mulverick'),
    (@MULVERICK, 87, -4926.84, 34.6864, 66.9967, 'Wing Commander Mulverick'),
    (@MULVERICK, 88, -4895.08, 50.6947, 60.3591, 'Wing Commander Mulverick'),
    (@MULVERICK, 89, -4874.35, 56.7382, 2.54341, 'Wing Commander Mulverick'),
    (@MULVERICK, 90, -4845.41, 26.3595, 16.1138, 'Wing Commander Mulverick'),
    (@MULVERICK, 91, -4839.98, -31.9981, 26.751, 'Wing Commander Mulverick'),
    (@MULVERICK, 92, -4866.88, -28.3181, 40.2276, 'Wing Commander Mulverick'),
    (@MULVERICK, 93, -4851.33, -5.85707, 22.9954, 'Wing Commander Mulverick'),
    (@MULVERICK, 94, -4833.69, -31.3822, 25.1184, 'Wing Commander Mulverick'),
    (@MULVERICK, 95, -4874.32, -32.4778, 69.1992, 'Wing Commander Mulverick'),
    (@MULVERICK, 96, -4898.07, -42.3574, 89.897, 'Wing Commander Mulverick'),
    (@MULVERICK, 97, -4913.59, -54.3562, 121.409, 'Wing Commander Mulverick'),
    (@MULVERICK, 98, -4937.62, -54.5098, 134.404, 'Wing Commander Mulverick'),
    (@MULVERICK, 99, -4910.76, -34.7961, 134.404, 'Wing Commander Mulverick'),
    (@MULVERICK, 100, -4910.34, -64.4031, 134.404, 'Wing Commander Mulverick'),
    (@MULVERICK, 101, -4940.61, -38.7189, 125.076, 'Wing Commander Mulverick'),
    (@MULVERICK, 102, -4961.5, -28.9198, 101.354, 'Wing Commander Mulverick'),
    (@MULVERICK, 103, -4954.74, -7.93548, 100.327, 'Wing Commander Mulverick'),
    (@MULVERICK, 104, -4927.17, -6.05419, 100.327, 'Wing Commander Mulverick'),
    (@MULVERICK, 105, -4928.98, -37.9751, 116.941, 'Wing Commander Mulverick'),
    (@MULVERICK, 106, -4953.41, -22.5698, 112.888, 'Wing Commander Mulverick'),
    (@MULVERICK, 107, -4990.22, 6.49273, 102.639, 'Wing Commander Mulverick'),
    (@MULVERICK, 108, -4961.07, 48.5569, 99.0104, 'Wing Commander Mulverick'),
    (@MULVERICK, 109, -4945.81, 79.1764, 101.376, 'Wing Commander Mulverick'),
    (@MULVERICK, 110, -4929.71, 150.686, 107.66, 'Wing Commander Mulverick'),
    (@MULVERICK, 111, -4917.87, 196.516, 105.989, 'Wing Commander Mulverick'),
    (@MULVERICK, 112, -4898.51, 259.459, 103.408, 'Wing Commander Mulverick'),
    (@MULVERICK, 113, -4924.06, 249.392, 102.664, 'Wing Commander Mulverick'),
    (@MULVERICK, 114, -4897.3, 248.342, 103.752, 'Wing Commander Mulverick'),
    (@MULVERICK, 115, -4877.38, 298.139, 108.219, 'Wing Commander Mulverick'),
    (@MULVERICK, 116, -4862.92, 327.174, 106.609, 'Wing Commander Mulverick'),
    (@MULVERICK, 117, -4852.86, 372.216, 102.541, 'Wing Commander Mulverick'),
    (@MULVERICK, 118, -4856.24, 433.69, 96.3819, 'Wing Commander Mulverick'),
    (@MULVERICK, 119, -4860.41, 479.956, 92.4403, 'Wing Commander Mulverick'),
    (@MULVERICK, 120, -4873.13, 528.395, 98.0209, 'Wing Commander Mulverick'),
    (@MULVERICK, 121, -4904.29, 578.768, 96.3431, 'Wing Commander Mulverick'),
    (@MULVERICK, 122, -4950.79, 636.883, 96.0455, 'Wing Commander Mulverick'),
    (@MULVERICK, 123, -4987.17, 659.419, 97.2334, 'Wing Commander Mulverick'),
    (@MULVERICK, 124, -5085.9, 662.095, 98.4426, 'Wing Commander Mulverick'),
    (@MULVERICK, 125, -5133.23, 670.744, 108.086, 'Wing Commander Mulverick'),
    (@MULVERICK, 126, -5135.8, 693.839, 108.492, 'Wing Commander Mulverick'),
    (@MULVERICK, 127, -5117.04, 714.214, 108.977, 'Wing Commander Mulverick'),
    (@MULVERICK, 128, -5090.95, 694.526, 109.547, 'Wing Commander Mulverick'),
    (@MULVERICK, 129, -5049.35, 683.563, 107.932, 'Wing Commander Mulverick'),
    (@MULVERICK, 130, -4974.33, 663.794, 105.02, 'Wing Commander Mulverick'),
    (@MULVERICK, 131, -4948.23, 656.914, 104.006, 'Wing Commander Mulverick'),
    (@MULVERICK, 132, -4942.41, 666.963, 103.57, 'Wing Commander Mulverick'),
    (@MULVERICK, 133, -4948.29, 679.504, 103.05, 'Wing Commander Mulverick'),
    (@MULVERICK, 134, -4971.16, 682.781, 102.063, 'Wing Commander Mulverick'),
    (@MULVERICK, 135, -4996.74, 666.623, 90.3214, 'Wing Commander Mulverick'),
    (@MULVERICK, 136, -5058.53, 664.951, 89.5705, 'Wing Commander Mulverick'),
    (@MULVERICK, 137, -5087.64, 664.358, 88.4531, 'Wing Commander Mulverick'),
    (@MULVERICK, 138, -5102.46, 655.182, 87.3748, 'Wing Commander Mulverick'),
    (@MULVERICK, 139, -5097.11, 643.767, 87.1566, 'Wing Commander Mulverick'),
    (@MULVERICK, 140, -5060.33, 640.435, 86.6615, 'Wing Commander Mulverick');

DELETE FROM spell_script_names WHERE spell_id=40930;
INSERT INTO spell_script_names VALUES(40930, 'spell_quest_dragonmaw_race_generic');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=40931;
INSERT INTO conditions VALUES (13, 3, 40931, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', "Target Players");
INSERT INTO conditions VALUES (13, 4, 40931, 0, 0, 31, 0, 3, 23356, 0, 0, 0, 0, '', "Target Trigger");


-- Dragonmaw Race: Captain Skyshatter - [H] http://www.wowhead.com/quest=11071/dragonmaw-race-captain-skyshatter

SET @SKYSHATTER := 23348;
UPDATE creature_model_info SET CombatReach=10, BoundingRadius=2 WHERE DisplayID=21426;
UPDATE creature SET spawntimesecs=30 WHERE id=@SKYSHATTER;
DELETE FROM creature_text WHERE entry=@SKYSHATTER;
INSERT INTO creature_text VALUES(@SKYSHATTER, 0, 0, "I weep for you, $N. You really have no idea what you've gotten yourself into...", 12, 0, 100, 0, 0, 0, 0, 0, 'Captain Skyshatter');
INSERT INTO creature_text VALUES(@SKYSHATTER, 1, 0, "Prepare a funeral pyre! $N has challenged Skyshatter!", 14, 0, 100, 0, 0, 0, 0, 0, 'Captain Skyshatter');
INSERT INTO creature_text VALUES(@SKYSHATTER, 2, 0, "I... I am undone... The new top orc is $N!", 14, 0, 100, 0, 0, 0, 0, 0, 'Captain Skyshatter');
UPDATE creature_template SET InhabitType=5, AIName='SmartAI', ScriptName='' WHERE entry=@SKYSHATTER;
DELETE FROM smart_scripts WHERE entryorguid=@SKYSHATTER AND source_type=0;
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set npc flag');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 2, 3, 19, 0, 100, 0, 11071, 0, 0, 0, 53, 0, @SKYSHATTER, 0, 11071, 5000, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - WP Start');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Talk');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 4, 19, 61, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set npc flag');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 6, 17, 40, 0, 100, 0, 5, 0, 0, 0, 54, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - WP Pause');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 7, 0, 40, 0, 100, 0, 7, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 8, 9, 40, 0, 100, 0, 138, 0, 0, 0, 54, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - WP Pause');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Remove Fly');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Talk');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Walk');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 12, 20, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Phase Mask');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 13, 0, 40, 0, 100, 0, 142, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set npc flag');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 14, 0, 60, 1, 100, 0, 10000, 10000, 2000, 2000, 6, 11071, 0, 0, 0, 0, 0, 17, 55, 300, 0, 0, 0, 0, 0, 'On Update - Fail quest');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 15, 0, 40, 1, 100, 0, 0, 0, 0, 0, 11, 40945, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Cast Spell');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 16, 0, 60, 1, 100, 0, 14000, 14000, 200, 2000, 11, 40945, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Cast Spell');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 17, 18, 61, 0, 100, 0, 0, 0, 0, 0, 60, 1, 320, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Fly');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 18, 21, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Talk');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 19, 0, 61, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set Active');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 20, 0, 61, 0, 100, 0, 0, 0, 0, 0, 48, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Active');
INSERT INTO smart_scripts VALUES (@SKYSHATTER, 0, 21, 0, 61, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Set Walk');
DELETE FROM waypoints WHERE entry=@SKYSHATTER;
INSERT INTO waypoints
VALUES 
    (@SKYSHATTER, 1, -5087.56, 635.584, 86.7302, 'Captain Skyshatter'),
    (@SKYSHATTER, 2, -5094.97, 641.565, 86.8949, 'Captain Skyshatter'),
    (@SKYSHATTER, 3, -5099.64, 657.156, 87.3064, 'Captain Skyshatter'),
    (@SKYSHATTER, 4, -5082.76, 664.815, 89.2039, 'Captain Skyshatter'),
    (@SKYSHATTER, 5, -4987.41, 663.473, 92.5703, 'Captain Skyshatter'),
    (@SKYSHATTER, 6, -4931.48, 678.786, 93.1402, 'Captain Skyshatter'),
    (@SKYSHATTER, 7, -4894.17, 675.374, 88.3474, 'Captain Skyshatter'),
    (@SKYSHATTER, 8, -4883.4, 657.438, 86.213, 'Captain Skyshatter'),
    (@SKYSHATTER, 9, -4884.02, 635.673, 84.0022, 'Captain Skyshatter'),
    (@SKYSHATTER, 10, -4911.95, 640.443, 92.6958, 'Captain Skyshatter'),
    (@SKYSHATTER, 11, -4949.11, 665.224, 92.2993, 'Captain Skyshatter'),
    (@SKYSHATTER, 12, -4995.33, 667.007, 95.0879, 'Captain Skyshatter'),
    (@SKYSHATTER, 13, -5042.88, 668.841, 97.9566, 'Captain Skyshatter'),
    (@SKYSHATTER, 14, -5106.24, 671.284, 109.361, 'Captain Skyshatter'),
    (@SKYSHATTER, 15, -5129.32, 684.316, 129.959, 'Captain Skyshatter'),
    (@SKYSHATTER, 16, -5187.61, 723.587, 139.018, 'Captain Skyshatter'),
    (@SKYSHATTER, 17, -5225.68, 749.399, 141.018, 'Captain Skyshatter'),
    (@SKYSHATTER, 18, -5241.56, 758.859, 139.016, 'Captain Skyshatter'),
    (@SKYSHATTER, 19, -5263.38, 748.202, 136.384, 'Captain Skyshatter'),
    (@SKYSHATTER, 20, -5274.45, 729.379, 134.006, 'Captain Skyshatter'),
    (@SKYSHATTER, 21, -5264.11, 692.833, 113.639, 'Captain Skyshatter'),
    (@SKYSHATTER, 22, -5251.51, 644.216, 98.6951, 'Captain Skyshatter'),
    (@SKYSHATTER, 23, -5227.54, 586.549, 73.8104, 'Captain Skyshatter'),
    (@SKYSHATTER, 24, -5232.89, 617.516, 73.3168, 'Captain Skyshatter'),
    (@SKYSHATTER, 25, -5250.13, 522.731, 97.3681, 'Captain Skyshatter'),
    (@SKYSHATTER, 26, -5293.25, 452.003, 87.3439, 'Captain Skyshatter'),
    (@SKYSHATTER, 27, -5289.51, 475.05, 84.5183, 'Captain Skyshatter'),
    (@SKYSHATTER, 28, -5296.74, 459.331, 82.4244, 'Captain Skyshatter'),
    (@SKYSHATTER, 29, -5321.86, 364.547, 78.6856, 'Captain Skyshatter'),
    (@SKYSHATTER, 30, -5336.85, 260.91, 64.3121, 'Captain Skyshatter'),
    (@SKYSHATTER, 31, -5328.95, 229.583, 84.3653, 'Captain Skyshatter'),
    (@SKYSHATTER, 32, -5307.89, 164.544, 90.1567, 'Captain Skyshatter'),
    (@SKYSHATTER, 33, -5274.67, 124.229, 98.2239, 'Captain Skyshatter'),
    (@SKYSHATTER, 34, -5223.08, 87.9087, 98.6199, 'Captain Skyshatter'),
    (@SKYSHATTER, 35, -5189.22, 52.5833, 99.0043, 'Captain Skyshatter'),
    (@SKYSHATTER, 36, -5212.18, 68.3701, 99.2231, 'Captain Skyshatter'),
    (@SKYSHATTER, 37, -5193.04, 51.3872, 99.4249, 'Captain Skyshatter'),
    (@SKYSHATTER, 38, -5144.63, 8.82392, 116.142, 'Captain Skyshatter'),
    (@SKYSHATTER, 39, -5113.09, -13.2902, 153.451, 'Captain Skyshatter'),
    (@SKYSHATTER, 40, -5106.63, -19.826, 179.961, 'Captain Skyshatter'),
    (@SKYSHATTER, 41, -5081.81, -42.1419, 175.739, 'Captain Skyshatter'),
    (@SKYSHATTER, 42, -5055.97, -40.2629, 173.062, 'Captain Skyshatter'),
    (@SKYSHATTER, 43, -5031.35, -13.8612, 169.328, 'Captain Skyshatter'),
    (@SKYSHATTER, 44, -5061.29, 13.0471, 165.268, 'Captain Skyshatter'),
    (@SKYSHATTER, 45, -5103.88, 54.4085, 158.421, 'Captain Skyshatter'),
    (@SKYSHATTER, 46, -5125.73, 101.755, 148.134, 'Captain Skyshatter'),
    (@SKYSHATTER, 47, -5114.57, 126.204, 141.401, 'Captain Skyshatter'),
    (@SKYSHATTER, 48, -5139, 134.611, 155.723, 'Captain Skyshatter'),
    (@SKYSHATTER, 49, -5170.2, 145.053, 144.259, 'Captain Skyshatter'),
    (@SKYSHATTER, 50, -5194.72, 147.041, 100.983, 'Captain Skyshatter'),
    (@SKYSHATTER, 51, -5210.56, 160, 87.769, 'Captain Skyshatter'),
    (@SKYSHATTER, 52, -5207.29, 209.95, 82.5642, 'Captain Skyshatter'),
    (@SKYSHATTER, 53, -5202.63, 252.608, 116.804, 'Captain Skyshatter'),
    (@SKYSHATTER, 54, -5186.9, 303.438, 116.804, 'Captain Skyshatter'),
    (@SKYSHATTER, 55, -5191.42, 355.32, 112.467, 'Captain Skyshatter'),
    (@SKYSHATTER, 56, -5233.37, 395.463, 112.177, 'Captain Skyshatter'),
    (@SKYSHATTER, 57, -5286.87, 437.22, 105.525, 'Captain Skyshatter'),
    (@SKYSHATTER, 58, -5266.34, 478.182, 110.562, 'Captain Skyshatter'),
    (@SKYSHATTER, 59, -5206.61, 503.573, 111.606, 'Captain Skyshatter'),
    (@SKYSHATTER, 60, -5163.47, 534.104, 114.552, 'Captain Skyshatter'),
    (@SKYSHATTER, 61, -5182.36, 515.241, 116.022, 'Captain Skyshatter'),
    (@SKYSHATTER, 62, -5206.81, 518.967, 117.426, 'Captain Skyshatter'),
    (@SKYSHATTER, 63, -5187.21, 521.63, 118.514, 'Captain Skyshatter'),
    (@SKYSHATTER, 64, -5155.39, 545.64, 116.076, 'Captain Skyshatter'),
    (@SKYSHATTER, 65, -5115.6, 583.206, 129.026, 'Captain Skyshatter'),
    (@SKYSHATTER, 66, -5073.47, 649.348, 119.881, 'Captain Skyshatter'),
    (@SKYSHATTER, 67, -5052.38, 670.897, 116.044, 'Captain Skyshatter'),
    (@SKYSHATTER, 68, -4996.43, 662.926, 113.267, 'Captain Skyshatter'),
    (@SKYSHATTER, 69, -4961.47, 656.298, 112.929, 'Captain Skyshatter'),
    (@SKYSHATTER, 70, -4943.27, 612.649, 112.304, 'Captain Skyshatter'),
    (@SKYSHATTER, 71, -4942.63, 576.912, 111.831, 'Captain Skyshatter'),
    (@SKYSHATTER, 72, -4962.21, 556.808, 111.463, 'Captain Skyshatter'),
    (@SKYSHATTER, 73, -4991.94, 532.689, 123.558, 'Captain Skyshatter'),
    (@SKYSHATTER, 74, -5018.77, 500.9, 128.931, 'Captain Skyshatter'),
    (@SKYSHATTER, 75, -5046, 464.881, 154.479, 'Captain Skyshatter'),
    (@SKYSHATTER, 76, -5057.32, 433.366, 183.934, 'Captain Skyshatter'),
    (@SKYSHATTER, 77, -5062.08, 423.791, 206.805, 'Captain Skyshatter'),
    (@SKYSHATTER, 78, -5073.28, 396.567, 212.024, 'Captain Skyshatter'),
    (@SKYSHATTER, 79, -5078.93, 361.95, 212.344, 'Captain Skyshatter'),
    (@SKYSHATTER, 80, -5083.38, 319.898, 223.106, 'Captain Skyshatter'),
    (@SKYSHATTER, 81, -5091.54, 267.262, 219.859, 'Captain Skyshatter'),
    (@SKYSHATTER, 82, -5077.74, 245.874, 217.788, 'Captain Skyshatter'),
    (@SKYSHATTER, 83, -5024.21, 225.572, 176.249, 'Captain Skyshatter'),
    (@SKYSHATTER, 84, -4999.13, 223.503, 164.288, 'Captain Skyshatter'),
    (@SKYSHATTER, 85, -4942.19, 274.08, 168.949, 'Captain Skyshatter'),
    (@SKYSHATTER, 86, -4953.87, 301.817, 153.814, 'Captain Skyshatter'),
    (@SKYSHATTER, 87, -4966.83, 291.411, 163.316, 'Captain Skyshatter'),
    (@SKYSHATTER, 88, -4964.36, 265.204, 163.522, 'Captain Skyshatter'),
    (@SKYSHATTER, 89, -4938.63, 264.626, 164.217, 'Captain Skyshatter'),
    (@SKYSHATTER, 90, -4931.72, 291.768, 150.76, 'Captain Skyshatter'),
    (@SKYSHATTER, 91, -4957.72, 300.242, 162.393, 'Captain Skyshatter'),
    (@SKYSHATTER, 92, -4970.39, 252.106, 159.856, 'Captain Skyshatter'),
    (@SKYSHATTER, 93, -4998.35, 241.729, 158.3, 'Captain Skyshatter'),
    (@SKYSHATTER, 94, -4980.71, 264.41, 156.807, 'Captain Skyshatter'),
    (@SKYSHATTER, 95, -5010.4, 241.114, 149.504, 'Captain Skyshatter'),
    (@SKYSHATTER, 96, -5037.11, 210.487, 150.594, 'Captain Skyshatter'),
    (@SKYSHATTER, 97, -5059.4, 188.456, 168.62, 'Captain Skyshatter'),
    (@SKYSHATTER, 98, -5092.59, 173.388, 162.922, 'Captain Skyshatter'),
    (@SKYSHATTER, 99, -5105.72, 202.446, 164.665, 'Captain Skyshatter'),
    (@SKYSHATTER, 100, -5082.91, 206.861, 166.916, 'Captain Skyshatter'),
    (@SKYSHATTER, 101, -5079.08, 185.103, 161.787, 'Captain Skyshatter'),
    (@SKYSHATTER, 102, -5090.4, 212.133, 167.925, 'Captain Skyshatter'),
    (@SKYSHATTER, 103, -5090.4, 212.133, 167.925, 'Captain Skyshatter'),
    (@SKYSHATTER, 104, -5118.5, 223.472, 172.949, 'Captain Skyshatter'),
    (@SKYSHATTER, 105, -5114.53, 185.571, 172.229, 'Captain Skyshatter'),
    (@SKYSHATTER, 106, -5086.57, 177.489, 165.926, 'Captain Skyshatter'),
    (@SKYSHATTER, 107, -5104.78, 204.471, 162.304, 'Captain Skyshatter'),
    (@SKYSHATTER, 108, -5100.53, 240.85, 172.979, 'Captain Skyshatter'),
    (@SKYSHATTER, 109, -5100.42, 211.319, 159.459, 'Captain Skyshatter'),
    (@SKYSHATTER, 110, -5099.75, 238.598, 185.354, 'Captain Skyshatter'),
    (@SKYSHATTER, 111, -5100.56, 184.533, 166.588, 'Captain Skyshatter'),
    (@SKYSHATTER, 112, -5099.49, 223.17, 183.528, 'Captain Skyshatter'),
    (@SKYSHATTER, 113, -5098.72, 251.22, 184.03, 'Captain Skyshatter'),
    (@SKYSHATTER, 114, -5102.87, 221.21, 170.16, 'Captain Skyshatter'),
    (@SKYSHATTER, 115, -5103.02, 176.81, 149.762, 'Captain Skyshatter'),
    (@SKYSHATTER, 116, -5125.85, 178.913, 170.682, 'Captain Skyshatter'),
    (@SKYSHATTER, 117, -5105.31, 221.506, 177.608, 'Captain Skyshatter'),
    (@SKYSHATTER, 118, -5077.74, 257.581, 188.335, 'Captain Skyshatter'),
    (@SKYSHATTER, 119, -5054.87, 298.941, 202.73, 'Captain Skyshatter'),
    (@SKYSHATTER, 120, -5025.86, 320.998, 195.272, 'Captain Skyshatter'),
    (@SKYSHATTER, 121, -4985.94, 354.82, 187.078, 'Captain Skyshatter'),
    (@SKYSHATTER, 122, -4965.83, 393.094, 212.127, 'Captain Skyshatter'),
    (@SKYSHATTER, 123, -4936.18, 440.955, 223.817, 'Captain Skyshatter'),
    (@SKYSHATTER, 124, -4915.47, 486.716, 162.626, 'Captain Skyshatter'),
    (@SKYSHATTER, 125, -4907.49, 506.496, 137.118, 'Captain Skyshatter'),
    (@SKYSHATTER, 126, -4909.6, 542.633, 125.838, 'Captain Skyshatter'),
    (@SKYSHATTER, 127, -4918.57, 610.449, 132.913, 'Captain Skyshatter'),
    (@SKYSHATTER, 128, -4929.68, 650.715, 119.914, 'Captain Skyshatter'),
    (@SKYSHATTER, 129, -4970.79, 659.978, 103.462, 'Captain Skyshatter'),
    (@SKYSHATTER, 130, -4997.78, 664.189, 97.2824, 'Captain Skyshatter'),
    (@SKYSHATTER, 131, -4975.31, 660.466, 102.388, 'Captain Skyshatter'),
    (@SKYSHATTER, 132, -4989.89, 651.918, 98.5794, 'Captain Skyshatter'),
    (@SKYSHATTER, 133, -5002.25, 668.847, 93.8366, 'Captain Skyshatter'),
    (@SKYSHATTER, 134, -4985.44, 684.705, 94.677, 'Captain Skyshatter'),
    (@SKYSHATTER, 135, -4966.06, 661.69, 98.2438, 'Captain Skyshatter'),
    (@SKYSHATTER, 136, -4989.44, 661.463, 99.1368, 'Captain Skyshatter'),
    (@SKYSHATTER, 137, -5064.1, 665.918, 89.5543, 'Captain Skyshatter'),
    (@SKYSHATTER, 138, -5084.8, 665.122, 88.5924, 'Captain Skyshatter'),
    (@SKYSHATTER, 139, -5099, 664.576, 87.2931, 'Captain Skyshatter'),
    (@SKYSHATTER, 140, -5097.66, 650.922, 87.2361, 'Captain Skyshatter'),
    (@SKYSHATTER, 141, -5093.08, 642.734, 86.9699, 'Captain Skyshatter'),
    (@SKYSHATTER, 142, -5074.87, 625.44, 85.9116, 'Captain Skyshatter');

DELETE FROM spell_script_names WHERE spell_id=40945;
INSERT INTO spell_script_names VALUES(40945, 'spell_quest_dragonmaw_race_generic');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=41064;
INSERT INTO conditions VALUES (13, 3, 41064, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', "Target Players");
INSERT INTO conditions VALUES (13, 4, 41064, 0, 0, 31, 0, 3, 23356, 0, 0, 0, 0, '', "Target Trigger");
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=41284;
INSERT INTO conditions VALUES (13, 3, 41284, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', "Target Players");
INSERT INTO conditions VALUES (13, 4, 41284, 0, 0, 31, 0, 3, 23356, 0, 0, 0, 0, '', "Target Trigger");


-- The Deadliest Trap Ever Laid - [A][H] http://www.wowhead.com/quest=11101/the-deadliest-trap-ever-laid

SET @ARCUS := 23452;
SET @SKYBREAKER := 23441;
SET @ALTARDEFENDER := 23453;

DELETE FROM creature_summon_groups WHERE summonerId=@ARCUS;
INSERT INTO creature_summon_groups VALUES (@ARCUS, 0, 1, @ALTARDEFENDER, -3042.54, 832.879, -9.42804, 2.54627, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@ARCUS, 0, 1, @ALTARDEFENDER, -3048.65, 830.045, -10.5551, 2.54627, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@ARCUS, 0, 1, @ALTARDEFENDER, -3049.29, 824.519, -10.5041, 2.54627, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@ARCUS, 0, 1, @ALTARDEFENDER, -3052.54, 823.895, -10.5332, 2.54627, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@ARCUS, 0, 1, @ALTARDEFENDER, -3052.79, 819.289, -10.477, 2.54627, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@ARCUS, 0, 1, @ALTARDEFENDER, -3044.22, 836.612, -9.52011, 2.36563, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@ARCUS, 0, 1, @ALTARDEFENDER, -3057.13, 815.938, -10.112, 2.54627, 4, 30000);

DELETE FROM creature_text WHERE entry IN(@ARCUS, @SKYBREAKER);
INSERT INTO creature_text VALUES(@ARCUS, 0, 0, 'The Dragonmaw must be stopped...', 14, 0, 100, 0, 0, 0, 0, 0, 'Commander Arcus');
INSERT INTO creature_text VALUES(@ARCUS, 1, 0, 'Victory to the Aldor! The Dragonmaw have been defeated!', 14, 0, 100, 0, 0, 0, 0, 0, 'Commander Arcus');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 0, 'BURN IT DOWN!', 14, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 1, 'KILL THEM ALL!', 14, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 2, 'For the Dragonmaw!', 12, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 3, 'Long live the Dragonmaw! Die you worthless $N!', 12, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 4, 'Your bones will break under my boot, $N', 12, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@ARCUS;
DELETE FROM smart_scripts WHERE entryorguid=@ARCUS AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@ARCUS*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 0, 1, 19, 0, 100, 0, 11101, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Quest Accept - Remove Flags');
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @ARCUS*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Quest Accept - Run Script');
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 2, 3, 25, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Reset - Set Combat Movement');
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Reset - Set Flags');
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 4, 0, 0, 0, 100, 0, 1000, 1000, 2000, 2000, 11, 41440, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - In Combat - Cast Shoot');
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 5, 0, 0, 0, 100, 0, 6000, 6000, 12000, 12000, 11, 38370, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - In Combat - Cast Aimed Shot');
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 6, 0, 0, 0, 100, 0, 8000, 8000, 15000, 15000, 11, 41448, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - In Combat - Cast Multi-Shot');
INSERT INTO smart_scripts VALUES (@ARCUS, 0, 7, 0, 4, 0, 100, 0, 0, 0, 0, 0, 39, 15, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Aggro - Call For Help');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Talk');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Set Run');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -3057, 826, -10.47, 2.5, 'Commander Arcus - On Script - Set Home Position');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 3, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -3057, 826, -10.47, 2.5, 'Commander Arcus - On Script - Move Point');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 107, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Summon Creature Group');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 5, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Set Combat Movement');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 6, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3070, 828, -4.47, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 7, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3069, 822, -5.13, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 8, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3058, 832, -4.70, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 9, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3052, 843, -4.80, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 10, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3070, 840, -4.90, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 11, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3055, 842, -5.05, 5.3, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 12, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3062, 822, -4.67, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 13, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3067, 828, -4.70, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 14, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3055, 844, -4.80, 5.3, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 15, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3070, 834, -4.76, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 16, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3062, 825, -4.62, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 17, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3062, 822, -4.49, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 18, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3069, 828, -4.98, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 19, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3055, 834, -4.85, 5.3, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 20, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3057, 822, -4.93, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 21, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3068, 832, -4.49, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 22, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3065, 834, -4.99, 5.3, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 23, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -3067, 828, -5.11, 0, 'Commander Arcus - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 24, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Talk');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 25, 0, 0, 0, 100, 0, 0, 0, 0, 0, 15, 11101, 0, 0, 0, 0, 0, 17, 0, 100, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - GroupEventHappens');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 26, 0, 0, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -3023.1, 793.82, -8.82, 2.639, 'Commander Arcus - On Script - Set Home Position');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 27, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Set flags');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 28, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @SKYBREAKER, 50, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Despawn Target');
INSERT INTO smart_scripts VALUES (@ARCUS*100, 9, 29, 0, 0, 0, 100, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Arcus - On Script - Evade');

UPDATE creature_template SET AIName='SmartAI', ScriptName='', InhabitType=4 WHERE entry=@SKYBREAKER;
REPLACE INTO creature_template_addon VALUES(@SKYBREAKER, 0, 20684, 50331648, 4092, 0, '');
DELETE FROM smart_scripts WHERE entryorguid=@SKYBREAKER AND source_type=0;
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 0, 0, 0, 0, 100, 0, 1000, 1000, 3500, 3500, 11, 41440, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Cast Shoot');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 1, 0, 0, 0, 100, 0, 6000, 6000, 12000, 12000, 11, 38370, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Cast Aimed Shot');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 2, 0, 0, 0, 100, 0, 8000, 8000, 15000, 15000, 11, 41448, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Cast Multi-Shot');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 3, 0, 38, 0, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - On AI Init - Disable Auto Attack');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 4, 0, 0, 0, 100, 1, 500, 500, 0, 0, 79, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Set Combat Range');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 5, 0, 4, 0, 30, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - On Aggro - Say Line 0');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@ALTARDEFENDER;
REPLACE INTO creature_template_addon VALUES(@ALTARDEFENDER, 0, 0, 0, 4098, 0, '');
DELETE FROM smart_scripts WHERE entryorguid=@ALTARDEFENDER AND source_type=0;
INSERT INTO smart_scripts VALUES (@ALTARDEFENDER, 0, 0, 0, 0, 0, 100, 0, 1000, 1000, 3500, 3500, 11, 41440, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Altar Defender - In Combat - Cast Shoot');


-- The Deadliest Trap Ever Laid - [A][H] http://www.wowhead.com/quest=11097/the-deadliest-trap-ever-laid

SET @HOBB := 23434;
SET @SKYBREAKER := 23440;
SET @SANCTUMDEFENDER := 23435;

DELETE FROM creature_summon_groups WHERE summonerId=@HOBB;
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4083.84, 1071.03, 31.9116, 5.25591, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4083.11, 1075.08, 32.5654, 5.25591, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4079.09, 1073.98, 31.8, 5.25591, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4077.84, 1078.41, 32.7097, 5.25591, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4075.08, 1078.48, 32.4796, 5.25591, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4072.8, 1082.43, 33.3564, 5.25591, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4068.49, 1082.18, 33.0106, 5.25591, 4, 30000);
INSERT INTO creature_summon_groups VALUES (@HOBB, 0, 1, @SANCTUMDEFENDER, -4067.44, 1085.14, 33.8085, 5.25591, 4, 30000);

REPLACE INTO creature_model_info VALUES(21505, 0.5362, 2.1, 0, 0);
DELETE FROM creature_text WHERE entry IN(@HOBB, @SKYBREAKER);
INSERT INTO creature_text VALUES(@HOBB, 0, 0, 'Defenders, show these mongrels the fury of a Scryer!', 14, 0, 100, 0, 0, 0, 0, 0, 'Commander Hobb');
INSERT INTO creature_text VALUES(@HOBB, 1, 0, 'Victory to the Scryers! The Dragonmaw have been defeated!', 14, 0, 100, 0, 0, 0, 0, 0, 'Commander Hobb');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 0, 'BURN IT DOWN!', 14, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 1, 'KILL THEM ALL!', 14, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 2, 'For the Dragonmaw!', 12, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 3, 'Long live the Dragonmaw! Die you worthless $N!', 12, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');
INSERT INTO creature_text VALUES(@SKYBREAKER, 0, 4, 'Your bones will break under my boot, $N', 12, 0, 100, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@HOBB;
DELETE FROM smart_scripts WHERE entryorguid=@HOBB AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@HOBB*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (@HOBB, 0, 0, 1, 19, 0, 100, 0, 11097, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Quest Accept - Remove Flags');
INSERT INTO smart_scripts VALUES (@HOBB, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @HOBB*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Quest Accept - Run Script');
INSERT INTO smart_scripts VALUES (@HOBB, 0, 2, 3, 25, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Reset - Set Combat Movement');
INSERT INTO smart_scripts VALUES (@HOBB, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Reset - Set Flags');
INSERT INTO smart_scripts VALUES (@HOBB, 0, 4, 0, 0, 0, 100, 0, 1000, 1000, 2000, 2000, 11, 41440, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - In Combat - Cast Shoot');
INSERT INTO smart_scripts VALUES (@HOBB, 0, 5, 0, 0, 0, 100, 0, 6000, 6000, 12000, 12000, 11, 38370, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - In Combat - Cast Aimed Shot');
INSERT INTO smart_scripts VALUES (@HOBB, 0, 6, 0, 0, 0, 100, 0, 8000, 8000, 15000, 15000, 11, 41448, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - In Combat - Cast Multi-Shot');
INSERT INTO smart_scripts VALUES (@HOBB, 0, 7, 0, 4, 0, 100, 0, 0, 0, 0, 0, 39, 15, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Aggro - Call For Help');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Talk');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Set Run');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -4077, 1087, 35.17, 5.3, 'Commander Hobb - On Script - Set Home Position');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 3, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -4077, 1087, 35.17, 5.3, 'Commander Hobb - On Script - Move Point');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 107, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Summon Creature Group');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 5, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Set Combat Movement');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 6, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4084, 1076, 44, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 7, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4076, 1077, 48, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 8, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4078, 1083, 41, 1.9, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 9, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4065, 1085, 50, 2.2, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 10, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4066, 1085, 52, 2.4, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 11, 0, 0, 0, 100, 0, 100, 100, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4065, 1079, 47, 3.0, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 12, 0, 0, 0, 100, 0, 5000, 10000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4076, 1071, 48, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 13, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4084, 1076, 44, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 14, 0, 0, 0, 100, 0, 5000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4065, 1086, 47, 3.0, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 15, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4066, 1087, 52, 2.4, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 16, 0, 0, 0, 100, 0, 5000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4072, 1085, 50, 2.2, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 17, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4076, 1078, 48, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 18, 0, 0, 0, 100, 0, 5000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4083, 1080, 44, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 19, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4067, 1079, 47, 3.0, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 20, 0, 0, 0, 100, 0, 5000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4076, 1076, 48, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 21, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4078, 1083, 41, 1.9, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 22, 0, 0, 0, 100, 0, 5000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4072, 1086, 47, 3.0, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 23, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 12, @SKYBREAKER, 2, 30000, 0, 1, 0, 8, 0, 0, 0, -4080, 1080, 44, 1.7, 'Commander Hobb - On Script - Summon Creature');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 24, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Talk');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 25, 0, 0, 0, 100, 0, 0, 0, 0, 0, 15, 11097, 0, 0, 0, 0, 0, 17, 0, 100, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - GroupEventHappens');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 26, 0, 0, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -4106.57, 1126.79, 43.644, 5.65, 'Commander Hobb - On Script - Set Home Position');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 27, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Set flags');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 28, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @SKYBREAKER, 50, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Despawn Target');
INSERT INTO smart_scripts VALUES (@HOBB*100, 9, 29, 0, 0, 0, 100, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Commander Hobb - On Script - Evade');

UPDATE creature_template SET AIName='SmartAI', ScriptName='', InhabitType=4 WHERE entry=@SKYBREAKER;
REPLACE INTO creature_template_addon VALUES(@SKYBREAKER, 0, 20684, 50331648, 4092, 0, '');
DELETE FROM smart_scripts WHERE entryorguid=@SKYBREAKER AND source_type=0;
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 0, 0, 0, 0, 100, 0, 1000, 1000, 3500, 3500, 11, 41440, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Cast Shoot');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 1, 0, 0, 0, 100, 0, 6000, 6000, 12000, 12000, 11, 38370, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Cast Aimed Shot');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 2, 0, 0, 0, 100, 0, 8000, 8000, 15000, 15000, 11, 41448, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Cast Multi-Shot');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 3, 0, 38, 0, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - On AI Init - Disable Auto Attack');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 4, 0, 0, 0, 100, 1, 500, 500, 0, 0, 79, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - In Combat - Set Combat Range');
INSERT INTO smart_scripts VALUES (@SKYBREAKER, 0, 5, 0, 4, 0, 30, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Skybreaker - On Aggro - Say Line 0');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@SANCTUMDEFENDER;
REPLACE INTO creature_template_addon VALUES(@SANCTUMDEFENDER, 0, 0, 0, 4098, 0, '');
DELETE FROM smart_scripts WHERE entryorguid=@SANCTUMDEFENDER AND source_type=0;
INSERT INTO smart_scripts VALUES (@SANCTUMDEFENDER, 0, 0, 0, 0, 0, 100, 0, 1000, 1000, 3500, 3500, 11, 41440, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Defender - In Combat - Cast Shoot');


-- In Dreams - [A] http://www.wowhead.com/quest=5944/in-dreams

REPLACE INTO creature_questender VALUES(12126, 5944);
DELETE FROM creature_text WHERE entry IN(1840, 1842, 12126);
INSERT INTO creature_text VALUES(1842, 0, 0, "I will lead us through Hearthglen to the forest's edge. From there, you will take me to my father.", 12, 0, 100, 0, 0, 0, 0, 0, 'Taelan Fordring');
INSERT INTO creature_text VALUES(1842, 1, 0, "Remove your disguise, lest you feel the bite of my blade when the fury has taken control.", 12, 0, 100, 0, 0, 0, 0, 0, 'Taelan Fordring');
INSERT INTO creature_text VALUES(1842, 2, 0, "Halt.", 12, 0, 100, 0, 0, 0, 0, 0, 'Taelan Fordring');
INSERT INTO creature_text VALUES(1842, 3, 0, "Highlord Taelan Fordring calls for his mount.", 16, 0, 100, 22, 0, 0, 0, 0, 'Taelan Fordring');
INSERT INTO creature_text VALUES(1842, 4, 0, "It's not much further. The main road is just up ahead.", 12, 0, 100, 0, 0, 0, 0, 0, 'Taelan Fordring');
INSERT INTO creature_text VALUES(1842, 5, 0, "Isillien!", 14, 0, 100, 0, 0, 0, 0, 0, 'Taelan Fordring');
INSERT INTO creature_text VALUES(1842, 6, 0, "This is not your fight, stranger. Protect yourself from the attacks of the Crimson Elite. I shall battle the Grand Inquisitor.", 12, 0, 100, 0, 0, 0, 0, 0, 'Taelan Fordring');
INSERT INTO creature_text VALUES(1840, 0, 0, "You will not make it to the forest's edge, Fordring.", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 1, 0, "You disappoint me, Taelan. I had plans for you... grand plans. Alas, it was only a matter of time before your filthy bloodline would catch up with you.", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 2, 0, "It is as they say; Like father, like son. You are as weak of will as Tirion... perhaps more so. I can only hope my assassins finally succeeded in ending his pitiful life.", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 3, 0, "The Grand Crusader has charged me with destroying you and your newfound friends, Taelan, but know this: I do this for pleasure, not of obligation or duty.", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 4, 0, "Grand Inquisitor Isillien calls for his guardsman.", 16, 0, 100, 22, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 5, 0, "The end is now, Fordring.", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 6, 0, "Enough!", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 7, 0, "Grand Inquisitor Isillien laughs.", 16, 0, 100, 11, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 8, 0, "Did you really believe that you could defeat me? Your friends are soon to join you, Taelan.", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 9, 0, "Tragic. The elder Fordring lives on... You are too late, old man. Retreat back to your cave, hermit, unless you wish to join your son in the Twisting Nether.", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(1840, 10, 0, "Then come, hermit!", 12, 0, 100, 0, 0, 0, 0, 0, 'Grand Inquisitor Isillien');
INSERT INTO creature_text VALUES(12126, 0, 0, "What have you done, Isillien? You once fought with honor, for the good of our people... and now... you have murdered my boy...", 12, 0, 100, 1, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 1, 0, "May your soul burn in anguish, Isillien! Light give me strength to battle this fiend.", 12, 0, 100, 15, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 2, 0, "Face me, coward. Face the faith and strength that you once embodied.", 12, 0, 100, 25, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 3, 0, "A thousand more like him exist. Ten thousand. Should one fall, another will rise to take the seat of power.", 12, 0, 100, 0, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 4, 0, "Lord Tirion Fordring falls to one knee.", 16, 0, 100, 0, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 5, 0, "Look what they did to my boy.", 12, 0, 100, 5, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 6, 0, "Too long have I sat idle, gripped in this haze... this malaise, lamenting what could have been... what should have been.", 12, 0, 100, 0, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 7, 0, "Your death will not have been in vain, Taelan. A new Order is born on this day... an Order which will dedicate itself to extinguising the evil that plagues this world. An evil that cannot hide behind politics and pleasantries.", 12, 0, 100, 0, 0, 0, 0, 0, 'Lord Tirion Fordring');
INSERT INTO creature_text VALUES(12126, 8, 0, "This I promise... This I vow...", 12, 0, 100, 0, 0, 0, 0, 0, 'Lord Tirion Fordring');

SET @ENTRY := 1842; -- Highlord Taelan Fordring SAI
UPDATE creature_template SET speed_walk=1, AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,0,34,0,100,0,8,16777215,0,0,43,0,2402,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Reached Point 16777215 - Mount To Model 2402"),
    (@ENTRY,0,1,2,19,0,100,0,5944,0,0,0,1,0,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Quest '' Taken - Say Line 0"),
    (@ENTRY,0,2,0,61,0,100,0,5944,0,0,0,53,0,1842,0,0,0,2,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Quest '' Taken - Start Waypoint"),
    (@ENTRY,0,3,15,11,0,100,0,0,0,0,0,2,67,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Respawn - Set Faction 67"),
    (@ENTRY,0,4,0,4,0,100,0,0,0,0,0,11,17232,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Aggro - Cast 'Devotion Aura'"),
    (@ENTRY,0,5,0,0,0,100,0,3000,3000,5000,5000,11,17281,0,0,0,0,0,2,0,0,0,0,0,0,0,"Highlord Taelan Fordring - In Combat - Cast 'Crusader Strike'"),
    (@ENTRY,0,6,0,2,0,100,0,0,20,120000,120000,11,17233,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - Between 0-20% Health - Cast 'Lay on Hands'"),
    (@ENTRY,0,7,8,40,0,100,0,1,0,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 1 Reached - Say Line 1"),
    (@ENTRY,0,8,0,61,0,100,0,1,0,0,0,2,42,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 1 Reached - Set Faction 42"),
    (@ENTRY,0,9,10,40,0,100,0,26,0,0,0,54,7000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 26 Reached - Pause Waypoint"),
    (@ENTRY,0,10,11,61,0,100,0,26,0,0,0,1,2,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 26 Reached - Say Line 2"),
    (@ENTRY,0,11,12,61,0,100,0,26,0,0,0,1,3,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 26 Reached - Say Line 3"),
    (@ENTRY,0,12,17,61,0,100,0,26,0,0,0,43,0,2402,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 26 Reached - Mount To Model 2402"),
    (@ENTRY,0,13,0,40,0,100,0,74,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 74 Reached - Run Script"),
    (@ENTRY,0,14,0,8,0,100,0,18969,0,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Spellhit 'Taelan Death' - Run Script"),
    (@ENTRY,0,15,16,61,0,100,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Respawn - Remove Flags Immune To Players & Immune To NPC's"),
    (@ENTRY,0,16,0,61,0,100,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Respawn - Remove Flag Standstate Dead"),
    (@ENTRY,0,17,0,61,0,100,0,26,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Waypoint 26 Reached - Set Run On");

SET @ENTRY := 184200; -- Actionlist SAI
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Say Line 4"),
    (@ENTRY,9,1,0,0,0,100,0,100,100,0,0,66,0,0,0,0,0,0,21,40,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Set Orientation Closest Player"),
    (@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,12,1840,4,120000,0,0,0,8,0,0,0,2683.64,-1926.72,72.14,2,"Highlord Taelan Fordring - On Script - Summon Creature 'Grand Inquisitor Isillien'"),
    (@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Say Line 5"),
    (@ENTRY,9,4,0,0,0,100,0,4000,4000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Say Line 6"),
    (@ENTRY,9,5,0,0,0,100,0,0,0,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Dismount"),
    (@ENTRY,9,6,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Set Home Position"),
    (@ENTRY,9,7,0,0,0,100,0,0,0,0,0,19,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Remove Flag Pvp Attackable"),
    (@ENTRY,9,8,0,0,0,100,0,0,0,0,0,41,300000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Despawn In 300000 ms");

SET @ENTRY := 184201; -- Actionlist SAI
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,9,0,0,0,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Evade"),
    (@ENTRY,9,1,0,0,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Set Flags Immune To Players & Immune To NPC's"),
    (@ENTRY,9,2,0,0,0,100,0,2000,2000,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Set Flag Standstate Dead"),
    (@ENTRY,9,3,0,0,0,100,0,2000,2000,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Highlord Taelan Fordring - On Script - Kill self");

SET @ENTRY := 1840; -- Grand Inquisitor Isillien SAI
UPDATE creature_template SET faction=16, AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,0,37,0,100,0,0,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Initialize - Run Script"),
    (@ENTRY,0,1,0,0,0,100,0,1000,1000,30000,30000,11,11647,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - In Combat - Cast 'Power Word: Shield'"),
    (@ENTRY,0,2,0,0,0,100,0,3000,3000,8000,9000,11,17287,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - In Combat - Cast 'Mind Blast'"),
    (@ENTRY,0,3,0,0,0,100,0,20000,20000,20000,20000,11,13639,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - In Combat - Cast 'Greater Health'"),
    (@ENTRY,0,4,0,0,0,100,0,7000,8000,15000,15000,11,17314,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - In Combat - Cast 'Mind Flay'");

SET @ENTRY := 184000; -- Actionlist SAI
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,9,0,0,0,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Set Flags Immune To Players & Immune To NPC's"),
    (@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 0"),
    (@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,69,0,0,0,0,0,0,8,0,0,0,2677,-1917,68,2.1,"Grand Inquisitor Isillien - On Script - Move To Position"),
    (@ENTRY,9,3,0,0,0,100,0,8000,8000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 1"),
    (@ENTRY,9,4,0,0,0,100,0,8000,8000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 2"),
    (@ENTRY,9,5,0,0,0,100,0,8000,8000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 3"),
    (@ENTRY,9,6,0,0,0,100,0,8000,8000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 4"),
    (@ENTRY,9,7,0,0,0,100,0,5000,5000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 5"),
    (@ENTRY,9,8,0,0,0,100,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,2674,-1920,68.41,1.8,"Grand Inquisitor Isillien - On Script - Summon Creature 'Crimson Elite'"),
    (@ENTRY,9,9,0,0,0,100,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,2684,-1918,69.52,2.2,"Grand Inquisitor Isillien - On Script - Summon Creature 'Crimson Elite'"),
    (@ENTRY,9,10,0,0,0,100,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,2694,-1875,66.86,3.8,"Grand Inquisitor Isillien - On Script - Summon Creature 'Crimson Elite'"),
    (@ENTRY,9,11,0,0,0,100,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,2693,-1869,66.87,3.9,"Grand Inquisitor Isillien - On Script - Summon Creature 'Crimson Elite'"),
    (@ENTRY,9,12,0,0,0,100,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,2697,-1879,66.8,3.8,"Grand Inquisitor Isillien - On Script - Summon Creature 'Crimson Elite'"),
    (@ENTRY,9,13,0,0,0,100,0,2000,2000,0,0,45,1,1,0,0,0,0,11,12128,100,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Set Data 1 1"),
    (@ENTRY,9,14,0,0,0,100,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Immune To NPC's"),
    (@ENTRY,9,15,0,0,0,100,0,0,0,0,0,49,0,0,0,0,0,0,19,1842,30,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Start Attacking"),
    (@ENTRY,9,16,0,0,0,100,0,45000,45000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 6"),
    (@ENTRY,9,17,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Set Home Position"),
    (@ENTRY,9,18,0,0,0,100,0,0,0,0,0,11,18969,2,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Cast 'Taelan Death'"),
    (@ENTRY,9,19,0,0,0,100,0,500,500,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Evade"),
    (@ENTRY,9,20,0,0,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Set Flags Immune To Players & Immune To NPC's"),
    (@ENTRY,9,21,0,0,0,100,0,6000,6000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 7"),
    (@ENTRY,9,22,0,0,0,100,0,3000,3000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Say Line 8"),
    (@ENTRY,9,23,0,0,0,100,0,5000,5000,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Remove Flags Immune To Players & Immune To NPC's"),
    (@ENTRY,9,24,0,0,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,"Grand Inquisitor Isillien - On Script - Start Attacking"),
    (@ENTRY,9,25,0,0,0,100,0,25000,25000,0,0,12,12126,4,180000,0,0,0,8,0,0,0,2642.8,-1913,71.2,0.4,"Grand Inquisitor Isillien - On Script - Summon Creature 'Lord Tirion Fordring'");

DELETE FROM waypoints WHERE entry=12126;
INSERT INTO waypoints VALUES (12126, 1, 2667, -1899, 66.81, 'Taelan Fordring');

SET @ENTRY := 12126; -- Lord Tirion Fordring SAI
UPDATE creature_template SET unit_flags=0, faction=35, flags_extra=2, AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,1,37,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Initialize - Set Reactstate Aggressive"),
    (@ENTRY,0,1,2,61,0,100,0,0,0,0,0,43,0,2402,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Initialize - Mount To Model 2402"),
    (@ENTRY,0,2,3,61,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Initialize - Set Run On"),
    (@ENTRY,0,3,4,61,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Initialize - Set Npc Flag "),
    (@ENTRY,0,4,0,61,0,100,0,0,0,0,0,53,1,12126,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Initialize - Start Waypoint"),
    (@ENTRY,0,5,0,40,0,100,0,1,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Waypoint 1 Reached - Run Script"),
    (@ENTRY,0,6,0,7,1,100,0,0,0,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Evade - Run Script (Phase 1)");

SET @ENTRY := 1212600; -- Actionlist SAI
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,9,0,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Set Home Position"),
    (@ENTRY,9,1,0,0,0,100,0,500,500,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Dismount"),
    (@ENTRY,9,2,0,0,0,100,0,500,500,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Set Flag Standstate Kneel"),
    (@ENTRY,9,3,0,0,0,100,0,5000,5000,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Remove Flag Standstate Kneel"),
    (@ENTRY,9,4,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,19,1840,50,0,0,0,0,0,"Lord Tirion Fordring - On Script - Set Orientation Closest Creature 'Grand Inquisitor Isillien'"),
    (@ENTRY,9,5,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 1"),
    (@ENTRY,9,6,0,0,0,100,0,4000,4000,0,0,1,9,0,0,0,0,0,19,1840,50,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 9"),
    (@ENTRY,9,7,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 2"),
    (@ENTRY,9,8,0,0,0,100,0,4000,4000,0,0,1,10,0,0,0,0,0,19,1840,50,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 10"),
    (@ENTRY,9,9,0,0,0,100,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Remove Flags Immune To Players & Immune To NPC's"),
    (@ENTRY,9,10,0,0,0,100,0,0,0,0,0,2,42,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Set Faction 42"),
    (@ENTRY,9,11,0,0,0,100,0,3000,3000,0,0,49,0,0,0,0,0,0,19,1840,50,0,0,0,0,0,"Lord Tirion Fordring - On Script - Start Attacking"),
    (@ENTRY,9,12,0,0,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Set Event Phase 1");

SET @ENTRY := 1212601; -- Actionlist SAI
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,9,0,0,0,0,100,0,3000,3000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 3"),
    (@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 4"),
    (@ENTRY,9,2,0,0,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Set Flag Standstate Kneel"),
    (@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 5"),
    (@ENTRY,9,4,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Remove Flag Standstate Kneel"),
    (@ENTRY,9,5,0,0,0,100,0,8000,8000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 6"),
    (@ENTRY,9,6,0,0,0,100,0,9000,9000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 7"),
    (@ENTRY,9,7,0,0,0,100,0,12000,12000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Say Line 8"),
    (@ENTRY,9,8,0,0,0,100,0,1000,1000,0,0,15,5944,0,0,0,0,0,18,50,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Quest Credit ''"),
    (@ENTRY,9,9,0,0,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Tirion Fordring - On Script - Set Npc Flag Questgiver");

SET @ENTRY := 12128; -- Crimson Elite SAI
UPDATE creature_template SET DamageModifier=2, faction=16, AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,0,0,0,100,0,3000,5000,9000,10000,11,17143,0,0,0,0,0,2,0,0,0,0,0,0,0,"Crimson Elite - In Combat - Cast 'Holy Strike'"),
    (@ENTRY,0,1,0,0,0,100,0,8000,9000,20000,22000,11,14518,0,0,0,0,0,2,0,0,0,0,0,0,0,"Crimson Elite - In Combat - Cast 'Crusader Strike'"),
    (@ENTRY,0,2,0,38,0,100,0,1,1,0,0,69,0,0,0,0,0,0,8,0,0,0,2674,-1906,66.1,5.3,"Crimson Elite - On Data Set 1 1 - Move To Position");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceEntry=1842;
INSERT INTO conditions VALUES (22, 1, 1842, 0, 0, 23, 1, 203, 0, 0, 1, 0, 0, '', 'Dont run action in specific area');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=18969;
INSERT INTO conditions VALUES (13, 1, 18969, 0, 0, 31, 0, 3, 1842, 0, 0, 0, 0, '', 'Target Taelan');
DELETE FROM waypoints WHERE entry=1842;
INSERT INTO waypoints VALUES (1842, 1, 2941.47, -1391.79, 167.237, 'Taelan Fordring'),(1842, 2, 2940.59, -1393.34, 166.084, 'Taelan Fordring'),(1842, 3, 2934.76, -1403.63, 165.943, 'Taelan Fordring'),(1842, 4, 2932.09, -1408.34, 165.943, 'Taelan Fordring'),(1842, 5, 2917.95, -1402.97, 165.943, 'Taelan Fordring'),(1842, 6, 2919.7, -1398.38, 165.88, 'Taelan Fordring'),(1842, 7, 2922.96, -1389.76, 160.89, 'Taelan Fordring'),(1842, 8, 2925.9, -1386.68, 160.842, 'Taelan Fordring'),(1842, 9, 2946.78, -1396.55, 160.842, 'Taelan Fordring'),(1842, 10, 2948.71, -1392.82, 160.842, 'Taelan Fordring'),(1842, 11, 2951.88, -1386.69, 155.974, 'Taelan Fordring'),(1842, 12, 2953.8, -1383.23, 155.949, 'Taelan Fordring'),(1842, 13, 2951.18, -1381.97, 155.949, 'Taelan Fordring'),(1842, 14, 2946.54, -1379.57, 152.02, 'Taelan Fordring'),(1842, 15, 2943.02, -1377.76, 152.02, 'Taelan Fordring'),(1842, 16, 2935.55, -1392.66, 152.02, 'Taelan Fordring'),(1842, 17, 2920.61, -1385.01, 152.02, 'Taelan Fordring'),
(1842, 18, 2915.23, -1395.37, 152.02, 'Taelan Fordring'),(1842, 19, 2926.44, -1401.34, 152.03, 'Taelan Fordring'),(1842, 20, 2930.45, -1403.49, 150.521, 'Taelan Fordring'),(1842, 21, 2933.64, -1405.2, 150.521, 'Taelan Fordring'),(1842, 22, 2930.83, -1412.74, 150.504, 'Taelan Fordring'),(1842, 23, 2924.04, -1426.34, 150.781, 'Taelan Fordring'),(1842, 24, 2917.27, -1439.65, 150.664, 'Taelan Fordring'),(1842, 25, 2914.56, -1445.08, 149.505, 'Taelan Fordring'),(1842, 26, 2911.01, -1452.17, 147.891, 'Taelan Fordring'),(1842, 27, 2911.49, -1460.75, 147.348, 'Taelan Fordring'),(1842, 28, 2915.27, -1471.79, 146.082, 'Taelan Fordring'),(1842, 29, 2917.16, -1477.3, 146.179, 'Taelan Fordring'),(1842, 30, 2937.93, -1475.79, 146.786, 'Taelan Fordring'),(1842, 31, 2948.62, -1483.6, 146.287, 'Taelan Fordring'),(1842, 32, 2950.48, -1502.29, 146.109, 'Taelan Fordring'),(1842, 33, 2949.29, -1521.33, 146.274, 'Taelan Fordring'),(1842, 34, 2950.6, -1538.69, 146.082, 'Taelan Fordring'),
(1842, 35, 2930.13, -1562.47, 145.785, 'Taelan Fordring'),(1842, 36, 2916.36, -1578.33, 146.147, 'Taelan Fordring'),(1842, 37, 2909.48, -1586.26, 146.515, 'Taelan Fordring'),(1842, 38, 2902.06, -1590.55, 146.557, 'Taelan Fordring'),(1842, 39, 2888.13, -1591.98, 145.702, 'Taelan Fordring'),(1842, 40, 2876.43, -1591.6, 144.335, 'Taelan Fordring'),(1842, 41, 2862.5, -1593.03, 142.511, 'Taelan Fordring'),(1842, 42, 2846.46, -1603.03, 139.023, 'Taelan Fordring'),(1842, 43, 2836.07, -1612.41, 135.225, 'Taelan Fordring'),(1842, 44, 2827.58, -1620.07, 132.012, 'Taelan Fordring'),(1842, 45, 2820.52, -1623.16, 131.22, 'Taelan Fordring'),(1842, 46, 2804.83, -1620.19, 129.717, 'Taelan Fordring'),(1842, 47, 2791.11, -1617.4, 129.693, 'Taelan Fordring'),(1842, 48, 2780.39, -1615.9, 129.044, 'Taelan Fordring'),(1842, 49, 2773.01, -1623.84, 128.074, 'Taelan Fordring'),(1842, 50, 2766.04, -1631.69, 127.927, 'Taelan Fordring'),(1842, 51, 2759.06, -1639.54, 128.336, 'Taelan Fordring'),(1842, 52, 2752.08, -1647.38, 127.494, 'Taelan Fordring'),
(1842, 53, 2745.11, -1655.23, 126.277, 'Taelan Fordring'),(1842, 54, 2738.13, -1663.08, 126.679, 'Taelan Fordring'),(1842, 55, 2732.03, -1674.53, 126.673, 'Taelan Fordring'),(1842, 56, 2725.5, -1682.87, 126.414, 'Taelan Fordring'),(1842, 57, 2717.98, -1692.7, 126.476, 'Taelan Fordring'),(1842, 58, 2713.38, -1700, 125.79, 'Taelan Fordring'),(1842, 59, 2703.08, -1714.3, 122.214, 'Taelan Fordring'),(1842, 60, 2694.95, -1729.79, 117.559, 'Taelan Fordring'),(1842, 61, 2689.65, -1745.97, 112.656, 'Taelan Fordring'),(1842, 62, 2689.05, -1763.33, 106.147, 'Taelan Fordring'),(1842, 63, 2690.09, -1774.06, 102.238, 'Taelan Fordring'),(1842, 64, 2691.45, -1786.18, 97.3156, 'Taelan Fordring'),(1842, 65, 2692.17, -1800.16, 90.1386, 'Taelan Fordring'),(1842, 66, 2692.7, -1810.65, 85.387, 'Taelan Fordring'),(1842, 67, 2697.55, -1818.24, 81.7822, 'Taelan Fordring'),(1842, 68, 2700.73, -1829.26, 76.4334, 'Taelan Fordring'),(1842, 69, 2699.39, -1845.15, 71.4784, 'Taelan Fordring'),(1842, 70, 2696.58, -1856.38, 68.2104, 'Taelan Fordring'),(1842, 71, 2694.06, -1870.35, 66.9045, 'Taelan Fordring'),(1842, 72, 2693.26, -1873.62, 66.8413, 'Taelan Fordring'),
(1842, 73, 2675.36, -1891.94, 66.1742, 'Taelan Fordring'),(1842, 74, 2669.33, -1898.11, 66.7004, 'Taelan Fordring');


-- -------------------------------------------
-- WINTERGRASP
-- -------------------------------------------

-- Knight Dameron (Wintergrasp Commendation)
INSERT INTO `npc_vendor` (`entry`, `item`, `ExtendedCost`) VALUES ('32294', '44115', '2576');

-- Stone Guard Mukar (Wintergrasp Commendation)
INSERT INTO `npc_vendor` (`entry`, `item`, `ExtendedCost`) VALUES ('32296', '44115', '2576');


-- Vehicular Gnomeslaughter
DELETE FROM `disables` WHERE (`sourceType`='4') AND (`entry`='7704');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`) VALUES ('7704', '6', '4197');
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `ScriptName`) VALUES ('7704', '11', 'achievement_wg_vehicular_gnomeslaughter');


-- Zero Tolerance - [A][H] http://www.wowhead.com/quest=12686/zero-tolerance

SET @ENTRY := 28802;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,0,0,0,100,0,4000,4800,12000,14000,11,50361,0,0,0,0,0,2,0,0,0,0,0,0,0,"Servant of Drakuru - In Combat - Cast 'Rot Armor'"),
    (@ENTRY,0,1,2,29,0,100,0,0,0,0,0,67,1,180000,180000,0,0,0,1,0,0,0,0,0,0,0,"Servant of Drakuru - On Charmed - Create Timed Event"),
    (@ENTRY,0,2,0,61,0,100,0,0,0,0,0,36,28805,0,0,0,0,0,1,0,0,0,0,0,0,0,"Servant of Drakuru - On Charmed - Update Template To 'Hand of Drakuru'"),
    (@ENTRY,0,3,0,59,0,100,0,1,0,0,0,36,28802,0,0,0,0,0,1,0,0,0,0,0,0,0,"Servant of Drakuru - On Timed Event 1 Triggered - Update Template To 'Servant of Drakuru'");

UPDATE creature_model_info SET BoundingRadius=1.24, CombatReach=4 WHERE DisplayID=26924;
UPDATE creature_template SET faction=42, AIName='' WHERE entry=28805;
DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=28805;



-- The Tome of Valor - [A] http://www.wowhead.com/quest=1649/the-tome-of-valor

UPDATE creature_template SET faction=14 WHERE entry=6180;
DELETE FROM smart_scripts WHERE entryorguid=6180 AND source_type=0 AND id=2;

SET @DAPHNE := 6182;
DELETE FROM smart_scripts WHERE entryorguid=@DAPHNE  AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN (@DAPHNE*100+00, @DAPHNE*100+01, @DAPHNE*100+02) AND source_type=9;

UPDATE creature_template SET ScriptName="npc_daphne_stilwell", AIName="" WHERE entry=@DAPHNE;
UPDATE creature SET spawntimesecs=10 WHERE guid=66979 AND id=@DAPHNE;

DELETE FROM waypoints WHERE entry=@DAPHNE;
DELETE FROM script_waypoint WHERE entry=@DAPHNE;
INSERT INTO script_waypoint (entry, pointid, location_x, location_y, location_z, waittime, point_comment)
VALUES
    (@DAPHNE, 0, -11480.7, 1545.09, 49.8986, 0, ''),
    (@DAPHNE, 1, -11466.8, 1530.15, 50.2636, 0, ''),
    (@DAPHNE, 2, -11465.2, 1528.34, 50.9544, 0, 'entrance hut'),
    (@DAPHNE, 3, -11463, 1525.24, 50.9385, 0, ''),
    (@DAPHNE, 4, -11461, 1526.61, 50.9385, 5000, 'pick up rifle'),
    (@DAPHNE, 5, -11463, 1525.24, 50.9385, 0, ''),
    (@DAPHNE, 6, -11465.2, 1528.34, 50.9544, 0, ''),
    (@DAPHNE, 7, -11468.4, 1535.08, 50.4009, 15000, 'hold, prepare for wave1'),
    (@DAPHNE, 8, -11468.4, 1535.08, 50.4009, 15000, 'hold, prepare for wave2'),
    (@DAPHNE, 9, -11468.4, 1535.08, 50.4009, 10000, 'hold, prepare for wave3'),
    (@DAPHNE, 10, -11467.9, 1532.46, 50.3489, 0, 'we are done'),
    (@DAPHNE, 11, -11466.1, 1529.86, 50.2094, 0, ''),
    (@DAPHNE, 12, -11463, 1525.24, 50.9385, 0, ''),
    (@DAPHNE, 13, -11461, 1526.61, 50.9385, 5000, 'deliver rifle'),
    (@DAPHNE, 14, -11463, 1525.24, 50.9385, 0, ''),
    (@DAPHNE, 15, -11465.2, 1528.34, 50.9544, 0, ''),
    (@DAPHNE, 16, -11470.3, 1537.28, 50.3785, 0, ''),
    (@DAPHNE, 17, -11475.6, 1548.68, 50.1844, 0, 'complete quest'),
    (@DAPHNE, 18, -11482.3, 1557.41, 48.6245, 0, '');



-- It's a Fel Reaver, But with Heart - [A][H] http://www.wowhead.com/quest=10309/its-a-fel-reaver-but-with-heart

SET @FEL := 20243; -- Scrapped Fel Reaver
SET @Zaxxis := 20287; -- Zaxxis Ambusher

DELETE FROM `creature_text` WHERE `entry` = @FEL;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(@FEL,0,0,"The %s's mechanical heart begins to beat softly.",16,0,100,0,0,0,18271,0,"Scrapped Fel Reaver - Zapped Emote");

DELETE FROM `smart_scripts` WHERE `entryorguid` = @FEL AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@FEL,0, 0,1,  8, 0,100,0, 35282,     0,     0,     0, 19,    256,    0,      0, 0,0,0, 1,      0, 0,   0,       0,       0,      0,    0, "Scrapped Fel Reaver - On Spellhit 'Fel Zapper' - Remove Flags Immune To Players"),
(@FEL,0, 1,2, 61, 0,100,0,     0,     0,     0,     0,  1,      0, 1000,      0, 0,0,0, 1,      0, 0,   0,       0,       0,      0,    0, "Scrapped Fel Reaver - On Spellhit 'Fel Zapper' - Say Line 0"),
(@FEL,0, 2,0, 61, 0,100,0,     0,     0,     0,     0, 18, 131076,    0,      0, 0,0,0, 1,      0, 0,   0,       0,       0,      0,    0, "Scrapped Fel Reaver - On Spellhit 'Fel Zapper' - Set Flags Disable Movement & Pacified"),
(@FEL,0, 3,0,  0, 0,100,0,  2000,  2000, 30000, 30000, 12,@Zaxxis,    2, 180000, 1,0,0, 8,      0, 0,   0, 2547.08, 3982.24, 131.39, 2.01, "Scrapped Fel Reaver - In Combat - Summon Creature 'Zaxxis Ambusher'"),
(@FEL,0, 4,0,  0, 0,100,0, 17000, 17000, 45000, 45000, 12,@Zaxxis,    2, 180000, 1,0,0, 8,      0, 0,   0, 2537.70, 3975.96, 130.40, 1.58, "Scrapped Fel Reaver - In Combat - Summon Creature 'Zaxxis Ambusher'"),
(@FEL,0, 5,0,  0, 0,100,0, 32000, 32000, 45000, 45000, 12,@Zaxxis,    2, 180000, 1,0,0, 8,      0, 0,   0, 2506.46, 4008.93, 133.80, 6.19, "Scrapped Fel Reaver - In Combat - Summon Creature 'Zaxxis Ambusher'"),
(@FEL,0, 6,0,  0, 0,100,0, 60000, 60000, 45000, 45000, 12,@Zaxxis,    2, 180000, 1,0,0, 8,      0, 0,   0, 2537.30, 4027.11, 135.50, 4.30, "Scrapped Fel Reaver - In Combat - Summon Creature 'Zaxxis Ambusher'"),
(@FEL,0, 7,0,  6, 0,100,0,     0,     0,     0,     0, 51,      0,    0,      0, 0,0,0, 9,@Zaxxis, 0, 150,       0,       0,      0,    0, "Scrapped Fel Reaver - On Just Died - Kill Target"),
(@FEL,0, 8,0,  7, 0,100,0,     0,     0,     0,     0, 51,      0,    0,      0, 0,0,0, 9,@Zaxxis, 0, 150,       0,       0,      0,    0, "Scrapped Fel Reaver - On Evade - Kill Target"),
(@FEL,0, 9,0, 11, 0,100,0,     0,     0,     0,     0, 75,  39311,    0,      0, 0,0,0, 1,      0, 0,   0,       0,       0,      0,    0, "Scrapped Fel Reaver - On Respawn - Add Aura 'Scrapped Fel Reaver Transform'");

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = @Zaxxis;

DELETE FROM `smart_scripts` WHERE `entryorguid` = @Zaxxis AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@Zaxxis,0, 0,0, 54, 0,100,0, 0,0,0,0, 49, 0,0,0,0,0,0, 21, 85, 0,0,0,0,0,0, 'Zaxxis Ambusher - On Just Summoned - Start Attacking');



-- Gnogaine - [A] http://www.wowhead.com/quest=2926/gnogaine

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=11513;
INSERT INTO conditions VALUES (17, 0, 11513, 0, 0, 29, 0, 6213, 6, 0, 0, 0, 0, '', 'Must be near NPC to cast');
INSERT INTO conditions VALUES (17, 0, 11513, 0, 1, 29, 0, 6329, 6, 0, 0, 0, 0, '', 'Must be near NPC to cast');


-- The Only Cure is More Green Glow - [A] http://www.wowhead.com/quest=2962/the-only-cure-is-more-green-glow

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=12709;
INSERT INTO conditions VALUES (17, 0, 12709, 0, 0, 29, 0, 6218, 5, 0, 0, 0, 0, '', 'Must be near NPC to cast');
INSERT INTO conditions VALUES (17, 0, 12709, 0, 1, 29, 0, 6220, 5, 0, 0, 0, 0, '', 'Must be near NPC to cast');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=11637;
INSERT INTO conditions VALUES (13, 1, 11637, 0, 0, 31, 0, 3, 6218, 0, 0, 0, 0, '', 'Requires Entry');
INSERT INTO conditions VALUES (13, 1, 11637, 0, 1, 31, 0, 3, 6220, 0, 0, 0, 0, '', 'Requires Entry');



-- Corrupted Rager
DELETE FROM `creature_loot_template` WHERE `Entry`=21223 AND `item`=37705;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(21223, 37705, 0, 19, 0, 1, 0, 2, 4, NULL);



UPDATE creature_template ct1
INNER JOIN creature_template ct2 ON ct2.difficulty_entry_1 = ct1.entry AND ct2.skinloot > 0 AND ct2.difficulty_entry_1 > 0
SET ct1.skinloot = ct2.skinloot;


-- spell_dragonblight_ice_cannon
DELETE FROM `spell_script_names` WHERE `spell_id` = 49316;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(49316, 'spell_dragonblight_ice_cannon');


-- Inquisitor Hallard SAI
SET @ENTRY := 27316;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,2,0,64,0,100,0,0,0,0,0,54,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Inquisitor Hallard - On Gossip Hello - Pause Waypoint");



-- Ally of the Netherwing - [A][H] http://www.wowhead.com/quest=10870/ally-of-the-netherwing

UPDATE quest_template SET RewardChoiceItemID1=31492, RewardChoiceItemQuantity1=1, RewardChoiceItemID2=31491, RewardChoiceItemQuantity2=1, RewardChoiceItemID3=31490, RewardChoiceItemQuantity3=1, RewardChoiceItemID4=31494, RewardChoiceItemQuantity4=1, RewardChoiceItemID5=31493, RewardChoiceItemQuantity5=1 WHERE ID=10870;

-- The Jig is Up - [A][H] http://www.wowhead.com/quest=11471/the-jig-is-up

SET @STERLING := 24742;
DELETE FROM smart_scripts WHERE entryorguid=@STERLING AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (@STERLING, 0, 0, 0, 0, 0, 100, 0, 0, 15000, 15000, 30000, 11, 50188, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - IC - Cast Wildly Flailing'),    
    (@STERLING, 0, 1, 2, 2, 0, 100, 1, 0, 25, 0, 0, 18, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On 25% Hp - Set Flag Inmune To PC and Pacified'),
    (@STERLING, 0, 2, 3, 61, 0, 100, 1, 0, 25, 0, 0, 19, 524288, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On 25% Hp  - Remove Flag In Combat'),
    (@STERLING, 0, 3, 4, 61, 0, 100, 1, 0, 25, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On 25% Hp - Say Line 1'),
    (@STERLING, 0, 4, 5, 61, 0, 100, 1, 0, 25, 0, 0, 102, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On 25% Hp - Set HP Regen off'),
    (@STERLING, 0, 5, 0, 61, 0, 100, 1, 0, 25, 0, 0, 53, 1, @STERLING, 0, 0, 180000, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On 25% Hp - Start WP'),
    (@STERLING, 0, 6, 7, 40, 0, 100, 0, 1, @STERLING, 0, 0, 97, 20, 20, 0, 0, 0, 0, 1, 0, 0, 0, -39.0669, -3420.677, -14.4579, 0, '\"Mad\" Jonah Sterling - On Reached WP1 - Jump to Hozzer'),
    (@STERLING, 0, 7, 0, 61, 0, 100, 0, 1, @STERLING, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 24547, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On Reached WP1 - Set Data 1 1'),
    (@STERLING, 0, 8, 0, 40, 0, 100, 0, 2, @STERLING, 0, 0, 103, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On Reached WP2 - Set Root'),
    (@STERLING, 0, 9, 10, 38, 0, 100, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On Data Set 1 1 - Say Line 2'),
    (@STERLING, 0, 10, 0, 61, 0, 100, 0, 1, 1, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On Data Set 1 1 - Despawn Instant'),
    (@STERLING, 0, 11, 12, 11, 0, 100, 0, 0, 0, 0, 0, 19, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On Respawn - Remove Flag Inmune To PC and Pacified'),
    (@STERLING, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 103, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Mad\" Jonah Sterling - On Respawn - Remove Flag Inmune To PC and Pacified');

DELETE FROM smart_scripts WHERE entryorguid=2474200 AND source_type=9;

SET @HOZZER := 24547;
UPDATE creature SET position_x=-66.8634, position_y=-3402.8393, position_z=-4.1482, orientation=0.5056 WHERE guid=117725 AND id=@HOZZER;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@HOZZER;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@HOZZER AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
    (@HOZZER,0,0,0,38,0,100,0,1,1,0,0,53,1,24547,0,0,180000,2,1,0,0,0,0,0,0,0,"Hozzer - On Data Set 1 1 - Start Waypoint"),
    (@HOZZER,0,1,2,40,0,100,0,2,24547,0,0,11,44458,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hozzer - On Waypoint 2 Reached - Cast 'Hozzer Feeds'"),
    (@HOZZER,0,2,3,61,0,100,0,2,24547,0,0,45,1,1,0,0,0,0,19,@STERLING,0,0,0,0,0,0,"Hozzer - On Waypoint 2 Reached - Set Data 1 1"),
    (@HOZZER,0,3,0,61,0,100,0,2,24547,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Hozzer - On Waypoint 2 Reached - Say Line 1");

DELETE FROM waypoints WHERE entry=24547;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
    (@HOZZER, 1, -29.2858, -3393.9516, -14.3585, 'Hozzer'),
    (@HOZZER, 2, -36.4373, -3417.6162, -14.7240, 'Hozzer');

DELETE FROM waypoints WHERE entry=@STERLING;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
    (@STERLING, 1, -35.703812, -3425.64, 5.2230, '\"Mad\" Jonah Sterling'),
    (@STERLING, 2, -39.0669, -3420.677, -14.4579, '\"Mad\" Jonah Sterling');




-- To Venomspite! - [H] http://www.wowhead.com/quest=12182/to-venomspite


DELETE FROM smart_scripts WHERE entryorguid=24155 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (24155, 0, 0, 1, 4, 0, 100, 0, 0, 0, 0, 0, 12, 9521, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tobias Sarkhoff - On Aggro - Summon Creature \'Enraged Felbat\''),
    (24155, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 12, 9521, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tobias Sarkhoff - On Aggro - Summon Creature \'Enraged Felbat\''),
    (24155, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tobias Sarkhoff - On Aggro - Say Line 0'),
    (24155, 0, 3, 0, 19, 0, 100, 0, 12182, 0, 0, 0, 52, 837, 0, 0, 0, 0, 0, 21, 30, 0, 0, 0, 0, 0, 0, 'Tobias Sarkhoff - On Quest Accepted - Activate Taxi');



-- Mantles of the Dawn - [A][H]
-- http://www.wowhead.com/quest=5504/mantles-of-the-dawn
-- http://www.wowhead.com/quest=5524/mantles-of-the-dawn
-- http://www.wowhead.com/quest=5513/mantles-of-the-dawn
-- Chromatic Mantle of the Dawn - [A][H]
-- http://www.wowhead.com/quest=5517/chromatic-mantle-of-the-dawn
-- http://www.wowhead.com/quest=5521/chromatic-mantle-of-the-dawn
-- http://www.wowhead.com/quest=5524/chromatic-mantle-of-the-dawn

UPDATE quest_template_addon SET SpecialFlags=0 WHERE ID IN(5524, 5521, 5517);

DELETE FROM conditions WHERE SourceTypeOrReferenceId=23 AND SourceGroup=10856 AND SourceEntry IN(18169, 18170, 18171, 18172, 18173, 18182);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (23, 10856, 18169, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5504 quest is rewarded OR'),
    (23, 10856, 18169, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5507 quest is rewarded OR'),
    (23, 10856, 18169, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5513 quest is rewarded'),
    (23, 10856, 18170, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5504 quest is rewarded OR'),
    (23, 10856, 18170, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5507 quest is rewarded OR'),
    (23, 10856, 18170, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5513 quest is rewarded'),
    (23, 10856, 18171, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5504 quest is rewarded OR'),
    (23, 10856, 18171, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5507 quest is rewarded OR'),
    (23, 10856, 18171, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5513 quest is rewarded'),
    (23, 10856, 18172, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5504 quest is rewarded OR'),
    (23, 10856, 18172, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5507 quest is rewarded OR'),
    (23, 10856, 18172, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5513 quest is rewarded'),
    (23, 10856, 18173, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5504 quest is rewarded OR'),
    (23, 10856, 18173, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5507 quest is rewarded OR'),
    (23, 10856, 18173, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5513 quest is rewarded'),
    (23, 10856, 18182, 0, 0, 8, 0, 5524, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5524 quest is rewarded OR'),
    (23, 10856, 18182, 0, 1, 8, 0, 5521, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5521 quest is rewarded OR'),
    (23, 10856, 18182, 0, 2, 8, 0, 5517, 0, 0, 0, 0, 0, '', 'Hasana - Only sell item if 5517 quest is rewarded');