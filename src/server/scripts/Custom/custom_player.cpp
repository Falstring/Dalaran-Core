#include "ScriptMgr.h"

/// @todo: robinsch - remove this is a proper spell stacking system is written

enum Spells
{
    SPELL_RAMPAGE            = 29801,
    SPELL_LEADER_OF_THE_PACK = 24932
};

static int SpellsToCheck[] = { SPELL_RAMPAGE, SPELL_LEADER_OF_THE_PACK };

class TalentSpecializationChange : public PlayerScript
{
    public:
        TalentSpecializationChange() : PlayerScript("custom_player") { }

        void OnTalentSpecializationChange(Player* player)
        {
            for (uint32 entry : SpellsToCheck)
            {
                bool remove = false;
                uint32 stack = 0;
                Unit::AuraApplicationMap& auras = player->GetAppliedAuras();
                for (Unit::AuraApplicationMap::iterator i = auras.begin(); i != auras.end(); ++i)
                {
                    if (entry != i->second->GetBase()->GetId())
                        continue;

                    ++stack;
                    if (stack > 1)
                    {
                        player->RemoveAura(i, AURA_REMOVE_BY_DEFAULT);
                        break;
                    }

                    if (i == auras.end())
                        break;
                }
            }
        }
};

void AddSC_custom_player()
{
    new TalentSpecializationChange();
}