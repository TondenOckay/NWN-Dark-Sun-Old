//::///////////////////////////////////////////////
//:: Name     Utility Library
//:: FileName agz_utlibfun_inc
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "agz_if_basic"
#include "agz_aolibbfi_inc"
#include "agz_pelibbfi_inc"

// Printing and logging

// Output oObject's ID, Type and Tag to the log file.
object XPrintObject(object oObject)
{string sT = "Obj Id:0x"+GetStringRight("00000000"+ObjectToString(oObject),8);
 int iAOType = GetAbstractObjectType(oObject);
 if (iAOType)
    {
     sT += " AOType:"+IntToHexString(iAOType);
     if (iAOType & AO_TYPE_EXECUTABLE)
         sT += " FCode:"+IntToHexString(GetLocalInt(oObject, AGZ_EO_CODE));
    }
 else
    sT += " Type:"+IntToHexString(GetObjectType(oObject))+" Tag:"+GetTag(oObject);
 PrintString(sT);
 return oObject;}

// Object Filters
object FilterObject(object oObject, int iTypeFilter=OBJECT_TYPE_ALL, string sTagPattern = "", int iOnlyValid=TRUE)
{
 if (iOnlyValid && !GetIsObjectValid(oObject))  return OBJECT_INVALID;
 if (!(GetObjectType(oObject) & iTypeFilter))   return OBJECT_INVALID;
 if (sTagPattern != "" && !(TestStringAgainstPattern(sTagPattern, GetTag(oObject))))
    return OBJECT_INVALID;
 return oObject;
}

object FilterCreature(object oCreature,
                      int iRacialType=RACIAL_TYPE_ALL,
                      int iClassType=CLASS_TYPE_INVALID,
                      object oFactionMember=OBJECT_INVALID)
{
 if (GetObjectType(oCreature) != OBJECT_TYPE_CREATURE)   return OBJECT_INVALID;
 if (iRacialType != RACIAL_TYPE_ALL && GetRacialType(oCreature) != iRacialType)
    return OBJECT_INVALID;
 if (iClassType != CLASS_TYPE_INVALID &&
                 GetClassByPosition(1, oCreature) != iClassType &&
                 GetClassByPosition(2, oCreature) != iClassType &&
                 GetClassByPosition(3, oCreature) != iClassType)
    return OBJECT_INVALID;
 if (oFactionMember != OBJECT_INVALID && !GetFactionEqual(oCreature, oFactionMember))
    return OBJECT_INVALID;
 return oCreature;
}


object FilterItem(object oItem,
                  int iBaseItemType=BASE_ITEM_INVALID,
                  object oPossessedBy=OBJECT_INVALID)
{
 if (GetObjectType(oItem) != OBJECT_TYPE_ITEM)   return OBJECT_INVALID;
 if (iBaseItemType != BASE_ITEM_INVALID && GetBaseItemType(oItem) != iBaseItemType)
    return OBJECT_INVALID;
 if (oPossessedBy != OBJECT_INVALID && GetItemPossessor(oItem) != oPossessedBy)
    return OBJECT_INVALID;
 return oItem;
}

// Logical filters combination

// if oFirst is not OBJECT_INVALID or zero return oFirst, else return oSecond
object OrFilter(object oFirst, object oSecond)
{
 if (oFirst != OBJECT_INVALID && oFirst != o_ZERO)  return oFirst;
 return oSecond;
}

// if oFirst and oSecond are the SAME Object, this Object is returned, else returns OBJECT_INVALID
object AndFilter(object oFirst, object oSecond)
{
 if (oFirst == oSecond && oFirst != o_ZERO)  return oFirst;
 return OBJECT_INVALID;
}

// if oFirst is not OBJECT_INVALID return OBJECT_INVALID, else return oSecond
object NotFilter(object oTest, object oObject)
{
 if (oTest != OBJECT_INVALID && oTest != o_ZERO)  return OBJECT_INVALID;
 return oObject;
}

// if oFirst is not OBJECT_INVALID return oThen, else return oElse
object IfFilter(object oCondition, object oThen, object oElse=OBJECT_INVALID)
{
 if (oCondition != OBJECT_INVALID && oCondition != o_ZERO)  return oThen;
 return oElse;
}

// Symbolic naming of Objects

// Assign an Object to a symbolic reference string, return the object
object AssignSymbol(string sSymbol, object oObject)
{XSetLocalObject(GetModule(), "agz_AOS_"+sSymbol, oObject);
 return oObject;}

// Get the Object associated to a Symbol
object GetObjectBySymbol(string sSymbol)
{return GetLocalObject(GetModule(), "agz_AOS_"+sSymbol);}

// Remove a Symbol-Object association, return the object
object UnassignSymbol(string sSymbol)
{object oOriginal = GetObjectBySymbol(sSymbol);
 XDeleteLocalObject(GetModule(), "agz_AOS_"+sSymbol);
 return oOriginal;}

//////////////////////////////////////////////////
// Manipulating Local Variables
//////////////////////////////////////////////////

// Toggle a Local Int between FALSE and TRUE
void ToggleLocalInt(object oObject, string sVarName)
{
 SetLocalInt(oObject, sVarName, !GetLocalInt(oObject, sVarName));
}

// Add a value to a Local Int
void AddToLocalInt(object oObject, string sVarName, int iValue)
{
 SetLocalInt(oObject, sVarName, GetLocalInt(oObject, sVarName) + iValue);
}


// Returns OBJECT_INVALID if the Local Int is zero, otherwise returns oObject
object HasLocalIntSet(object oObject, string sVarName)
{
 if (GetLocalInt(oObject, sVarName)) return oObject;
 return OBJECT_INVALID;
}

