-- Correct the rank for Patchwerk and Darion Mograin, instead of be WORLD BOSS, they will be elite, so they dont have core's corpse decay + spawntimesecs.

UPDATE creature_template SET rank=1 WHERE entry IN(31099, 29173);