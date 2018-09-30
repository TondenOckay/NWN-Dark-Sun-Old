void main()
{
       object oPC = GetEnteringObject();

    // Only fire for (real) PCs.
    if ( !GetIsPC(oPC)  ||  GetIsDMPossessed(oPC) )
        return;
    while (GetIsObjectValid(oPC))
    {
        if (GetArea(oPC) == OBJECT_SELF)
        {
              SetLocalLocation(oPC, "ls_stored_loc", GetLocation(oPC));

            if (Random(100) < 65)
                  AssignCommand(oPC, ActionJumpToObject(GetObjectByTag("Encounter6")));
        }
        oPC = GetNextPC();
    }
}

