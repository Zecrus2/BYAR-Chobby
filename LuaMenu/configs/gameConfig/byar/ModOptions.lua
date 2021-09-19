-- $Id: ModOptions.lua 4642 2009-05-22 05:32:36Z carrepairer $


--  Custom Options Definition Table format
--  NOTES:
--  - using an enumerated table lets you specify the options order

--
--  These keywords must be lowercase for LuaParser to read them.
--
--  key:      the string used in the script.txt
--  name:     the displayed name
--  desc:     the description (could be used as a tooltip)
--  type:     the option type ('list','string','number','bool')
--  def:      the default value
--  min:      minimum value for number options
--  max:      maximum value for number options
--  step:     quantization step, aligned to the def value
--  maxlen:   the maximum string length for string options
--  items:    array of item strings for list options
--  section:  so lobbies can order options in categories/panels
--  scope:    'all', 'player', 'team', 'allyteam'      <<< not supported yet >>>
--


local options={
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Resources
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		key		= "resources_options",
		name	= "Resources",
		desc	= "Resources",
		type	= "section",
	},

	{
		key    = "startmetal",
		name   = "Starting metal",
		desc   = "Determines amount of metal and metal storage that each player will start with",
		type   = "number",
		section= "resources_options",
		def    = 1000,
		min    = 0,
		max    = 10000,
		step   = 1,
	},

	{
		key    = "startenergy",
		name   = "Starting energy",
		desc   = "Determines amount of energy and energy storage that each player will start with",
		type   = "number",
		section= "resources_options",
		def    = 1000,
		min    = 0,
		max    = 10000,
		step   = 1,
	},
	{
		key="map_tidal",
		name="Tidal Strength",
		desc="Unchanged = map setting, low = 13e/sec, medium = 18e/sec, high = 23e/sec.",
		hidden = true,
		type="list",
		def="unchanged",
		section="resources_options",
		items={
			{key="unchanged", name="Unchanged", desc="Use map settings"},
			{key="low", name="Low", desc="Set tidal incomes to 13 energy per second"},
			{key="medium", name="Medium", desc="Set tidal incomes to 18 energy per second"},
			{key="high", name="High", desc="Set tidal incomes to 23 energy per second"},
		}
	},

	{
		key    = 'resourceincomemultiplier',
		name   = 'Resource Income Multiplier',
		desc   = 'Resource Income Multiplier',
		type   =  "number",
		section = 'resources_options',
		def    = 1,
		min    = 0.01,
		max    = 100,
		step   = 0.01,
	},
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Restrictions
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		key		= 'restrictions',
		name	= 'Restrictions',
		desc   	= '',
		type   	= 'section',
	},
	{
		key    = 'maxunits',
		name   = 'Max units',
		desc   = 'Maximum number of units (including buildings) for each team allowed at the same time',
		type   = 'number',
		def    = 2000,
		min    = 1,
		max    = 10000, --- engine caps at lower limit if more than 3 team are ingame
		step   = 1,  -- quantization is aligned to the def value, (step <= 0) means that there is no quantization
		section= "restrictions",
	},
	{
		key="transportenemy",
		name="Enemy Transporting",
		desc="Toggle which enemy units you can kidnap with an air transport",
		hidden = true,
		type="list",
		def="notcoms",
		section="restrictions",
		items={
			{key="notcoms", name="All But Commanders", desc="Only commanders are immune to napping"},
			{key="none", name="Disallow All", desc="No enemy units can be napped"},
		}
	},
	{
		key    = "allowuserwidgets",
		name   = "Allow user widgets",
		desc   = "Allow custom user widgets or disallow them",
		type   = "bool",
		def    = true,
		section= 'restrictions',
	},
	{
		key    = 'fixedallies',
		name   = 'Fixed ingame alliances',
		desc   = 'Disables the possibility of players to dynamically change alliances ingame',
		type   = 'bool',
		def    = true,
		section= "restrictions",
	},
	{
		key    		= 'disable_fogofwar',
		name   		= 'Disable Fog of War (Can break AI behaviour!!!)',
		desc   		= 'Disable Fog of War (Can break AI behaviour!!!)',
		type   		= "bool",
		section		= 'restrictions',
		def    		= false,
	},
	{
		key    		= 'unit_restrictions_notech2',
		name   		= 'Disable Tech 2',
		desc   		= 'Disable Tech 2',
		type   		= "bool",
		section		= 'restrictions',
		def    		= false,
	},
	{
		key    		= 'unit_restrictions_notech3',
		name   		= 'Disable Tech 3',
		desc   		= 'Disable Tech 3',
		type   		= "bool",
		section		= 'restrictions',
		def    		= false,
	},
	{
		key    		= 'unit_restrictions_noair',
		name   		= 'Disable Air Units',
		desc   		= 'Disable Air Units',
		type   		= "bool",
		section		= 'restrictions',
		def    		= false,
	},
	{
		key    		= 'unit_restrictions_noconverters',
		name   		= 'Disable Energy Converters',
		desc   		= 'Disable Energy Converters',
		type   		= "bool",
		section		= 'restrictions',
		def    		= false,
	},
	{
		key    		= 'unit_restrictions_nonukes',
		name   		= 'Disable Nuclear Missiles',
		desc   		= 'Disable Nuclear Missiles',
		type   		= "bool",
		section		= 'restrictions',
		def    		= false,
	},
	{
		key    		= 'unit_restrictions_notacnukes',
		name   		= 'Disable Tactical Nukes and EMPs',
		desc   		= 'Disable Tactical Nukes and EMPs',
		type   		= "bool",
		section		= 'restrictions',
		def    		= false,
	},
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Scavengers
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		key		= "options_scavengers",
		name	= "Scavengers",
		desc	= "Gameplay options for Scavengers gamemode",
		type	= "section",
	},
	{
		key    = 'scavdifficulty',
		name   = 'Base Difficulty',
		desc   = 'Scavengers Base Difficulty Level',
		type   = 'list',
		section = 'options_scavengers',
		def  = "veryeasy",
		items={
			{key="noob", name="Noob", desc="Noob"},
			{key="veryeasy", name="Very Easy", desc="Very Easy"},
			{key="easy", name="Easy", desc="Easy"},
			{key="medium", name="Medium", desc="Medium"},
			{key="hard", name="Hard", desc="Hard"},
			{key="veryhard", name="Very Hard", desc="Very Hard"},
			{key="expert", name="Expert", desc="Expert"},
			{key="brutal", name="Brutal", desc="You'll die"},
		}
	},
	{
		key    = 'scavendless',
		name   = 'Endless Mode (Disables final boss fight, turning Scavengers into an endless survival mode)',
		desc   = 'Disables final boss fight, turning Scavengers into an endless survival mode',
		type   = 'bool',
		section = 'options_scavengers',
		def  = false,
	},
	{
		key    = 'scavgraceperiod',
		name   = 'Time Before Scavengers Arrival (minutes)',
		desc   = 'no-description-here',
		type   = 'number',
		section= 'options_scavengers',
		def    = 5,
		min    = 1,
		max    = 20,
		step   = 1,
	},
	{
		key    = 'scavunitcountmultiplier',
		name   = 'Spawn Wave Size Multiplier',
		desc   = '',
		type   = 'number',
		section= 'options_scavengers',
		def    = 1,
		min    = 0.01,
		max    = 10,
		step   = 0.01,
	},
	{
		key    = 'scavunitspawnmultiplier',
		name   = 'Frequency of Spawn Waves Multiplier',
		desc   = '',
		type   = 'number',
		section= 'options_scavengers',
		def    = 1,
		min    = 0.01,
		max    = 10,
		step   = 0.01,
	},
	{
		key    = 'scavbuildspeedmultiplier',
		name   = 'Scavenger Build Speed Multiplier',
		desc   = '',
		type   = 'number',
		section= 'options_scavengers',
		def    = 1,
		min    = 0.01,
		max    = 10,
		step   = 0.01,
	},
	{
		key    = 'scavunitveterancymultiplier',
		name   = 'Scavenger Unit Experience Level Multiplier',
		desc   = 'Higher means stronger Scav units',
		type   = 'number',
		section= 'options_scavengers',
		def    = 1,
		min    = 0.01,
		max    = 10,
		step   = 0.01,
	},
	{
		key    = 'scavtechcurve',
		name   = 'Scavenger Tech Progression Length Multiplier (higher = slower scav tech = longer game)',
		desc   = '',
		type   = 'number',
		section= 'options_scavengers',
		def    = 1,
		min    = 0.01,
		max    = 10,
		step   = 0.01,
	},
	{
		key    = 'scavbosshealth',
		name   = 'Final Boss Health Multiplier',
		desc   = '',
		type   = 'number',
		section= 'options_scavengers',
		def    = 1,
		min    = 0.01,
		max    = 10,
		step   = 0.01,
	},
	{
		key    = 'scavevents',
		name   = 'Random Events',
		desc   = 'Random Events System',
		type   = 'bool',
		section = 'options_scavengers',
		def  = true,
	},

	{
		key    = 'scaveventsamount',
		name   = 'Random Events Amount',
		desc   = 'Modifies frequency of random events',
		type   = 'list',
		section = 'options_scavengers',
		def  = "normal",
		items={
			{key="normal", name="Normal", desc="Normal"},
			{key="lower", name="Lower", desc="Halved"},
			{key="higher", name="Higher", desc="Doubled"},
		}
	},
	{
		key    = 'scavonlyruins',
		name   = 'Random Ruins (ScavMode)',
		desc   = 'description',
		type   = 'bool',
		section = 'options_scavengers',
		def  = true,
	},
	{
		key    = 'scavonlylootboxes',
		name   = 'Lootboxes (ScavMode)',
		desc   = '1 to enable, 0 to disable',
		type   = 'bool',
		section= 'options_scavengers',
		def  = true,
	},
	{
		key    = 'scavinitialbonuscommander',
		name   = 'Bonus Starter Constructors',
		desc   = 'Spawns additional constructors on game start',
		type   = 'bool',
		section = 'options_scavengers',
		def  = true,
	},
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Chickens
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	{
		key 	= 'chicken_defense_options',
		name 	= 'Chickens',
		desc 	= 'Various gameplay options that will change how the Chicken Defense is played.',
		type 	= 'section',
	},
	{
		key="chicken_difficulty",
		name="Difficulty",
		desc="Chickens difficulty",
		type="list",
		def="normal",
		section="chicken_defense_options",
		items={
			{key="veryeasy", name="Very Easy", desc="Very Easy"},
			{key="easy", name="Easy", desc="Easy"},
			{key="normal", name="Medium", desc="Medium"},
			{key="hard", name="Hard", desc="Hard"},
			{key="veryhard", name="Very Hard", desc="Very Hard"},
			{key="epic", name="Epic", desc="Epic"},
			{key="survival", name="Survival", desc="Endless Mode"}
		}
	},
	{
		key="chicken_chickenstart",
		name="Burrow Placement",
		desc="Control where burrows spawn",
		type="list",
		def="initialbox",
		section="chicken_defense_options",
		items={
			{key="anywhere", name="Anywhere", desc="Burrows can spawn anywhere"},
			{key="avoid", name="Avoid Players", desc="Burrows do not spawn on player units"},
			{key="initialbox", name="Initial Start Box", desc="First wave spawns in chicken start box, following burrows avoid players"},
			{key="alwaysbox", name="Always Start Box", desc="Burrows always spawn in chicken start box"},
		}
	},
	{
		key    = "chicken_queentime",
		name   = "Max Queen Arrival (Minutes)",
		desc   = "Queen will spawn after given time.",
		type   = "number",
		def    = 40,
		min    = 1,
		max    = 90,
		step   = 1,
		section= "chicken_defense_options",
	},
	{
		key    = "chicken_maxchicken",
		name   = "Chicken Limit",
		desc   = "Maximum number of chickens on map.",
		type   = "number",
		def    = 300,
		min    = 50,
		max    = 5000,
		step   = 25,
		section= "chicken_defense_options",
	},
	{
		key    = "chicken_spawncountmult",
		name   = "Chicken Spawn Multiplier",
		desc   = "How many times more chickens spawn than normal.",
		type   = "number",
		def    = 1,
		min    = 1,
		max    = 20,
		step   = 1,
		section= "chicken_defense_options",
	},
	{
		key    = "chicken_graceperiod",
		name   = "Grace Period (Seconds)",
		desc   = "Time before chickens become active.",
		type   = "number",
		def    = 300,
		min    = 5,
		max    = 900,
		step   = 5,
		section= "chicken_defense_options",
	},
	{
		key    = "chicken_queenanger",
		name   = "Add Queen Anger",
		desc   = "Killing burrows adds to queen anger.",
		type   = "bool",
		def    = true,
		section= "chicken_defense_options",
    },
	
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- TeamColoring
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	{
		key		= "teamcoloring_options",
		name	= "TeamColors",
		desc	= "TeamColors",
		type	= "section",
	},
	{
		key    = 'teamcolors_anonymous_mode',
		name   = 'Anonymous Mode',
		desc   = 'All your enemies are colored with the same color so you cannot recognize them. Forces Dynamic TeamColors to be enabled',
		type   = 'bool',
		section = 'teamcoloring_options',
		def  = false,
	},
	{
		key    = 'teamcolors_icon_dev_mode',
		name   = "Icon Dev Mode (Don't use in normal games)",
		desc   = 'Forces teamcolors to be an specific one, for all teams',
		type   = 'list',
		section = 'teamcoloring_options',
		def  = "disabled",
		items={
			{key="disabled", name="Disabled", desc="description"},
			{key="armblue", name="Armada Blue", desc="description"},
			{key="corred", name="Cortex Red", desc="description"},
			{key="scavpurp", name="Scavenger Purple", desc="description"},
			{key="chickenorange", name="Chicken Orange", desc="description"},
			{key="gaiagray", name="Gaia Gray", desc="description"},
		}
	},
	
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Other Options
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	{
		key		= "options",
		name	= "Other",
		desc	= "Options",
		type	= "section",
	},
	{
		key    = 'ruins',
		name   = 'Random Ruins',
		desc   = 'description',
		type   = 'bool',
		section = 'options',
		def  = false,
	},
	{
		key    = 'lootboxes',
		name   = 'Lootboxes',
		desc   = '1 to enable, 0 to disable',
		type   = 'bool',
		section= 'options',
		def  = false,
	},
	{
		key    = 'critters',
		name   = 'Animal amount',
		desc   = 'This multiplier will be applied on the amount of critters a map will end up with',
		hidden = true,
		type   = 'number',
		section= 'options',
		def    = 1,
		min    = 0,
		max    = 2,
		step   = 0.2,
	},
	{
		key="deathmode",
		name="Game End Mode",
		desc="What it takes to eliminate a team",
		type="list",
		def="com",
		section="options",
		items={
			{key="neverend", name="None", desc="Teams are never eliminated"},
			{key="com", name="Kill all enemy Commanders", desc="When a team has no Commanders left, it loses"},
			{key="killall", name="Kill everything", desc="Every last unit must be eliminated, no exceptions!"},
		}
	},
	{
		key="map_waterlevel",
		name="Water Level",
		desc=" <0 = Decrease water level, >0 = Increase water level",
		type="number",
		def    = 0,
		min    = -10000,
		max    = 10000,
		step   = 1,
		section="options",
	},
	{
		key    = "ffa_mode",
		name   = "FFA Mode",
		desc   = "Units with no player control are removed/destroyed \nUse FFA spawning mode",
		hidden = true,
		type   = "bool",
		def    = false,
		section= "options",
	},
  
	 {
	 	key    = 'coop',
	 	name   = 'Cooperative mode',
	 	desc   = 'Adds extra commanders to id-sharing teams, 1 com per player',
	 	type   = 'bool',
	 	def    = false,
	 	section= 'options',
	 },
	{
		key    = 'disablemapdamage',
		name   = 'Undeformable map',
		desc   = 'Prevents the map shape from being changed by weapons',
		type   = 'bool',
		def    = false,
		section= "options",
	},

	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Control Victory Options
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	{
		key    = 'controlvictoryoptions',
		name   = 'Control',
		desc   = 'Allows you to control at a granular level the individual options for Control Point Victory',
		type   = 'section',
	},
	{
		key="scoremode",
		name="Scoring Mode",
		desc="Defines how the game is played",
		type="list",
		def="disabled",
		section="controlvictoryoptions",
		items={
			{key="disabled", name="Disabled", desc="Disable Control Points as a victory condition."},
			{key="countdown", name="Countdown", desc="A Control Point decreases all opponents' scores, zero means defeat."},
			{key="tugofwar", name="Tug of War", desc="A Control Point steals enemy score, zero means defeat."},
			--{key="domination", name="Domination", desc="Holding all Control Points will grant 1000 score, first to reach the score limit wins."},
		}
	},
	{
		key    = 'scoremode_chess',
		name   = 'Chess Mode',
		desc   = 'No basebuilding',
		type   = 'bool',
		section= 'controlvictoryoptions',
		def  = true,
	},
	{
		key    = 'scoremode_chess_unbalanced',
		name   = 'Chess: Unbalanced',
		desc   = 'Each player gets diffrent set of units',
		type   = 'bool',
		section= 'controlvictoryoptions',
		def  = false,
	},
	{
		key    = 'scoremode_chess_adduptime',
		name   = 'Chess: Minutes Between New Units Add-up.',
		desc   = 'Time Between New Units Add-up.',
		type   = 'number',
		section= 'controlvictoryoptions',
		def    = 4,
		min    = 1,
		max    = 10,
		step   = 1,  -- quantization is aligned to the def value
		-- (step <= 0) means that there is no quantization
	},
	{
		key    = 'scoremode_chess_spawnsperphase',
		name   = 'Chess: Number of spawns in each phase.',
		desc   = 'Number of spawns in each phase.',
		type   = 'number',
		section= 'controlvictoryoptions',
		def    = 1,
		min    = 1,
		max    = 10,
		step   = 1,  -- quantization is aligned to the def value
		-- (step <= 0) means that there is no quantization
	},
	{
		key    = 'limitscore',
		name   = 'Initial Score',
		desc   = 'Initial score amount available.',
		type   = 'number',
		section= 'controlvictoryoptions',
		def    = 10000,
		min    = 1000,
		max    = 100000,
		step   = 1,  -- quantization is aligned to the def value
		-- (step <= 0) means that there is no quantization
	},
	{
		key    = "numberofcontrolpoints",
		name   = "Number of control points (affects initial score)",
		desc   = "Sets the number of control points on the map and scales the total score amount to match. Has no effect if Preset map configs are enabled.",
		section= "controlvictoryoptions",
		type="list",
		def="13",
		items={
			{key="7", name="7", desc=""},
			{key="13", name="13", desc=""},
			{key="19", name="19", desc=""},
			{key="25", name="25", desc=""},
		}
    },
	{
		key    = "usemapconfig",
		name   = "Use preset map-specific Control Point locations?",
		desc   = "Should the control point config for this map be used instead of autogenerated control points?",
		hidden = true,
		type   = 'bool',
		def    = true,
		section= "controlvictoryoptions",
    },
	{
		key    = 'captureradius',
		name   = 'Capture points size',
		desc   = 'Radius around a point in which to capture it.',
		type   = 'number',
		section= 'controlvictoryoptions',
		def    = 250,
		min    = 100,
		max    = 1000,
		step   = 25,  -- quantization is aligned to the def value
		-- (step <= 0) means that there is no quantization
	},
	{
		key    = 'capturetime',
		name   = 'Capture Time',
		desc   = 'Time to capture a point.',
		hidden = true,
		type   = 'number',
		section= 'controlvictoryoptions',
		def    = 60,
		min    = 1,
		max    = 120,
		step   = 1,  -- quantization is aligned to the def value
		-- (step <= 0) means that there is no quantization
	},

		{
		key    = 'capturebonus',
		name   = 'Capture Bonus',
		desc   = 'Percentage of how much faster capture takes place by adding more units.',
		hidden = true,
		type   = 'number',
		section= 'controlvictoryoptions',
		def    = 5,
		min    = 1,
		max    = 100,
		step   = 1,  -- quantization is aligned to the def value
		-- (step <= 0) means that there is no quantization
	},

		{
		key    = 'decapspeed',
		name   = 'De-Cap Speed',
		desc   = 'Speed multiplier for neutralizing an enemy point.',
		hidden = true,
		type   = 'number',
		section= 'controlvictoryoptions',
		def    = 2,
		min    = 1,
		max    = 3,
		step   = 1,  -- quantization is aligned to the def value
		-- (step <= 0) means that there is no quantization
	},
		{
		key    = 'starttime',
		name   = 'Start Time',
		desc   = 'Number of seconds until control points can be captured.',
		hidden = true,
		type   = 'number',
		section= 'controlvictoryoptions',
		def    = 0,
		min    = 0,
		max    = 300,
		step   = 1,  -- quantization is aligned to the def value
		-- (step <= 0) means that there is no quantization
	},
	{
		key    = 'metalperpoint',
		name   = 'Metal given per point',
		desc   = 'Each player on an allyteam that has captured a point will receive this amount of resources per point captured per second',
		type   = 'number',
		section= 'controlvictoryoptions',
		def    = 0,
		min    = 0,
		max    = 5,
		step   = 0.1,  -- quantization is aligned to the def value
		-- (step <= 0) means that there is no quantization
	},
		{
		key    = 'energyperpoint',
		name   = 'Energy given per point',
		desc   = 'Each player on an allyteam that has captured a point will receive this amount of resources per point captured per second',
		type   = 'number',
		section= 'controlvictoryoptions',
		def    = 0,
		min    = 0,
		max    = 500,
		step   = 0.1,  -- quantization is aligned to the def value
		-- (step <= 0) means that there is no quantization
	},
	{
		key    = 'dominationscoretime',
		name   = 'Domination Score Time',
		desc   = 'Time needed holding all points to score in multi domination.',
		hidden = true,
		type   = 'number',
		section= 'controlvictoryoptions',
		def    = 30,
		min    = 1,
		max    = 60,
		step   = 1,  -- quantization is aligned to the def value
		-- (step <= 0) means that there is no quantization
	},

	{
		key    = 'tugofwarmodifier',
		name   = 'Tug of War Modifier',
		desc   = 'The amount of score transfered between opponents when points are captured is multiplied by this amount.',
		hidden = true,
		type   = 'number',
		section= 'controlvictoryoptions',
		def    = 2,
		min    = 0,
		max    = 6,
		step   = 1,  -- quantization is aligned to the def value
		-- (step <= 0) means that there is no quantization
	},
	{
		key    = 'dominationscore',
		name   = 'Score awarded for Domination',
		desc   = 'The amount of score awarded when you have scored a domination.',
		hidden = true,
		type   = 'number',
		section= 'controlvictoryoptions',
		def    = 1000,
		min    = 500,
		max    = 1000,
		step   = 1,  -- quantization is aligned to the def value
		-- (step <= 0) means that there is no quantization
	},

	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Experimental Options
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	{
		key		= "options_experimental",
		name	= "Experimental",
		desc	= "Experimental options",
		type	= "section",
	},

	{
		key    = 'experimentalnoaircollisions',
		name   = 'Aircraft Collisions Override',
		desc   = 'Aircraft Collisions Override',
		hidden = true,
		type   = 'bool',
		section = 'options_experimental',
		def  = false,
	},

	{
		key    = 'experimentalshields',
		name   = 'Shield Override',
		desc   = 'Shield Override',
		type   = 'list',
		section = 'options_experimental',
		def  = "unchanged",
		items={
			{key="unchanged", name="Unchanged", desc="Unchanged"},
			{key="absorbplasma", name="Absorb Plasma", desc="Collisions Disabled"},
			{key="absorbeverything", name="Absorb Everything", desc="Collisions Enabled"},
			{key="bounceeverything", name="Deflect Everything", desc="Collisions Enabled"},
		}
	},

	{
		key    = 'experimentalshieldpower',
		name   = 'Shield Power Multiplier',
		desc   = 'Shield Power Multiplier',
		type   ="number",
		section = 'options_experimental',
		def    = 1,
		min    = 0.01,
		max    = 100,
		step   = 0.01,
	},


	{
		key    = 'experimentalxpgain',
		name   = 'XP Gain Multiplier',
		desc   = 'XP Gain Multiplier',
		hidden = true,
		type   ="number",
		section = 'options_experimental',
		def    = 1,
		min    = 0.1,
		max    = 10,
		step   = 0.1,
	},

	{
		key    = 'experimentalxpsystem',
		name   = 'New XP System',
		desc   = 'New XP System',
		hidden = true,
		type   = 'bool',
		section = 'options_experimental',
		def  = false,
	},
	{
		key    = 'experimentalbuildrange',
		name   = 'Build Range Multiplier',
		desc   = 'Build Range Multiplier',
		hidden = true,
		type   ="number",
		section = 'options_experimental',
		def    = 1,
		min    = 0.1,
		max    = 10,
		step   = 0.1,
	},

	{
		key    = 'experimentalbuildpower',
		name   = 'Build Power Multiplier',
		desc   = 'Build Power Multiplier',
		hidden = true,
		type   ="number",
		section = 'options_experimental',
		def    = 1,
		min    = 0.1,
		max    = 10,
		step   = 0.1,
	},
	{
		key    = 'experimentallosrange',
		name   = 'Line of Sight Range Multiplier',
		desc   = 'Line of Sight Range Multiplier',
		type   ="number",
		section = 'options_experimental',
		def    = 1,
		min    = 0.1,
		max    = 5,
		step   = 0.1,
	},

	{
		key    = 'experimentalradarrange',
		name   = 'Radar Range Multiplier',
		desc   = 'Radar Range Multiplier',
		type   ="number",
		section = 'options_experimental',
		def    = 1,
		min    = 0.1,
		max    = 5,
		step   = 0.1,
	},

	{
		key    = 'experimentalscavuniqueunits',
		name   = 'Scavenger Units Buildable by Players',
		desc   = 'Scavenger Units Buildable by Players',
		type   = 'bool',
		section = 'options_experimental',
		def  = false,
	},

	{
		key    = 'experimentalmorphs',
		name   = 'Upgradeable Units',
		desc   = 'Upgradeable Units',
		type   = 'bool',
		section = 'options_experimental',
		def  = false,
	},

	{
		key    = 'experimentalimprovedtransports',
		name   = 'Transport Units Rework',
		desc   = 'Transport Units Rework',
		hidden = true,
		type   = 'bool',
		section = 'options_experimental',
		def  = false,
	},

	{
		key    = 'mapatmospherics',
		name   = 'Map Atmospherics',
		desc   = 'Map Atmospherics',
		hidden = true,
		type   = 'bool',
		section = 'options_experimental',
		def  = true,
	},

	{
		key    = 'experimentalmassoverride',
		name   = 'Mass Override',
		desc   = 'Mass Override',
		hidden = true,
		type   = 'bool',
		section = 'options_experimental',
		def  = false,
	},
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Unused Options
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	{
		key		= "modes",
		name	= "GameModes",
		desc	= "Game Modes",
		hidden = true,
		type	= "section",
	},

	{
		key		= "unba",
		name	= "Unbalanced Commanders",
		desc	= "Defines if commanders level up with xp and gain more power or not",
		hidden = true,
		type	= "bool",
		def		= false,
		section	= "modes",
	},


	{
		key    = "shareddynamicalliancevictory",
		name   = "Dynamic Ally Victory",
		desc   = "Ingame alliance should count for game over condition.",
		hidden = true,
		type   = "bool",
		section= 'options',
		def    = false,
	},

	{
		key    = 'ai_incomemultiplier',
		name   = 'AI Income Multiplier',
		desc   = 'Multiplies AI resource income',
		hidden = true,
		type   = 'number',
		section= 'options',
		def    = 1,
		min    = 1,
		max    = 10,
		step   = 0.1,
	},

	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- End Options
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

}
return options
