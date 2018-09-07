-- Archmage Arugal (4275)
SET @Arugal := 4275;
DELETE FROM creature_summon_groups WHERE summonerId=@Arugal AND summonerType=0;
INSERT INTO creature_summon_groups VALUES (@Arugal, 0, 1, 4627, -148.199, 2165.647, 128.448, 1.026, 4, 60000);
INSERT INTO creature_summon_groups VALUES (@Arugal, 0, 1, 4627, -153.110, 2168.620, 128.448, 1.026, 4, 60000);
INSERT INTO creature_summon_groups VALUES (@Arugal, 0, 1, 4627, -145.905, 2180.520, 128.448, 4.183, 4, 60000);
INSERT INTO creature_summon_groups VALUES (@Arugal, 0, 1, 4627, -140.794, 2178.037, 128.448, 4.090, 4, 60000);
DELETE FROM creature_text WHERE entry=@Arugal;
INSERT INTO creature_text VALUES (@Arugal, 0, 0, 'Who dares interfere with the Sons of Arugal?', 14, 0, 100, 0, 0, 5791, 0, 0, 'Archmage Arugal');
INSERT INTO creature_text VALUES (@Arugal, 1, 0, 'You, too, shall serve!', 14, 0, 100, 0, 0, 5793, 0,  0, 'Archmage Arugal');
INSERT INTO creature_text VALUES (@Arugal, 2, 0, 'Release your rage!', 14, 0, 100, 0, 0, 5797, 0,  0, 'Archmage Arugal');
INSERT INTO creature_text VALUES (@Arugal, 3, 0, 'Another falls!', 14, 0, 100, 0, 0, 5795, 0,  0, 'Archmage Arugal');

UPDATE `creature_template` SET `AIName`="", `ScriptName` = 'boss_archmage_arugal' WHERE `entry`= @Arugal;

UPDATE `creature_text` SET `comment`= 'Archmage Arugal - Fenrus the Devourer dies' WHERE `entry`= @Arugal AND `groupid`= 0;


-- SPELL Shadow Port (7136)
-- SPELL Shadow Port (7586)
-- SPELL Shadow Port (7587)
DELETE FROM spell_target_position WHERE id IN(7136, 7586, 7587);
INSERT INTO spell_target_position VALUES (7136, 0, 33, -105.654, 2154.98, 156.43, 1.24782, 0);
INSERT INTO spell_target_position VALUES (7586, 0, 33, -84.99, 2151.01, 155.62, 1.11623, 0);
INSERT INTO spell_target_position VALUES (7587, 0, 33, -103.46, 2122.1, 155.655, 4.4224, 0);

-- Shadowfang Glutton
UPDATE creature_template SET DamageModifier=2 WHERE entry=3857;