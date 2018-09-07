-- Correct the item level for the heroic dungeons

UPDATE access_requirement SET item_level=100 WHERE difficulty=1 AND mapId IN(574,575,576,578,595,599,600,601,602,604,608,619);