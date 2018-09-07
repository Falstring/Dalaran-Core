UPDATE gameobject_template SET ScriptName = 'go_transport_waypoint_reporter' WHERE entry IN (164871, 175080, 176495);

UPDATE creature_template SET ScriptName = 'npc_frezza' WHERE entry = 9564;
UPDATE creature_template SET ScriptName = 'npc_zapetta' WHERE entry = 9566;
UPDATE creature_template SET ScriptName = 'npc_nez_raz' WHERE entry = 3149;
UPDATE creature_template SET ScriptName = 'npc_snurk_bucksquick' WHERE entry = 12136;
UPDATE creature_template SET ScriptName = 'npc_hin_denburg' WHERE entry = 3150;
UPDATE creature_template SET ScriptName = 'npc_squibby_overspeck' WHERE entry = 12137;

UPDATE creature_template SET ScriptName = 'npc_krixx' WHERE entry = 23635;
UPDATE creature_template SET ScriptName = 'npc_kraxx' WHERE entry = 23713;

DELETE FROM gossip_menu_option WHERE menu_id IN (8786);

INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, OptionBroadcastTextID, option_id, npc_option_npcflag, action_menu_id, action_poi_id) VALUES
(8786, 0, 0, 'Where is the zeppelin to Orgrimmar right now?', 0, 1, 1, 0, 0),
(8786, 1, 0, 'Where is the zeppelin to Grom\'Gol right now?', 0, 1, 1, 0, 0);

UPDATE gameobject_template SET ScriptName = 'zeppelin_the_thundercaller' WHERE entry = 164871;
UPDATE gameobject_template SET ScriptName = 'zeppelin_the_iron_eagle' WHERE entry = 175080;
UPDATE gameobject_template SET ScriptName = 'zeppelin_the_purple_princess' WHERE entry = 176495;
UPDATE gameobject_template SET ScriptName = 'zeppelin_the_mighty_wind' WHERE entry = 186238;
UPDATE gameobject_template SET ScriptName = 'zeppelin_the_cloudkisser' WHERE entry = 181689;
UPDATE gameobject_template SET ScriptName = 'zeppelin_the_zephyr' WHERE entry = 190549;

DELETE FROM creature_text WHERE entry IN (9566, 3150, 26539, 26538, 26540);

INSERT INTO creature_text (entry, groupid, TEXT, TYPE, probability, COMMENT, BroadcastTextID) VALUES
(9566, 0, 'The zeppelin to Orgrimmar has just arrived! All aboard for Durotar!', 14, 100, 'Zapetta - Zeppelin Arrival', 22077),
(9566, 1, 'There goes the zeppelin to Orgrimmar. I hope there\'s no explosions this time.', 12, 100, 'Zapetta - Zeppelin Departure', 22080),
(3150, 0, 'The zeppelin to Grom\'gol has just arrived! All aboard for Stranglethorn!', 14, 100, 'Hin Denburg - Zeppelin Arrival', 22097),
(3150, 1, 'Hey! Did I remember to refill the tank before the zeppelin left? Oh, well!', 12, 100, 'Hin Denburg - Zeppelin Departure', 22076),
(26539, 0, 'The zeppelin to Vengeance Landing has just arrived! All aboard for Howling Fjord!', 14, 100, 'Meefi Farthrottle - Zeppelin Arrival', 29540),
(26538, 0, 'The zeppelin to Orgrimmar has just arrived! All aboard for Durotar!', 14, 100, 'Nargo Screwbore - Zeppelin Arrival', 29551),
(26540, 0, 'The zeppelin to Undercity has just arrived! All aboard for Tirisfal Glades!', 14, 100, 'Drenk Spannerspark - Zeppelin Arrival', 29545);

DELETE FROM locales_creature_text WHERE entry IN (9566, 3150, 26539, 26538, 26540);

INSERT INTO locales_creature_text (entry, groupid, TEXT_loc3) VALUES
(9566, 0, 'Der Zeppelin nach Orgrimmar ist soeben eingetroffen! Wer nach Durotar will, sollte an Bord gehen!'),
(9566, 1, 'Da geht er hin, der Zeppelin nach Orgrimmar. Hoffentlich kommt es nicht wieder zu einer Explosion.'),
(3150, 0, 'Der Zeppelin nach Grom\'gol ist soeben eingetroffen! Wer in das Schlingendorntal will, sollte an Bord gehen!'),
(3150, 1, 'Hey! Hab ich den Zeppelin vor seiner Abreise Ã¼berhaupt vollgetankt? Ach, was soll\'s!'),
(26539, 0, 'Der Zeppelin zum Hafen der Vergeltung ist soeben angekommen! Wer in den Heulenden Fjord will, sollte an Bord gehen!'),
(26538, 0, 'Der Zeppelin nach Orgrimmar ist soeben angekommen! Wer nach Durotar mÃ¶chte, sollte an Bord gehen!'),
(26540, 0, 'Der Zeppelin nach Unterstadt ist soeben angekommen! Wer nach Tirisfal mÃ¶chte, sollte an Bord gehen!');