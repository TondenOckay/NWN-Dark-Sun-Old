//
//   NESS
//   Patrol Scripts v8.1.3
//
//
#include "spawn_functions"
//
object GetChildByTag(object oSpawn, string sChildTag);
object GetChildByNumber(object oSpawn, int nChildNum);
object GetSpawnByID(int nSpawnID);
void DeactivateSpawn(object oSpawn);
void DeactivateSpawnsByTag(string sSpawnTag);
void DeactivateAllSpawns();
void DespawnChildren(object oSpawn);
void DespawnChildrenByTag(object oSpawn, string sSpawnTag);
//
//
void main()
{
    // Retrieve Script Number
    int nPatrolScript = GetLocalInt(OBJECT_SELF, "PatrolScript");

    // Retrieve Stop Information
    int nStopNumber = GetLocalInt(OBJECT_SELF, "PR_NEXTSTOP");
    object oStop = GetLocalObject(OBJECT_SELF, "PR_SN" + PadIntToString(nStopNumber, 2));

    // Invalid Script
    if (nPatrolScript == -1)
    {
        return;
    }

//
// Only Make Modifications Between These Lines
// -------------------------------------------


    // Script 000
    if (nPatrolScript == 0)
    {
        ActionDoCommand(SpeakString("Work faster or i will beat you to death."));
        ActionWait(3.0);
        ActionDoCommand(SpeakString("Better hope you maggets don't die today or i'll feed you to the hound's."));
        ActionWait(3.0);
    }
    //

    // Turn Off Lights 007
    if (nPatrolScript == 7)
    {
        object oLight = GetNearestObjectByTag("Light", oStop);
        if ((GetIsDay() == TRUE && GetPlaceableIllumination(oLight) == TRUE)
         || (GetIsNight() == TRUE && GetPlaceableIllumination(oLight) == FALSE))
        {
            ActionDoCommand(DoPlaceableObjectAction(oLight, PLACEABLE_ACTION_USE));
        }
    }
    //

    // Script 001
    if (nPatrolScript == 1)
    {
        ActionMoveToObject(GetNearestObjectByTag("DS_CITYRUBBLE1"));
        ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0);

    }
    //

    //Script 002
    if (nPatrolScript == 2)
    {
      ActionMoveToObject(GetNearestObjectByTag("ds_plc_wagon"));
      ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 3.0);
    }
    //

    // Script 003
    if (nPatrolScript == 3)
    {
        ActionMoveToObject(GetNearestObjectByTag("DS_CITYRUBBLE2"));
        ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0);
    }
    //

    //Script 004
    if (nPatrolScript == 4)
    {
      ActionMoveToObject(GetNearestObjectByTag("ds_plc_wagon"));
      ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 3.0);
    }
    //

    // Script 005
    if (nPatrolScript == 5)
    {
        ActionMoveToObject(GetNearestObjectByTag("DS_CITYRUBBLE3"));
        ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0);
    }
    //

    //Script 006
    if (nPatrolScript == 6)
    {
      ActionMoveToObject(GetNearestObjectByTag("ds_plc_wagon"));
      ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 3.0);
    }
    //

    // Script 007
    if (nPatrolScript == 7)
    {
        ActionMoveToObject(GetNearestObjectByTag("DS_CITYRUBBLE4"));
        ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0);
    }
    //

    //Script 008
    if (nPatrolScript == 8)
    {
      ActionMoveToObject(GetNearestObjectByTag("ds_plc_wagon2"));
      ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 3.0);
    }
    //

    // Script 009
    if (nPatrolScript == 9)
    {
        ActionMoveToObject(GetNearestObjectByTag("DS_CITYRUBBLE5"));
        ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0);
    }
    //

    //Script 010
    if (nPatrolScript == 10)
    {
      ActionMoveToObject(GetNearestObjectByTag("ds_plc_wagon2"));
      ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 3.0);
    }
    //

    // Script 011
    if (nPatrolScript == 11)
    {
        ActionMoveToObject(GetNearestObjectByTag("DS_CITYRUBBLE6"));
        ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0);
    }
    //

    //Script 012
    if (nPatrolScript == 12)
    {
      ActionMoveToObject(GetNearestObjectByTag("ds_plc_wagon2"));
      ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 3.0);
    }
    //

     //Script 013
    if (nPatrolScript == 13)
    {
      ActionMoveToObject(GetNearestObjectByTag("CampfirewithSpit"));
      ActionDoCommand(SetFacingPoint(GetPosition(GetNearestObjectByTag("CampfirewithSpit"))));
      ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 10.0);
    }
    //

    //Script 014
    if (nPatrolScript == 14)
    {
       ActionMoveToObject(GetNearestObjectByTag("CampfireCauldron"));
       ActionDoCommand(SetFacingPoint(GetPosition(GetNearestObjectByTag("CampfireCauldron"))));
       ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 10.0);
    }
// -------------------------------------------
// Only Make Modifications Between These Lines
//

}
