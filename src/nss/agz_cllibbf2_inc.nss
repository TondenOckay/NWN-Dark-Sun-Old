//:://////////////////////////////////////////////////////////////
//:: Name     Collections Library Basic Functions
//::          part 2
//:: FileName agz_cllibbf2_inc
//:://////////////////////////////////////////////////////////////
/*
    agz 20030927 0.19.02 - a few new common functions
    agz 20030927 0.19.02 - Array Collection sub-type
    agz 20031003 0.19.03 - LabeledList Collection sub-type
    agz 20040101 0.20.02 - added GetArrayCurrentTop
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "agz_if_basic"
#include "agz_aolibbfi_inc"
#include "agz_if_collect"
#include "agz_if_collect2"

// PRIVATE FUNCTIONS


// PUBLIC FUNCTIONS

// Additional common Collection functions

// Get the nth Object in Collection, sets the iteration pointer to that Object
object GetNthObjectInCollection(object oCollection, int nPosition, object oCursor=OBJECT_INVALID)
{
 if (!(GetLocalInt(oCollection, AGZ_AO) & AO_TYPE_COLLECTION))
    return nPosition == 1 ? oCollection : OBJECT_INVALID;
 if (oCursor == OBJECT_INVALID) oCursor = oCollection;
 if (nPosition < 1) {
    SetLocalInt(oCursor, AGZ_CURSOR, 0);
    return OBJECT_INVALID;
    }
 int nTop = GetLocalInt(oCollection, AGZ_TOP);
 if (nPosition > GetLocalInt(oCollection, AGZ_TALLY)) {
    SetLocalInt(oCursor, AGZ_CURSOR, ++nTop);
    return OBJECT_INVALID;
    }
 object oResult;
 int nX;
 for (; nPosition; nPosition--) {
     while (nX < nTop &&
           (oResult=GetLocalObject(oCollection, IntToString(++nX))) == OBJECT_INVALID)
        {}
    }
 SetLocalInt(oCursor, AGZ_CURSOR, nX);
 return oResult;
}

// Get the pointer that was last reached by a Get* with oCursor
int GetCurrentPointerInCollection(object oCollection, object oCursor=OBJECT_INVALID)
{
 if (!(GetLocalInt(oCollection, AGZ_AO) & AO_TYPE_COLLECTION))
    return 0;
 if (oCursor == OBJECT_INVALID) oCursor = oCollection;
 return GetLocalInt(oCursor, AGZ_CURSOR);
}

// Set the pointer used to iterate on a Collection to point to a given slot
object SetCurrentPointerInCollection(object oCollection, int nPointer, object oCursor=OBJECT_INVALID)
{
 if (!(GetLocalInt(oCollection, AGZ_AO) & AO_TYPE_COLLECTION))
    return OBJECT_INVALID;
 if (oCursor == OBJECT_INVALID) oCursor = oCollection;
 if (nPointer < 1) {
    SetLocalInt(oCursor, AGZ_CURSOR, 0);
    return OBJECT_INVALID;
    }
 int nTop = GetLocalInt(oCollection, AGZ_TOP);
 if (nPointer > nTop) {
    SetLocalInt(oCursor, AGZ_CURSOR, ++nTop);
    return OBJECT_INVALID;
    }
 SetLocalInt(oCursor, AGZ_CURSOR, nPointer);
 return GetLocalObject(oCollection, IntToString(nPointer));
}

// Plain-Array specific functions

// Create an Array with a given Maximum Index
object ArrayNew(int nMaxIndex = agz_CL_DEFAULT_ARRAY_MAXINDEX)
{object oArray = CreateAbstractObject(AO_SUBTYPE_ARRAY);
 SetLocalInt(oArray, AGZ_MAXINDEX, nMaxIndex);
 return oArray;}

// Check if Collection is an Array
int GetIsArray(object oCollection)
{return (GetLocalInt(oCollection, AGZ_AO) == AO_SUBTYPE_ARRAY);}

// Check if oCollection is anArray, return oCollection if yes, OBJECT_INVALID if no
object IsArray(object oCollection)
{if (GetLocalInt(oCollection, AGZ_AO) == AO_SUBTYPE_ARRAY)
    return oCollection;
 return OBJECT_INVALID;}

// Get an Object from an Array at a given index
object ArrayGet(object oArray, int nIndex)
{
 if (GetLocalInt(oArray, AGZ_AO) & AO_TYPE_COLLECTION)
    return GetLocalObject(oArray, IntToString(nIndex));
 if (nIndex == 1)
    return oArray;
 return OBJECT_INVALID;
}

// Put an Object into an Array at a given index
object ArrayPut(object oArray, int nIndex, object oNew)
{
 if (oNew == OBJECT_INVALID)
    {ArrayDel(oArray, nIndex);
     return OBJECT_INVALID;
    }
 if (GetLocalInt(oArray, AGZ_AO) != AO_SUBTYPE_ARRAY)
    {if (agz_LOG_EXCEPTIONS)
         agz_Log("ArrayPut 1st argument:"+
                    ObjectToString(oArray)+" not an Array");
     return oNew;
    }
 int nTop = GetLocalInt(oArray, AGZ_TOP);
 if (nIndex < 1 ||
     (nIndex > GetLocalInt(oArray, AGZ_MAXINDEX) &&
      nIndex > nTop))
    {if (agz_LOG_EXCEPTIONS)
         agz_Log("ArrayPut in:"+ObjectToString(oArray)+
                    " index out of bounds:"+IntToString(nIndex));
     return oNew;
    }
 string sVarName = IntToString(nIndex);
 int nTallyChange;
 object oOld = GetLocalObject(oArray, sVarName);
 if (oOld != OBJECT_INVALID) {
     nTallyChange--;
     if (GetLocalInt(oOld, AGZ_AO))
        {int iCount = GetLocalInt(oOld, AGZ_REF_COUNT) - 1;
         SetLocalInt(oOld, AGZ_REF_COUNT, iCount);
         if (iCount < 1)
            AssignCommand(oOld, ConditionallyPurgeSelf());}
    }
 SetLocalObject(oArray, sVarName, oNew);
 if (GetLocalInt(oNew, AGZ_AO))
    SetLocalInt(oNew, AGZ_REF_COUNT,GetLocalInt(oNew, AGZ_REF_COUNT) + 1);
 if (nIndex > nTop)
    SetLocalInt(oArray, AGZ_TOP, nIndex);
 if (++nTallyChange)
     SetLocalInt(oArray,AGZ_TALLY, GetLocalInt(oArray,AGZ_TALLY) + 1);
 return oNew;
}

// Delete an Object from an Array at a given index
object ArrayDel(object oArray, int nIndex)
{
 if (GetLocalInt(oArray, AGZ_AO) != AO_SUBTYPE_ARRAY)
    {if (agz_LOG_EXCEPTIONS)
         agz_Log("ArrayDel 1st argument:"+
                    ObjectToString(oArray)+" not an Array");
     return OBJECT_INVALID;
    }
 string sVarName = IntToString(nIndex);
 object oOld = GetLocalObject(oArray, sVarName);
 DeleteLocalObject(oArray, sVarName);
 if (oOld == OBJECT_INVALID)
    return OBJECT_INVALID;
 if (GetLocalInt(oOld, AGZ_AO))
    {int iCount = GetLocalInt(oOld, AGZ_REF_COUNT) - 1;
     SetLocalInt(oOld, AGZ_REF_COUNT, iCount);
     if (iCount < 1)
        AssignCommand(oOld, ConditionallyPurgeSelf());
    }
 int nTop = GetLocalInt(oArray, AGZ_TOP);
 if (nIndex == nTop)    // shrink down
    {
     while (nTop && GetLocalObject(oArray, IntToString(--nTop)) == OBJECT_INVALID)
            {}  // do nothing
     SetLocalInt(oArray, AGZ_TOP, nTop);
    }
 // decrease tally
 SetLocalInt(oArray, AGZ_TALLY, GetLocalInt(oArray, AGZ_TALLY) - 1);
 return oOld;
}

// Copy a Collection asArray
object CopyCollectionAsArray(object oCollection)
{return AddAllToCollection(oCollection, ArrayNew());}

// returns the MaxIndex setting of Array
int GetArrayMaxIndex(object oArray)
{return GetLocalInt(oArray, AGZ_MAXINDEX);}

// sets the MaxIndex value of an Array, returns nMaxIndex
int SetArrayMaxIndex(object oArray, int nMaxIndex)
{
 if (GetLocalInt(oArray, AGZ_AO) == AO_SUBTYPE_ARRAY) {
    SetLocalInt(oArray, AGZ_MAXINDEX, nMaxIndex);
    return nMaxIndex;
    }
 return 0;
}

// agz 20040101 0.20.02 - function added
// returns the current Top index of an Array
int GetArrayCurrentTop(object oArray)
{
 if (GetLocalInt(oArray, AGZ_AO) & AO_TYPE_COLLECTION)
    return GetLocalInt(oArray, AGZ_TOP);
 if (oArray == OBJECT_INVALID) return 0;
 return 1;
}


// LabeledList specific functions

// Create a LabeledList
object LabeledListNew()
{return CreateAbstractObject(AO_SUBTYPE_LABELEDLIST);}

// Check if Collection is a LabeledList
int GetIsLabeledList(object oCollection)
{return (GetLocalInt(oCollection, AGZ_AO) == AO_SUBTYPE_LABELEDLIST);}

// Check if oCollection is a LabeledList, return oCollection if yes, OBJECT_INVALID if no
object IsLabeledList(object oCollection)
{if (GetLocalInt(oCollection, AGZ_AO) == AO_SUBTYPE_LABELEDLIST)
    return oCollection;
 return OBJECT_INVALID;}

// add oNew at the end of the LabeledList, setting sLabel to point at it
object LabeledListAddWithLabel(object oLabeledList, string sLabel, object oNew)
{if (GetLocalInt(oLabeledList, AGZ_AO) != AO_SUBTYPE_LABELEDLIST)
    {if (agz_LOG_EXCEPTIONS)
         agz_Log("LabeledListAddWithLabel 1st argument:"+
                    ObjectToString(oLabeledList)+" not a LabeledList");
     return oNew;
    }
// if (GetStringLeft(sLabel,3) == "agz")
//    {if (agz_LOG_EXCEPTIONS)
//         agz_Log("LabeledListAddWithLabel error: Label must not begin with 'agz'");
//     return oNew;
//    }
 if (oNew == OBJECT_INVALID)       // ignore OBJECT_INVALID
     return OBJECT_INVALID;
 int nTallyChange;
 string sVarName;
 int nTop = GetLocalInt(oLabeledList, AGZ_TOP);
// find existing Object
 if (sLabel != "") {
     int iX = GetLocalInt(oLabeledList, sLabel);
     if (iX) {
         nTallyChange--;
         object oOld = GetLocalObject(oLabeledList, sVarName = IntToString(iX));
         DeleteLocalObject(oLabeledList, sVarName);
         DeleteLocalString(oLabeledList, sVarName); // remove label backreference
         if (GetLocalInt(oOld, AGZ_AO)) {
             int iCount = GetLocalInt(oOld, AGZ_REF_COUNT) - 1;
             SetLocalInt(oOld, AGZ_REF_COUNT, iCount);
             if (iCount < 1)
                AssignCommand(oOld, ConditionallyPurgeSelf());
            }
         if (iX == nTop) {    // shrink down
             while (nTop && GetLocalObject(oLabeledList, IntToString(--nTop)) == OBJECT_INVALID)
                {}
             SetLocalInt(oLabeledList, AGZ_TOP, nTop);
            }
         }
     }
 // add new object
 SetLocalObject(oLabeledList, sVarName = IntToString(++nTop), oNew);
 if (sLabel != "") {
     SetLocalString(oLabeledList, sVarName, sLabel);
     SetLocalInt(oLabeledList, sLabel, nTop);
     }
 SetLocalInt(oLabeledList, AGZ_TOP, nTop);
 if (GetLocalInt(oNew, AGZ_AO))
    SetLocalInt(oNew, AGZ_REF_COUNT, GetLocalInt(oNew, AGZ_REF_COUNT) + 1);
 // adjust tally
 if (++nTallyChange)
    SetLocalInt(oLabeledList,AGZ_TALLY, GetLocalInt(oLabeledList,AGZ_TALLY) + 1);
 return oNew;
}

// retrieve the Object with the given label, OBJECT_INVALID if not found
object LabeledListGetAtLabel(object oLabeledList, string sLabel)
{return GetLocalObject(oLabeledList, IntToString(GetLocalInt(oLabeledList, sLabel)));}

// remove the Object with the given label, returning it.
object LabeledListRemoveAtLabel(object oLabeledList, string sLabel)
{
 if (GetLocalInt(oLabeledList, AGZ_AO) != AO_SUBTYPE_LABELEDLIST)
    {if (agz_LOG_EXCEPTIONS)
         agz_Log("LabeledListRemoveAtLabel 1st argument:"+
                    ObjectToString(oLabeledList)+" not a LabeledList");
     return OBJECT_INVALID;
    }
// if (GetStringLeft(sLabel,3) == "agz")
//    {if (agz_LOG_EXCEPTIONS)
//         agz_Log("LabeledListRemoveAtLabel error: Label must not begin with 'agz'");
//     return OBJECT_INVALID;
//    }

// find existing Object
 int iX = GetLocalInt(oLabeledList, sLabel);
 if (!iX)       // not found
    return OBJECT_INVALID;
 string sVarName = IntToString(iX);
 object oOld = GetLocalObject(oLabeledList, sVarName);
 DeleteLocalInt(oLabeledList, sLabel);      // remove label pointer
 DeleteLocalObject(oLabeledList, sVarName);
 DeleteLocalString(oLabeledList, sVarName); // remove label backreference
 if (GetLocalInt(oOld, AGZ_AO)) {
     int iCount = GetLocalInt(oOld, AGZ_REF_COUNT) - 1;
     SetLocalInt(oOld, AGZ_REF_COUNT, iCount);
     if (iCount < 1)
        AssignCommand(oOld, ConditionallyPurgeSelf());
    }
 int nTop = GetLocalInt(oLabeledList, AGZ_TOP);
 if (iX == nTop) {    // shrink down
     while (nTop && GetLocalObject(oLabeledList, IntToString(--nTop)) == OBJECT_INVALID)
        {}
     SetLocalInt(oLabeledList, AGZ_TOP, nTop);
    }
 // decrease tally
 SetLocalInt(oLabeledList, AGZ_TALLY, GetLocalInt(oLabeledList, AGZ_TALLY) - 1);
 return oOld;

}

// Get the label of the Object that was last reached by a Get* with oCursor
string GetLabelOfCurrentObjectInLabeledList(object oLabeledList, object oCursor=OBJECT_INVALID)
{
 if (oCursor == OBJECT_INVALID) oCursor = oLabeledList;
 return GetLocalString(oLabeledList, IntToString(GetLocalInt(oCursor, AGZ_CURSOR)));
}

// Set the pointer used to iterate on a LabeledList to point to the Object (if any)
//   associated with sLabel; returns the Object
object LabeledListSetPointerToLabel(object oLabeledList, string sLabel, object oCursor=OBJECT_INVALID)
{int iType = GetLocalInt(oLabeledList, AGZ_AO);
 if (!(iType & AO_TYPE_COLLECTION))
    return OBJECT_INVALID;
 if (oCursor == OBJECT_INVALID) oCursor = oLabeledList;
 if (iType != AO_SUBTYPE_LABELEDLIST) {
    SetLocalInt(oCursor, AGZ_CURSOR, 0);
    return OBJECT_INVALID;
    }
 int nX = GetLocalInt(oLabeledList, sLabel);
 SetLocalInt(oCursor, AGZ_CURSOR, nX);
 return GetLocalObject(oLabeledList, IntToString(nX));
}

// Get the label of oMember if it is in oLabeledList and has a label
string GetLabelOfObjectInLabeledList(object oLabeledList, object oMember)
{int iType = GetLocalInt(oLabeledList, AGZ_AO);
 if (iType != AO_SUBTYPE_LABELEDLIST)
     return "";
 if (oMember == OBJECT_INVALID) return "";
 int iX = 1;
 int iTop = GetLocalInt(oLabeledList, AGZ_TOP);
 while (iX <= iTop)
    {
     if (GetLocalObject(oLabeledList, IntToString(iX)) == oMember)
        return GetLocalString(oLabeledList, IntToString(iX));
     iX++;
    }
 return "";
}

// put oNew in LabeledList, setting sLabel to point at it
object LabeledListPutAtLabel(object oLabeledList, string sLabel, object oNew)
{if (GetLocalInt(oLabeledList, AGZ_AO) != AO_SUBTYPE_LABELEDLIST)
    {if (agz_LOG_EXCEPTIONS)
         agz_Log("LabeledListPutAtLabel 1st argument:"+
                    ObjectToString(oLabeledList)+" not a LabeledList");
     return oNew;
    }
// if (GetStringLeft(sLabel,3) == "agz")
//    {if (agz_LOG_EXCEPTIONS)
//         agz_Log("LabeledListPutAtLabel error: Label must not begin with 'agz'");
//     return oNew;
//    }
 if (sLabel == "")
    return LabeledListAddWithLabel(oLabeledList, "", oNew);
 if (oNew == OBJECT_INVALID) {
     LabeledListRemoveAtLabel(oLabeledList, sLabel);
     return OBJECT_INVALID;
     }
 string sVarName;
// find existing Object
 int iX = GetLocalInt(oLabeledList, sLabel);
 if (iX) { // replace object
     object oOld = GetLocalObject(oLabeledList, sVarName = IntToString(iX));
     DeleteLocalObject(oLabeledList, sVarName);
     if (GetLocalInt(oOld, AGZ_AO)) {
         int iCount = GetLocalInt(oOld, AGZ_REF_COUNT) - 1;
         SetLocalInt(oOld, AGZ_REF_COUNT, iCount);
         if (iCount < 1)
            AssignCommand(oOld, ConditionallyPurgeSelf());
        }
     SetLocalObject(oLabeledList, sVarName, oNew);
     }
 else {  // add new object
     int nTop = GetLocalInt(oLabeledList, AGZ_TOP);
     SetLocalObject(oLabeledList, sVarName = IntToString(++nTop), oNew);
     SetLocalString(oLabeledList, sVarName, sLabel);
     SetLocalInt(oLabeledList, sLabel, nTop);
     SetLocalInt(oLabeledList, AGZ_TOP, nTop);
     }
 if (GetLocalInt(oNew, AGZ_AO))
    SetLocalInt(oNew, AGZ_REF_COUNT, GetLocalInt(oNew, AGZ_REF_COUNT) + 1);
 // adjust tally
 SetLocalInt(oLabeledList,AGZ_TALLY, GetLocalInt(oLabeledList,AGZ_TALLY) + 1);
 return oNew;
}



