-- Vindication proc rate.

UPDATE spell_proc_event SET ppmRate=20 WHERE entry=9452;
UPDATE spell_proc_event SET ppmRate=24 WHERE entry=26016;



-- Pursuit of Justice
DELETE FROM spell_linked_spell WHERE spell_trigger IN(26022, 26023, -26022, -26023);
INSERT INTO spell_linked_spell VALUES (26022, 61417, 2, 'Pursuit of Justice add');
INSERT INTO spell_linked_spell VALUES (26023, 61418, 2, 'Pursuit of Justice add');
INSERT INTO spell_linked_spell VALUES (-26022, -61417, 0, 'Pursuit of Justice remove');
INSERT INTO spell_linked_spell VALUES (-26023, -61418, 0, 'Pursuit of Justice remove');