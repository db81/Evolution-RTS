-- UNITDEF -- EFIGHTER --
--------------------------------------------------------------------------------

local unitName                   = "efighter"

--------------------------------------------------------------------------------

local unitDef                    = {

	--mobileunit 
	transportbyenemy             = false;

	--**


	acceleration                 = 0.5,
	airStrafe                    = true,
	bankscale                    = "1",
	brakeRate                    = 0.5,
	buildCostEnergy              = 0,
	buildCostMetal               = 30,
	buildTime                    = 2.5,
	canAttack                    = true,
	canFly                       = true,
	canGuard                     = true,
	canLoopbackAttack            = true,
	canMove                      = true,
	canPatrol                    = true,
	canstop                      = "1",
	category                     = "LIGHT VTOL",
	collide                      = true,
	corpse                       = "ammobox",
	cruiseAlt                    = 400,
	description                  = [[Air Superiority Fighter
	Light
	300 Damage vs Light/Armored/s
	75 Damage vs Building/s

	Requires +3 Power
	Uses +3 Supply]],
	energyMake                   = 0,
	energyStorage                = 0,
	energyUse                    = 0,
	explodeAs                    = "mediumExplosionGenericWhite",
	footprintX                   = 5,
	footprintZ                   = 5,
	hoverAttack                  = true,
	floater                      = true,
	iconType                     = "aa",
	idleAutoHeal                 = .5,
	idleTime                     = 2200,
	maxAcc                       = 0.25,
	maxBank			             = 5,
	maxDamage                    = 450,
	maxSlope                     = 10,
	maxVelocity                  = 16,
	verticalSpeed		         = 15,
	maxWaterDepth                = 255,
	metalStorage                 = 0,
	moverate1                    = "8",
	name                         = "Koyote",
	noChaseCategory              = "NOTAIR",
	objectName                   = "efighter2.s3o",
	script			             = "efighter2.cob",
	radarDistance                = 0,
	repairable		             = false,
	selfDestructAs               = "mediumExplosionGenericWhite",
	side                         = "ARM",
	sightDistance                = 1500,
	smoothAnim                   = true,
	sonarDistance                = 0,
	turnRate                     = 1500,
	unitname                     = "efighter",
	workerTime                   = 0,
	sfxtypes                     = { 
		pieceExplosionGenerators = { 
			"deathceg3", 
			"deathceg4", 
		}, 

		explosiongenerators      = {
			"custom:gdhcannon",
			"custom:jethtrail",
			"custom:blacksmoke",
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
			def                  = "antiaircannon",
			onlyTargetCategory   = "VTOL",
		},
	},
	customParams                 = {
		--    needed_cover       = 2,
		death_sounds             = "generic",
		RequireTech              = "3 Power",
		armortype                = "light",
		nofriendlyfire	         = "1",
		supply_cost              = 3,
		normalstex               = "unittextures/lego2skin_explorernormal.dds", 
		buckettex                = "unittextures/lego2skin_explorerbucket.dds",
		factionname	             = "outer_colonies",  
	},
}


--------------------------------------------------------------------------------
-- Energy Per Shot Calculation is: dmg / 20 * ((aoe / 1000) + 1)

local weapon1Damage              = 30
local weapon1AOE				 = 25

local weaponDefs                 = {
	antiaircannon                = {
		AreaOfEffect             = weapon1AOE,
		avoidFeature             = false,
		avoidFriendly            = false,
		collideFeature           = false,
		collideFriendly          = false,
		canAttackGround          = false,
		coreThickness            = 0.4,
		burnblow		         = true,
		--	cegTag               = "mediumcannonweapon3",
		duration                 = 0.05,
		energypershot            = weapon1Damage / 20 * ((weapon1AOE / 1000) + 1),
		explosionGenerator       = "custom:genericshellexplosion-large-sparks-burn",
		fallOffRate              = 1,
		fireStarter              = 50,
		impulseFactor            = 0,
		interceptedByShieldType  = 4,
		lineOfSight              = true,
		minintensity             = "1",
		name                     = "Laser",
		range                    = 1500,
		reloadtime               = 0.1,
		WeaponType               = "LaserCannon",
		rgbColor                 = "1 0.5 0",
		rgbColor2                = "1 1 1",
		soundTrigger             = true,
		soundstart               = "tmediumtankfire.wav",
		texture1                 = "shot",
		texture2                 = "empty",
		thickness                = 6,
		tolerance                = 10000,
		turret                   = false,
		weaponVelocity           = 2500,
		customparams             = {
			damagetype		     = "efighter",  
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
