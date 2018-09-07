-- Heart of Phoenix, Ignore LoS.
DELETE FROM `disables` WHERE `sourceType` = 0 AND `entry` = 54114;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(0, 54114, 64, 0, 0, 'Heart of the Phoenix uses Cooldown, but won''t work through LoS, so ignore LoS.');


-- Lock and load proc.
UPDATE `spell_proc_event` SET `SchoolMask`='0', `SpellFamilyName`='9', `SpellFamilyMask0`='0', `SpellFamilyMask1`='0', `SpellFamilyMask2`='0', `procFlags`='2430272', `procEx`='0', `ppmRate`='0', `CustomChance`='0', `Cooldown`='22' WHERE (`entry`='-56342');