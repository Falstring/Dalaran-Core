UPDATE creature_template ct1
INNER JOIN creature_template ct2 ON ct2.difficulty_entry_1 = ct1.entry AND ct2.skinloot > 0 AND ct2.difficulty_entry_1 > 0
SET ct1.skinloot = ct2.skinloot;
