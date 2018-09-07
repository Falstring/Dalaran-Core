/*SELECT rlp.id AS rbac_linked_permissions_ID, rlp.linkedid AS rbac_permissions_LINKEDID,rp.name FROM RBAC_LINKED_PERMISSIONS rlp 
JOIN RBAC_PERMISSIONS rp ON rlp.linkedid=rp.id
WHERE rlp.id=195;*/

/*

**194 RLP
11?, 30?, 35, 39?, 41, 798, 218, 300, 312, 315, 316, 317, 318, 367, 368, 369, 370, 380, 408, 409, 410, 411, 412, 413, 414, 415, 416, 430, 431, 432, 433, 462, 466, 467, 468, 469, 470, 483, 484, 512, 524, 545, 546, 547, 548, 549, 551, 552, 553, 554, 555, 557, 559, 560, 567, 569, 597, 598, 599, 600, 741, 745, 749?, 225, 263, 525, 797,


11, 30, 35, 39, 41, 798, 218, 300, 312, 315, 316, 317, 318, 367, 368, 369, 370, 380, 408, 409, 410, 411, 412, 413, 414, 415, 416, 430, 431, 432, 433, 462, 466, 467, 468, 469, 470, 483, 484, 512, 524, 545, 546, 547, 548, 549, 551, 552, 553, 554, 555, 557, 559, 560, 567, 569, 597, 598, 599, 600, 741, 745, 749, 225, 263, 525, 797,



Meter 
- spy a la cuenta 1 (pinfo)
- npc info


*/

-- 193: Role: Sec Level Gamemaster
-- 194: Role: Sec Level Moderator
-- 195: Role: Sec Level Player.

-- 196: Role: Administrator Commands
-- 197: Role: Gamemaster Commands
-- 199: Role Players commands.
-- 198: Role Moderators commands.





-- Every current GM, will be account level 2.

-- Deleting normal player commands.

DELETE FROM rbac_linked_permissions WHERE id=195 AND linkedid=199;
DELETE FROM rbac_linked_permissions WHERE id=195 AND linkedid=49;



/**********************************
*********************************** 
***ACCOUNT LEVEL 1 CONFIGURATION*** 
***********************************
***********************************/

-- Adding the normal player commands to the account level 1 so they can use the .commands and few more.

DELETE FROM rbac_linked_permissions WHERE id IN(194,195, 198, 199) AND linkedid IN(500,450,602,603,604,605,606,593,517,373, 199,11, 30, 35, 39, 41, 798, 218, 300, 312, 315, 316, 317, 318, 367, 368, 369, 370, 380, 408, 409, 410, 411, 412, 413, 414, 415, 416, 430, 431, 432, 433, 462, 466, 467, 468, 469, 470, 483, 484, 512, 524, 545, 546, 547, 548, 549, 551, 552, 553, 554, 555, 557, 559, 560, 567, 569, 597, 598, 599, 600, 741, 745, 749, 225, 263, 525, 797);
INSERT INTO rbac_linked_permissions (id, linkedid) values
(194, 199), -- Role: Player Commands
(194, 373), -- GM fly
(194, 517),  -- Pinfo
(198, 593),  -- Command: npc info
(198, 450),  -- Command: lookup quest
(198, 602),  -- Command: quest
(198, 603),  -- Command: quest add.
(198, 604),  -- Command: quest complete.
(198, 605),  -- Command: quest remove.
(198, 606),  -- Command: quest reward.
(198, 500)  -- Command: .die

;


/**********************************
*********************************** 
***ACCOUNT LEVEL 2 CONFIGURATION*** 
***********************************
***********************************/

-- Tiene todo lo que la 1, pero vamos agregados.

DELETE FROM rbac_linked_permissions WHERE id IN(197) AND linkedid IN(436,440,437,447,451,453,444,442, 277,301, 311, 389, 390, 391,393, 395, 396, 397, 399, 480,481,482, 506, 509, 518, 542, 543, 568, 558, 550, 571, 580, 767);
INSERT INTO rbac_linked_permissions (id, linkedid) values
(197, 442),  -- Lookup
(197, 444),  -- Lookup Creature 
(197, 447),  -- Lookup Item
(197, 451),  -- Lookup Player
(197, 453),  -- Lookup Player account
(197, 436),  -- List
(197, 437),  -- List Creature
(197, 440),  -- List Creature
(197, 571)  -- Npc add
;


/**********************************
*********************************** 
***ACCOUNT LEVEL 3 CONFIGURATION*** 
***********************************
***********************************/
-- Level 3 accounts must be able to set gmlevel

DELETE FROM rbac_linked_permissions WHERE id=192 AND linkedid=228;
INSERT INTO rbac_linked_permissions (id, linkedid) values(192, 228);

-- Administrator commands.

DELETE FROM rbac_linked_permissions WHERE id IN(196) AND linkedid IN(524, 198);
INSERT INTO rbac_linked_permissions (id, linkedid) values
(196, 524);  -- Saveall. 




-- Permissions to restore saved GM settings.

DELETE FROM rbac_linked_permissions WHERE linkedid=39 AND id IN(192, 193, 194);
INSERT INTO rbac_linked_permissions (id, linkedid) values
(192, 39),
(193, 39),
(194, 39)
;


DELETE FROM rbac_linked_permissions WHERE linkedid=523 AND id IN(196, 197,198);
INSERT INTO rbac_linked_permissions (id, linkedid) values
(196, 523),
(197, 523),
(198, 523)
;


DELETE FROM rbac_linked_permissions WHERE linkedid=462 AND id IN(192);
DELETE FROM rbac_linked_permissions WHERE linkedid=727 AND id IN(192);
INSERT INTO rbac_linked_permissions (id, linkedid) values
(192, 462),
(192, 727);



-- Ban.

DELETE FROM rbac_linked_permissions WHERE linkedid=239 AND id IN(196, 197);
DELETE FROM rbac_linked_permissions WHERE linkedid=240 AND id IN(196, 197);
DELETE FROM rbac_linked_permissions WHERE linkedid=242 AND id IN(196, 197);

INSERT INTO rbac_linked_permissions (id, linkedid) values
(196, 239),
(197, 239),

(196, 240),
(197, 240),


(196, 242),
(197, 242)

;



-- Send items for Administrators.
DELETE FROM rbac_linked_permissions WHERE linkedid=484 AND id IN(196);
INSERT INTO rbac_linked_permissions (id, linkedid) values
(196, 484);



-- Additions for level 2 accounts.

DELETE FROM rbac_linked_permissions WHERE id IN(197) AND linkedid IN(291, 295, 488, 495, 498, 552, 556, 522);
INSERT INTO rbac_linked_permissions (id, linkedid) values
(197, 291),  -- Cheat
(197, 295),  -- Cheat God
(197, 488),  -- Additem
(197, 495),  -- Cometome
(197, 498),  -- Damage
(197, 552),  -- Modify hp
(197, 556),  -- Modify phase
(197, 522);  -- Respawn


-- Additions for level 1 accounts.

DELETE FROM rbac_linked_permissions WHERE id IN(198) AND linkedid IN(743, 758, 748, 291, 295, 387, 388, 394, 498);
INSERT INTO rbac_linked_permissions (id, linkedid) values
(198, 743), -- Ticket Assign.
(198, 758), -- Ticket Unassign.
(198, 748), -- Ticket Delete.
(198, 291), -- Cheat
(198, 295), -- Cheat god
(198, 387), -- Gobject
(198, 388), -- Gobject activate
(198, 394), -- Gobject near
(198, 498)  -- Gobject activate
;