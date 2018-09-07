

-- NPC corrections, Tylos Downrunner FLAGS corrections.

UPDATE creature_template SET unit_flags=128 WHERE entry IN (34914,35984);


-- Vendors, just meanwhile ToC is not out.

DELETE FROM npc_vendor WHERE entry IN(35579, 35577, 35575, 35573, 35580, 35578, 35576, 35574);





-- Delete come conditions for the initial mounts.

DELETE FROM conditions WHERE sourcegroup=33843 AND conditionValue1=13686;
DELETE FROM conditions WHERE sourcegroup=33842 AND conditionValue1=13687;






