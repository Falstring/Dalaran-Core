

-- Druid, Faerie Fire should not be casted on a player who is under the effects of the Cyclone.

DELETE FROM spell_linked_spell WHERE spell_trigger=33786 AND spell_effect IN(-16857, -770);
INSERT INTO spell_linked_spell (spell_trigger, spell_effect, type, comment) VALUES('33786','-16857','2','Cyclone - Faerie Fire (Feral)');
INSERT INTO spell_linked_spell (spell_trigger, spell_effect, type, comment) VALUES('33786','-770','2','Clyclone - Faerie fire');




-- Omen of clarity, 10 seconds cooldown removal

UPDATE spell_proc_event SET Cooldown = 0 WHERE entry = 16864;


-- Solace of the Defeated/Solace of the Fallen (Normal/Heroic) proc fix
DELETE FROM `spell_proc_event` WHERE `entry` IN (67698,67752);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`Cooldown`) VALUES
(67698, 0, 0, 0, 0, 0, 0, 65536, 0, 0, 0),
(67752, 0, 0, 0, 0, 0, 0, 65536, 0, 0, 0);