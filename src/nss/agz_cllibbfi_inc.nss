//:://////////////////////////////////////////////////////////////
//:: Name     Collections Library Basic Functions
//:: FileName agz_cllibbfi_inc
//:://////////////////////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "agz_if_basic"
#include "agz_aolibbfi_inc"
#include "agz_if_collect"
// 20030927 0.19.02   new Collection subtype Array
#include "agz_if_collect2"

// PRIVATE FUNCTIONS
object NewCollectionOfSameType(object oOriginal)
{int iType = GetLocalInt(oOriginal, AGZ_AO);
 if (!(iType & AO_TYPE_COLLECTION))
    return CreateAbstractObject(AO_SUBTYPE_LIST); // the least restrictive
 return CreateAbstractObject(iType);
}

// PUBLIC FUNCTIONS

// Create an Empty List
object EmptyList()
{return CreateAbstractObject(AO_SUBTYPE_LIST);}

// Create an Empty Set
object EmptySet()
{return CreateAbstractObject(AO_SUBTYPE_SET);}

// Check if Object is a Collection
int GetIsCollection(object oCollection)
{return GetLocalInt(oCollection, AGZ_AO) & AO_TYPE_COLLECTION;}

// Check if Object is a List
int GetIsList(object oCollection)
{return (GetLocalInt(oCollection, AGZ_AO) == AO_SUBTYPE_LIST);}

// Check if Object is a Set
int GetIsSet(object oCollection)
{return GetLocalInt(oCollection, AGZ_AO) == AO_SUBTYPE_SET;}

// Check if Object is a Collection
object IsCollection(object oCollection)
{if (GetLocalInt(oCollection, AGZ_AO) & AO_TYPE_COLLECTION)
    return oCollection;
 return OBJECT_INVALID;}

// Check if Object is a List
object IsList(object oCollection)
{if (GetLocalInt(oCollection, AGZ_AO) == AO_SUBTYPE_LIST)
    return oCollection;
 return OBJECT_INVALID;}

// Check if Object is a Set
object IsSet(object oCollection)
{if (GetLocalInt(oCollection, AGZ_AO) == AO_SUBTYPE_SET)
    return oCollection;
 return OBJECT_INVALID;}

// Destroy a Collection
// void DestroyCollection(object oCollection)
// implemented in agz_aolibbfi_inc for packaging reasons

// Add an Object to a Collection
object AddToCollection(object oNew, object oCollection)
{int iType = GetLocalInt(oCollection, AGZ_AO);
 if (!(iType & AO_TYPE_COLLECTION))
     {                                      // not a Collection
      if (agz_LOG_EXCEPTIONS)
         agz_Log("AddToCollection 2nd argument:"+
                    ObjectToString(oCollection)+" not a Collection");
      return oNew;
     }
 if (oNew != OBJECT_INVALID &&              // never add OBJECT_INVALID
     (iType != AO_SUBTYPE_SET ||            // only Sets have InvK
      !GetLocalInt(oCollection,"agz_InvK_"+ObjectToString(oNew))))
    {
     int iX = GetLocalInt(oCollection, AGZ_TOP) + 1;
//   BasicAtPutUpward(oCollection, iX, oNew);  OPTIMIZED
     SetLocalObject(oCollection, IntToString(iX), oNew);
     SetLocalInt(oCollection, AGZ_TOP, iX);
     if (GetLocalInt(oNew, AGZ_AO))
        SetLocalInt(oNew, AGZ_REF_COUNT,GetLocalInt(oNew, AGZ_REF_COUNT) + 1);
     // set inverted key
     if (iType == AO_SUBTYPE_SET)  // avoid duplicates
        SetLocalInt(oCollection,"agz_InvK_"+ObjectToString(oNew), iX);
     // increase tally
     SetLocalInt(oCollection,AGZ_TALLY, GetLocalInt(oCollection,AGZ_TALLY) + 1);
    }
 return oNew;
}

// Remove an Object from a Collection
object RemoveFromCollection(object oOld, object oCollection)
{int iType = GetLocalInt(oCollection, AGZ_AO);
 if  (!(iType & AO_TYPE_COLLECTION))
     {                                      // not a Collection
      if (agz_LOG_EXCEPTIONS)
         agz_Log("RemoveFromCollection 2nd argument:"+
                    ObjectToString(oCollection)+" not a Collection");
      return oOld;
     }
 int iX;
 int iTop = GetLocalInt(oCollection, AGZ_TOP);
 if (iType == AO_SUBTYPE_SET)
// agz 20030911 0.18.03 code optimization
    {
     if (!(iX=GetLocalInt(oCollection,"agz_InvK_"+ObjectToString(oOld))))
        return oOld;       // not there
    }
 else
    {iX = 1;
//   while (iX <= iTop && BasicAt(oCollection, iX) != oOld) OPTIMIZED
     while (iX <= iTop && GetLocalObject(oCollection, IntToString(iX)) != oOld)
         iX++;
     if (iX > iTop) return oOld; // not there
    }
// BasicAtRemoveUpward(oCollection, iX);  OPTIMIZED
 if (GetLocalInt(oOld, AGZ_AO))
    {                                               // dereference old object
     int iCount = GetLocalInt(oOld, AGZ_REF_COUNT) - 1;
     SetLocalInt(oOld, AGZ_REF_COUNT, iCount);
     if (iCount < 1)
        AssignCommand(oOld, ConditionallyPurgeSelf());
    }
// agz 20031003 0.19.03 - changed to manage LabeledList
 string sVarName = IntToString(iX);
 DeleteLocalObject(oCollection, sVarName);
 if (iType == AO_SUBTYPE_LABELEDLIST) {
     DeleteLocalInt(oCollection, GetLocalString(oCollection, sVarName)); // remove label
     DeleteLocalString(oCollection, sVarName); // remove label backreference
    }
 if (iX == iTop)    // shrink down
    {
// agz 20031003 0.19.03 - optimized
     while (iTop && GetLocalObject(oCollection, IntToString(--iTop)) == OBJECT_INVALID)
            {}  // do nothing
     SetLocalInt(oCollection, AGZ_TOP, iTop);
    }
 // remove inverted key
 if (iType == AO_SUBTYPE_SET)
    DeleteLocalInt(oCollection,"agz_InvK_"+ObjectToString(oOld));
 // decrease tally
 SetLocalInt(oCollection,AGZ_TALLY, GetLocalInt(oCollection,AGZ_TALLY) - 1);
 return oOld;
}

// Check if Object is member of a Collection
int GetIsInCollection(object oMember, object oCollection)
{int iType = GetLocalInt(oCollection, AGZ_AO);
 if (iType == AO_SUBTYPE_SET)
// agz 20030927 0.19.02 - comply with boolean-returning functions
     return (GetLocalInt(oCollection,"agz_InvK_"+ObjectToString(oMember)) != 0);
 if (oMember == OBJECT_INVALID) return 0;
// agz 20030927 0.19.02 - comply with general logic of treating non-Collection
//                        objects as a Collection having itself as single element
 if (!(iType & AO_TYPE_COLLECTION))
    return oMember == oCollection;
 int iX = 1;
 int iTop = GetLocalInt(oCollection, AGZ_TOP);
 while (iX <= iTop)
    {
//   if (BasicAt(oCollection, iX) == oMember) return iX;  OPTIMIZED
// agz 20030911 0.18.03 - comply with boolean-returning functions
     if (GetLocalObject(oCollection, IntToString(iX)) == oMember) return 1;
     iX++;
    }
 return 0;
}

// Check if oObject is member of a Collection, return oObject if yes, OBJECT_INVALID if no
object IsInCollection(object oObject, object oCollection)
{
 if (GetIsInCollection(oObject, oCollection))
    return oObject;
 return OBJECT_INVALID;
}

// Get size (numerosity) of a Collection
// int SizeOfCollection(object oCollection)
// implemented in agz_aolibbfi_inc for packaging reasons

// Create an Abstract Object to be used as cursor
object CreateCollectionCursor()
{return CreateAbstractObject(AO_SUBTYPE_SYS_CURSOR);}

// Get first Object in Collection
object GetFirstObjectInCollection(object oCollection, object oCursor=OBJECT_INVALID)
{
 if (!(GetLocalInt(oCollection, AGZ_AO) & AO_TYPE_COLLECTION))
    return oCollection;
 if (oCursor == OBJECT_INVALID) oCursor = oCollection;
 SetLocalInt(oCursor, AGZ_CURSOR, 0);
 return GetNextObjectInCollection(oCollection, oCursor);
}

// Get last Object in Collection
object GetLastObjectInCollection(object oCollection, object oCursor=OBJECT_INVALID)
{
 if (!(GetLocalInt(oCollection, AGZ_AO) & AO_TYPE_COLLECTION))
    return oCollection;
 if (oCursor == OBJECT_INVALID) oCursor = oCollection;
 SetLocalInt(oCursor, AGZ_CURSOR, GetLocalInt(oCollection, AGZ_TOP)+1);
 return GetPreviousObjectInCollection(oCollection, oCursor);
}

// Get next Object in Collection
object GetNextObjectInCollection(object oCollection, object oCursor=OBJECT_INVALID)
{
 if (!(GetLocalInt(oCollection, AGZ_AO) & AO_TYPE_COLLECTION))
    return OBJECT_INVALID;
 if (oCursor == OBJECT_INVALID) oCursor = oCollection;
 int iX = GetLocalInt(oCursor, AGZ_CURSOR);
 object oResult;
 int iTop = GetLocalInt(oCollection, AGZ_TOP);
// agz 20030911 0.18.03 - code optimization
 while (iX < iTop &&
//   oResult = BasicAt(oCollection, ++iX); OPTIMIZED
       (oResult=GetLocalObject(oCollection, IntToString(++iX))) == OBJECT_INVALID)
    {}
 SetLocalInt(oCursor, AGZ_CURSOR, iX);
 return oResult;
}

// Get previous Object in Collection
object GetPreviousObjectInCollection(object oCollection, object oCursor=OBJECT_INVALID)
{
 if (!(GetLocalInt(oCollection, AGZ_AO) & AO_TYPE_COLLECTION))
    return OBJECT_INVALID;
 if (oCursor == OBJECT_INVALID) oCursor = oCollection;
 int iX = GetLocalInt(oCursor, AGZ_CURSOR);
 object oResult;
// agz 20030911 0.18.03 - code optimization
 while (iX > 1 &&
//   oResult = BasicAt(oCollection, --iX);  OPTIMIZED
       (oResult=GetLocalObject(oCollection, IntToString(--iX))) == OBJECT_INVALID)
    {}
 SetLocalInt(oCursor, AGZ_CURSOR, iX);
 return oResult;
}

// Get current Object in Collection
object GetCurrentObjectInCollection(object oCollection, object oCursor=OBJECT_INVALID)
{
 if (!(GetLocalInt(oCollection, AGZ_AO) & AO_TYPE_COLLECTION))
    return OBJECT_INVALID;
 if (oCursor == OBJECT_INVALID) oCursor = oCollection;
 int iX = GetLocalInt(oCursor, AGZ_CURSOR);
// object oResult = BasicAt(oCollection, iX); OPTIMIZED
 object oResult = GetLocalObject(oCollection, IntToString(iX));
 return oResult;
}

// Remove current Object from a Collection
object RemoveCurrentObjectFromCollection(object oCollection, object oCursor=OBJECT_INVALID)
{int iType = GetLocalInt(oCollection, AGZ_AO);
 if  (!(iType & AO_TYPE_COLLECTION))
    return OBJECT_INVALID;   // not a Collection
 if (oCursor == OBJECT_INVALID) oCursor = oCollection;
 int iX = GetLocalInt(oCursor, AGZ_CURSOR);
// object oOld = BasicAt(oCollection, iX);  OPTIMIZED
 string sX = IntToString(iX);
 object oOld = GetLocalObject(oCollection, sX);
 if (oOld == OBJECT_INVALID) return OBJECT_INVALID;
// BasicAtRemoveUpward(oCollection, iX);  OPTIMIZED
 if (GetLocalInt(oOld, AGZ_AO))
    {                                               // dereference old object
     int iCount = GetLocalInt(oOld, AGZ_REF_COUNT) - 1;
     SetLocalInt(oOld, AGZ_REF_COUNT, iCount);
     if (iCount < 1)
        AssignCommand(oOld, ConditionallyPurgeSelf());
    }
 DeleteLocalObject(oCollection, sX);
// agz 20031003 0.19.03 - added to manage LabeledList
 if (iType == AO_SUBTYPE_LABELEDLIST) {
     DeleteLocalInt(oCollection, GetLocalString(oCollection, sX)); // remove label
     DeleteLocalString(oCollection, sX); // remove label backreference
    }
 int iTop = GetLocalInt(oCollection, AGZ_TOP);
 if (iX == iTop)    // shrink down
    {
// agz 20031003 0.19.03 - code optimization
     while (iTop && GetLocalObject(oCollection, IntToString(--iTop)) == OBJECT_INVALID)
            {}  // do nothing
     SetLocalInt(oCollection, AGZ_TOP, iTop);
    }
 // remove inverted key
 if (iType == AO_SUBTYPE_SET)
    DeleteLocalInt(oCollection,"agz_InvK_"+ObjectToString(oOld));
 // decrease tally
 SetLocalInt(oCollection,AGZ_TALLY, GetLocalInt(oCollection,AGZ_TALLY) - 1);
 return oOld;
}

// Create a List with the argument Objects
object List(object oOb0,
                  object oOb1=OBJECT_INVALID,
                  object oOb2=OBJECT_INVALID,
                  object oOb3=OBJECT_INVALID,
                  object oOb4=OBJECT_INVALID,
                  object oOb5=OBJECT_INVALID,
                  object oOb6=OBJECT_INVALID,
                  object oOb7=OBJECT_INVALID,
                  object oOb8=OBJECT_INVALID,
                  object oOb9=OBJECT_INVALID)
{
 object oColl = EmptyList();
 AddToCollection(oOb0, oColl);
 AddToCollection(oOb1, oColl);
 AddToCollection(oOb2, oColl);
 AddToCollection(oOb3, oColl);
 AddToCollection(oOb4, oColl);
 AddToCollection(oOb5, oColl);
 AddToCollection(oOb6, oColl);
 AddToCollection(oOb7, oColl);
 AddToCollection(oOb8, oColl);
 AddToCollection(oOb9, oColl);
 return oColl;
}

// Create a Set with the argument Objects
object Set(object oOb0,
                  object oOb1=OBJECT_INVALID,
                  object oOb2=OBJECT_INVALID,
                  object oOb3=OBJECT_INVALID,
                  object oOb4=OBJECT_INVALID,
                  object oOb5=OBJECT_INVALID,
                  object oOb6=OBJECT_INVALID,
                  object oOb7=OBJECT_INVALID,
                  object oOb8=OBJECT_INVALID,
                  object oOb9=OBJECT_INVALID)
{
 object oColl = EmptySet();
 AddToCollection(oOb0, oColl);
 AddToCollection(oOb1, oColl);
 AddToCollection(oOb2, oColl);
 AddToCollection(oOb3, oColl);
 AddToCollection(oOb4, oColl);
 AddToCollection(oOb5, oColl);
 AddToCollection(oOb6, oColl);
 AddToCollection(oOb7, oColl);
 AddToCollection(oOb8, oColl);
 AddToCollection(oOb9, oColl);
 return oColl;
}

// Add all members of Source Collection to Destination Collection,
object AddAllToCollection(object oSource, object oDestination)
// 20030927 0.19.02 modified to handle Arrays
{int iType = GetLocalInt(oDestination, AGZ_AO);
 if (!(iType & AO_TYPE_COLLECTION))
     {                                      // not a Collection
      if (agz_LOG_EXCEPTIONS)
         agz_Log("AddAllToCollection 2nd argument:"+
                    ObjectToString(oDestination)+" not a Collection");
      return oDestination;
     }
 object oCursor = CreateAbstractObject(AO_SUBTYPE_SYS_CURSOR);
 object oMem = GetFirstObjectInCollection(oSource, oCursor);
 int iTypeS = GetLocalInt(oSource, AGZ_AO);
// 20030927 0.19.02 modified to handle Arrays
 if (iType  == AO_SUBTYPE_ARRAY &&
     iTypeS == AO_SUBTYPE_ARRAY)
     while (oMem != OBJECT_INVALID)
        {
         ArrayPut(oDestination,
                  GetCurrentPointerInCollection(oSource, oCursor),
                  oMem);
         oMem = GetNextObjectInCollection(oSource, oCursor);
        }
// agz 20031003 0.19.03 - modified to handle LabeledList
 else if (iType  == AO_SUBTYPE_LABELEDLIST &&
          iTypeS == AO_SUBTYPE_LABELEDLIST)
     while (oMem != OBJECT_INVALID)
        {
         LabeledListAddWithLabel(oDestination,
                          GetLabelOfCurrentObjectInLabeledList(oSource, oCursor),
                               oMem);
         oMem = GetNextObjectInCollection(oSource, oCursor);
        }
 else
     while (oMem != OBJECT_INVALID)
        {
         AddToCollection(oMem, oDestination);
         oMem = GetNextObjectInCollection(oSource, oCursor);
        }
 return oDestination;
}

// Remove all members of Source Collection from Destination Collection,
object RemoveAllFromCollection(object oSource, object oDestination)
// 20030927 0.19.02 modified to handle Arrays
{int iType = GetLocalInt(oDestination, AGZ_AO);
 if (!(iType & AO_TYPE_COLLECTION))
     {                                      // not a Collection
      if (agz_LOG_EXCEPTIONS)
         agz_Log("RemoveAllFromCollection 2nd argument:"+
                    ObjectToString(oDestination)+" not a Collection");
      return oDestination;
     }
 object oCursor = CreateAbstractObject(AO_SUBTYPE_SYS_CURSOR);
 object oMem = GetFirstObjectInCollection(oSource, oCursor);
 int iTypeS = GetLocalInt(oSource, AGZ_AO);
// 20030927 0.19.02 modified to handle Arrays
 if (iType  == AO_SUBTYPE_ARRAY &&
     iTypeS == AO_SUBTYPE_ARRAY)
     while (oMem != OBJECT_INVALID)
        {
         ArrayDel(oDestination,
                  GetCurrentPointerInCollection(oSource, oCursor));
         oMem = GetNextObjectInCollection(oSource, oCursor);
        }
// agz 20031003 0.19.03 - modified to handle LabeledList
 else if (iType  == AO_SUBTYPE_LABELEDLIST &&
          iTypeS == AO_SUBTYPE_LABELEDLIST)
     while (oMem != OBJECT_INVALID)
        {
         LabeledListRemoveAtLabel(oDestination,
                         GetLabelOfCurrentObjectInLabeledList(oSource, oCursor));
         oMem = GetNextObjectInCollection(oSource, oCursor);
        }
 else
     while (oMem != OBJECT_INVALID)
        {
         RemoveFromCollection(oMem, oDestination);
         oMem = GetNextObjectInCollection(oSource, oCursor);
        }
 return oDestination;
}

// Remove everything from a Collection
object ClearCollection(object oCollection)
{if (GetLocalInt(oCollection, AGZ_AO) & AO_TYPE_COLLECTION)
    {object oCursor = CreateAbstractObject(AO_SUBTYPE_SYS_CURSOR);
     object oMem = GetLastObjectInCollection(oCollection, oCursor);
     while (oMem != OBJECT_INVALID)
        {RemoveCurrentObjectFromCollection(oCollection, oCursor);
         oMem = GetPreviousObjectInCollection(oCollection, oCursor);
        }
    }
 return oCollection;
}

// Copy a Collection
// 20030927 0.19.02 modified for faster Array copying
object CopyCollection(object oCollection)
{
 if (GetLocalInt(oCollection, AGZ_AO) == AO_SUBTYPE_ARRAY) {
     object oResult = ArrayNew(GetArrayMaxIndex(oCollection));
     int nX = GetLocalInt(oCollection,AGZ_TOP);
     SetLocalInt(oResult, AGZ_TOP, nX);
     object oElem;
     string sX;
     for (; nX; nX--)
         if ((oElem = GetLocalObject(oCollection, sX = IntToString(nX)))
                        != OBJECT_INVALID) {
             SetLocalObject(oResult, sX, oElem);
             if (GetLocalInt(oElem, AGZ_AO))
                    SetLocalInt(oElem, AGZ_REF_COUNT,
                                    GetLocalInt(oElem, AGZ_REF_COUNT) + 1);
            }
     return oResult;
    }
 // non-Arrays follow
 return AddAllToCollection(oCollection, NewCollectionOfSameType(oCollection));
}

// Copy a Collection as List
object CopyCollectionAsList(object oCollection)
{return AddAllToCollection(oCollection, EmptyList());}

// Copy a Collection as Set
object CopyCollectionAsSet(object oCollection)
{return AddAllToCollection(oCollection, EmptySet());}

// Returns a new Collection with all the members of two Collections
object SumCollection(object oFirstCollection, object oSecondCollection)
{return AddAllToCollection(oSecondCollection,CopyCollection(oFirstCollection));}

// Create the difference collection
object DifferenceCollection(object oFirstCollection, object oSecondCollection)
{return RemoveAllFromCollection(oSecondCollection,CopyCollection(oFirstCollection));}

// Create the intersection collection
object IntersectCollection(object oFirstCollection, object oSecondCollection)
{return DifferenceCollection(oFirstCollection,
            DifferenceCollection(oFirstCollection, oSecondCollection));}

