void main()
{
 object oPC = OBJECT_SELF;
 SendMessageToPC(oPC, "You feel magical power flowing through your viens.");
 GiveXPToCreature(oPC, 250);
}
