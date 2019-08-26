/*******************************************************************************
* Description:  OnAreaTransitionClick script for Dark Sun
  Usage:        This script should be added to all doors within areas that
                incur HTF penalties to ensure that the door used to exit
                the area is stored as a variable on the player's token. Add to
                the OnAreaTransitionClicked event.
********************************************************************************
* Created By:   Melanie Graham (Nairn)
* Created On:   2019-04-15
*******************************************************************************/
#include "dksn_h2_addons_i"

void main()
{

    object oClicker = GetClickingObject();

    if (GetIsPC(oClicker) == TRUE) {
        // Added to support Dark Sun's Hard Core Rule additions
        SetLocalString(GetItemPossessedBy(oClicker, PLAYER_TOKEN), GetResRef(GetArea(OBJECT_SELF)) + "_ExitPoint", GetTag(GetNearestObject(OBJECT_TYPE_DOOR, oClicker)));
    }

    ExecuteScript("NW_G0_Transition.nss", OBJECT_SELF);

}
