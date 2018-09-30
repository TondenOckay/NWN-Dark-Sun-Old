//::///////////////////////////////////////////////
//:: Name     Utility Functions
//:: FileName agz_if_utility
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////
// Printing and logging
/////////////////////////////////////////////////////////////////////////

// Output oObject's ID, Type and Tag to the log file. Return oObject
// (note: for Abstract Objects the output is different)
object XPrintObject(object oObject);


/////////////////////////////////////////////////////////////////////////
// Object Filters
/////////////////////////////////////////////////////////////////////////

// Filter generic Object
// - iTypeFilter: This allows you to filter for desired object types, using
//                bitwise "or" (eg: OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE)
// - sTagPattern : If not "" oObject Tag will be matched to sTagPattern
//                 (rules of pattern matching are explained in NWNLexicon under
//                  TestStringAgainstPattern)
// - iOnlyValid : If FALSE oObject will be accepted even if not GetIsObjectValid(oObject)
// * returns oObject if it satisfies the filtering conditions, OBJECT_INVALID otherwise
object FilterObject(object oObject, int iTypeFilter=OBJECT_TYPE_ALL, string sTagPattern = "", int iOnlyValid=TRUE);

// Filter Creature
// - iRacialType : check the Creature RACIAL_TYPE_* (RACIAL_TYPE_ALL accomodates all)
// - iClassType  : check if the Creature has at least a Level in CLASS_TYPE_*
//                 (CLASS_TYPE_INVALID accomodates all)
// - oFactionMember : If not OBJECT_INVALID oCreature is tested for membership in the same Faction
// * returns oCreature if it is a Creature and satisfies the filtering conditions, OBJECT_INVALID otherwise
object FilterCreature(object oCreature, int iRacialType=RACIAL_TYPE_ALL, int iClassType=CLASS_TYPE_INVALID, object oFactionMember=OBJECT_INVALID);

// Filter Item
// - iBaseItemType : check the Item BASE_ITEM_* (BASE_ITEM_INVALID accomodates all)
// - oPossessedBy : If not OBJECT_INVALID check if oPossessedBy is oItem possessor
// * returns oItem if it is an Item and satisfies the filtering conditions, OBJECT_INVALID otherwise
object FilterItem(object oItem, int iBaseItemType=BASE_ITEM_INVALID, object oPossessedBy=OBJECT_INVALID);


/////////////////////////////////////////////////////////////////////////
// Logical filters combination
/////////////////////////////////////////////////////////////////////////

// Or-condition filter
// if oFirst is not OBJECT_INVALID nor o_ZERO return oFirst, else return oSecond
// (Note: both are evaluated)
object OrFilter(object oFirst, object oSecond);

// And-condition filter
// if oFirst and oSecond are the SAME Object and not o_ZERO, the Object is returned
// else returns OBJECT_INVALID
// (Note: both are evaluated)
object AndFilter(object oFirst, object oSecond);

// Not-condition filter
// if oTest is not OBJECT_INVALID and not o_ZERO, return OBJECT_INVALID
// else return oObject
// (Note: both are evaluated)
object NotFilter(object oTest, object oObject);

// If filter
// if oCondition is not OBJECT_INVALID and not o_ZERO, return oThen
// else return oElse
// (Note: all three are evaluated)
object IfFilter(object oCondition, object oThen, object oElse=OBJECT_INVALID);


//////////////////////////////////////////////////
// Symbolic naming of Objects
//////////////////////////////////////////////////

// Assign an Object to a Symbol string
// -  returns oObject
object AssignSymbol(string sSymbol, object oObject);

// Remove a Symbol-Object association
// -  returns the Object that was assigned to sSymbol, OBJECT_INVALID if none
object UnassignSymbol(string sSymbol);

// Get the Object associated to a Symbol
object GetObjectBySymbol(string sSymbol);


//////////////////////////////////////////////////
// Manipulating and Testing Local Variables
//////////////////////////////////////////////////

// Toggle a Local Int between FALSE and TRUE
void ToggleLocalInt(object oObject, string sVarName);

// Add a value to a Local Int
void AddToLocalInt(object oObject, string sVarName, int iValue);

// Returns OBJECT_INVALID if the Local Int is zero, otherwise returns oObject
object HasLocalIntSet(object oObject, string sVarName);



