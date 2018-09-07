-- ------------------------
-- Boss
-- ------------------------
DELETE FROM `creature` WHERE `id` = 36296;
INSERT INTO `creature` VALUES (244573, 36296, 33, 0 , 0, 1, 1, 0, 0, -208.723, 2218.5, 79.7633, 5.16886, 86400, 0, 0, 269000, 0, 0, 0, 0, 0, 0 );

DELETE FROM spell_linked_spell WHERE spell_trigger=68529;
INSERT INTO spell_linked_spell VALUES(68529, -68530, 0, "Perfume Immune - Cologne remove");
DELETE FROM spell_linked_spell WHERE spell_trigger=68530;
INSERT INTO spell_linked_spell VALUES(68530, -68529, 0, "Cologne Immune - Perfume remove");
UPDATE creature_template SET ScriptName="npc_love_in_air_hummel" WHERE entry=36296;
UPDATE creature_template SET ScriptName="npc_love_in_air_hummel_helper" WHERE entry IN(36565, 36272);
DELETE FROM spell_script_names WHERE spell_id IN(68529, 68530);
INSERT INTO spell_script_names VALUES(68529, "spell_love_in_air_perfume_immune");
INSERT INTO spell_script_names VALUES(68530, "spell_love_in_air_perfume_immune");
REPLACE INTO creature_template_addon VALUES(36296, 0, 0, 0, 1, 0, "68589"); -- hummel
REPLACE INTO creature_template_addon VALUES(36565, 0, 0, 0, 1, 0, "68946"); -- baster
DELETE FROM spell_script_names WHERE spell_id IN(68614, 68798);
INSERT INTO spell_script_names VALUES(68614, "spell_love_in_air_periodic_perfumes");
INSERT INTO spell_script_names VALUES(68798, "spell_love_in_air_periodic_perfumes");


DELETE FROM `creature_text` WHERE `entry`=36296;
INSERT INTO `creature_text` VALUES (36296, 0, 0, 'Did they bother to tell you who I am and why I am doing this?', 12, 0, 100, 1, 0, 0, 0, 0, 'Apothecary Hummel - SAY 0');
INSERT INTO `creature_text` VALUES (36296, 1, 0, '...or are they just using you like they do everybody else?', 12, 0, 100, 1, 0, 0, 0, 0, 'Apothecary Hummel - SAY 1');
INSERT INTO `creature_text` VALUES (36296, 2, 0, 'But what does it matter. It is time for this to end.', 12, 0, 100, 1, 0, 0, 0, 0, 'Apothecary Hummel - SAY 2');
INSERT INTO `creature_text` VALUES (36296, 3, 0, '...please don\'t think less of me.', 12, 0, 100, 1, 0, 0, 0, 0, 'Apothecary Hummel - Death');
INSERT INTO `creature_text` VALUES (36296, 4, 0, 'Baxter! Get in here and help! NOW!', 12, 0, 100, 1, 0, 0, 0, 0, 'Apothecary Hummel - Baxxter');
INSERT INTO `creature_text` VALUES (36296, 5, 0, 'It is time, Frye! Attack!', 12, 0, 100, 1, 0, 0, 0, 0, 'Apothecary Hummel - Frye');
INSERT INTO `creature_text` VALUES (36296, 6, 0, 'Apothecaries! Give your life for the Crown!', 12, 0, 100, 1, 0, 0, 0, 0, 'Apothecary Hummel - Frye');

DELETE FROM `creature_text` WHERE `entry`=36272;
INSERT INTO `creature_text` VALUES (36272, 0, 0, 'It has been the greatest honor of my life to serve with you, Hummel.', 12, 0, 100, 1, 0, 0, 0, 0, 'Apothecary Frye - DEATH');

DELETE FROM `creature_text` WHERE `entry`=36565;
INSERT INTO `creature_text` VALUES (36565, 0, 0, 'It has been the greatest honor of my life to serve with you, Hummel.', 12, 0, 100, 1, 0, 0, 0, 0, 'Apothecary Baxxter - DEATH');


-- Conditions for Emblems of Frost inside the Heart-Shaped Box.
DELETE FROM `item_loot_template` WHERE `entry`=54537;
INSERT INTO `item_loot_template` VALUES (54537, 49426, 0, 100, 0, 1, 0, 2, 2, NULL);
INSERT INTO `item_loot_template` VALUES (54537, 49927, 0, 100, 0, 1, 0, 5, 10, NULL);
INSERT INTO `item_loot_template` VALUES (54537, 50250, 0, 3, 0, 1, 0, 1, 1, NULL);
INSERT INTO `item_loot_template` VALUES (54537, 1, 50010, 100, 0, 1, 0, 1, 1, NULL);


DELETE FROM `conditions` WHERE `sourcegroup`=50010;
INSERT INTO `conditions` VALUES (10, 50010, 51804, 0, 0, 17, 0, 577, 0, 0, 0, 0, 0, '', 'Reference that contains the necks on Apothecary Hummel will now drop from Heart-Shaped Box only if player has the Naxxramas 25 achievement.');
INSERT INTO `conditions` VALUES (10, 50010, 51805, 0, 0, 17, 0, 577, 0, 0, 0, 0, 0, '', 'Reference that contains the necks on Apothecary Hummel will now drop from Heart-Shaped Box only if player has the Naxxramas 25 achievement.');
INSERT INTO `conditions` VALUES (10, 50010, 51806, 0, 0, 17, 0, 577, 0, 0, 0, 0, 0, '', 'Reference that contains the necks on Apothecary Hummel will now drop from Heart-Shaped Box only if player has the Naxxramas 25 achievement.');
INSERT INTO `conditions` VALUES (10, 50010, 51807, 0, 0, 17, 0, 577, 0, 0, 0, 0, 0, '', 'Reference that contains the necks on Apothecary Hummel will now drop from Heart-Shaped Box only if player has the Naxxramas 25 achievement.');
INSERT INTO `conditions` VALUES (10, 50010, 51808, 0, 0, 17, 0, 577, 0, 0, 0, 0, 0, '', 'Reference that contains the necks on Apothecary Hummel will now drop from Heart-Shaped Box only if player has the Naxxramas 25 achievement.');

DELETE FROM `conditions` WHERE `sourcegroup`=54537 AND `sourceentry`=49426;
INSERT INTO `conditions` VALUES (5, 54537, 49426, 0, 0, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Emblems of Frost will only drop from the Heart-Shaped Box if players have at least Trial of the Crusader 10 players.');
INSERT INTO `conditions` VALUES (5, 54537, 49426, 0, 1, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Emblems of Frost will only drop from the Heart-Shaped Box if players have at least Trial of the Crusader 25 players.');
