#include "nw_i0_plot"
void main()
{
 //Either open the store with that tag or let the user know that no store exists.
 int nCount = 1;
 string sStoreTag = "DeadlyDeals_001"; // Set this to what you want
 object oStore = GetNearestObjectByTag(sStoreTag);
 while(GetIsObjectValid(oStore))
 {
 if(GetObjectType(oStore) == OBJECT_TYPE_STORE)
 {
 gplotAppraiseOpenStore(oStore, GetPCSpeaker());
 return;
 }
 oStore = GetNearestObjectByTag(sStoreTag, OBJECT_SELF, ++nCount);
 }
 ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
