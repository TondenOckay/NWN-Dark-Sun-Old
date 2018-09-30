// Put this under "Actions Taken" in the conversation editor.


void main()
{
    // Get the PC who is in this conversation.
    object oPC = GetPCSpeaker();

    // If the PC has the item "NW_IT_BOOK001".
    if ( GetItemPossessedBy(oPC, "NW_IT_BOOK001") != OBJECT_INVALID )
    {
        // Take "NW_IT_BOOK001" from the PC.
        DestroyObject(GetItemPossessedBy(oPC, "NW_IT_BOOK001"));

        // Give 50 experience to the PC.
        GiveXPToCreature(oPC, 50);
        CreateItemOnObject("wswmsc006", oPC);
    }
}
