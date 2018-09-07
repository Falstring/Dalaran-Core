/*
* Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
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

/* ScriptData
Name: suspect_commandscripts
%Complete: 100
Comment: All suspect related commands
Category: commandscripts
EndScriptData */
/*
#include "AccountMgr.h"
#include "Chat.h"
#include "Language.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "ObjectAccessor.h"
#include "SuspectMgr.h"

class suspect_commandscript : public CommandScript
{
public:
	suspect_commandscript() : CommandScript("suspect_commandscript") { }

	std::vector<ChatCommand> GetCommands() const override
	{

		static std::vector<ChatCommand> suspectAddCommandTable =
		{
			{ "character", rbac::RBAC_PERM_COMMAND_SUSPECT_ADD, true, &HandleSuspectAddCharacterCommand, "" },
			{ "ip", rbac::RBAC_PERM_COMMAND_SUSPECT_ADD, true, &HandleSuspectAddIPCommand, "" },
		};
		static std::vector<ChatCommand> suspectRemoveCommandTable =
		{
			{ "character", rbac::RBAC_PERM_COMMAND_SUSPECT_REMOVE, true, &HandleSuspectRemoveCharacterCommand, "" },
			{ "ip", rbac::RBAC_PERM_COMMAND_SUSPECT_REMOVE, true, &HandleSuspectRemoveIPCommand, "" },
		};

		static std::vector<ChatCommand> suspectCommandTable =
		{
			{ "add", rbac::RBAC_PERM_COMMAND_SUSPECT_ADD, true, NULL, "", suspectAddCommandTable },
			{ "remove", rbac::RBAC_PERM_COMMAND_SUSPECT_REMOVE, true, NULL, "", suspectRemoveCommandTable },
			{ "onlinelist", rbac::RBAC_PERM_COMMAND_SUSPECT_LIST, true, &HandleSuspectOnlineListCommand, "" },
		};
		static std::vector<ChatCommand> commandTable =
		{
			{ "suspect", rbac::RBAC_PERM_COMMAND_ACCOUNT, true, NULL, "", suspectCommandTable },
		};
		return commandTable;
	}

	/// Add an suspect (Character)
	static bool HandleSuspectAddCharacterCommand(ChatHandler* handler, char const* args)
	{
		if (!*args)
			return false;

		Player* target = ObjectAccessor::FindPlayerByName(args);
		ObjectGuid::LowType targetGuid = 0;
		std::string name(args);

		if (!target)
		{
			PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_GUID_BY_NAME);
			stmt->setString(0, name);
			PreparedQueryResult resultCharacter = CharacterDatabase.Query(stmt);

			if (!resultCharacter)
			{
				handler->PSendSysMessage("No character found!");
				return false;
			}

			targetGuid = (*resultCharacter)[0].GetUInt32();
		}
		else
			targetGuid = target->GetGUID().GetCounter();

		ObjectGuid guid = ObjectGuid(HighGuid::Player, targetGuid);
		sSuspectMgr->AddSuspectInfo(guid, sWorld->GetCharacterInfo(guid));
		return true;
	}

	/// Add an suspect (IP)
	static bool HandleSuspectAddIPCommand(ChatHandler* handler, char const* args)
	{
		if (!*args)
			return false;

		char* ipStr = strtok((char*)args, "");
		if (!ipStr)
			return false;

		if (!IsIPAddress(ipStr))
		{
			handler->PSendSysMessage("Wrong IP adress!");
			return false;
		}

		std::string IP = ipStr;

		sSuspectMgr->AddSuspectIP(ipStr);
		return true;
	}

	/// Remove an suspect (Character)
	static bool HandleSuspectRemoveCharacterCommand(ChatHandler* handler, char const* args)
	{
		if (!*args)
			return false;

		Player* target = ObjectAccessor::FindPlayerByName(args);
		ObjectGuid::LowType targetGuid = 0;
		std::string name(args);

		if (!target)
		{
			PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_GUID_BY_NAME);
			stmt->setString(0, name);
			PreparedQueryResult resultCharacter = CharacterDatabase.Query(stmt);

			if (!resultCharacter)
			{
				handler->PSendSysMessage("No character found!");
				return false;
			}

			targetGuid = (*resultCharacter)[0].GetUInt32();
		}
		else
			targetGuid = target->GetGUID().GetCounter();

		ObjectGuid guid = ObjectGuid(HighGuid::Player, targetGuid);
		sSuspectMgr->RemoveSuspect(guid);
		return true;
	}

	/// Remove an suspect (IP)
	static bool HandleSuspectRemoveIPCommand(ChatHandler* handler, char const* args)
	{
		if (!*args)
			return false;

		char* ipStr = strtok((char*)args, "");
		if (!ipStr)
			return false;

		if (!IsIPAddress(ipStr))
		{
			handler->PSendSysMessage("Wrong IP adress!");
			return false;
		}

		std::string IP = ipStr;

		sSuspectMgr->RemoveSuspectIP(ipStr);
		return true;
	}

	/// Display info on suspects currently in the storage
	//static bool HandleSuspectOnlineListCommand(ChatHandler* handler, char const* /*args*/ /*)
	{
		sSuspectMgr->PrintTo(handler);
		return true;
	}
};

void AddSC_suspect_commandscript()
{
	//new suspect_commandscript();
}
*/