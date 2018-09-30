//::///////////////////////////////////////////////
//:: Name     Effect Encapsulation Functions (autogen)
//:: FileName agz_if_effectaut
//:://////////////////////////////////////////////
/*
  Automatically generated from parsed nwscript 1.59
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

// Object encapsulation of the following Effect:
// Create a Heal effect. This should be applied as an instantaneous effect.
// * Returns an effect of type EFFECT_TYPE_INVALIDEFFECT if nDamageToHeal < 0.
object EnxEffectHeal(int nDamageToHeal);

// Object encapsulation of the following Effect:
// Create a Damage effect
// - nDamageAmount: amount of damage to be dealt. This should be applied as an
//   instantaneous effect.
// - nDamageType: DAMAGE_TYPE_*
// - nDamagePower: DAMAGE_POWER_*
object EnxEffectDamage(int nDamageAmount, int nDamageType = DAMAGE_TYPE_MAGICAL, int nDamagePower = DAMAGE_POWER_NORMAL);

// Object encapsulation of the following Effect:
// Create an Ability Increase effect
// - bAbilityToIncrease: ABILITY_*
object EnxEffectAbilityIncrease(int nAbilityToIncrease, int nModifyBy);

// Object encapsulation of the following Effect:
// Create a Damage Resistance effect that removes the first nAmount points of
// damage of type nDamageType, up to nLimit (or infinite if nLimit is 0)
// - nDamageType: DAMAGE_TYPE_*
// - nAmount
// - nLimit
object EnxEffectDamageResistance(int nDamageType, int nAmount, int nLimit = 0);

// Object encapsulation of the following Effect:
// Create a Resurrection effect. This should be applied as an instantaneous effect.
object EnxEffectResurrection();

// Object encapsulation of the following Effect:
// Create a Summon Creature effect.  The creature is created and placed into the
// caller's party/faction.
// - sCreatureResref: Identifies the creature to be summoned
// - nVisualEffectId: VFX_*
// - fDelaySeconds: There can be delay between the visual effect being played, and the
//   creature being added to the area
// - nUseAppearAnimation: should this creature play it's "appear" animation when it is
//   summoned. If zero, it will just fade in somewhere near the target.  If the value is 1
//   it will use the appear animation, and if it's 2 it will use appear2 (which doesn't exist for most creatures)
object EnxEffectSummonCreature(string sCreatureResref, int nVisualEffectId = VFX_NONE, float fDelaySeconds = 0.0f, int nUseAppearAnimation = 0);

// Object encapsulation of the following Effect:
// Create an AC Increase effect
// - nValue: size of AC increase
// - nModifyType: AC_*_BONUS
// - nDamageType: DAMAGE_TYPE_*
//   * Default value for nDamageType should only ever be used in this function prototype.
object EnxEffectACIncrease(int nValue, int nModifyType = AC_DODGE_BONUS, int nDamageType = AC_VS_DAMAGE_TYPE_ALL);

// Object encapsulation of the following Effect:
// Create an AC Decrease effect
// - nSave: SAVING_THROW_* (not SAVING_THROW_TYPE_*)
// - nValue: size of AC decrease
// - nSaveType: SAVING_THROW_TYPE_*
object EnxEffectSavingThrowIncrease(int nSave, int nValue, int nSaveType = SAVING_THROW_TYPE_ALL);

// Object encapsulation of the following Effect:
// Create an Attack Increase effect
// - nBonus: size of attack bonus
// - nModifierType: ATTACK_BONUS_*
object EnxEffectAttackIncrease(int nBonus, int nModifierType = ATTACK_BONUS_MISC);

// Object encapsulation of the following Effect:
// Create a Damage Reduction effect
// - nAmount: amount of damage reduction
// - nDamagePower: DAMAGE_POWER_*
// - nLimit: How much damage the effect can absorb before disappearing.
//   Set to zero for infinite
object EnxEffectDamageReduction(int nAmount, int nDamagePower, int nLimit = 0);

// Object encapsulation of the following Effect:
// Create a Damage Increase effect
// - nBonus: DAMAGE_BONUS_*
// - nDamageType: DAMAGE_TYPE_*
// NOTE! You *must* use the DAMAGE_BONUS_* constants! Using other values may
//       result in odd behaviour.
object EnxEffectDamageIncrease(int nBonus, int nDamageType = DAMAGE_TYPE_MAGICAL);

// Object encapsulation of the following Effect:
// Create an Entangle effect
// When applied, this effect will restrict the creature's movement and apply a
// (-2) to all attacks and a -4 to AC.
object EnxEffectEntangle();

// Object encapsulation of the following Effect:
// Create a Death effect
// - nSpectacularDeath: if this is TRUE, the creature to which this effect is
//   applied will die in an extraordinary fashion
// - nDisplayFeedback
object EnxEffectDeath(int nSpectacularDeath = FALSE, int nDisplayFeedback = TRUE);

// Object encapsulation of the following Effect:
// Create a Knockdown effect
// This effect knocks creatures off their feet, they will sit until the effect
// is removed. This should be applied as a temporary effect with a 3 second
// duration minimum (1 second to fall, 1 second sitting, 1 second to get up).
object EnxEffectKnockdown();

// Object encapsulation of the following Effect:
// Create a Curse effect.
// - nStrMod: strength modifier
// - nDexMod: dexterity modifier
// - nConMod: constitution modifier
// - nIntMod: intelligence modifier
// - nWisMod: wisdom modifier
// - nChaMod: charisma modifier
object EnxEffectCurse(int nStrMod = 1, int nDexMod = 1, int nConMod = 1, int nIntMod = 1, int nWisMod = 1, int nChaMod = 1);

// Object encapsulation of the following Effect:
// Create a Paralyze effect
object EnxEffectParalyze();

// Object encapsulation of the following Effect:
// Create a Spell Immunity effect.
// There is a known bug with this function. There *must* be a parameter specified
// when this is called (even if the desired parameter is SPELL_ALL_SPELLS),
// otherwise an effect of type EFFECT_TYPE_INVALIDEFFECT will be returned.
// - nImmunityToSpell: SPELL_*
// * Returns an effect of type EFFECT_TYPE_INVALIDEFFECT if nImmunityToSpell is
//   invalid.
object EnxEffectSpellImmunity(int nImmunityToSpell = SPELL_ALL_SPELLS);

// Object encapsulation of the following Effect:
// Create a Deaf effect
object EnxEffectDeaf();

// Object encapsulation of the following Effect:
// Create a Sleep effect
object EnxEffectSleep();

// Object encapsulation of the following Effect:
// Create a Charm effect
object EnxEffectCharmed();

// Object encapsulation of the following Effect:
// Create a Confuse effect
object EnxEffectConfused();

// Object encapsulation of the following Effect:
// Create a Frighten effect
object EnxEffectFrightened();

// Object encapsulation of the following Effect:
// Create a Dominate effect
object EnxEffectDominated();

// Object encapsulation of the following Effect:
// Create a Daze effect
object EnxEffectDazed();

// Object encapsulation of the following Effect:
// Create a Stun effect
object EnxEffectStunned();

// Object encapsulation of the following Effect:
// Create a Regenerate effect.
// - nAmount: amount of damage to be regenerated per time interval
// - fIntervalSeconds: length of interval in seconds
object EnxEffectRegenerate(int nAmount, float fIntervalSeconds);

// Object encapsulation of the following Effect:
// Create a Movement Speed Increase effect.
// - nPercentChange - range 0 through 99
// eg.
//    0 = no change in speed
//   50 = 50% faster
//   99 = almost twice as fast
object EnxEffectMovementSpeedIncrease(int nPercentChange);

// Object encapsulation of the following Effect:
// Create an Area Of Effect effect in the area of the creature it is applied to.
// If the scripts are not specified, default ones will be used.
object EnxEffectAreaOfEffect(int nAreaEffectId, string sOnEnterScript = "", string sHeartbeatScript = "", string sOnExitScript = "");

// Object encapsulation of the following Effect:
// * Create a Visual Effect that can be applied to an object.
// - nVisualEffectId
// - nMissEffect: if this is TRUE, a random vector near or past the target will
//   be generated, on which to play the effect
object EnxEffectVisualEffect(int nVisualEffectId, int nMissEffect = FALSE);

// Object encapsulation of the following Effect:
// Create a Beam effect.
// - nBeamVisualEffect: VFX_BEAM_*
// - oEffector: the beam is emitted from this creature
// - nBodyPart: BODY_NODE_*
// - bMissEffect: If this is TRUE, the beam will fire to a random vector near or
//   past the target
// * Returns an effect of type EFFECT_TYPE_INVALIDEFFECT if nBeamVisualEffect is
//   not valid.
object EnxEffectBeam(int nBeamVisualEffect, object oEffector, int nBodyPart, int bMissEffect = FALSE);

// Object encapsulation of the following Effect:
// Create a Spell Resistance Increase effect.
// - nValue: size of spell resistance increase
object EnxEffectSpellResistanceIncrease(int nValue);

// Object encapsulation of the following Effect:
// Create a Poison effect.
// - nPoisonType: POISON_*
object EnxEffectPoison(int nPoisonType);

// Object encapsulation of the following Effect:
// Create a Disease effect.
// - nDiseaseType: DISEASE_*
object EnxEffectDisease(int nDiseaseType);

// Object encapsulation of the following Effect:
// Create a Silence effect.
object EnxEffectSilence();

// Object encapsulation of the following Effect:
// Create a Haste effect.
object EnxEffectHaste();

// Object encapsulation of the following Effect:
// Create a Slow effect.
object EnxEffectSlow();

// Object encapsulation of the following Effect:
// Create an Immunity effect.
// - nImmunityType: IMMUNITY_TYPE_*
object EnxEffectImmunity(int nImmunityType);

// Object encapsulation of the following Effect:
// Creates a Damage Immunity Increase effect.
// - nDamageType: DAMAGE_TYPE_*
// - nPercentImmunity
object EnxEffectDamageImmunityIncrease(int nDamageType, int nPercentImmunity);

// Object encapsulation of the following Effect:
// Create a Temporary Hitpoints effect.
// - nHitPoints: a positive integer
// * Returns an effect of type EFFECT_TYPE_INVALIDEFFECT if nHitPoints < 0.
object EnxEffectTemporaryHitpoints(int nHitPoints);

// Object encapsulation of the following Effect:
// Create a Skill Increase effect.
// - nSkill: SKILL_*
// - nValue
// * Returns an effect of type EFFECT_TYPE_INVALIDEFFECT if nSkill is invalid.
object EnxEffectSkillIncrease(int nSkill, int nValue);

// Object encapsulation of the following Effect:
// Create a Turned effect.
object EnxEffectTurned();

// Object encapsulation of the following Effect:
// Create a Hit Point Change When Dying effect.
// - fHitPointChangePerRound: this can be positive or negative, but not zero.
// * Returns an effect of type EFFECT_TYPE_INVALIDEFFECT if fHitPointChangePerRound is 0.
object EnxEffectHitPointChangeWhenDying(float fHitPointChangePerRound);

// Object encapsulation of the following Effect:
// Create an Ability Decrease effect.
// - nAbility: ABILITY_*
// - nModifyBy: This is the amount by which to decrement the ability
object EnxEffectAbilityDecrease(int nAbility, int nModifyBy);

// Object encapsulation of the following Effect:
// Create an Attack Decrease effect.
// - nPenalty
// - nModifierType: ATTACK_BONUS_*
object EnxEffectAttackDecrease(int nPenalty, int nModifierType = ATTACK_BONUS_MISC);

// Object encapsulation of the following Effect:
// Create a Damage Decrease effect.
// - nPenalty
// - nDamageType: DAMAGE_TYPE_*
object EnxEffectDamageDecrease(int nPenalty, int nDamageType = DAMAGE_TYPE_MAGICAL);

// Object encapsulation of the following Effect:
// Create a Damage Immunity Decrease effect.
// - nDamageType: DAMAGE_TYPE_*
// - nPercentImmunity
object EnxEffectDamageImmunityDecrease(int nDamageType, int nPercentImmunity);

// Object encapsulation of the following Effect:
// Create an AC Decrease effect.
// - nValue
// - nModifyType: AC_*
// - nDamageType: DAMAGE_TYPE_*
//   * Default value for nDamageType should only ever be used in this function prototype.
object EnxEffectACDecrease(int nValue, int nModifyType = AC_DODGE_BONUS, int nDamageType = AC_VS_DAMAGE_TYPE_ALL);

// Object encapsulation of the following Effect:
// Create a Movement Speed Decrease effect.
// - nPercentChange - range 0 through 99
// eg.
//    0 = no change in speed
//   50 = 50% slower
//   99 = almost immobile
object EnxEffectMovementSpeedDecrease(int nPercentChange);

// Object encapsulation of the following Effect:
// Create a Saving Throw Decrease effect.
// - nSave
// - nValue
// - nSaveType: SAVING_THROW_TYPE_*
object EnxEffectSavingThrowDecrease(int nSave, int nValue, int nSaveType = SAVING_THROW_TYPE_ALL);

// Object encapsulation of the following Effect:
// Create a Skill Decrease effect.
// * Returns an effect of type EFFECT_TYPE_INVALIDEFFECT if nSkill is invalid.
object EnxEffectSkillDecrease(int nSkill, int nValue);

// Object encapsulation of the following Effect:
// Create a Spell Resistance Decrease effect.
object EnxEffectSpellResistanceDecrease(int nValue);

// Object encapsulation of the following Effect:
// Create an Invisibility effect.
// - nInvisibilityType: INVISIBILITY_TYPE_*
// * Returns an effect of type EFFECT_TYPE_INVALIDEFFECT if nInvisibilityType
//   is invalid.
object EnxEffectInvisibility(int nInvisibilityType);

// Object encapsulation of the following Effect:
// Create a Concealment effect.
// - nPercentage: 1-100 inclusive
// - nMissChanceType: MISS_CHANCE_TYPE_*
// * Returns an effect of type EFFECT_TYPE_INVALIDEFFECT if nPercentage < 1 or
//   nPercentage > 100.
object EnxEffectConcealment(int nPercentage, int nMissType = MISS_CHANCE_TYPE_NORMAL);

// Object encapsulation of the following Effect:
// Create a Darkness effect.
object EnxEffectDarkness();

// Object encapsulation of the following Effect:
// Create a Dispel Magic All effect.
object EnxEffectDispelMagicAll(int nCasterLevel);

// Object encapsulation of the following Effect:
// Create an Ultravision effect.
object EnxEffectUltravision();

// Object encapsulation of the following Effect:
// Create a Negative Level effect.
// - nNumLevels: the number of negative levels to apply.
// * Returns an effect of type EFFECT_TYPE_INVALIDEFFECT if nNumLevels > 100.
object EnxEffectNegativeLevel(int nNumLevels, int bHPBonus = FALSE);

// Object encapsulation of the following Effect:
// Create a Polymorph effect.
object EnxEffectPolymorph(int nPolymorphSelection, int nLocked = FALSE);

// Object encapsulation of the following Effect:
// Create a Sanctuary effect.
// - nDifficultyClass: must be a non-zero, positive number
// * Returns an effect of type EFFECT_TYPE_INVALIDEFFECT if nDifficultyClass <= 0.
object EnxEffectSanctuary(int nDifficultyClass);

// Object encapsulation of the following Effect:
// Create a True Seeing effect.
object EnxEffectTrueSeeing();

// Object encapsulation of the following Effect:
// Create a See Invisible effect.
object EnxEffectSeeInvisible();

// Object encapsulation of the following Effect:
// Create a Time Stop effect.
object EnxEffectTimeStop();

// Object encapsulation of the following Effect:
// Create a Blindness effect.
object EnxEffectBlindness();

// Object encapsulation of the following Effect:
// Create a Spell Level Absorption effect.
// - nMaxSpellLevelAbsorbed: maximum spell level that will be absorbed by the
//   effect
// - nTotalSpellLevelsAbsorbed: maximum number of spell levels that will be
//   absorbed by the effect
// - nSpellSchool: SPELL_SCHOOL_*
// * Returns an effect of type EFFECT_TYPE_INVALIDEFFECT if:
//   nMaxSpellLevelAbsorbed is not between -1 and 9 inclusive, or nSpellSchool
//   is invalid.
object EnxEffectSpellLevelAbsorption(int nMaxSpellLevelAbsorbed, int nTotalSpellLevelsAbsorbed = 0, int nSpellSchool = SPELL_SCHOOL_GENERAL);

// Object encapsulation of the following Effect:
// Create a Dispel Magic Best effect.
object EnxEffectDispelMagicBest(int nCasterLevel);

// Object encapsulation of the following Effect:
// Create a Miss Chance effect.
// - nPercentage: 1-100 inclusive
// - nMissChanceType: MISS_CHANCE_TYPE_*
// * Returns an effect of type EFFECT_TYPE_INVALIDEFFECT if nPercentage < 1 or
//   nPercentage > 100.
object EnxEffectMissChance(int nPercentage, int nMissChanceType = MISS_CHANCE_TYPE_NORMAL);

// Object encapsulation of the following Effect:
// Create a Disappear/Appear effect.
// The object will "fly away" for the duration of the effect and will reappear
// at lLocation.
// - nAnimation determines which appear and disappear animations to use. Most creatures
// only have animation 1, although a few have 2 (like beholders)
object EnxEffectDisappearAppear(location lLocation, int nAnimation = 1);

// Object encapsulation of the following Effect:
// Create a Disappear effect to make the object "fly away" and then destroy
// itself.
// - nAnimation determines which appear and disappear animations to use. Most creatures
// only have animation 1, although a few have 2 (like beholders)
object EnxEffectDisappear(int nAnimation = 1);

// Object encapsulation of the following Effect:
// Create an Appear effect to make the object "fly in".
// - nAnimation determines which appear and disappear animations to use. Most creatures
// only have animation 1, although a few have 2 (like beholders)
object EnxEffectAppear(int nAnimation = 1);

// Object encapsulation of the following Effect:
// Create a Modify Attacks effect to add attacks.
// - nAttacks: maximum is 5, even with the effect stacked
// * Returns an effect of type EFFECT_TYPE_INVALIDEFFECT if nAttacks > 5.
object EnxEffectModifyAttacks(int nAttacks);

// Object encapsulation of the following Effect:
// Create a Damage Shield effect which does (nDamageAmount + nRandomAmount)
// damage to any melee attacker on a successful attack of damage type nDamageType.
// - nDamageAmount: an integer value
// - nRandomAmount: DAMAGE_BONUS_*
// - nDamageType: DAMAGE_TYPE_*
// NOTE! You *must* use the DAMAGE_BONUS_* constants! Using other values may
//       result in odd behaviour.
object EnxEffectDamageShield(int nDamageAmount, int nRandomAmount, int nDamageType);

// Object encapsulation of the following Effect:
// Create a Swarm effect.
// - nLooping: If this is TRUE, for the duration of the effect when one creature
//   created by this effect dies, the next one in the list will be created.  If
//   the last creature in the list dies, we loop back to the beginning and
//   sCreatureTemplate1 will be created, and so on...
// - sCreatureTemplate1
// - sCreatureTemplate2
// - sCreatureTemplate3
// - sCreatureTemplate4
object EnxEffectSwarm(int nLooping, string sCreatureTemplate1, string sCreatureTemplate2 = "", string sCreatureTemplate3 = "", string sCreatureTemplate4 = "");

// Object encapsulation of the following Effect:
// Create a Turn Resistance Decrease effect.
// - nHitDice: a positive number representing the number of hit dice for the
///  decrease
object EnxEffectTurnResistanceDecrease(int nHitDice);

// Object encapsulation of the following Effect:
// Create a Turn Resistance Increase effect.
// - nHitDice: a positive number representing the number of hit dice for the
//   increase
object EnxEffectTurnResistanceIncrease(int nHitDice);

// Object encapsulation of the following Effect:
// returns an effect that will petrify the target
// * currently applies EffectParalyze and the stoneskin visual effect.
object EnxEffectPetrify();

// Object encapsulation of the following Effect:
// returns an effect that is guaranteed to paralyze a creature.
// this effect is identical to EffectParalyze except that it cannot be resisted.
object EnxEffectCutsceneParalyze();

// Object encapsulation of the following Effect:
// Returns an effect that is guaranteed to dominate a creature
// Like EffectDominated but cannot be resisted
object EnxEffectCutsceneDominated();

// Object encapsulation of the following Effect:
// Creates an effect that inhibits spells
// - nPercent - percentage of failure
// - nSpellSchool - the school of spells affected.
object EnxEffectSpellFailure(int nPercent = 100, int nSpellSchool = SPELL_SCHOOL_GENERAL);

// Object encapsulation of the following Effect:
// Returns an effect of type EFFECT_TYPE_ETHEREAL which works just like EffectSanctuary
// except that the observers get no saving throw
object EnxEffectEthereal();

// Object encapsulation of the following Effect:
// Creates a cutscene ghost effect, this will allow creatures
// to pathfind through other creatures without bumping into them
// for the duration of the effect.
object EnxEffectCutsceneGhost();

// Object encapsulation of the following Effect:
// Returns an effect that when applied will paralyze the target's legs, rendering
// them unable to walk but otherwise unpenalized. This effect cannot be resisted.
object EnxEffectCutsceneImmobilize();

