-- Attumen the Huntsman (16152) -- http://www.wowhead.com/npc=16152
DELETE FROM creature_text WHERE entry=16152;
INSERT INTO creature_text VALUES (16152, 0, 0, 'I always knew... someday I would become... the hunted.', 14, 0, 100, 0, 0, 9165, 0, 0, 'attumen SAY_DEATH');
INSERT INTO creature_text VALUES (16152, 1, 0, 'It was... inevitable.', 14, 0, 100, 0, 0, 9169, 0, 0, 'attumen SAY_KILL1');
INSERT INTO creature_text VALUES (16152, 1, 1, 'Another trophy to add to my collection!', 14, 0, 100, 0, 0, 9300,  0, 0, 'attumen SAY_KILL2');
INSERT INTO creature_text VALUES (16152, 3, 0, 'Weapons are merely a convenience for a warrior of my skill!', 14, 0, 100, 0, 0, 9166, 0, 0, 'attumen SAY_DISARMED');
INSERT INTO creature_text VALUES (16152, 4, 0, 'Such easy sport.', 14, 0, 100, 0, 0, 9170,  0, 0,'attumen SAY_RANDOM1');
INSERT INTO creature_text VALUES (16152, 4, 1, 'Amateurs! Do not think you can best me! I kill for a living.', 14, 0, 100, 0, 0, 9304,  0, 0, 'attumen SAY_RANDOM2');
DELETE FROM creature_loot_template WHERE entry=16152;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(16152, 1, 34016, 100, 0, 1, 1, 1, 2, NULL),
(16152, 30480, 0, 0.5, 0, 1, 0, 1, 1, NULL),
(16152, 29434, 0, 100, 0, 1, 0, 1, 1, NULL),
(16152, 23809, 0, 5, 0, 1, 0, 1, 1, NULL);

UPDATE creature_template SET lootid=16152, mechanic_immune_mask=650854267, flags_extra=1+0x100+0x200000, AIName='', ScriptName='boss_attumen_midnight' WHERE entry=16152;

-- SPELL Mount (29769)
-- SPELL Mount (29770)
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(29769, 29770);
INSERT INTO conditions VALUES (13, 1, 29769, 0, 0, 31, 0, 3, 15550, 0, 0, 0, 0, '', 'Target Attumen the Huntsman');
INSERT INTO conditions VALUES (13, 1, 29770, 0, 0, 31, 0, 3, 16151, 0, 0, 0, 0, '', 'Target Midnight');
