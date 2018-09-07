/*
* Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
* Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
*
* This program is free software; you can redistribute it and/or modify it
* under the terms of the GNU General Public License as published by the
* Free Software Foundation; either version 2 of the License, or (at your
* option) any later version.
*
* This program is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
* more details.
*
* You should have received a copy of the GNU General Public License along
* with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#include "SuspectMgr.h"

/*void SuspectMgr::RemoveSuspect(ObjectGuid guid)
{
	auto itr = _suspects.find(guid);
	if (itr == _suspects.end())
		return;

	_suspects.erase(itr);
}

bool SuspectMgr::IsSuspectedForOpcode(ObjectGuid guid, Opcodes opcode) const
{
	auto itr = _suspects.find(guid);
	if (itr == _suspects.end())
		return false;

	return std::find(itr->second.SuspectedOpcodes.begin(), itr->second.SuspectedOpcodes.end(), opcode) != itr->second.SuspectedOpcodes.end();
}

void SuspectMgr::OnOpcode(Player* player, Opcodes opcode, uint32 time)
{
	ObjectGuid guid = player->GetGUID();
	CharacterInfo const* charInfo = sWorld->GetCharacterInfo(guid);
	std::string remoteAdress = player->GetSession()->GetRemoteAddress();

	// Check if IP is suspect
	if (IsSuspectIP(remoteAdress))
		return;

	// This will call SuspectInfo constructor inserting into _suspects
	SuspectInfo& info = _suspects[guid];

	uint32 maxPacketCounterAllowed = GetMaxPacketCounterAllowed(opcode);
	uint32 maxMSTimeDiff = GetMaxPacketMSDiffAllowed(opcode);

	// Return if there no limit for the opcode
	if (!maxPacketCounterAllowed || !maxMSTimeDiff)
		return;

	PacketCounter& packetCounter = info.PacketThrottlingMap[opcode];
	if (getMSTimeDiff(packetCounter.lastReceiveTime, time) > maxMSTimeDiff)
	{
		packetCounter.lastReceiveTime = time;
		packetCounter.amountCounter = 0;
	}

	// Check if player is flooding some packets
	if (++packetCounter.amountCounter <= maxPacketCounterAllowed)
		return;

	AddSuspectedOpcode(guid, opcode);

	AddSuspectInfo(guid, charInfo);
	AddSuspectIP(remoteAdress);
}

void SuspectMgr::PrintTo(ChatHandler* handler)
{
	for (auto suspect : _suspects)
	{
		handler->PSendSysMessage(">> Suspect Info <<");

		ObjectGuid guid = suspect.first;
		uint32 accountId = suspect.second.CharInfo->AccountId;
		std::string name = suspect.second.CharInfo->Name;
		uint8 level = suspect.second.CharInfo->Level;
		uint8 race = suspect.second.CharInfo->Race;
		uint8 playerClass = suspect.second.CharInfo->Class;
		std::string suspectedForStr;

		for (auto opcode : suspect.second.SuspectedOpcodes)
			suspectedForStr.append("opcode: %u " + std::to_string(opcode));

		handler->PSendSysMessage("CharacterGuid: %u Account: %u Character: %s Level (%u) Race (&u) Class (%u)",
			guid.GetCounter(), accountId, name.c_str(), level, race, playerClass);
		handler->PSendSysMessage("Suspected for: %s", suspectedForStr);
	}
}

uint32 SuspectMgr::GetMaxPacketCounterAllowed(uint16 opcode) const
{
	uint32 maxPacketCounterAllowed;
	switch (opcode)
	{
		// CPU usage sending 2000 packets/second on a 3.70 GHz 4 cores on Win x64
		//                                              [% CPU mysqld]   [%CPU worldserver RelWithDebInfo]
	case CMSG_PLAYER_LOGIN:                         //   0               0.5
	case CMSG_NAME_QUERY:                           //   0               1
	case CMSG_PET_NAME_QUERY:                       //   0               1
	case CMSG_NPC_TEXT_QUERY:                       //   0               1
	case CMSG_ATTACKSTOP:                           //   0               1
	case CMSG_QUERY_QUESTS_COMPLETED:               //   0               1
	case CMSG_QUERY_TIME:                           //   0               1
	case CMSG_CORPSE_MAP_POSITION_QUERY:            //   0               1
	case CMSG_MOVE_TIME_SKIPPED:                    //   0               1
	case MSG_QUERY_NEXT_MAIL_TIME:                  //   0               1
	case CMSG_SETSHEATHED:                          //   0               1
	case MSG_RAID_TARGET_UPDATE:                    //   0               1
	case CMSG_PLAYER_LOGOUT:                        //   0               1
	case CMSG_LOGOUT_REQUEST:                       //   0               1
	case CMSG_PET_RENAME:                           //   0               1
	case CMSG_QUESTGIVER_CANCEL:                    //   0               1
	case CMSG_QUESTGIVER_REQUEST_REWARD:            //   0               1
	case CMSG_COMPLETE_CINEMATIC:                   //   0               1
	case CMSG_BANKER_ACTIVATE:                      //   0               1
	case CMSG_BUY_BANK_SLOT:                        //   0               1
	case CMSG_OPT_OUT_OF_LOOT:                      //   0               1
	case CMSG_DUEL_ACCEPTED:                        //   0               1
	case CMSG_DUEL_CANCELLED:                       //   0               1
	case CMSG_CALENDAR_COMPLAIN:                    //   0               1
	case CMSG_QUEST_QUERY:                          //   0               1.5
	case CMSG_ITEM_QUERY_SINGLE:                    //   0               1.5
	case CMSG_ITEM_NAME_QUERY:                      //   0               1.5
	case CMSG_GAMEOBJECT_QUERY:                     //   0               1.5
	case CMSG_CREATURE_QUERY:                       //   0               1.5
	case CMSG_QUESTGIVER_STATUS_QUERY:              //   0               1.5
	case CMSG_GUILD_QUERY:                          //   0               1.5
	case CMSG_ARENA_TEAM_QUERY:                     //   0               1.5
	case CMSG_TAXINODE_STATUS_QUERY:                //   0               1.5
	case CMSG_TAXIQUERYAVAILABLENODES:              //   0               1.5
	case CMSG_QUESTGIVER_QUERY_QUEST:               //   0               1.5
	case CMSG_PAGE_TEXT_QUERY:                      //   0               1.5
	case MSG_QUERY_GUILD_BANK_TEXT:                 //   0               1.5
	case MSG_CORPSE_QUERY:                          //   0               1.5
	case MSG_MOVE_SET_FACING:                       //   0               1.5
	case CMSG_REQUEST_PARTY_MEMBER_STATS:           //   0               1.5
	case CMSG_QUESTGIVER_COMPLETE_QUEST:            //   0               1.5
	case CMSG_SET_ACTION_BUTTON:                    //   0               1.5
	case CMSG_RESET_INSTANCES:                      //   0               1.5
	case CMSG_HEARTH_AND_RESURRECT:                 //   0               1.5
	case CMSG_TOGGLE_PVP:                           //   0               1.5
	case CMSG_PET_ABANDON:                          //   0               1.5
	case CMSG_ACTIVATETAXIEXPRESS:                  //   0               1.5
	case CMSG_ACTIVATETAXI:                         //   0               1.5
	case CMSG_SELF_RES:                             //   0               1.5
	case CMSG_UNLEARN_SKILL:                        //   0               1.5
	case CMSG_EQUIPMENT_SET_SAVE:                   //   0               1.5
	case CMSG_DELETEEQUIPMENT_SET:                  //   0               1.5
	case CMSG_DISMISS_CRITTER:                      //   0               1.5
	case CMSG_REPOP_REQUEST:                        //   0               1.5
	case CMSG_GROUP_INVITE:                         //   0               1.5
	case CMSG_GROUP_DECLINE:                        //   0               1.5
	case CMSG_GROUP_ACCEPT:                         //   0               1.5
	case CMSG_GROUP_UNINVITE_GUID:                  //   0               1.5
	case CMSG_GROUP_UNINVITE:                       //   0               1.5
	case CMSG_GROUP_DISBAND:                        //   0               1.5
	case CMSG_BATTLEMASTER_JOIN_ARENA:              //   0               1.5
	case CMSG_LEAVE_BATTLEFIELD:                    //   0               1.5
	case MSG_GUILD_BANK_LOG_QUERY:                  //   0               2
	case CMSG_LOGOUT_CANCEL:                        //   0               2
	case CMSG_REALM_SPLIT:                          //   0               2
	case CMSG_ALTER_APPEARANCE:                     //   0               2
	case CMSG_QUEST_CONFIRM_ACCEPT:                 //   0               2
	case MSG_GUILD_EVENT_LOG_QUERY:                 //   0               2.5
	case CMSG_READY_FOR_ACCOUNT_DATA_TIMES:         //   0               2.5
	case CMSG_QUESTGIVER_STATUS_MULTIPLE_QUERY:     //   0               2.5
	case CMSG_BEGIN_TRADE:                          //   0               2.5
	case CMSG_INITIATE_TRADE:                       //   0               3
	case CMSG_MESSAGECHAT:                          //   0               3.5
	case CMSG_INSPECT:                              //   0               3.5
	case CMSG_QUESTGIVER_ACCEPT_QUEST:              //   0               4
	case CMSG_QUESTLOG_REMOVE_QUEST:                //   0               4
	case CMSG_QUESTGIVER_CHOOSE_REWARD:             //   0               4
	case CMSG_CONTACT_LIST:                         //   0               5
	case CMSG_LEARN_PREVIEW_TALENTS:                //   0               6
	case CMSG_AUTOBANK_ITEM:                        //   0               6
	case CMSG_AUTOSTORE_BANK_ITEM:                  //   0               6
	case CMSG_PLAYER_VEHICLE_ENTER:                 //   0               8
	case CMSG_LEARN_PREVIEW_TALENTS_PET:            // not profiled
	case MSG_MOVE_HEARTBEAT:
	case CMSG_AREA_SPIRIT_HEALER_QUERY:             // not profiled
	case CMSG_STANDSTATECHANGE:                     // not profiled
	case MSG_RANDOM_ROLL:                           // not profiled
	case CMSG_TIME_SYNC_RESP:                       // not profiled
	case CMSG_TRAINER_BUY_SPELL:                    // not profiled
	case CMSG_FORCE_RUN_SPEED_CHANGE_ACK:           // not profiled
	case CMSG_GUILD_SET_PUBLIC_NOTE:                //   1               2         1 async db query
	case CMSG_GUILD_SET_OFFICER_NOTE:               //   1               2         1 async db query
	case CMSG_SET_CONTACT_NOTES:                    //   1               2.5       1 async db query
	case CMSG_CALENDAR_GET_CALENDAR:                //   0               1.5       medium upload bandwidth usage
	case CMSG_GUILD_BANK_QUERY_TAB:                 //   0               3.5       medium upload bandwidth usage
	case CMSG_QUERY_INSPECT_ACHIEVEMENTS:           //   0              13         high upload bandwidth usage
	case CMSG_GAMEOBJ_REPORT_USE:                   // not profiled
	case CMSG_GAMEOBJ_USE:                          // not profiled
	case MSG_PETITION_DECLINE:                      // not profiled
	case CMSG_GM_REPORT_LAG:                        //   1               3         1 async db query
	case CMSG_SPELLCLICK:                           // not profiled
	case CMSG_REMOVE_GLYPH:                         // not profiled
	case CMSG_DISMISS_CONTROLLED_VEHICLE:           // not profiled
	case CMSG_PETITION_SIGN:                        //   9               4         2 sync 1 async db queries
	case CMSG_TURN_IN_PETITION:                     //   8               5.5       2 sync db query
	case CMSG_GROUP_CHANGE_SUB_GROUP:               //   6               5         1 sync 1 async db queries
	case CMSG_PETITION_QUERY:                       //   4               3.5       1 sync db query
	case CMSG_CHAR_RACE_CHANGE:                     //   5               4         1 sync db query
	case CMSG_CHAR_CUSTOMIZE:                       //   5               5         1 sync db query
	case CMSG_CHAR_FACTION_CHANGE:                  //   5               5         1 sync db query
	case CMSG_CHAR_DELETE:                          //   4               4         1 sync db query
	case CMSG_DEL_FRIEND:                           //   7               5         1 async db query
	case CMSG_ADD_FRIEND:                           //   6               4         1 async db query
	case CMSG_CHAR_RENAME:                          //   5               3         1 async db query
	case CMSG_GMSURVEY_SUBMIT:                      //   2               3         1 async db query
	case CMSG_BUG:                                  //   1               1         1 async db query
	case CMSG_GROUP_SET_LEADER:                     //   1               2         1 async db query
	case CMSG_GROUP_RAID_CONVERT:                   //   1               5         1 async db query
	case CMSG_GROUP_ASSISTANT_LEADER:               //   1               2         1 async db query
	case CMSG_CALENDAR_ADD_EVENT:                   //  21              10         2 async db query
	case CMSG_PETITION_BUY:                         // not profiled                1 sync 1 async db queries
	case CMSG_CHANGE_SEATS_ON_CONTROLLED_VEHICLE:   // not profiled
	case CMSG_REQUEST_VEHICLE_PREV_SEAT:            // not profiled
	case CMSG_REQUEST_VEHICLE_NEXT_SEAT:            // not profiled
	case CMSG_REQUEST_VEHICLE_SWITCH_SEAT:          // not profiled
	case CMSG_REQUEST_VEHICLE_EXIT:                 // not profiled
	case CMSG_CONTROLLER_EJECT_PASSENGER:           // not profiled
	case CMSG_ITEM_REFUND:                          // not profiled
	case CMSG_SOCKET_GEMS:                          // not profiled
	case CMSG_WRAP_ITEM:                            // not profiled
	case CMSG_REPORT_PVP_AFK:                       // not profiled
	case CMSG_CHAR_CREATE:                          //   7               5         3 async db queries
	case CMSG_CHAR_ENUM:                            //  22               3         2 async db queries
	case CMSG_GMTICKET_CREATE:                      //   1              25         1 async db query
	case CMSG_GMTICKET_UPDATETEXT:                  //   0              15         1 async db query
	case CMSG_GMTICKET_DELETETICKET:                //   1              25         1 async db query
	case CMSG_GMRESPONSE_RESOLVE:                   //   1              25         1 async db query
	case CMSG_CALENDAR_UPDATE_EVENT:                // not profiled
	case CMSG_CALENDAR_REMOVE_EVENT:                // not profiled
	case CMSG_CALENDAR_COPY_EVENT:                  // not profiled
	case CMSG_CALENDAR_EVENT_INVITE:                // not profiled
	case CMSG_CALENDAR_EVENT_SIGNUP:                // not profiled
	case CMSG_CALENDAR_EVENT_RSVP:                  // not profiled
	case CMSG_CALENDAR_EVENT_REMOVE_INVITE:         // not profiled
	case CMSG_CALENDAR_EVENT_MODERATOR_STATUS:      // not profiled
	case CMSG_ARENA_TEAM_INVITE:                    // not profiled
	case CMSG_ARENA_TEAM_ACCEPT:                    // not profiled
	case CMSG_ARENA_TEAM_DECLINE:                   // not profiled
	case CMSG_ARENA_TEAM_LEAVE:                     // not profiled
	case CMSG_ARENA_TEAM_DISBAND:                   // not profiled
	case CMSG_ARENA_TEAM_REMOVE:                    // not profiled
	case CMSG_ARENA_TEAM_LEADER:                    // not profiled
	case CMSG_LOOT_METHOD:                          // not profiled
	case CMSG_GUILD_INVITE:                         // not profiled
	case CMSG_GUILD_ACCEPT:                         // not profiled
	case CMSG_GUILD_DECLINE:                        // not profiled
	case CMSG_GUILD_LEAVE:                          // not profiled
	case CMSG_GUILD_DISBAND:                        // not profiled
	case CMSG_GUILD_LEADER:                         // not profiled
	case CMSG_GUILD_MOTD:                           // not profiled
	case CMSG_GUILD_RANK:                           // not profiled
	case CMSG_GUILD_ADD_RANK:                       // not profiled
	case CMSG_GUILD_DEL_RANK:                       // not profiled
	case CMSG_GUILD_INFO_TEXT:                      // not profiled
	case CMSG_GUILD_BANK_DEPOSIT_MONEY:             // not profiled
	case CMSG_GUILD_BANK_WITHDRAW_MONEY:            // not profiled
	case CMSG_GUILD_BANK_BUY_TAB:                   // not profiled
	case CMSG_GUILD_BANK_UPDATE_TAB:                // not profiled
	case CMSG_SET_GUILD_BANK_TEXT:                  // not profiled
	case MSG_SAVE_GUILD_EMBLEM:                     // not profiled
	case MSG_PETITION_RENAME:                       // not profiled
	case MSG_TALENT_WIPE_CONFIRM:                   // not profiled
	case MSG_SET_DUNGEON_DIFFICULTY:                // not profiled
	case MSG_SET_RAID_DIFFICULTY:                   // not profiled
	case MSG_PARTY_ASSIGNMENT:                      // not profiled
	case MSG_RAID_READY_CHECK:                      // not profiled
	case CMSG_QUEST_POI_QUERY:                      //   0              25         very high upload bandwidth usage
	case CMSG_ITEM_REFUND_INFO:                     // not profiled
	{
		// "0" is a magic number meaning there's no limit for the opcode.
		// All the opcodes above must cause little CPU usage and no sync/async database queries at all
		maxPacketCounterAllowed = 0;
		break;
	}
	case CMSG_WHO:
	{
		maxPacketCounterAllowed = 10;
		break;
	}
	case CMSG_SEND_MAIL:
	{
		maxPacketCounterAllowed = 5;
		break;
	}
	}

	return maxPacketCounterAllowed;
}

uint32 SuspectMgr::GetMaxPacketMSDiffAllowed(uint16 opcode) const
{
	uint32 maxPacketMSDiffAllowed;
	switch (opcode)
	{
		// CPU usage sending 2000 packets/second on a 3.70 GHz 4 cores on Win x64
		//                                              [% CPU mysqld]   [%CPU worldserver RelWithDebInfo]
	case CMSG_PLAYER_LOGIN:                         //   0               0.5
	case CMSG_NAME_QUERY:                           //   0               1
	case CMSG_PET_NAME_QUERY:                       //   0               1
	case CMSG_NPC_TEXT_QUERY:                       //   0               1
	case CMSG_ATTACKSTOP:                           //   0               1
	case CMSG_QUERY_QUESTS_COMPLETED:               //   0               1
	case CMSG_QUERY_TIME:                           //   0               1
	case CMSG_CORPSE_MAP_POSITION_QUERY:            //   0               1
	case CMSG_MOVE_TIME_SKIPPED:                    //   0               1
	case MSG_QUERY_NEXT_MAIL_TIME:                  //   0               1
	case CMSG_SETSHEATHED:                          //   0               1
	case MSG_RAID_TARGET_UPDATE:                    //   0               1
	case CMSG_PLAYER_LOGOUT:                        //   0               1
	case CMSG_LOGOUT_REQUEST:                       //   0               1
	case CMSG_PET_RENAME:                           //   0               1
	case CMSG_QUESTGIVER_CANCEL:                    //   0               1
	case CMSG_QUESTGIVER_REQUEST_REWARD:            //   0               1
	case CMSG_COMPLETE_CINEMATIC:                   //   0               1
	case CMSG_BANKER_ACTIVATE:                      //   0               1
	case CMSG_BUY_BANK_SLOT:                        //   0               1
	case CMSG_OPT_OUT_OF_LOOT:                      //   0               1
	case CMSG_DUEL_ACCEPTED:                        //   0               1
	case CMSG_DUEL_CANCELLED:                       //   0               1
	case CMSG_CALENDAR_COMPLAIN:                    //   0               1
	case CMSG_QUEST_QUERY:                          //   0               1.5
	case CMSG_ITEM_QUERY_SINGLE:                    //   0               1.5
	case CMSG_ITEM_NAME_QUERY:                      //   0               1.5
	case CMSG_GAMEOBJECT_QUERY:                     //   0               1.5
	case CMSG_CREATURE_QUERY:                       //   0               1.5
	case CMSG_QUESTGIVER_STATUS_QUERY:              //   0               1.5
	case CMSG_GUILD_QUERY:                          //   0               1.5
	case CMSG_ARENA_TEAM_QUERY:                     //   0               1.5
	case CMSG_TAXINODE_STATUS_QUERY:                //   0               1.5
	case CMSG_TAXIQUERYAVAILABLENODES:              //   0               1.5
	case CMSG_QUESTGIVER_QUERY_QUEST:               //   0               1.5
	case CMSG_PAGE_TEXT_QUERY:                      //   0               1.5
	case MSG_QUERY_GUILD_BANK_TEXT:                 //   0               1.5
	case MSG_CORPSE_QUERY:                          //   0               1.5
	case MSG_MOVE_SET_FACING:                       //   0               1.5
	case CMSG_REQUEST_PARTY_MEMBER_STATS:           //   0               1.5
	case CMSG_QUESTGIVER_COMPLETE_QUEST:            //   0               1.5
	case CMSG_SET_ACTION_BUTTON:                    //   0               1.5
	case CMSG_RESET_INSTANCES:                      //   0               1.5
	case CMSG_HEARTH_AND_RESURRECT:                 //   0               1.5
	case CMSG_TOGGLE_PVP:                           //   0               1.5
	case CMSG_PET_ABANDON:                          //   0               1.5
	case CMSG_ACTIVATETAXIEXPRESS:                  //   0               1.5
	case CMSG_ACTIVATETAXI:                         //   0               1.5
	case CMSG_SELF_RES:                             //   0               1.5
	case CMSG_UNLEARN_SKILL:                        //   0               1.5
	case CMSG_EQUIPMENT_SET_SAVE:                   //   0               1.5
	case CMSG_DELETEEQUIPMENT_SET:                  //   0               1.5
	case CMSG_DISMISS_CRITTER:                      //   0               1.5
	case CMSG_REPOP_REQUEST:                        //   0               1.5
	case CMSG_GROUP_INVITE:                         //   0               1.5
	case CMSG_GROUP_DECLINE:                        //   0               1.5
	case CMSG_GROUP_ACCEPT:                         //   0               1.5
	case CMSG_GROUP_UNINVITE_GUID:                  //   0               1.5
	case CMSG_GROUP_UNINVITE:                       //   0               1.5
	case CMSG_GROUP_DISBAND:                        //   0               1.5
	case CMSG_BATTLEMASTER_JOIN_ARENA:              //   0               1.5
	case CMSG_LEAVE_BATTLEFIELD:                    //   0               1.5
	case MSG_GUILD_BANK_LOG_QUERY:                  //   0               2
	case CMSG_LOGOUT_CANCEL:                        //   0               2
	case CMSG_REALM_SPLIT:                          //   0               2
	case CMSG_ALTER_APPEARANCE:                     //   0               2
	case CMSG_QUEST_CONFIRM_ACCEPT:                 //   0               2
	case MSG_GUILD_EVENT_LOG_QUERY:                 //   0               2.5
	case CMSG_READY_FOR_ACCOUNT_DATA_TIMES:         //   0               2.5
	case CMSG_QUESTGIVER_STATUS_MULTIPLE_QUERY:     //   0               2.5
	case CMSG_BEGIN_TRADE:                          //   0               2.5
	case CMSG_INITIATE_TRADE:                       //   0               3
	case CMSG_MESSAGECHAT:                          //   0               3.5
	case CMSG_INSPECT:                              //   0               3.5
	case CMSG_QUESTGIVER_ACCEPT_QUEST:              //   0               4
	case CMSG_QUESTLOG_REMOVE_QUEST:                //   0               4
	case CMSG_QUESTGIVER_CHOOSE_REWARD:             //   0               4
	case CMSG_CONTACT_LIST:                         //   0               5
	case CMSG_LEARN_PREVIEW_TALENTS:                //   0               6
	case CMSG_AUTOBANK_ITEM:                        //   0               6
	case CMSG_AUTOSTORE_BANK_ITEM:                  //   0               6
	case CMSG_PLAYER_VEHICLE_ENTER:                 //   0               8
	case CMSG_LEARN_PREVIEW_TALENTS_PET:            // not profiled
	case MSG_MOVE_HEARTBEAT:
	case CMSG_AREA_SPIRIT_HEALER_QUERY:             // not profiled
	case CMSG_STANDSTATECHANGE:                     // not profiled
	case MSG_RANDOM_ROLL:                           // not profiled
	case CMSG_TIME_SYNC_RESP:                       // not profiled
	case CMSG_TRAINER_BUY_SPELL:                    // not profiled
	case CMSG_FORCE_RUN_SPEED_CHANGE_ACK:           // not profiled
	case CMSG_GUILD_SET_PUBLIC_NOTE:                //   1               2         1 async db query
	case CMSG_GUILD_SET_OFFICER_NOTE:               //   1               2         1 async db query
	case CMSG_SET_CONTACT_NOTES:                    //   1               2.5       1 async db query
	case CMSG_CALENDAR_GET_CALENDAR:                //   0               1.5       medium upload bandwidth usage
	case CMSG_GUILD_BANK_QUERY_TAB:                 //   0               3.5       medium upload bandwidth usage
	case CMSG_QUERY_INSPECT_ACHIEVEMENTS:           //   0              13         high upload bandwidth usage
	case CMSG_GAMEOBJ_REPORT_USE:                   // not profiled
	case CMSG_GAMEOBJ_USE:                          // not profiled
	case MSG_PETITION_DECLINE:                      // not profiled
	case CMSG_GM_REPORT_LAG:                        //   1               3         1 async db query
	case CMSG_SPELLCLICK:                           // not profiled
	case CMSG_REMOVE_GLYPH:                         // not profiled
	case CMSG_DISMISS_CONTROLLED_VEHICLE:           // not profiled
	case CMSG_PETITION_SIGN:                        //   9               4         2 sync 1 async db queries
	case CMSG_TURN_IN_PETITION:                     //   8               5.5       2 sync db query
	case CMSG_GROUP_CHANGE_SUB_GROUP:               //   6               5         1 sync 1 async db queries
	case CMSG_PETITION_QUERY:                       //   4               3.5       1 sync db query
	case CMSG_CHAR_RACE_CHANGE:                     //   5               4         1 sync db query
	case CMSG_CHAR_CUSTOMIZE:                       //   5               5         1 sync db query
	case CMSG_CHAR_FACTION_CHANGE:                  //   5               5         1 sync db query
	case CMSG_CHAR_DELETE:                          //   4               4         1 sync db query
	case CMSG_DEL_FRIEND:                           //   7               5         1 async db query
	case CMSG_ADD_FRIEND:                           //   6               4         1 async db query
	case CMSG_CHAR_RENAME:                          //   5               3         1 async db query
	case CMSG_GMSURVEY_SUBMIT:                      //   2               3         1 async db query
	case CMSG_BUG:                                  //   1               1         1 async db query
	case CMSG_GROUP_SET_LEADER:                     //   1               2         1 async db query
	case CMSG_GROUP_RAID_CONVERT:                   //   1               5         1 async db query
	case CMSG_GROUP_ASSISTANT_LEADER:               //   1               2         1 async db query
	case CMSG_CALENDAR_ADD_EVENT:                   //  21              10         2 async db query
	case CMSG_PETITION_BUY:                         // not profiled                1 sync 1 async db queries
	case CMSG_CHANGE_SEATS_ON_CONTROLLED_VEHICLE:   // not profiled
	case CMSG_REQUEST_VEHICLE_PREV_SEAT:            // not profiled
	case CMSG_REQUEST_VEHICLE_NEXT_SEAT:            // not profiled
	case CMSG_REQUEST_VEHICLE_SWITCH_SEAT:          // not profiled
	case CMSG_REQUEST_VEHICLE_EXIT:                 // not profiled
	case CMSG_CONTROLLER_EJECT_PASSENGER:           // not profiled
	case CMSG_ITEM_REFUND:                          // not profiled
	case CMSG_SOCKET_GEMS:                          // not profiled
	case CMSG_WRAP_ITEM:                            // not profiled
	case CMSG_REPORT_PVP_AFK:                       // not profiled
	case CMSG_CHAR_CREATE:                          //   7               5         3 async db queries
	case CMSG_CHAR_ENUM:                            //  22               3         2 async db queries
	case CMSG_GMTICKET_CREATE:                      //   1              25         1 async db query
	case CMSG_GMTICKET_UPDATETEXT:                  //   0              15         1 async db query
	case CMSG_GMTICKET_DELETETICKET:                //   1              25         1 async db query
	case CMSG_GMRESPONSE_RESOLVE:                   //   1              25         1 async db query
	case CMSG_CALENDAR_UPDATE_EVENT:                // not profiled
	case CMSG_CALENDAR_REMOVE_EVENT:                // not profiled
	case CMSG_CALENDAR_COPY_EVENT:                  // not profiled
	case CMSG_CALENDAR_EVENT_INVITE:                // not profiled
	case CMSG_CALENDAR_EVENT_SIGNUP:                // not profiled
	case CMSG_CALENDAR_EVENT_RSVP:                  // not profiled
	case CMSG_CALENDAR_EVENT_REMOVE_INVITE:         // not profiled
	case CMSG_CALENDAR_EVENT_MODERATOR_STATUS:      // not profiled
	case CMSG_ARENA_TEAM_INVITE:                    // not profiled
	case CMSG_ARENA_TEAM_ACCEPT:                    // not profiled
	case CMSG_ARENA_TEAM_DECLINE:                   // not profiled
	case CMSG_ARENA_TEAM_LEAVE:                     // not profiled
	case CMSG_ARENA_TEAM_DISBAND:                   // not profiled
	case CMSG_ARENA_TEAM_REMOVE:                    // not profiled
	case CMSG_ARENA_TEAM_LEADER:                    // not profiled
	case CMSG_LOOT_METHOD:                          // not profiled
	case CMSG_GUILD_INVITE:                         // not profiled
	case CMSG_GUILD_ACCEPT:                         // not profiled
	case CMSG_GUILD_DECLINE:                        // not profiled
	case CMSG_GUILD_LEAVE:                          // not profiled
	case CMSG_GUILD_DISBAND:                        // not profiled
	case CMSG_GUILD_LEADER:                         // not profiled
	case CMSG_GUILD_MOTD:                           // not profiled
	case CMSG_GUILD_RANK:                           // not profiled
	case CMSG_GUILD_ADD_RANK:                       // not profiled
	case CMSG_GUILD_DEL_RANK:                       // not profiled
	case CMSG_GUILD_INFO_TEXT:                      // not profiled
	case CMSG_GUILD_BANK_DEPOSIT_MONEY:             // not profiled
	case CMSG_GUILD_BANK_WITHDRAW_MONEY:            // not profiled
	case CMSG_GUILD_BANK_BUY_TAB:                   // not profiled
	case CMSG_GUILD_BANK_UPDATE_TAB:                // not profiled
	case CMSG_SET_GUILD_BANK_TEXT:                  // not profiled
	case MSG_SAVE_GUILD_EMBLEM:                     // not profiled
	case MSG_PETITION_RENAME:                       // not profiled
	case MSG_TALENT_WIPE_CONFIRM:                   // not profiled
	case MSG_SET_DUNGEON_DIFFICULTY:                // not profiled
	case MSG_SET_RAID_DIFFICULTY:                   // not profiled
	case MSG_PARTY_ASSIGNMENT:                      // not profiled
	case MSG_RAID_READY_CHECK:                      // not profiled
	case CMSG_QUEST_POI_QUERY:                      //   0              25         very high upload bandwidth usage
	case CMSG_ITEM_REFUND_INFO:                     // not profiled
	{
		// "0" is a magic number meaning there's no limit for the opcode.
		// All the opcodes above must cause little CPU usage and no sync/async database queries at all
		maxPacketMSDiffAllowed = 0;
		break;
	}
	case CMSG_WHO:                                  //   0               7
	{
		maxPacketMSDiffAllowed = 60000;
		break;
	}
	case CMSG_SEND_MAIL:
	{
		maxPacketMSDiffAllowed = 10000;
		break;
	}
	}

	return maxPacketMSDiffAllowed;
}*/