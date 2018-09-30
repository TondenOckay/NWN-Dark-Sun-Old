void main()
{
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {
        if (GetArea(oPC) == OBJECT_SELF)
        {
              SetLocalLocation(oPC, "ls_stored_loc", GetLocation(oPC));

            if (Random(100) < 95)
                  AssignCommand(oPC, ActionJumpToObject(GetObjectByTag("Encounter6")));
        }
        oPC = GetNextPC();
    }
}

