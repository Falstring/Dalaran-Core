/*DELETE FROM disables WHERE sourceType=2 AND entry IN(632);
REPLACE INTO `access_requirement` VALUES (632, 0, 75, 0, 180, 0, 0, 0, 0, 0, NULL, 'Forge of Souls (Entrance)');
REPLACE INTO `access_requirement` VALUES (632, 1, 80, 0, 200, 0, 0, 0, 0, 0, NULL, 'Forge of Souls (Entrance)');

-- Inside the Frozen Citadel (A, H)
UPDATE quest_template SET PrevQuestId=0, NextQuestIdChain=24499 WHERE Id=24510;
UPDATE quest_template SET PrevQuestId=0, NextQuestIdChain=24511 WHERE Id=24506;
UPDATE quest_template SET OfferRewardText='$N! I''m so glad you''ve come.$B$BWe''ve been afforded a rare chance to delve into Icecrown Citadel, but we must move quickly if we''re to avoid Arthas'' notice.' WHERE Id=24510;
UPDATE quest_template SET OfferRewardText='Good. $N, I know of you. You''ll be perfect for these tasks.$B$BWe''ve been afforded a rare chance to delve into Icecrown Citadel, but we must move quickly if we''re to avoid Arthas'' notice.' WHERE Id=24506;
-- Echoes of Tortured Souls (A, H)
UPDATE quest_template SET PrevQuestId=24510, NextQuestIdChain=24683 WHERE Id=24499;
UPDATE quest_template SET PrevQuestId=24506, NextQuestIdChain=24682 WHERE Id=24511;
UPDATE quest_template SET OfferRewardText='Just in time! Thank you, $N.$B$BThe Pit of Saron lies ahead, and if our scouts are correct, past that will be the Halls of Reflection. It is there that Arthas lets his guard down, and it is there that we hope to find a clue to his weakness... or maybe, just maybe, his redemption.' WHERE Id=24499;
UPDATE quest_template SET OfferRewardText='Well timed, $C!$B$BThe Pit of Saron lies ahead, and if our scouts are correct, past that will be the Halls of Reflection. It is there that Arthas lets his guard down, and it is there that we hope to find a clue to his weakness... and a route to vengeance long overdue.' WHERE Id=24511;
-- The Pit of Saron (A, H)
UPDATE quest_template SET PrevQuestId=24499, NextQuestIdChain=24498 WHERE Id=24683;
UPDATE quest_template SET PrevQuestId=24511, NextQuestIdChain=24507 WHERE Id=24682;
-- The Path to the Citadel (A, H)
UPDATE quest_template SET PrevQuestId=24683, NextQuestIdChain=24710 WHERE Id=24498;
UPDATE quest_template SET PrevQuestId=24682, NextQuestIdChain=24712 WHERE Id=24507;
-- Deliverance from the Pit (A, H)
UPDATE quest_template SET PrevQuestId=24498, NextQuestIdChain=24711 WHERE Id=24710;
UPDATE quest_template SET PrevQuestId=24507, NextQuestIdChain=24713 WHERE Id=24712;
-- Frostmourne (A, H)
UPDATE quest_template SET PrevQuestId=24710, NextQuestIdChain=0 WHERE Id=24711;
UPDATE quest_template SET PrevQuestId=24712, NextQuestIdChain=0 WHERE Id=24713;*/


-- Inside the Frozen citadel, taken from both NPCs in Dalaran.

DELETE FROM conditions WHERE sourceentry=24510 AND SourceTypeOrReferenceId=19;
INSERT INTO `conditions` VALUES (19, 0, 24510, 0, 0, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Alliance - Show quest "Inside the Frozen Citadel" if player already done ToC 25');
INSERT INTO `conditions` VALUES (19, 0, 24510, 0, 1, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Alliance - Show quest "Inside the Frozen Citadel" if player already done ToC 10');

-- Alliance
DELETE FROM creature_queststarter WHERE id=37776 AND quest=24510;
INSERT INTO `creature_queststarter` VALUES (37776, 24510);

-- Horde
DELETE FROM creature_queststarter WHERE id=37780 AND quest=24506;
INSERT INTO `creature_queststarter` VALUES (37780, 24506);

DELETE FROM conditions WHERE sourceentry=24506 AND SourceTypeOrReferenceId=19;
INSERT INTO `conditions` VALUES (19, 0, 24506, 0, 0, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Horde - Show quest "Inside the Frozen Citadel" if player already done ToC 25');
INSERT INTO `conditions` VALUES (19, 0, 24506, 0, 1, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Horde - Show quest "Inside the Frozen Citadel" if player already done ToC 10');

-- ###################
-- ### NPCS
-- ###################

-- Soulguard Watchman (36478,37569)
DELETE FROM creature_template_addon WHERE entry IN(36478,37569);
DELETE FROM smart_scripts WHERE entryorguid=36478 AND source_type=0;
INSERT INTO `smart_scripts` VALUES (36478, 0, 0, 0, 0, 0, 100, 0, 1000, 5000, 17000, 20000, 11, 69056, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shroud of Runes');
INSERT INTO `smart_scripts` VALUES (36478, 0, 1, 0, 2, 0, 100, 1, 0, 50, 0, 0, 11, 69053, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'at 50% cast Unholy Rage');

-- Spiteful Apparition (36551,37564)
UPDATE creature_template SET modelId1=25942, modelid2=0, modelid3=0, flags_extra=0 WHERE entry in(36551,37564);
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(36551,37564) and `map`=632 );
DELETE FROM creature_template_addon WHERE entry IN(36551,37564);
UPDATE creature SET modelid=0, unit_flags=0 WHERE id IN(36551,37564) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid=36551 AND source_type=0;
INSERT INTO `smart_scripts` VALUES (36551, 0, 0, 1, 4, 0, 100, 1, 0, 0, 0, 0, 11, 69105, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'skull visual (skull) on enter combat');
INSERT INTO `smart_scripts` VALUES (36551, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 69136, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'skull visual (smoke) on enter combat');
INSERT INTO `smart_scripts` VALUES (36551, 0, 2, 3, 34, 0, 100, 1, 5, 0, 0, 0, 11, 68895, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'on follow complete (target reached): cast Spite');
INSERT INTO `smart_scripts` VALUES (36551, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 41, 4000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'delayed despawn');
INSERT INTO `smart_scripts` VALUES (36551, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'deny combat movement');
INSERT INTO `smart_scripts` VALUES (36551, 0, 5, 0, 11, 0, 100, 0, 0, 0, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'allow combat movement');

-- Spiteful Apparition (Ambient) (36967)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(36967) and `map`=632 );
REPLACE INTO creature_template_addon VALUES(36967, 0, 0, 0, 1, 0, "69105 69658");
UPDATE creature SET modelid=0, unit_flags=0, spawndist=8, MovementType=1 WHERE id IN(36967) AND `map`=632;

-- Soulguard Adept (36620,37566)
DELETE FROM creature_template_addon WHERE entry IN(36620,37566);
UPDATE creature SET modelid=0, unit_flags=0 WHERE id IN(36620,37566) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid=36620 AND source_type=0;
INSERT INTO `smart_scripts` VALUES (36620, 0, 0, 0, 0, 0, 100, 0, 1000, 4000, 4500, 6000, 11, 69068, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Shadow Bolt');
INSERT INTO `smart_scripts` VALUES (36620, 0, 1, 0, 0, 0, 100, 0, 6000, 8000, 10000, 12000, 11, 69066, 64, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Drain Life');
INSERT INTO `smart_scripts` VALUES (36620, 0, 2, 0, 0, 0, 100, 0, 15000, 25000, 15000, 25000, 11, 69564, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadow Mend');
INSERT INTO `smart_scripts` VALUES (36620, 0, 3, 0, 1, 0, 100, 1, 1000, 1000, 0, 0, 11, 68834, 0, 0, 0, 0, 0, 19, 36522, 25, 0, 0, 0, 0, 0, 'Soulguard Channel Beam02');
INSERT INTO `smart_scripts` VALUES (36620, 0, 4, 0, 1, 0, 100, 1, 1000, 1000, 0, 0, 11, 68797, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Soulguard Channel');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceEntry=36620;
INSERT INTO conditions VALUES (22, 4, 36620, 0, 0, 29, 1, 36522, 20, 0, 0, 0, 0, '', 'Requires Soul Horror (36522) in 20yd to run event');
INSERT INTO conditions VALUES (22, 5, 36620, 0, 0, 29, 1, 36522, 20, 0, 1, 0, 0, '', 'Requires NO Soul Horror (36522) in 20yd to run event');
-- INSERT INTO `smart_scripts` VALUES (36620, 0, 3, 0, 0, 0, 100, 0, 15000, 25000, 125000, 125000, 69562, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Raise Dead');

-- Soulguard Bonecaster (36564,38193)
DELETE FROM creature_template_addon WHERE entry IN(36564,38193);
UPDATE creature SET modelid=0, unit_flags=0 WHERE id IN(36564,38193) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid IN(36564, -201686) AND source_type=0;
INSERT INTO `smart_scripts` VALUES (36564, 0, 0, 0, 0, 0, 100, 0, 4000, 8000, 7000, 9000, 11, 69080, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bone Volley');
INSERT INTO `smart_scripts` VALUES (36564, 0, 1, 0, 0, 0, 100, 0, 3000, 5000, 15000, 16000, 11, 69069, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shield of Bones');
INSERT INTO `smart_scripts` VALUES (36564, 0, 2, 0, 1, 0, 100, 1, 1000, 1000, 0, 0, 11, 68834, 0, 0, 0, 0, 0, 19, 36522, 25, 0, 0, 0, 0, 0, 'Soulguard Channel Beam02');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceEntry=36564;
INSERT INTO conditions VALUES (22, 3, 36564, 0, 0, 29, 1, 36522, 20, 0, 0, 0, 0, '', 'Requires Soul Horror (36522) in 20yd to run event');
-- single one of them is channeling this one
INSERT INTO `smart_scripts` VALUES (-201686, 0, 0, 0, 0, 0, 100, 0, 4000, 8000, 7000, 9000, 11, 69080, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bone Volley');
INSERT INTO `smart_scripts` VALUES (-201686, 0, 1, 0, 0, 0, 100, 0, 3000, 5000, 15000, 16000, 11, 69069, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shield of Bones');
INSERT INTO `smart_scripts` VALUES (-201686, 0, 2, 0, 1, 0, 100, 1, 1000, 1000, 0, 0, 11, 68797, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Soulguard Channel');

-- Soulguard Reaper (36499,37568)
DELETE FROM creature_template_addon WHERE entry IN(36499,37568);
UPDATE creature SET modelid=0, unit_flags=0 WHERE id IN(36499,37568) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid=36499 AND source_type=0;
INSERT INTO `smart_scripts` VALUES (36499, 0, 0, 0, 0, 0, 100, 0, 5000, 10000, 9000, 11000, 11, 69060, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Frost Nova');
INSERT INTO `smart_scripts` VALUES (36499, 0, 1, 0, 0, 0, 100, 0, 2000, 5000, 6000, 8000, 11, 69058, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Shadow Lance');
INSERT INTO `smart_scripts` VALUES (36499, 0, 2, 0, 1, 0, 100, 1, 1000, 1000, 0, 0, 11, 68797, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Soulguard Channel');

-- Soulguard Animator (36516,37567)
DELETE FROM creature_template_addon WHERE entry IN(36516,37567);
UPDATE creature SET modelid=0, unit_flags=0 WHERE id IN(36516,37567) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid=36516 AND source_type=0;
INSERT INTO `smart_scripts` VALUES (36516, 0, 0, 0, 0, 0, 100, 0, 1000, 4000, 4500, 6000, 11, 69068, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Shadow Bolt');
INSERT INTO `smart_scripts` VALUES (36516, 0, 1, 0, 0, 0, 100, 0, 8000, 12000, 14000, 14000, 11, 69128, 64, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Soul Siphon');
INSERT INTO `smart_scripts` VALUES (36516, 0, 2, 0, 0, 0, 100, 0, 4000, 9000, 9000, 11000, 11, 69131, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Soul Sickness');
INSERT INTO `smart_scripts` VALUES (36516, 0, 3, 0, 1, 0, 100, 1, 1000, 1000, 0, 0, 11, 68834, 0, 0, 0, 0, 0, 19, 36522, 25, 0, 0, 0, 0, 0, 'Soulguard Channel Beam02');
INSERT INTO `smart_scripts` VALUES (36516, 0, 4, 0, 1, 0, 100, 1, 1000, 1000, 0, 0, 11, 68797, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Soulguard Channel');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceEntry=36516;
INSERT INTO conditions VALUES (22, 4, 36516, 0, 0, 29, 1, 36522, 20, 0, 0, 0, 0, '', 'Requires Soul Horror (36522) in 20yd to run event');
INSERT INTO conditions VALUES (22, 5, 36516, 0, 0, 29, 1, 36522, 20, 0, 1, 0, 0, '', 'Requires NO Soul Horror (36522) in 20yd to run event');

-- Soul Horror (36522,37565)
DELETE FROM creature_template_addon WHERE entry IN(36522,37565);
UPDATE creature SET modelid=0, unit_flags=0 WHERE id IN(36522,37565) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid=36522 AND source_type=0;
INSERT INTO `smart_scripts` VALUES (36522, 0, 0, 0, 0, 0, 100, 0, 1000, 4000, 6000, 8000, 11, 69088, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Soul Strike');

-- Spectral Warden (36666,37563)
DELETE FROM creature_template_addon WHERE entry IN(36666,37563);
UPDATE creature SET modelid=0, unit_flags=0 WHERE id IN(36666,37563) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid=36666 AND source_type=0;
INSERT INTO `smart_scripts` VALUES (36666, 0, 0, 0, 0, 0, 100, 0, 3000, 5000, 10000, 10000, 11, 69633, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Veil of Shadow');
INSERT INTO `smart_scripts` VALUES (36666, 0, 1, 0, 0, 0, 100, 0, 8000, 10000, 5000, 5000, 11, 69148, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Wail of Souls');

-- Soulguard Beam Focus Target (36508)
DELETE FROM smart_scripts WHERE entryorguid IN(-201741, -201770, -201785);
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(36508) and `map`=632 );
DELETE FROM creature_template_addon WHERE entry IN(36508);
DELETE FROM creature WHERE id IN(36508) AND `map`=632;

-- Crucible of Souls (37094)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37094) and `map`=632 );
DELETE FROM creature_template_addon WHERE entry IN(37094);
DELETE FROM creature WHERE id IN(37094) AND `map`=632;
-- Support for Quest Tempering the Blade
DELETE FROM disables WHERE entry IN(69922, 69956) AND sourceType=0 AND flags=64;
INSERT INTO disables VALUES(0, 69922, 64, '', '', 'Disable LOS for Queldelar');
INSERT INTO disables VALUES(0, 69956, 64, '', '', 'Disable LOS for Queldelar');
DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(13, 17) AND SourceEntry IN(69922);
INSERT INTO conditions VALUES (13, 1, 69922, 0, 0, 31, 0, 3, 37094, 0, 0, 0, 0, '', 'Target Crucible of Souls');
DELETE FROM smart_scripts WHERE entryorguid IN(37094) AND source_type=0;
INSERT INTO smart_scripts VALUES (37094, 0, 0, 0, 8, 0, 100, 0, 69922, 0, 0, 0, 11, 69956, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Cast at invoker');
INSERT INTO smart_scripts VALUES (37094, 0, 1, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 69859, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Aura self');


-- EVENT NPCs:

-- Dark Ranger Kalira (37583,37608)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37583,37608) and `map`=632 );
DELETE FROM creature WHERE id IN(37583,37608) AND `map`=632;
INSERT INTO `creature` VALUES (NULL, 37583, 632, 0, 0, 3, 1, 30686, 1, 4902.83, 2212.83, 638.817, 0.349066, 86400, 0, 0, 75600, 0, 0, 0, 0, 0, 0);
DELETE FROM smart_scripts WHERE entryorguid=37583 AND source_type=0;
-- INSERT INTO `smart_scripts` VALUES (37583, 0, 0, 0, 0, 0, 100, 0, 3000, 5000, 7000, 8000, 11, 31942, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Multi-Shot');

-- Dark Ranger Loralen (37779,37797)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37779,37797) and `map`=632 );
DELETE FROM creature WHERE id IN(37779,37797) AND `map`=632;
INSERT INTO `creature` VALUES (NULL, 37779, 632, 0, 0, 3, 1, 30687, 1, 4899.85, 2205.9, 638.817, 5.49779, 86400, 0, 0, 75600, 0, 0, 0, 0, 0, 0);
DELETE FROM smart_scripts WHERE entryorguid=37779 AND source_type=0;
-- INSERT INTO `smart_scripts` VALUES (37779, 0, 0, 0, 0, 0, 100, 0, 3000, 5000, 7000, 8000, 11, 31942, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Multi-Shot');

-- Archmage Elandra (37774,37809)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37774,37809) and `map`=632 );
DELETE FROM creature WHERE id IN(37774,37809) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid=37774 AND source_type=0;
-- INSERT INTO `smart_scripts` VALUES (37774, 0, 0, 0, 0, 0, 100, 0, 3000, 5000, 7000, 8000, 11, 51779, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Frostfire Bolt');

-- Archmage Koreln (37582,37628)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37582,37628) and `map`=632 );
DELETE FROM creature WHERE id IN(37582,37628) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid=37582 AND source_type=0;
-- INSERT INTO `smart_scripts` VALUES (37582, 0, 0, 0, 0, 0, 100, 0, 3000, 5000, 7000, 8000, 11, 51779, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Frostfire Bolt');

-- Lady Sylvanas Windrunner (37596) (first)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37596) and `map`=632 );
DELETE FROM creature WHERE id IN(37596) AND `map`=632;
INSERT INTO `creature` VALUES (NULL, 37596, 632, 0, 0, 3, 1, 28213, 1, 4899.98, 2208.16, 638.817, 0.349066, 86400, 0, 0, 6972500, 85160, 0, 0, 0, 0, 0);
DELETE FROM smart_scripts WHERE entryorguid=37596 AND source_type=0;
DELETE FROM gossip_menu_option WHERE menu_id=10943;

-- Lady Sylvanas Windrunner (38161) (second)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(38161) and `map`=632 );
DELETE FROM creature WHERE id IN(38161) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid=38161 AND source_type=0;

-- Lady Jaina Proudmoore (37597) (first)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37597) and `map`=632 );
DELETE FROM creature WHERE id IN(37597) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid=37597 AND source_type=0;

-- Lady Jaina Proudmoore (38160) (second)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(38160) and `map`=632 );
DELETE FROM creature WHERE id IN(38160) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid=38160 AND source_type=0;

-- OUTRO CHAMPIONS: (37584,37624,37587,37625,37588,37623,37496,37604,37497,37603)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(37584,37624,37587,37625,37588,37623,37496,37604,37497,37603) and `map`=632 );
DELETE FROM creature WHERE id IN(37584,37624,37587,37625,37588,37623,37496,37604,37497,37603) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid IN(37584,37624,37587,37625,37588,37623,37496,37604,37497,37603) AND source_type=0;


--  select * from creature_template WHERE entry=
 
 UPDATE creature_template SET scriptname="npc_fos_leader" WHERE entry=37597;

 UPDATE creature_template SET scriptname="npc_fos_leader_second" WHERE entry=38160; 

 UPDATE creature_template SET scriptname="npc_fos_leader" WHERE entry=37596; 
 
 UPDATE creature_template SET scriptname="npc_fos_leader_second" WHERE entry=38161; 


UPDATE creature_template SET damagemodifier=1.45, unit_flags=33554432 WHERE entry=37678;
UPDATE creature_template SET damagemodifier=1.1 WHERE entry=36595;

-- ###################
-- ### SPELLS
-- ###################

-- Shroud of Runes (69056)
REPLACE INTO spell_proc_event VALUES(69056, 0, 0, 0, 0, 0, 0, 2048, 0, 0, 0);

-- Shield of Bones (69069,70207)
DELETE FROM spell_script_names WHERE spell_id IN(69069,70207);
INSERT INTO spell_script_names VALUES(69069, "spell_shield_of_bones");
INSERT INTO spell_script_names VALUES(70207, "spell_shield_of_bones");

-- Soul Sickness (69131)
DELETE FROM spell_script_names WHERE spell_id IN(69131,-69131,69133,-69133);
DELETE FROM spell_scripts WHERE id IN(69131,-69131,69133,-69133);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(69131,-69131,69133,-69133) OR spell_effect IN(69131,-69131,69133,-69133);

-- Magic's Bane (68793,69050)
DELETE FROM spell_script_names WHERE spell_id IN(68793,-68793,69050,-69050);
DELETE FROM spell_scripts WHERE id IN(68793,-68793,69050,-69050);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(68793,-68793,69050,-69050) OR spell_effect IN(68793,-68793,69050,-69050);
INSERT INTO spell_script_names VALUES(68793, "spell_bronjahm_magic_bane"),(69050, "spell_bronjahm_magic_bane");

-- Corrupt Soul (68839), Draw Corrupted Soul (68846)
DELETE FROM spell_script_names WHERE spell_id IN(68839,-68839,68846,-68846);
DELETE FROM spell_scripts WHERE id IN(68839,-68839,68846,-68846);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(68839,-68839,68846,-68846) OR spell_effect IN(68839,-68839,68846,-68846);
INSERT INTO spell_linked_spell VALUES(-68839, 68846, 0, "Draw Corrupted Soul at the end of Corrupt Soul");

-- Consume Soul (68861), Consume Soul (68858)
DELETE FROM spell_script_names WHERE spell_id IN(68861,-68861,68858,-68858);
DELETE FROM spell_scripts WHERE id IN(68861,-68861,68858,-68858);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(68861,-68861,68858,-68858) OR spell_effect IN(68861,-68861,68858,-68858);
INSERT INTO `spell_scripts` VALUES (68861, 0, 0, 15, 68858, 2, 1, 0, 0, 0, 0);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=68861;
INSERT INTO `conditions` VALUES (13, 1, 68861, 0, 0, 31, 0, 3, 36497, 0, 0, 0, 0, '', 'Bronjahm - Consume Soul');
INSERT INTO `conditions` VALUES (13, 1, 68861, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, '', 'Bronjahm - Consume Soul');

-- Soulstorm (69008)
DELETE FROM spell_script_names WHERE spell_id IN(69008,-69008);
DELETE FROM spell_scripts WHERE id IN(69008,-69008);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(69008,-69008) OR spell_effect IN(69008,-69008);
INSERT INTO spell_script_names VALUES(69008, "spell_bronjahm_soulstorm_channel_ooc");

-- Teleport (68988)
REPLACE INTO spell_target_position VALUES(68988, 0, 632, 5297.33, 2506.3, 686.069, 0, 0);

-- Soulstorm (68870)
DELETE FROM spell_script_names WHERE spell_id IN(68870,-68870);
DELETE FROM spell_scripts WHERE id IN(68870,-68870);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(68870,-68870) OR spell_effect IN(68870,-68870);
INSERT INTO spell_script_names VALUES(68870, "spell_bronjahm_soulstorm_visual");

-- Soulstorm (68872)
DELETE FROM spell_script_names WHERE spell_id IN(68872,-68872);
DELETE FROM spell_scripts WHERE id IN(68872,-68872);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(68872,-68872) OR spell_effect IN(68872,-68872);

-- Soulstorm (68921,69049)
DELETE FROM spell_script_names WHERE spell_id IN(68921,-68921,69049,-69049);
DELETE FROM spell_scripts WHERE id IN(68921,-68921,69049,-69049);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(68921,-68921,69049,-69049) OR spell_effect IN(68921,-68921,69049,-69049);
INSERT INTO spell_script_names VALUES(68921, "spell_bronjahm_soulstorm_targeting"),(69049, "spell_bronjahm_soulstorm_targeting");

-- Mirrored Soul (69051,69023,69034,69048)
DELETE FROM spell_script_names WHERE spell_id IN(69051,-69051,69023,-69023,69034,-69034,69048,-69048);
DELETE FROM spell_scripts WHERE id IN(69051,-69051,69023,-69023,69034,-69034,69048,-69048);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(69051,-69051,69023,-69023,69034,-69034,69048,-69048) OR spell_effect IN(69051,-69051,69023,-69023,69034,-69034,69048,-69048);
INSERT INTO `spell_scripts` VALUES (69051, 0, 0, 15, 69023, 3, 1, 0, 0, 0, 0);
INSERT INTO spell_linked_spell VALUES(-69051,-69023, 0, "Mirrored Soul");

-- Wailing Souls (68871,68873,68875,68876,68899,68912,70324)
DELETE FROM spell_script_names WHERE spell_id IN(68871,-68871,68873,-68873,68875,-68875,68876,-68876,68899,-68899,68912,-68912,70324,-70324);
DELETE FROM spell_scripts WHERE id IN(68871,-68871,68873,-68873,68875,-68875,68876,-68876,68899,-68899,68912,-68912,70324,-70324);
DELETE FROM spell_linked_spell WHERE spell_trigger IN(68871,-68871,68873,-68873,68875,-68875,68876,-68876,68899,-68899,68912,-68912,70324,-70324) OR spell_effect IN(68871,-68871,68873,-68873,68875,-68875,68876,-68876,68899,-68899,68912,-68912,70324,-70324);
INSERT INTO `spell_scripts` VALUES (68871, 0, 0, 15, 68875, 0, 1, 0, 0, 0, 0);
INSERT INTO spell_script_names VALUES(68875, "spell_wailing_souls_periodic");
INSERT INTO spell_linked_spell VALUES(-68875,-68899, 0, "Wailing Souls");



-- ###################
-- ### ACHIEVEMENTS
-- ###################

-- The Forge of Souls (4516)
DELETE FROM disables WHERE sourceType=4 AND entry IN(12738,12739);
DELETE FROM achievement_criteria_data WHERE criteria_id IN(12738,12739);
REPLACE INTO achievement_criteria_data VALUES(12738, 12, 0, 0, "");
REPLACE INTO achievement_criteria_data VALUES(12739, 12, 0, 0, "");

-- Heroic: The Forge of Souls (4519)
DELETE FROM disables WHERE sourceType=4 AND entry IN(12745,12746);
DELETE FROM achievement_criteria_data WHERE criteria_id IN(12745,12746);
REPLACE INTO achievement_criteria_data VALUES(12745, 12, 1, 0, "");
REPLACE INTO achievement_criteria_data VALUES(12746, 12, 1, 0, "");

-- Soul Power (4522)
DELETE FROM disables WHERE sourceType=4 AND entry IN(12752);
DELETE FROM achievement_criteria_data WHERE criteria_id IN(12752);
REPLACE INTO achievement_criteria_data VALUES(12752, 12, 1, 0, "");
REPLACE INTO achievement_criteria_data VALUES(12752, 18, 0, 0, "");

-- Three Faced (4523)
DELETE FROM disables WHERE sourceType=4 AND entry IN(12976);
DELETE FROM achievement_criteria_data WHERE criteria_id IN(12976);
REPLACE INTO achievement_criteria_data VALUES(12976, 12, 1, 0, "");
REPLACE INTO achievement_criteria_data VALUES(12976, 18, 0, 0, "");



-- ###################
-- ### BRONJAHM
-- ###################

-- Bronjahm (36497,36498)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(36497,36498) and `map`=632 );
DELETE FROM creature_template_addon WHERE entry IN(36497,36498);

-- Corrupted Soul Fragment (36535,36617)
REPLACE INTO creature_template_addon VALUES(36535, 0, 0, 0, 1, 0, "68862"),(36617, 0, 0, 0, 1, 0, "68862");
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(36535,36617) and `map`=632 );
DELETE FROM creature WHERE id IN(36535,36617) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid=36535 AND source_type=0;

-- Texts
UPDATE creature_text SET text="My soul for you, master." WHERE entry=36497 AND groupid=2 AND text="";



-- ###################
-- ### DEVOURER OF SOULS
-- ###################

-- Devourer of Souls (36502,37677)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(36502,37677) and `map`=632 );
DELETE FROM creature_template_addon WHERE entry IN(36502,37677);

UPDATE creature_template SET scriptname="npc_fos_corrupted_soul_fragment" WHERE entry=36535;

-- Well of Souls (36536)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(36536) and `map`=632 );
DELETE FROM creature WHERE id IN(36536) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid=36536 AND source_type=0;
REPLACE INTO creature_template_addon VALUES(36536, 0, 0, 0, 1, 0, "68854");

-- Unleashed Soul (36595)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id IN(36595) and `map`=632 );
DELETE FROM creature WHERE id IN(36595) AND `map`=632;
DELETE FROM smart_scripts WHERE entryorguid=36595 AND source_type=0;
DELETE FROM creature_template_addon WHERE entry=36595;


UPDATE creature_template SET damagemodifier=1.45, unit_flags=33554432 WHERE entry=37678;
UPDATE creature_template SET damagemodifier=1.1 WHERE entry=36595;

-- templates just for models
/*REPLACE INTO `creature_template` VALUES (36503, 0, 0, 0, 36502, 0, 30149, 0, 0, 0, 'Devourer of Souls', '', '', 0, 1, 1, 0, 16, 0, 1, 1.14286, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 48, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 8388624, 0, '', 12340);
REPLACE INTO `creature_template` VALUES (36504, 0, 0, 0, 36502, 0, 30150, 0, 0, 0, 'Devourer of Souls', '', '', 0, 1, 1, 0, 16, 0, 1, 1.14286, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 2048, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 48, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 8388624, 0, '', 12340);*/



-- ###################
-- ### WAYPOINTS
-- ###################

DELETE FROM waypoint_data WHERE id >= 3000100 AND id <=3000119;
INSERT INTO `waypoint_data` VALUES (3000119, 7, 5692.99, 2522.18, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000119, 6, 5693.15, 2520.66, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000119, 5, 5705.14, 2526.66, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000119, 4, 5707.28, 2522.01, 714.62, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000119, 3, 5694.93, 2512.22, 708.736, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000119, 2, 5631.79, 2465.01, 708.554, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000119, 1, 5626.2, 2457.83, 705.92, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000118, 7, 5690.09, 2522.55, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000118, 6, 5690.01, 2520.72, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000118, 5, 5705.1, 2527.56, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000118, 4, 5709.27, 2521.32, 714.71, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000118, 3, 5698.18, 2509.99, 709.192, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000118, 2, 5634.72, 2464.78, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000118, 1, 5628.75, 2456.98, 706.116, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000117, 8, 5687.34, 2522.77, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000117, 7, 5687.19, 2520.84, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000117, 6, 5706.48, 2527.13, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000117, 5, 5708.01, 2520.79, 714.423, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000117, 4, 5695.24, 2509.84, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000117, 3, 5634.65, 2463.99, 708.694, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000117, 2, 5628.31, 2456.28, 705.919, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000117, 1, 5606.3, 2428.23, 705.852, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000116, 7, 5669, 2541.41, 714.691, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000116, 6, 5667.05, 2541.35, 714.691, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000116, 5, 5669.28, 2554.7, 714.691, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000116, 4, 5664.3, 2554.8, 714.377, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000116, 3, 5658.14, 2540.11, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000116, 2, 5628.07, 2467.74, 708.53, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000116, 1, 5622.34, 2460.42, 705.917, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000115, 7, 5669.43, 2538.44, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000115, 6, 5668.21, 2538, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000115, 5, 5669.79, 2553.19, 714.693, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000115, 4, 5665.48, 2557.51, 714.693, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000115, 3, 5655.93, 2541.54, 708.697, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000115, 2, 5627.6, 2469.51, 708.697, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000115, 1, 5621.66, 2462.28, 706.115, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000114, 8, 5670, 2535.86, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000114, 7, 5668.81, 2535.36, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000114, 6, 5669.21, 2551.55, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000114, 5, 5666.92, 2557.69, 714.693, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000114, 4, 5657.35, 2541.77, 708.934, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000114, 3, 5626.42, 2469.83, 708.594, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000114, 2, 5621.06, 2463.26, 706.184, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000114, 1, 5600.45, 2437.99, 705.852, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000113, 4, 5624.73, 2480.77, 708.697, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000113, 3, 5623.7, 2480.63, 708.697, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000113, 2, 5628.59, 2469.55, 708.697, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000113, 1, 5622.72, 2461.64, 706.206, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000112, 4, 5624.27, 2483.68, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000112, 3, 5623.11, 2483.59, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000112, 2, 5627.98, 2471.08, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000112, 1, 5621.62, 2463.09, 706.266, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000111, 4, 5645.06, 2465.35, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000111, 3, 5645.19, 2464.42, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000111, 2, 5633.37, 2465.7, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000111, 1, 5626.64, 2457.31, 705.918, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000110, 3, 5648.04, 2465.96, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000110, 2, 5648.17, 2464.69, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000110, 1, 5628.87, 2456.93, 706.12, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000109, 4, 5666.28, 2469.8, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000109, 3, 5666.64, 2468.09, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000109, 2, 5627.92, 2468.09, 708.566, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000109, 1, 5622.46, 2461.66, 706.158, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000108, 4, 5668.05, 2471.15, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000108, 3, 5668.36, 2469.43, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000108, 2, 5630.31, 2466.27, 708.663, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000108, 1, 5624.37, 2458.86, 705.921, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000107, 4, 5669.77, 2470.98, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000107, 3, 5669.98, 2469.6, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000107, 2, 5633.3, 2463.46, 708.377, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000107, 1, 5627.93, 2457.04, 705.922, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000106, 4, 5641.57, 2526.95, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000106, 3, 5640.1, 2528.18, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000106, 2, 5631.96, 2465.21, 708.628, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000106, 1, 5626.39, 2457.8, 705.921, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000105, 4, 5639.53, 2524.9, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000105, 3, 5638, 2526.18, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000105, 2, 5630.03, 2466.84, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000105, 1, 5624.11, 2458.97, 705.92, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000104, 4, 5638.09, 2522.92, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000104, 3, 5637.36, 2523.5, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000104, 2, 5628.26, 2467.57, 708.537, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000104, 1, 5623.17, 2460.89, 706.151, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000103, 5, 5694.95, 2539.71, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000103, 4, 5710.59, 2521.08, 714.709, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000103, 3, 5699.63, 2507.51, 708.794, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000103, 2, 5634.51, 2464.58, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000103, 1, 5627.48, 2456.44, 705.914, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000102, 5, 5686.93, 2547.32, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000102, 4, 5662.83, 2557.57, 714.719, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000102, 3, 5652.76, 2544.69, 708.951, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000102, 2, 5626.97, 2470.59, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000102, 1, 5620.73, 2462.43, 705.92, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000101, 6, 5690.94, 2538.4, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000101, 5, 5690.88, 2537.58, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000101, 4, 5709.62, 2523.4, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000101, 3, 5696.11, 2510.07, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000101, 2, 5633.71, 2465.56, 708.696, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000101, 1, 5626.44, 2457.04, 705.914, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000100, 6, 5685.25, 2542.92, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000100, 5, 5684.56, 2542.76, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000100, 4, 5665.3, 2558.08, 714.692, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000100, 3, 5657.46, 2541.15, 708.729, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000100, 2, 5628.16, 2468.18, 708.635, 0, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (3000100, 1, 5622.33, 2460.91, 705.92, 0, 0, 1, 0, 100, 0);



-- ###################
-- ### FORMATIONS
-- ###################

DELETE FROM creature_formations WHERE memberGUID IN( select guid from creature where map=632 );
DELETE FROM creature_formations WHERE leaderGUID IN(201792,201766,201713,201706,201700,201751,201749,201742,201734,201698,201790);
INSERT INTO `creature_formations` VALUES (201792, 201792, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201792, 201677, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201766, 201766, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201766, 201712, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201766, 201726, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201766, 201676, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201713, 201713, 0, 0, 2, 0, 0);
INSERT INTO `creature_formations` VALUES (201713, 201735, 4, 90, 2, 0, 0);
INSERT INTO `creature_formations` VALUES (201706, 201706, 0, 0, 2, 0, 0);
INSERT INTO `creature_formations` VALUES (201706, 201764, 4, 90, 2, 0, 0);
INSERT INTO `creature_formations` VALUES (201700, 201700, 0, 0, 2, 0, 0);
INSERT INTO `creature_formations` VALUES (201700, 201757, 4, 90, 2, 0, 0);
INSERT INTO `creature_formations` VALUES (201751, 201751, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201751, 201697, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201751, 201786, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201751, 201688, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201751, 201705, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201749, 201749, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201749, 201783, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201749, 201719, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201749, 201753, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201742, 201742, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201742, 201693, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201742, 201711, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201742, 201678, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201742, 201699, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201734, 201734, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201734, 201776, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201734, 201686, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201734, 201758, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201698, 201698, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201698, 201695, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201698, 201762, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201790, 201790, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201790, 201732, 0, 0, 5, 0, 0);
INSERT INTO `creature_formations` VALUES (201790, 201748, 0, 0, 5, 0, 0);
