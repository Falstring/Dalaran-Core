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

/*#ifndef __SUSPECT_H
#define __SUSPECT_H

#include "Common.h"
#include "Player.h"
#include "World.h"
#include "WorldSession.h"
#include "Chat.h"

typedef std::unordered_map<uint16, PacketCounter> PacketThrottlingMap;

struct SuspectInfo
{
	SuspectInfo() {}
	SuspectInfo(CharacterInfo const* characterInfo) : CharInfo(characterInfo) {}

	CharacterInfo const* CharInfo;
	PacketThrottlingMap PacketThrottlingMap;
	std::vector<Opcodes> SuspectedOpcodes;
};

class SuspectMgr
{
public:
	static SuspectMgr* instance()
	{
		static SuspectMgr instance;
		return &instance;
	}

	void AddSuspectInfo(ObjectGuid guid, CharacterInfo const* charInfo) { _suspects[guid].CharInfo = charInfo; }
	//void AddSuspect(ObjectGuid guid, SuspectInfo suspectInfo) { _suspects.insert(std::pair<ObjectGuid, SuspectInfo>(guid, suspectInfo)); }
	void AddSuspectedOpcode(ObjectGuid guid, Opcodes opcode) { _suspects[guid].SuspectedOpcodes.push_back(opcode); }
	void RemoveSuspect(ObjectGuid guid);
	//bool IsSuspect(ObjectGuid guid) const { return _suspects.find(guid) != _suspects.end(); }
	bool IsSuspectedForOpcode(ObjectGuid guid, Opcodes opcode) const;

	void AddSuspectIP(std::string remoteAdress) { _suspectsIP.push_back(remoteAdress); }
	void RemoveSuspectIP(std::string remoteAdress) { _suspectsIP.erase(std::remove(_suspectsIP.begin(), _suspectsIP.end(), remoteAdress), _suspectsIP.end()); }
	bool IsSuspectIP(std::string remoteAdress) const { return std::find(_suspectsIP.begin(), _suspectsIP.end(), remoteAdress) != _suspectsIP.end(); }

	void OnOpcode(Player* player, Opcodes opcode, uint32 time);
	void PrintTo(ChatHandler* handler);

	uint32 GetMaxPacketCounterAllowed(uint16 opcode) const;
	uint32 GetMaxPacketMSDiffAllowed(uint16 opcode) const;

private:
	SuspectMgr() {};
	~SuspectMgr() {};

	typedef std::unordered_map<ObjectGuid, SuspectInfo> SuspectsMap;
	SuspectsMap _suspects;

	typedef std::vector<std::string> SuspectsIPVector;
	SuspectsIPVector _suspectsIP;
};

#define sSuspectMgr SuspectMgr::instance()
#endif*/