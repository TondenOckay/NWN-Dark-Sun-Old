/*
Filename:           h2_resttrigent_e
System:             player rest (trigger on enter event script)
Author:             Edward Beck (0100010)
Date Created:       Sept. 13th, 2006
Summary:

h2_resttrigent_e script. This script should be placed in the on enter event
of a trigger that defines an allowable resting zone.

Paint the trigger on the ground and assign variables to it
as covered in the player rest documentation.

Setting an integer variable named H2_IGNORE_MINIMUM_REST_TIME to TRUE
will cause the minimum rest time restrictin to be ignored.

Set a string variable named H2_REST_FEEDBACK to a text message that you want displayed
to the PC when they rest in within that trigger.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/


#include "h2_pcrest_i"

void main()
{
    object oPC = GetEnteringObject();
    SetLocalObject(oPC, H2_REST_TRIGGER, OBJECT_SELF);
}
