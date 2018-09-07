

/*UPDATE arena_team SET rating=0, seasonGames=0,seasonWins=0, weekGames=0, weekWins=0, rank=0;
UPDATE arena_team_member SET  weekGames=0, weekWins=0, seasonGames=0,seasonWins=0, personalRating=1500;*/






-- Vaciar arena_team y character_arena_stats

UPDATE characters SET arenapoints=0;


UPDATE character_arena_stats SET matchMakerRating=1500;