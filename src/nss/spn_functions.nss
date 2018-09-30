// Credit goes to the writers of the NESS system for some of these functions
// (Parse Flags and Count PCs in radius/area)
//
//
//***************************  GLOBAL SWITCHES  ******************************//
//
//
//*********** remember to RE-BUILD the module when changing these ************//


//                           RESET TIMINGS
//                           =============
//
// Set this to the number of heartbeats you want the cleanup object to tick for,
// before cleaning an empty (no PCs) area of still living spawns, tickers and
// lootbags. 30 ticks is (about) 3 minutes. Recommended value: 30 or more.
//
// Placing a local int nCleanupOverride on an area marker overrides this setting
// for that marker's area.
const int nCleanupTick = 30;

// Set this to the number of heartbeats you want between chest resets for chests
// on trigger set TR98. 600 ticks is (about) an hour.
//
// Placing a local int nChestOverride on an area marker overrides this setting
// for that marker's area. It is currently not possible to override an
// individual chest in an area.
//
// If you want a particular chest to refresh every time a new batch of PCs enter
// an area, perhaps because it contains a needed key or for some similar reason,
// put the chest in as a placeable in the TR99 NPC trigger set instead of the
// TR98 chest trigger set.
const int nChestTimings = 600;

// This is the same as the chest parameter except that the spawns from these
// trigger sets despawn normally with the cleanup timer. If you want a boss
// to remain spawned in, set your nCleanupOverride to a large value for the
// area for now. I'll likely add functionality for specific spawns to override
// the area cleanup in the next release, as it would behave similarly to the
// dm possession tool which cuts the creature loose from the cleanup sweep.
//
// Think of this paramater as the CTxxxx setting on the area on enter event for
// this trigger set. To override these place a local int on the area marker with
// the name nxxOverride where xx is 95, 96 or 97.
const int n95Timings = 50;
const int n96Timings = 50;
const int n97Timings = 50;


//                           MISC. SETTINGS
//                           ==============
//
// Set this to FALSE to cause the cleanup timer routines to despawn creatures
// even if they roam into other areas (chasing PCs for example) or TRUE if you
// want to allow a roaming creature to live until killed by a PC or DM.
// This is the bAllowWander switch, renamed to avoid confusion with the
// wandering monster functionality.
const int bAllowRoam = TRUE;





//                           QUEUE SETTINGS
//                           ==============
//
// This determines if the queues are used or not. If set to FALSE, queues are
// bypassed entirely and spawns are done as the triggers fire them.
// Recommended settings:  FALSE   :(
const int bUseQueue  = FALSE; //main spawn queue
const int bUseQueue1 = FALSE; //TR98 and TR99 queue
const int bUseQueue2 = FALSE; //despawn queue


//            some important general notes about the queues
//
// I've disabled the queues (via the above consts of course :) after doing some
// extensive stress testing with the demo on my  P4 2.4 Gig client as a single
// player module and on an identical P4 server as a server hosted module.
// It seems that the queue actually performs WORSE when turned on with higher
// end systems under heavy stress (spawning in 50 or so creatures at a time, 500
// or so over a period of 10 seconds).
//
// The DelayCommand(SignalEvent()) queue servicing should only fire
// sequentially; after the 5th spawn on the queue gets spawned the 6th should be
// signalled. But it appears that the engine processes the script in order, and
// dumps all those delay commands on the stack, creating a huge number of pseudo
// heartbeats. If there are 200 spawns in the queue it is extremely sluggish on
// a P4.
//
// Destroying objects is expensive also. The despawn queue is as bad or
// possibly even worse than the spawn queues. Fortunately players have a
// tendancy to kill most if not all of their spawns, so this really would only
// be an issue in a city with a huge NPC count spawned in.
//
// The alternative seems to be to limit the queue size to a smaller number, but
// on high end systems its as easy to spawn 50 creatures directly as it is to
// spawn them from the queue. I don't see any lag from creatures entering the
// world at this threshold.
//
// If you're going to host on a P3 or writing a single player module where you
// want to account for a player's system being a P2 or a P3, you may get some
// improved performance with the queues turned on, and with a nMaxQueueSize set
// to about 60 or so. You'll have to do your own testing to get a feel for what
// is optimal.
//
// I considered again what Lucullo originally suggested to me, which basically
// was to spawn them as a block of 10 and then delay for the next block. This
// would certainly cut down on the number of DelayCommands pushed onto the stack
// but i really don't like the idea of part of a spawn being spawned in one
// block and the rest of the encounter spawning 5 or so seconds later. This
// could be coded to store data about membership and spawn 10, and if the 10th
// is splitting an encounter then also spawn the rest from that encounter, but
// that adds to the length of the script processing, a lowered TMI threshold
// for the script and additional cpu processing.  It also isn't worth it from
// my standpoint as i don't think it would really improve the performance that
// much when creature AI and total number of spawns in the world is taken into
// account. This is because there is a limit of how many creatures can be alert
// in the module at the same time. If you spawn 120 creatures into an area, they
// will just stand there and do nothing. The default AI seems to break when
// there are more than 60 creatures in an area. It is not just area localized
// with the number of spawns either, if you have 60 in one area and 60 in
// another the AI becomes sluggish again. However at about 45 or so in each
// area they're alert and aggressive. So you do have some improvement when the
// spawns are spread out over a large number of areas, but a world can only
// support so many living combat spawns. I suspect on my system that number is
// around 200 or so, which makes a queue the way this one works pretty much
// useless for me at least.


// Sets the maximum queue size. If the queue is full and a trigger is fired, the
// trigger resets itself without spawning the critters. Setting this value to 0
// sets the maximum queue size to an unlimited queue.
// This only affects the mob queue for TR00 through TR89.
const int nMaxQueueSize = 100;


// Set this to determine the rate at which the queue objects spawn creatures
// from the queue.  0.2 is 5 spawns per second,  0.1 is 10 spawns per second,
// 0.05 is 20 spawns per second etc.
const float fPulseFrequency  = 0.075;


//****************************************************************************//


//prototypes
int CountPCsInRadius(location lCenter, float fRadius, int nLOS, int nDM=FALSE);
object GetLowPCInRadius(location lCenter, float fRadius);
int ParseFlagValue(string sName, string sFlag, int nDefault);
int ParseSubFlagValue(string sName, string sFlag, string sSubFlag,int nDefault);
int CountPCsInArea(object oArea, int nDM = FALSE);
int GetIsPCInArea(object oArea);
void zap(object oArea);



void DSpeak(string s)
{
   int nVer = 2;

   if(nVer == 1)
     AssignCommand(GetModule(), SpeakString(s, TALKVOLUME_SHOUT));

   else if (nVer == 2)
   {
      PrintString(s);
      SendMessageToAllDMs(s);
   }

   else
    return;
}



int CountPCsInRadius(location lCenter, float fRadius, int nLOS, int nDM = FALSE)
{
    int nPCs = 0;
    object oPC = GetFirstObjectInShape(SHAPE_SPHERE, fRadius, lCenter, nLOS);
    while (oPC != OBJECT_INVALID)
    {
        if (GetIsPC(oPC))
        {
            if (GetIsDM(oPC))
            {
                if (nDM == TRUE)
                    nPCs++;
            }
            else
                nPCs++;
        }
        oPC = GetNextObjectInShape(SHAPE_SPHERE, fRadius, lCenter, nLOS);
    }
    return nPCs;
}



object GetLowPCInRadius(location lCenter, float fRadius)
{
    object oLowPC;
    int nHP;
    int nLevel = 61; //force assignment to oLowPC in the first iteration
    object oPC = GetFirstObjectInShape(SHAPE_SPHERE, fRadius, lCenter);
    while (oPC != OBJECT_INVALID)
    {
        if (GetIsPC(oPC))
        {
            if (!GetIsDM(oPC))
            {
                nHP = GetHitDice(oPC);
                if(nHP < nLevel)
                {
                   nLevel = nHP;
                   oLowPC = oPC;
                }
            }
        }
        oPC = GetNextObjectInShape(SHAPE_SPHERE, fRadius, lCenter);
    }
    return oLowPC;
}



int ParseFlagValue(string sName, string sFlag, int nDefault)
{
    int nValue;
    int nPos;

    nPos = FindSubString(sName, sFlag);
    if (nPos >= 0)
    {
        sName = GetStringRight(sName, GetStringLength(sName)
                               - (nPos + GetStringLength(sFlag)));

        nPos = FindSubString(sName, "_");
        if (nPos >= 0)
            sName = GetStringLeft(sName, nPos);

        if (TestStringAgainstPattern("*n", GetStringLeft(sName, 1)) == FALSE)
            nValue = TRUE;
        else
            nValue = StringToInt(sName);
    }
    else
       nValue = nDefault;

    return nValue;
}



int ParseSubFlagValue(string sName, string sFlag, string sSubFlag, int nDefault)
{
    int nValue;
    int nPos;

    nPos = FindSubString(sName, sFlag);
    if (nPos >= 0)
    {
        sName = GetStringRight(sName, GetStringLength(sName)
                               - (nPos + GetStringLength(sFlag)));

        nPos = FindSubString(sName, "_");
        if (nPos >= 0)
            sName = GetStringLeft(sName, nPos);

        // Retreive SubFlag
        nPos = FindSubString(sName, sSubFlag);
        if (nPos >= 0)
        {
            sName = GetStringRight(sName, GetStringLength(sName)
                                   - (nPos + GetStringLength(sSubFlag)));

            if(TestStringAgainstPattern("*n", GetStringLeft(sName, 1)) == FALSE)
                nValue = TRUE;
            else
                nValue = StringToInt(sName);
        }
        else
            nValue = nDefault;

    }
    else
        nValue = nDefault;

    return nValue;
}



int CountPCsInArea(object oArea, int nDM = FALSE)
{
   int nReturn = FALSE;

   object oPC = GetFirstPC();
   while(oPC != OBJECT_INVALID)
   {
      if(GetArea(oPC) == oArea)
      {
         if(GetIsDM(oPC) == TRUE)
         {
            if(nDM == TRUE)
               nReturn++;
         }
         else
            nReturn++;
      }
      oPC = GetNextPC();
   }
    return nReturn;
}



// Faster than the above function when T/F is the only result needed
// Does not count DMs.
int GetIsPCInArea(object oArea)
{
   object oMarker = GetLocalObject(oArea, "oTBSP");
   object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,
                                   PLAYER_CHAR_IS_PC, oMarker);

   if(oPC != OBJECT_INVALID)
      return TRUE;
   else
      return FALSE;
}



// cleanup corpses, remains etc.
// write your own custom handler here if you are using a corpse system or
// want to clean up items left on the ground.
void zap(object oArea)
{
   object oItem;
   int iObjType;
   string sTag;

   object oLoot = GetFirstObjectInArea(oArea);
   while(GetIsObjectValid(oLoot))
   {
        iObjType = GetObjectType(oLoot);
        if (iObjType == OBJECT_TYPE_PLACEABLE)
        {
           sTag = GetTag(oLoot);
           if (sTag == "BodyBag")
           {
              if(GetHasInventory(oLoot))
              {
                  oItem = GetFirstItemInInventory(oLoot);
                  while (GetIsObjectValid(oItem) == TRUE)
                  {
                     DestroyObject(oItem);
                     oItem = GetNextItemInInventory(oLoot);
                  }
              }
              if(GetIsObjectValid(oLoot))
                  DestroyObject(oLoot);
           }
        }
        oLoot = GetNextObjectInArea(oArea);
   }
}



