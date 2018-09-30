//::///////////////////////////////////////////////
//:: Name     Collections Library Functions Prototypes
//:: FileName agz_if_collect
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

//////////////////////////////////////////////////
// Basic Collection Creation and Manipulation
//////////////////////////////////////////////////

// Create an Empty Collection of type List (allows duplicates)
object EmptyList();

// Create a Collection of type List (allows duplicates) with the argument Objects
object List(object oOb0, object oOb1=OBJECT_INVALID,object oOb2=OBJECT_INVALID,object oOb3=OBJECT_INVALID,object oOb4=OBJECT_INVALID,object oOb5=OBJECT_INVALID,object oOb6=OBJECT_INVALID,object oOb7=OBJECT_INVALID,object oOb8=OBJECT_INVALID,object oOb9=OBJECT_INVALID);

// Create an Empty Collection of type Set (doesn't allow duplicates)
object EmptySet();

// Create a Collection of type Set (doesn't allow duplicates) with the argument Objects
object Set(object oOb0, object oOb1=OBJECT_INVALID,object oOb2=OBJECT_INVALID,object oOb3=OBJECT_INVALID,object oOb4=OBJECT_INVALID,object oOb5=OBJECT_INVALID,object oOb6=OBJECT_INVALID,object oOb7=OBJECT_INVALID,object oOb8=OBJECT_INVALID,object oOb9=OBJECT_INVALID);

// Add an Object to a Collection
// - returns the Object
object AddToCollection(object oNew, object oCollection);

// Remove an Object from a Collection
// - returns the Object
object RemoveFromCollection(object oOld, object oCollection);


//////////////////////////////////////////////////
// Basic Collection Query and Walking
//////////////////////////////////////////////////

// Check if oCollection is a Collection
int GetIsCollection(object oCollection);

// Check if oCollection is a List
int GetIsList(object oCollection);

// Check if oCollection is a Set
int GetIsSet(object oCollection);

// Get size (numerosity) of a Collection
// int SizeOfCollection(object oCollection);
// displaced to agz_if_basic for packaging reasons

// Check if Object is member of a Collection
int GetIsInCollection(object oMember, object oCollection);

// Check if oCollection is a Collection, return oCollection if yes, OBJECT_INVALID if no
// note: can be used as a filter
object IsCollection(object oCollection);

// Check if oCollection is a List, return oCollection if yes, OBJECT_INVALID if no
// note: can be used as a filter
object IsList(object oCollection);

// Check if oCollection is a Set, return oCollection if yes, OBJECT_INVALID if no
// note: can be used as a filter
object IsSet(object oCollection);

// Check if oObject is member of a Collection, return oObject if yes, OBJECT_INVALID if no
// note: can be used as a filter
object IsInCollection(object oObject, object oCollection);

// Create an Abstract Object to be used as cursor
object CreateCollectionCursor();

// Get first Object in Collection, set the iteration loop at the beginning
// - if the argument is not a Collection returns the argument itself
// - use a CollectionCursor as oCursor to keep separate concurrent iterations
object GetFirstObjectInCollection(object oCollection, object oCursor=OBJECT_INVALID);

// Get next Object in Collection, moves the iteration loop forward
// - if the argument is not a Collection returns OBJECT_INVALID
// - if the iteration has reached the end returns OBJECT_INVALID
// - use a CollectionCursor as oCursor to keep separate concurrent iterations
object GetNextObjectInCollection(object oCollection, object oCursor=OBJECT_INVALID);

// Get the Object in Collection that was last returned by a Get iteration function
// doesn't move the iterator
// - if the argument is not a Collection returns OBJECT_INVALID
// - if the iteration has not started returns OBJECT_INVALID
// - if the iteration has reached the end returns the last Object
// - if the current Object has been removed returns OBJECT_INVALID
// - use a CollectionCursor as oCursor to keep separate concurrent iterations
object GetCurrentObjectInCollection(object oCollection, object oCursor=OBJECT_INVALID);

// Get previous Object in Collection, moves the iteration loop backward
// - if the argument is not a Collection returns OBJECT_INVALID
// - if the iteration has reached the beginning returns OBJECT_INVALID
// - use a CollectionCursor as oCursor to keep separate concurrent iterations
object GetPreviousObjectInCollection(object oCollection, object oCursor=OBJECT_INVALID);

// Get last Object in Collection, set the iteration loop at the end
// - if the argument is not a Collection returns the argument itself
// - use a CollectionCursor as oCursor to keep separate concurrent iterations
object GetLastObjectInCollection(object oCollection, object oCursor=OBJECT_INVALID);

// Remove the Object in Collection that was last returned by a Get iteration function
// returns the removed Object; doesn't move the iterator
// - if the argument is not a Collection returns OBJECT_INVALID
// - if the iteration has not started returns OBJECT_INVALID
// - if the current Object has already been removed returns OBJECT_INVALID
// - use a CollectionCursor as oCursor to keep separate concurrent iterations
object RemoveCurrentObjectFromCollection(object oCollection, object oCursor=OBJECT_INVALID);


//////////////////////////////////////////////////
// Complex Collection Manipulation
//////////////////////////////////////////////////

// 20030927 0.19.02 modified to handle Arrays
// agz 20031003 0.19.03 - modified to handle LabeledList

// Add all members of Source Collection to Destination Collection,
// - returns the modified Destination
// Note: if both Source and Destination are Arrays the members of
//   Source are added at their index, eventually replacing the ones in Destination
// Note: if both Source and Destination are LabeledList the members of
//   Source are added with their labels, removing from Destination in case of
//   label collision. Also anonymous object in Source are added.
object AddAllToCollection(object oSource, object oDestination);

// 20030927 0.19.02 modified to handle Arrays
// agz 20031003 0.19.03 - modified to handle LabeledList

// Remove from Destination all members that are also in Source
// - returns the modified Destination
// Note: if both Source and Destination are Arrays the members of
//   Destination are removed when there is an element in Source with the same index
// Note: if both Source and Destination are LabeledList removal
//   is done by label (Objects are removed from Destination when their label
//   is in Source). Anonymous object in Source are ignored
object RemoveAllFromCollection(object oSource, object oDestination);

// Remove everything from a Collection
// - returns the now-empty Collection
object ClearCollection(object oCollection);

// Copy a Collection
// - returns a new Collection with all the members of oCollection
// note: the type of the result will be the same as the original
object CopyCollection(object oCollection);

// Copy a Collection as List
// - returns a new List with all the members of oCollection
object CopyCollectionAsList(object oCollection);

// Copy a Collection as Set
// - returns a new Set with all the members of oCollection
object CopyCollectionAsSet(object oCollection);

// 20030927 0.19.02 modified to describe Arrays
// agz 20031003 0.19.03 - modified to describe LabeledList

// Returns a new Collection with all the members of two Collections
// note: the type of the result will be the same of the First Collection
// when the first collection is a List,  all members of the second are appended
// when the first collection is a Set, only new members from the second are appended
// when both are Arrays, the merge is done by index, with Second replacing
//      First where needed. FirstCollection MaxCapacity is carried over and limits
// when both are LabeledLists labels of Second remove corresponding originating from
//      First
object SumCollection(object oFirstCollection, object oSecondCollection);

// 20030927 0.19.02 modified to describe Arrays
// agz 20031003 0.19.03 - modified to describe LabeledList

// Returns a new Collection with the members of the first Collection
//  that are not in the second
// note: the type of the result will be the same of the First Collection
// if the first collection is a List, only as many occurences of a given member
//      are dropped as there are in the second collection
// when both are Arrays, members of First are put at their index if there is
//      no element at the same index in Second.
// when both are LabeledLists, members of First are copied (with their label) if
//      there is no element with that label in Second
object DifferenceCollection(object oFirstCollection, object oSecondCollection);

// 20030927 0.19.02 modified to describe Arrays
// agz 20031003 0.19.03 - modified to describe LabeledList

// Returns a new Collection with the members of the first Collection
//  that are also in the second
// note: the type of the result will be the same of the First Collection
// if the first collection is a List, only as many occurences of a given member are kept
//  as there are in the second list
// when both are Arrays, members of First are put at their index if there is
//      an element at the same index in Second.
// when both are LabeledLists, members of First are copied (with their label) if
//      they are anonymous or there is an element with that label in Second
object IntersectCollection(object oFirstCollection, object oSecondCollection);


//////////////////////////////////////////////////
// GetAll Functions (Collectors)
//////////////////////////////////////////////////

// Get all the members of oMemberOfFaction's faction, add them to oResult
// - returns oResult; if oResult is OBJECT_INVALID a new List is created
// * Returns an empty List if oMemberOfFaction's faction is invalid.
object GetAllFactionMembers(object oMemberOfFaction, int bPCOnly=TRUE, object oResult=OBJECT_INVALID);

// Get all objects within oPersistentObject, add them to oResult
// - returns oResult; if oResult is OBJECT_INVALID a new List is created
// - oPersistentObject
// - nResidentObjectType: OBJECT_TYPE_*
// * Returns an empty List  if no object is found.
object GetAllInPersistentObject(object oPersistentObject=OBJECT_SELF, int nResidentObjectType=OBJECT_TYPE_CREATURE, object oResult=OBJECT_INVALID);

// Get all items in oTarget's inventory, add them to oResult
// - returns oResult; if oResult is OBJECT_INVALID a new List is created
// * Returns an empty List if the caller is not a creature, item, placeable or store,
//   or if no item is found.
object GetAllItemsInInventory(object oTarget=OBJECT_SELF, object oResult=OBJECT_INVALID);

// Get all the objects in oArea, add them to oResult
// - returns oResult; if oResult is OBJECT_INVALID a new List is created
// If no valid area is specified, it will use the caller's area.
object GetAllObjectsInArea(object oArea=OBJECT_INVALID, object oResult=OBJECT_INVALID);

// Get all the objects in nShape, add them to oResult
// - returns oResult; if oResult is OBJECT_INVALID a new List is created
// - nShape: SHAPE_*
// - fSize:
//   -> If nShape == SHAPE_SPHERE, this is the radius of the sphere
//   -> If nShape == SHAPE_SPELLCYLINDER, this is the radius of the cylinder
//   -> If nShape == SHAPE_CONE, this is the widest radius of the cone
//   -> If nShape == SHAPE_CUBE, this is half the length of one of the sides of
//      the cube
// - lTarget: This is the centre of the effect, usually GetSpellTargetPosition(),
//   or the end of a cylinder or cone.
// - bLineOfSight: This controls whether to do a line-of-sight check on the
//   object returned. (This can be used to ensure that spell effects do not go through walls.)
// - nObjectFilter: This allows you to filter out undesired object types, using
//   bitwise "or".
//   For example, to return only creatures and doors, the value for this
//   parameter would be OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR
// - vOrigin: This is only used for cylinders and cones, and specifies the
//   origin of the effect(normally the spell-caster's position).
object GetAllObjectsInShape(int nShape, float fSize, location lTarget,int bLineOfSight=FALSE, int nObjectFilter=OBJECT_TYPE_CREATURE, vector vOrigin=[0.0,0.0,0.0], object oResult=OBJECT_INVALID);

// Get all the PC in the player list, add them to oResult
// - returns oResult; if oResult is OBJECT_INVALID a new List is created
object GetAllPCs(object oResult=OBJECT_INVALID);

// Get all the objects with the specified tag, add them to oResult
// - returns oResult; if oResult is OBJECT_INVALID a new List is created
object GetAllObjectsByTag(string sTag, object oResult=OBJECT_INVALID);


