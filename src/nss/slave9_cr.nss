// Put this script OnEnter.


void main()
{
    object oTarget;

    // Get the creature who triggered this event.
    object oPC = GetEnteringObject();

    // Only fire for (real) PCs.
    if ( !GetIsPC(oPC)  ||  GetIsDMPossessed(oPC) )
        return;

    // Make "slave009" like the PC more.
    oTarget = GetObjectByTag("Slave7");
    AdjustReputation(oPC, oTarget, 100);
}

