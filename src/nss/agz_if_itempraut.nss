//::///////////////////////////////////////////////
//:: Name     Itemproperty Encaps. Functions (autogen)
//:: FileName agz_if_itempraut
//:://////////////////////////////////////////////
/*
  agz 20031221 0.20.01

  Automatically generated from parsed nwscript 1.59
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

// Object encapsulation of the following ItemProperty:
// Returns Item property ability bonus.  You need to specify an
// ability constant(IP_CONST_ABILITY_*) and the bonus.  The bonus should
// be a positive integer between 1 and 12.
object IPnxItemPropertyAbilityBonus(int nAbility, int nBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property AC bonus.  You need to specify the bonus.
// The bonus should be a positive integer between 1 and 20. The modifier
// type depends on the item it is being applied to.
object IPnxItemPropertyACBonus(int nBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property AC bonus vs. alignment group.  An example of
// an alignment group is Chaotic, or Good.  You need to specify the
// alignment group constant(IP_CONST_ALIGNMENTGROUP_*) and the AC bonus.
// The AC bonus should be an integer between 1 and 20.  The modifier
// type depends on the item it is being applied to.
object IPnxItemPropertyACBonusVsAlign(int nAlignGroup, int nACBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property AC bonus vs. Damage type (ie. piercing).  You
// need to specify the damage type constant(IP_CONST_DAMAGETYPE_*) and the
// AC bonus.  The AC bonus should be an integer between 1 and 20.  The
// modifier type depends on the item it is being applied to.
// NOTE: Only the first 3 damage types may be used here, the 3 basic
//       physical types.
object IPnxItemPropertyACBonusVsDmgType(int nDamageType, int nACBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property AC bonus vs. Racial group.  You need to specify
// the racial group constant(IP_CONST_RACIALTYPE_*) and the AC bonus.  The AC
// bonus should be an integer between 1 and 20.  The modifier type depends
// on the item it is being applied to.
object IPnxItemPropertyACBonusVsRace(int nRace, int nACBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property AC bonus vs. Specific alignment.  You need to
// specify the specific alignment constant(IP_CONST_ALIGNMENT_*) and the AC
// bonus.  The AC bonus should be an integer between 1 and 20.  The
// modifier type depends on the item it is being applied to.
object IPnxItemPropertyACBonusVsSAlign(int nAlign, int nACBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property Enhancement bonus.  You need to specify the
// enhancement bonus.  The Enhancement bonus should be an integer between
// 1 and 20.
object IPnxItemPropertyEnhancementBonus(int nEnhancementBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property Enhancement bonus vs. an Alignment group.  You
// need to specify the alignment group constant(IP_CONST_ALIGNMENTGROUP_*)
// and the enhancement bonus.  The Enhancement bonus should be an integer
// between 1 and 20.
object IPnxItemPropertyEnhancementBonusVsAlign(int nAlignGroup, int nBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property Enhancement bonus vs. Racial group.  You need
// to specify the racial group constant(IP_CONST_RACIALTYPE_*) and the
// enhancement bonus.  The enhancement bonus should be an integer between
// 1 and 20.
object IPnxItemPropertyEnhancementBonusVsRace(int nRace, int nBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property Enhancement bonus vs. a specific alignment.  You
// need to specify the alignment constant(IP_CONST_ALIGNMENT_*) and the
// enhancement bonus.  The enhancement bonus should be an integer between
// 1 and 20.
object IPnxItemPropertyEnhancementBonusVsSAlign(int nAlign, int nBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property Enhancment penalty.  You need to specify the
// enhancement penalty.  The enhancement penalty should be a POSITIVE
// integer between 1 and 5 (ie. 1 = -1).
object IPnxItemPropertyEnhancementPenalty(int nPenalty);

// Object encapsulation of the following ItemProperty:
// Returns Item property weight reduction.  You need to specify the weight
// reduction constant(IP_CONST_REDUCEDWEIGHT_*).
object IPnxItemPropertyWeightReduction(int nReduction);

// Object encapsulation of the following ItemProperty:
// Returns Item property Bonus Feat.  You need to specify the the feat
// constant(IP_CONST_FEAT_*).
object IPnxItemPropertyBonusFeat(int nFeat);

// Object encapsulation of the following ItemProperty:
// Returns Item property Bonus level spell (Bonus spell of level).  You must
// specify the class constant(IP_CONST_CLASS_*) of the bonus spell(MUST BE a
// spell casting class) and the level of the bonus spell.  The level of the
// bonus spell should be an integer between 0 and 9.
object IPnxItemPropertyBonusLevelSpell(int nClass, int nSpellLevel);

// Object encapsulation of the following ItemProperty:
// Returns Item property Cast spell.  You must specify the spell constant
// (IP_CONST_CASTSPELL_*) and the number of uses constant(IP_CONST_CASTSPELL_NUMUSES_*).
// NOTE: The number after the name of the spell in the constant is the level
//       at which the spell will be cast.  Sometimes there are multiple copies
//       of the same spell but they each are cast at a different level.  The higher
//       the level, the more cost will be added to the item.
// NOTE: The list of spells that can be applied to an item will depend on the
//       item type.  For instance there are spells that can be applied to a wand
//       that cannot be applied to a potion.  Below is a list of the types and the
//       spells that are allowed to be placed on them.  If you try to put a cast
//       spell effect on an item that is not allowed to have that effect it will
//       not work.
// NOTE: Even if spells have multiple versions of different levels they are only
//       listed below once.
//
// WANDS:
//          Acid_Splash
//          Activate_Item
//          Aid
//          Amplify
//          Animate_Dead
//          AuraOfGlory
//          BalagarnsIronHorn
//          Bane
//          Banishment
//          Barkskin
//          Bestow_Curse
//          Bigbys_Clenched_Fist
//          Bigbys_Crushing_Hand
//          Bigbys_Forceful_Hand
//          Bigbys_Grasping_Hand
//          Bigbys_Interposing_Hand
//          Bless
//          Bless_Weapon
//          Blindness/Deafness
//          Blood_Frenzy
//          Bombardment
//          Bulls_Strength
//          Burning_Hands
//          Call_Lightning
//          Camoflage
//          Cats_Grace
//          Charm_Monster
//          Charm_Person
//          Charm_Person_or_Animal
//          Clairaudience/Clairvoyance
//          Clarity
//          Color_Spray
//          Confusion
//          Continual_Flame
//          Cure_Critical_Wounds
//          Cure_Light_Wounds
//          Cure_Minor_Wounds
//          Cure_Moderate_Wounds
//          Cure_Serious_Wounds
//          Darkness
//          Darkvision
//          Daze
//          Death_Ward
//          Dirge
//          Dismissal
//          Dispel_Magic
//          Displacement
//          Divine_Favor
//          Divine_Might
//          Divine_Power
//          Divine_Shield
//          Dominate_Animal
//          Dominate_Person
//          Doom
//          Dragon_Breath_Acid
//          Dragon_Breath_Cold
//          Dragon_Breath_Fear
//          Dragon_Breath_Fire
//          Dragon_Breath_Gas
//          Dragon_Breath_Lightning
//          Dragon_Breath_Paralyze
//          Dragon_Breath_Sleep
//          Dragon_Breath_Slow
//          Dragon_Breath_Weaken
//          Drown
//          Eagle_Spledor
//          Earthquake
//          Electric_Jolt
//          Elemental_Shield
//          Endurance
//          Endure_Elements
//          Enervation
//          Entangle
//          Entropic_Shield
//          Etherealness
//          Expeditious_Retreat
//          Fear
//          Find_Traps
//          Fireball
//          Firebrand
//          Flame_Arrow
//          Flame_Lash
//          Flame_Strike
//          Flare
//          Foxs_Cunning
//          Freedom_of_Movement
//          Ghostly_Visage
//          Ghoul_Touch
//          Grease
//          Greater_Magic_Fang
//          Greater_Magic_Weapon
//          Grenade_Acid
//          Grenade_Caltrops
//          Grenade_Chicken
//          Grenade_Choking
//          Grenade_Fire
//          Grenade_Holy
//          Grenade_Tangle
//          Grenade_Thunderstone
//          Gust_of_wind
//          Hammer_of_the_Gods
//          Haste
//          Hold_Animal
//          Hold_Monster
//          Hold_Person
//          Ice_Storm
//          Identify
//          Improved_Invisibility
//          Inferno
//          Inflict_Critical_Wounds
//          Inflict_Light_Wounds
//          Inflict_Minor_Wounds
//          Inflict_Moderate_Wounds
//          Inflict_Serious_Wounds
//          Invisibility
//          Invisibility_Purge
//          Invisibility_Sphere
//          Isaacs_Greater_Missile_Storm
//          Isaacs_Lesser_Missile_Storm
//          Knock
//          Lesser_Dispel
//          Lesser_Restoration
//          Lesser_Spell_Breach
//          Light
//          Lightning_Bolt
//          Mage_Armor
//          Magic_Circle_against_Alignment
//          Magic_Fang
//          Magic_Missile
//          Manipulate_Portal_Stone
//          Mass_Camoflage
//          Melfs_Acid_Arrow
//          Meteor_Swarm
//          Mind_Blank
//          Mind_Fog
//          Negative_Energy_Burst
//          Negative_Energy_Protection
//          Negative_Energy_Ray
//          Neutralize_Poison
//          One_With_The_Land
//          Owls_Insight
//          Owls_Wisdom
//          Phantasmal_Killer
//          Planar_Ally
//          Poison
//          Polymorph_Self
//          Prayer
//          Protection_from_Alignment
//          Protection_From_Elements
//          Quillfire
//          Ray_of_Enfeeblement
//          Ray_of_Frost
//          Remove_Blindness/Deafness
//          Remove_Curse
//          Remove_Disease
//          Remove_Fear
//          Remove_Paralysis
//          Resist_Elements
//          Resistance
//          Restoration
//          Sanctuary
//          Scare
//          Searing_Light
//          See_Invisibility
//          Shadow_Conjuration
//          Shield
//          Shield_of_Faith
//          Silence
//          Sleep
//          Slow
//          Sound_Burst
//          Spike_Growth
//          Stinking_Cloud
//          Stoneskin
//          Summon_Creature_I
//          Summon_Creature_I
//          Summon_Creature_II
//          Summon_Creature_III
//          Summon_Creature_IV
//          Sunburst
//          Tashas_Hideous_Laughter
//          True_Strike
//          Undeaths_Eternal_Foe
//          Unique_Power
//          Unique_Power_Self_Only
//          Vampiric_Touch
//          Virtue
//          Wall_of_Fire
//          Web
//          Wounding_Whispers
//
// POTIONS:
//          Activate_Item
//          Aid
//          Amplify
//          AuraOfGlory
//          Bane
//          Barkskin
//          Barkskin
//          Barkskin
//          Bless
//          Bless_Weapon
//          Bless_Weapon
//          Blood_Frenzy
//          Bulls_Strength
//          Bulls_Strength
//          Bulls_Strength
//          Camoflage
//          Cats_Grace
//          Cats_Grace
//          Cats_Grace
//          Clairaudience/Clairvoyance
//          Clairaudience/Clairvoyance
//          Clairaudience/Clairvoyance
//          Clarity
//          Continual_Flame
//          Cure_Critical_Wounds
//          Cure_Critical_Wounds
//          Cure_Critical_Wounds
//          Cure_Light_Wounds
//          Cure_Light_Wounds
//          Cure_Minor_Wounds
//          Cure_Moderate_Wounds
//          Cure_Moderate_Wounds
//          Cure_Moderate_Wounds
//          Cure_Serious_Wounds
//          Cure_Serious_Wounds
//          Cure_Serious_Wounds
//          Darkness
//          Darkvision
//          Darkvision
//          Death_Ward
//          Dispel_Magic
//          Dispel_Magic
//          Displacement
//          Divine_Favor
//          Divine_Might
//          Divine_Power
//          Divine_Shield
//          Dragon_Breath_Acid
//          Dragon_Breath_Cold
//          Dragon_Breath_Fear
//          Dragon_Breath_Fire
//          Dragon_Breath_Gas
//          Dragon_Breath_Lightning
//          Dragon_Breath_Paralyze
//          Dragon_Breath_Sleep
//          Dragon_Breath_Slow
//          Dragon_Breath_Weaken
//          Eagle_Spledor
//          Eagle_Spledor
//          Eagle_Spledor
//          Elemental_Shield
//          Elemental_Shield
//          Endurance
//          Endurance
//          Endurance
//          Endure_Elements
//          Entropic_Shield
//          Ethereal_Visage
//          Ethereal_Visage
//          Etherealness
//          Expeditious_Retreat
//          Find_Traps
//          Foxs_Cunning
//          Foxs_Cunning
//          Foxs_Cunning
//          Freedom_of_Movement
//          Ghostly_Visage
//          Ghostly_Visage
//          Ghostly_Visage
//          Globe_of_Invulnerability
//          Greater_Bulls_Strength
//          Greater_Cats_Grace
//          Greater_Dispelling
//          Greater_Dispelling
//          Greater_Eagles_Splendor
//          Greater_Endurance
//          Greater_Foxs_Cunning
//          Greater_Magic_Weapon
//          Greater_Owls_Wisdom
//          Greater_Restoration
//          Greater_Spell_Mantle
//          Greater_Stoneskin
//          Grenade_Acid
//          Grenade_Caltrops
//          Grenade_Chicken
//          Grenade_Choking
//          Grenade_Fire
//          Grenade_Holy
//          Grenade_Tangle
//          Grenade_Thunderstone
//          Haste
//          Haste
//          Heal
//          Hold_Animal
//          Hold_Monster
//          Hold_Person
//          Identify
//          Invisibility
//          Lesser_Dispel
//          Lesser_Dispel
//          Lesser_Mind_Blank
//          Lesser_Restoration
//          Lesser_Spell_Mantle
//          Light
//          Light
//          Mage_Armor
//          Manipulate_Portal_Stone
//          Mass_Camoflage
//          Mind_Blank
//          Minor_Globe_of_Invulnerability
//          Minor_Globe_of_Invulnerability
//          Mordenkainens_Disjunction
//          Negative_Energy_Protection
//          Negative_Energy_Protection
//          Negative_Energy_Protection
//          Neutralize_Poison
//          One_With_The_Land
//          Owls_Insight
//          Owls_Wisdom
//          Owls_Wisdom
//          Owls_Wisdom
//          Polymorph_Self
//          Prayer
//          Premonition
//          Protection_From_Elements
//          Protection_From_Elements
//          Protection_from_Spells
//          Protection_from_Spells
//          Raise_Dead
//          Remove_Blindness/Deafness
//          Remove_Curse
//          Remove_Disease
//          Remove_Fear
//          Remove_Paralysis
//          Resist_Elements
//          Resist_Elements
//          Resistance
//          Resistance
//          Restoration
//          Resurrection
//          Rogues_Cunning
//          See_Invisibility
//          Shadow_Shield
//          Shapechange
//          Shield
//          Shield_of_Faith
//          Special_Alcohol_Beer
//          Special_Alcohol_Spirits
//          Special_Alcohol_Wine
//          Special_Herb_Belladonna
//          Special_Herb_Garlic
//          Spell_Mantle
//          Spell_Resistance
//          Spell_Resistance
//          Stoneskin
//          Tensers_Transformation
//          True_Seeing
//          True_Strike
//          Unique_Power
//          Unique_Power_Self_Only
//          Virtue
//
// GENERAL USE (ie. everything else):
//          Just about every spell is useable by all the general use items so instead we
//          will only list the ones that are not allowed:
//          Special_Alcohol_Beer
//          Special_Alcohol_Spirits
//          Special_Alcohol_Wine
//
object IPnxItemPropertyCastSpell(int nSpell, int nNumUses);

// Object encapsulation of the following ItemProperty:
// Returns Item property damage bonus.  You must specify the damage type constant
// (IP_CONST_DAMAGETYPE_*) and the amount of damage constant(IP_CONST_DAMAGEBONUS_*).
// NOTE: not all the damage types will work, use only the following: Acid, Bludgeoning,
//       Cold, Electrical, Fire, Piercing, Slashing, Sonic.
object IPnxItemPropertyDamageBonus(int nDamageType, int nDamage);

// Object encapsulation of the following ItemProperty:
// Returns Item property damage bonus vs. Alignment groups.  You must specify the
// alignment group constant(IP_CONST_ALIGNMENTGROUP_*) and the damage type constant
// (IP_CONST_DAMAGETYPE_*) and the amount of damage constant(IP_CONST_DAMAGEBONUS_*).
// NOTE: not all the damage types will work, use only the following: Acid, Bludgeoning,
//       Cold, Electrical, Fire, Piercing, Slashing, Sonic.
object IPnxItemPropertyDamageBonusVsAlign(int nAlignGroup, int nDamageType, int nDamage);

// Object encapsulation of the following ItemProperty:
// Returns Item property damage bonus vs. specific race.  You must specify the
// racial group constant(IP_CONST_RACIALTYPE_*) and the damage type constant
// (IP_CONST_DAMAGETYPE_*) and the amount of damage constant(IP_CONST_DAMAGEBONUS_*).
// NOTE: not all the damage types will work, use only the following: Acid, Bludgeoning,
//       Cold, Electrical, Fire, Piercing, Slashing, Sonic.
object IPnxItemPropertyDamageBonusVsRace(int nRace, int nDamageType, int nDamage);

// Object encapsulation of the following ItemProperty:
// Returns Item property damage bonus vs. specific alignment.  You must specify the
// specific alignment constant(IP_CONST_ALIGNMENT_*) and the damage type constant
// (IP_CONST_DAMAGETYPE_*) and the amount of damage constant(IP_CONST_DAMAGEBONUS_*).
// NOTE: not all the damage types will work, use only the following: Acid, Bludgeoning,
//       Cold, Electrical, Fire, Piercing, Slashing, Sonic.
object IPnxItemPropertyDamageBonusVsSAlign(int nAlign, int nDamageType, int nDamage);

// Object encapsulation of the following ItemProperty:
// Returns Item property damage immunity.  You must specify the damage type constant
// (IP_CONST_DAMAGETYPE_*) that you want to be immune to and the immune bonus percentage
// constant(IP_CONST_DAMAGEIMMUNITY_*).
// NOTE: not all the damage types will work, use only the following: Acid, Bludgeoning,
//       Cold, Electrical, Fire, Piercing, Slashing, Sonic.
object IPnxItemPropertyDamageImmunity(int nDamageType, int nImmuneBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property damage penalty.  You must specify the damage penalty.
// The damage penalty should be a POSITIVE integer between 1 and 5 (ie. 1 = -1).
object IPnxItemPropertyDamagePenalty(int nPenalty);

// Object encapsulation of the following ItemProperty:
// Returns Item property damage reduction.  You must specify the enhancment level
// (IP_CONST_DAMAGEREDUCTION_*) that is required to get past the damage reduction
// and the amount of HP of damage constant(IP_CONST_DAMAGESOAK_*) will be soaked
// up if your weapon is not of high enough enhancement.
object IPnxItemPropertyDamageReduction(int nEnhancement, int nHPSoak);

// Object encapsulation of the following ItemProperty:
// Returns Item property damage resistance.  You must specify the damage type
// constant(IP_CONST_DAMAGETYPE_*) and the amount of HP of damage constant
// (IP_CONST_DAMAGERESIST_*) that will be resisted against each round.
object IPnxItemPropertyDamageResistance(int nDamageType, int nHPResist);

// Object encapsulation of the following ItemProperty:
// Returns Item property damage vulnerability.  You must specify the damage type
// constant(IP_CONST_DAMAGETYPE_*) that you want the user to be extra vulnerable to
// and the percentage vulnerability constant(IP_CONST_DAMAGEVULNERABILITY_*).
object IPnxItemPropertyDamageVulnerability(int nDamageType, int nVulnerability);

// Object encapsulation of the following ItemProperty:
// Return Item property Darkvision.
object IPnxItemPropertyDarkvision();

// Object encapsulation of the following ItemProperty:
// Return Item property decrease ability score.  You must specify the ability
// constant(IP_CONST_ABILITY_*) and the modifier constant.  The modifier must be
// a POSITIVE integer between 1 and 10 (ie. 1 = -1).
object IPnxItemPropertyDecreaseAbility(int nAbility, int nModifier);

// Object encapsulation of the following ItemProperty:
// Returns Item property decrease Armor Class.  You must specify the armor
// modifier type constant(IP_CONST_ACMODIFIERTYPE_*) and the armor class penalty.
// The penalty must be a POSITIVE integer between 1 and 5 (ie. 1 = -1).
object IPnxItemPropertyDecreaseAC(int nModifierType, int nPenalty);

// Object encapsulation of the following ItemProperty:
// Returns Item property decrease skill.  You must specify the constant for the
// skill to be decreased(SKILL_*) and the amount of the penalty.  The penalty
// must be a POSITIVE integer between 1 and 10 (ie. 1 = -1).
object IPnxItemPropertyDecreaseSkill(int nSkill, int nPenalty);

// Object encapsulation of the following ItemProperty:
// Returns Item property container reduced weight.  This is used for special
// containers that reduce the weight of the objects inside them.  You must
// specify the container weight reduction type constant(IP_CONST_CONTAINERWEIGHTRED_*).
object IPnxItemPropertyContainerReducedWeight(int nContainerType);

// Object encapsulation of the following ItemProperty:
// Returns Item property extra melee damage type.  You must specify the extra
// melee base damage type that you want applied.  It is a constant(IP_CONST_DAMAGETYPE_*).
// NOTE: only the first 3 base types (piercing, slashing, & bludgeoning are applicable
//       here.
// NOTE: It is also only applicable to melee weapons.
object IPnxItemPropertyExtraMeleeDamageType(int nDamageType);

// Object encapsulation of the following ItemProperty:
// Returns Item property extra ranged damage type.  You must specify the extra
// melee base damage type that you want applied.  It is a constant(IP_CONST_DAMAGETYPE_*).
// NOTE: only the first 3 base types (piercing, slashing, & bludgeoning are applicable
//       here.
// NOTE: It is also only applicable to ranged weapons.
object IPnxItemPropertyExtraRangeDamageType(int nDamageType);

// Object encapsulation of the following ItemProperty:
// Returns Item property haste.
object IPnxItemPropertyHaste();

// Object encapsulation of the following ItemProperty:
// Returns Item property Holy Avenger.
object IPnxItemPropertyHolyAvenger();

// Object encapsulation of the following ItemProperty:
// Returns Item property immunity to miscellaneous effects.  You must specify the
// effect to which the user is immune, it is a constant(IP_CONST_IMMUNITYMISC_*).
object IPnxItemPropertyImmunityMisc(int nImmunityType);

// Object encapsulation of the following ItemProperty:
// Returns Item property improved evasion.
object IPnxItemPropertyImprovedEvasion();

// Object encapsulation of the following ItemProperty:
// Returns Item property bonus spell resistance.  You must specify the bonus spell
// resistance constant(IP_CONST_SPELLRESISTANCEBONUS_*).
object IPnxItemPropertyBonusSpellResistance(int nBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property saving throw bonus vs. a specific effect or damage type.
// You must specify the save type constant(IP_CONST_SAVEVS_*) that the bonus is
// applied to and the bonus that is be applied.  The bonus must be an integer
// between 1 and 20.
object IPnxItemPropertyBonusSavingThrowVsX(int nBonusType, int nBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property saving throw bonus to the base type (ie. will, reflex,
// fortitude).  You must specify the base type constant(IP_CONST_SAVEBASETYPE_*)
// to which the user gets the bonus and the bonus that he/she will get.  The
// bonus must be an integer between 1 and 20.
object IPnxItemPropertyBonusSavingThrow(int nBaseSaveType, int nBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property keen.  This means a critical threat range of 19-20 on a
// weapon will be increased to 17-20 etc.
object IPnxItemPropertyKeen();

// Object encapsulation of the following ItemProperty:
// Returns Item property light.  You must specify the intesity constant of the
// light(IP_CONST_LIGHTBRIGHTNESS_*) and the color constant of the light
// (IP_CONST_LIGHTCOLOR_*).
object IPnxItemPropertyLight(int nBrightness, int nColor);

// Object encapsulation of the following ItemProperty:
// Returns Item property Max range strength modification (ie. mighty).  You must
// specify the maximum modifier for strength that is allowed on a ranged weapon.
// The modifier must be a positive integer between 1 and 20.
object IPnxItemPropertyMaxRangeStrengthMod(int nModifier);

// Object encapsulation of the following ItemProperty:
// Returns Item property no damage.  This means the weapon will do no damage in
// combat.
object IPnxItemPropertyNoDamage();

// Object encapsulation of the following ItemProperty:
// Returns Item property on hit -> do effect property.  You must specify the on
// hit property constant(IP_CONST_ONHIT_*) and the save DC constant(IP_CONST_ONHIT_SAVEDC_*).
// Some of the item properties require a special parameter as well.  If the
// property does not require one you may leave out the last one.  The list of
// the ones with 3 parameters and what they are are as follows:
//      ABILITYDRAIN      :nSpecial is the ability it is to drain.
//                         constant(IP_CONST_ABILITY_*)
//      BLINDNESS         :nSpecial is the duration/percentage of effecting victim.
//                         constant(IP_CONST_ONHIT_DURATION_*)
//      CONFUSION         :nSpecial is the duration/percentage of effecting victim.
//                         constant(IP_CONST_ONHIT_DURATION_*)
//      DAZE              :nSpecial is the duration/percentage of effecting victim.
//                         constant(IP_CONST_ONHIT_DURATION_*)
//      DEAFNESS          :nSpecial is the duration/percentage of effecting victim.
//                         constant(IP_CONST_ONHIT_DURATION_*)
//      DISEASE           :nSpecial is the type of desease that will effect the victim.
//                         constant(DISEASE_*)
//      DOOM              :nSpecial is the duration/percentage of effecting victim.
//                         constant(IP_CONST_ONHIT_DURATION_*)
//      FEAR              :nSpecial is the duration/percentage of effecting victim.
//                         constant(IP_CONST_ONHIT_DURATION_*)
//      HOLD              :nSpecial is the duration/percentage of effecting victim.
//                         constant(IP_CONST_ONHIT_DURATION_*)
//      ITEMPOISON        :nSpecial is the type of poison that will effect the victim.
//                         constant(IP_CONST_POISON_*)
//      SILENCE           :nSpecial is the duration/percentage of effecting victim.
//                         constant(IP_CONST_ONHIT_DURATION_*)
//      SLAYRACE          :nSpecial is the race that will be slain.
//                         constant(IP_CONST_RACIALTYPE_*)
//      SLAYALIGNMENTGROUP:nSpecial is the alignment group that will be slain(ie. chaotic).
//                         constant(IP_CONST_ALIGNMENTGROUP_*)
//      SLAYALIGNMENT     :nSpecial is the specific alignment that will be slain.
//                         constant(IP_CONST_ALIGNMENT_*)
//      SLEEP             :nSpecial is the duration/percentage of effecting victim.
//                         constant(IP_CONST_ONHIT_DURATION_*)
//      SLOW              :nSpecial is the duration/percentage of effecting victim.
//                         constant(IP_CONST_ONHIT_DURATION_*)
//      STUN              :nSpecial is the duration/percentage of effecting victim.
//                         constant(IP_CONST_ONHIT_DURATION_*)
object IPnxItemPropertyOnHitProps(int nProperty, int nSaveDC, int nSpecial = 0);

// Object encapsulation of the following ItemProperty:
// Returns Item property reduced saving throw vs. an effect or damage type.  You must
// specify the constant to which the penalty applies(IP_CONST_SAVEVS_*) and the
// penalty to be applied.  The penalty must be a POSITIVE integer between 1 and 20
// (ie. 1 = -1).
object IPnxItemPropertyReducedSavingThrowVsX(int nBaseSaveType, int nPenalty);

// Object encapsulation of the following ItemProperty:
// Returns Item property reduced saving to base type.  You must specify the base
// type to which the penalty applies (ie. will, reflex, or fortitude) and the penalty
// to be applied.  The constant for the base type starts with (IP_CONST_SAVEBASETYPE_*).
// The penalty must be a POSITIVE integer between 1 and 20 (ie. 1 = -1).
object IPnxItemPropertyReducedSavingThrow(int nBonusType, int nPenalty);

// Object encapsulation of the following ItemProperty:
// Returns Item property regeneration.  You must specify the regeneration amount.
// The amount must be an integer between 1 and 20.
object IPnxItemPropertyRegeneration(int nRegenAmount);

// Object encapsulation of the following ItemProperty:
// Returns Item property skill bonus.  You must specify the skill to which the user
// will get a bonus(SKILL_*) and the amount of the bonus.  The bonus amount must
// be an integer between 1 and 50.
object IPnxItemPropertySkillBonus(int nSkill, int nBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property spell immunity vs. specific spell.  You must specify the
// spell to which the user will be immune(IP_CONST_IMMUNITYSPELL_*).
object IPnxItemPropertySpellImmunitySpecific(int nSpell);

// Object encapsulation of the following ItemProperty:
// Returns Item property spell immunity vs. spell school.  You must specify the
// school to which the user will be immune(IP_CONST_SPELLSCHOOL_*).
object IPnxItemPropertySpellImmunitySchool(int nSchool);

// Object encapsulation of the following ItemProperty:
// Returns Item property Thieves tools.  You must specify the modifier you wish
// the tools to have.  The modifier must be an integer between 1 and 12.
object IPnxItemPropertyThievesTools(int nModifier);

// Object encapsulation of the following ItemProperty:
// Returns Item property Attack bonus.  You must specify an attack bonus.  The bonus
// must be an integer between 1 and 20.
object IPnxItemPropertyAttackBonus(int nBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property Attack bonus vs. alignment group.  You must specify the
// alignment group constant(IP_CONST_ALIGNMENTGROUP_*) and the attack bonus.  The
// bonus must be an integer between 1 and 20.
object IPnxItemPropertyAttackBonusVsAlign(int nAlignGroup, int nBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property attack bonus vs. racial group.  You must specify the
// racial group constant(IP_CONST_RACIALTYPE_*) and the attack bonus.  The bonus
// must be an integer between 1 and 20.
object IPnxItemPropertyAttackBonusVsRace(int nRace, int nBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property attack bonus vs. a specific alignment.  You must specify
// the alignment you want the bonus to work against(IP_CONST_ALIGNMENT_*) and the
// attack bonus.  The bonus must be an integer between 1 and 20.
object IPnxItemPropertyAttackBonusVsSAlign(int nAlignment, int nBonus);

// Object encapsulation of the following ItemProperty:
// Returns Item property attack penalty.  You must specify the attack penalty.
// The penalty must be a POSITIVE integer between 1 and 5 (ie. 1 = -1).
object IPnxItemPropertyAttackPenalty(int nPenalty);

// Object encapsulation of the following ItemProperty:
// Returns Item property unlimited ammo.  If you leave the parameter field blank
// it will be just a normal bolt, arrow, or bullet.  However you may specify that
// you want the ammunition to do special damage (ie. +1d6 Fire, or +1 enhancement
// bonus).  For this parmeter you use the constants beginning with:
//      (IP_CONST_UNLIMITEDAMMO_*).
object IPnxItemPropertyUnlimitedAmmo(int nAmmoDamage = IP_CONST_UNLIMITEDAMMO_BASIC);

// Object encapsulation of the following ItemProperty:
// Returns Item property limit use by alignment group.  You must specify the
// alignment group(s) that you want to be able to use this item(IP_CONST_ALIGNMENTGROUP_*).
object IPnxItemPropertyLimitUseByAlign(int nAlignGroup);

// Object encapsulation of the following ItemProperty:
// Returns Item property limit use by class.  You must specify the class(es) who
// are able to use this item(IP_CONST_CLASS_*).
object IPnxItemPropertyLimitUseByClass(int nClass);

// Object encapsulation of the following ItemProperty:
// Returns Item property limit use by race.  You must specify the race(s) who are
// allowed to use this item(IP_CONST_RACIALTYPE_*).
object IPnxItemPropertyLimitUseByRace(int nRace);

// Object encapsulation of the following ItemProperty:
// Returns Item property limit use by specific alignment.  You must specify the
// alignment(s) of those allowed to use the item(IP_CONST_ALIGNMENT_*).
object IPnxItemPropertyLimitUseBySAlign(int nAlignment);

// Object encapsulation of the following ItemProperty:
// Returns Item property vampiric regeneration.  You must specify the amount of
// regeneration.  The regen amount must be an integer between 1 and 20.
object IPnxItemPropertyVampiricRegeneration(int nRegenAmount);

// Object encapsulation of the following ItemProperty:
// Returns Item property Trap.  You must specify the trap level constant
// (IP_CONST_TRAPSTRENGTH_*) and the trap type constant(IP_CONST_TRAPTYPE_*).
object IPnxItemPropertyTrap(int nTrapLevel, int nTrapType);

// Object encapsulation of the following ItemProperty:
// Returns Item property true seeing.
object IPnxItemPropertyTrueSeeing();

// Object encapsulation of the following ItemProperty:
// Returns Item property Monster on hit apply effect property.  You must specify
// the property that you want applied on hit.  There are some properties that
// require an additional special parameter to be specified.  The others that
// don't require any additional parameter you may just put in the one.  The
// special cases are as follows:
//      ABILITYDRAIN:nSpecial is the ability to drain.
//                   constant(IP_CONST_ABILITY_*)
//      DISEASE     :nSpecial is the disease that you want applied.
//                   constant(DISEASE_*)
//      LEVELDRAIN  :nSpecial is the number of levels that you want drained.
//                   integer between 1 and 5.
//      POISON      :nSpecial is the type of poison that will effect the victim.
//                   constant(IP_CONST_POISON_*)
//      WOUNDING    :nSpecial is the amount of wounding.
//                   integer between 1 and 5.
// NOTE: Any that do not appear in the above list do not require the second
//       parameter.
// NOTE: These can only be applied to monster NATURAL weapons (ie. bite, claw,
//       gore, and slam).  IT WILL NOT WORK ON NORMAL WEAPONS.
object IPnxItemPropertyOnMonsterHitProperties(int nProperty, int nSpecial = 0);

// Object encapsulation of the following ItemProperty:
// Returns Item property turn resistance.  You must specify the resistance bonus.
// The bonus must be an integer between 1 and 50.
object IPnxItemPropertyTurnResistance(int nModifier);

// Object encapsulation of the following ItemProperty:
// Returns Item property Massive Critical.  You must specify the extra damage
// constant(IP_CONST_DAMAGEBONUS_*) of the criticals.
object IPnxItemPropertyMassiveCritical(int nDamage);

// Object encapsulation of the following ItemProperty:
// Returns Item property free action.
object IPnxItemPropertyFreeAction();

// Object encapsulation of the following ItemProperty:
// Returns Item property monster damage.  You must specify the amount of damage
// the monster's attack will do(IP_CONST_MONSTERDAMAGE_*).
// NOTE: These can only be applied to monster NATURAL weapons (ie. bite, claw,
//       gore, and slam).  IT WILL NOT WORK ON NORMAL WEAPONS.
object IPnxItemPropertyMonsterDamage(int nDamage);

// Object encapsulation of the following ItemProperty:
// Returns Item property immunity to spell level.  You must specify the level of
// which that and below the user will be immune.  The level must be an integer
// between 1 and 9.  By putting in a 3 it will mean the user is immune to all
// 3rd level and lower spells.
object IPnxItemPropertyImmunityToSpellLevel(int nLevel);

// Object encapsulation of the following ItemProperty:
// Returns Item property special walk.  If no parameters are specified it will
// automatically use the zombie walk.  This will apply the special walk animation
// to the user.
object IPnxItemPropertySpecialWalk(int nWalkType = 0);

// Object encapsulation of the following ItemProperty:
// Returns Item property healers kit.  You must specify the level of the kit.
// The modifier must be an integer between 1 and 12.
object IPnxItemPropertyHealersKit(int nModifier);

// Object encapsulation of the following ItemProperty:
// Returns Item property weight increase.  You must specify the weight increase
// constant(IP_CONST_WEIGHTINCREASE_*).
object IPnxItemPropertyWeightIncrease(int nWeight);

// Object encapsulation of the following ItemProperty:
// Creates an item property that (when applied to a weapon item) causes a spell to be cast
// when a successful strike is made, or (when applied to armor) is struck by an opponent.
// - nSpell uses the IP_CONST_ONHIT_CASTSPELL_* constants
object IPnxItemPropertyOnHitCastSpell(int nSpell, int nLevel);

// Object encapsulation of the following ItemProperty:
// Creates a visual effect (ITEM_VISUAL_*) that may be applied to
// melee weapons only.
object IPnxItemPropertyVisualEffect(int nEffect);

// Object encapsulation of the following ItemProperty:
// Creates an item property that offsets the effect on arcane spell failure
// that a particular item has. Parameters come from the ITEM_PROP_ASF_* group.
object IPnxItemPropertyArcaneSpellFailure(int nModLevel);

// Extract the ItemProperty from an Encapsulated Item Property Object
itemproperty ExtractItemProperty(object oObject);

