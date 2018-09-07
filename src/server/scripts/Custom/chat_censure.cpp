#include "Channel.h"
#include "AccountMgr.h"
#include "WorldSession.h"


void find_and_replace(std::string& source, std::string const& find, std::string const& replace)
{
	for (std::string::size_type i = 0; (i = source.find(find, i)) != std::string::npos;)
	{
		source.replace(i, find.length(), replace);
		i += replace.length();
	}
}

class System_Censure : public PlayerScript
{
    public:
        System_Censure() : PlayerScript("System_Censure") {}

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg)
        {
            CheckMessage(player, msg, lang, NULL, NULL, NULL, NULL);
        }

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Player* receiver)
        {
            CheckMessage(player, msg, lang, receiver, NULL, NULL, NULL);
        }

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Group* group)
        {
            CheckMessage(player, msg, lang, NULL, group, NULL, NULL);
        }

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Guild* guild)
        {
            CheckMessage(player, msg, lang, NULL, NULL, guild, NULL);
        }

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Channel* channel)
        {
            CheckMessage(player, msg, lang, NULL, NULL, NULL, channel);
        }

		static char ClearForbidden(char toCheck)
		{			
			const std::string forbiddenChars = "\\/:;¿?\"<>|.,-+*#()[]{}'\"@~`^!¡&%$·¬=¨´ç_bdfhijlnñpqrtuvwxyz";
			if (forbiddenChars.find(toCheck) != std::string::npos)
			{				
				return ' ';
			}

			return toCheck;
		}

		std::string stringWithAccentsChangedToNormalLetters(const std::string& s)
		{
			std::string result;

			for (unsigned int i = 0; i < s.length(); i++)
			{
				unsigned char character = s[i];

				if (character >= 128)
				{
					if (character == 195 && i < s.length() - 1)
					{
						i++;
						unsigned char secondaryCharacter = s[i];
						std::vector<char> translation = { 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'C', 'e', 'e', 'e', 'e', 'I', 'I', 'I', 'I', 'D', 'N', 'o', 'o', 'o', 'o', 'o', 'X', 'o', 'U', 'U', 'U', 'U', 'Y', 'P', 'B', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'c', 'e', 'e', 'e', 'e', 'i', 'i', 'i', 'i', 'o', 'n', 'o', 'o', 'o', 'o', 'o', '/', 'o', 'u', 'u', 'u', 'u', 'y', 'p', 'y' };

						unsigned int index = secondaryCharacter - 128;

						if (secondaryCharacter >= 128 && index < translation.size())
						{
							result += translation[index];
						}
						else
						{
							result += '?';
						}
					}
					else
					{
						result += '?';
					}
				}
				else
				{
					result += s[i];
				}
			}
			return result;
		}

		/*
		static bool invalidChar(char c)
		{
		return !(c >= 0 && c <128);
		}
		void stripUnicode(std::wstring & str)
		{
		str.erase(std::remove_if(str.begin(), str.end(), invalidChar), str.end());
		}


		std::wstring utf8toUtf16(const std::string & str)
		{
			if (str.empty())
				return std::wstring();

			size_t charsNeeded = ::MultiByteToWideChar(CP_UTF8, 0,
				str.data(), (int)str.size(), NULL, 0);

			std::vector<wchar_t> buffer(charsNeeded);
			int charsConverted = ::MultiByteToWideChar(CP_UTF8, 0,
				str.data(), (int)str.size(), &buffer[0], buffer.size());

			return std::wstring(&buffer[0], charsConverted);
		}

		std::string NarrowString(const std::wstring& str, const char* localeName = "C")
		{
			std::string result;
			result.resize(str.size());

			std::locale loc(localeName);

			std::use_facet<std::ctype<wchar_t> >(loc).narrow(
				str.c_str(), str.c_str() + str.size(), '?', &*result.begin());

			return result;
		}

		void replace_all(std::wstring& text, const std::wstring& fnd, const std::wstring& rep)
		{
			size_t pos = text.find(fnd);
			while (pos != std::wstring::npos)
			{
				text.replace(pos, fnd.length(), rep);
				pos = text.find(fnd, pos + rep.length());
			}
		}

		static bool invalidChar(char c)
		{
			return !(c >= 0 && c <128);
		}
		void stripUnicode(std::wstring & str)
		{
			str.erase(std::remove_if(str.begin(), str.end(), invalidChar), str.end());
		}*/

    void CheckMessage(Player* player, std::string& msg, uint32 lang, Player* /*receiver*/, Group* /*group*/, Guild* /*guild*/, Channel* channel)
    {
        if (player->IsGameMaster() || lang == LANG_ADDON)
            return;

        // transform to lowercase (for simpler checking)		
				
		std::string lower = msg;
        std::transform(lower.begin(), lower.end(), lower.begin(), ::tolower);		
		lower.erase(std::remove_if(lower.begin(), lower.end(), isspace), lower.end());
		find_and_replace(lower, "{rt1}", "");
		find_and_replace(lower, "{rt2}", "");
		find_and_replace(lower, "{rt3}", "");
		find_and_replace(lower, "{rt4}", "");
		find_and_replace(lower, "{rt5}", "");
		find_and_replace(lower, "{rt6}", "");
		find_and_replace(lower, "{rt7}", "");
		find_and_replace(lower, "{rt8}", "");
		find_and_replace(lower, "{skull}", "");
		find_and_replace(lower, "{circle}", "");
		find_and_replace(lower, "{square}", "");
		find_and_replace(lower, "{star}", "");
		find_and_replace(lower, "{diamond}", "");
		find_and_replace(lower, "{triangle}", "");
		find_and_replace(lower, "{moon}", "");
		find_and_replace(lower, "{cross}", "");
		find_and_replace(lower, "@", "o");
		find_and_replace(lower, "$", "");
		find_and_replace(lower, "6", "g");
		find_and_replace(lower, "iv", "4");
		find_and_replace(lower, "lv", "4");

		const uint8 cheksSize = 29;
        std::string checks[cheksSize];
        // Strony (Sites)
        checks[0] ="http://";
        checks[1] =".com";
		checks[2] = ".c0m";
		checks[3] = ".c@m";
		checks[4] = ",com";
		checks[5] = ",c0m";
		checks[6] = "=g";
		checks[7] = "=4";
        checks[8] =".www";
        checks[9] =".net";
        checks[10] =".org";
        checks[11] ="g4wow";
		checks[12] = "g4w0w";
		checks[13] = "wow,com";
		checks[14] = "w0w,c0m";
		checks[15] = "wow,c0m";
		checks[16] = "w0w,com";
        checks[17] ="www.";
        // English curses
		checks[18] = "dalaranwow";
		checks[19] = "https://";
		checks[20] = "okogames";
		checks[21] = "0k0games";
		checks[22] = "ok0games";
		checks[23] = "0kogames";					
		checks[24] = "0k0gaes";
		checks[25] = "0kogaes";
		checks[26] = "ok0gaes";			
		checks[27] = "g4o";
		checks[28] = "g40";
		
		for (int i = 0; i < cheksSize; ++i)
		{			
			//All Checks passed until 10, then make it more strict.
			if (i >= 16)
			{				
				lower = stringWithAccentsChangedToNormalLetters(lower);
				std::transform(lower.begin(), lower.end(), lower.begin(), ClearForbidden);

				lower.erase(std::remove_if(lower.begin(), lower.end(), isspace), lower.end());				
			}
			else
			{
				lower.erase(std::remove_if(lower.begin(), lower.end(), isspace), lower.end());
			}

			if (msg.find("\\") != std::string::npos)
			{
				msg = "";
				return;
			}
			
			if (lower.find(checks[i]) != std::string::npos)
			{				
				switch (i)
				{
				case 7:
					std::transform(msg.begin(), msg.end(), msg.begin(), ::tolower);
					find_and_replace(msg, "dalaranwow", "dalaran-wow");					
					break;
				case 16:
				case 17:
				case 18:
				case 19:
				case 20:
				case 21:
				case 22:
				{							
					msg = "";
					break;
					/*std::string accountName;
					AccountMgr::GetName(player->GetSession()->GetAccountId(), accountName);
					sWorld->BanAccount(BAN_ACCOUNT, accountName, "30d", "Gold selling, probably not the account owner.", "Server");*/
				}
				default:
					break;
				}				
				msg = "";
				ChatHandler(player->GetSession()).PSendSysMessage("Dalaran-WoW filter: URL detected - not allowed.");
				return;
			}
		}		
    }
};

void AddSC_System_Censure()
{
    new System_Censure();
}