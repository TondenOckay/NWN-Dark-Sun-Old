//::///////////////////////////////////////////////
//:: Name     Collections Library Functions Prototypes
//::          part 2
//:: FileName agz_if_collect2
//:://////////////////////////////////////////////
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

#include "agz_if_config"

//////////////////////////////////////////////////
// Additional common Collection functions
//////////////////////////////////////////////////

// Get the nth Object in Collection, sets the iteration pointer to that Object
//   this is equivalent to a GetFirst followed by (nPosition - 1) GetNext
// - if the argument is not a Collection returns the argument itself when
//      nPosition = 1, OBJECT_INVALID otherwise
// - if nPosition is < 1 returns OBJECT_INVALID
// - if nPosition is > SizeOfCollection returns OBJECT_INVALID
// - use a CollectionCursor as oCursor to keep separate concurrent iterations
object GetNthObjectInCollection(object oCollection, int nPosition, object oCursor=OBJECT_INVALID);

// Get the pointer that was last reached by a Get* with oCursor
// if no Cursor is specified the value is taken from the implicit Collection cursor
// - if the argument is not a Collection returns 0
// - if the iteration has not started returns 0
// if oCollection is an Array then the pointer is also the Index of the current element
// note: the slot pointed by the current pointer could be empty (removal, past the end)
int GetCurrentPointerInCollection(object oCollection, object oCursor=OBJECT_INVALID);

// Set the pointer used to iterate on a Collection to point to a given slot
// returns the Object (if any) that is in the slot pointed to
// - if the argument is not a Collection returns OBJECT_INVALID
// - if nPointer is < 1 it is set just before the beginning and OBJECT_INVALID is returned
// - if nPointer is beyond the end it is set just after the end and OBJECT_INVALID is returned
// note: OBJECT_INVALID can be returned if nPointer points to an empty slot
object SetCurrentPointerInCollection(object oCollection, int nPointer, object oCursor=OBJECT_INVALID);


//////////////////////////////////////////////////
// Plain Array specific functions
//////////////////////////////////////////////////

// Plain Arrays are a sub-type of Collection
// as such, it can be used in all Collection functions

// Create an Array with a given Maximum Index
// note: the Maximum Index limits the ability to do ArrayPut beyond
//       the current highest-indexed element (called current Top)
//       Adding elements with AddObjectToCollection (and similars)
//       is not capped by MaxIndex
object ArrayNew(int nMaxIndex = agz_CL_DEFAULT_ARRAY_MAXINDEX);

// Check if Collection is an Array
int GetIsArray(object oCollection);

// Check if oCollection is an Array, return oCollection if yes, OBJECT_INVALID if no
// note: can be used as a filter
object IsArray(object oCollection);

// Get an Object from an Array at a given index
// Note: can actually be used with any Collection sub-type, returning the
//   object at the slot corresponding with nIndex
// If used with a non-Collection object returns the object itself if nIndex is 1
//   i.e. every non-Collection object is treated as a single element Array
// if index is < 1  or > array current top then OBJECT_INVALID is returned
// - note: can return OBJECT_INVALID also if the indexed position is empty
object ArrayGet(object oArray, int nIndex);

// Put an Object into an Array at a given index
// Note: works only with Arrays, not with other Collection subtypes
// index must be between 1 and the highest of (array MaxIndex, array current top)
// - returns oNew
// - if oNew is OBJECT_INVALID the position pinted to by nIndex is actually cleared
object ArrayPut(object oArray, int nIndex, object oNew);

// Delete an Object from an Array at a given index
// Note: works only with Arrays, not with other Collection subtypes
// index must be between 1 and the highest of (array MaxIndex, array current top)
// - returns the removed Object
object ArrayDel(object oArray, int nIndex);

// Copy a Collection as an Array
// - returns a new Array containing all the members of oCollection
//   consecutively added starting from index 1
// note: the Array MaxIndex is set to the default value
// note: if the source Collection is an Array its indexing will be ignored
//       and the copy will be compacted
object CopyCollectionAsArray(object oCollection);

// returns the MaxIndex setting of an Array
int GetArrayMaxIndex(object oArray);

// sets the MaxIndex value of an Array, returns nMaxIndex
int SetArrayMaxIndex(object oArray, int nMaxIndex);

// agz 20040101 0.20.02 - function added

// returns the current Top index of an Array
// Note: can actually be used with any Collection sub-type, returning the
//   number of the highest occupied slot
int GetArrayCurrentTop(object oArray);

//////////////////////////////////////////////////
// Labeled List specific functions
//////////////////////////////////////////////////

// A Labeled List is a sub-type of Collection
// as such, it can be used in all Collection functions
// It is basically identical to a List, with the added
// capability to associate a label to an element being added
// and then retrieve/delete elements by their labels

// Create a LabeledList
object LabeledListNew();

// Check if Collection is a LabeledList
int GetIsLabeledList(object oCollection);

// Check if oCollection is a LabeledList, return oCollection if yes, OBJECT_INVALID if no
// note: can be used as a filter
object IsLabeledList(object oCollection);

// add oNew at the end of the LabeledList, setting sLabel to point at it
// return oNew
// - if sLabel is "" oNew is added at the end as an anonymous element
// - Important = sLabel must not begin with "agz"
// - if oNew is OBJECT_INVALID nothing happens (no add and no removal)
// - if sLabel is already assigned to another Object, the existing Object is removed
//   from LabeledList before adding oNew at the end
object LabeledListAddWithLabel(object oLabeledList, string sLabel, object oNew);

// put oNew in LabeledList, setting sLabel to point at it
// return oNew
// - if sLabel is already assigned to an Object, the existing Object is replaced
//   by oNew, in the same position
// - if sLabel is not yet present oNew is added at the end
// - if sLabel is "" oNew is added at the end as an anonymous element
// - Important = sLabel must not begin with "agz"
// - if oNew is OBJECT_INVALID the existing Object at sLabel is actually removed
object LabeledListPutAtLabel(object oLabeledList, string sLabel, object oNew);

// retrieve the Object with the given label, OBJECT_INVALID if not found
object LabeledListGetAtLabel(object oLabeledList, string sLabel);

// remove the Object with the given label, returning it.
// OBJECT_INVALID is returned if not found
object LabeledListRemoveAtLabel(object oLabeledList, string sLabel);

// Get the label of the Object that was last reached by a Get* with oCursor
// if no Cursor is specified the position is taken from the implicit LabeledList cursor
// - if the argument is not a LabeledList returns ""
// - if the iteration has not started returns ""
// - it the current element is unlabeled returns ""
string GetLabelOfCurrentObjectInLabeledList(object oLabeledList, object oCursor=OBJECT_INVALID);

// Set the pointer used to iterate on a LabeledList to point to the Object (if any)
//   associated with sLabel; returns the Object
// - if the argument is a Collection but not a LabeledList the pointer is set
//   just before the beginning of the Collection and OBJECT_INVALID is returned
// - if the argument is not a Collection returns OBJECT_INVALID
// - if the label is "" or not found the pointer is set just before the beginning
//   of the LabeledList and OBJECT_INVALID is returned
object LabeledListSetPointerToLabel(object oLabeledList, string sLabel, object oCursor=OBJECT_INVALID);

// Get the label of oMember if it is in oLabeledList and has a label
// - if the argument is not a LabeledList returns ""
// - if oMember appereas in LabeledList more than once, return the label of the first occurence
string GetLabelOfObjectInLabeledList(object oLabeledList, object oMember);

