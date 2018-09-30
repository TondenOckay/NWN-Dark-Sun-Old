//::///////////////////////////////////////////////
//:: Name x2_def_ondeath
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default OnDeath script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    ExecuteScript("nw_c2_default7", OBJECT_SELF);

     effect e2 = EffectVisualEffect(VFX_DUR_GLOW_YELLOW);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, e2,

OBJECT_SELF);


}
