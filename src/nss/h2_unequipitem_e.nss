/*
Filename:           h2_unequipitem_e
System:             core (module player unequip item event script)
Author:             Edward Beck (0100010)
Date Created:       Jun. 12, 2006
Summary:
HCR2 OnPlayerUnEquipItem Event.
This script should be attachted to the OnPlayerUnEquipItem event under
the scripts tab of Module properties.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

#include "h2_core_i"

void main()
{
    h2_RunModuleEventScripts(H2_EVENT_ON_PLAYER_UNEQUIP_ITEM);
}
