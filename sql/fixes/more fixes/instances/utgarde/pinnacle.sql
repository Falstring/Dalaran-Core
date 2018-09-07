
-- Despawn one Grauf and set Inhabittype

DELETE FROM creature WHERE guid=126052;

UPDATE creature_template SET Inhabittype=4 WHERE entry=26893;