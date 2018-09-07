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
