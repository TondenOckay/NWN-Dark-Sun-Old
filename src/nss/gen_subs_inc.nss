//  gen_subs_inc
////////////////////////////////////////////////////////////////////////////////
// Created By: Genisys / Guile
// Created On: 12/4/2016
////////////////////////////////////////////////////////////////////////////////
// Copyright © 2016 All Rights Reserved
////////////////////////////////////////////////////////////////////////////////
/*
   Yes, it really is such a fooking simple system!  ^.^

   But go ahead and screw it up, I know you want to!  :D
*/
////////////////////////////////////////////////////////////////////////////////
// Required Includes
#include "x3_inc_skin"

////////////////////////////////////////////////////////////////////////////////
// Declarations....

// Set oPC's subrace to nSub #
void GSS_SetSubrace(object oPC, object oNPC);

// Remove oPC's subrace & change them back to normal!
void GSS_RemoveSubrace(object oPC);

////////////////////////////////////////////////////////////////////////////////
// Definitions...

//------------------------------------------------------------------------------
void GSS_SetSubrace(object oPC, object oNPC){

  object oToCopy = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oNPC);
  if(oToCopy == OBJECT_INVALID){
    FloatingTextStringOnCreature("ERROR: NPC Missing Subrace Skin!", oPC, FALSE);
   return;
  }
  string sSubName = GetLocalString(oNPC, "GSS_SUBRACE_NAME");
  if(sSubName != "EnterSubraceNameExAcTlY"){ // Is this a legal subrace name?
     int nApp = GetAppearanceType(oNPC);
     SetSubRace(oPC, sSubName);
     SetCreatureAppearanceType(oPC, nApp);
     object oSkin = SKIN_SupportGetSkin(oPC);
     itemproperty ip = GetFirstItemProperty(oToCopy);
     while(GetIsItemPropertyValid(ip)){
       AddItemProperty(DURATION_TYPE_PERMANENT, ip, oSkin);
      ip = GetNextItemProperty(oToCopy);
     }
  } else { // Nope, so don't set anything!
    FloatingTextStringOnCreature("ERROR: Invalid Subrace Name Provided!", oPC, FALSE);
    return;
  }
}

void GSS_RemoveSubrace(object oPC){
 SetSubRace(oPC, "");
 int nRace = GetRacialType(oPC);
 object oSkin = SKIN_SupportGetSkin(oPC);
 itemproperty ip = GetFirstItemProperty(oSkin);
     while(GetIsItemPropertyValid(ip)){
       RemoveItemProperty(oSkin, ip);
      ip = GetNextItemProperty(oSkin);  }
 switch(nRace){
  case RACIAL_TYPE_DWARF:{
   SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_DWARF); }break;
  case RACIAL_TYPE_ELF:{
   SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_ELF); }break;
  case RACIAL_TYPE_GNOME:{
   SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_GNOME); }break;
  case RACIAL_TYPE_HALFELF:{
   SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_HALF_ELF); }break;
  case RACIAL_TYPE_HALFLING:{
   SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_HALFLING); }break;
  case RACIAL_TYPE_HALFORC:{
   SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_HALF_ORC); }break;
  case RACIAL_TYPE_HUMAN:{
   SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_HUMAN); }break;
 }
}
