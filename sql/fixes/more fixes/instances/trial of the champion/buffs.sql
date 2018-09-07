
	/*35572,
	35569,
	35571,
	35570,
	35617,

	-- Alliance Champions
	34705,
	34702,
	34701,
	34657,
	34703,



	35119,
	34928,



	35451,

	35545,
	35564,


	-- Memory
	35052,
	35041,
	35033,
	35046,
	35043,
	35047,
	35044,
	35039,
	35034,
	35049,
	35030,
	34942,
	35050,
	35042,
	35045,
	35037,
	35031,
	35038,
	35029,
	35048,
	35032,
	35028,
	35040,
	35036,
	35051




-- ADDS.

	35309,
	35305,
	35307,


	-- Faction champions horde
	35314,
	35326,
	35325,
	35323,
	35327,

	-- Faction champions alliance
	35328,
	35331,
	35330,
	35332,
	35329,



*/



	UPDATE creature_template SET healthmodifier= ((healthmodifier*30)/100)+healthmodifier, damagemodifier=7.5 WHERE entry IN (
	35572,
	35569,
	35571,
	35570,
	35617,

	-- Alliance Champions
	34705,
	34702,
	34701,
	34657,
	34703,



	35119,
	34928,



	35451,

	35545,
	35564,


	-- Memory
	35052,
	35041,
	35033,
	35046,
	35043,
	35047,
	35044,
	35039,
	35034,
	35049,
	35030,
	34942,
	35050,
	35042,
	35045,
	35037,
	35031,
	35038,
	35029,
	35048,
	35032,
	35028,
	35040,
	35036,
	35051);




	UPDATE creature_template SET healthmodifier= ((healthmodifier*45)/100)+healthmodifier, damagemodifier=15 WHERE entry IN (36086,36083,36082,36087,36088,35517,35531,35541,35538,35530,35536,35540,35521,35528,35543,35535,35537,35527,35542,35520,35533,35523,35525,35534,35522,35524,35539,35529,35532,35544,35519,35518,35490,36085,36091,36090,36089,36084);



-- Paletress adds.

UPDATE creature_template SET healthmodifier= ((healthmodifier*30)/100)+healthmodifier, damagemodifier=12 WHERE entry IN (
	35309,
	35305,
	35307
	);



UPDATE creature_template SET damagemodifier=8 WHERE entry IN (
	-- Faction champions horde
	35314,
	35326,
	35325,
	35323,
	35327,

	-- Faction champions alliance
	35328,
	35331,
	35330,
	35332,
	35329);