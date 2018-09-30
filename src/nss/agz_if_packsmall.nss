//:://////////////////////////////////////////////////////////////
//:: Name     Package-building Includes: Reduced version
//:: FileName agz_if_packsmall
//:://////////////////////////////////////////////////////////////
/*

   This script includes the definitions and libraries
   of the first released (reduced) version of the package

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

//////// Groups

// Include the Basic Functions
// agz 20030923 0.19.01 moved constants to agz_constant_inc
#include "agz_constant_inc"
#include "agz_if_config"
#include "agz_if_basic"
#include "agz_aolibbfi_inc"

// Include the Primitive Encapsulation Functions
#include "agz_if_primitive"
#include "agz_pelibbfi_inc"

// Include the Effect Encapsulation Functions
#include "agz_if_effectaut"
#include "agz_if_effectman"
#include "agz_eelibafi_inc"
#include "agz_eelibbfi_inc"

// Include the ItemProperty Encapsulation Functions
// agz 20031221 0.20.01
#include "agz_if_itempraut"
#include "agz_iplibafi_inc"

// Include the Collection Library
#include "agz_if_collect"
// agz 20030927 0.19.02 added new functions
#include "agz_if_collect2"
#include "agz_cllibbfi_inc"
// agz 20030927 0.19.02 added new functions
#include "agz_cllibbf2_inc"
#include "agz_cllibcfi_inc"

// Include the Utility Library
#include "agz_if_utility"
#include "agz_utlibfun_inc"

// Include the Raw Objects (RawArray) Library
// agz 20030922 0.19.01
#include "agz_if_raw"
#include "agz_ralibafi_inc"
