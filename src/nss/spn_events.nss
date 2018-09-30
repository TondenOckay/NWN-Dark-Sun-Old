#include "agz_if_packsmall"
#include "tokenizer_inc"
#include "spn_functions"

void SpnModLoad();
void SpnHB();
void SpnEnter(object oPC);
void SpnExit(object oPC);
void SpnDeath(object oSpawn);
void InitTicker();

//void main(){}

//on module load event
void SpnModLoad()
{
    object oArea, oTBSP, oMarker;

    object oQueue = GetObjectByTag("spn_queue");
    SetLocalObject(GetModule(), "oSpawnQueue", oQueue);
    oQueue = GetObjectByTag("spn_queue_dsp");
    SetLocalObject(GetModule(), "oSpawnQueue_dsp", oQueue);
    oQueue = GetObjectByTag("spn_queue_npc");
    SetLocalObject(GetModule(), "oSpawnQueue_npc", oQueue);

    oTBSP = GetAllObjectsByTag("TBSP_Marker");
    oMarker = GetFirstObjectInCollection(oTBSP);

    while(GetIsObjectValid(oMarker))
    {
        oArea = GetArea(oMarker);
        SetLocalInt(oArea, "nTBSP", TRUE);
        SetLocalObject(oArea, "oTBSP", oMarker);
        oMarker = GetNextObjectInCollection(oTBSP);
    }

}



//Module heartbeat event
void SpnHB()
{
   int nGlobalTick = GetLocalInt(OBJECT_SELF, "nGlobalTick");
   nGlobalTick++;
   SetLocalInt(OBJECT_SELF, "nGlobalTick", nGlobalTick);
}



//area on enter event.
//
//nTBSP needs to be checked for, as some other spawners may be in use in the
//module (NESS in particular) which are not compatible with TBSP in the same
//area. The default bioware encounter system will cohabitate fine whith TBSP.
//This function can be placed in every on enter script as it does nothing if
//the area is not a TBSP area.
void SpnEnter(object oPC)
{
   object oArea = OBJECT_SELF;
   object oMarker = GetLocalObject(oArea, "oTBSP");
   object oCleanup = GetLocalObject(oMarker, "oCleanup");
   object oTicker = GetLocalObject(oMarker, "oTicker");
   int nRunAreaTriggerScript = FALSE;
   int nCleanupRunning;
   location lLoc;

   if(!GetLocalInt(oArea, "nTBSP"))
      return;

   if(GetIsPC(oPC))
   {
      //if the cleanup routine is running right now, we have a problem.
       nCleanupRunning = GetLocalInt(oCleanup, "nCleanupStarted");

      if(GetIsObjectValid(oCleanup)&& !nCleanupRunning)
      {
         DeleteLocalObject(oMarker, "oCleanup");
         DestroyObject(oCleanup);
         //DSpeak("Destroying cleanup object on enter");
         nRunAreaTriggerScript = TRUE;
      }

      if(!GetIsObjectValid(oTicker) || nCleanupRunning)
      {
         //create either a ticker or a dummy control object (no heartbeat)
         //depending on if the area has triggers that require servicing.
         lLoc = GetLocation(oMarker);

         if(GetLocalInt(oArea, "nAreaSpawnsOnly"))
         {
            oTicker = CreateObject(OBJECT_TYPE_PLACEABLE,
                                   "spn_ctrl_notick", lLoc);
            SetPlotFlag(oTicker, TRUE);
         }
         else
         {
            oTicker = CreateObject(OBJECT_TYPE_PLACEABLE,
                                   "spn_ctrl_tick", lLoc);
            SetPlotFlag(oTicker, TRUE);
         }

         //DSpeak("Creating ticker in area " + GetTag(oArea));

         if(GetIsObjectValid(oTicker))
         {
            SetLocalObject(oMarker, "oTicker", oTicker);
            SetLocalObject(oTicker, "oMarker", oMarker);
            InitTicker(); //initialize
            SetLocalInt(oMarker, "nNewTickerCreated", TRUE);
            nRunAreaTriggerScript = TRUE;
         }
         else
         {
            //DSpeak("spawn ticker creation failed");
            SendMessageToAllDMs(
            "Failed to create spawn ticker in area: " + GetName(oArea));
            PrintString(
            "Failed to create spawn ticker in area: " + GetName(oArea));
         }
      }

      //treat the area on enter like a trigger and fire the area spawn script
      if( GetLocalInt(oMarker, "nProcessAreaSpawns") && nRunAreaTriggerScript )
         SignalEvent(OBJECT_SELF, EventUserDefined(2000));
         //done this way due to TMI considerations.
         //ExecuteScript() directly from here would be simpler
         //but this guarantees its not counted as the same function
         //call off the stack. Yes i'm a paranoid scripter :)
   }
}


//area on exit event
void SpnExit(object oPC)
{
   object oArea = OBJECT_SELF;
   object oMarker = GetLocalObject(oArea, "oTBSP");
   object oCleanup = GetLocalObject(oMarker, "oCleanup");
   object oTicker = GetLocalObject(oMarker, "oTicker");

   if(!GetLocalInt(oArea, "nTBSP")) //sanity check to make sure we're in a TBSP
      return;                       //area before we create a cleanup object

   if(GetIsObjectValid(oCleanup))
      return; //we have a DM leaving an empty area, or a spawn chasing  a PC :)
              //ActionForceMoveToObject(oSpawnpoint) might be appropriate...

   if(!GetIsPCInArea(oArea) && GetIsObjectValid(oTicker))
   {
      oCleanup = CreateObject(OBJECT_TYPE_PLACEABLE,
                              "spn_cleanup", GetLocation(oMarker));
      SetLocalObject(oCleanup, "oMarker", oMarker);
      SetLocalObject(oMarker, "oCleanup", oCleanup);
      //DSpeak("Creating cleanup object in area " + GetTag(oArea) );
   }
}



//NPC on death event (goes in nw_c2_default7 and any custom variants)
void SpnDeath(object oSpawn)
{
    object oHatches = XGetLocalObject(oSpawn, "oHatches");
    if(oHatches != OBJECT_INVALID)
    {
       XDeleteLocalObject(oSpawn, "oHatches");
       RemoveFromCollection(oSpawn, oHatches);
    }
}




//------------ internal function for the on enter event ----------------------//
void InitTicker()
{
   object oArea = OBJECT_SELF;
   object oMarker = GetLocalObject(oArea, "oTBSP");
   object oTicker = GetLocalObject(oMarker, "oTicker");
   object oSpawnpoints, oHatches, oTriggers, oGroup, oTest;
   string sSpSetNumber, sHatchSet, sSpSets, sTiming, sName, sTok;
   int i, nCount, nPos, nMaxTickCycle;
   location lLoc;
   int nAreaSpawnsOnly = GetLocalInt(oArea, "nAreaSpawnsOnly");

   if(!GetLocalInt(oMarker, "nInitialized"))  //this is only done once per
   {                                          //server reset per area as this
      nMaxTickCycle = 0;                      //is all static data
      oTriggers = EmptySet();
      sSpSets = "";
      nAreaSpawnsOnly = TRUE;  //if we find triggers we'll set this to FALSE.

      //Sweep the area and enumerate the triggers and spawnpoints
      //and place them into collections on the area marker.
      //
      //Triggers are stored in sets labled as numbers (xx)corresponding to their
      //TRxx value, spawnpoints are stored as sxx corresponding to their TRxx
      //value, and hatch sets are stored as Hxx corresponding to the TRxx value
      //of the trigger sets they belong to.
      oTest = GetFirstObjectInArea();
      while(GetIsObjectValid(oTest))
      {
         sName = GetName(oTest);
         sTok = GetStringLeft(sName, 2); //TRxx_CTxxxx format or SP_TRxx format

         if(sTok == "TR" && GetObjectType(oTest) == OBJECT_TYPE_TRIGGER)
         {
            nAreaSpawnsOnly = FALSE;
            sSpSetNumber = GetSubString(sName, 2, 2);
            SetLocalString(oTest, "sSpSetNumber", sSpSetNumber);

            if(!GetIsTokenInString(sSpSetNumber, sSpSets))
               sSpSets = AddTokenToString(sSpSetNumber, sSpSets);

            nCount = FindSubString(sName, "CT") + 2;
            sName = GetStringRight(sName, GetStringLength(sName) - nCount);
            nCount = FindSubString(sName, "_");
            if(nCount >= 0)
               sTiming = GetStringLeft(sName, nCount);
            else
               sTiming = sName;

            oGroup = XGetLocalObject(oMarker, sSpSetNumber);

            if(!GetIsObjectValid(oGroup))
            {
               oGroup = EmptySet();
               XSetLocalObject(oMarker, sSpSetNumber, oGroup);
            }
            SetLocalInt(oTest, "nCycleFrequency", StringToInt(sTiming));
            SetLocalObject(oTest, "oMarker", oMarker);

            AddToCollection(oTest, oGroup);     //for trigger resets (ticker)
            AddToCollection(oTest, oTriggers);  //for trigger resets (cleanup)

            if(nMaxTickCycle < StringToInt(sTiming))
               nMaxTickCycle = StringToInt(sTiming);
         }
         else
         {
            if(sTok == "SP" && GetObjectType(oTest) == OBJECT_TYPE_WAYPOINT)
            {
               nPos = FindSubString(sName, "TR");
               if(nPos)
               {
                  sSpSetNumber = GetSubString(sName, nPos+2, 2);
                  oSpawnpoints = XGetLocalObject(oMarker, "s" + sSpSetNumber);
                  if(!GetIsObjectValid(oSpawnpoints))
                  {
                     oSpawnpoints = EmptySet();
                     XSetLocalObject(oMarker, "s" + sSpSetNumber, oSpawnpoints);
                  }

                  //TR90 and up are area on enter trigger sets (NPCs, etc.).
                  //There are no placed triggers so we have to add them here.
                  if( (StringToInt(sSpSetNumber) >= 90) &&
                      (!GetIsTokenInString(sSpSetNumber, sSpSets)) )
                  {
                     sSpSets = AddTokenToString(sSpSetNumber, sSpSets);
                     SetLocalInt(oMarker, "nProcessAreaSpawns", TRUE);
                     SetLocalInt(oMarker, "TR" +sSpSetNumber, TRUE);
                     //DSpeak("TR" +sSpSetNumber + " stored on area marker");
                  }

                  AddToCollection(oTest, oSpawnpoints);
                  //DSpeak("SizeOfCollection s"+sSpSetNumber + " is: "
                  //       + IntToString(SizeOfCollection(oSpawnpoints)));
               }
            }
         }
         oTest = GetNextObjectInArea();
      }
      //done enumerating the area

      SetLocalInt(oArea, "nAreaSpawnsOnly", nAreaSpawnsOnly);

      if(nAreaSpawnsOnly)  //get rid of the ticking object and replace
      {                    //it with a non heartbeat version
         lLoc = GetLocation(oMarker);
         if(GetIsObjectValid(oTicker))
         {
            SetPlotFlag(oTicker, FALSE);
            DestroyObject(oTicker);
         }
         oTicker = CreateObject(OBJECT_TYPE_PLACEABLE, "spn_ctrl_notick", lLoc);
         SetPlotFlag(oTicker, TRUE);
         //DSpeak("Creating dummy ticker from the area initialization routine");

         if(GetIsObjectValid(oTicker))
         {
            SetLocalObject(oMarker, "oTicker", oTicker);
            SetLocalObject(oTicker, "oMarker", oMarker);
         }
         else
         {
            //DSpeak("dummy ticker creation failed");
            SendMessageToAllDMs(
            "Failed to create dummy ticker in area: " + GetName(oArea));
            PrintString(
            "Failed to create dummy ticker in area: " + GetName(oArea));
         }
      }
      else
      {
         //avoid immediate reactivation of a trigger
         //when nMaxTickCycle == a trigger's reset cycle
         nMaxTickCycle++;

         //initialize the triggers themselves.
         //this sets the triggers active and enumerates their neighbours.
         oTest = GetFirstObjectInCollection(oTriggers);
         while(GetIsObjectValid(oTest))
         {
            SignalEvent(oTest,EventUserDefined(2001));
            oTest = GetNextObjectInCollection(oTriggers);
         }

         SetLocalInt(oMarker, "nMaxTickCycle", nMaxTickCycle);
         XSetLocalObject(oMarker, "oTriggers", oTriggers);
      }

      SetLocalString(oMarker, "sSpSets", sSpSets);  //to track hatches (cleanup)
      SetLocalInt(oMarker, "nInitialized", TRUE);
      //DSpeak("Area initialization completed.");
   }



   // this part is done every time a new ticker is created

   if(!nAreaSpawnsOnly)
      SetLocalInt(oTicker, "nMaxTickCycle",
                  GetLocalInt(oMarker, "nMaxTickCycle"));

   sSpSets = GetLocalString(oMarker, "sSpSets");
   nCount = GetTokenCount(sSpSets);
   for(i = 1; i <= nCount; i++)
   {
      sSpSetNumber = GetTokenFromString(i, sSpSets);
      sHatchSet = "H" + sSpSetNumber;
      oHatches = EmptyList();
      //DSpeak("Creating " +sHatchSet +" on ticker in area " +GetTag(oArea));
      XSetLocalObject(oTicker, sHatchSet, oHatches);
   }
}



