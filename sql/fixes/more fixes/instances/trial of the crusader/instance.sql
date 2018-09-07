DELETE FROM access_requirement where mapid=649;
INSERT INTO `access_requirement` VALUES (649, 0, 80, 0, 0, 0, 0, 0, 0, 2894, 'You must complete The Secrets of Ulduar (10 players) first.', 'Trial of the Crusader - Ulduar 10 achievement.');
INSERT INTO `access_requirement` VALUES (649, 2, 80, 0, 0, 0, 0, 0, 0, 2894, 'You must complete The Secrets of Ulduar (10 players) first.', 'Trial of the Crusader - Ulduar 10 achievement.');

INSERT INTO `access_requirement` VALUES (649, 1, 80, 0, 0, 0, 0, 0, 0, 2895, 'You must complete The Secrets of Ulduar (25 players) first.', 'Trial of the Crusader - Ulduar 25 achievement.');
INSERT INTO `access_requirement` VALUES (649, 3, 80, 0, 0, 0, 0, 0, 0, 2895, 'You must complete The Secrets of Ulduar (25 players) first.', 'Trial of the Crusader - Ulduar 25 achievement.');


-- DELETE FROM disables WHERE sourcetype=2 and entry=649;


DELETE FROM npc_text WHERE id BETWEEN 724001 and 724006;
INSERT INTO `npc_text` VALUES (724001, 'Welcome, champion! Have you gathered your forces in preparation for the challenges of the Trials of the Crusader?$b$bAre you ready for the first challenge, then?', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_text` VALUES (724002, 'Well done! Your fighting against all those beasts was splendid! I hear the next challenge should be even tougher!$b$bYou\'ll find out soon enough. Are you ready for the next challenge?', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_text` VALUES (724003, 'That warlock certainly didn\'t summon a Doomguard! Your next challenge will find you fighting knights of the Argent Crusade. Think you\'re up for the challenge?$b$bWell then, I\'ll give the signal to Tirion when you are ready to go.\r\n', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_text` VALUES (724004, 'We suffered a lot of casualties when capturing your next challenge!$b$bYou better believe it! You\'re going to face two of Arthas\' most powerful Vl\'kyr lieutenants!\r\n', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `npc_text` VALUES (724005, 'Splendid, you\'ve proven yourselves as great champions here today. With you fighting alongside the Argent Crusade, victory against the Scourge is Inevitable!$b$bThe praise is well deserved, Tirion will want to praise you himself, shortly. Hey, have you noticed it getting a bit cold all of a sudden?', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);










-- Delete the Emblem of Triumphs
DELETE char_inv FROM character_inventory char_inv
JOIN item_instance item_inst ON item_inst.guid=char_inv.item
WHERE item_inst.itemEntry=47241;

DELETE FROM item_instance WHERE itemEntry=47241;




-- Loot, add an extra item for 25 and 25 HC.

/* Northrend Beasts 25 Normal */
UPDATE creature_loot_template SET MaxCount=3 WHERE entry=35447 AND Reference=34320; 
UPDATE creature_loot_template SET MaxCount=3 WHERE entry=35447 AND Reference=34327;

/* Northrend Beasts 25 HC */
UPDATE creature_loot_template SET MaxCount=3 WHERE entry=35449 AND Reference=34334;
UPDATE creature_loot_template SET MaxCount=3 WHERE entry=35449 AND Reference=34341;


/* Lord Jaraxxus 25 Normal */
UPDATE creature_loot_template SET MaxCount=3 WHERE entry=35216 AND Reference=34321;
UPDATE creature_loot_template SET MaxCount=3 WHERE entry=35216 AND Reference=34328;

/* Lord Jaraxxus 25 HC */
UPDATE creature_loot_template SET MaxCount=3 WHERE entry=35269 AND Reference=34335;
UPDATE creature_loot_template SET MaxCount=3 WHERE entry=35269 AND Reference=34342;


/* Grand Champions - Crusaders Cache 25 Normal */
UPDATE gameobject_loot_template SET MaxCount=3 WHERE entry=27503 AND Reference=34325;
UPDATE gameobject_loot_template SET MaxCount=3 WHERE entry=27503 AND Reference=34332;

/* Grand Champions - Crusaders Cache 25 HC */
UPDATE gameobject_loot_template SET MaxCount=3 WHERE entry=27356 AND Reference=34339;
UPDATE gameobject_loot_template SET MaxCount=3 WHERE entry=27356 AND Reference=34346;


/* Anub'Arak 25 Normal */
UPDATE creature_loot_template SET MaxCount=4 WHERE entry=34566 AND Reference=34324;
UPDATE creature_loot_template SET MaxCount=4 WHERE entry=34566 AND Reference=34331;

/* Anub'Arak 25 Normal */
UPDATE creature_loot_template SET MaxCount=4 WHERE entry=35616 AND Reference=34338;
UPDATE creature_loot_template SET MaxCount=4 WHERE entry=35616 AND Reference=34345;
