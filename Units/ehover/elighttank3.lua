-- UNITDEF -- ELIGHTTANK3 --
--------------------------------------------------------------------------------

local unitName                   = "elighttank3"

--------------------------------------------------------------------------------

local power						 = [[3 power]]
local armortype					 = [[light]]
local supply					 = [[3]]

local weapon1Damage              = 60
local weapon1AOE				 = 1
local energycosttofire			 = weapon1Damage / 20 * ((weapon1AOE / 1000) + 1)

local function roundToFirstDecimal(energycosttofire)
    return math.floor(energycosttofire*10 + 0.5)*0.1
end

local unitDef                    = {

	--mobileunit 
	transportbyenemy             = false;
	--**

	acceleration                 = 1,
	brakeRate                    = 0.1,
	buildCostEnergy              = 0,
	buildCostMetal               = 27,
	builder                      = false,
	buildTime                    = 5,
	canAttack                    = true,
	cancollect                   = "1",
	canGuard                     = true,
	canHover                     = true,
	canMove                      = true,
	canPatrol                    = true,
	canstop                      = "1",
	category                     = "LIGHT NOTAIR RAID",
	corpse                       = "ammobox",
	description                  = [[Unit Type: Raider 
Armortype: ]] ..armortype.. [[ 

45 Damage vs Light/Armored
60 Damage vs Building 

Energy cost to fire: ]] .. roundToFirstDecimal(energycosttofire) .. [[ 

Requires +]] .. power .. [[ 
Uses +]] .. supply .. [[ Supply]],
	energyMake                   = 0,
	energyStorage                = 0,
	energyUse                    = 0,
	explodeAs                    = "smallExplosionGenericBlue",
	footprintX                   = 2,
	footprintZ                   = 2,
	iconType                     = "raider",
	idleAutoHeal                 = .5,
	idleTime                     = 2200,
	leaveTracks                  = false,
	maxDamage                    = 245,
	maxSlope                     = 26,
	maxVelocity                  = 5,
	maxReverseVelocity           = 2,
	maxWaterDepth                = 10,
	metalStorage                 = 0,
	movementClass                = "HOVERTANK2",
	name                         = "Kite",
	noChaseCategory              = "VTOL",
	objectName                   = "elighttank4.s3o",
	radarDistance                = 0,
	repairable		             = false,
	selfDestructAs               = "smallExplosionGenericBlue",
	side                         = "CORE",
	sightDistance                = 550,
	smoothAnim                   = true,
	stealth			             = true,
	seismicSignature             = 2,
	--  turnInPlace              = false,
	--  turnInPlaceSpeedLimit    = 5.5,
	turnInPlace                  = true,
	turnRate                     = 5000,
	--  turnrate                 = 475,
	unitname                     = "elighttank3",
	upright                      = true,
	workerTime                   = 0,

	sfxtypes                     = {
		explosiongenerators      = {
			"custom:electricity",
			"custom:dirt",
			"custom:blacksmoke",
		},
		pieceExplosionGenerators = {
			"deathceg3",
			"deathceg4",
		},	
	},

	sounds                       = {
		underattack              = "unitsunderattack1",
		ok                       = {
			"ack",
		},
		select                   = {
			"unitselect",
		},
	},
	weapons                      = {
		[1]                      = {
			def                  = "lighttankweapon",
			badTargetCategory    = "VTOL ARMORED WALL",
		},
	},
	customParams                 = {
		needed_cover             = 1,
		death_sounds             = "generic",
		RequireTech              = power,
		armortype                = armortype,
		nofriendlyfire	         = "1",
		supply_cost              = supply,
		normalstex               = "unittextures/lego2skin_explorernormal.dds", 
		buckettex                = "unittextures/lego2skin_explorerbucket.dds",
		factionname	             = "outer_colonies",  
		helptext                 = [[]],
	},
}


--------------------------------------------------------------------------------
-- Energy Per Shot Calculation is: dmg / 20 * ((aoe / 1000) + 1)

local weaponDefs                 = {
	lighttankweapon              = {
		badTargetCategory        = [[ARMORED BUILDING]],
		AreaOfEffect             = weapon1AOE,
		avoidFriendly            = false,
		avoidFeature             = false,
		collideFriendly          = false,
		collideFeature           = false,
		craterBoost              = 0,
		craterMult               = 0,
		explosionGenerator       = "custom:genericshellexplosion-medium-lightning",
		energypershot            = weapon1Damage / 20 * ((weapon1AOE / 1000) + 1),
		impulseBoost             = 0,
		impulseFactor            = 0,
		interceptedByShieldType  = 4,
		lineOfSight              = true,
		name			         = "elighttank3weapon",
		noSelfDamage             = true,
		range                    = 550,
		reloadtime               = 1,
		WeaponType               = "LightningCannon",
		rgbColor                 = "0.1 0.2 0.5",
		rgbColor2                = "0 0 1",
		soundStart               = "jacobs.wav",
		startsmoke               = "1",
		texture1                 = "lightning",
		thickness                = 5,
		turret                   = true,
		weaponVelocity           = 400,
		customparams             = {
			damagetype		     = "elighttank3",
			
			--Upgrades--
			upgradeClass		 = "groundweapons",
		},      
		damage                   = {
			default              = weapon1Damage,
		},
	},
}
unitDef.weaponDefs               = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName]    = unitDef })

--------------------------------------------------------------------------------
