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

#include "ScriptMgr.h"
#include "Channel.h"
#include "Guild.h"
#include "Group.h"

const uint8 AccountsSize = 19;
uint32 AccountsToCheck[AccountsSize] = { 338, 28544, 145766, 157262, 11368, 1997, 155756, 80639, 149001, 4563, 245332, 264259, 276127, 274791, 298266, 298265, 4782, 24601, 57390 };

const uint8 GuildsSize = 1;
uint32 GuildsToCheck[GuildsSize] = { 17 };

class ChatLogScript : public PlayerScript
{
    public:
        ChatLogScript() : PlayerScript("ChatLogScript") { }

        void OnChat(Player* player, uint32 type, uint32 lang, std::string& msg) override
        {

			if (lang == LANG_ADDON)
				return;

			bool playerFound = false;

			if (player)
			{
				for (uint8 i = 0; i < AccountsSize; i++)
				{
					if (player->GetSession()->GetAccountId() == AccountsToCheck[i])
					{
						playerFound = true;
						break;
					}
				}
			}

			if (!playerFound)
				return;

            switch (type)
            {
                case CHAT_MSG_SAY:
                    TC_LOG_DEBUG("chat.log.say", "%s - Player %s says (language %u): %s",
						TimeToTimestampStrNewFormat(time(NULL)), player->GetName().c_str(), lang, msg.c_str());
                    break;

                case CHAT_MSG_EMOTE:
                    TC_LOG_DEBUG("chat.log.emote", "Player %s emotes: %s",
                        player->GetName().c_str(), msg.c_str());
                    break;

                case CHAT_MSG_YELL:
                    TC_LOG_DEBUG("chat.log.yell", "%s - Player %s yells (language %u): %s",
						TimeToTimestampStrNewFormat(time(NULL)), player->GetName().c_str(), lang, msg.c_str());
                    break;
            }
        }

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Player* receiver) override
        {

			if (lang == LANG_ADDON)
				return;

			bool playerFound = false;

			if (player && receiver)
			{
				for (uint8 i = 0; i < AccountsSize; i++)
				{
					if (player->GetSession()->GetAccountId() == AccountsToCheck[i] || receiver->GetSession()->GetAccountId() == AccountsToCheck[i])
					{
						playerFound = true;
						break;
					}
				}
			}

			if (!playerFound)
				return;

            if (lang != LANG_ADDON)
                TC_LOG_DEBUG("chat.log.whisper", "%s - Player %s tells %s: %s",
				TimeToTimestampStrNewFormat(time(NULL)), player->GetName().c_str(), receiver ? receiver->GetName().c_str() : "<unknown>", msg.c_str());
            else
                TC_LOG_DEBUG("chat.log.addon.whisper", "Player %s tells %s: %s",
                    player->GetName().c_str(), receiver ? receiver->GetName().c_str() : "<unknown>", msg.c_str());
        }

        void OnChat(Player* player, uint32 type, uint32 lang, std::string& msg, Group* group) override
        {

			if (lang == LANG_ADDON)
				return;

			Group::MemberSlotList const& members = group->GetMemberSlots();
			bool playerFound = false;

			for (Group::MemberSlotList::const_iterator itr = members.begin(); itr != members.end(); itr++)
			{

				Player* p = ObjectAccessor::FindPlayer((*itr).guid);

				if (p)
				{
					for (uint8 i = 0; i < AccountsSize; i++)
					{
						if (p->GetSession()->GetAccountId() == AccountsToCheck[i])
						{
							playerFound = true;
							break;
						}
					}
				}

				if (playerFound)
					break;
			}

			if (!playerFound)
				return;

            //! NOTE:
            //! LANG_ADDON can only be sent by client in "PARTY", "RAID", "GUILD", "BATTLEGROUND", "WHISPER"
            switch (type)
            {
                case CHAT_MSG_PARTY:
                    if (lang != LANG_ADDON)
                        TC_LOG_DEBUG("chat.log.party", "%s - Player %s tells group with leader %s: %s",
						TimeToTimestampStrNewFormat(time(NULL)), player->GetName().c_str(), group ? group->GetLeaderName() : "<unknown>", msg.c_str());
                    else
                        TC_LOG_DEBUG("chat.log.addon.party", "Player %s tells group with leader %s: %s",
                            player->GetName().c_str(), group ? group->GetLeaderName() : "<unknown>", msg.c_str());
                    break;

                case CHAT_MSG_PARTY_LEADER:
                    TC_LOG_DEBUG("chat.log.party", "%s - Leader %s tells group: %s",
						TimeToTimestampStrNewFormat(time(NULL)), player->GetName().c_str(), msg.c_str());
                    break;

                case CHAT_MSG_RAID:
                    if (lang != LANG_ADDON)
                        TC_LOG_DEBUG("chat.log.raid", "%s, Player %s tells raid with leader %s: %s",
						TimeToTimestampStrNewFormat(time(NULL)), player->GetName().c_str(), group ? group->GetLeaderName() : "<unknown>", msg.c_str());
                    else
                        TC_LOG_DEBUG("chat.log.addon.raid", "Player %s tells raid with leader %s: %s",
                            player->GetName().c_str(), group ? group->GetLeaderName() : "<unknown>", msg.c_str());
                    break;

                case CHAT_MSG_RAID_LEADER:
                    TC_LOG_DEBUG("chat.log.raid", "%s - Leader player %s tells raid: %s",
						TimeToTimestampStrNewFormat(time(NULL)), player->GetName().c_str(), msg.c_str());
                    break;

                case CHAT_MSG_RAID_WARNING:
                    TC_LOG_DEBUG("chat.log.raid", "%s - Leader player %s warns raid with: %s",
						TimeToTimestampStrNewFormat(time(NULL)), player->GetName().c_str(), msg.c_str());
                    break;

                case CHAT_MSG_BATTLEGROUND:
                    if (lang != LANG_ADDON)
                        TC_LOG_DEBUG("chat.log.bg", "%s - Player %s tells battleground with leader %s: %s",
						TimeToTimestampStrNewFormat(time(NULL)), player->GetName().c_str(), group ? group->GetLeaderName() : "<unknown>", msg.c_str());
                    else
                        TC_LOG_DEBUG("chat.log.addon.bg", "Player %s tells battleground with leader %s: %s",
                            player->GetName().c_str(), group ? group->GetLeaderName() : "<unknown>", msg.c_str());
                    break;

                case CHAT_MSG_BATTLEGROUND_LEADER:
                    TC_LOG_DEBUG("chat.log.bg", "%s - Leader player %s tells battleground: %s",
						TimeToTimestampStrNewFormat(time(NULL)), player->GetName().c_str(), msg.c_str());
                    break;
            }
        }

        void OnChat(Player* player, uint32 type, uint32 lang, std::string& msg, Guild* guild) override
        {		
			if (lang == LANG_ADDON)
				return;

			bool guildFound = false;

			for (uint8 i = 0; i < GuildsSize; i++)
			{
				if (GuildsToCheck[i] == guild->GetId())
				{
					guildFound = true;
					break;
				}
			}

			if (!guildFound)
				return;

            switch (type)
            {
                case CHAT_MSG_GUILD:
                    if (lang != LANG_ADDON)
                        TC_LOG_DEBUG("chat.log.guild", "%s - Player %s tells guild %s: %s",
						TimeToTimestampStrNewFormat(time(NULL)), player->GetName().c_str(), guild ? guild->GetName().c_str() : "<unknown>", msg.c_str());
                    else
                        TC_LOG_DEBUG("chat.log.addon.guild", "Player %s sends to guild %s: %s",
                            player->GetName().c_str(), guild ? guild->GetName().c_str() : "<unknown>", msg.c_str());
                    break;

                case CHAT_MSG_OFFICER:
                    TC_LOG_DEBUG("chat.log.guild.officer", "%s - Player %s tells guild %s officers: %s",
						TimeToTimestampStrNewFormat(time(NULL)), player->GetName().c_str(), guild ? guild->GetName().c_str() : "<unknown>", msg.c_str());
                    break;
            }
        }

        void OnChat(Player* player, uint32 /*type*/, uint32 /*lang*/, std::string& msg, Channel* channel) override
        {
			return; // Do not log these channels.

            bool isSystem = channel &&
                            (channel->HasFlag(CHANNEL_FLAG_TRADE) ||
                             channel->HasFlag(CHANNEL_FLAG_GENERAL) ||
                             channel->HasFlag(CHANNEL_FLAG_CITY) ||
                             channel->HasFlag(CHANNEL_FLAG_LFG));

            if (isSystem)
                TC_LOG_DEBUG("chat.log.system", "Player %s tells channel %s: %s",
                    player->GetName().c_str(), channel->GetName().c_str(), msg.c_str());
            else
            {
                std::string channelName = channel ? channel->GetName() : "<unknown>";
                TC_LOG_DEBUG("chat.log.channel." + channelName, "Player %s tells channel %s: %s",
                    player->GetName().c_str(), channelName.c_str(), msg.c_str());
            }
        }
};

void AddSC_chat_log()
{
    new ChatLogScript();
}
