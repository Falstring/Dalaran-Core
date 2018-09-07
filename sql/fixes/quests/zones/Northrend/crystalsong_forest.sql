-- -------------------------------------------
-- CRYSTALSONG FOREST
-- -------------------------------------------


-- Preparations for War - [A] http://www.wowhead.com/quest=13418/preparations-for-war - [H] http://www.wowhead.com/quest=13419/preparations-for-war

UPDATE creature_template SET speed_run=3, npcflag=16777216, minlevel=79, maxlevel=79, InhabitType=4, AIName='', ScriptName='npc_preparations_for_war_vehicle' WHERE entry IN (30585, 30470);
UPDATE creature_template SET AIName='SmartAI' WHERE entry IN (31085, 31081);
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (30585, 30470);
INSERT INTO npc_spellclick_spells VALUES (30585, 46598, 1, 0);
INSERT INTO npc_spellclick_spells VALUES (30470, 46598, 1, 0);
DELETE FROM gossip_menu_option WHERE menu_id IN (10026, 10025);

INSERT INTO gossip_menu_option VALUES (10026, 1, 0, 'Take me to the ship.', 0, 1, 1, 0, 0, 0, 0, '', 0);
INSERT INTO gossip_menu_option VALUES (10026, 0, 0, 'Take me to the ship.', 0, 1, 1, 0, 0, 0, 0, '', 0);
INSERT INTO gossip_menu_option VALUES (10025, 1, 0, 'Take me to the ship.', 0, 1, 1, 0, 0, 0, 0, '', 0);
INSERT INTO gossip_menu_option VALUES (10025, 0, 0, 'Take me to the ship.', 0, 1, 1, 0, 0, 0, 0, '', 0);

DELETE FROM creature_template_addon WHERE entry=30585;
INSERT INTO creature_template_addon VALUES (30585, 0, 0, 33554432, 0, 0, '55971');
DELETE FROM creature_template_addon WHERE entry=30470;
INSERT INTO creature_template_addon VALUES (30470, 0, 0, 33554432, 0, 0, '55971');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup IN (10026, 10025);
INSERT INTO conditions VALUES (15, 10025, 0, 0, 0, 8, 0, 13418, 0, 0, 0, 0, 0, '', 'Officer Van Rossem - Show gossip option only if quest Preparations for War is finished');
INSERT INTO conditions VALUES (15, 10025, 1, 0, 0, 28, 0, 13418, 0, 0, 0, 0, 0, '', 'Officer Van Rossem - Show gossip option only if player has taken quest Preparations for War');
INSERT INTO conditions VALUES (15, 10026, 0, 0, 0, 8, 0, 13419, 0, 0, 0, 0, 0, '', 'Sky-Reaver Klum - Show gossip option only if quest Preparations for War is finished');
INSERT INTO conditions VALUES (15, 10026, 1, 0, 0, 28, 0, 13419, 0, 0, 0, 0, 0, '', 'Sky-Reaver Klum - Show gossip option only if player has taken quest Preparations for War');

DELETE FROM smart_scripts WHERE entryorguid IN(31085, 31081) AND source_type=0;
INSERT INTO smart_scripts VALUES (31085, 0, 0, 2, 62, 0, 100, 0, 10026, 0, 0, 0, 11, 58352, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sky-Reaver Klum - On Gossip Select - Cast Flight - To Icecrown Airship (H) - Force Cast - Summon Vehicle');
INSERT INTO smart_scripts VALUES (31085, 0, 1, 2, 62, 0, 100, 0, 10026, 1, 0, 0, 11, 58352, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sky-Reaver Klum - On Gossip Select - Cast Flight - To Icecrown Airship (H) - Force Cast - Summon Vehicle');
INSERT INTO smart_scripts VALUES (31085, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sky-Reaver Klum - On Gossip Select - Close Gossip');
INSERT INTO smart_scripts VALUES (31081, 0, 0, 2, 62, 0, 100, 0, 10025, 0, 0, 0, 11, 58349, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Officer Van Rossem - On Gossip Select - Cast Flight - To Icecrown Airship (A) - Force Cast - Summon Vehicle');
INSERT INTO smart_scripts VALUES (31081, 0, 1, 2, 62, 0, 100, 0, 10025, 1, 0, 0, 11, 58349, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Officer Van Rossem - On Gossip Select - Cast Flight - To Icecrown Airship (A) - Force Cast - Summon Vehicle');
INSERT INTO smart_scripts VALUES (31081, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Officer Van Rossem - On Gossip Select - Close Gossip');

DELETE FROM waypoints WHERE entry IN(30585, 30470);
INSERT INTO waypoints
VALUES
    (30585, 1, 5818.54, 483.97, 660, 'ship'),
    (30585, 2, 5835.361, 490.0929, 669.2502, 'ship'),
    (30585, 3, 5845.597, 505.7655, 677.8998, 'ship'),
    (30585, 4, 5865.832, 544.756, 689.6674, 'ship'),
    (30585, 5, 5897.429, 586.1177, 689.6674, 'ship'),
    (30585, 6, 5936.385, 642.625, 682.4179, 'ship'),
    (30585, 7, 5954.68, 688.5653, 678.1407, 'ship'), 
    (30585, 8, 5987.017, 725.1281, 673.5298, 'ship'),
    (30585, 9, 6055.089, 766.5753, 663.0575, 'ship'),
    (30585, 10, 6077.21, 796.1387, 663.0575, 'ship'),
    (30585, 11, 6089.871, 824.1841, 663.0575, 'ship'),
    (30585, 12, 6133.36, 911.2333, 642.3085, 'ship'),
    (30585, 13, 6187.39, 959.5966, 625.03, 'ship'),
    (30585, 14, 6346.116, 1060.051, 631.3358, 'ship'),
    (30585, 15, 6466.611, 1107.176, 644.8912, 'ship'),
    (30585, 16, 6626.671, 1136.814, 649.6691, 'ship'),
    (30585, 17, 6733.844, 1153.338, 658.0303, 'ship');

INSERT INTO waypoints 
VALUES 
    (30470, 1, 5818.54, 483.97, 660, 'ship'),
    (30470, 2, 5808.515, 501.6592, 682.5045, 'ship'),
    (30470, 3, 5791.556, 542.5968, 705.0191, 'ship'),
    (30470, 4, 5805.223, 614.855, 711.2216, 'ship'),
    (30470, 5, 5915.215, 665.7966, 702.0617, 'ship'),
    (30470, 6, 5954.68, 688.5653, 678.1407, 'ship'),
    (30470, 7, 5987.017, 725.1281, 673.5298, 'ship'), 
    (30470, 8, 6055.089, 766.5753, 663.0575, 'ship'),
    (30470, 9, 6077.21, 796.1387, 663.0575, 'ship'),
    (30470, 10, 6089.871, 824.1841, 663.0575, 'ship'),
    (30470, 11, 6133.36, 911.2333, 642.3085, 'ship'),
    (30470, 12, 6187.39, 959.5966, 625.03, 'ship'),
    (30470, 13, 6346.116, 1060.051, 631.3358, 'ship'),
    (30470, 14, 6466.611, 1107.176, 644.8912, 'ship'),
    (30470, 15, 6626.671, 1136.814, 649.6691, 'ship'),
    (30470, 16, 6733.844, 1153.338, 658.0303, 'ship');

