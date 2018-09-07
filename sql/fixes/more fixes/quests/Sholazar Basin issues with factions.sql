-- Frenzyheart Ravager, Frenzyheart Hunter, Sparktouched Warrior, Sparktouched Oracle AND Warlord Tartek faction HACK.

 UPDATE creature_template SET faction=2030 WHERE entry IN (28078, 28079, 28111, 28112, 28105, 28399, 28110, 28109, 28080, 28081);
 
 
 -- Warlord Tartek remove set faction
 UPDATE smart_scripts SET action_param1=2030 WHERE entryorguid=28105 AND id=0 AND link=1;
 
 UPDATE smart_scripts SET action_param1=2030 WHERE entryorguid=28399 AND id=0 AND link=1;