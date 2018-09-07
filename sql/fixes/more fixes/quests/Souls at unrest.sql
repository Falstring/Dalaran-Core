-- Souls at Unrest (12159)
UPDATE creature_template SET AIName='SmartAI' WHERE entry=26891;
DELETE FROM smart_scripts WHERE entryorguid=26891 AND source_type=0;
INSERT INTO smart_scripts VALUES (26891, 0, 0, 0, 9, 0, 100, 0, 0, 5, 8000, 11000, 11, 48374, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Undead Miner - Within 0-5 Range - Cast Puncture Wound');
INSERT INTO smart_scripts VALUES (26891, 0, 1, 0, 0, 0, 100, 0, 5000, 7000, 6000, 9000, 11, 52608, 0, 0, 0, 0, 0, 5, 30, 0, 0, 0, 0, 0, 0, 'Undead Miner - In Combat - Cast Throw Lantern');
INSERT INTO smart_scripts VALUES (26891, 0, 2, 0, 8, 0, 100, 0, 48974, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Undead Miner - On Spell Hit - Despawn');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=48974;
INSERT INTO conditions VALUES (17, 0, 48974, 0, 0, 31, 1, 3, 26891, 0, 0, 0, 0, '', 'Requires Undead Miner');
INSERT INTO conditions VALUES (17, 0, 48974, 0, 0, 36, 1, 0, 0, 0, 1, 0, 0, '', 'Requires Dead Target');
