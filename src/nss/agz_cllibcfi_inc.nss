//::///////////////////////////////////////////////
//:: Name     Collections Library Collector Functions (Implementation)
//:: FileName agz_cllibcfi_inc
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "agz_if_basic"
#include "agz_aolibbfi_inc"
#include "agz_if_collect"

// Get all the members of oMemberOfFaction's faction
object GetAllFactionMembers(object oMemberOfFaction, int bPCOnly=TRUE, object oResult=OBJECT_INVALID)
{
 if (oResult == OBJECT_INVALID)
    oResult = EmptyList();
 object oObj = GetFirstFactionMember(oMemberOfFaction, bPCOnly);
 while (oObj != OBJECT_INVALID)
    {
     AddToCollection(oObj, oResult);
     oObj = GetNextFactionMember(oMemberOfFaction, bPCOnly);
    }
 return oResult;
}

// Get all objects within oPersistentObject
object GetAllInPersistentObject(object oPersistentObject=OBJECT_SELF, int nResidentObjectType=OBJECT_TYPE_CREATURE, object oResult=OBJECT_INVALID)
{
 if (oResult == OBJECT_INVALID)
    oResult = EmptyList();
 object oObj = GetFirstInPersistentObject(oPersistentObject, nResidentObjectType);
 while (oObj != OBJECT_INVALID)
    {
     AddToCollection(oObj, oResult);
     oObj = GetNextInPersistentObject(oPersistentObject, nResidentObjectType);
    }
 return oResult;
}

// Get all items in oTarget's inventory
object GetAllItemsInInventory(object oTarget=OBJECT_SELF, object oResult=OBJECT_INVALID)
{
 if (oResult == OBJECT_INVALID)
    oResult = EmptyList();
 object oObj = GetFirstItemInInventory(oTarget);
 while (oObj != OBJECT_INVALID)
    {
     AddToCollection(oObj, oResult);
     oObj = GetNextItemInInventory(oTarget);
    }
 return oResult;
}

// Get all the objects in oArea
object GetAllObjectsInArea(object oArea=OBJECT_INVALID, object oResult=OBJECT_INVALID)
{
 if (oResult == OBJECT_INVALID)
    oResult = EmptyList();
 object oObj = GetFirstObjectInArea(oArea);
 while (oObj != OBJECT_INVALID)
    {
     AddToCollection(oObj, oResult);
     oObj = GetNextObjectInArea(oArea);
    }
 return oResult;
}

// Get all the objects in nShape
object GetAllObjectsInShape(int nShape,
                            float fSize,
                            location lTarget,
                            int bLineOfSight=FALSE,
                            int nObjectFilter=OBJECT_TYPE_CREATURE,
                            vector vOrigin=[0.0,0.0,0.0],
                            object oResult=OBJECT_INVALID)
{
 if (oResult == OBJECT_INVALID)
    oResult = EmptyList();
 object oObj = GetFirstObjectInShape(nShape, fSize, lTarget,
                                     bLineOfSight, nObjectFilter, vOrigin);
 while (oObj != OBJECT_INVALID)
    {
     AddToCollection(oObj, oResult);
     oObj = GetNextObjectInShape(nShape, fSize, lTarget,
                                 bLineOfSight, nObjectFilter, vOrigin);
    }
 return oResult;
}

// Get all the PC in the player list
object GetAllPCs(object oResult=OBJECT_INVALID)
{
 if (oResult == OBJECT_INVALID)
    oResult = EmptyList();
 object oObj = GetFirstPC();
 while (oObj != OBJECT_INVALID)
    {
     AddToCollection(oObj, oResult);
     oObj = GetNextPC();
    }
 return oResult;
}

// Get all the objects with the specified tag
object GetAllObjectsByTag(string sTag, object oResult=OBJECT_INVALID)
{
 if (oResult == OBJECT_INVALID)
    oResult = EmptyList();
 int iN = 0;
 object oObj = GetObjectByTag(sTag, iN);
 while (oObj != OBJECT_INVALID)
    {
     AddToCollection(oObj, oResult);
     iN++;
     oObj = GetObjectByTag(sTag, iN);
    }
 return oResult;
}



