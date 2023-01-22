-- Separate the Valar. Manwë
-- Midjourney prompt: Manwë, the king of the Valar, in the comic book style of DC Comics blue African-American full body detailed line art

if ModUtil ~= nil then

	ModUtil.Mod.Register("ManweValar")
	
	local mod = "ManweValar"
	local package = "ManwePackage"
	--Variables
	local DepthDamageMultiplier = 0.0
	local DuplicateMultiplier = -0.60
	local DuplicateStrongMultiplier = -0.40
	local DuplicateVeryStrongMultiplier = -0.20
	--Color
	local OlympusColor = ModUtil.Entangled.ModData(Color)
	OlympusColor.ManweVoice = {38, 132, 255, 255}
	OlympusColor.ManweDamageLight = {76, 154, 255, 255} 
	OlympusColor.ManweDamage = {38, 132, 255, 255}
	--EnemyUpgradeData
	local OlympusEnemyUpgradeData = ModUtil.Entangled.ModData(EnemyUpgradeData)
	OlympusEnemyUpgradeData.ManweUpgrade =
	{
		ScreenPanel = nil,
		UpgradeString = "LtUpgrade_Manwe",
		--AddSpecialWeapons = { ContinuousWeapon = "DevotionManwe" },
		LieutenantsOnly = true,
		Hidden = true,
		PropertyChanges = { },
	}
	--QuestData
	local OlympusQuestData = ModUtil.Entangled.ModData(QuestData)
	OlympusQuestData.ManweUpgrades =
	{
		InheritFrom = { "DefaultQuestItem" },
		RewardResourceName = "Gems",
		RewardResourceAmount = 150,
		UnlockGameStateRequirements =
		{
			RequiredTextLines = { "ManweGift01", },
		},
		CompleteGameStateRequirements =
		{
			RequiredTraitsTaken =
			{
				"ManweWeaponTrait",
				"ManweDashTrait",
				"ManweRangedTrait",
				"ManweSecondaryTrait",
				"ManweShoutTrait",
				
				"ManweRevengeTrait",
				"ManweShakenTrait",
				"ManweAirborneTrait",
				"ManweGustTrait",			
				"ManweVortexTrait",
	
				"ManweSuperGenerationTrait",
				"ManweWrathTrait",
				"ManweHealTrait"
			},
		},
		CashedOutVoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 0.4,
			Cooldowns =
			{
				{ Name = "ZagreusProphecyFulfilledSpeech", Time = 3 },
			},

			-- Manwe being pleased at the recognition of the Valar.
			{ Cue = "/VO/ZagreusHome_3768" },
		},
	}
	local OlympusQuestOrderData = ModUtil.Entangled.ModData(QuestOrderData)
	table.insert(OlympusQuestOrderData, 29, "ManweUpgrades")

	--ManweQuestData

	-- OlympusQuestData.HomeWarmthQuest = {
	-- 	InheritFrom = { "DefaultQuestItem" },
	-- 	RewardResourceName = "SuperGems",
	-- 	RewardResourceAmount = 6,
	-- 	UnlockGameStateRequirements =
	-- 	{
	-- 		RequiredTextLines = { "HestiaHomeWarmthQuest01", },
	-- 	},
	-- 	CompleteGameStateRequirements =
	-- 	{
	-- 		RequiredTextLines =
	-- 		{
	-- 			"HestiaHomeWarmthQuest01",
	-- 			"HestiaHomeWarmthQuest02",
	-- 			"HestiaHomeWarmthQuest03",
	-- 			"HestiaHomeWarmthQuest04",
	-- 			"HestiaHomeWarmthQuest05",
	-- 			"HestiaHomeWarmthQuest06",
	-- 		},
	-- 	},
	-- 	DisplayOrder =
	-- 	{
	-- 		{ Requirement = "HestiaHomeWarmthQuest01", Text = "WarmthQuest01", },
	-- 		{ Requirement = "HestiaHomeWarmthQuest02", Text = "WarmthQuest02", },
	-- 		{ Requirement = "HestiaHomeWarmthQuest03", Text = "WarmthQuest03", },
	-- 		{ Requirement = "HestiaHomeWarmthQuest04", Text = "WarmthQuest04", },
	-- 		{ Requirement = "HestiaHomeWarmthQuest05", Text = "WarmthQuest05", },
	-- 		{ Requirement = "HestiaHomeWarmthQuest06", Text = "WarmthQuest06", },
	-- 	},
	-- 	IncompleteName = "Quest_UnknownCondition",
	-- }
	-- local OlympusQuestOrderData = ModUtil.Entangled.ModData(QuestOrderData)
	-- table.insert(OlympusQuestOrderData, 30, "HestiaUpgrades")
	-- table.insert(OlympusQuestOrderData, 54, "HomeWarmthQuest")
	
	--UnitSetData
	local OlympusEnemyData = ModUtil.Entangled.ModData(EnemyData)
	OlympusEnemyData.ManweUpgradeRoomWeapon = {
		InheritFrom = { "PassiveRoomWeapon" },
	
		DefaultAIData =
		{
			DeepInheritance = true,
			PreAttackDuration = 0,
			FireDuration = 0.0,
			PostAttackDuration = 0.0,
			PostAttackCooldownMin = 2.0,
			PostAttackCooldownMax = 2.5,
			CreateOwnTargetFromOriginalTarget = true,
			RandomTargetAngle = true,
			TargetOffsetDistanceMin = 0,
			TargetOffsetDistanceMax = 0,
			TeleportToTargetId = true,
			TargetFriends = true,
		},
	
		WeaponOptions =
		{
			"DevotionManwe",
		},
	}
	--WeaponData
	local OlympusWeaponSets = ModUtil.Entangled.ModData(WeaponSets)
	local OlympusWeaponData = ModUtil.Entangled.ModData(WeaponData)
	local OlympusEffectData = ModUtil.Entangled.ModData(EffectData)

	table.insert(OlympusWeaponSets.ExpireProjectileExcludeProjectileNames, "ManweProjectile")
	OlympusWeaponData.ManweShoutWeapon = {
		BlockWrathGain = true,
	}
	OlympusWeaponData.DevotionManwe =
	{
		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.08, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		},
	}
	OlympusWeaponData.TheseusManweUpgradeWrath =
	{
		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.08, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		},
		BlockInterrupt = true,

		AIData =
		{
			FireTicks = 30,
			FireCooldown = 0.15,
			ResetTargetPerTick = true,
			AIAngleTowardsPlayerWhileFiring = true,
			PreAttackAnimation ="Theseus_WrathStart",
			FireAnimation = "Theseus_WrathAirLoop",
			PostAttackAnimation = "Theseus_WrathReturnToIdle",
			PostAttackDuration = 0.6,

			WrathVoiceLines =
			{
				Queue = "Interrupt",
				{
					RandomRemaining = true,
					PreLineWait = 0.1,
					CooldownTime = 40,
					CooldownName = "TheseusWrathLinesPlayedRecently",
					SuccessiveChanceToPlay = 0.5,

					-- King of the Valar, I beseech thee!
					{ Cue = "/VO/Theseus_0600" }, -- need new VO
					-- Yours, Aran Einior!
					{ Cue = "/VO/Theseus_0601" }, -- need new VO
				},
				[2] = GlobalVoiceLines.TheseusWrathActivationVoiceLines,
				[3] = HeroVoiceLines.TheseusWrathReactionVoiceLines_M,
			},
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Player Sounds/DemeterColdNova" },
			},
		},
	}
	OlympusWeaponData.TheseusManweUpgradePassive =
	{
		HitScreenshake = { Distance = 3, Speed = 1000, Duration = 0.08, FalloffSpeed = 3000 },
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
			{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0 },
		},

		AIData = {
			FireTicks = 1,
			FireCooldown = 0.1,
			FireInterval = 0.1,

			AttackSlotInterval = 5.0,
			AttackSlotsPerTickMin = 1,
			AttackSlotsPerTickMax = 1,
			AttackSlots =
			{
				-- WrathTargetSetA
				{ UseMapObjectId = 525346 },
				{ UseMapObjectId = 525411 },
				{ UseMapObjectId = 525410 },
				{ UseMapObjectId = 525408 },
				{ UseMapObjectId = 525409 },
				{ UseMapObjectId = 525406 },
				{ UseMapObjectId = 543853 },
			},
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Player Sounds/DemeterColdNova" },
			},
		},
	}
	OlympusEffectData.ManweAirborne =
	{
		OnApplyFunctionName = "ManweAirborneApply",
		OnClearFunctionName = "ManweAirborneClear",
	}
	OlympusEffectData.ManweShaken =
	{
		OnApplyFunctionName = "ManweShakenApply",
		OnClearFunctionName = "ManweShakenClear",
	}
	-- GlobalVoiceLines
	local OlympusGlobalVoiceLines = ModUtil.Entangled.ModData(GlobalVoiceLines)
	local OlympusHeroVoiceLines = ModUtil.Entangled.ModData(HeroVoiceLines)
	table.insert(OlympusGlobalVoiceLines.BoonUsedVoiceLines, {
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 0.5,
		RequiredLastGodLoot = "HestiaUpgrade",
		RequiredEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
		RequireCurrentEncounterNotComplete = true,
		Source = { SubtitleColor = Color.HestiaVoice },

		-- Lines
		{ Cue = "/VO/Hestia_0149" }, -- need new VO
		-- More lines
		{ Cue = "/VO/Hestia_0150" }, -- need new VO
		-- Other lines
		{ Cue = "/VO/Hestia_0151" }, -- need new VO
		-- .
		{ Cue = "/VO/Hestia_0152" }, -- need new VO
		-- .
		{ Cue = "/VO/Hestia_0153" }, -- need new VO
		-- .
		{ Cue = "/VO/Hestia_0154" }, -- need new VO
		-- .
		{ Cue = "/VO/Hestia_0155" }, -- need new VO
		-- .
		{ Cue = "/VO/Hestia_0156" }, -- need new VO
		-- .
		{ Cue = "/VO/Hestia_0157" }, -- need new VO
		-- .
		{ Cue = "/VO/Hestia_0158" }, -- need new VO
		-- .
		{ Cue = "/VO/Hestia_0159" }, -- need new VO
		-- .
		{ Cue = "/VO/Hestia_0160" }, -- need new VO
	})
	table.insert(OlympusHeroVoiceLines.UpgradePickedVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		SuccessiveChanceToPlay = 0.5,
		PreLineWait = 0.75,
		RequiredLastGodLoot = "HestiaUpgrade",
		-- Lines.
		{ Cue = "/VO/ZagreusField_4841" }, -- need new VO
		-- More lines.
		{ Cue = "/VO/ZagreusField_4842" }, -- need new VO
		-- .
		{ Cue = "/VO/ZagreusField_4843" }, -- need new VO
		-- .
		{ Cue = "/VO/ZagreusField_4844" }, -- need new VO
		-- .
		{ Cue = "/VO/ZagreusField_4845" }, -- need new VO
		-- .
		{ Cue = "/VO/ZagreusField_4846" }, -- need new VO
		-- .
		{ Cue = "/VO/ZagreusField_4847" }, -- need new VO
		-- .
		{ Cue = "/VO/ZagreusField_4848" }, -- need new VO
		-- .
		{ Cue = "/VO/ZagreusField_4849" }, -- need new VO
		-- .
		{ Cue = "/VO/ZagreusField_4850" }, -- need new VO
	})
	table.insert(OlympusHeroVoiceLines.UpgradePickedVoiceLines, {
		PlayOnce = true,
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.65,
		RequiredFalseEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", "Shop" },

		-- A god from another world. I will not forget this, Manwë!
		{ Cue = "/VO/ZagreusField_4832", RequiredLastGodLoot = "ManweUpgrade", RequiredTextLinesThisRun = "ManweFirstPickUp" }, -- need new VO
	})	
	table.insert(OlympusHeroVoiceLines.FullSuperActivatedVoiceLines, {
		-- Manwë!!
		Cue = "/VO/ZagreusField_4951", RequiredTrait = "ManweShoutTrait", RequiredFalseSpurnedGodName = "ManweUpgrade" -- need new VO
	})
	table.insert(OlympusHeroVoiceLines.SwapUpgradePickedVoiceLines, {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.65,
		SuccessiveChanceToPlayAll = 0.33,
		RequiredFalseEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
		RequiredSwappedGodLoot = "ManweUpgrade",
		CooldownName = "SaidManweRecently",
		CooldownTime = 40,

		-- I'm sure King Manwë won't mind.
		{ Cue = "/VO/ZagreusField_1863" }, -- need new VO
		-- Surely Manwë won't mind.
		{ Cue = "/VO/ZagreusField_1864" }, -- need new VO
		-- King Manwë won't mind, will he?
		{ Cue = "/VO/ZagreusField_1865" }, -- need new VO
	})
	--BoonInfoScreenData
	local OlympusBoonInfoScreenData = ModUtil.Entangled.ModData(BoonInfoScreenData)
	table.insert(OlympusBoonInfoScreenData.Ordering, "ManweUpgrade")
	
	--ProjectileData
	local OlympusProjectileData = ModUtil.Entangled.ModData(ProjectileData)
	OlympusProjectileData.ManweColorProjectile = {
		DamageTextStartColor = OlympusColor.ManweDamageLight,
		DamageTextColor = OlympusColor.ManweDamage
	}
	OlympusProjectileData.ManweProjectile = {
		InheritFrom = { "NoSlowFrameProjectile", "NoShakeProjectile", "ManweColorProjectile" },
		NeverStore = true,
	}
	OlympusProjectileData.ManweField =
	{
		InheritFrom = { "NoSlowFrameProjectile", "NoShakeProjectile" },
		SpawnedProjectile = true,
	}
	OlympusProjectileData.ManweBeowulfProjectile = {
		InheritFrom = { "ManweProjectile" },
		NeverStore = true,
	}
	OlympusProjectileData.ManweShoutWeapon = {
		InheritFrom = { "NoSlowFrameProjectile", "NoShakeProjectile" },
	}
	-- GameData
	local OlympusGameData = ModUtil.Entangled.ModData(GameData)
	table.insert(OlympusGameData.AllSynergyTraits, "KingOfGods")
	
	OlympusGameData.ManweBasicPickUpTextLines = { -- need new VO
		"ManweFirstPickUp",
		"ManweMiscPickup01",
		"ManweMiscPickup02",
		"ManweMiscPickup03",
		"ManweMiscPickup04",
		"ManweMiscPickup05",
		"ManweMiscPickup06",
		"ManweMiscPickup07",
		"ManweMiscPickup08",
		"ManweMiscPickup09",
		"ManweMiscPickup10",
	}
	GameData.RunClearMessageData.ClearRequiredTraitsManwe =
	{
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements =
		{
			RequiredCountOfTraitsCount = 6,
			RequiredCountOfTraits =
			{
				"ManweWeaponTrait",
				"ManweDashTrait",
				"ManweRangedTrait",
				"ManweRangedTrait",
				"ManweShoutTrait",

				"ManweRevengeTrait",
				"ManweShakenTrait", "ManweAirborneTrait",
				"ManweGustTrait", "ManweVortexTrait",

				"ManweSuperGenerationTrait",
				"ManweWrathTrait",
				"ManweHealTrait",
			},
			RequiredOneOfTraits = { "ManweShakenTrait" },
		},
	}
	table.insert(OlympusGameData.ConversationOrder, "ManweUpgrade")
	table.insert(OlympusGameData.RunClearMessageData.ClearWeaponsFiredWrath.GameStateRequirements.RequiredWeaponsFiredThisRun.Names, "ManweBeamWeapon")
	ModUtil.Table.Merge(OlympusGameData.GodAboutGodVoiceLines, { -- need new VO
		"ManweAboutZeus01", "ManweAboutOlympians01", "ManweAboutOlympians01",
		"ManweAboutStories01", "ManweAboutStories02", "ManweAboutOrpheus01" }
	)
	--Keywords
	local OlympusKeywordList = ModUtil.Entangled.ModData(KeywordList)
	ModUtil.Table.Merge(OlympusKeywordList, { "ManweAirborne", "ManweGust", "ManweShaken" })
    ResetKeywords()
	
	-- Codex Section
	local OlympusCodexOrdering = ModUtil.Entangled.ModData(CodexOrdering)
	local OlympusCodex = ModUtil.Entangled.ModData(Codex)
	table.insert(OlympusCodexOrdering.OlympianGods.Order, "ManweUpgrade")
	
	OlympusCodex.OlympianGods.Entries["ManweUpgrade"] =
	{
		Entries =
		{
			{
				UnlockThreshold = 1,
				Text = "CodexData_Manwe_0001"
			},
			{
				UnlockThreshold = 5,
				Text = "CodexData_Manwe_0002"
			},
			{
				UnlockThreshold = 15,
				Text = "CodexData_Manwe_0003"
			}
		},
		Image = "Codex_Portrait_Manwe",
	}
	
	-- Trait Section
	local OlympusTraitData = ModUtil.Entangled.ModData(TraitData)
	
	OlympusTraitData.ForceManweBoonTrait = {
		Name = "ForceManweBoonTrait",
			InheritFrom = { "GiftTrait" },
			--Inherit		
			Frame = "Gift",
			Slot = "Keepsake",
			RecordCacheOnEquip = true,
			ChamberThresholds =  { 25, 50 },
	
			RarityLevels =
			{
				Common =
				{
					Multiplier = 1.0,
				},
				Rare =
				{
					Multiplier = 1.5,
				},
				Epic =
				{
					Multiplier = 2.0,
				}
			},
			--New Data
			InRackTitle = "ForceManweBoonTrait_Rack",
			Icon = "Keepsake_Light",
			EquipSound = "/SFX/Menu Sounds/KeepsakeHermesFastClear",
			ForceBoonName = "ManweUpgrade",
			Uses = 1,
			RarityBonus =
			{
				RequiredGod = "ManweUpgrade",
				RareBonus = { BaseValue = 0.1 },
				EpicBonus = 0.1,
				LegendaryBonus = 0.1,
				ExtractValues =
				{
					{
						Key = "RareBonus",
						ExtractAs = "TooltipBonusChance",
						Format = "Percent",
					}
				}
			},
			SignOffData =
			{
			  {
				Text = "ManweSignoff",
			  },
			  {
				RequiredTextLines = { "ManweGift07" },
				Text = "ManweSignoff_Max"
			  }
			},
	}
		
	OlympusTraitData.ManweWeaponTrait =
	 {
			 Name = "ManweWeaponTrait",
			 InheritFrom = { "ShopTier1Trait" },
			 God = "Manwë",
			 Slot = "Melee",
			 Icon =  "Boon_Manwe_01",
			 AddOutgoingDamageModifiers =
			 {
				 ValidWeaponMultiplier =
				 {
					 BaseValue = 1.40,
					 SourceIsMultiplier = true,
					 IdenticalMultiplier =
					 {
						 Value = DuplicateMultiplier,
					 },
				 },
				 ValidWeapons = WeaponSets.HeroPhysicalWeapons,
				 ExtractValues =
				 {
					 {
						 Key = "ValidWeaponMultiplier",
						 ExtractAs = "TooltipDamage",
						 Format = "PercentDelta",
					 },
				 }
			 },
			 PropertyChanges =
			 {
				 {
					 WeaponNames = WeaponSets.HeroPhysicalWeapons,
					 EffectName = "ManweAirborne",
					 EffectProperty = "Active",
					 ChangeValue = true,
				 },
				 {
					 WeaponName = "SwordWeapon",
					 WeaponProperty = "FireFx",
					 ChangeValue = "SwordSwipeAFlipped-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 WeaponName = "SwordWeapon2",
					 WeaponProperty = "FireFx",
					 ChangeValue = "SwordSwipeB-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 WeaponName = "SwordWeapon3",
					 WeaponProperty = "FireFx",
					 ChangeValue = "SwordSwipeC-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 WeaponName = "SwordWeaponDash",
					 WeaponProperty = "FireFx",
					 ChangeValue = "SwordSwipeC-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 }, 
				 {
					 WeaponName = "SwordWeapon3",
					 WeaponProperty = "ChargeFx",
					 ChangeValue = "ChargeAttack-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 }, 
				 {
					 WeaponName = "SwordWeaponDash",
					 WeaponProperty = "ChargeFx",
					 ChangeValue = "ChargeAttack-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 }, 
				 {
					 WeaponName = "SpearWeapon",
					 ProjectileProperty = "Graphic",
					 ChangeValue = "SpearThrustProjectile-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 WeaponName = "SpearWeapon2",
					 ProjectileProperty = "Graphic",
					 ChangeValue = "SpearThrustProjectile-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 WeaponName = "SpearWeapon3",
					 ProjectileProperty = "Graphic",
					 ChangeValue = "SpearThrustProjectile-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 WeaponName = "SpearWeaponDash",
					 ProjectileProperty = "Graphic",
					 ChangeValue = "SpearDashSwipe-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponName = "SpearWeaponSpin",
					 ProjectileProperty = "DetonateGraphic",
					 ChangeValue = "SpearSwipe360-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponName = "SpearWeaponSpin2",
					 ProjectileProperty = "DetonateGraphic",
					 ChangeValue = "SpearSwipe360-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponName = "SpearWeaponSpin3",
					 ProjectileProperty = "DetonateGraphic",
					 ChangeValue = "SpearSwipe360-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponName = "BowWeapon",
					 ProjectileProperty = "Graphic",
					 ChangeValue = "BowWeaponArrow-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 WeaponName = "BowWeapon",
					 WeaponProperty = "MinChargeStartFx",
					 ChangeValue = "BowCharge-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 WeaponName = "BowWeaponDash",
					 ProjectileProperty = "Graphic",
					 ChangeValue = "BowWeaponArrow-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 WeaponName = "BowWeaponDash",
					 WeaponProperty = "ChargeStartFx",
					 ChangeValue = "BowChargeFast-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponName = "ShieldWeapon",
					 ProjectileProperty = "DetonateGraphic",
					 ChangeValue = "ShieldSwipe-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 WeaponName = "ShieldWeaponDash",
					 ProjectileProperty = "DetonateGraphic",
					 ChangeValue = "ShieldSwipeDash-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponName = "ShieldWeaponRush",
					 WeaponProperty = "ChargeStartFx",
					 ChangeValue = "ShieldCharge-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponName = "ShieldWeaponRush",
					 ProjectileProperty = "Graphic",
					 ChangeValue = "ShieldRush3D-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponName = "ShieldWeaponRush",
					 ProjectileProperty = "DissipateGraphic",
					 ChangeValue = "ShieldRush3D-Out-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponName = "GunWeapon",
					 ProjectileProperty = "Graphic",
					 ChangeValue = "GunWeaponProjectile-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponName = "GunWeapon",
					 WeaponProperty = "FireFx",
					 ChangeValue = "GunFire-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponName = "GunWeapon",
					 ProjectileProperty = "ImpactFx",
					 ChangeValue = "GunWeaponImpact-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponName = "GunWeaponDash",
					 ProjectileProperty = "Graphic",
					 ChangeValue = "GunWeaponProjectile-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponName = "GunWeaponDash",
					 WeaponProperty = "FireFx",
					 ChangeValue = "GunFire-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponName = "GunWeaponDash",
					 ProjectileProperty = "ImpactFx",
					 ChangeValue = "GunWeaponImpact-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
					 ProjectileProperty = "Graphic",
					 ChangeValue = "FistFxManwe",
					 ChangeType = "Absolute"
				 },
				 {
					 WeaponName = "FistWeaponDash",
					 ProjectileProperty = "StartFx",
					 ChangeValue = "FistFxSwipe",
					 ChangeType = "Absolute",
				 },
	 
				 {
					 TraitName = "SwordConsecrationTrait",
					 WeaponNames = { "SwordWeapon" },
					 WeaponProperty = "FireFx",
					 ChangeValue = "SwordSwipeC-Manwe-Arthur",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 TraitName = "SwordConsecrationTrait",
					 WeaponNames = { "SwordWeapon2" },
					 WeaponProperty = "ChargeFx",
					 ChangeValue = "ChargeAttack-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 TraitName = "SwordConsecrationTrait",
					 WeaponNames = { "SwordWeapon2" },
					 WeaponProperty = "FireFx",
					 ChangeValue = "SwordSwipeA-Manwe-Arthur",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 TraitName = "SwordConsecrationTrait",
					 WeaponNames = { "SwordWeapon3" },
					 WeaponProperty = "FireFx",
					 ChangeValue = "SwordSwipeAFlipped-Manwe-Arthur",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 TraitName = "SwordConsecrationTrait",
					 WeaponNames = { "SwordWeapon3" },
					 WeaponProperty = "ChargeFx",
					 ChangeValue = "ChargeAttack-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 TraitName = "SwordConsecrationTrait",
					 WeaponNames = { "SwordWeaponDash" },
					 WeaponProperty = "FireFx",
					 ChangeValue = "SwordSwipeC-Manwe-Arthur",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 TraitName = "BowBondTrait",
					 WeaponName = "BowWeapon",
					 WeaponProperty = "MinChargeStartFx",
					 ChangeValue = "BowChargeRama-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 TraitName = "BowBondTrait",
					 WeaponName = "BowWeaponDash",
					 WeaponProperty = "ChargeStartFx",
					 ChangeValue = "BowChargeRamaDash-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 TraitName = "BowBondTrait",
					 WeaponNames = { "BowWeapon", "BowWeaponDash" },
					 ProjectileProperty = "AttachedAnim",
					 ChangeValue = "RamaWideShot-Manwe",
					 ChangeType = "Absoawlute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 TraitName = "GunLoadedGrenadeTrait",
					 WeaponName = "GunWeapon",
					 ProjectileProperty = "Graphic",
					 ChangeValue = "GunLaser-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 TraitName = "GunLoadedGrenadeTrait",
					 WeaponName = "GunWeapon",
					 ProjectileProperty = "AttachedAnim",
					 ChangeValue = "GunLaserOriginFlare-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 TraitName = "GunLoadedGrenadeTrait",
					 WeaponName = "GunWeapon",
					 ProjectileProperty = "TipFx",
					 ChangeValue = "GunLaserTipFlare-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 TraitName = "GunLoadedGrenadeTrait",
					 WeaponName = "GunWeapon",
					 WeaponProperty = "ChargeStartFx",
					 ChangeValue = "GunCharge-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 TraitName = "GunLoadedGrenadeTrait",
					 WeaponNames = { "GunWeapon", "GunWeaponDash" },
					 WeaponProperty = "FireFx",
					 ChangeValue = "null",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 TraitName = "GunLoadedGrenadeTrait",
					 WeaponName = "GunWeapon",
					 ProjectileProperty = "DissipateGraphic",
					 ChangeValue = "GunLaserEnd-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 TraitName = "ShieldLoadAmmoTrait",
					 WeaponName = "ShieldWeapon",
					 ProjectileProperty = "DetonateGraphic",
					 ChangeValue = "BeowulfShieldSlam-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 TraitName = "BowMarkHomingTrait",
					 WeaponNames = { "BowWeapon" },
					 ProjectileProperty = "Graphic",
					 ChangeValue = "BowWeaponArrow-Manwe-Alt01",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 TraitName = "BowLoadAmmoTrait",
					 WeaponNames = { "BowWeapon" },
					 ProjectileProperty = "Graphic",
					 ChangeValue = "BowWeaponArrow-Manwe-Alt02",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
				 {
					 WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
					 TraitName = "FistDetonateTrait",
					 WeaponProperty = "FireFx",
					 ChangeValue = "ClawSwipe-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 WeaponNames = { "FistWeapon2", "FistWeapon4" },
					 TraitName = "FistDetonateTrait",
					 WeaponProperty = "FireFx",
					 ChangeValue = "ClawSwipeFlipped-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
				 {
					 WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
					 TraitName = "FistDetonateTrait",
					 ProjectileProperty = "Graphic",
					 ChangeValue = "null",
					 ChangeType = "Absolute"
				 },
				 {
					 WeaponNames = { "FistWeaponDash" },
					 ProjectileProperty = "StartFx",
					 ChangeValue = "ClawSwipeFlippedDash-Manwe",
					 ChangeType = "Absolute",
					 ExcludeLinked = true,
				 },
	 
			 },
			 ExtractValues =
			 {
				{
					ExtractAs = "TooltipAirborneDuration",
					SkipAutoExtract = true,
					External = true,
					BaseType = "Effect",
					WeaponName = "SwordWeapon",
					BaseName = "ManweAirborne",
					BaseProperty = "Duration",
				}
			 }
	 } 
	 OlympusTraitData.ShieldLoadAmmoTrait.AnimDefinitions.ManweWeaponTrait =
	 {
		 Unloaded =
		 {
			 Graphic = "ShieldRush3DBeowulf-Manwe",
			 DissipateGraphic = "ShieldRush3DBeowulf-Out-Manwe",
			 StartFx = "null",
			 StartFx2 = "null",
			 AttachedAnim = "null",
		 },
		 Loaded =
		 {
			 Graphic = "ShieldRush3DBeowulf-Manwe",
			 DissipateGraphic = "ShieldRush3DBeowulf-Out-Manwe",
			 StartFx = "null",
			 StartFx2 = "null",
			 AttachedAnim = "ShieldRush3DBeowulfMax-Manwe",
		 },
	}
	table.insert(OlympusTraitData.GunShotgunTrait.PropertyChanges,{
		TraitName = "ManweWeaponTrait",
		WeaponNames = { "GunWeapon", "GunWeaponDash" },
		ProjectileProperty = "StartFx",
		ChangeValue = "GunShotgunBlastRandomFlip-Manwe",
		ChangeType = "Absolute",
		ExcludeLinked = true,
	})
	table.insert(OlympusTraitData.GunShotgunTrait.PropertyChanges,{
		TraitName = "ManweWeaponTrait",
		WeaponNames = { "GunWeapon", "GunWeaponDash" },
		ProjectileProperty = "ImpactFx",
		ChangeValue = "null",
		ChangeType = "Absolute",
		ExcludeLinked = true,
	})
	table.insert(OlympusTraitData.GunHomingBulletTrait.PropertyChanges,{
		WeaponNames = { "GunWeapon", "GunWeaponDash" },
		TraitName = "ManweWeaponTrait",
		ProjectileProperty = "Graphic",
		ChangeValue = "GunWeaponProjectile_Homing-Manwe",
		ChangeType = "Absolute",
		ExcludeLinked = true,
	})
	table.insert(OlympusTraitData.FistReachAttackTrait.PropertyChanges,{
		TraitName = "ManweWeaponTrait",
		WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
		ProjectileProperty = "Graphic",
		ChangeValue = "FistFxManwe_Reach",
		ChangeType = "Absolute",
		ExcludeLinked = true,
	})
	OlympusTraitData.ManweSecondaryTrait =
	 {
		 Name = "ManweSecondaryTrait",
		 InheritFrom = { "ShopTier1Trait" },
		 God = "Manwë",
		 Slot = "Secondary",
		 Icon =  "Boon_Manwe_02",
		 AddOutgoingDamageModifiers =
		 {
			 ValidWeaponMultiplier =
			 {
				 BaseValue = 1.6,
				 SourceIsMultiplier = true,
				 IdenticalMultiplier =
				 {
					 Value = DuplicateMultiplier,
				 },
			 },
			 ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			 ExtractValues =
			 {
				 {
					 Key = "ValidWeaponMultiplier",
					 ExtractAs = "TooltipDamage",
					 Format = "PercentDelta",
				 },
			 }
		 },
		 PropertyChanges =
		 {
			 {
				 WeaponNames = WeaponSets.HeroSecondaryWeapons,
				 EffectName = "ManweAirborne",
				 EffectProperty = "Active",
				 ChangeValue = true,
			 },
	
			 {
				 WeaponName = "SwordParry",
				 ProjectileProperty = "DetonateGraphic",
				 ChangeValue = "RadialNovaSwordParry-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
	
			 {
				 WeaponName = "SpearWeaponThrow",
				 ProjectileProperty = "Graphic",
				 ChangeValue = "SpearThrowProjectile-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
	
			 {
				 WeaponName = "SpearWeaponThrowReturn",
				 ProjectileProperty = "Graphic",
				 ChangeValue = "SpearThrowProjectile-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponName = "BowSplitShot",
				 ProjectileProperty = "Graphic",
				 ChangeValue = "BowWeaponArrow-Manwe-SplitShot",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
	
			 {
				 WeaponName = "BowSplitShot",
				 WeaponProperty = "MinChargeStartFx",
				 ChangeValue = "BowCharge-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
	
			 {
				 WeaponNames = { "ShieldThrow", },
				 ProjectileName = "ShieldThrow",
				 ProjectileProperty = "DetonateGraphic",
				 ChangeValue = "ShieldSwipe-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponNames = { "ShieldThrowDash" },
				 ProjectileName = "ShieldThrowDash",
				 ProjectileProperty = "DetonateGraphic",
				 ChangeValue = "ShieldSwipe-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
	
			 {
				 WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				 WeaponProperty = "ChargeStartFx",
				 ChangeValue = "ShieldCharge-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
	
			 {
				 WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				 ProjectileProperty = "Graphic",
				 ChangeValue = "ProjectileShield-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "ShieldRushBonusProjectileTrait",
				 ProjectileProperty = "Graphic",
				 WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				 ChangeValue = "ProjectileShieldAlt01-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "ShieldLoadAmmoTrait",
				 ProjectileProperty = "Graphic",
				 WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				 ChangeValue = "ProjectileShieldAlt03-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "ShieldTwoShieldTrait",
				 ProjectileProperty = "Graphic",
				 WeaponName = "ShieldThrow",
				 ChangeValue = "ProjectileShieldAlt02-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "ShieldTwoShieldTrait",
				 WeaponName = "ShieldThrow",
				 ProjectileName = "ShieldThrow",
				 ProjectileProperty = "DetonateGraphic",
				 ChangeValue = "ShieldThrowTrailMirage-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponName = "GunGrenadeToss",
				 ProjectileProperty = "DetonateGraphic",
				 ChangeValue = "ZagGrenadeExplosionManwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "SpearTeleportTrait",
				 WeaponName = "SpearRushWeapon",
				 ProjectileName = "SpearRushWeapon",
				 ProjectileProperty = "DetonateGraphic",
				 ChangeValue = "SpearRushTrailFx-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				 WeaponProperty = "FireFx",
				 ChangeValue = "FistFxUppercutDirectionalManwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
	
			 {
				 TraitName = "GunLoadedGrenadeTrait",
				 WeaponNames = { "GunGrenadeToss" },
				 ProjectileProperty = "Graphic",
				 ChangeValue = "GunGrenadeLuciferOrb-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "GunLoadedGrenadeTrait",
				 WeaponNames = { "GunGrenadeToss" },
				 ProjectileProperty = "GroupName",
				 ChangeValue = "FX_Standing_Add",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "GunLoadedGrenadeTrait",
				 WeaponNames = { "GunBombWeapon" },
				 ProjectileProperty = "DetonateGraphic",
				 ChangeValue = "ZagGrenadeExplosionManwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "GunLoadedGrenadeTrait",
				 WeaponNames = { "GunBombImmolation" },
				 ProjectileProperty = "DetonateGraphic",
				 ChangeValue = "LuciferOrbAoE-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
	
			 {
				 TraitName = "BowMarkHomingTrait",
				 WeaponNames = { "BowSplitShot" },
				 ProjectileProperty = "Graphic",
				 ChangeValue = "BowWeaponArrow-Manwe-SplitShot-Alt01",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "BowLoadAmmoTrait",
				 WeaponNames = { "BowSplitShot" },
				 ProjectileProperty = "Graphic",
				 ChangeValue = "BowWeaponArrow-Manwe-SplitShot-Alt02",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "FistDetonateTrait",
				 WeaponNames = { "FistWeaponSpecial" },
				 WeaponProperty = "FireFx",
				 ChangeValue = "ClawSwipeUppercut-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "FistDetonateTrait",
				 WeaponNames = { "FistWeaponSpecialDash" },
				 WeaponProperty = "FireFx",
				 ChangeValue = "ClawSwipeUppercut-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "FistDetonateTrait",
				 WeaponNames = { "FistWeaponSpecialDash" },
				 WeaponProperty = "FireFx",
				 ChangeValue = "ClawSwipeUppercutSpecial-Manwe",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
			 {
				 TraitName = "FistTeleportSpecialTrait",
				 WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				 WeaponProperty = "FireFx",
				 ChangeValue = "FistFxUppercutDirectionalManwe_FlashKick",
				 ChangeType = "Absolute",
				 ExcludeLinked = true,
			 },
	
	
		 },
		 EnemyPropertyChanges =
		 {
			 {
				 TraitName = "GunLoadedGrenadeTrait",
				 LegalUnits = { "GunBombUnit" },
				 ThingProperty = "Graphic",
				 ChangeValue = "LuciferBomb-Manwe",
				 ChangeType = "Absolute",
			 },
	
		 },
		 ExtractValues =
		 {
			{
				ExtractAs = "TooltipAirborneDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ManweAirborne",
				BaseProperty = "Duration",
			}
		 }
	 }
	 
	table.insert(OlympusTraitData.FistSpecialFireballTrait.PropertyChanges,{
		TraitName = "ManweSecondaryTrait",
		WeaponName = "FistWeaponSpecial",
		ProjectileProperty = "Graphic",
		ChangeValue = "FistFireballFx-Manwe",
		ChangeType = "Absolute",
		ExcludeLinked = true,
	})
	table.insert(OlympusTraitData.FistSpecialFireballTrait.PropertyChanges,{
		TraitName = "ManweSecondaryTrait",
		WeaponName = "FistWeaponSpecial",
		WeaponProperty = "FireFx",
		ChangeValue = "null",
		ChangeType = "Absolute",
		ExcludeLinked = true,
	})
	table.insert(OlympusTraitData.FistSpecialLandTrait.PropertyChanges,{
		TraitName = "ManweSecondaryTrait",
		WeaponNames = { "FistWeaponLandAreaAttack" },
		ProjectileProperty = "DetonateGraphic",
		ChangeValue = "FistSpecialLandFx_Manwe",
		ChangeType = "Absolute",
		ExcludeLinked = true,
	})
	table.insert(OlympusTraitData.SpearThrowObjectAOETrait.PropertyChanges,{
		TraitName = "ManweSecondaryTrait",
		WeaponNames = { "SpearThrowImmolation" },
		ProjectileProperty = "DetonateGraphic",
		ChangeType = "Absolute",
		ChangeValue = "RadialNovaSwordParry-Manwe",
		ExcludeLinked = true,
	})
	
	-- MAREK CHECK THIS
	OlympusTraitData.ManweDashTrait =
	 {
		 Name = "ManweDashTrait",
		 InheritFrom = { "ShopTier1Trait" },
		 -- Inherit
		 Cost = 30,
		 -- New Data
		 God = "Manwë",
		 Slot = "Rush",
		 Icon = "Boon_Manwe_03",
		 RarityLevels =
		 {
			 Common =
			 {
				 MinMultiplier = 1.0,
				 MaxMultiplier = 1.0,
			 },
			 Rare =
			 {
				 MinMultiplier = 1.5,
				 MaxMultiplier = 1.5,
	
			 },
			 Epic =
			 {
				 MinMultiplier = 2.0,
				 MaxMultiplier = 2.0,
			 },
			 Heroic =
			 {
				 MinMultiplier = 2.5,
				 MaxMultiplier = 2.5,
			 }
		 },
		 WeaponDataOverride =
		 {
			 RushWeapon =
			 {
				 CauseImpactReaction = false,
				 ImpactReactionHitsOverride = 0,
			 },
		 },
		 PropertyChanges =
		 {
			 {
				 WeaponNames = WeaponSets.HeroRushWeapons,
				 WeaponProperty = "Projectile",
				 ChangeValue = "ManweProjectile",
				 ChangeType = "Absolute",
			 },
			 {
				 WeaponNames = WeaponSets.HeroRushWeapons,
				 ProjectileProperty = "DamageLow",
				 BaseMin = 15,
				 BaseMax = 15,
				 AsInt = true,
				 DepthMult = DepthDamageMultiplier,
				 IdenticalMultiplier =
				 {
					 Value = DuplicateVeryStrongMultiplier,
				 },
				 ExtractValue =
				 {
					 ExtractAs = "TooltipDamage",
				 }
			 },
			 {
				 WeaponNames = WeaponSets.HeroRushWeapons,
				 ProjectileProperty = "DamageHigh",
				 DeriveValueFrom = "DamageLow"
			 },
			 {
				 WeaponNames = WeaponSets.HeroRushWeapons,
				 WeaponProperty = "BlinkDetonateAtEndpointDelay",
				 ChangeValue = 0.01,
				 ChangeType = "Absolute",
			 },
			 {
				 WeaponNames = WeaponSets.HeroRushWeapons,
				 WeaponProperty = "FireFx",
				 ChangeValue = "BlinkTrailVerticalB-Manwe",
				 ChangeType = "Absolute",
			 },
			 {
				 WeaponNames = WeaponSets.HeroRushWeapons,
				 WeaponProperty = "FireGraphic",
				 ChangeValue = "ZagreusDashNoCollide_Manwe",
				 ChangeType = "Absolute",
			 },
			 {
				 WeaponNames = WeaponSets.HeroRushWeapons,
				 WeaponProperty = "BlinkDetonateAtOrigin",
				 ChangeValue = true,
				 ChangeType = "Absolute",
			 },
			 {
				 WeaponNames = WeaponSets.HeroRushWeapons,
				 WeaponProperty = "BlinkDetonateAtEndpoint",
				 ChangeValue = false,
				 ChangeType = "Absolute",
			 },
		 },
		 ExtractValues =
		 {
			 {
				 ExtractAs = "TooltipGustDuration",
				 SkipAutoExtract = true,
				 External = true,
				 BaseType = "Effect",
				 WeaponName = "SwordWeapon",
				 BaseName = "Gust",
				 BaseProperty = "Duration",
			 }
		 }
	 }
	OlympusTraitData.ManweRangedTrait =
	{
			Name = "ManweRangedTrait",
			InheritFrom = { "ShopTier1Trait" },
			God = "Manwë",
			Slot = "Ranged",
			Icon = "Boon_Manwe_04",
			TraitDependencyTextOverrides =
			{
				ShieldLoadAmmoTrait =
				{
					Name = "ShieldLoadAmmo_ManweRangedTrait",
					CustomTrayText = "ShieldLoadAmmo_ManweRangedTrait_Tray",
				},
				BowLoadAmmoTrait =
				{
					Name = "BowLoadAmmo_ManweRangedTrait",
					CustomTrayText = "BowLoadAmmo_ManweRangedTrait_Tray",
				},
			},
			CustomTrayText = "ManweRangedTrait_Tray",
			UnloadAmmoOffset = 
			{
				BaseValue = -20,
				MinMultiplier = 0,
				IdenticalMultiplier =
				{
					Value = -1,
				},
				IgnoreRarity = true,
			},
			RarityLevels =
			{
				Common =
				{
					Multiplier = 1.0,
				},
				Rare =
				{
					Multiplier = 1.11,
				},
				Epic =
				{
					Multiplier = 1.22,
				},
				Heroic =
				{
					Multiplier = 1.33,
				}
			},
			PropertyChanges =
			{
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "Projectile",
					ChangeValue = "ManweProjectile",
					ChangeType = "Absolute",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					ProjectileProperty = "SilentImpactOnInvulnerable",
					ChangeValue = true,
					ChangeType = "Absolute",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "AimLineAnimation",
					ChangeValue = "null",
					ChangeType = "Absolute",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "ManualAiming",
					ChangeValue = true,
					ChangeType = "Absolute",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "AcceptTriggerLockRequests",
					ChangeValue = false,
					ChangeType = "Absolute",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "AllowExternalForceRelease",
					ChangeValue = true,
					ChangeType = "Absolute",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "AutoLockRange",
					ChangeValue = 900,
					ChangeType = "Absolute",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "ManualAimingInitialOffset",
					ChangeValue = 420,
					ChangeType = "Absolute",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "FireOnRelease",
					ChangeValue = true,
					ChangeType = "Absolute",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "LockTriggerForCharge",
					ChangeValue = false,
					ChangeType = "Absolute",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "MinChargeToFire",
					ChangeValue = 0,
					ChangeType = "Absolute",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "TargetReticleAnimation",
					ChangeValue = "GunGrenadeWarningDecal",
					ChangeType = "Absolute",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					ProjectileName = "ManweProjectile",
					ProjectileProperty = "DamageLow",
					BaseMin = 90,
					BaseMax = 90,
					AsInt = true,
					DepthMult = DepthDamageMultiplier,
					IdenticalMultiplier =
					{
						Value = DuplicateStrongMultiplier,
					},
					ExtractValue =
					{
						ExtractAs = "TooltipDuration",
					},
					ExtractSource = "ExtractSource",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					ProjectileName = "ManweProjectile",
					ProjectileProperty = "DamageHigh",
					DeriveValueFrom = "DamageLow",
				},
				-- Beowulf modifications
				{
					TraitName = "ShieldLoadAmmoTrait",
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					ProjectileName = "ManweProjectile",
					ProjectileProperty = "DamageLow",
					DeriveValueFrom = "ExtractSource",
					ExtractValue =
					{
						ExtractAs = "TooltipDamageBeowulf",
					},
				},
				{
					TraitName = "ShieldLoadAmmoTrait",
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					ProjectileName = "ManweProjectile",
					ProjectileProperty = "DamageHigh",
					DeriveValueFrom = "ExtractSource",
				},
				{
					TraitName = "ShieldLoadAmmoTrait",
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					ExcludeProjectileName = "ManweProjectile",
					ProjectileProperty = "DetonateGraphic",
					ChangeValue = "null",
				},
				-- In case bow load ammo is Active
				{
					TraitName = "BowLoadAmmoTrait",
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "FireOnRelease",
					ChangeValue = false,
					ChangeType = "Absolute",
				},
				{
					TraitName = "BowLoadAmmoTrait",
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					ProjectileProperty = "Type",
					ChangeValue = "INSTANT",
				},
				{
					TraitName = "ShieldLoadAmmoTrait",
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "FireOnRelease",
					ChangeValue = false,
					ChangeType = "Absolute",
				},
				{
					TraitName = "ShieldLoadAmmoTrait",
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					ProjectileProperty = "Type",
					ChangeValue = "INSTANT",
				},
				-- Flurry Shot
				{
					TraitName = "RapidCastTrait",
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "FireOnRelease",
					ChangeValue = false,
					ChangeType = "Absolute",
				},
			},
			ExtractValues =
			{
				{
					ExtractAs = "BaseRangedDamage",
					External = true,
					BaseType = "Projectile",
					BaseName = "RangedWeapon",
					BaseProperty = "DamageLow",
				},
				{
					ExtractAs = "TooltipGustDuration",
					SkipAutoExtract = true,
					External = true,
					BaseType = "Effect",
					WeaponName = "SwordWeapon",
					BaseName = "Gust",
					BaseProperty = "Duration",
				}
			}
		}
		
	OlympusTraitData.ShieldLoadAmmo_ManweRangedTrait = 
	{
		InheritFrom = {"ManweRangedTrait"},
		Skip = true,
		CustomTrayText = "ShieldLoadAmmo_ManweRangedTrait_Tray",
        RequiredOneOfTraits = { "BowLoadAmmoTrait", "ShieldLoadAmmoTrait" }
	}
	OlympusTraitData.ManweShoutTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "ManweShoutTrait_Tray",
		God = "Manwë",
		Slot = "Shout",
		Icon = "Boon_Manwe_06",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.1,
			},
			Epic =
			{
				Multiplier = 1.2,
			},
			Heroic =
			{
				Multiplier = 1.3,
			}
		},
		AddShout =
		{
			FunctionName = "ManweShout",
			MaxFunctionName = "ManweMaxShout",
			Cost = 25,
			MaxDurationMultiplier = 2,
			SuperDuration = 5,
			IsBurst = true,
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				},
				{
					Key = "MaxDurationMultiplier",
					ExtractAs = "TooltipDuration",
					Format = "EXWrathDuration",
					DecimalPlaces = 2,
					SkipAutoExtract = true
				}
			}
		},
		EndShout = "EndManwe",
		PreEquipWeapons = { "ManweSuper", "ManweMaxSuper", },
		PropertyChanges =
		{
			{
				WeaponNames = { "ManweSuper", "ManweMaxSuper", },
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = { "ManweSuper", "ManweMaxSuper", },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = { "ManweSuper", "ManweMaxSuper", },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.25,
				ExtractValue =
				{
					ExtractAs = "TooltipInterval",
					SkipAutoExtract = true,
					DecimalPlaces = 2,
				}
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipAirborneDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ManweAirborne",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipGustDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ManweGust",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipGustDamage",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ManweGust",
				BaseProperty = "Damage",
			},
		}
	}
	OlympusTraitData.ManaRevengeTrait =
	 {
		God = "Manwë",
		InheritFrom = { "ShopTier1Trait" },
		AddOnHitWeapons = { "AreaWeakenManwe" },
		Icon = "Boon_Manwe_07",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "AreaWeakenManwe",
				ProjectileProperty = "DamageLow",
				BaseMin = 50,
				BaseMax = 50,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateVeryStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "AreaWeakenManwe",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipBlindDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ManweGust",
				BaseProperty = "Duration",
			}
		}
	}
	OlympusTraitData.ManweShakenTrait =
	{
		Name = "ManweShakenTrait",
		God = "Manwe",
		InheritFrom = {"ShopTier2Trait"},
		Icon = "Boon_Manwe_08",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "ManweWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},	
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				BaseMin = 0.10,
				BaseMax = 0.10,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent",
				},
				ChangeType = "Add",
				DeriveSource = "DeriveSource"
			},
			{
				WeaponNames = {"AreaWeakenManwe"},
				EffectName = "ManweShaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ManweShaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "ManweSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "ManweShaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ManweSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "ManweShaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},			
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipShakenDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ManweShaken",
				BaseProperty = "Duration",
			}
		}
	}
	OlympusTraitData.ManweAirborneTrait =
	{
		Name = "ManweAirborneTrait",
		God = "Apollo",
		InheritFrom = {"ShopTier2Trait"},
		Icon = "Boon_Apollo_09",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "ManweWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "IncreaseDuration",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AreaWeakenManwe",
				EffectName = "IncreaseDuration",
				EffectProperty = "Active",
				ChangeValue = true,
			},			
			{
				TraitName = "ShieldLoadAmmo_ManweRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "IncreaseDuration",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "IncreaseDuration",
				EffectProperty = "Modifier",
				BaseMin = 0.10,
				BaseMax = 0.10,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent",
				},
				ChangeType = "Add",
				DeriveSource = "DeriveSource"
			},
			{
				WeaponNames = {"AreaWeakenManwe"},
				EffectName = "IncreaseDuration",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "IncreaseDuration",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "ManweSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "IncreaseDuration",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ManweSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "IncreaseDuration",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},			
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipAirborneDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ManweAirborne",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipAirborneDelay",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ManweAirborne",
				BaseProperty = "Duration",
			}
		}
	}
	OlympusTraitData.FountainDefenseTrait =
	{
		Icon = "Boon_Apollo_XX",
		InheritFrom = { "ShopTier1Trait" },
		God = "Apollo",
		CustomTrayText = "FountainDefenseTrait_Tray",
		RequiredFalseTrait = "FountainDefenseTrait",    
		RequiredCosmetics = { "TartarusReprieve" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.33,
			},
			Epic =
			{
				Multiplier = 1.66,
			},
			Heroic =
			{
				Multiplier = 2.00,
			}
		},
		FountainDefenseBonus = 
		{
			BaseValue = 0.97,
			ToNearest = 0.01,
			SourceIsMultiplier = true,
			IdenticalMultiplier = 
			{
				Value = -0.5,
			},		
		},
		AccumulatedFountainDefenseBonus = 1,
		AddIncomingDamageModifiers =
		{
			DistanceThreshold = 400,
			DistanceMultiplier = AccumulatedFountainDefenseBonus,
		},
		ExtractValues =
		{
		  {
			Key = "FountainDefenseBonus",
			ExtractAs = "TooltipFountainBonus",
			Format = "NegativePercentDelta"
		  },
		  {
			Key = "AccumulatedFountainDefenseBonus",
			ExtractAs = "TooltipAccumulatedBonus",
			Format = "NegativePercentDelta"
		  },
		},
	}
	OlympusTraitData.FountainCoinTrait =
	{
		Icon = "Boon_Apollo_11",
		InheritFrom = { "ShopTier1Trait" },
		God = "Apollo",
		CustomTrayText = "FountainCoinTrait_Tray",
		RequiredFalseTrait = "FountainCoinTrait",    
		RequiredCosmetics = { "TartarusReprieve" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 2.00,
			}
		},
		FountainCoinBonus = { 
			BaseValue = 100
		},
	}
	OlympusTraitData.ApolloHealTrait =
	{
		Icon = "Boon_Apollo_13",
		InheritFrom = { "ShopTier2Trait" },
		RequiredFalseTrait = "ApolloHealTrait",
		God = "Apollo",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		ApolloHealDropChance = { 
			BaseValue = 0.04
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipBlindDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Duration",
			},
			{
				Key = "ApolloHealDropChance",
				ExtractAs = "TooltipDropChance",
				Format = "Percent"
			  },
		}
	}
	OlympusTraitData.RerollBoonTrait = -- Future Sight
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredMetaUpgradeSelected = "RerollPanelMetaUpgrade",
		RequiredMetaUpgradeStageUnlocked = 4,
		Icon = "Boon_Apollo_10",
		RequiredFalseTraits = {"RerollObolTrait", "RerollBoonTrait"},
		BoonCount = { 
			BaseValue = 1
		},
		RarityLevels =
		{
			Common =
			{
				Multiplier = 4,
			},
			Rare =
			{
				Multiplier = 3,
			},
			Epic =
			{
				Multiplier = 2,
			},
			Heroic =
			{
				Multiplier = 1,
			}
		},
		ExtractValues =
		{
			{
				Key = "BoonCount",
				ExtractAs = "TooltipBoonCount",
			}
		}
	}
	OlympusTraitData.RerollObolTrait = -- Golden Fleece
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredMetaUpgradeSelected = "RerollMetaUpgrade",
		RequiredMetaUpgradeStageUnlocked = 4,
		Icon = "Boon_Apollo_12",
		RequiredFalseTraits = {"RerollObolTrait", "RerollBoonTrait"},
		ObolCount = { 
			BaseValue = 1
		},
		RarityLevels =
		{
			Common =
			{
				Multiplier = 300,
			},
			Rare =
			{
				Multiplier = 250,
			},
			Epic =
			{
				Multiplier = 200,
			},
			Heroic =
			{
				Multiplier = 150,
			}
		},
		ExtractValues =
		{
			{
				Key = "ObolCount",
				ExtractAs = "TooltipObolCount",
			}
		}
	}
	
	OlympusTraitData.MissChanceTrait =
	{
		Icon = "Boon_Apollo_14",
		RequiredFalseTrait = "MissChanceTrait",
		God = "Apollo",
		InheritFrom = { "ShopTier3Trait" },
		PropertyChanges =
		{
			{
				WeaponName = WeaponSets.HeroPhysicalWeapons,
				EffectName = "ApolloBlind",
				EffectProperty = "Amount",
				ChangeValue = 0.75,
				ChangeType = "Absolute",
			},
			{
				WeaponName = WeaponSets.HeroSecondaryWeapons,
				EffectName = "ApolloBlind",
				EffectProperty = "Amount",
				ChangeValue = 0.75,
				ChangeType = "Absolute",
			},
			{
				WeaponName = WeaponSets.HeroRushWeapons,
				EffectName = "ApolloBlind",
				EffectProperty = "Amount",
				ChangeValue = 0.75,
				ChangeType = "Absolute",
			},
			{
				WeaponName = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ApolloBlind",
				EffectProperty = "Amount",
				ChangeValue = 0.75,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = {"AreaWeakenApollo"},
				EffectName = "ApolloBlind",
				EffectProperty = "Amount",
				ChangeValue = 0.75,
				ChangeType = "Absolute",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipBlindDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipBlindPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Amount",
				Format = "Percent"
			}
		}
	}
	-- Consumable Data
	local OlympusConsumableData = ModUtil.Entangled.ModData(ConsumableData)
	OlympusConsumableData.RerollBoonDrop =
	{
		InheritFrom = { "BaseConsumable", "Tier1Consumable" },
		RequiredFalseTraits = {"RerollObolTrait", "RerollBoonTrait"},
		RequiredMetaUpgradeSelected = "RerollPanelMetaUpgrade",
		RequiredMetaUpgradeStageUnlocked = 4,
		Icon = "Boon_Apollo_10",
		ConsumeSound = "/EmptyCue",
		Cost = 0,
		UseFunctionNames =  { "AddRerollBoon", "AddTraitToHero" } ,
		UseFunctionArgs = {
			{ },
			{ TraitName = "RerollBoonTrait" },
		},
	}
	OlympusConsumableData.RerollObolDrop =
	{
		InheritFrom = { "BaseConsumable", "Tier1Consumable" },
		RequiredFalseTraits = {"RerollObolTrait", "RerollBoonTrait"},
		RequiredMetaUpgradeSelected = "RerollMetaUpgrade",
		RequiredMetaUpgradeStageUnlocked = 4,
		Icon = "Boon_Apollo_12",
		ConsumeSound = "/EmptyCue",
		Cost = 0,
		UseFunctionNames =  { "AddRerollObol", "AddTraitToHero" } ,
		UseFunctionArgs = {
			{ },
			{ TraitName = "RerollObolTrait" },
		},
	}
	-- Duo Traits
	OlympusTraitData.BlindDurationTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Apollo_Demeter_01",
		RequiredFalseTrait = "BlindDurationTrait",
		PropertyChanges =
		{
			{
				TraitName = "MasterBoltTrait",
				WeaponName = "BlindLightningEffector",
				EffectName = "BlindLightning",
				EffectProperty = "Duration",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},
			{
				WeaponName = WeaponSets.HeroPhysicalWeapons,
				EffectName = "ApolloBlind",
				EffectProperty = "Duration",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				},
			},
			{
				WeaponName = WeaponSets.HeroSecondaryWeapons,
				EffectName = "ApolloBlind",
				EffectProperty = "Duration",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},
			{
				WeaponName = WeaponSets.HeroRushWeapons,
				EffectName = "ApolloBlind",
				EffectProperty = "Duration",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},
			{
				WeaponName = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ApolloBlind",
				EffectProperty = "Duration",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = {"AreaWeakenApollo"},
				EffectName = "ApolloBlind",
				EffectProperty = "Duration",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},		
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipBlindDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipBlindPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Amount",
				Format = "Percent"
			}
		}		
	}
	OlympusTraitData.FamedDuetTrait =
		{
			InheritFrom = { "SynergyTrait" },
			Icon = "Apollo_Artemis_01",
			RequiredFalseTrait = "FamedDuetTrait",
			PropertyChanges =
			{
				{
					TraitName = "ApolloShoutTrait",
					WeaponName = "ApolloBeamWeapon",
					WeaponProperty = "NumProjectiles",
					ChangeValue = 12,
					ExcludeLinked = true,
				},
			},
			ExtractValues =
			{
				{
					ExtractAs = "TooltipWrathStocks",
					Format = "ExistingWrathStocks",
					SkipAutoExtract = true
				}
			}		
		}
	OlympusTraitData.WarSongTrait =
		{
			InheritFrom = { "SynergyTrait" },
			Icon = "Apollo_Ares_01",
			RequiredFalseTraits = { "WarSongTrait" },
			PropertyChanges =
			{
				{
					TraitName = "ApolloRangedTrait",
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					EffectName = "DelayedDamage",
					EffectProperty = "Active",
					ChangeValue = true
				},
				{
					TraitName = "ApolloRangedTrait",
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					EffectName = "DelayedDamage",
					EffectProperty = "Amount",
					BaseMin = 100,
					BaseMax = 100,
					AsInt = true,
					MinMultiplier = 0.025,
					IdenticalMultiplier =
					{
						Value = -0.4,
					},
					ExtractValue =
					{
						ExtractAs = "TooltipCurseDamage",
					}
				},
				{
					TraitName = "MasterLobDionysusTrait",
					WeaponName = "ApolloLobWeaponAdditional",
					EffectName = "DelayedDamage",
					EffectProperty = "Active",
					ChangeValue = true
				},
				{
					TraitName = "MasterLobDionysusTrait",
					WeaponName = "ApolloLobWeaponAdditional",
					EffectName = "DelayedDamage",
					EffectProperty = "Amount",
					BaseMin = 100,
					BaseMax = 100,
					AsInt = true,
					MinMultiplier = 0.025,
					IdenticalMultiplier =
					{
						Value = -0.4,
					},
					ExtractValue =
					{
						ExtractAs = "TooltipCurseDamage",
					}
				},
			}
		}
	table.insert(OlympusTraitData.AresLongCurseTrait.PropertyChanges,{
		TraitName = "ApolloRangedTrait",
		WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
		EffectName = "DelayedDamage",
		EffectProperty = "Duration",
		DeriveValueFrom = "DurationSource"
	})
	table.insert(OlympusTraitData.AresLoadCurseTrait.PropertyChanges,{
		TraitName = "ApolloRangedTrait",
		WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
		EffectName = "DelayedDamage",
		EffectProperty = "StackAmount",
		DeriveValueFrom = "DamageSource"
	})
	table.insert(OlympusTraitData.AresLoadCurseTrait.PropertyChanges,{
		TraitName = "ApolloRangedTrait",
		WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
		EffectName = "DelayedDamage",
		EffectProperty = "Stacks",
		ChangeValue  = true,
	})
OlympusTraitData.HyacinthTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Apollo_Aphrodite_01",
		RequiredFalseTraits = { "HyacinthTrait", "CharmTrait", "InstantChillKill"},
		OnDamageEnemyFunction = {
			FunctionName = "CheckHyacinthKill",
			FunctionArgs = {
				HyacinthDeathThreshold = 0.30,
				ExtractValues =
				{
					{
						Key = "HyacinthDeathThreshold",
						ExtractAs = "TooltipDeathThreshold",
						Format = "Percent",
					},
				}
			}
		},
		PreEquipWeapons = { "HyacinthChillKill" },
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipBlindDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipBlindPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Amount",
				Format = "Percent"
			}
		}
	}
OlympusTraitData.SeaChanteyTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Apollo_Poseidon_01",
		RequiredFalseTrait = "SeaChanteyTrait",
		AddIncomingDamageModifiers =
		{
			BossDamageMultiplier = 1.05,
			ExtractValues =
			{
				{
					Key = "BossDamageMultiplier",
					ExtractAs = "IncomingMultiplier",
					Format = "PercentDelta",
				},
			}
		},
		AddOutgoingDamageModifiers =
		{
			BossDamageMultiplier = 1.20,
			ExtractValues =
			{
				{
					Key = "BossDamageMultiplier",
					ExtractAs = "OutgoingMultiplier",
					Format = "PercentDelta",
				},
			}
		},
		OnDamageEnemyFunction = {
			FunctionName = "SpawnMusicNotes",
			FunctionArgs = {}
		}
	}			
OlympusTraitData.MasterLobApolloTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Apollo_Dionysus_01",
		RequiredFalseTraits = { "MasterLobDionysusTrait", "MasterLobApolloTrait" },
		PreEquipWeapons = { "DionysusLobWeaponAdditional" },
		OnProjectileDeathFunction =
		{
			Name = "SpawnAdditionalLob",
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipDamage",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusLobProjectileAdditional",
				BaseProperty = "DamageLow",
			},
			{
				ExtractAs = "TooltipCloudDuration",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "TotalFuse",
			},
			{
				ExtractAs = "TooltipCloudInterval",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "Fuse",
				DecimalPlaces = 2,
			},
			{
				ExtractAs = "TooltipBlindDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Duration",
			}
		}
	}
	-- Exact copy, but different for HelpText
OlympusTraitData.MasterLobDionysusTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Apollo_Dionysus_01",
		RequiredFalseTraits = { "MasterLobApolloTrait", "MasterLobDionysusTrait" },
		PreEquipWeapons = { "ApolloLobWeaponAdditional" },
		OnProjectileDeathFunction =
		{
			Name = "SpawnAdditionalLob",
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipDamage",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "ApolloLobProjectileAdditional",
				BaseProperty = "DamageLow",
			},
			{
				ExtractAs = "TooltipCloudDuration",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "TotalFuse",
			},
			{
				ExtractAs = "TooltipCloudInterval",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "Fuse",
				DecimalPlaces = 2,
			},
			{
				ExtractAs = "TooltipBlindDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipBlindPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Amount",
				Format = "Percent"
			}
		}
	}
	table.insert(OlympusTraitData.DionysusDefenseTrait.PropertyChanges, {
		TraitName = "MasterLobApolloTrait",
		WeaponName = "DionysusLobWeaponAdditional",
		EffectName= "WinePuddleDefense",
		EffectProperty = "Modifier",
		BaseMin = 0.85,
		BaseMax = 0.90,
		SourceIsMultiplier = true,
		DeriveSource = "ModifierSource",
		IdenticalMultiplier =
		{
			Value = DuplicateMultiplier,
		},
		ChangeType = "Multiply",
		ExtractValue =
		{
			ExtractAs = "TooltipDamageReduction",
			Format = "NegativePercentDelta",
		}
	})
	table.insert(OlympusTraitData.DionysusDefenseTrait.PropertyChanges, {
		TraitName = "MasterLobApolloTrait",
		WeaponName = "DionysusLobWeaponAdditional",
		EffectName= "WinePuddleDefense",
		EffectProperty = "Active",
		ChangeValue = true,
		ChangeType = "Absolute",
	})
	OlympusTraitData.IceStrikeArrayTrait.AddOutgoingDamageModifiers.RequiredTrait = nil
	table.insert(OlympusTraitData.IceStrikeArrayTrait.PropertyChanges,{
		TraitName = "MasterLobApolloTrait",
		WeaponName = "DionysusLobWeaponAdditional",
		ProjectileProperty = "Type",
		ChangeValue = "INSTANT",
		ExcludeLinked = true,
	})
	table.insert(OlympusTraitData.IceStrikeArrayTrait.PropertyChanges,{
		TraitName = "MasterLobApolloTrait",
		WeaponName = "DionysusLobWeaponAdditional",
		ProjectileProperty = "Fuse",
		ChangeValue = 0.3,
		ExcludeLinked = true,
	})
	table.insert(OlympusTraitData.IceStrikeArrayTrait.PropertyChanges,{
		TraitName = "MasterLobApolloTrait",
		WeaponName = "DionysusLobWeaponAdditional",
		WeaponProperty = "ManualAimingRequireValidLocation",
		ChangeValue = true,
		ExcludeLinked = true,
	})
	table.insert(OlympusTraitData.IceStrikeArrayTrait.PropertyChanges,{
		TraitName = "MasterLobApolloTrait",
		WeaponName = "DionysusLobWeaponAdditional",
		ProjectileProperty = "Speed",
		ChangeValue = 0,
		ExcludeLinked = true,
	})
	table.insert(OlympusTraitData.IceStrikeArrayTrait.PropertyChanges,{
		TraitName = "MasterLobApolloTrait",
		WeaponName = "DionysusLobWeaponAdditional",
		ProjectileProperty = "Range",
		ChangeValue = 100,
		ExcludeLinked = true,
	})
	table.insert(OlympusTraitData.IceStrikeArrayTrait.PropertyChanges,{
		TraitName = "MasterLobApolloTrait",
		WeaponName = "DionysusLobWeaponAdditional",
		WeaponProperty = "AutoLock",
		ChangeValue = false,
		ExcludeLinked = true,
	})
	table.insert(OlympusTraitData.IceStrikeArrayTrait.PropertyChanges,{
		TraitName = "MasterLobApolloTrait",
		WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
		ProjectileName = "DionysusField",
		EffectName = "DemeterSlow",
		EffectProperty = "Active",
		ChangeValue = true,
	})
	table.insert(OlympusTraitData.IceStrikeArrayTrait.PropertyChanges,{
		TraitName = "MasterLobApolloTrait",
		WeaponName = "DionysusLobWeaponAdditional",
		ProjectileProperty = "Graphic",
		ProjectileName = "DionysusField",
		ChangeValue = "DemeterIceStrikeIndicator",
		ExcludeLinked = true,
	})
	table.insert(OlympusTraitData.IceStrikeArrayTrait.PropertyChanges,{
		TraitName = "MasterLobApolloTrait",
		WeaponName = "DionysusLobWeaponAdditional",
		ProjectileProperty = "Graphic",
		ProjectileName = "DionysusLobProjectileAdditional",
		ChangeValue = "DemeterPoseidonIceSpark",
		ExcludeLinked = true,
	})	
	OlympusTraitData.LightningCloudTrait.AmmoDeathAdditionalWeapon = {
		ValidProjectileName = "DionysusLobProjectileAdditional",
		WeaponName = "ZeusDionysusCloudStrike",
		Interval = 0.85,
		Duration = 5,
		Range = 400,
	}
	
	OlympusTraitData.DamageReduceDistanceTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Apollo_Athena_01",
		RequiredFalseTraits = { "DamageReduceDistanceTrait"},
		PreEquipWeapons = { "DistanceResistWeapon" },
		DistanceResistThreshold = { 
			BaseValue = 400
		},
		DistanceResistMultiplier = { 
			BaseValue = 0.6
		},
		PropertyChanges =
		{
			{
				WeaponNames = {"DistanceResistWeapon"},
				EffectName = "DamageResist",
				EffectProperty = "Duration",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageResistDuration",
				}
			},		
			{
				WeaponNames = {"DistanceResistWeapon"},
				EffectName = "DamageResist",
				EffectProperty = "Modifier",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageResistModifier",
					Format ="Percent"
				}
			},	
		}
	}	
	OlympusTraitData.MasterBoltTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Apollo_Zeus_01",
		RequiredFalseTraits = { "MasterBoltTrait" },
		PreEquipWeapons = { "BlindLightningEffector" },
		ExtractValues =
		{
			{
				ExtractAs = "MasterBoltDamage",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "BlindLightningEffector",
				BaseName = "BlindLightning",
				BaseProperty = "Amount",
			},
			{
				ExtractAs = "TooltipBlindDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipBlindPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ApolloBlind",
				BaseProperty = "Amount",
				Format = "Percent"
			}
		}
	}
	
	
	
	-- LootData
	local OlympusLootData = ModUtil.Entangled.ModData(LootData)
	OlympusLootData.ApolloUpgrade = {
			Name = "ApolloUpgrade",
			InheritFrom = { "BaseLoot", "BaseSoundPackage"},
			CanReceiveGift = true,
			AlwaysShowDefaultUseText = true,
			Weight = 10,
			Icon = "BoonSymbolApollo2",
			BoonInfoIcon = "BoonInfoSymbolApolloIcon",
			DoorIcon = "BoonSymbolApolloIsometric",
			Color = { 255, 162, 105, 255 },
			LightingColor = {255, 146, 79, 255},
			LootColor = {255, 114, 30, 255},
			SubtitleColor = {0.800, 0.550, 0.050, 1.0},
			EventEndSound = "/SFX/ApolloBoonLoveChimes",
			UpgradeSelectedSound = "/SFX/ApolloBoonChoice",
			LootRejectionAnimation = "BoonDissipateA_Apollo",
	
			RequiredMinCompletedRuns = 1,
			RequiredTextLines = { "ArtemisFirstPickUp" },
	
			TraitsList = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait" },
	
			PriorityUpgrades = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ShieldLoadAmmo_ApolloRangedTrait" },
			WeaponUpgrades = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ShieldLoadAmmo_ApolloRangedTrait", "ApolloShoutTrait" },
			Traits = {"ApolloRetaliateTrait", "FountainDefenseTrait", "FountainCoinTrait"}, 
			Consumables = { "RerollObolDrop", "RerollBoonDrop" },
	
			LinkedUpgrades =
			{
				ApolloBlindedTrait  = {
					OneOf = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ShieldLoadAmmo_ApolloRangedTrait", "ApolloRetaliateTrait"},
				},
				ApolloHealTrait  = {
					OneOf = { "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ShieldLoadAmmo_ApolloRangedTrait", "ApolloRetaliateTrait"},
				},
				MissChanceTrait =
				{
					OneFromEachSet =
					{
						{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ShieldLoadAmmo_ApolloRangedTrait" },
						{ "ApolloBlindedTrait", "ApolloRetaliateTrait", "RerollObolTrait", "RerollBoonTrait" }
					}
				},
				-- Duo
				FamedDuetTrait = 
				{
					OneFromEachSet =
					{
						{ "ApolloShoutTrait" },
						{ "ArtemisWeaponTrait", "ArtemisSecondaryTrait", "ArtemisRushTrait", "ArtemisRangedTrait" }
					}
				},
				WarSongTrait = 
				{
					OneFromEachSet =
					{
						{ "ApolloRangedTrait", "ShieldLoadAmmo_ApolloRangedTrait", "MasterLobDionysusTrait"},
						{ "AresWeaponTrait", "AresSecondaryTrait", "AresRetaliateTrait"}
					}
				},
				HyacinthTrait = 
				{
					OneFromEachSet =
					{
						{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ShieldLoadAmmo_ApolloRangedTrait"},
						{ "AphroditeWeaponTrait", "AphroditeSecondaryTrait", "AphroditeRushTrait", "AphroditeRangedTrait"}
					}
				},
				SeaChanteyTrait = 
				{
					OneFromEachSet =
					{
						{ "FountainDefenseTrait", "FountainCoinTrait", "RerollObolTrait", "RerollBoonTrait", "ApolloHealTrait"},
						{ "PoseidonWeaponTrait", "PoseidonSecondaryTrait", "PoseidonRushTrait", "PoseidonRangedTrait" }
					}
				},
				MasterBoltTrait = 
				{
					OneFromEachSet = 
					{
						{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait" },
						{ "ZeusWeaponTrait", "ZeusSecondaryTrait", "ZeusRushTrait", "ZeusRangedTrait", "PerfectDashBoltTrait"},
					}
				},
				BlindDurationTrait = 
				{
					OneFromEachSet =
					{
						{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ShieldLoadAmmo_ApolloRangedTrait"},
						{ "DemeterWeaponTrait", "DemeterSecondaryTrait", "DemeterRushTrait" }
					}
				},
				DamageReduceDistanceTrait = 
				{
					OneFromEachSet =
					{
						{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait"},
						{ "AthenaWeaponTrait", "AthenaRangedTrait", "AthenaSecondaryTrait", "AthenaRushTrait" }
					}
				},
				MasterLobDionysusTrait = 
				{
					OneFromEachSet =
					{
						{ "DionysusRangedTrait"},
						{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait" }
					}
				},
				MasterLobApolloTrait = 
				{
					OneFromEachSet =
					{
						{ "ApolloRangedTrait"},
						{ "DionysusWeaponTrait", "DionysusSecondaryTrait", "DionysusRushTrait" }
					}
				},
			},
	
			Speaker = "NPC_Apollo_01",
			Portrait = "Portrait_Apollo_Default_01",
			WrathPortrait = "Portrait_Apollo_Wrath_01",
			OverlayAnim = "ApolloOverlay",
			Gender = "Male",
			SpawnSound = "/SFX/GoldCoinRewardDrop",
			FlavorTextIds =
			{
				"ApolloUpgrade_FlavorText01",
				"ApolloUpgrade_FlavorText02",
				"ApolloUpgrade_FlavorText03",
			},
	
			OnSpawnVoiceLines =
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PlayOnceThisRun = true,
				PreLineWait = 0.85,
				ChanceToPlay = 0.33,
				RequiredTextLines = { "ApolloFirstPickUp" },
				RequiredFalseEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", "Shop" },
	
				-- Lord Apollo...
				{ Cue = "/VO/ZagreusField_4816" },
				-- You found me, Apollo...
				{ Cue = "/VO/ZagreusField_4817" },
			},
	
			UpgradeMenuOpenVoiceLines =
			{
				[1] = GlobalVoiceLines.CheckOlympianReunionVoiceLines,
				[2] = GlobalVoiceLines.FoundRareBoonVoiceLines,
			},
	
			DuoPickupTextLineSets =
			{
				ApolloWithZeus01 =
				{
					Name = "ApolloWithZeus01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "MasterBoltTrait",
					{ Cue = "/VO/Apollo_0041",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "Seeing you struggle with your father made me realise something, Zagzag. Fathers and sons work much better together. My father and I put together something that might help you." },
					{ Cue = "/VO/Zeus_0250",
						PortraitExitWait = 0.35,
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
						StartSound = "/SFX/ZeusBoonThunder",
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Zeus_01", Portrait = "Portrait_Zeus_Default_01",
						Text = "That's right, Nephew! I feel generous and I know you feel grateful. Let's show him our power, young son." },
				},
				ApolloWithPoseidon01 =
				{
					Name = "ApolloWithPoseidon01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "SeaChanteyTrait",
					{ Cue = "/VO/Apollo_0042",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "This is far from the first time Uncle Poseidon and I have composed together. We decided to create a little Sea Chantey to keep your spirit up. This is for you!" },
					{ Cue = "/VO/Poseidon_0250",
						PortraitExitWait = 0.35,
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
						StartSound = "/SFX/PoseidonBoonWaveCrash",
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Poseidon_01", Portrait = "Portrait_Poseidon_Default_01",
						Text = "That's right, Little Hades! With our help, I don't think it's possible for you to fail." },
				},
				ApolloWithAthena01 =
				{
					Name = "ApolloWithAthena01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "DamageReduceDistanceTrait",
					{ Cue = "/VO/Apollo_0182",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "Athena, maybe the three of us could start a band! I believe you used to play the flute. We could create a divine musical trio!" },
					{ Cue = "/VO/Athena_0240",
						PortraitExitWait = 0.35,
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
						StartSound = "/SFX/AthenaBoonHolyShield",
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Athena_01", Portrait = "Portrait_Athena_Default_01",
						Text = "I have much responsibility, Step-Brother! I don't have time to ... start a band... Let's help our Cousin instead." },
				},
				ApolloWithAres01 =
				{
					Name = "ApolloWithAres01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "WarSongTrait",
					{ Cue = "/VO/Apollo_0044",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "Well, if it isn't my dear Brother! You know what I was thinking? You should write a song or maybe a poem. It would free your mind from all this needless violence." },
					{ Cue = "/VO/Ares_0240",
						PortraitExitWait = 0.35,
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
						StartSound = "/SFX/AresWrathBattle",
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Ares_01", Portrait = "Portrait_Ares_Default_01",
						Text = "The only form of art I recognize is war. {#DialogueItalicFormat} Hm {#PreviousFormat} ... I have never seen anybody killing with words. Zagreus, take this instead." },
				},
				ApolloWithAphrodite01 =
				{
					Name = "ApolloWithAphrodite01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "HyacinthTrait",
					RequiredTextLines = { "ApolloGift01", "AphroditeGift01" },
					{ Cue = "/VO/Apollo_0045",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "Aphrodite and I decided to combine our efforts in order to help you escape that realm of yours, Zagzag." },
					{ Cue = "/VO/Aphrodite_0230",
						PortraitExitWait = 0.35,
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Aphrodite_01", Portrait = "Portrait_Aphrodite_Default_01",
						Text = "And... This is for you, little godling! Oh my me! I can't wait until we are all here together!"
					},
				},
				ApolloWithArtemis01 =
				{
					Name = "ApolloWithArtemis01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "FamedDuetTrait",
					RequiredTextLines = { "ApolloGift01", "ArtemisGift01" },
					{ Cue = "/VO/Apollo_0046",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "I've brought my sister with me this time, Zagzag! Our combine symphony will shake the underworld to its core. Go team Zagzag!" },
					{ Cue = "/VO/Artemis_0250",
						PortraitExitWait = 0.35,
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
						StartSound = "/SFX/ArtemisBoonArrow",
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Artemis_01", Portrait = "Portrait_Artemis_Default_01",
						Text = "Are you seriously calling him that? I am sorry Zagreus. I hope this can make him a little more to bearable..."
					},
				},
				ApolloWithDionysus01 =
				{
					Name = "ApolloWithDionysus01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "MasterLobApolloTrait",
					{ Cue = "/VO/Apollo_0047",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "{#DialogueItalicFormat} Whoa {#PreviousFormat}, this wine is exquisite, Brother! It goes excellently with the cheese. To taste them both is like a glorious symphony!" },
					{ Cue = "/VO/Dionysus_0230",
						PortraitExitWait = 0.35,
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
						StartSound = "/SFX/DionysusBoonWineLaugh",
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Dionysus_01", Portrait = "Portrait_Dionysus_Default_01",
						Text = "{#DialogueItalicFormat} Haha {#PreviousFormat}, that's the trick, the combination of two great things together makes it all better. Like us. Let's combine our blessing to help, um, how do you call him again, Zagzag?" },
				},
				ApolloWithDemeter01 =
				{
					Name = "ApolloWithDemeter01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					HasTraitNameInRoom = "BlindDurationTrait",
					{ Cue = "/VO/Apollo_0048",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort",
						Text = "You know, Aunty. For someone that's so cold, you might want to chill out sometime." },
					{ Cue = "/VO/Demeter_0370",
						PortraitExitWait = 0.35,
						StartSound = "/SFX/DemeterBoonFrost",
						EndSound = "/Leftovers/World Sounds/MapZoomInShort",
						Speaker = "NPC_Demeter_01", Portrait = "Portrait_Demeter_Default_01",
						Text = "How dare you! That's no way to talk to your elders! I order you to help Zagreus and stop calling him nicknames." },
				},
			},
	
			SuperPriorityPickupTextLineSets =
			{
				ApolloAboutZagzag01 =
				{
					Name = "ApolloAboutZagzag01",
					PlayOnce = true,
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0161",
						PortraitExitWait = 1.25,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Hey, Zagzag. You don't mind me calling you Zagzag, right? Because if you do, you'd better come tell me face to face." },
				},
				ApolloAboutOlympianReunionQuest01 =
				{
					Name = "ApolloAboutOlympianReunionQuest01",
					PlayOnce = true,
					RequiredTextLines = { "ApolloFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
					{ Cue = "/VO/ZagreusField_4818", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 2.33 },
						PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero", PostLineFunctionName = "BoonInteractPresentation",
						Text = "OK, I think I'm ready. In the name of Hades! Olympus, this is an official message! And I hope it finds you well, Lord Apollo!" },
					{ Cue = "/VO/Apollo_0058",
						PortraitExitWait = 1.25,
						PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
						UseEventEndSound = true,
						Emote = "PortraitEmoteDepressed",
						Text = "{#DialogueItalicFormat} Whoa {#PreviousFormat}! Is that a party invitation? Oh wait, it's part of an invitation for me and my relatives, hm? Oh well, I am flattered, but I don't think I can make it, I'll give my relatives my half of the information and ask Artemis how it went. Maybe some other time Zagzag." },
				},
				ApolloPostEpilogue01 =
				{
					Name = "ApolloPostEpilogue01",
					PlayOnce = true,
					RequiredTextLines = { "ApolloFirstPickUp", "OlympianReunionQuestComplete" },
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Apollo_0057",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Sorry I missed the big party in your father's domain, Zagzag. Dionysus told me it was quite exquisite. I wish I was able to be there, but maybe you could try visiting us sometime instead?" },
				},
			},
	
			PriorityPickupTextLineSets =
			{
				-- about other gods
				ApolloAboutZeus01 =
				{
					Name = "ApolloAboutZeus01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloFirstPickUp" },
					RequiredAnyTextLines = { "OrpheusFirstMeeting", "OrpheusFirstMeeting_Alt" },
					RequiredFalseTextLines = { "OlympianReunionQuestComplete", "ApolloWithZeus01", "ZeusWithApollo01" },
					RequiredGodLoot = "ZeusUpgrade",
					{ Cue = "/VO/Apollo_0059",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I heard Orpheus plays music for your court. I take care of all the music playing here in Olympus. My father can be strict, but a good jam has always put him in a good mood. Fathers can be tense... I am sure you understand what I mean..." },
				},
				ApolloAboutStepSiblings01 =
				{
					Name = "ApolloAboutStepSiblings01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloFirstPickUp" },
					RequiredGodLoot = "ArtemisUpgrade",
					{ Cue = "/VO/Apollo_0060",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know, Zagzag. I don't think I can ever imagine living a life without all my step-siblings. Ares, Aphrodite, Dionysus. I mean they are all great, but Zeus loves them a bit more than me... At least, I have Artemis. Don't tell her I said that." },
				},
				ApolloAboutDaughters01 =
				{
					Name = "ApolloAboutDaughters01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp", "OrpheusMusicProgress01" },
					{ Cue = "/VO/Apollo_0061",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Hey Zagzag, I believe you still haven't found your second half, am I right? Maybe, you could be a great match for one of my daughters." },
				},
				ApolloAboutDaughters02 =
				{
					Name = "ApolloAboutDaughters02",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloAboutDaughters01" },
					{ Cue = "/VO/Apollo_0062",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Of my three daughters, Apollonis is kind of emotional... Once, she burned down our house, because her meal wasn't hot enough... Oh! Another time, she cried for a week because her hair brush broke... Well, if you are looking to spice up your life, she's an excellent catch!" },
				},
				ApolloAboutDaughters03 =
				{
					Name = "ApolloAboutDaughters03",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloAboutDaughters01" },
					{ Cue = "/VO/Apollo_0063",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "The most shy of my daughters is certainly Cephisso. She's extremely quiet. She could be next to me and I wouldn't even hear what she said. Good for settling down with a more quiet lifestyle, I suppose." },
				},
				ApolloAboutDaughters04 =
				{
					Name = "ApolloAboutDaughters04",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloAboutDaughters01" },
					{ Cue = "/VO/Apollo_0064",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Borysthenis is the strongest of my daughters, she can move mountains! Just be careful with her hugs. She cracked my back a century ago and I still feel sore from it. But hey, if that's not showing love, what is?" },
				},
				ApolloAboutDaughters05 =
				{
					Name = "ApolloAboutDaughters05",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					EndCue = "/VO/ZagreusHome_3760",
					RequiredTextLines = { "ApolloAboutDaughters02", "ApolloAboutDaughters03", "ApolloAboutDaughters04" },
					{ Cue = "/VO/Apollo_0065",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Well, I have talked to my daughters, and they are not really looking for a... long distant relationship. And since I don't see you going anywhere anytime soon, I think they'll end this here." },
				},
				ApolloAboutHydra =
				{
					Name = "ApolloAboutHydra",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredBiome = "Asphodel",
					RequiredAnyRoomsLastRun = { "B_Boss01", "B_Boss02" },
					RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloGift01", "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0165",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "The bone hydra has a snake's head, right? {#DialogueItalicFormat} Urgh {#PreviousFormat}. I hate snakes, especially pythons. They are the worst. Still, I have quite a bit of experience getting the upper hand on them. This should help." },
				},
				ApolloAboutDaphne01 =
				{
					Name = "ApolloAboutDaphne01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0162",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Were you staring at my laurel crown, Zagzag? It's beautiful, is it not? Made by my beloved Daphne. I miss her everyday." },
				},
				ApolloAboutPan01 =
				{
					Name = "ApolloAboutPan01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloGift01", "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0163",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "As you know, Zagzag, I am the god of music, but once the Nymph Pan tried to get my title, he stood no chance against my excellent taste in music. I still remember his face. Ha-ha-ha. Priceless." },
				},
				ApolloAboutArtemis01 =
				{
					Name = "ApolloAboutArtemis01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloAboutStepSiblings01", "ApolloFirstPickUp" },
					RequiredGodLoot = "ArtemisUpgrade",
					{ Cue = "/VO/Apollo_0066",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "My sister is a bit antisocial at times. I tried to help her out of her shell, but even I can't do anything. Maybe you can help her out." },
				},
				ApolloAboutArtemis02 =
				{
					Name = "ApolloAboutArtemis02",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloAboutArtemis01" },
					RequiredGodLoot = "ArtemisUpgrade",
					{ Cue = "/VO/Apollo_0067",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Artemis is older than me by a few seconds, but she loves to make me feel like I am the youngest. I mean it was only a few seconds... That doesn't count, right?" },
				},
				ApolloAboutArtemis03 =
				{
					Name = "ApolloAboutArtemis03",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloAboutArtemis02" },
					RequiredGodLoot = "ArtemisUpgrade",
					{ Cue = "/VO/Apollo_0068",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I wonder if I could beat Artemis in an archery competition... We are both pretty good... Tell me, Zagzag... You would bet on me, right?" },
				},
				ApolloAboutMusic01 =
				{
					Name = "ApolloAboutMusic01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "OrpheusWithEurydice01", "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0069",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "As the god of music, I know better than most of my relatives that cooperation is key. I always try to add my special spice to the mix, but I know art is always better as a collective effort. I hope our cooperation will help you escape." },
				},
				ApolloAboutHarpQuest01 =
				{
					Name = "ApolloAboutHarpQuest01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "OrpheusMusicProgress02", "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0070",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Are you learning some form of music, Zagzag? I sense hours of practice over the tips of your fingers. Someday, you might want to quit, but you must persist like you are now! It will be all worth in the end. Trust me." },
				},
				ApolloAboutHarpQuest02 =
				{
					Name = "ApolloAboutHarpQuest02",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "OrpheusMusicProgress04", "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0071",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I heard that you are a musician now, Zagzag? Ooh! Maybe Pan and Orpheus would like to join us, and we can make a band! What do you say? Oh wait, you're still there, and I am still here... hmm. We'll workshop." },
				},
				ApolloAboutOrpheus01 =
				{
					Name = "ApolloAboutOrpheus01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "OrpheusTallTale03", "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0072",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Did you meet my old friend Orpheus down there? We used to play together all the time, but he went to pick up a girl and never came back. It's a shame too, he was pretty good." },
				},
				ApolloAboutOrpheus02 =
				{
					Name = "ApolloAboutOrpheus02",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloAboutOrpheus01", "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0073",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know. I don't like to brag, Zagzag, but I did give Orpheus his golden lyre. He probably still has it! A perfect instrument for a near-perfect musician. Okay, I might like to brag a little bit." },
				},
				ApolloAboutLeto01 =
				{
					Name = "ApolloAboutLeto01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "ApolloGift01", "PersephoneMeeting02", "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0084",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I may be Zeus's son, Zagzag, but Hera is not my mother. My mother's name is Leto. She taught Artemis and I everything we know. Uh. Sometimes I wish she was here in Olympus with us, but that just can't happen. Hera kind of hates her." },
				},
				ApolloAboutLeto02 =
				{
					Name = "ApolloAboutLeto02",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloAboutLeto01", "ApolloFirstPickUp" },
					RequiredMinRunsCleared = 2,
					{ Cue = "/VO/Apollo_0085",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Leto gave birth to my sister and I on an island. I believe, Delos was the name. She was fleeing a Python, but not to worry, I defeated the mighty beast and now she's free to go anywhere she pleases... Well, except for Olympus..." },
				},
				ApolloAboutArtemisLeto01 =
				{
					Name = "ApolloAboutArtemisLeto01",
					PlayOnce = true,
					RequiredFalseTextLinesThisRun = GameData.GodAboutGodVoiceLines,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloAboutLeto01", "ApolloAboutLeto02", "ApolloFirstPickUp" },
					RequiredGodLoot = "ArtemisUpgrade",
					RequiredMinRunsCleared = 2,
					{ Cue = "/VO/Apollo_0086",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "My sister doesn't speak much about our mother, Leto. Though, I guess that's just how she is. She's not a very vocal character when it isn't about hunting something... Though I'm sure you have noticed that by now." },
				},
				ApolloPostGiftPickup01 =
				{
					Name = "ApolloPostGiftPickup01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloGift02", },
					{ Cue = "/VO/Apollo_0087",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I don't know why, but you are in my mind a lot lately. I just have this feeling that I must meet you somehow... This here should help make it happen." },
				},
				ApolloPostGiftPickup02 =
				{
					Name = "ApolloPostGiftPickup02",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloGift03", },
					{ Cue = "/VO/Apollo_0088",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I feel our kinship getting stronger on every encounter. I hope you feel the same, Zagzag." },
				},
	
				ApolloPostGiftPickup03 =
				{
					Name = "ApolloPostGiftPickup03",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloGift04", },
					{ Cue = "/VO/Apollo_0089",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I can see you are really trying to escape this time, Zagzag. And you know what? This could be the one. All you have to do is escape once, and it would be over. And you can finally be with us. I believe in you, Zagzag." },
				},
				ApolloAboutKeepsake01 =
				{
					Name = "ApolloAboutKeepsake01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTrait = "ForceApolloBoonTrait",	
					{ Cue = "/VO/Apollo_0080",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Emote = "PortraitEmoteMusical",
						Text = "I am flattered that you brought my Harmonious Harp with you. I knew we shared a special bond, Zagzag." },
				},
				ApolloRunCleared01 =
				{
					Name = "ApolloRunCleared01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp", "ApolloAboutPersephoneMeeting01" },
					RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
					RequiredMinRunsCleared = 2,
					RequiresLastRunCleared = true,					
					{ Cue = "/VO/Apollo_0079",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "What are you doing there, Zagzag? I saw in a vision that you escaped. Why did you go back? Maybe you forgot something? Oh well, I also saw that you would do it again. So, no worries." },
				},
				ApolloBackstory01 =
				{
					Name = "ApolloBackstory01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ZeusFirstPickUp", "ArtemisFirstPickUp", "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0090",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Being the son of Uncle Hades must not be an easy task. I know the feeling. Zeus isn't exactly easy either. When Artemis told me about your existence, I just knew I had to meet you." },
				},
				ApolloBackstory02 =
				{
					Name = "ApolloBackstory02",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloBackstory01" },
					{ Cue = "/VO/Apollo_0091",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I'm sorry I didn't reach out sooner, Zagzag. I tried to, but it seemed the fates were intending on keeping us apart. I wonder what changed." },
				},
				ApolloBackstory03 =
				{
					Name = "ApolloBackstory03",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "PersephoneMeeting02", "ApolloBackstory02" },
					RequiredFalseTextLines = { "PersephoneReturnsHome01", "ApolloBackstory03b" },
					{ Cue = "/VO/Apollo_0092",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I try not to eavesdrop, but I heard that Hades once had a Queen. I assumed it was Nyx, but I had a vision lately and...  Oh, I won't give away to much of the fun. You'll see what I mean." },
				},
				ApolloBackstory03b =
				{
					Name = "ApolloBackstory03",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "PersephoneMeeting02", "ApolloBackstory02","PersephoneReturnsHome01" },
					RequiredFalseTextLines = { "ApolloBackstory03" },
					{ Cue = "/VO/Apollo_0166",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I was really rooting for you and your mother to reunite, Zagzag. Hopefully you won't ever be separated again." },
				},
				ApolloBackstory04 =
				{
					Name = "ApolloBackstory04",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloBackstory03", "ApolloAboutLeto01" },
					RequiredFalseTextLines = { "PersephoneReturnsHome01", "ApolloBackstory04b" },
					{ Cue = "/VO/Apollo_0093",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I have to tell you the truth, Zagzag. I know about your secret... Don't worry! I understand. I did what I had to do to protect my own mother and I sense you would do the same. We're very alike, aren't we?" },
				},
				ApolloBackstory04b =
				{
					Name = "ApolloBackstory04",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloBackstory03", "ApolloAboutLeto01", "PersephoneReturnsHome01" },
					RequiredFalseTextLines = { "ApolloBackstory04" },
					{ Cue = "/VO/Apollo_0167",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I have to tell you the truth, Zagzag. I knew about your secret for a long time... I just didn't want to spoil the surprise for everyone else. Always on quest to find our mothers. We're very alike, aren't we?" },
				},
				ApolloBackstory05 =
				{
					Name = "ApolloBackstory05",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloBackstory04", "PersephoneMeeting04" },
					RequiredFalseTextLines = { "PersephoneReturnsHome01" },
					{ Cue = "/VO/Apollo_0094",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I hope you find your mother once you have escaped. Be rid of that place and until your father is ready to change never return. May the fates be ever in your favor, Cousin." },
				},
				ApolloRunProgress01 =
				{
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					RequiredMinRunsCleared = 4,
					{ Cue = "/VO/Apollo_0074",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I had a vision of you with someone from the surface. She was somehow related to... Demeter? I guess my vision isn't what it used to be, Zagzag." },
				},
				ApolloRunProgress02 =
				{
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0075",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "{#DialogueItalicFormat}Okay, {#PreviousFormat}I saw you escape at least once. Seriously! I'm not lying! If you got out of the Underworld, you would tell me, right?" },
				},
				ApolloRunProgress03 =
				{
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					RequiredRoomLastRun = "C_Intro",
					RequiredFalseRoomLastRun = "D_Intro",
					RequiredMinRunsCleared = 2,
					{ Cue = "/VO/Apollo_0076",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Trust me, Zagzag. Going through Elysium is no walk in the park. I've written songs and stories about their heroes and all of their legends. Maybe just try being nice to them, some of them have ego issues after all that glory went to their heads." },
				},
				ApolloRunProgress04 =
				{
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					RequiredAnyRoomsLastRun = { "D_Intro" },
					RequiresLastRunCleared = false,
					{ Cue = "/VO/Apollo_0077",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You almost had a glimpse of light, I heard. I believe you can go further this time. And this here might be exactly what you needed." },
				},
				ApolloRunProgress05 =
				{
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredRoom = "D_Hub",
					{ Cue = "/VO/Apollo_0078",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Facing a three-headed dogs, eh Zagzag. Well, I'll offer you a bit of informational poetry. {#DialogueItalicFormat} Um-um {#PreviousFormat}. “The trick with any beast is ter know how to calms 'em. Jus” play “im a bit o” music an' he'll go straight ter sleep—'" },
				},
				ApolloLowHealth01 =
				{
					Name = "ApolloLowHealth01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					RequiredMaxHealthFraction = 0.20,
					RequiredMaxLastStands = 1,
	
					{ Cue = "/VO/Apollo_0082",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Emote = "PortraitEmoteSurprise",
						Text = "{#DialogueItalicFormat} Oh {#PreviousFormat}, that must hurt. Like really, really hurt. I don't think it will make the difference this time, but this is better than nothing." },
				},
				ApolloLowHealth02 =
				{
					Name = "ApolloLowHealth02",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					RequiredMaxHealthFraction = 0.15,
					RequiredMaxLastStands = 1,
	
					{ Cue = "/VO/Apollo_0083",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I see my healing power would be very useful to you right now. You are just a bit too far away for me to use it. I can manage to give you this instead thought." },
				},
				ApolloLegendaryPickUp01 =
				{
					Name = "ApolloLegendaryPickUp01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					ValuableUpgradeInRoom = {
						AllAtLeastRarity = "Rare",
						HasAtLeastRarity = "Epic",
					},
					{ Cue = "/VO/Apollo_0081",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I gathered all my divine power to give you this blessing, Zagzag. Don't let it go to waste. {#DialogueItalicFormat} Yawn {#PreviousFormat}, I get to take a small nap. You got this." },
				},
			},
	
			PickupTextLineSets =
			{
				ApolloFirstPickUp =
				{
					Name = "ApolloFirstPickUp",
					PlayOnce = true,
					RequiredTextLines = { "AthenaFirstPickUp", "ArtemisFirstPickUp", },
					{ Cue = "/VO/ZagreusField_4800", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineThreadedFunctionName = "PowerWordPresentation", PreLineThreadedFunctionArgs = { WaitTime = 4.23 },
						PostLineAnim = "ZagreusInteractEquip", PostLineAnimTarget = "Hero", PostLineFunctionName = "BoonInteractPresentation",
						Text = "This presence... It feels like Artemis, but something is different... In the name of Hades! Olympus! I accept this message." },
					{ Cue = "/VO/Apollo_0001",
						PortraitExitWait = 1.25,
						PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
						UseEventEndSound = true,
						Text = "I come all this way to help you out and the first thing you do is confuse me with my sister? Not the best first impression, Cousin." },
				},
				ApolloMiscPickup01 =
				{
					Name = "ApolloMiscPickup01",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0002",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Dangers and vile creatures are hiding where you are. This blessing will keep them away." },
				},
				ApolloMiscPickup02 =
				{
					Name = "ApolloMiscPickup02",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0003",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Take my blessing, Cousin. It will light up your way to Olympus." },
				},
				ApolloMiscPickup03 =
				{
					Name = "ApolloMiscPickup03",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
					RequiredMaxHealthFraction = 0.75,
					{ Cue = "/VO/Apollo_0004",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Are you still down there, Zagzag? Maybe this blessing is what's been missing to get you out!" },
				},
				ApolloMiscPickup04 =
				{
					Name = "ApolloMiscPickup04",
					Priority = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0005",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Only those who are pure of heart can handle the light from my blessings. I knew you were one of us!" },
				},
				ApolloMiscPickup05 =
				{
					Name = "ApolloMiscPickup05",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0006",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "A real musician knows when to persevere. And you, Zagzag, have a real musician heart." },
				},
				ApolloMiscPickup06 =
				{
					Name = "ApolloMiscPickup06",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0007",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Tag! You're it. Now you have to come to me. Just the rules of the game, Zagzag. Maybe this will help you catch up." },
				},
				ApolloMiscPickup07 =
				{
					Name = "ApolloMiscPickup07",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0008",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "By the fates! You are still going at it, Zagzag. I see you are well determined to come meet us then. Wish you all the best!" },
				},
				ApolloMiscPickup08 =
				{
					Name = "ApolloMiscPickup08",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0009",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Let me play something for you, it might guide your way to us." },
				},
				ApolloMiscPickup09 =
				{
					Name = "ApolloMiscPickup09",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0010",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "There you are, Zagzag. Are you hiding from me? I just wanted to give you this." },
				},
				ApolloMiscPickup10 =
				{
					Name = "ApolloMiscPickup10",
					Priority = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
					{ Cue = "/VO/Apollo_0011",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Let me light your path. It's the least I can do for a guy like you." },
				},
				ApolloMiscPickup11 =
				{
					Name = "ApolloMiscPickup11",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0012",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "{#DialogueItalicFormat}Hey, look here, Zagzag,\nMade a haiku just for you,\nGood luck escaping.{#PreviousFormat}" },
				},
				ApolloMiscPickup12 =
				{
					Name = "ApolloMiscPickup12",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0013",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Trying to escape again, Zagzag? I believe the fates are set on keeping you down there. But then again, I've been wrong before. Against all odds, I believe in you, Cousin." },
				},
				ApolloMiscPickup13 =
				{
					Name = "ApolloMiscPickup13",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0014",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know, Zagzag? Your perseverance inspires me! I mean, I'm writing songs like crazy up here. You have escape if you wanna hear them though!" },
				},
				ApolloMiscPickup14 =
				{
					Name = "ApolloMiscPickup14",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					MinRunsSinceAnyTextLines = { TextLines = { "ApolloPostEpilogue01" }, Count = 3 },				
					{ Cue = "/VO/Apollo_0015",
						PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
						Emote = "PortraitEmoteMusical",	
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Da-Da-Dum... Da-Da-Dum... Oh. Hello there. Sorry I was working on a song. I can probably finish it by the time you arrive. In the meantime, take this." },
				},
				ApolloMiscPickup15 =
				{
					Name = "ApolloMiscPickup15",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp", "ApolloGift01" },
					{ Cue = "/VO/Apollo_0016",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Zagzag, did you know every sound can be transformed into music? Melody, rhythm, percussions. Maybe you can use that information to help you escape." },
				},
				ApolloMiscPickup16 =
				{
					Name = "ApolloMiscPickup16",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0017",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Sometimes adversity is what you need to face in order to become successful. All the best, Zagzag." },
				},
				ApolloMiscPickup17 =
				{
					Name = "ApolloMiscPickup17",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					{ Cue = "/VO/Apollo_0018",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I keep giving you my finest blessings but I'm not seeing any results, Zagzag. Luckily for you, I'm willing to wait as long as you need." },
				},
				ApolloMiscPickup18 =
				{
					Name = "ApolloMiscPickup18",
					Priority = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
					{ Cue = "/VO/Apollo_0019",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I heard that you've never seen sunlight before! If you ever get out, take a moment to check it out, you'll see all the beautiful things the world has to offer up here." },
				},
				ApolloMiscPickup19 =
				{
					Name = "ApolloMiscPickup19",
					Priority = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = { "ApolloFirstPickUp" },
					RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
					{ Cue = "/VO/Apollo_0020",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Is your father keeping you in his realm, Zagzag. Sometimes fathers are strict, but we must show them we are our own gods. You and I are very alike, Zagzag. The difference between us is I usually succeed in what I start. You should probably give that a try sometime." },
				},
	
				-- shorter acknowledgments
				ApolloMiscPickup20 =
				{
					Name = "ApolloMiscPickup20",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0021",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I knew you would come, Zagzag. I prepared this just for the occasion." },
				},
				ApolloMiscPickup21 =
				{
					Name = "ApolloMiscPickup21",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0022",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I can see you've got the music in you, Cousin. It's just a matter of using it the right way." },
				},
				ApolloMiscPickup22 =
				{
					Name = "ApolloMiscPickup22",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0023",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "With this blessing, Zagzag. The light shall burn your enemies." },
				},
				ApolloMiscPickup23 =
				{
					Name = "ApolloMiscPickup23",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0024",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Like I always say. Where words failed, music thrives." },
				},
				ApolloMiscPickup24 =
				{
					Name = "ApolloMiscPickup24",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0025",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Music brings people together, Zagzag. Just like how this blessing will help bring you to us!" },
				},
				ApolloMiscPickup25 =
				{
					Name = "ApolloMiscPickup25",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0026",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Music is an escape for many mortals, and it'll be your escape too! ...From your father's realm, I mean." },
				},
				ApolloMiscPickup26 =
				{
					Name = "ApolloMiscPickup26",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0027",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Mortals come and go like the wind, but music has always been there for me." },
				},
				ApolloMiscPickup27 =
				{
					Name = "ApolloMiscPickup27",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0028",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "This blessing will light your way to us. Just get here quickly before it fades." },
				},
				ApolloMiscPickup28 =
				{
					Name = "ApolloMiscPickup28",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0029",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You might not be able to see the sun from down there, but you have my light right here." },
				},
				ApolloMiscPickup29 =
				{
					Name = "ApolloMiscPickup29",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0030",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "As you work to create light for others, you naturally light your own way. Keep going, Cousin." },
				},
	
				ApolloMiscPickup30 =
				{
					Name = "ApolloMiscPickup30",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0031",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Hope is being able to always see the light despite the darkness." },
				},
				ApolloMiscPickup31 =
				{
					Name = "ApolloMiscPickup31",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0032",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "History is but the unrolled scroll of prophecy. Your fate is yours to write, Zagzag." },
				},
				ApolloMiscPickup32 =
				{
					Name = "ApolloMiscPickup32",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0033",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I don't make mistakes. I make prophecies which immediately turn out to be wrong." },
				},
				ApolloMiscPickup33 =
				{
					Name = "ApolloMiscPickup33",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0034",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I sense your heart is pure. This blessing should be handy then. Good luck." },
				},
				ApolloMiscPickup34 =
				{
					Name = "ApolloMiscPickup34",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0035",
						PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
						Emote = "PortraitEmoteMusical",	
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I am your sunshine~~\nYour only sunshine~~\nI give you blessings~~\nwhen skies are gray~~" },
				},
				ApolloMiscPickup35 =
				{
					Name = "ApolloMiscPickup35",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0036",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Another ray of sunshine coming your way!" },
				},
				ApolloMiscPickup36 =
				{
					Name = "ApolloMiscPickup36",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0037",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You've always got a friend in me, Zagzag. One day, we'll find each other." },
				},
				ApolloMiscPickup37 =
				{
					Name = "ApolloMiscPickup37",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0038",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "When it comes down to it, it's quite simple, Zagzag. Just beat it. No one wants to be defeated!" },
				},
				ApolloMiscPickup38 =
				{
					Name = "ApolloMiscPickup38",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0039",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I have given you all I can. You'll have to do the rest on your own." },
				},
				ApolloMiscPickup39 =
				{
					Name = "ApolloMiscPickup39",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					RequiredTextLines = GameData.ApolloBasicPickUpTextLines,
					{ Cue = "/VO/Apollo_0040",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You seem to be under a lot of pressure down there. I guess it really does split a family in two." },
				},
			},
	
			BoughtTextLines =
			{
				ApolloLootBought01 =
				{
					Name = "ApolloLootBought01",
					PlayOnce = true,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
	
					{ Cue = "/VO/Apollo_0095",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Stopping by Charon's shop, I see. This deal might be your best chance of escaping." },
				},
				ApolloLootBought02 =
				{
					Name = "ApolloLootBought02",
					PlayOnce = true,
					ChanceToPlay = 0.33,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
	
					{ Cue = "/VO/Apollo_0096",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know, I saw a vision of a sale coming soon. I'd say you got ripped off, but I know Charon doesn't do well with haggling." },
				},
				ApolloLootBought03 =
				{
					Name = "ApolloLootBought03",
					PlayOnce = true,
					ChanceToPlay = 0.33,
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
	
					{ Cue = "/VO/Apollo_0097",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You didn't have to pay for my blessing, Zagzag. I would have helped you if you would just asked." },
				},
			},
	
			RejectionTextLines =
			{
				ApolloRejection01 =
				{
					Name = "ApolloRejection01",
					{ Cue = "/VO/Apollo_0098",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Did you just choose somebody else over me, Cousin? I guess you've decided to stay down there." },
				},
				ApolloRejection02 =
				{
					Name = "ApolloRejection02",
					{ Cue = "/VO/Apollo_0099",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know I can see what's going to happen, right? Let me just say you won't like what comes next." },
				},
				ApolloRejection03 =
				{
					Name = "ApolloRejection03",
					{ Cue = "/VO/Apollo_0100",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Man. The moment I thought we could jam together. Let's just hope this doesn't mark the end of our duet." },
				},
				ApolloRejection04 =
				{
					Name = "ApolloRejection04",
					{ Cue = "/VO/Apollo_0101",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Are you blind, Cousin? I hope you meant to choose me. Because, if not, what I am going to do is very justified." },
				},
				ApolloRejection05 =
				{
					Name = "ApolloRejection05",
					{ Cue = "/VO/Apollo_0102",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Are you serious, Cousin? Is it because I called you Zagzag? Because you just gave me a reason to keep using the nickname." },
				},
				ApolloRejection06 =
				{
					Name = "ApolloRejection06",
					{ Cue = "/VO/Apollo_0103",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Here I am, trying to help guide you out of your father's realm and this is the gratitude I get in return. Allow me to show you something else then." },
				},
				ApolloRejection07 =
				{
					Name = "ApolloRejection07",
					{ Cue = "/VO/Apollo_0104",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "No way. Even I couldn't see that one coming. But you know what, I don't think you'll see what's coming for you either." },
				},
				ApolloRejection08 =
				{
					Name = "ApolloRejection08",
					{ Cue = "/VO/Apollo_0105",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I don't think this was your first mistake, Cousin. But it might be your last." },
				},
				ApolloRejection09 =
				{
					Name = "ApolloRejection09",
					{ Cue = "/VO/Apollo_0106",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Let me sing you a song, Cousin. It's called “Zagreus dies once more”. It's very catchy." },
				},
				ApolloRejection10 =
				{
					Name = "ApolloRejection10",
					{ Cue = "/VO/Apollo_0107",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I can't believe you've done this, Cousin. I though we were friends." },
				},
				ApolloRejection11 =
				{
					Name = "ApolloRejection11",
					{ Cue = "/VO/Apollo_0108",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know what, I accept your decision. As long as you accept the decision I'm about to make." },
				},
				ApolloRejection12 =
				{
					Name = "ApolloRejection12",
					{ Cue = "/VO/Apollo_0109",
						PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Seems like you have death wish. Wait, that's an excellent name for a band! Here, deal with these guys while I go write that down." },
				},
			},
	
			RejectionVoiceLines =
			{
				{
					RandomRemaining = true,
					BreakIfPlayed = true,
					PreLineWait = 1.3,
					RequiredEncounters = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", },
					SuccessiveChanceToPlay = 0.33,
					UsePlayerSource = true,
	
					-- Sorry, Apollo.
					{ Cue = "/VO/ZagreusField_4801" },
					-- Nothing personal, Lord Apollo.
					{ Cue = "/VO/ZagreusField_4802" },
					-- Forgive me, Apollo.
					{ Cue = "/VO/ZagreusField_4803" },
					-- Apologies, Lord Apollo.
					{ Cue = "/VO/ZagreusField_4804" },
				},
				[2] = GlobalVoiceLines.GodRejectedVoiceLines,
			},
	
			MakeUpTextLines =
			{
				ApolloMakeUp01 =
				{
					Name = "ApolloMakeUp01",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Apollo_0110",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I sense you've come back to the light, Zagzag. Sorry, I just had to make sure." },
				},
				ApolloMakeUp02 =
				{
					Name = "ApolloMakeUp02",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Apollo_0111",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I knew this moment would come. Don't worry, Zagzag. No hard feeling." },
				},
				ApolloMakeUp03 =
				{
					Name = "ApolloMakeUp03",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Apollo_0112",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Why are we fighting again, Zagzag? You know what I forgive you. Just don't do it again." },
				},
				ApolloMakeUp04 =
				{
					Name = "ApolloMakeUp04",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Apollo_0113",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Everybody stops! I've got a song in my head and I need to go write it down. We are done here." },
				},
				ApolloMakeUp05 =
				{
					Name = "ApolloMakeUp05",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Apollo_0114",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Wait a second... You didn't die. Oh, I think that might actually happen later. Um, yea. My bad. Carry on." },
				},
				ApolloMakeUp06 =
				{
					Name = "ApolloMakeUp06",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Apollo_0115",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know respect is like a duet, Zagzag. I am willing to play my part, if you play yours." },
				},
				ApolloMakeUp07 =
				{
					Name = "ApolloMakeUp07",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Apollo_0116",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Friendship is all about its lows and its highs. That was our low,  so how about a high?" },
				},
				ApolloMakeUp08 =
				{
					Name = "ApolloMakeUp08",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Apollo_0117",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "You know what? Music is all about experimentation, and I'm sure that's what you were doing. I forgive you." },
				},
				ApolloMakeUp09 =
				{
					Name = "ApolloMakeUp09",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Apollo_0118",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "{#DialogueItalicFormat} Hahaha {#PreviousFormat}, you almost had me there for a second, Zagzag! Now, let's get back to the matter at hand." },
				},
				ApolloMakeUp10 =
				{
					Name = "ApolloMakeUp10",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Apollo_0119",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I don't want to brag, but if our fight was in my domain, you'd be pretty sorry right now." },
				},
				ApolloMakeUp11 =
				{
					Name = "ApolloMakeUp11",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Apollo_0120",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Alright, I know when something has gone on long enough. You win this round, Zagzag, and your prize is right here!" },
				},
				ApolloMakeUp12 =
				{
					Name = "ApolloMakeUp12",
					PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
					{ Cue = "/VO/Apollo_0121",
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Let's put the past in the past. The show must go on, Zagzag." },
				},
			},
	
			GiftTextLineSets =
			{
				-- gives gift in exchange
				ApolloGift01 =
				{
					Name = "ApolloGift01",
					PlayOnce = true,
					{ Cue = "/VO/ZagreusHome_3761", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
						PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
						PostLineFunctionName = "BoonInteractPresentation",
						Text = "Lord Apollo, you've shown me the way. Please accept this offering." },
					{ Cue = "/VO/Apollo_0122",
						PortraitExitWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I'd be lying if I said I didn't see that one coming. That's why I prepared this gift back. Now, we're even." },
				},
				ApolloGift02 =
				{
					Name = "ApolloGift02",
					PlayOnce = true,
					RequiredTextLines = { "ApolloGift01" },
					{ Cue = "/VO/ZagreusHome_3762", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
						PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
						PostLineFunctionName = "BoonInteractPresentation",
						Text = "Lord Apollo, your light is very welcome in this darker part of the world. I must thank you for this." },
					{ Cue = "/VO/Apollo_0123",
						PortraitExitWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "It must be hard to find such good Nectar where you are. I truly appreciate the gesture. Any future gift is completely unnecessary." },
				},
				ApolloGift03 =
				{
					Name = "ApolloGift03",
					PlayOnce = true,
					RequiredTextLines = { "ApolloGift02" },
					{ Cue = "/VO/ZagreusHome_3763", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
						PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
						PostLineFunctionName = "BoonInteractPresentation",
						Text = "I know you said to stop this, Lord Apollo. This is just a little something for all your help." },
					{ Cue = "/VO/Apollo_0124",
						PortraitExitWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Yet another gift? You know what is an even better gift you could give me, Zagzag? Coming to visit us sometime soon." },
				},
				ApolloGift04 =
				{
					Name = "ApolloGift04",
					PlayOnce = true,
					RequiredTextLines = { "ApolloGift03" },
					{ Cue = "/VO/ZagreusHome_3764", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
						PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
						PostLineFunctionName = "BoonInteractPresentation",
						Text = "I couldn't escape like you wanted, but this here could help you wait until I succeed. Thank you, Lord Apollo." },
					{ Cue = "/VO/Apollo_0125",
						PortraitExitWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "Well, until we meet, this could do the trick. But seriously, think a little more about yourself and... Just focus on escaping." },
				},
				ApolloGift05 =
				{
					Name = "ApolloGift05",
					PlayOnce = true,
					RequiredTextLines = { "ApolloGift04" },
					{ Cue = "/VO/ZagreusHome_3765", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
						PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
						PostLineFunctionName = "BoonInteractPresentation",
						Text = "Your blessings have made me grasp life more, and I wanted to show my appreciation towards you, Lord Apollo. It's all I can give you for now." },
					{ Cue = "/VO/Apollo_0126",
						PortraitExitWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "How do you have so many of these? Isn't Nectar rare in your realm? I mean I saw it coming. Just wow." },
				},
				ApolloGift06 =
				{
					Name = "ApolloGift06",
					PlayOnce = true,
					RequiredTextLines = { "ApolloGift05" },
					{ Cue = "/VO/ZagreusHome_3766", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
						PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
						PostLineFunctionName = "BoonInteractPresentation",
						Text = "As a gesture of appreciation, this gift is for you, Lord Apollo. I hope you accept this humble offering." },
					{ Cue = "/VO/Apollo_0127",
						PortraitExitWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						Text = "I will take this, but no more Nectar, Zagzag. I mean it. Just escape. You have your place here. And everybody is rooting for you." },
				},
				ApolloGift07 =
				{
					Name = "ApolloGift07",
					PlayOnce = true,
					RequiredTextLines = { "ApolloGift06" },
					{ Cue = "/VO/ZagreusHome_3767", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
						PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
						PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
						PostLineFunctionName = "BoonInteractPresentation",
						Text = "I know you said no more Nectar, Lord Apollo. But I must show you what you mean to me. Here's something you probably already have up there... But it's important for me you have this." },
					{ Cue = "/VO/Apollo_0128",
						PortraitExitWait = 1.0,
						StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
						PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
						PostLineFunctionArgs = { Text = "NPC_Apollo_01", Icon = "Keepsake_ApolloSticker_Max" },
						Text = "Is that Ambrosia? How did you find this? I don't know what to say besides thank you, my friend. I just hope we can see each other soon. So, I may share it with you. For now, thought, have this. And take care of yourself." },
				},
			},
	
			GiftGivenVoiceLines =
			{
				BreakIfPlayed = true,
				PreLineWait = 1.0,
				PlayFromTarget = true,
	
				-- This is too much, Lord Apollo.
				{ Cue = "/VO/ZagreusField_4812" },
			},
	
			ShoutActivationSound = "/SFX/LyreGood", -- "VO/ApolloWrathLight"
			ShoutVoiceLines =
			{
				Queue = "Interrupt",
				{
					BreakIfPlayed = true,
					RandomRemaining = true,
					RequiredKillEnemiesFound = true,
					RequiredFalseSpurnedGodName = "ApolloUpgrade",
	
					-- Put your fate in the light!
					{ Cue = "/VO/Apollo_0129" },
					-- Do, Re, Mi! Your end I see!
					{ Cue = "/VO/Apollo_0130" },
					-- La, Si, Do! Your pain will grow!
					{ Cue = "/VO/Apollo_0164" },
					-- You're in Treble now!
					{ Cue = "/VO/Apollo_0131" },
					-- Back for another round?
					{ Cue = "/VO/Apollo_0132" },
					-- Better keep up with the rhythm!
					{ Cue = "/VO/Apollo_0133" },
					-- Didn't I hear someone ask for an encore?
					{ Cue = "/VO/Apollo_0134", RequiredMinKillEnemies = 2 },
					-- I'll never get tired of this sound.
					{ Cue = "/VO/Apollo_0135", RequiredMinKillEnemies = 2 },
				},
				{
					BreakIfPlayed = true,
					PlayFromTarget = true,
					RandomRemaining = true,
					RequiredKillEnemiesFound = true,
					RequiredSpurnedGodName = "ApolloUpgrade",
					RequireCurrentEncounterNotComplete = true,
	
					-- Is it because I called you Zagzag?
					{ Cue = "/VO/Apollo_0136" },
					-- You have chosen... Poorly!
					{ Cue = "/VO/Apollo_0137" },
					-- Let's go then! Double Time!
					{ Cue = "/VO/Apollo_0138" },
					-- You were the chosen one!
					{ Cue = "/VO/Apollo_0139" },
					-- You were my cousin, Zagzag. I loved you.
					{ Cue = "/VO/Apollo_0140" },
				},
			},
	
			SwapUpgradePickedVoiceLines =
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.05,
				SuccessiveChanceToPlay = 0.33,
				CooldownName = "SaidApolloRecently",
				CooldownTime = 40,
				RequiresLastUpgradeSwapped = true,
				UsePlayerSource = true,
	
				-- Great trade, Lord Apollo.
				{ Cue = "/VO/ZagreusField_4813" },
				-- Lord Apollo, show me the path.
				{ Cue = "/VO/ZagreusField_4814" },
				-- Lord Apollo, I agree with the terms.
				{ Cue = "/VO/ZagreusField_4815" },
			},
	
			DeathTauntVoiceLines =
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 1.25,
				NoTarget = true,
	
				-- This is what happens to those who succumb to the darkness.
				{ Cue = "/VO/Apollo_0141" },
				-- Hear that? Silence shall be your only music.
				{ Cue = "/VO/Apollo_0142" },
				-- I already knew this choice would be your last.
				{ Cue = "/VO/Apollo_0143" },
			},
	
			BlindBoxOpenedVoiceLines =
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.3,
				Source = { SubtitleColor = Color.ApolloVoice },
				TriggerCooldowns = { "ZagreusBoonTakenSpeech" },
	
				-- You want to start a band?
				{ Cue = "/VO/Apollo_0144" },
				-- You've got this!
				{ Cue = "/VO/Apollo_0145" },
				-- This is my divine blessing.
				{ Cue = "/VO/Apollo_0146" },
				-- My light will guide you!
				{ Cue = "/VO/Apollo_0147" },
				-- Get ready to jam.
				{ Cue = "/VO/Apollo_0148" },
			},
	}
	-- Duo PickupLines	
	OlympusLootData.ZeusUpgrade.DuoPickupTextLineSets.ZeusWithApollo01 = {
		Name = "ZeusWithApollo01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "MasterBoltTrait",
		{ Cue = "/VO/Zeus_0251",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Is that the bow I gave to Artemis and you, young Son! {#DialogueItalicFormat} Haha {#PreviousFormat}, it's been awhile since I saw this old recurve." },
		{ Cue = "/VO/Apollo_0049",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Apollo_01", Portrait = "Portrait_Apollo_Default_01",
			Text = "Of course, I never leave without it, Father. Perhaps we could give the young prince here something just as valuable. I am sure he can make it worth the effort." },
	}
	OlympusLootData.PoseidonUpgrade.DuoPickupTextLineSets.PoseidonWithApollo01 = {
		Name = "PoseidonWithApollo01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "SeaChanteyTrait",
		{ Cue = "/VO/Poseidon_0251",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Hey ho, isn't it another one of my Nephew! Let's sing a sailor's song." },
		{ Cue = "/VO/Apollo_0050",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Apollo_01", Portrait = "Portrait_Apollo_Default_01",
			Text = "As much as I would love that, Uncle, I am sure Zagzag here would appreciate something more... tangible? Let's keep the singing for when he arrives on Olympus." },
	}
	OlympusLootData.AthenaUpgrade.DuoPickupTextLineSets.AthenaWithApollo01 = {
		Name = "AthenaWithApollo01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "DamageReduceDistanceTrait",
		{ Cue = "/VO/Athena_0241",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "I see. You are helping Zagreus as well, Step-brother. For someone who claims to be faster than Hermes, you took your sweet time." },
		{ Cue = "/VO/Apollo_0051",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Apollo_01", Portrait = "Portrait_Apollo_Default_01",
			Text = "You know what, step-sister, just because I appreciate the finer things in life doesn't mean I want to help him any less than you do. And help him we shall!" },
	}
	OlympusLootData.AresUpgrade.DuoPickupTextLineSets.AresWithApollo01 = {
		Name = "AresWithApollo01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "WarSongTrait",
		{ Cue = "/VO/Ares_0241",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "My kin, I wish to help you once more, but in order to not fail this time, Apollo here will help me with his foresight. There's no failing this time." },
		{ Cue = "/VO/Apollo_0052",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Apollo_01", Portrait = "Portrait_Apollo_Default_01",
			Text = "Um, Brother... I really don't think my Foresight is an instrument to be used. How about we try working together instead?  {#DialogueItalicFormat} Urgh, {#PreviousFormat}  do you see what I put up with to try to help you, Zagzag? You owe me one." },
	}
	OlympusLootData.AphroditeUpgrade.DuoPickupTextLineSets.AphroditeWithApollo01 = {
		Name = "AphroditeWithApollo01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "HyacinthTrait",
		{ Cue = "/VO/Aphrodite_0231",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Well, lovely as ever, Apollo. From all my relatives, you are by far the only one to understand beauty and perfection." },
		{ Cue = "/VO/Apollo_0053",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Apollo_01", Portrait = "Portrait_Apollo_Default_01",
			Text = "{#DialogueItalicFormat}Ah{#PreviousFormat}! Well thank you, Aphrodite. You are not too bad yourself. Let's help Zagzag here step up to our league." },
	}
	OlympusLootData.ArtemisUpgrade.DuoPickupTextLineSets.ArtemisWithApollo01 = {
		Name = "ArtemisWithApollo01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "FamedDuetTrait",
		{ Cue = "/VO/Artemis_0251",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Apollo! How many times did I ask you not to include me in any forms of get together! {#DialogueItalicFormat} Arrg {#PreviousFormat}! I'll make an exception, only because it's Zagreus, but it's the last time." },
		{ Cue = "/VO/Apollo_0054",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Apollo_01", Portrait = "Portrait_Apollo_Default_01",
			Text = "Oh, is my sister going soft? Is she ready to have a social life? I think I found her weak spot, Zagzag. Let me thank you with this!" },
	}
	OlympusLootData.DionysusUpgrade.DuoPickupTextLineSets.DionysusWithApollo01 = {
		Name = "DionysusWithApollo01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "MasterLobDionysusTrait",
		{ Cue = "/VO/Dionysus_0231",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Hey Zag, Apollo helped me prepare this awesome welcome party for you. We hope you can get here in time." },
		{ Cue = "/VO/Apollo_0055",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Apollo_01", Portrait = "Portrait_Apollo_Default_01",
			Text = "Bad news, Brother. My foresight tells me he won't make it here in time. Here, we can try sharing a bit of the party with him through a blessing. How does that sound, Zagzag?" },
	}
	OlympusLootData.DemeterUpgrade.DuoPickupTextLineSets.DemeterWithApollo01 = {
		Name = "DemeterWithApollo01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "BlindDurationTrait",
		{ Cue = "/VO/Demeter_0371",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text = "Since Apollo is here, I figured we must help you, young Zagreus. Even if Apollo's flare is a bit much for me." },
		{ Cue = "/VO/Apollo_0056",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 0.5,
			StartSound = "/SFX/LyreMedium",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Apollo_01", Portrait = "Portrait_Apollo_Default_01",
			Text = "My flare makes me who I am, Aunty! {#DialogueItalicFormat}Pff{#PreviousFormat} But she's right, Zagzag, we'll do what it takes to help you." },
	}
	-- Duo LootData	
	OlympusLootData.ArtemisUpgrade.LinkedUpgrades.FamedDuetTrait = 
	{
		OneFromEachSet =
		{
			{ "ApolloShoutTrait" },
			{ "ArtemisWeaponTrait", "ArtemisSecondaryTrait", "ArtemisRushTrait", "ArtemisRangedTrait" }
		}
	}
	OlympusLootData.AresUpgrade.LinkedUpgrades.WarSongTrait = 
	{
		OneFromEachSet =
		{
			{ "ApolloRangedTrait", "ShieldLoadAmmo_ApolloRangedTrait", "MasterLobDionysusTrait"},
			{ "AresWeaponTrait", "AresSecondaryTrait", "AresRetaliateTrait"}
		}
	}
	OlympusLootData.ZeusUpgrade.LinkedUpgrades.MasterBoltTrait = 
	{
		OneFromEachSet = 
		{
			{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait" },
			{ "ZeusWeaponTrait", "ZeusSecondaryTrait", "ZeusRushTrait", "ZeusRangedTrait", "PerfectDashBoltTrait"},
		}
	}
	OlympusLootData.AphroditeUpgrade.LinkedUpgrades.HyacinthTrait = 
	{
		OneFromEachSet =
		{
			{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ShieldLoadAmmo_ApolloRangedTrait"},
			{ "AphroditeWeaponTrait", "AphroditeSecondaryTrait", "AphroditeRushTrait", "AphroditeRangedTrait"}
		}
	}
	OlympusLootData.DemeterUpgrade.LinkedUpgrades.BlindDurationTrait = 
	{
		OneFromEachSet =
		{
			{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait", "ApolloRangedTrait", "ShieldLoadAmmo_ApolloRangedTrait" },
			{ "DemeterWeaponTrait", "DemeterSecondaryTrait", "DemeterRushTrait" }
		}
	}	
	OlympusLootData.AthenaUpgrade.LinkedUpgrades.DamageReduceDistanceTrait = 
	{
		OneFromEachSet =
		{
			{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait"},
			{ "AthenaWeaponTrait", "AthenaRangedTrait", "AthenaSecondaryTrait", "AthenaRushTrait" }
		}
	}
	OlympusLootData.PoseidonUpgrade.LinkedUpgrades.SeaChanteyTrait = 
	{
		OneFromEachSet =
		{
			{ "FountainDefenseTrait", "FountainCoinTrait", "RerollObolTrait", "RerollBoonTrait", "ApolloHealTrait"},
			{ "PoseidonWeaponTrait", "PoseidonSecondaryTrait", "PoseidonRushTrait", "PoseidonRangedTrait" }
		}
	}
	OlympusLootData.DionysusUpgrade.LinkedUpgrades.MasterLobDionysusTrait = 
	{
		OneFromEachSet =
		{
			{ "DionysusRangedTrait"},
			{ "ApolloWeaponTrait", "ApolloSecondaryTrait", "ApolloDashTrait" }
		}
	}
	OlympusLootData.DionysusUpgrade.LinkedUpgrades.MasterLobApolloTrait = 
	{
		OneFromEachSet =
		{
			{ "ApolloRangedTrait"},
			{ "DionysusWeaponTrait", "DionysusSecondaryTrait", "DionysusRushTrait" }
		}
	}
	
	-- For DionysusRangedTrait when duo is activated.
	OlympusLootData.ZeusUpgrade.LinkedUpgrades.LightningCloudTrait = {
		OneFromEachSet =
		{
			{ "ZeusWeaponTrait", "ZeusSecondaryTrait", "ZeusRushTrait", "ZeusShoutTrait" },
			{ "DionysusRangedTrait", "MasterLobApolloTrait" },
		}
	}
	OlympusLootData.DionysusUpgrade.LinkedUpgrades.LightningCloudTrait = {
		OneFromEachSet =
		{
			{ "ZeusWeaponTrait", "ZeusSecondaryTrait", "ZeusRushTrait", "ZeusShoutTrait" },
			{ "DionysusRangedTrait", "MasterLobApolloTrait" },
		}
	}
	OlympusLootData.DemeterUpgrade.LinkedUpgrades.IceStrikeArrayTrait = {
		OneFromEachSet =
		{
			{ "DemeterWeaponTrait", "DemeterSecondaryTrait", "DemeterRushTrait", "DemeterShoutTrait" },
			{ "DionysusRangedTrait", "ShieldLoadAmmo_DionysusRangedTrait", "MasterLobApolloTrait" },
		}
	}
	OlympusLootData.DionysusUpgrade.LinkedUpgrades.IceStrikeArrayTrait = {
		OneFromEachSet =
		{
			{ "DemeterWeaponTrait", "DemeterSecondaryTrait", "DemeterRushTrait", "DemeterShoutTrait" },
			{ "DionysusRangedTrait", "ShieldLoadAmmo_DionysusRangedTrait", "MasterLobApolloTrait" },
		}
	}	
	table.insert(OlympusLootData.DionysusUpgrade.LinkedUpgrades.DionysusDefenseTrait.OneOf, "MasterLobApolloTrait")
	table.insert(OlympusLootData.DionysusUpgrade.LinkedUpgrades.DionysusComboVulnerability.OneFromEachSet[1], "MasterLobApolloTrait")
	
	

	
	-- Other gods modification
	-- AthenaUpgrade
	table.insert(OlympusLootData.AthenaUpgrade.PriorityPickupTextLineSets.AthenaVsOlympians01.RequiredTextLines, "ApolloFirstPickUp")
	
	-- HermesUpgrade
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredMinAnyTextLines.TextLines, "HermesExpectingApollo01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredFalseGodLoots, "ApolloUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian01.RequiredOneOfTraits, "ForceApolloBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredMinAnyTextLines.TextLines, "HermesExpectingApollo01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredFalseGodLoots, "ApolloUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian02.RequiredOneOfTraits, "ForceApolloBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredMinAnyTextLines.TextLines, "HermesExpectingApollo01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredFalseGodLoots, "ApolloUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian03.RequiredOneOfTraits, "ForceApolloBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredMinAnyTextLines.TextLines, "HermesExpectingApollo01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredFalseGodLoots, "ApolloUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian04.RequiredOneOfTraits, "ForceApolloBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredMinAnyTextLines.TextLines, "HermesExpectingApollo01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredFalseGodLoots, "ApolloUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian05.RequiredOneOfTraits, "ForceApolloBoonTrait")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredMinAnyTextLines.TextLines, "HermesExpectingApollo01")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredFalseGodLoots, "ApolloUpgrade")
	table.insert(OlympusLootData.HermesUpgrade.PriorityPickupTextLineSets.HermesExpectingMiscOlympian06.RequiredOneOfTraits, "ForceApolloBoonTrait")
	
	OlympusLootData.HermesUpgrade.SuperPriorityPickupTextLineSets.HermesExpectingApollo01 =
	{
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation", PreEventFunctionArgs = { PickupWait = 1.0, },
		MinRunsSinceSquelchedHermes = ConstantsData.SquelchedHermesRunCount,
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredFalseGodLoot = "ApolloUpgrade",
		RequiredTrait = "ForceApolloBoonTrait",
		EndVoiceLines = GlobalVoiceLines.RushedHermesVoiceLines,
	
		{ Cue = "/VO/Hermes_0240",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort", UseEventEndSound = true,
			Text = "Some say Apollo is faster than me. Well, here's your proof that I am the fastest among us, Boss!" },
	}
	
	-- Gift Section    
	local OlympusGiftOrdering = ModUtil.Entangled.ModData(GiftOrdering)
	local OlympusGiftData = ModUtil.Entangled.ModData(GiftData)
	table.insert(OlympusGiftOrdering, 20, "ForceApolloBoonTrait")
	
	OlympusGiftData.ApolloUpgrade =
	{
		InheritFrom = {"DefaultGiftData"},
		MaxedIcon = "Keepsake_Apollo_Max",
		MaxedSticker = "Keepsake_ApolloSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "ApolloGift07" }, },
		Value = 0,
		Maximum = 7,
		Locked = 7,
		[1] = { Gift = "ForceApolloBoonTrait" },
		[7] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { RequiredAnyTextLines = { "ApolloBackstory04", "ApolloBackstory04b" } }
	}
	-- FUNCTIONS
	
	-- Shout Functions
	function ApolloShout()
		--SetWeaponProperty({ WeaponName = "ApolloBeamAim", DestinationId = CurrentRun.Hero.ObjectId, Property = "Enabled", Value = true })
		FireWeaponFromUnit({ Weapon = "ApolloBeamWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, AutoEquip = true, ClearAllFireRequests = true })
	end
	function EndApolloBeam()
		EndRamWeapons({ Id = CurrentRun.Hero.ObjectId })
		if CurrentRun.Hero.SuperActive then
			FireWeaponFromUnit({ Weapon = "ShoutEndApollo", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, AutoEquip = true, ClearAllFireRequests = true })
		end
		ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "ApolloStun" })
		ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "ApolloSpeed" })
		ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "ApolloBubble" })
		ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "ApolloForce" })
		ExpireProjectiles({ Names = { "ApolloCastBeam" } })
		ToggleControl({ Names = { "Use", "Gift", "Reload", "Assist" }, Enabled = true })
		SetPlayerUnphasing("ApolloBeam")
		CurrentRun.Hero.SurgeActive = false
		--SetWeaponProperty({ WeaponName = "ApolloBeamAim", DestinationId = CurrentRun.Hero.ObjectId, Property = "Enabled", Value = false })
		SetThingProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "ImmuneToForce", Value = false })
		SetUnitProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "ImmuneToStun", Value = false })
	end

	OnWeaponFired{ "ApolloBeamWeapon",
		function(triggerArgs)
			ToggleControl({ Names = { "Use", "Gift", "Reload", "Assist" }, Enabled = false })
			SetPlayerPhasing("ApolloBeam")
			CurrentRun.Hero.SurgeActive = true
			SetThingProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "ImmuneToForce", Value = true })
			SetUnitProperty({ DestinationId = CurrentRun.Hero.ObjectId, Property = "ImmuneToStun", Value = true })
		end
	}
	ModUtil.Path.Wrap( "DamageEnemy", 
		function(baseFunc, victim, triggerArgs)
			local sourceWeaponData = triggerArgs.AttackerWeaponData
			if sourceWeaponData and sourceWeaponData.MultipleProjectileMultiplier and victim then
				if victim.TimeOfLastDamage and victim.TimeOfLastDamage[sourceWeaponData.Name] and _worldTime - victim.TimeOfLastDamage[sourceWeaponData.Name] < 0.05 then
					triggerArgs.DamageAmount = triggerArgs.DamageAmount * sourceWeaponData.MultipleProjectileMultiplier		
				else
					if not victim.TimeOfLastDamage then
						victim.TimeOfLastDamage = {}
					end
					victim.TimeOfLastDamage[sourceWeaponData.Name] = _worldTime	
				end
			end
			baseFunc(victim, triggerArgs)
		end
	)
	-- Blind Functions
	-- Bug: still need to remove Effects on Hit like ZagreusOnHitStun...
	ModUtil.Path.Wrap( "CheckOnHitPowers", 
		function(baseFunc, victim, attacker, args)
			local missRate = 0.4
			if HeroHasTrait("MissChanceTrait") then
				missRate = 0.65
			end
			--and CheckCooldown( "StunDisarm", 10.0 )  not HasEffect({Id = victim.ObjectId, EffectName = "StunDisarm" })
			missRate = 1.0
			-- Enemies misses
			if args and args.EffectName ~= "StyxPoison" and attacker and HasEffect({Id = attacker.ObjectId, EffectName = "ApolloBlind" }) and victim.ObjectId == CurrentRun.Hero.ObjectId and attacker.ObjectId ~= CurrentRun.Hero.ObjectId and RandomFloat(0,1) <= missRate then
				thread( InCombatText, CurrentRun.Hero.ObjectId, "Combat_Miss", 0.4, {SkipShadow = true} )
				PlaySound({ Name = "/SFX/Player Sounds/HermesWhooshDodgeSFX", Id = CurrentRun.Hero.ObjectId })
				PlaySound({ Name = "/VO/ZagreusEmotes/EmoteDodgingAlt", Id = CurrentRun.Hero.ObjectId, Delay = 0.2 })
				if not HeroHasTrait("BlindDurationTrait") then
					ClearEffect({ Id = attacker.ObjectId, Name = "ApolloBlind" })
					BlockEffect({ Id = attacker.ObjectId, Name = "ApolloBlind", Duration = 4.0 })
				end
				if not HeroHasTrait("BlindDurationTrait") and HeroHasTrait("MasterBoltTrait") then
					ClearEffect({ Id = attacker.ObjectId, Name = "BlindLightning" })
					BlockEffect({ Id = attacker.ObjectId, Name = "BlindLightning", Duration = 4.0 })
				end
				if not HeroHasTrait("BlindDurationTrait") and HeroHasTrait("MasterBoltTrait") then
					ClearEffect({ Id = attacker.ObjectId, Name = "BlindLightning" })
				end
				args.DamageAmount = nil
				args.AttackerWeaponData = nil		
				args.IsInvulnerable = true	
			-- Zagreus misses
			elseif attacker and HasEffect({Id = attacker.ObjectId, EffectName = "ZagreusApolloBlind" }) and attacker.ObjectId == CurrentRun.Hero.ObjectId then
				thread( InCombatText, CurrentRun.Hero.ObjectId, "Combat_Blinded", 1.0, {SkipShadow = true, Cooldown = 0.7} )
				args.DamageAmount = nil
				args.AttackerWeaponData = nil		
				--args.IsInvulnerable = true	
			else
				baseFunc(victim, attacker, args)
			end
		end
	)	
	function ApolloBlindApply(triggerArgs) 
		if HeroHasTrait("MasterBoltTrait") then
			ApplyEffectFromWeapon({ Id = CurrentRun.Hero.ObjectId, DestinationId = triggerArgs.TriggeredByTable.ObjectId, AutoEquip = true, WeaponName = "BlindLightningEffector", EffectName = "BlindLightning" })
		end
	end
	function ApolloBlindClear(triggerArgs)
		if HeroHasTrait("BlindDurationTrait") then
			BlockEffect({ Id = triggerArgs.TriggeredByTable.ObjectId, Name = "ApolloBlind", Duration = 4.0 })
			if HeroHasTrait("MasterBoltTrait") then
				BlockEffect({ Id = triggerArgs.TriggeredByTable.ObjectId, Name = "BlindLightning", Duration = 4.0 })
			end
		end
	end
	-- Prophecy and Sight	
	function AddRerollObol()
		AddRerolls( 1, "RerollTrait", { Thread = false, Delay = 0.5 } )		
		CurrentRun.RerollObolTracker = 0
	end
	ModUtil.Path.Wrap( "AddMoney", 
		function(baseFunc, amount, source)
			baseFunc(amount, source)	
			if amount == nil or round( amount ) <= 0 then
				return
			end
			local times = 0
			if HeroHasTrait("RerollObolTrait") then
				local count = GetTotalHeroTraitValue("ObolCount")
				CurrentRun.RerollObolTracker = CurrentRun.RerollObolTracker + amount
				times = math.floor(CurrentRun.RerollObolTracker/count);
				if(times > 0) then
					CurrentRun.RerollObolTracker = CurrentRun.RerollObolTracker - (times * count)
				end
			end
			if(times > 0) then
				AddRerolls( times, "RerollTrait", { Thread = false, Delay = 0.5 } )			
			end
		end
	)
	function AddRerollBoon()
		AddRerolls( 1, "RerollTrait", { Thread = false, Delay = 0.5 } )		
		CurrentRun.RerollBoonTracker = 0
	end
	ModUtil.Path.Wrap( "HandleLootPickup", 
		function(baseFunc, currentRun, loot)	
			local times = 0
			if not (loot.Name == "StackUpgrade") and not (loot.Name == "WeaponUpgrade") and HeroHasTrait("RerollBoonTrait") then				
				CurrentRun.RerollBoonTracker = CurrentRun.RerollBoonTracker + 1
				local count = GetTotalHeroTraitValue("BoonCount")
				times = math.floor(CurrentRun.RerollBoonTracker/count);
				if(times > 0) then
					CurrentRun.RerollBoonTracker = CurrentRun.RerollBoonTracker - (times * count)
				end
			end
			baseFunc(currentRun, loot)	
			if(times > 0) then
				AddRerolls( times, "RerollTrait", { Thread = false, Delay = 0.5 } )			
			end
		end
	)
	-- Fountain Coin/Defense Functions
	function FountainDefensePresentation()
		PlaySound({ Name = "/SFX/Player Sounds/DionysusBlightWineDash", Id = CurrentRun.Hero.ObjectId })
		thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "FountainDefenseText_Alt", Duration = 1, LuaKey = "TempTextData", LuaValue = { TraitName = "FountainDefenseTrait", Amount = (1 - GetTotalHeroTraitValue("FountainDefenseBonus", {IsMultiplier = true})) * 100 } })
	end
	
	function ApolloMoney(args)
		local amount = round(GetTotalHeroTraitValue("FountainCoinBonus"))
		local moneyMultiplier = GetTotalHeroTraitValue( "MoneyMultiplier", { IsMultiplier = true } )
		amount = round( amount * moneyMultiplier )
		thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "FountainCoinText_Alt", Duration = 1, LuaKey = "TempTextData", LuaValue = { TraitName = "FountainCoinTrait", Amount = amount }})
		thread( GushMoney, { Amount = amount, LocationId = CurrentRun.Hero.ObjectId, Radius = 100, Source = args.triggeredById, } )
	end
	
	OnUsed{ "HealthFountain HealthFountainAsphodel HealthFountainElysium HealthFountainStyx",
		function( triggerArgs )
			wait(0.4)
			local hasDamageBonus = false
			local hasDefenseBonus = false
			local hasCoinBonus = false
			for k, traitData in pairs(CurrentRun.Hero.Traits) do
				if traitData.FountainDamageBonus then
					hasDamageBonus = true
				end 
				if traitData.FountainDefenseBonus then
					hasDefenseBonus = true
					traitData.AccumulatedFountainDefenseBonus = traitData.AccumulatedFountainDefenseBonus- (1-traitData.FountainDefenseBonus)
					ExtractValues( CurrentRun.Hero, traitData, traitData )
				end
				if traitData.FountainCoinBonus then
					-- For notes, check MoneyPerRoom and SisyphusMoney
					hasCoinBonus = true
				end 
			end
			wait(1.0)
			if hasDamageBonus then
				wait(1.0)
			end
			if hasDefenseBonus then
				FountainDefensePresentation()
				wait(1.0)
			end
			if hasCoinBonus then
				ApolloMoney(triggerArgs)
				wait(1.0)
			end
		end
	}
	-- Song of Healing functions
	ModUtil.Path.Wrap( "StartEncounter", 
		function(baseFunc, currentRun, currentRoom, currentEncounter )
			if HeroHasTrait("SeaChanteyTrait") and currentRun.CurrentRoom.Encounter.EncounterType == "Boss" then
				thread(SeaChanteyAnnouncement)
			end
			baseFunc(currentRun, currentRoom, currentEncounter)
		end
	)

	-- Sea Chantey functions
	ModUtil.Path.Wrap( "Kill", 
	function(baseFunc, victim, triggerArgs)
		if HeroHasTrait("ApolloHealTrait") and HasEffect({Id = victim.ObjectId, EffectName = "ApolloBlind" }) then
			victim.HealDropOnDeath = {
				Name = "HealDropMinor",
				Radius = 50,
				Chance = GetTotalHeroTraitValue("ApolloHealDropChance")
			}
		end
		baseFunc(victim, triggerArgs)
	end
	)

	function SpawnMusicNotes(args, attacker, victim)
		if victim.IsBoss then
			CreateAnimation({ DestinationId = victim.ObjectId, Name = "PoseidonMusicNotes" })
		end
	end

	function SeaChanteyAnnouncement()
		wait(1)
		--PlaySound({ Name = "/Leftovers/Menu Sounds/CoinLand", Id = CurrentRun.Hero.ObjectId })
		thread( InCombatTextArgs, { TargetId = CurrentRun.Hero.ObjectId, Text = "SeaChanteyText", Duration = 1})
	end

	-- Hyacinth Insta-kill function
	function CheckHyacinthKill( args, attacker, victim )
		if (not victim.IsBoss) and attacker == CurrentRun.Hero and HasEffect({Id = victim.ObjectId, EffectName = "ApolloBlind" }) and HasEffect({Id = victim.ObjectId, EffectName = "ApolloBlind" }) and not victim.IsDead and victim.Health / victim.MaxHealth <= args.HyacinthDeathThreshold and ( victim.Phases == nil or victim.CurrentPhase == victim.Phases ) then
			FireWeaponFromUnit({ Weapon = "ApolloChillKill", AutoEquip = true, Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true })
			PlaySound({ Name = "/SFX/DemeterEnemyFreezeShatter", Id = victim.ObjectId })
			
			--[[if victim.IsBoss then
				BossHyacinthKillPresentation( victim )
			end]]

			if victim.DeathAnimation ~= nil and not victim.ManualDeathAnimation then
				SetAnimation({ Name = victim.DeathAnimation, DestinationId = victim.ObjectId })
				-- @todo Notify on death animation finish
			end
			thread( Kill, victim, { ImpactAngle = 0, AttackerTable = CurrentRun.Hero, AttackerId = CurrentRun.Hero.ObjectId })
		end
	end
	
	-- Dionysus Duo Lobs
	local countToTwo = false;
	function SpawnAdditionalLob( triggerArgs, traitDataArgs )
		--local lastlocation = triggerArgs.LastHitTable
		if (triggerArgs.name == "ApolloLobProjectile" or triggerArgs.name == "DionysusLobProjectile") and (HeroHasTrait("MasterLobApolloTrait") or HeroHasTrait("MasterLobDionysusTrait")) then	
			if HeroHasTrait("ArtemisBonusProjectileTrait") then
				if countToTwo then
					countToTwo = false
					return
				else
					countToTwo = true
				end
			end
			if triggerArgs.name == "ApolloLobProjectile" then
				FireWeaponFromUnit({ Weapon = "DionysusLobWeaponAdditional", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, AutoEquip = true })
			elseif triggerArgs.name == "DionysusLobProjectile" then
				FireWeaponFromUnit({ Weapon = "ApolloLobWeaponAdditional", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, AutoEquip = true })
			end
		end
	end
	OnProjectileDeath{
		function( triggerArgs )
			local attacker = triggerArgs.AttackerTable
			if CurrentRun.Hero and attacker == CurrentRun.Hero then
				-- Remove clause after optimizations
				if HeroHasTrait("LightningCloudTrait") then
					for i, data in pairs(GetHeroTraitValues("AmmoDeathAdditionalWeapon")) do
						if triggerArgs.name == data.ValidProjectileName then
							FireAmmoDeathWeapon( data, triggerArgs.LocationX, triggerArgs.LocationY )
						end
					end
				end
			end
		end
	}

	-- Athena Duo
	OnProjectileReflect{
		function( triggerArgs )
			if HeroHasTrait("DamageReduceDistanceTrait") then
				FireWeaponFromUnit({ Weapon = "DistanceResistWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, AutoEquip = true })
			end
		end
	}
	function DistanceResistApply(triggerArgs)
		local victim = triggerArgs.TriggeredByTable
		if HeroHasTrait("DamageReduceDistanceTrait") and not triggerArgs.Reapplied then
			local threshold = GetTotalHeroTraitValue("DistanceResistThreshold")
			local multiplier = GetTotalHeroTraitValue("DistanceResistMultiplier")
			AddIncomingDamageModifier( victim,
			{
				Name = "DamageReduceDistance",
				DistanceThreshold = threshold,
				DistanceMultiplier = multiplier,
				Temporary = true,
			})
		end
	end
	function DistanceResistClear(triggerArgs)
		local unit = triggerArgs.TriggeredByTable
		if unit.IncomingDamageModifiers ~= nil then
			RemoveIncomingDamageModifier( unit, "DamageReduceDistance" )
		end
	end

	--[[function BossHyacinthKillPresentation(unit)
		AddSimSpeedChange( "HyacinthKill", { Fraction = 0.005, LerpTime = 0 } )
		local dropLocation = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = unit.ObjectId })
		AdjustColorGrading({ Name = "Frozen", Duration = 0.4 })
		CreateAnimation({ DestinationId = dropLocation, Name = "DemeterWinterHarvest" })
		thread( PlayVoiceLines, OlympusGlobalVoiceLines.DemeterFatalityVoiceLines, true )
		waitScreenTime( 0.86) -- 52 frames for DemeterWinterHarvest Scythe to appear before slicing
		CreateAnimation({ DestinationId = dropLocation, Name = "DemeterBossIceShatter" })
		waitScreenTime( 0.85)
		AdjustColorGrading({ Name = "Off", Duration = 0.4 })
		RemoveSimSpeedChange( "HyacinthKill", { LerpTime = 0.3 } )
		Destroy({ Id = dropLocation })
	end]]

	-- Changes to Maps
	local OlympusRoomSetData = ModUtil.Entangled.ModData(RoomSetData)
	table.insert(OlympusRoomSetData.Tartarus.RoomOpening.ForcedRewards, {
		Name = "Boon",
		LootName = "ApolloUpgrade",
		GameStateRequirements =
		{
			RequiredTextLines = {  "ZeusFirstPickUp", "ArtemisFirstPickUp" },
			RequiredOnlyNotPickedUp = "ApolloUpgrade",
			RequiredOnlyNotPickedUpIgnoreName = "DemeterUpgrade",
		}
	})
    OverwriteTableKeys( RoomData, RoomSetData.Tartarus )
	
	-- For testing purposes
	--[[ModUtil.Path.Wrap( "BeginOpeningCodex", 
		function(baseFunc)		
			if (not CanOpenCodex()) and IsSuperValid() then
				BuildSuperMeter(CurrentRun, 50)
			end
			--ModUtil.Hades.PrintStackChunks(ModUtil.ToString.Deep(GiftOrdering)) 
			baseFunc()
		end
	)]]
	--[[ModUtil.Path.Wrap("ModUtil.Hades.Triggers.OnHit.Combat.1.Call", function( base, triggerArgs ) 
		ModUtil.Hades.PrintStackChunks(ModUtil.ToString(ModUtil.Hades.Triggers)) 
		return base( triggerArgs ) 
	end )]]
	
	
	end