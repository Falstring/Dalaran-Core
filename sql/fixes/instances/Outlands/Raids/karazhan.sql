-- Midnight (16151)
DELETE FROM creature_text WHERE entry=16151;
INSERT INTO creature_text VALUES (16151, 0, 0, '%s calls for her master!', 16, 0, 100, 0, 0, 0, 0, 0, 'midnight');
UPDATE creature_template SET mechanic_immune_mask=650854271, flags_extra=1+0x100+0x200000, AIName='', ScriptName='boss_midnight' WHERE entry=16151;
DELETE FROM creature_formations WHERE leaderGUID=135159;
INSERT INTO creature_formations VALUES (135159, 135159, 0, 0, 0, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135828, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135829, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135830, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135831, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135832, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135833, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135834, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135835, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135836, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135837, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135838, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135839, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135840, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135841, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135842, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135843, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135844, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135845, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135846, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135847, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135848, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135849, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135850, 0, 0, 1, 0, 0);
INSERT INTO creature_formations VALUES (135159, 135851, 0, 0, 1, 0, 0);

-- Attumen the Huntsman (15550)
DELETE FROM creature_loot_template WHERE entry=15550;
DELETE FROM creature_text WHERE entry=15550;
INSERT INTO creature_text VALUES (15550, 0, 0, 'Cowards! Wretches!', 14, 0, 100, 0, 0, 9167, 0,  0, 'attumen SAY_APPEAR1');
INSERT INTO creature_text VALUES (15550, 0, 1, 'Who dares attack the steed of the Huntsman?', 14, 0, 100, 0, 0, 9298, 0,  0, 'attumen SAY_APPEAR2');
INSERT INTO creature_text VALUES (15550, 0, 2, 'Perhaps you would rather test yourselves against a more formidable opponent?!', 14, 0, 100, 0, 0, 9299, 0, 0,'attumen SAY_APPEAR3');
INSERT INTO creature_text VALUES (15550, 1, 0, 'It was... inevitable.', 14, 0, 100, 0, 0, 9169, 0, 0,'attumen SAY_KILL1');
INSERT INTO creature_text VALUES (15550, 1, 1, 'Another trophy to add to my collection!', 14, 0, 100, 0, 0, 9300, 0, 0, 'attumen SAY_KILL2');
INSERT INTO creature_text VALUES (15550, 2, 0, 'Come, Midnight, let''s disperse this petty rabble!', 14, 0, 100, 0, 0, 9168, 0, 0, 'attumen SAY_MOUNT');
INSERT INTO creature_text VALUES (15550, 3, 0, 'Weapons are merely a convenience for a warrior of my skill!', 14, 0, 100, 0, 0, 9166, 0, 0, 'attumen SAY_DISARMED');
INSERT INTO creature_text VALUES (15550, 4, 0, 'Such easy sport.', 14, 0, 100, 0, 0, 9170, 0, 0, 'attumen SAY_RANDOM1');
INSERT INTO creature_text VALUES (15550, 4, 1, 'Amateurs! Do not think you can best me! I kill for a living.', 14, 0, 100, 0, 0, 9304, 0, 0, 'attumen SAY_RANDOM2');
INSERT INTO creature_text VALUES (15550, 5, 0, 'Well done Midnight!', 14, 0, 100, 0, 0, 9173, 0, 0, 'attumen SAY_MIDNIGHT_KILL');
UPDATE creature_template SET lootid=0, mechanic_immune_mask=650854267, flags_extra=1+0x100+0x200000, AIName='', ScriptName='boss_attumen' WHERE entry=15550;

-- Attumen the Huntsman (16152)
DELETE FROM creature_text WHERE entry=16152;
INSERT INTO creature_text VALUES (16152, 0, 0, 'I always knew... someday I would become... the hunted.', 14, 0, 100, 0, 0, 9165, 0, 0, 'attumen SAY_DEATH');
INSERT INTO creature_text VALUES (16152, 1, 0, 'It was... inevitable.', 14, 0, 100, 0, 0, 9169, 0, 0, 'attumen SAY_KILL1');
INSERT INTO creature_text VALUES (16152, 1, 1, 'Another trophy to add to my collection!', 14, 0, 100, 0, 0, 9300, 0, 0, 'attumen SAY_KILL2');
INSERT INTO creature_text VALUES (16152, 3, 0, 'Weapons are merely a convenience for a warrior of my skill!', 14, 0, 100, 0, 0, 9166, 0, 0, 'attumen SAY_DISARMED');
INSERT INTO creature_text VALUES (16152, 4, 0, 'Such easy sport.', 14, 0, 100, 0, 0, 9170, 0, 0, 'attumen SAY_RANDOM1');
INSERT INTO creature_text VALUES (16152, 4, 1, 'Amateurs! Do not think you can best me! I kill for a living.', 14, 0, 100, 0, 0, 9304, 0, 0, 'attumen SAY_RANDOM2');
UPDATE creature_template SET lootid=16152, mechanic_immune_mask=650854267, flags_extra=1+0x100+0x200000, AIName='', ScriptName='boss_attumen_midnight' WHERE entry=16152;

-- SPELL Mount (29769)
-- SPELL Mount (29770)
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(29769, 29770);
INSERT INTO conditions VALUES (13, 1, 29769, 0, 0, 31, 0, 3, 15550, 0, 0, 0, 0, '', 'Target Attumen the Huntsman');
INSERT INTO conditions VALUES (13, 1, 29770, 0, 0, 31, 0, 3, 16151, 0, 0, 0, 0, '', 'Target Midnight');