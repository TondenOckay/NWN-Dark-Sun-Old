/* onexit script:
This script is placed in the onexit event handler for each area.
Its purpose is to check for the presence of remaining pc's in
and area and if it finds none then it activates a delayed call
to an areacleanup script which cleans the area
*/

void main()
{
    float cleanupdelay = 30.0;  //if you change this it alters how long before
    // the area cleans up, if you do change it INCLUDE THE DECIMAL, or it won't
    // work
    if(!GetIsPC(GetExitingObject()) ) {
        return; }
    object oPC = GetExitingObject();
    if (!GetIsPC(oPC))
        return;
    oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        if (OBJECT_SELF == GetArea(oPC))
            return;
        else oPC = GetNextPC();
    }
    DelayCommand(cleanupdelay, ExecuteScript("areacleanup", OBJECT_SELF));
}
