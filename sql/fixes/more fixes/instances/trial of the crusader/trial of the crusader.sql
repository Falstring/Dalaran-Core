
-- Increase their size.

UPDATE creature_template SET scale=2 WHERE name like "%Coliseum Spectator%" or name like "%argent crusade spe%";


-- Cheer aura.
DELETE FROM creature_template_addon WHERE entry IN(34970,34868,34974,34975,34966,34977,34871,34856,34870,34869,34979,34859,34861,34860,34857,34858);
INSERT INTO creature_template_addon (entry, auras) VALUES
(34970,55944),
(34868,55944),
(34974,55944),
(34975,55944),
(34966,55944),
(34977,55944),
(34871,55944),
(34856,55944),
(34870,55944),
(34869,55944),
(34979,55944),
(34859,55944),
(34861,55944),
(34860,55944),
(34857,55944),
(34858,55944);

