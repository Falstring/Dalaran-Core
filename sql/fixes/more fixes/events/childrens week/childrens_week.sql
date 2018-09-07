-- He was without script, hence not working.
UPDATE creature_template SET ScriptName="npc_the_etymidian" WHERE entry=28092;

-- Remove the incorrect script name to this entry (is from ulduar and had the etymidiam script)
UPDATE creature_template SET ScriptName="" WHERE entry=28033;