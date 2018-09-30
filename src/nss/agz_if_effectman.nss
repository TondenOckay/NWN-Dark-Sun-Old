//::///////////////////////////////////////////////
//:: Name     Effect Encapsulation Functions
//:: FileName agz_if_effectman
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

// Extract the Effect from an Encapsulated Effect Object
// - eventually build an effect chain, see EnxEffectLinkEffects
effect ExtractEffect(object oEnxEffect);

// Link the two supplied encapsulated effects, returning oEnxChildEffect
// - when the actual Effect is extracted from oEnxChildEffect, an effect chain
//   is built extracting also the "parent" effect and linking it to the child
// - if the "parent" was itself linked, its "parent" will be extracted and linked,
//   and so on
// - the result is that when you ExtractEffect from a "child" you get the whole
//   chain of Effects going up the parentage link
// - note however that the Effects will be actually linked backward when extracting
//   them, so they will be in reverse order in the chain
// - please consider that there can be other subtle differences from the basic BW
//   EffectLinkEffects behaviour
object EnxEffectLinkEffects(object oEnxChildEffect, object oEnxParentEffect);

// Modify an Encapsulated Effect
// Set the subtype to Extraordinary
// (Effects default to magical if the subtype is not set)
object EnxExtraordinaryEffect(object oEnxEffect);

// Modify an Encapsulated Effect
// Set the subtype to Magical
// (Effects default to magical if the subtype is not set)
object EnxMagicalEffect(object oEnxEffect);

// Modify an Encapsulated Effect
// Set the subtype to Supernatural
// (Effects default to magical if the subtype is not set)
object EnxSupernaturalEffect(object oEnxEffect);

// Modify an Encapsulated Effect
// Set Encapsulated Effect to be versus a specific alignment.
// - nLawChaos: ALIGNMENT_LAWFUL/ALIGNMENT_CHAOTIC/ALIGNMENT_ALL
// - nGoodEvil: ALIGNMENT_GOOD/ALIGNMENT_EVIL/ALIGNMENT_ALL
object EnxVersusAlignmentEffect(object oEnxEffect, int nLawChaos=ALIGNMENT_ALL, int nGoodEvil=ALIGNMENT_ALL);

// Modify an Encapsulated Effect
// Set Encapsulated Effect to be versus nRacialType.
// - nRacialType: RACIAL_TYPE_*
object EnxVersusRacialTypeEffect(object oEnxEffect, int nRacialType);

// Modify an Encapsulated Effect
// Set Encapsulated Effect to be versus traps.
object EnxVersusTrapEffect(object oEnxEffect);

