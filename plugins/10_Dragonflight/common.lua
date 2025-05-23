-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...
local L = ns.locale

local Class = ns.Class
local Group = ns.Group

local Collectible = ns.node.Collectible
local Node = ns.node.Node
local Rare = ns.node.Rare
local Vendor = ns.node.Vendor

local Achievement = ns.reward.Achievement
local Currency = ns.reward.Currency
local Item = ns.reward.Item
local Manuscript = ns.reward.Manuscript
local Mount = ns.reward.Mount
local Pet = ns.reward.Pet
local Recipe = ns.reward.Recipe
local Section = ns.reward.Section
local Spacer = ns.reward.Spacer
local Toy = ns.reward.Toy
local Transmog = ns.reward.Transmog

-------------------------------------------------------------------------------

ns.expansion = 10

-------------------------------------------------------------------------------
----------------------------------- GROUPS ------------------------------------
-------------------------------------------------------------------------------

ns.groups.CLAN_CHEST = Group('clan_chest', 'chest_bk', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.COMMUNITY_FEAST = Group('community_feast', 629056, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.DECAY_COVERED_CHEST = Group('decay_covered_chest', 'chest_pk', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.DISTURBED_DIRT = Group('disturbed_dirt', 1060570, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.DJARADIN_CACHE = Group('djaradin_cache', 'chest_pp', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.DRACTHYR_SUPPLY_CHEST = Group('dracthyr_supply_chest', 'chest_bl', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.DRAGON_GLYPH = Group('dragon_glyph', 4728198, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.DRAGONBANE_SIEGE = Group('dragonbane_siege', 3753264, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.DRUID_GLYPH = Group('druid_glyph', 625999, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION,
    class = 'DRUID'
})

ns.groups.ELEMENTAL_STORM = Group('elemental_storm', 538566, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.ELUSIVE_CREATURE = Group('elusive_creature', 644271, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION,
    IsEnabled = function(self)
        -- Only display group for skinning players
        if not ns.professions.SKINNING:HasProfession() then return false end
        return ns.Group.IsEnabled(self)
    end
})

ns.groups.FORBIDDEN_HOARD = Group('forbidden_hoard', 'chest_pp', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.FROSTBOUND_CHEST = Group('frostbound_chest', 'chest_rd', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.FROSTSTONE_VAULT_STORM = Group('froststone_vault_storm', 463562, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.GRAND_HUNTS = Group('grand_hunts', 237377, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.ICEMAW_STORAGE_CACHE = Group('icemaw_storage_cache', 'chest_nv', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.LIGHTNING_BOUND_CHEST = Group('lightning_bound_chest', 'chest_pp', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.MAGICBOUND_CHEST = Group('magicbound_chest', 'chest_tl', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.PROFESSION_RARES = Group('profession_rares', 'peg_rd', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.PROFESSION_TREASURES = Group('profession_treasures', 4620676, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.REED_CHEST = Group('reed_chest', 'chest_yw', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.RICH_SOIL = Group('rich_soil', 4554355, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION,
    IsEnabled = function(self)
        -- Only display group for herbalism players
        if not ns.professions.HERBALISM:HasProfession() then return false end
        return Group.IsEnabled(self)
    end
})

ns.groups.RITUAL_OFFERING = Group('ritual_offering', 'chest_bn', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.SCOUT_PACK = Group('scout_pack', 4562583, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.SECRETS_OF_AZEROTH = Group('secrets_of_azeroth', 'peg_gn', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.SIGNAL_TRANSMITTER = Group('signal_transmitter', 4548860, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION,
    IsEnabled = function(self)
        -- Only display group for engineering players
        if not ns.professions.ENGINEERING:HasProfession() then
            return false
        end
        return Group.IsEnabled(self)
    end
})

ns.groups.SIMMERING_CHEST = Group('simmering_chest', 'chest_gn', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.SOMNUT = Group('somnut', 656681, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.SMALL_TREASURES = Group('small_treasures', 'chest_rd', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.SMELLY_TRASH_PILE = Group('smelly_trash_pile', 'chest_gn', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.SMELLY_TREASURE_CHEST = Group('smelly_treasure_chest', 'chest_rd', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.TITAN_CHEST = Group('titan_chest', 'chest_rd', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.TUSKARR_CHEST = Group('tuskarr_chest', 'chest_bn', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.TUSKARR_TACKLEBOX = Group('tuskarr_tacklebox', 'chest_yw', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.WARCRAFT_RUMBLE = Group('warcraft_rumble', 5149946, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.ZONE_EVENT = Group('zone_event', 'peg_rd', {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.ZSKERA_VAULTS = Group('zskera_vaults', 4909720, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.EXPANSION
})

ns.groups.WAR_SUPPLY = Group('war_supplies', 'star_chest_g', {
    defaults = ns.GROUP_HIDDEN75,
    type = ns.group_types.EXPANSION
})

-------------------------------------------------------------------------------

ns.groups.ANCESTOR = Group('ancestor', 135946, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16423
})

ns.groups.ANCIENT_STONES = Group('ancient_stones', 134461, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 17561
})

ns.groups.BAKAR = Group('bakar', 930453, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16424
})

ns.groups.CHISELED_RECORD = Group('chiseled_record', 134455, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16412
})

ns.groups.DREAM_OF_SEEDS = Group('dream_of_seeds', 464030, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 19013
})

ns.groups.DREAMGUARD = Group('dreamguard', 341763, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16574
})

ns.groups.DREAMFRUIT = Group('dreamfruit', 5390643, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 19310
})

ns.groups.DUCKLINGS = Group('ducklings', 4048818, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16409
})

ns.groups.FLAG = Group('flag', 1723999, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 15890
})

ns.groups.FRAGMENT = Group('fragment', 134908, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16323
})

ns.groups.FRINGE_BENEFITS = Group('fringe_benefits', 4630470, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 19507
})

ns.groups.GRAND_THEFT_MAMMOTH = Group('grand_theft_mammoth', 4034836, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16493
})

ns.groups.RUBY_FEAST_GOURMAND = Group('ruby_feast_gourmand', 629060, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16556
})

ns.groups.HEMET_NESINGWARY_JR = Group('hemet_nesingwary_jr', 236444, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16542
})

ns.groups.KITE = Group('kite', 133837, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16584
})

ns.groups.LEGENDARY_ALBUM = Group('legendary_album', 1109168, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16570
})

ns.groups.LEYLINE = Group('leyline', 1033908, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16638
})

ns.groups.LIBRARY = Group('librarian_of_the_reach', 4549135, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 17530
})

ns.groups.MANY_BOXES = Group('many_boxes', 132762, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 18559
})

ns.groups.MOONKIN_HATCHLING = Group('moonkin_hatchling', 467894, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 19293
})

ns.groups.NEW_PERSPECTIVE = Group('new_perspective', 1109100, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16634
})

ns.groups.NOKHUD_DO_IT = Group('nokhud_do_it', 1103068, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16583
})

ns.groups.PRETTY_NEAT = Group('pretty_neat', 133707, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16446
})

ns.groups.SAFARI = Group('safari', 4048818, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16519
})

ns.groups.EMERALD_DREAM_SAFARI = Group('emerald_dream_safari', 4899641, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 19401
})

ns.groups.SCALECOMMANDER_ITEM = Group('scalecommander_item', 134422, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 17315
})

ns.groups.SCROLL_HUNTER = Group('scroll_hunter', 4549192, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 17532
})

ns.groups.SNACK_ATTACK = Group('snack_attack', 134062, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16410
})

ns.groups.SPECIALTIES = Group('specialties', 651585, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16621
})

ns.groups.SQUIRRELS = Group('squirrels', 237182, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16729
})

ns.groups.VEGETARIAN_DIET = Group('vegetarian_diet', 4635249, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16762
})

ns.groups.WHELP = Group('whelp', 4719556, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 18384
})

ns.groups.ZARALEK_SQUIRRELS = Group('zaralek_squirrels', 237182, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 18361
})

ns.groups.STORIES = Group('stories', 4549126, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 16406
})

ns.groups.CLUED_IN = Group('clued_in', 618973, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 19787
})

ns.groups.GOGGLE_WOBBLE = Group('goggle_wobble', 133023, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 19791
})

ns.groups.JUST_ONE_MORE_THING = Group('just_one_more_thing', 1411833, {
    defaults = ns.GROUP_HIDDEN,
    type = ns.group_types.ACHIEVEMENT,
    achievement = 19792
})

-------------------------------------------------------------------------------
--------------------------------- ELITE RARES ---------------------------------
-------------------------------------------------------------------------------

local RareElite = Class('RareElite', Rare, {
    rlabel = '(' .. ns.color.Gray(L['elite']) .. ')',
    sublabel = L['elite_loot_higher_ilvl']
})

ns.node.RareElite = RareElite

-------------------------------------------------------------------------------
----------------------------- PROFESSION TREASURES ----------------------------
-------------------------------------------------------------------------------

local ProfessionMaster = Class('ProfessionMaster', ns.node.NPC, {
    scale = 0.9,
    group = ns.groups.PROFESSION_TREASURES
})

function ProfessionMaster:IsEnabled()
    if not ns.PlayerHasProfession(self.skillID) then return false end
    return ns.node.NPC.IsEnabled(self)
end

local ProfessionTreasure = Class('ProfessionTreasure', ns.node.Item, {
    scale = 0.9,
    group = ns.groups.PROFESSION_TREASURES
})

function ProfessionTreasure:IsEnabled()
    if not ns.PlayerHasProfession(self.skillID) then return false end
    return ns.node.Item.IsEnabled(self)
end

ns.node.ProfessionMasters = {}
ns.node.ProfessionTreasures = {}

local PM = ns.node.ProfessionMasters
local PT = ns.node.ProfessionTreasures

for _, profession in pairs(ns.professions) do
    if profession.variantID ~= nil then
        local name = profession.name
        local icon = profession.icon
        local skillID = profession.skillID
        local variantID = profession.variantID[10]

        PM[name] = Class(name .. 'Master', ProfessionMaster, {
            icon = icon,
            skillID = skillID,
            requires = ns.requirement.Profession(skillID, variantID, 25)
        })

        PT[name] = Class(name .. 'Treasure', ProfessionTreasure, {
            icon = icon,
            skillID = skillID,
            requires = ns.requirement.Profession(skillID, variantID, 25)
        })
    end
end

-------------------------------------------------------------------------------
-------------------------------- DRAGON GLYPHS --------------------------------
-------------------------------------------------------------------------------

local Dragonglyph = Class('Dragonglyph', Collectible, {
    icon = 4728198,
    label = L['dragon_glyph'],
    group = ns.groups.DRAGON_GLYPH,
    requires = ns.requirement.Quest(68795) -- Dragonriding
})

ns.node.Dragonglyph = Dragonglyph

-------------------------------------------------------------------------------
---------------------------- DRAGON CUSTOMIZATIONS ----------------------------
-------------------------------------------------------------------------------

-- This is a collection of all the open-world dragon customizations that are
-- obtainable. Many of these are available from multiple sources, so this
-- gives us a single easy spot to keep their data and reference it elsewhere.

ns.DRAGON_CUSTOMIZATIONS = {
    RenewedProtoDrake = {
        Antlers = Manuscript({item = 202278, quest = 73058}),
        Armor = Manuscript({item = 197357, quest = 69558}),
        BeakedSnout = Manuscript({item = 197401, quest = 69602}),
        BlackAndRedArmor = Manuscript({item = 197348, quest = 69549}),
        BlackScales = Manuscript({item = 197392, quest = 69593}),
        BlueHair = Manuscript({item = 197368, quest = 69569}),
        BlueScales = Manuscript({item = 197390, quest = 69591}),
        BovineHorns = Manuscript({item = 197377, quest = 69578}),
        BrewfestArmor = Manuscript({item = 208742, quest = 77774}),
        BronzeAndPinkArmor = Manuscript({item = 197353, quest = 69554}),
        BronzeScales = Manuscript({item = 197391, quest = 69592}),
        BrownHair = Manuscript({item = 197369, quest = 69570}),
        BruiserHorns = Manuscript({item = 202277, quest = 73057}),
        ClubTail = Manuscript({item = 197403, quest = 69604}),
        CurledHorns = Manuscript({item = 197375, quest = 69576}),
        CurvedHorns = Manuscript({item = 197380, quest = 69581}),
        CurvedSpikedBrow = Manuscript({item = 197358, quest = 69559}),
        DualHornedCrest = Manuscript({item = 197366, quest = 69567}),
        Ears = Manuscript({item = 197376, quest = 69577}),
        EmbodimentOfShadowflame = Manuscript({item = 210537, quest = 78453}),
        EmbodimentOfTheBlazing = Manuscript({item = 210536, quest = 78451}),
        EmbodimentOfTheStormEater = Manuscript({item = 201790, quest = 72367}),
        FinnedCrest = Manuscript({item = 197365, quest = 69566}),
        FinnedJaw = Manuscript({item = 197388, quest = 69589}),
        FinnedTail = Manuscript({item = 197404, quest = 69605}),
        FinnedThroat = Manuscript({item = 197408, quest = 69609}),
        GoldAndBlackArmor = Manuscript({item = 197346, quest = 69547}),
        GoldAndRedArmor = Manuscript({item = 197351, quest = 69552}),
        GoldAndWhiteArmor = Manuscript({item = 197349, quest = 69550}),
        GradientHorns = Manuscript({item = 197381, quest = 69582}),
        GrayHair = Manuscript({item = 197367, quest = 69568}),
        GreenHair = Manuscript({item = 197371, quest = 69572}),
        GreenScales = Manuscript({item = 197389, quest = 66720}),
        HairyBack = Manuscript({item = 197356, quest = 69557}),
        HairyBrow = Manuscript({item = 197359, quest = 69560}),
        HarrierPattern = Manuscript({item = 197395, quest = 69596}),
        HeavyHorns = Manuscript({item = 197383, quest = 69584}),
        HeavyScales = Manuscript({item = 197397, quest = 69598}),
        Helm = Manuscript({item = 197373, quest = 69574}),
        HornedBack = Manuscript({item = 197354, quest = 69555}),
        HornedJaw = Manuscript({item = 197385, quest = 69586}),
        ImpalerHorns = Manuscript({item = 197379, quest = 69580}),
        LoveArmor = Manuscript({item = 211812, quest = 79088}), -- 10.2.5
        MalevolentHorns = Manuscript({item = 202279, quest = 73056}),
        ManedCrest = Manuscript({item = 197363, quest = 69564}),
        ManedTail = Manuscript({item = 197405, quest = 69606}),
        PlatedBrow = Manuscript({item = 202274, quest = 73055}),
        PlatedJaw = Manuscript({item = 202275, quest = 73059}),
        PredatorPattern = Manuscript({item = 197394, quest = 69595}),
        ProngedTail = Manuscript({item = 202280, quest = 73060}),
        PurpleHair = Manuscript({item = 197372, quest = 69573}),
        RazorSnout = Manuscript({item = 197399, quest = 69600}),
        RedHair = Manuscript({item = 197370, quest = 69571}),
        SharkSnout = Manuscript({item = 197400, quest = 69601}),
        ShortSpikedCrest = Manuscript({item = 197364, quest = 69565}),
        SilverAndBlueArmor = Manuscript({item = 197347, quest = 69548}),
        SilverAndPurpleArmor = Manuscript({item = 197350, quest = 69551}),
        SkyterrorPattern = Manuscript({item = 197396, quest = 69597}),
        SnubSnout = Manuscript({item = 197398, quest = 69599}),
        SpikedClubTail = Manuscript({item = 197402, quest = 69603}),
        SpikedCrest = Manuscript({item = 197361, quest = 69562}),
        SpikedJaw = Manuscript({item = 197386, quest = 69587}),
        SpikedThroat = Manuscript({item = 197407, quest = 69608}),
        SpinedBrow = Manuscript({item = 197360, quest = 69561}),
        SpinedCrest = Manuscript({item = 197362, quest = 69563}),
        SpinedTail = Manuscript({item = 197406, quest = 69607}),
        SteelAndYellowArmor = Manuscript({item = 197352, quest = 69553}),
        StubbySnout = Manuscript({item = 202273, quest = 73054}),
        SubtleHorns = Manuscript({item = 197378, quest = 69579}),
        SweptHorns = Manuscript({item = 197374, quest = 69575}),
        ThickSpinedJaw = Manuscript({item = 197355, quest = 69556}),
        ThinSpinedJaw = Manuscript({item = 197387, quest = 69588}),
        VisageOfTheInfinite = Manuscript({item = 208104, quest = 77255}),
        WhiteHorns = Manuscript({item = 197382, quest = 69583}),
        WhiteScales = Manuscript({item = 197393, quest = 69594})
    },
    WindborneVelocidrake = {
        Armor = Manuscript({item = 197588, quest = 69792}),
        BeakedSnout = Manuscript({item = 197620, quest = 69824}),
        BlackFur = Manuscript({item = 197597, quest = 69801}),
        BlackScales = Manuscript({item = 197611, quest = 69815}),
        BlueScales = Manuscript({item = 197612, quest = 69816}),
        BronzeAndGreenArmor = Manuscript({item = 197577, quest = 69781}),
        BronzeScales = Manuscript({item = 197613, quest = 69817}),
        ClubTail = Manuscript({item = 197624, quest = 69828}),
        ClusterHorns = Manuscript({item = 197602, quest = 69806}),
        CurledHorns = Manuscript({item = 197605, quest = 69809}),
        CurvedHorns = Manuscript({item = 197603, quest = 69807}),
        ExposedFinnedBack = Manuscript({item = 197583, quest = 69787}),
        ExposedFinnedNeck = Manuscript({item = 197626, quest = 69831}),
        ExposedFinnedTail = Manuscript({item = 197621, quest = 69825}),
        FeatheredBack = Manuscript({item = 197587, quest = 69791}),
        FeatheredNeck = Manuscript({item = 197630, quest = 69836}),
        FeatheryHead = Manuscript({item = 197593, quest = 69797}),
        FeatheryTail = Manuscript({item = 197625, quest = 69829}),
        FinnedBack = Manuscript({item = 197584, quest = 69788}),
        FinnedEars = Manuscript({item = 197595, quest = 69799}),
        FinnedNeck = Manuscript({item = 197627, quest = 69832}),
        FinnedTail = Manuscript({item = 197622, quest = 69826}),
        GoldAndRedArmor = Manuscript({item = 197580, quest = 69784}),
        GrayHair = Manuscript({item = 197598, quest = 69802}),
        GrayHorns = Manuscript({item = 197608, quest = 69812}),
        HairyHead = Manuscript({item = 197591, quest = 69795}),
        HallowsEndArmor = Manuscript({item = 208680, quest = 77725}),
        HeavyScales = Manuscript({item = 197617, quest = 69821}),
        Helm = Manuscript({item = 197600, quest = 69804}),
        HookedSnout = Manuscript({item = 197619, quest = 69823}),
        HornedJaw = Manuscript({item = 197596, quest = 69800}),
        LargeHeadFin = Manuscript({item = 197589, quest = 69793}),
        LongSnout = Manuscript({item = 197618, quest = 69822}),
        ManedBack = Manuscript({item = 197585, quest = 69789}),
        OxHorns = Manuscript({item = 197604, quest = 69808}),
        PlatedNeck = Manuscript({item = 197628, quest = 69834}),
        ReaverPattern = Manuscript({item = 197635, quest = 69846}),
        RedHair = Manuscript({item = 197599, quest = 69803}),
        RedScales = Manuscript({item = 197614, quest = 69818}),
        ShriekerPattern = Manuscript({item = 197636, quest = 69847}),
        SilverAndBlueArmor = Manuscript({item = 197578, quest = 69782}),
        SilverAndPurpleArmor = Manuscript({item = 197581, quest = 69785}),
        SmallEars = Manuscript({item = 197594, quest = 69798}),
        SmallHeadFin = Manuscript({item = 197590, quest = 69794}),
        SpikedBack = Manuscript({item = 197586, quest = 69790}),
        SpikedNeck = Manuscript({item = 197629, quest = 69835}),
        SpikedTail = Manuscript({item = 197623, quest = 69827}),
        SpinedHead = Manuscript({item = 197592, quest = 69796}),
        SplitHorns = Manuscript({item = 197607, quest = 69811}),
        SteelAndOrangeArmor = Manuscript({item = 197579, quest = 69783}),
        SweptHorns = Manuscript({item = 197606, quest = 69810}),
        TealScales = Manuscript({item = 197615, quest = 69819}),
        VisageOfTheInfinite = Manuscript({item = 208105, quest = 77256}),
        WavyHorns = Manuscript({item = 197601, quest = 69805}),
        WhiteAndPinkArmor = Manuscript({item = 197582, quest = 69786}),
        WhiteHorns = Manuscript({item = 197609, quest = 69813}),
        WhiteScales = Manuscript({item = 197616, quest = 69820}),
        WindsweptPattern = Manuscript({item = 197634, quest = 69845}),
        YellowHorns = Manuscript({item = 197610, quest = 69814})
    },
    HighlandDrake = {
        Armor = Manuscript({item = 197099, quest = 69300}),
        BlackHair = Manuscript({item = 197117, quest = 69318}),
        BlackScales = Manuscript({item = 197142, quest = 69343}),
        BladedTail = Manuscript({item = 197153, quest = 69354}),
        BronzeAndGreenArmor = Manuscript({item = 197156, quest = 69357}),
        BronzeScales = Manuscript({item = 197145, quest = 69346}),
        BrownHair = Manuscript({item = 197118, quest = 69319}),
        BushyBrow = Manuscript({item = 197101, quest = 69302}),
        ClubTail = Manuscript({item = 197149, quest = 69350}),
        CoiledHorns = Manuscript({item = 197125, quest = 69326}),
        CrestedBrow = Manuscript({item = 197100, quest = 69301}),
        CurledBackHorns = Manuscript({item = 197128, quest = 69329}),
        Ears = Manuscript({item = 197116, quest = 69317}),
        EmbodimentOfTheCrimsonGladiator = Manuscript({
            item = 201792,
            quest = 72371
        }),
        EmbodimentOfTheHellforged = Manuscript({item = 205876, quest = 75967}),
        FinnedBack = Manuscript({item = 197098, quest = 69299}),
        FinnedHead = Manuscript({item = 197106, quest = 69307}),
        FinnedNeck = Manuscript({item = 197155, quest = 69356}),
        GoldAndBlackArmor = Manuscript({item = 197090, quest = 69290}),
        GoldAndRedArmor = Manuscript({item = 197094, quest = 69295}),
        GoldAndWhiteArmor = Manuscript({item = 197095, quest = 69296}),
        GrandThornHorns = Manuscript({item = 197127, quest = 69328}),
        GreenScales = Manuscript({item = 197143, quest = 69344}),
        HairyCheek = Manuscript({item = 197131, quest = 69332}),
        HeavyHorns = Manuscript({item = 197122, quest = 69323}),
        HeavyScales = Manuscript({item = 197147, quest = 69348}),
        Helm = Manuscript({item = 197119, quest = 69320}),
        HookedHorns = Manuscript({item = 197126, quest = 69327}),
        HookedTail = Manuscript({item = 197152, quest = 69353}),
        HornedChin = Manuscript({item = 197102, quest = 69303}),
        LargeSpottedPattern = Manuscript({item = 197139, quest = 69340}),
        ManedChin = Manuscript({item = 197103, quest = 69304}),
        ManedHead = Manuscript({item = 197111, quest = 69312}),
        MultiHornedHead = Manuscript({item = 197114, quest = 69315}),
        OrnateHelm = Manuscript({item = 197120, quest = 69321}),
        PiratesDayArmor = Manuscript({item = 208858, quest = 77875}),
        PlatedHead = Manuscript({item = 197110, quest = 69311}),
        RedScales = Manuscript({item = 197144, quest = 69345}),
        ScaledPattern = Manuscript({item = 197141, quest = 69342}),
        SilverAndBlueArmor = Manuscript({item = 197091, quest = 69291}),
        SilverAndPurpleArmor = Manuscript({item = 197093, quest = 69294}),
        SingleHornedHead = Manuscript({item = 197112, quest = 69313}),
        SleekHorns = Manuscript({item = 197129, quest = 69330}),
        SmallSpottedPattern = Manuscript({item = 197140, quest = 69341}),
        SpikedCheek = Manuscript({item = 197132, quest = 69333}),
        SpikedClubTail = Manuscript({item = 197150, quest = 69351}),
        SpikedHead = Manuscript({item = 197109, quest = 69310}),
        SpikedLegs = Manuscript({item = 197134, quest = 69335}),
        SpikedTail = Manuscript({item = 197151, quest = 69352}),
        SpinedBack = Manuscript({item = 197097, quest = 69298}),
        SpinedCheek = Manuscript({item = 197133, quest = 69334}),
        SpinedChin = Manuscript({item = 197105, quest = 69306}),
        SpinedHead = Manuscript({item = 197108, quest = 69309}),
        SpinedNeck = Manuscript({item = 197154, quest = 69355}),
        SpinedNose = Manuscript({item = 197137, quest = 69338}),
        StagHorns = Manuscript({item = 197130, quest = 69331}),
        SteelAndYellowArmor = Manuscript({item = 197096, quest = 69297}),
        StripedPattern = Manuscript({item = 197138, quest = 69339}),
        SweptHorns = Manuscript({item = 197124, quest = 69325}),
        SweptSpikedHead = Manuscript({item = 197113, quest = 69314}),
        TanHorns = Manuscript({item = 197121, quest = 69322}),
        TaperedChin = Manuscript({item = 197104, quest = 69305}),
        TaperedNose = Manuscript({item = 197136, quest = 69337}),
        ThornedJaw = Manuscript({item = 197115, quest = 69324}),
        ThornHorns = Manuscript({item = 197123, quest = 69316}),
        ToothyMouth = Manuscript({item = 197135, quest = 69336}),
        TripleFinnedHead = Manuscript({item = 197107, quest = 69308}),
        VerticalFinnedTail = Manuscript({item = 197148, quest = 69349}),
        VisageOfTheInfinite = Manuscript({item = 208103, quest = 77257}),
        WhiteScales = Manuscript({item = 197146, quest = 69347}),
        WinterVeilArmor = Manuscript({item = 210432, quest = 78371})
    },
    CliffsideWylderdrake = {
        Armor = Manuscript({item = 196961, quest = 69161}),
        BlackHair = Manuscript({item = 196986, quest = 69186}),
        BlackHorns = Manuscript({item = 196991, quest = 69191}),
        BlackScales = Manuscript({item = 197013, quest = 69213}),
        BlondeHair = Manuscript({item = 196987, quest = 69187}),
        BlueScales = Manuscript({item = 197012, quest = 69212}),
        BluntSpikedTail = Manuscript({item = 197019, quest = 69219}),
        BranchedHorns = Manuscript({item = 196996, quest = 69196}),
        BronzeAndTealArmor = Manuscript({item = 196965, quest = 69165}),
        CoiledHorns = Manuscript({item = 197000, quest = 69200}),
        ConicalHead = Manuscript({item = 196981, quest = 69181}),
        CurledHeadHorns = Manuscript({item = 196979, quest = 69179}),
        DarkSkinVariation = Manuscript({item = 197015, quest = 69215}),
        DayOfTheDeadArmor = Manuscript({item = 208859, quest = 77876}),
        DualHornedChin = Manuscript({item = 196973, quest = 69173}),
        Ears = Manuscript({item = 196982, quest = 69182}),
        FinnedBack = Manuscript({item = 196969, quest = 69169}),
        FinnedCheek = Manuscript({item = 197001, quest = 69201}),
        FinnedJaw = Manuscript({item = 196984, quest = 69184}),
        FinnedNeck = Manuscript({item = 197022, quest = 69222}),
        FinnedTail = Manuscript({item = 197018, quest = 69218}),
        FlaredCheek = Manuscript({item = 197002, quest = 69202}),
        FourHornedChin = Manuscript({item = 196974, quest = 69174}),
        GoldAndBlackArmor = Manuscript({item = 196964, quest = 69164}),
        GoldAndOrangeArmor = Manuscript({item = 196966, quest = 69166}),
        GoldAndWhiteArmor = Manuscript({item = 196967, quest = 69167}),
        GreenScales = Manuscript({item = 197011, quest = 69211}),
        HeadFin = Manuscript({item = 196975, quest = 69175}),
        HeadMane = Manuscript({item = 196976, quest = 69176}),
        HeavyHorns = Manuscript({item = 196992, quest = 69192}),
        Helm = Manuscript({item = 196990, quest = 69190}),
        HookHorns = Manuscript({item = 196998, quest = 69198}),
        HornedJaw = Manuscript({item = 196985, quest = 69185}),
        HornedNose = Manuscript({item = 197005, quest = 69205}),
        LargeTailSpikes = Manuscript({item = 197017, quest = 69217}),
        ManedJaw = Manuscript({item = 196983, quest = 69183}),
        ManedNeck = Manuscript({item = 197023, quest = 69223}),
        ManedTail = Manuscript({item = 197016, quest = 69216}),
        NarrowStripesPattern = Manuscript({item = 197008, quest = 69208}),
        PlatedBrow = Manuscript({item = 196972, quest = 69172}),
        PlatedNose = Manuscript({item = 197006, quest = 69206}),
        RedHair = Manuscript({item = 196988, quest = 69188}),
        RedScales = Manuscript({item = 197010, quest = 69210}),
        ScaledPattern = Manuscript({item = 197009, quest = 69209}),
        ShortHorns = Manuscript({item = 196994, quest = 69194}),
        SilverAndBlueArmor = Manuscript({item = 196963, quest = 69163}),
        SilverAndPurpleArmor = Manuscript({item = 196962, quest = 69162}),
        SleekHorns = Manuscript({item = 196993, quest = 69193}),
        SmallHeadSpikes = Manuscript({item = 196978, quest = 69178}),
        SpearTail = Manuscript({item = 197020, quest = 69220}),
        SpikedBack = Manuscript({item = 196970, quest = 69170}),
        SpikedBrow = Manuscript({item = 196971, quest = 69171}),
        SpikedCheek = Manuscript({item = 197003, quest = 69203}),
        SpikedClubTail = Manuscript({item = 197021, quest = 69221}),
        SpikedHorns = Manuscript({item = 196995, quest = 69195}),
        SpikedLegs = Manuscript({item = 197004, quest = 69204}),
        SplitHeadHorns = Manuscript({item = 196977, quest = 69177}),
        SplitHorns = Manuscript({item = 196997, quest = 69197}),
        SteelAndYellowArmor = Manuscript({item = 196968, quest = 69168}),
        SweptHorns = Manuscript({item = 196999, quest = 69199}),
        TripleHeadHorns = Manuscript({item = 196980, quest = 69180}),
        VisageOfTheInfinite = Manuscript({item = 208102, quest = 77258}),
        WhiteHair = Manuscript({item = 196989, quest = 69189}),
        WhiteScales = Manuscript({item = 197014, quest = 69214}),
        WideStripesPattern = Manuscript({item = 197007, quest = 69207})
    },
    WindingSlitherdrake = {
        AntlerHorns = Manuscript({item = 203338, quest = 73829}),
        Armor = Manuscript({item = 203305, quest = 73793}),
        BlondeHair = Manuscript({item = 203322, quest = 73810}),
        BlueAndSilverArmor = Manuscript({item = 203300, quest = 73788}),
        BlueScales = Manuscript({item = 203350, quest = 73841}),
        BronzeScales = Manuscript({item = 203351, quest = 73842}),
        BrownHair = Manuscript({item = 203323, quest = 73811}),
        ClusterChinHorn = Manuscript({item = 203312, quest = 73800}),
        ClusterHorns = Manuscript({item = 203331, quest = 73820}),
        ClusterJawHorns = Manuscript({item = 203340, quest = 73831}),
        CurledCheekHorn = Manuscript({item = 203321, quest = 73809}),
        CurledHorns = Manuscript({item = 203334, quest = 73824}),
        CurledNose = Manuscript({item = 203346, quest = 73837}),
        CurvedChinHorn = Manuscript({item = 203314, quest = 73802}),
        CurvedHorns = Manuscript({item = 203335, quest = 73825}),
        CurvedNoseHorn = Manuscript({item = 203349, quest = 73840}),
        Ears = Manuscript({item = 203320, quest = 73808}),
        EmbodimentOfTheObsidianGladiator = Manuscript({
            item = 205865,
            quest = 75941
        }),
        EmbodimentOfTheVerdantGladiator = Manuscript({
            item = 210064,
            quest = 78216
        }),
        FinnedCheek = Manuscript({item = 203319, quest = 73807}),
        FinnedTipTail = Manuscript({item = 203361, quest = 73853}),
        GrandChinThorn = Manuscript({item = 203310, quest = 73798}),
        GreenAndBronzeArmor = Manuscript({item = 203299, quest = 73787}),
        GreenScales = Manuscript({item = 203352, quest = 73843}),
        HairyBrow = Manuscript({item = 203308, quest = 73796}),
        HairyChin = Manuscript({item = 203311, quest = 73799}),
        HairyCrest = Manuscript({item = 203318, quest = 73806}),
        HairyJaw = Manuscript({item = 203343, quest = 73834}),
        HairyTail = Manuscript({item = 203362, quest = 73854}),
        HairyThroat = Manuscript({item = 203365, quest = 73857}),
        HeavyHorns = Manuscript({item = 203329, quest = 73817}),
        HeavyScales = Manuscript({item = 205341, quest = 75743}),
        Helm = Manuscript({item = 203326, quest = 73814}),
        HornedBrow = Manuscript({item = 203306, quest = 73794}),
        ImpalerHorns = Manuscript({item = 203339, quest = 73830}),
        LargeFinnedCrest = Manuscript({item = 203316, quest = 73804}),
        LargeFinnedTail = Manuscript({item = 203360, quest = 73852}),
        LargeFinnedThroat = Manuscript({item = 203363, quest = 73855}),
        LargeSpikedNose = Manuscript({item = 203347, quest = 73838}),
        LightBlueAndCopperArmor = Manuscript({item = 203301, quest = 73789}),
        LongChinHorn = Manuscript({item = 203309, quest = 73797}),
        LongJawHorns = Manuscript({item = 203341, quest = 73832}),
        LunarFestivalArmor = Manuscript({item = 211868, quest = 79112}), -- 10.2.5
        PairedHorns = Manuscript({item = 203336, quest = 73826}),
        PlatedBrow = Manuscript({item = 203307, quest = 73795}),
        PointedNose = Manuscript({item = 203348, quest = 73839}),
        PurpleAndSilverArmor = Manuscript({item = 203302, quest = 73790}),
        RedAndGoldArmor = Manuscript({item = 203303, quest = 73791}),
        RedHair = Manuscript({item = 203325, quest = 73813}),
        RedScales = Manuscript({item = 203353, quest = 73844}),
        SharkFinnedTail = Manuscript({item = 203359, quest = 73851}),
        ShortHorns = Manuscript({item = 203333, quest = 73822}),
        SingleJawHorn = Manuscript({item = 203344, quest = 73835}),
        SmallFinnedCrest = Manuscript({item = 203317, quest = 73805}),
        SmallFinnedTail = Manuscript({item = 203358, quest = 73850}),
        SmallFinnedThroat = Manuscript({item = 203364, quest = 73856}),
        SmallSpikedCrest = Manuscript({item = 203315, quest = 73803}),
        SpikedChin = Manuscript({item = 203313, quest = 73801}),
        SpikedHorns = Manuscript({item = 203332, quest = 73821}),
        SpikedTail = Manuscript({item = 203357, quest = 73849}),
        SplitJawHorns = Manuscript({item = 203345, quest = 73836}),
        SweptHorns = Manuscript({item = 203330, quest = 73818}),
        TanHorns = Manuscript({item = 203327, quest = 73815}),
        ThornHorns = Manuscript({item = 203337, quest = 73827}),
        TripleJawHorns = Manuscript({item = 203342, quest = 73833}),
        VisageOfTheInfinite = Manuscript({item = 208106, quest = 77259}),
        WhiteAndGoldArmor = Manuscript({item = 203298, quest = 73786}),
        WhiteHair = Manuscript({item = 203324, quest = 73812}),
        WhiteHorns = Manuscript({item = 203328, quest = 73816}),
        WhiteScales = Manuscript({item = 203354, quest = 73845}),
        YellowAndSilverArmor = Manuscript({item = 203304, quest = 73792}),
        YellowScales = Manuscript({item = 203355, quest = 73846})
    },
    FlourishingWhimsydrake = {
        BackFins = Manuscript({item = 210482, quest = 78400}),
        BodyArmor = Manuscript({item = 210471, quest = 78401}),
        GoldAndPinkArmor = Manuscript({item = 210478, quest = 78399}),
        Helmet = Manuscript({item = 210476, quest = 78402}),
        Horns = Manuscript({item = 210486, quest = 78406}),
        LongSnout = Manuscript({item = 210485, quest = 78405}),
        NeckFins = Manuscript({item = 210487, quest = 78407}),
        NightScales = Manuscript({item = 210479, quest = 78408}),
        RidgedBrow = Manuscript({item = 210483, quest = 78403}),
        SunriseScales = Manuscript({item = 210480, quest = 78409}),
        SunsetScales = Manuscript({item = 210481, quest = 78410}),
        UnderbiteSnout = Manuscript({item = 210484, quest = 78404})
    },
    GrottoNetherwingDrake = {
        Armor = Manuscript({item = 207760, quest = 77131}),
        BarbedTail = Manuscript({item = 207779, quest = 77150}),
        BlackScales = Manuscript({item = 207776, quest = 77147}),
        ChinSpike = Manuscript({item = 207762, quest = 77133}),
        ChinTendrils = Manuscript({item = 207761, quest = 77132}),
        ClusterSpikedBack = Manuscript({item = 207759, quest = 77130}),
        ClusterSpikedCrest = Manuscript({item = 207765, quest = 77136}),
        DoubleFinnedTail = Manuscript({item = 207778, quest = 77149}),
        FinnedJaw = Manuscript({item = 207774, quest = 77145}),
        HeadSpike = Manuscript({item = 207764, quest = 77135}),
        Helm = Manuscript({item = 207770, quest = 77141}),
        LongHorns = Manuscript({item = 207772, quest = 77143}),
        OutcastPattern = Manuscript({item = 207769, quest = 77140}),
        PurpleandSilverArmor = Manuscript({item = 207757, quest = 77128}),
        ShortHorns = Manuscript({item = 207771, quest = 77142}),
        SingleHornedCrest = Manuscript({item = 207763, quest = 77134}),
        SpikedBack = Manuscript({item = 207758, quest = 77129}),
        SpikedJaw = Manuscript({item = 207773, quest = 77144}),
        TealScales = Manuscript({item = 207775, quest = 77146}),
        TempestuousPattern = Manuscript({item = 207767, quest = 77138}),
        TripleSpikedCrest = Manuscript({item = 207766, quest = 77137}),
        VioletScales = Manuscript({item = 211381, quest = 78878}),
        VolatilePattern = Manuscript({item = 207768, quest = 77139}),
        YellowScales = Manuscript({item = 207777, quest = 77148})
    },
    DragonIslesDrakes = {
        GildedArmor = Manuscript({
            item = 208200,
            quest = {69550, 69786, 69167, 69296, 73786}
        }),
        WhiteScales = Manuscript({
            item = 208550,
            quest = {69594, 69820, 69347, 69214, 73845}
        })
    }
}

ns.DRAGON_CUSTOMIZATIONS.SetCount = function(dc, count)
    if not dc.quest then
        return Toy({item = dc.item, count = count, type = false})
    else
        return Manuscript({item = dc.item, quest = dc.quest, count = count})
    end
end

-------------------------------------------------------------------------------
------------------ DRAGONSCALE EXPEDITION: THE HIGHEST PEAKS ------------------
-------------------------------------------------------------------------------

local Flag = Class('Flag', Collectible, {
    icon = 1723999,
    label = L['dragonscale_expedition_flag'], -- Dragonscale Expedition Flag
    rlabel = ns.tooltip.ReputationGain(250, 2507), -- Dragonscale Expedition
    group = ns.groups.FLAG,
    requires = {
        ns.requirement.Reputation(2507, 6, true), -- Dragonscale Expedition
        ns.requirement.GarrisonTalent(2164) -- Cartographer Flag
    },
    rewards = {
        Achievement({
            id = 15890,
            criteria = {id = 1, qty = true, suffix = L['flags_placed']}
        })
    },
    IsCompleted = function(self)
        return C_QuestLog.IsQuestFlaggedCompleted(self.quest[1])
    end
})

ns.node.Flag = Flag

-------------------------------------------------------------------------------
------------------ WYRMHOLE GENERATOR - SIGNAL TRANSMITTER --------------------
-------------------------------------------------------------------------------

local SignalTransmitter = Class('SignalTransmitter', Collectible, {
    label = L['signal_transmitter_label'],
    icon = 4548860,
    note = L['signal_transmitter_note'],
    group = ns.groups.SIGNAL_TRANSMITTER,
    requires = {
        ns.requirement.Profession(202, 2827), -- DF Engineering
        ns.requirement.Toy(198156) -- Wyrmhole Generator
    },
    IsEnabled = function(self)
        if not ns.PlayerHasProfession(202) then return false end
        return ns.node.Item.IsEnabled(self)
    end,
    IsCompleted = function(self)
        return C_QuestLog.IsQuestFlaggedCompleted(self.quest[1])
    end
}) -- Wyrmhole Generator Signal Transmitter

ns.node.SignalTransmitter = SignalTransmitter

-------------------------------------------------------------------------------
---------------------------- FRAGMENTS OF HISTORY -----------------------------
-------------------------------------------------------------------------------

local Fragment = Class('Fragment', Collectible, {
    icon = 134908,
    group = ns.groups.FRAGMENT,
    IsCollected = function(self)
        if ns.PlayerHasItem(self.rewards[2].item) then return true end
        return Collectible.IsCollected(self)
    end
})

function Fragment.getters:note()
    -- Ask Emilia Bellocq first
    return not C_QuestLog.IsQuestFlaggedCompleted(70231) and
               L['fragment_requirement_note']
end

ns.node.Fragment = Fragment

-------------------------------------------------------------------------------
------------------------------- DISTURBED DIRT --------------------------------
-------------------------------------------------------------------------------

local Disturbeddirt = Class('Disturbed_dirt', Node, {
    icon = 1060570,
    label = L['disturbed_dirt'],
    group = ns.groups.DISTURBED_DIRT,
    requires = {
        ns.requirement.Quest(70813), -- Digging Up Treasure
        ns.requirement.Item(191294) -- Small Expedition Shovel
    },
    rewards = {
        Item({item = 190453}), -- Spark of Ingenuity
        Transmog({item = 201386, slot = L['polearm']}), -- Drakonid Defender's Pike
        Transmog({item = 201388, slot = L['staff']}), -- Dragonspawn Wingtipped Staff
        Transmog({item = 201390, slot = L['2h_axe']}), -- Devastating Drakonid Waraxe
        Item({item = 194540, quest = 67046}), -- Nokhud Armorer's Notes
        Item({item = 199061, quest = 70527}), -- A Guide to Rare Fish
        Item({item = 199066, quest = 70535}), -- Letter of Caution
        Item({item = 199068, quest = 70537}), -- Time-Lost Memo
        Item({item = 199062, quest = 70528}), -- Ruby Gem Cluster Map
        Item({item = 199067, quest = 70536}), -- Precious Plans
        Item({item = 198852, quest = 70407}), -- Bear Termination Orders
        Item({item = 198843, quest = 70392}), -- Emerald Gardens Explorer's Notes
        Item({item = 199065, quest = 70534}), -- Sorrowful Letter
        Item({item = 192055}), -- Dragon Isles Artifact
        Currency({id = 2003}) -- Dragon Isles Supplies
    }
})

ns.node.Disturbeddirt = Disturbeddirt

-------------------------------------------------------------------------------
-------------------------- EXPEDITION SCOUT'S PACKS ---------------------------
-------------------------------------------------------------------------------

local Scoutpack = Class('Scoutpack', Node, {
    icon = 4562583,
    label = L['scout_pack'],
    group = ns.groups.SCOUT_PACK,
    requires = ns.requirement.Quest(70822), -- Lost Expedition Scouts
    rewards = {
        Item({item = 191784}), -- Dragon Shard of Knowledge
        Mount({item = 192764, id = 1617}), -- Verdant Skitterfly
        Transmog({item = 201387, slot = L['polearm']}), -- Dragon Knight's Halberd
        Transmog({item = 201388, slot = L['staff']}), -- Dragonspawn Wingtipped Staff
        Transmog({item = 201390, slot = L['2h_axe']}), -- Devastating Drakonid Waraxe
        Transmog({item = 201392, slot = L['1h_sword']}), -- Dragon Noble's Cutlass
        Transmog({item = 201395, slot = L['1h_sword']}), -- Dragon Wingcrest Scimitar
        Transmog({item = 201396, slot = L['fist']}), -- Dracthyr Claw Extensions
        Item({item = 194540, quest = 67046}), -- Nokhud Armorer's Notes
        Item({item = 199061, quest = 70527}), -- A Guide to Rare Fish
        Item({item = 199066, quest = 70535}), -- Letter of Caution
        Item({item = 199068, quest = 70537}), -- Time-Lost Memo
        Item({item = 199062, quest = 70528}), -- Ruby Gem Cluster Map
        Item({item = 199067, quest = 70536}), -- Precious Plans
        Item({item = 198852, quest = 70407}), -- Bear Termination Orders
        Item({item = 198843, quest = 70392}), -- Emerald Gardens Explorer's Notes
        Item({item = 192055}), -- Dragon Isles Artifact
        Currency({id = 2003}) -- Dragon Isles Supplies
        -- Currency({id = 2245}) -- Flightstones
    }
})

ns.node.Scoutpack = Scoutpack

-------------------------------------------------------------------------------
------------------------------ Magic-Bound Chest ------------------------------
-------------------------------------------------------------------------------

-- Ice Bound Chest         377540 -- cosmetics, maps,       same spawn points as Magic Bound Chest
local MagicBoundChest = Class('MagicBoundChest', Node, {
    icon = 'chest_tl',
    label = L['magicbound_chest'] .. ' / ' .. L['ice_bound_chest'],
    group = ns.groups.MAGICBOUND_CHEST,
    requires = ns.requirement.Reputation(2507, 16, true), -- Dragonscale Expedition
    rewards = {
        Item({item = 191784}), -- Dragon Shard of Knowledge
        Item({item = 199062, quest = 70528}), -- Ruby Gem Cluster Map
        Item({item = 198843, quest = 70392}), -- Emerald Gardens Explorer's Notes
        Item({item = 194540, quest = 67046}), -- Nokhud Armorer's Notes
        Item({item = 199067, quest = 70536}), -- Precious Plans
        Item({item = 192055}), -- Dragon Isles Artifact
        Currency({id = 2003}) -- Dragon Isles Supplies
    }
})

ns.node.MagicBoundChest = MagicBoundChest

-------------------------------------------------------------------------------
------------------------------ TUSKARR TACKLEBOX ------------------------------
-------------------------------------------------------------------------------

local TuskarrTacklebox = Class('TuskarrTacklebox', Node, {
    label = L['tuskarr_tacklebox'],
    icon = 'chest_yw',
    group = ns.groups.TUSKARR_TACKLEBOX,
    requires = {
        ns.requirement.Reputation(2511, 27, true), -- Iskaara Tuskarr
        ns.requirement.Quest(70952) -- Abandoned or Hidden Caches
    },
    rewards = {
        Item({item = 194730}), -- Scalebelly Mackerel
        Item({item = 194966}), -- Thousandbite Piranha
        Item({item = 194967}), -- Aileron Seamoth
        Item({item = 194968}), -- Cerulean Spinefish
        Item({item = 194969}), -- Temporal Dragonhead
        Item({item = 194970}), -- Islefin Dorado
        Spacer(), Item({item = 199338}), -- Copper Coin of the Isle
        Item({item = 199339}), -- Silver Coin of the Isle
        Item({item = 199340}), -- Gold Coin of the Isle
        Spacer(), Item({item = 198438}), -- Draconic Recipe in a Bottle
        Currency({id = 2003}) -- Dragon Isles Supplies
    }
})

ns.node.TuskarrTacklebox = TuskarrTacklebox

-------------------------------------------------------------------------------
---------------------------------- REED CHEST ---------------------------------
-------------------------------------------------------------------------------

ns.node.ReedChest = Class('ReedChest', Node, {
    label = L['reed_chest'],
    icon = 'chest_yw', -- TODO change color
    group = ns.groups.REED_CHEST,
    rewards = {
        Item({item = 191784}), -- Dragon Shard of Knowledge
        Item({item = 199061, quest = 70527}), -- A Guide to Rare Fish
        Item({item = 199068, quest = 70537}), -- Time-Lost Memo
        Item({item = 194540, quest = 67046}), -- Nokhud Armorer's Notes
        Item({item = 192055}), -- Dragon Isles Artifact
        Item({item = 200071}), -- Sacred Tuskarr Totem
        Currency({id = 2003}) -- Dragon Isles Supplies
    }
})

-------------------------------------------------------------------------------
---------------------------- DRACTHYR SUPPLY CHEST ----------------------------
-------------------------------------------------------------------------------

ns.node.DracthyrSupplyChest = Class('DracthyrSupplyChest', Node, {
    label = L['dracthyr_supply_chest'],
    icon = 'chest_bl',
    group = ns.groups.DRACTHYR_SUPPLY_CHEST,
    rewards = {
        Item({item = 191784}), -- Dragon Shard of Knowledge
        Item({item = 199061, quest = 70527}), -- A Guide to Rare Fish
        Item({item = 199066, quest = 70535}), -- Letter of Caution
        Item({item = 194540, quest = 67046}), -- Nokhud Armorer's Notes
        Item({item = 199068, quest = 70537}), -- Time-Lost Memo
        Item({item = 192055}), -- Dragon Isles Artifact
        Item({item = 200071}), -- Sacred Tuskarr Totem
        Currency({id = 2003}) -- Dragon Isles Supplies
    }
})

-------------------------------------------------------------------------------
------------------------------- SIMMERING CHEST -------------------------------
-------------------------------------------------------------------------------

ns.node.SimmeringChest = Class('SimmeringChest', Node, {
    label = L['simmering_chest'],
    icon = 'chest_gn',
    group = ns.groups.SIMMERING_CHEST,
    rewards = {
        Item({item = 191784}), -- Dragon Shard of Knowledge
        Transmog({item = 201446, slot = L['shield']}), -- Primal Revenant's Firewall
        Transmog({item = 201445, slot = L['1h_sword']}), -- Primal Revenant's Emberblade
        Item({item = 199061, quest = 70527}), -- A Guide to Rare Fish
        Item({item = 194540, quest = 67046}), -- Nokhud Armorer's Notes
        Item({item = 199068, quest = 70537}), -- Time-Lost Memo
        Item({item = 194486}), -- Plans: Shield of the Hearth
        Item({item = 192055}), -- Dragon Isles Artifact
        Item({item = 199906}), -- Titan Relic
        Currency({id = 2003}) -- Dragon Isles Supplies
    }
})

-------------------------------------------------------------------------------
------------------------------- FROSTBOUND CHEST ------------------------------
-------------------------------------------------------------------------------

ns.node.FrostboundChest = Class('FrostboundChest', Node, {
    label = L['frostbound_chest'],
    icon = 'chest_gn',
    group = ns.groups.FROSTBOUND_CHEST,
    rewards = {
        Item({item = 191784}), -- Dragon Shard of Knowledge
        Transmog({item = 201443, slot = L['shield']}), -- Primal Revenant's Icewall
        Transmog({item = 201442, slot = L['1h_sword']}), -- Primal Revenant's Frostblade
        Item({item = 199065, quest = 70534}), -- Sorrowful Letter
        Item({item = 199066, quest = 70535}), -- Letter of Caution
        Item({item = 199068, quest = 70537}), -- Time-Lost Memo
        Item({item = 192055}), -- Dragon Isles Artifact
        Item({item = 199906}), -- Titan Relic
        Currency({id = 2003}) -- Dragon Isles Supplies
    }
})

-------------------------------------------------------------------------------
--------------------- TO ALL THE SQUIRRELS HIDDEN TIL NOW ---------------------
-------------------------------------------------------------------------------

local Squirrel = Class('Squirrel', Collectible, {
    group = ns.groups.SQUIRRELS,
    icon = 237182,
    note = L['squirrels_note']
})

ns.node.Squirrel = Squirrel

-------------------------------------------------------------------------------
----------------------------- THAT'S PRETTY NEAT! -----------------------------
-------------------------------------------------------------------------------

local PrettyNeat = Class('PrettyNeat', Collectible, {
    icon = 133707,
    sublabel = L['pretty_neat_note'],
    group = ns.groups.PRETTY_NEAT,
    IsEnabled = function(self)
        if self.isRare and ns.groups.RARE:GetDisplay(self.mapID) then
            return false
        end
        if not ns:GetOpt('show_completed_nodes') and self:IsCompleted() then
            return false
        end
        return true
    end
}) -- That's Pretty Neat!

ns.node.PrettyNeat = PrettyNeat

-------------------------------------------------------------------------------
------------------------------ A LEGENDARY ALBUM ------------------------------
-------------------------------------------------------------------------------

local LegendaryCharacter = Class('LegendaryCharacter', Collectible, {
    icon = 1109168,
    group = ns.groups.LEGENDARY_ALBUM,
    requires = {
        ns.requirement.Reputation(2507, 8, true), -- Dragonscale Expedition
        ns.requirement.GarrisonTalent(2169) -- Lucky Rock
    }
}) -- A Legendary Album

ns.node.LegendaryCharacter = LegendaryCharacter

-------------------------------------------------------------------------------
--------------------- ANCIENT STONES OF THE DRAGON ISLES ----------------------
-------------------------------------------------------------------------------

local AncientStone = Class('AncientStone', Collectible, {
    label = L['ancient_stone_label'],
    icon = 134461,
    group = ns.groups.ANCIENT_STONES
}) -- Ancient Stone

ns.node.AncientStone = AncientStone

-------------------------------------------------------------------------------
----------------------------- DRAGON ISLES SAFARI -----------------------------
-------------------------------------------------------------------------------

local Safari = Class('Safari', Collectible,
    {icon = 'paw_g', group = ns.groups.SAFARI}) -- Dragon Isles Safari

ns.node.Safari = Safari

-------------------------------------------------------------------------------
------------------------------ ELEMENTAL CHESTS -------------------------------
-------------------------------------------------------------------------------

local ElementalChest = Class('ElementalChest', ns.node.Treasure, {
    icon = 'chest_rd',
    getters = {
        rlabel = function(self)
            if self.quest then
                local completed = C_QuestLog.IsQuestFlaggedCompleted(
                    self.quest[1])
                local color = completed and ns.status.Green or ns.status.Gray
                return color(L['weekly'])
            end
        end
    }
})

ns.node.ElementalChest = ElementalChest

-------------------------------------------------------------------------------
------------------------------ WAR SUPPLY CRATES ------------------------------
-------------------------------------------------------------------------------

local WarSupply = Class('WarSupply', Node, {
    icon = 'star_chest_g',
    scale = 1.5,
    label = '{npc:135238}',
    rlabel = ns.GetIconLink('war_mode_swords', 16),
    quest = {72376, 72377}, -- first loot of the day rewards Conquest and extra Bloody Tokens
    note = L['war_supply_chest_note'],
    requires = ns.requirement.WarMode,
    rewards = {
        -- Achievement({id = 19294, criteria = {id = 1, qty = true}}), -- Tour of Duty: Emerald Dream
        -- Achievement({id = 17851, criteria = {id = 1, qty = true}}), -- Tour of Duty: Zaralek Cavern
        -- Achievement({id = 16592, criteria = {id = 1, qty = true}}), -- Tour of Duty: The Waking Shores
        -- Achievement({id = 16594, criteria = {id = 1, qty = true}}), -- Tour of Duty: The Azure Span
        -- Achievement({id = 16593, criteria = {id = 1, qty = true}}), -- Tour of Duty: Thaldraszus
        -- Achievement({id = 16595, criteria = {id = 1, qty = true}}), -- Tour of Duty: Ohn'ahran Plains
        -- Achievement({id = 16615, criteria = {id = 1, qty = true}}), -- Blood Bank
        Achievement({id = 16613, criteria = {id = 1, qty = true}}), -- Finder's Keepers
        Recipe({item = 201257, profession = 165}), -- Bloodstained Pattern: Infurious Hide
        Recipe({item = 201259, profession = 165}), -- Bloodstained Pattern: Infurious Scales
        Recipe({item = 201256, profession = 164}), -- Bloodstained Plans: Infurious Alloy
        Recipe({item = 201258, profession = 197}), -- Bloodstained Pattern: Infurious Wildercloth Bolt
        Item({item = 190451}), -- Rousing Ire
        Currency({id = 2123, note = '+200'}), -- Bloody Tokens
        Currency({id = 1602, note = '+60'}), -- Conquest
        Currency({id = 1792, note = '+100'}) -- Honor
    },
    group = ns.groups.WAR_SUPPLY
})

ns.node.WarSupply = WarSupply

-------------------------------------------------------------------------------
---------------------------------- INTERVALS ----------------------------------
-------------------------------------------------------------------------------
ns.Intervals = {}

local Interval = Class('Interval', ns.Interval, {
    format_12hrs = L['time_format_12hrs'],
    format_24hrs = L['time_format_24hrs']
})

ns.Intervals.Interval14h = Class('Interval14h', Interval, {
    initial = {
        eu = 1676237400,
        us = 1677335400,
        cn = 1676255400,
        tw = 1675701000
    }, -- initial spawn time of the first rare to calculate other rares
    offset = 1800, -- time between rares
    interval = 50400, -- inverval of a single rare
    yellow = 14400,
    green = 1800,
    text = L['rare_14h']
})

ns.Intervals.BrackenhideInterval = Class('BrackenhideInterval', Interval, {
    initial = {
        us = 1672531800,
        eu = 1672531200,
        cn = 1672560600,
        tw = 1677162000
    },
    offset = 600,
    interval = 2400,
    yellow = 1200,
    green = 600,
    text = L['brackenhide_rare_note']
})

ns.Intervals.FeastInterval = Class('FeastInterval', Interval, {
    initial = {
        us = 1677164400,
        eu = 1677168000,
        cn = 1677193200,
        tw = 1677166200
    },
    offset = 5400,
    interval = 5400,
    id = 0,
    yellow = 3600,
    green = 600,
    text = L['bisquis_note']
})

ns.Intervals.AylaagCampInterval = Class('AylaagCampInterval', Interval, {
    initial = {
        us = 1677456000,
        eu = 1677502800,
        cn = 1726171200,
        tw = 1677571200
    },
    offset = 270000,
    interval = 810000,
    id = 0,
    yellow = 7200,
    green = 1800,
    text = L['aylaag_camp_note']
})

-------------------------------------------------------------------------------
------------------------------ ELEMENTAL STORMS -------------------------------
-------------------------------------------------------------------------------

local ELEMENTAL_STORM_AREA_POIS = {
    [7221] = 'thunderstorm',
    [7222] = 'sandstorm',
    [7223] = 'firestorm',
    [7224] = 'snowstorm',
    [7225] = 'thunderstorm',
    [7226] = 'sandstorm',
    [7227] = 'firestorm',
    [7228] = 'snowstorm',
    [7229] = 'thunderstorm',
    [7230] = 'sandstorm',
    [7231] = 'firestorm',
    [7232] = 'snowstorm',
    [7233] = 'thunderstorm',
    [7234] = 'sandstorm',
    [7235] = 'firestorm',
    [7236] = 'snowstorm',
    [7237] = 'thunderstorm',
    [7238] = 'sandstorm',
    [7239] = 'firestorm',
    [7240] = 'snowstorm',
    [7241] = 'thunderstorm',
    [7242] = 'sandstorm',
    [7243] = 'firestorm',
    [7244] = 'snowstorm',
    [7245] = 'thunderstorm',
    [7246] = 'sandstorm',
    [7247] = 'firestorm',
    [7248] = 'snowstorm',
    [7249] = 'thunderstorm',
    [7250] = 'sandstorm',
    [7251] = 'firestorm',
    [7252] = 'snowstorm',
    [7253] = 'thunderstorm',
    [7254] = 'sandstorm',
    [7255] = 'firestorm',
    [7256] = 'snowstorm',
    [7257] = 'thunderstorm',
    [7258] = 'sandstorm',
    [7259] = 'firestorm',
    [7260] = 'snowstorm',
    [7298] = 'thunderstorm',
    [7299] = 'sandstorm',
    [7300] = 'firestorm',
    [7301] = 'snowstorm'
}

local ELEMENTAL_STORM_MOB_ACHIVEMENTS = {
    ['all'] = Achievement({
        id = 16500,
        criteria = {
            id = 1,
            qty = true,
            suffix = L['elemental_overflow_obtained_suffix']
        }
    }), -- Elemental Overload
    [2022] = {
        ['thunderstorm'] = 16463, -- Thunderstorms in the Waking Shores
        ['sandstorm'] = 16465, -- Sandstorms in the Waking Shores
        ['firestorm'] = 16466, -- Firestorms in the Waking Shores
        ['snowstorm'] = 16467 -- Snowstorms in the Waking Shores
    }, -- Waking Shores
    [2023] = {
        ['thunderstorm'] = 16475, -- Thunderstorms in the Ohnahran Plains
        ['sandstorm'] = 16477, -- Sandstorms in the Ohnahran Plains
        ['firestorm'] = 16478, -- Firestorms in the Ohnahran Plains
        ['snowstorm'] = 16479 -- Snowstorms in the Ohnahran Plains
    }, -- Ohn'ahran Plains
    [2024] = {
        ['thunderstorm'] = 16480, -- Thunderstorms in the Azure Span
        ['sandstorm'] = 16481, -- Sandstorms in the Azure Span
        ['firestorm'] = 16482, -- Firestorms in the Azure Span
        ['snowstorm'] = 16483 -- Snowstorms in the Azure Span
    }, -- Azure Span
    [2025] = {
        ['thunderstorm'] = 16485, -- Thunderstorms in Thaldraszus
        ['sandstorm'] = 16486, -- Sandstorms in Thaldraszus
        ['firestorm'] = 16487, -- Firestorms in Thaldraszus
        ['snowstorm'] = 16488 -- Snowstorms in Thaldraszus
    }, -- Thaldraszus
    [2085] = {
        ['thunderstorm'] = 16485, -- Thunderstorms in Thaldraszus
        ['sandstorm'] = 16486, -- Sandstorms in Thaldraszus
        ['firestorm'] = 16487, -- Firestorms in Thaldraszus
        ['snowstorm'] = 16488 -- Snowstorms in Thaldraszus
    } -- The Primalist Future
}

local ELEMENTAL_STORM_BOSS_ACHIEVEMENTS = {
    ['thunderstorm'] = Achievement({
        id = 16461,
        criteria = {55464, 55468, 55470, 55475}
    }), -- Stormed Off (Thunderstorm bosses only)
    ['sandstorm'] = Achievement({
        id = 16461,
        criteria = {55463, 55467, 55469, 55476}
    }), -- Stormed Off (Sandstorm bosses only)
    ['firestorm'] = Achievement({
        id = 16461,
        criteria = {55461, 55465, 55471, 55477}
    }), -- Stormed Off (Firestorm bosses only)
    ['snowstorm'] = Achievement({
        id = 16461,
        criteria = {55462, 55466, 55472, 55473, 55474, 55478}
    }) -- Stormed Off (Snowstorm bosses only)
}

local ELEMENTAL_STORM_PET_REWARDS = {
    ['thunderstorm'] = Pet({
        item = 200263,
        id = 3310,
        note = L['elemental_storm_thunderstorm']
    }), -- Echo of the Heights
    ['sandstorm'] = Pet({
        item = 200183,
        id = 3355,
        note = L['elemental_storm_sandstorm']
    }), -- Echo of the Cave
    ['firestorm'] = Pet({
        item = 200255,
        id = 3289,
        note = L['elemental_storm_firestorm']
    }), -- Echo of the Inferno
    ['snowstorm'] = Pet({
        item = 200260,
        id = 3299,
        note = L['elemental_storm_snowstorm']
    }) -- Echo of the Depths
}

local ELEMENTAL_STORM_FORMULA_REWARDS = {
    ['all'] = Recipe({item = 194641, profession = 755}), -- Design: Elemental Lariat
    ['thunderstorm'] = Recipe({
        item = 200911,
        profession = 333,
        note = L['elemental_storm_thunderstorm']
    }), -- Formula: Illusion: Primal Air
    ['sandstorm'] = Recipe({
        item = 200912,
        profession = 333,
        note = L['elemental_storm_sandstorm']
    }), -- Formula: Illusion: Primal Earth
    ['firestorm'] = Recipe({
        item = 200913,
        profession = 333,
        note = L['elemental_storm_firestorm']
    }), -- Formula: Illusion: Primal Fire
    ['snowstorm'] = Recipe({
        item = 200914,
        profession = 333,
        note = L['elemental_storm_snowstorm']
    }) -- Formula: Illusion: Primal Frost
}

local function prepTransmog(item, slot, note)
    ns.PrepareLinks(note)
    return Transmog({item = item, slot = slot, note = note})
end

local ELEMENTAL_STORM_TRANSMOG_REWARDS = {
    ['thunderstorm'] = {
        prepTransmog(200180, L['staff'], '{npc:193653}'), -- Crystallized Lightning Staff
        prepTransmog(200170, L['bow'], '{npc:193647}'), -- Stormbringer Bow
        prepTransmog(200136, L['plate'], '{npc:193674}') -- Monsoonic Armguards
    },
    ['sandstorm'] = {
        prepTransmog(200231, L['shield'], '{npc:193644}'), -- Flaming Stonescale Bulwark
        prepTransmog(200145, L['2h_sword'], '{npc:193652}') -- Hilted Monolith
    },
    ['firestorm'] = {
        prepTransmog(200307, L['1h_axe'], '{npc:193650}'), -- Viciously Hooked Cleaver
        prepTransmog(200150, L['1h_mace'], '{npc:193648}'), -- Infernum's Furnace
        prepTransmog(200155, L['shield'], '{npc:193675}'), -- Haphazardly Welded Protector
        prepTransmog(200181, L['1h_sword'], '{npc:193686}') -- Blade of Blazing Torment
    },
    ['snowstorm'] = {
        prepTransmog(200301, L['polearm'], '{npc:193645}'), -- Reclaimed Tuskarr Harpoon
        prepTransmog(200311, L['1h_mace'], '{npc:193655}'), -- Bonespike Mallet
        prepTransmog(200250, L['warglaive'], '{npc:193677}') -- Frost Tipped Glaive
    }
}

local DC = ns.DRAGON_CUSTOMIZATIONS
local ELEMENTAL_STORM_MANUSCRIPT_REWARDS = {
    ['all'] = {
        DC.WindborneVelocidrake.ClusterHorns, DC.RenewedProtoDrake.HeavyHorns
    },
    ['thunderstorm'] = {
        DC.RenewedProtoDrake.PurpleHair, DC.WindborneVelocidrake.SweptHorns
    },
    ['sandstorm'] = {
        DC.WindborneVelocidrake.ClubTail, DC.CliffsideWylderdrake.BlackHorns
    },
    ['firestorm'] = {
        DC.RenewedProtoDrake.ImpalerHorns, DC.HighlandDrake.ToothyMouth
    },
    ['snowstorm'] = {
        DC.HighlandDrake.FinnedBack, DC.CliffsideWylderdrake.FinnedCheek
    }
}

local ElementalStorm = Class('ElementalStorm', Collectible, {
    icon = 538566,
    group = ns.groups.ELEMENTAL_STORM,
    IsEnabled = function(self)
        local activePOIs = C_AreaPoiInfo.GetAreaPOIForMap(self.mapID)
        local possiblePOIs = self.areaPOIs
        for a = 1, #activePOIs do
            for p = 1, #possiblePOIs do
                if activePOIs[a] == possiblePOIs[p] then
                    return false
                end
            end
        end
        return true
    end
})

function ElementalStorm.getters:rewards()
    local function getStormAchievement(mapID, stormType)
        return Achievement({
            id = ELEMENTAL_STORM_MOB_ACHIVEMENTS[mapID][stormType],
            criteria = {
                id = 1,
                qty = true,
                suffix = L['empowered_mobs_killed_suffix']
            }
        })
    end

    return {
        ELEMENTAL_STORM_MOB_ACHIVEMENTS['all'],
        ELEMENTAL_STORM_MANUSCRIPT_REWARDS['all'][1],
        ELEMENTAL_STORM_MANUSCRIPT_REWARDS['all'][2], Spacer(),
        Section(L['elemental_storm_thunderstorm']), -- Thunderstorm Rewards
        getStormAchievement(self.mapID, 'thunderstorm'),
        ELEMENTAL_STORM_BOSS_ACHIEVEMENTS['thunderstorm'],
        ELEMENTAL_STORM_PET_REWARDS['thunderstorm'],
        ELEMENTAL_STORM_FORMULA_REWARDS['thunderstorm'],
        ELEMENTAL_STORM_TRANSMOG_REWARDS['thunderstorm'][1],
        ELEMENTAL_STORM_TRANSMOG_REWARDS['thunderstorm'][2],
        ELEMENTAL_STORM_TRANSMOG_REWARDS['thunderstorm'][3],
        ELEMENTAL_STORM_MANUSCRIPT_REWARDS['thunderstorm'][1],
        ELEMENTAL_STORM_MANUSCRIPT_REWARDS['thunderstorm'][2],
        -- DC.RenewedProtoDrake.PurpleHair, DC.WindborneVelocidrake.SweptHorns,
        Spacer(), Section(L['elemental_storm_sandstorm']), -- Sandstorm Rewards
        getStormAchievement(self.mapID, 'sandstorm'),
        ELEMENTAL_STORM_BOSS_ACHIEVEMENTS['sandstorm'],
        ELEMENTAL_STORM_PET_REWARDS['sandstorm'],
        ELEMENTAL_STORM_FORMULA_REWARDS['sandstorm'],
        ELEMENTAL_STORM_TRANSMOG_REWARDS['sandstorm'][1],
        ELEMENTAL_STORM_TRANSMOG_REWARDS['sandstorm'][2],
        ELEMENTAL_STORM_MANUSCRIPT_REWARDS['sandstorm'][1],
        ELEMENTAL_STORM_MANUSCRIPT_REWARDS['sandstorm'][2],
        -- DC.WindborneVelocidrake.ClubTail, DC.CliffsideWylderdrake.BlackHorns,
        Spacer(), Section(L['elemental_storm_firestorm']), -- Firestorm Rewards
        getStormAchievement(self.mapID, 'firestorm'),
        ELEMENTAL_STORM_BOSS_ACHIEVEMENTS['firestorm'],
        ELEMENTAL_STORM_PET_REWARDS['firestorm'],
        ELEMENTAL_STORM_FORMULA_REWARDS['firestorm'],
        ELEMENTAL_STORM_TRANSMOG_REWARDS['firestorm'][1],
        ELEMENTAL_STORM_TRANSMOG_REWARDS['firestorm'][2],
        ELEMENTAL_STORM_TRANSMOG_REWARDS['firestorm'][3],
        ELEMENTAL_STORM_TRANSMOG_REWARDS['firestorm'][4],
        ELEMENTAL_STORM_MANUSCRIPT_REWARDS['firestorm'][1],
        ELEMENTAL_STORM_MANUSCRIPT_REWARDS['firestorm'][2],
        -- DC.RenewedProtoDrake.ImpalerHorns, DC.HighlandDrake.ToothyMouth,
        Spacer(), Section(L['elemental_storm_snowstorm']), -- Snowstorm Rewards
        getStormAchievement(self.mapID, 'snowstorm'),
        ELEMENTAL_STORM_BOSS_ACHIEVEMENTS['snowstorm'],
        ELEMENTAL_STORM_PET_REWARDS['snowstorm'],
        ELEMENTAL_STORM_FORMULA_REWARDS['snowstorm'],
        ELEMENTAL_STORM_TRANSMOG_REWARDS['snowstorm'][1],
        ELEMENTAL_STORM_TRANSMOG_REWARDS['snowstorm'][2],
        ELEMENTAL_STORM_TRANSMOG_REWARDS['snowstorm'][3],
        ELEMENTAL_STORM_MANUSCRIPT_REWARDS['snowstorm'][1],
        ELEMENTAL_STORM_MANUSCRIPT_REWARDS['snowstorm'][2],
        -- DC.HighlandDrake.FinnedBack, DC.CliffsideWylderdrake.FinnedCheek,
        Spacer(), ELEMENTAL_STORM_FORMULA_REWARDS['all']
    }
end

ns.node.ElementalStorm = ElementalStorm

hooksecurefunc(AreaPOIPinMixin, 'TryShowTooltip', function(self)
    if self and self.areaPoiID then
        local mapID = self:GetMap().mapID
        local group = ns.groups.ELEMENTAL_STORM
        local stormType = ELEMENTAL_STORM_AREA_POIS[self.areaPoiID]

        if ELEMENTAL_STORM_MOB_ACHIVEMENTS[mapID] then -- check if current map has rewards
            if stormType and group:GetDisplay(mapID) then
                local rewards = {
                    ELEMENTAL_STORM_MOB_ACHIVEMENTS['all'], Spacer(),
                    Achievement({
                        id = ELEMENTAL_STORM_MOB_ACHIVEMENTS[mapID][stormType],
                        criteria = {
                            id = 1,
                            qty = true,
                            suffix = L['empowered_mobs_killed_suffix']
                        }
                    }), ELEMENTAL_STORM_BOSS_ACHIEVEMENTS[stormType],
                    ELEMENTAL_STORM_PET_REWARDS[stormType],
                    ELEMENTAL_STORM_FORMULA_REWARDS['all'],
                    ELEMENTAL_STORM_FORMULA_REWARDS[stormType],
                    ELEMENTAL_STORM_MANUSCRIPT_REWARDS['all'][1],
                    ELEMENTAL_STORM_MANUSCRIPT_REWARDS['all'][2],
                    ELEMENTAL_STORM_MANUSCRIPT_REWARDS[stormType][1],
                    ELEMENTAL_STORM_MANUSCRIPT_REWARDS[stormType][2],
                    ELEMENTAL_STORM_TRANSMOG_REWARDS[stormType][1],
                    ELEMENTAL_STORM_TRANSMOG_REWARDS[stormType][2],
                    ELEMENTAL_STORM_TRANSMOG_REWARDS[stormType][3],
                    ELEMENTAL_STORM_TRANSMOG_REWARDS[stormType][4]
                }
                GameTooltip:AddLine(' ')
                for _, reward in ipairs(rewards) do
                    if reward and reward:IsEnabled() then
                        reward:Render(GameTooltip)
                    end
                end
                GameTooltip:Show()
            end
        end
    end
end)

-------------------------------------------------------------------------------
------------------------------ ELUSIVE CREATURES ------------------------------
-------------------------------------------------------------------------------

local ElusiveCreature = ns.Class('ElusiveCreature', ns.node.Node, {
    icon = 644271,
    requires = ns.requirement.Item(193906), -- Elusive Creature Bait
    group = ns.groups.ELUSIVE_CREATURE,
    note = L['elusive_creature_note']
}) -- Elusive Creature

ns.node.ElusiveCreature = ElusiveCreature

-- Achievement({id = 18831, criteria = 61435}) -- Elusive Beasts of the Dragon Isles - Elusive Salamanther
-- Achievement({id = 18831, criteria = 61438}) -- Elusive Beasts of the Dragon Isles - Elusive Proto Dragon
-- Achievement({id = 18831, criteria = 61440}) -- Elusive Beasts of the Dragon Isles - Elusive Lava Phoenix
-- Achievement({id = 18831, criteria = 61442}) -- Elusive Beasts of the Dragon Isles - Elusive Fiery Dreadsquall
-- Achievement({id = 18831, criteria = 61444}) -- Elusive Beasts of the Dragon Isles - Elusive Rockfang
-- Achievement({id = 18831, criteria = 61447}) -- Elusive Beasts of the Dragon Isles - Elusive Hornstrider
-- Achievement({id = 18831, criteria = 61449}) -- Elusive Beasts of the Dragon Isles - Elusive Bull
-- Achievement({id = 18831, criteria = 61451}) -- Elusive Beasts of the Dragon Isles - Elusive Ottuk
-- Achievement({id = 18831, criteria = 61453}) -- Elusive Beasts of the Dragon Isles - Elusive Magmammoth Bull
-- Achievement({id = 18831, criteria = 61455}) -- Elusive Beasts of the Dragon Isles - Elusive Prime Proto Dragon
-- Achievement({id = 18831, criteria = 61457}) -- Elusive Beasts of the Dragon Isles - Elusive Elder Rockfang
-- Achievement({id = 18831, criteria = 61459}) -- Elusive Beasts of the Dragon Isles - Elusive Rimeclaw Bear
-- Achievement({id = 18831, criteria = 61461}) -- Elusive Beasts of the Dragon Isles - Elusive Argali
-- Achievement({id = 18831, criteria = 61463}) -- Elusive Beasts of the Dragon Isles - Elusive Deepflayer
-- Achievement({id = 18831, criteria = 61465}) -- Elusive Beasts of the Dragon Isles - Elusive Viper (Lava)
-- Achievement({id = 18831, criteria = 61467}) -- Elusive Beasts of the Dragon Isles - Elusive Deepstrider
-- Achievement({id = 18831, criteria = 61469}) -- Elusive Beasts of the Dragon Isles - Elusive Viper (Rock)
-- Achievement({id = 18831, criteria = 61471}) -- Elusive Beasts of the Dragon Isles - Elusive Sulfurstrider
-- Achievement({id = 18831, criteria = 61437}) -- Elusive Beasts of the Dragon Isles - Elusive Vorquin
-- Achievement({id = 18831, criteria = 61439}) -- Elusive Beasts of the Dragon Isles - Elusive Thunder Lizard
-- Achievement({id = 18831, criteria = 61441}) -- Elusive Beasts of the Dragon Isles - Elusive Magmammoth
-- Achievement({id = 18831, criteria = 61443}) -- Elusive Beasts of the Dragon Isles - Elusive Snapdragon
-- Achievement({id = 18831, criteria = 61445}) -- Elusive Beasts of the Dragon Isles - Elusive Feral Bakar
-- Achievement({id = 18831, criteria = 61448}) -- Elusive Beasts of the Dragon Isles - Elusive Crystalspine
-- Achievement({id = 18831, criteria = 61450}) -- Elusive Beasts of the Dragon Isles - Elusive Stonegazer
-- Achievement({id = 18831, criteria = 61452}) -- Elusive Beasts of the Dragon Isles - Elusive Slyvern
-- Achievement({id = 18831, criteria = 61454}) -- Elusive Beasts of the Dragon Isles - Elusive Prime Salamanther
-- Achievement({id = 18831, criteria = 61456}) -- Elusive Beasts of the Dragon Isles - Elusive Storm Lizard
-- Achievement({id = 18831, criteria = 61458}) -- Elusive Beasts of the Dragon Isles - Elusive Elder Slyvern
-- Achievement({id = 18831, criteria = 61460}) -- Elusive Beasts of the Dragon Isles - Elusive Elder Armoredon
-- Achievement({id = 18831, criteria = 61462}) -- Elusive Beasts of the Dragon Isles - Elusive Elder Argali
-- Achievement({id = 18831, criteria = 61464}) -- Elusive Beasts of the Dragon Isles - Elusive Stoneclaw
-- Achievement({id = 18831, criteria = 61466}) -- Elusive Beasts of the Dragon Isles - Elusive Lavafang
-- Achievement({id = 18831, criteria = 61468}) -- Elusive Beasts of the Dragon Isles - Elusive Colossal Deepstrider
-- Achievement({id = 18831, criteria = 61470}) -- Elusive Beasts of the Dragon Isles - Elusive Shalefang
-- Achievement({id = 18831, criteria = 61472}) -- Elusive Beasts of the Dragon Isles - Elusive Colossal Sulfurstrider

-- Achievement({id = 18832, criteria = 61473}) -- Elusive Legend of the Dragon Isles - Elusive Elder Drake
-- X Achievement({id = 18832, criteria = 61474}) -- Elusive Legend of the Dragon Isles - Elusive Tempest Lizard
-- X Achievement({id = 18832, criteria = 61475}) -- Elusive Legend of the Dragon Isles - Elusive Deepwater Salamanther
-- X Achievement({id = 18832, criteria = 61476}) -- Elusive Legend of the Dragon Isles - Elusive Cliffdweller Vorquin
-- Achievement({id = 18832, criteria = 61477}) -- Elusive Legend of the Dragon Isles - Elusive Frenzied Amberfur
-- X Achievement({id = 18832, criteria = 61478}) -- Elusive Legend of the Dragon Isles - Elusive Crystalscale Stonecleaver
-- X Achievement({id = 18832, criteria = 61479}) -- Elusive Legend of the Dragon Isles - Elusive Elder Frigidpelt
-- X Achievement({id = 18832, criteria = 61480}) -- Elusive Legend of the Dragon Isles - Elusive Ferocious Titanfang
-- Achievement({id = 18832, criteria = 61481}) -- Elusive Legend of the Dragon Isles - Elusive Proto Skyterror
-- X Achievement({id = 18832, criteria = 61482}) -- Elusive Legend of the Dragon Isles - Elusive Flourishing Quillbloom
-- Achievement({id = 18832, criteria = 61483}) -- Elusive Legend of the Dragon Isles - Elusive Auric Argali
-- Achievement({id = 18832, criteria = 61484}) -- Elusive Legend of the Dragon Isles - Elusive Magma Cobra

-- The ones marked with a X have been added to existing Elusive Creature nodes.

-------------------------------------------------------------------------------
---------------------------- PET: MOTE OF NASZ'URO ----------------------------
-------------------------------------------------------------------------------

ns.node.MoteOfNaszuro = Class('MoteOfNaszuro', Collectible, {
    icon = 5098442,
    label = '{npc:205649}',
    rewards = {Pet({item = 206040, id = 3581})}
})

-------------------------------------------------------------------------------
--------------------------------- GRAND HUNTS ---------------------------------
-------------------------------------------------------------------------------

local GRAND_HUNT_BAG_REWARDS = {
    Mount({item = 192791, id = 1635}), -- Plainswalker Bearer
    Pet({item = 200276, id = 3311}), -- Ohuna Companion
    Pet({item = 200290, id = 3325}) -- Bakar Companion
}

local GRAND_HUNT_AREA_POIS = {
    [7089] = GRAND_HUNT_BAG_REWARDS, -- Western Ohnahran Plains Hunt
    [7090] = GRAND_HUNT_BAG_REWARDS, -- Eastern Ohnahran Plains Hunt
    [7091] = GRAND_HUNT_BAG_REWARDS, -- Southern Waking Shore
    [7092] = GRAND_HUNT_BAG_REWARDS, -- Eastern Waking Shore
    [7093] = GRAND_HUNT_BAG_REWARDS, -- Northern Waking Shore
    [7094] = GRAND_HUNT_BAG_REWARDS, -- Western Azure Span Hunt
    [7095] = GRAND_HUNT_BAG_REWARDS, -- Eastern Azure Span Hunt
    [7096] = GRAND_HUNT_BAG_REWARDS, -- Southern Azure Span Hunt
    [7097] = GRAND_HUNT_BAG_REWARDS, -- Southern Thaldrazus Hunt
    [7053] = GRAND_HUNT_BAG_REWARDS, -- Northern Ohnahran Plains Hunt
    [7099] = GRAND_HUNT_BAG_REWARDS, -- Northern Thaldraszus Hunt
    [7342] = GRAND_HUNT_BAG_REWARDS, -- Grand Hunts (Ohnahran Plains
    [7343] = GRAND_HUNT_BAG_REWARDS, -- Grand Hunts (The Waking Shore)
    [7344] = GRAND_HUNT_BAG_REWARDS, -- Grand Hunts (Thaldraszus)
    [7345] = GRAND_HUNT_BAG_REWARDS -- Grand Hunts (The Azure Span)
}

local GrandHunt = Class('GrandHunt', Collectible, {
    label = L['grand_hunts_label'],
    icon = 237377,
    group = ns.groups.GRAND_HUNTS,
    IsEnabled = function(self)
        local activePOIs = C_AreaPoiInfo.GetEventsForMap(self.mapID)
        for a = 1, #activePOIs do
            if activePOIs[a] == self.areaPOI then return false end
        end
        return true
    end
}) -- Grand Hunts

function GrandHunt.getters:rewards()
    local rewards = {
        Achievement({id = 16544}), -- Grand Hunter
        Achievement({
            id = 16541,
            criteria = {id = 1, qty = true, suffix = L['longhunter_suffix']}
        }), -- Longhunter
        Achievement({
            id = 16545,
            criteria = {
                id = 1,
                qty = true,
                suffix = L['the_best_at_what_i_do_suffix']
            }
        }), -- The Best at What I Do
        Achievement({id = 16540, criteria = self.criteria}), -- Hunt Master
        Achievement({
            id = 16543,
            criteria = {
                55746, -- Bakar Companion Color: Brown
                55747, -- Bakar Companion Color: White
                55748, -- Bakar Companion Color: Orange
                55749, -- Bakar Companion Color: Golden Brown
                55750, -- Bakar Companion Color: Black
                55751, -- Ohuna Companion Color: Red
                55752, -- Ohuna Companion Color: Dark
                55753, -- Ohuna Companion Color: Sepia
                55754 -- Ohuna Companion Color: Brown
            }
        }) -- Tetrachromancer
    }
    for k, v in pairs(GRAND_HUNT_BAG_REWARDS) do table.insert(rewards, v) end
    return rewards
end

ns.node.GrandHunt = GrandHunt

ns.hooks.areapoievent.Add(ns.groups.GRAND_HUNTS, GRAND_HUNT_AREA_POIS)

------------------------------------------------------------------------------
--------------------------- RARE VIGNETTE TOOLTIPS ---------------------------
------------------------------------------------------------------------------

hooksecurefunc(VignettePinMixin, 'OnMouseEnter', function(self)
    if select(2, C_AddOns.IsAddOnLoaded('RareScanner')) then
        local status, result = pcall(function()
            return _G['RareScannerDB'].profiles.Default.map
                       .tooltipsOnIngameIcons
        end)
        if status == true then -- Config found - we should respect it
            if result == true then return end
        else -- Config not found - we should assume its "true"
            return
        end
    end

    local map = ns.maps[WorldMapFrame:GetMapID()] or nil

    if not map then return end

    local function IsValidVignette(vignettes, vignetteID)
        for _, vignette in ipairs(vignettes) do
            if vignette == vignetteID then return true end
        end
        return false
    end

    for _, node in pairs(map.nodes) do
        if node.vignette and
            IsValidVignette(node.vignette, self:GetVignetteID()) and
            node.rewards and ns:GetOpt('show_loot') then
            node:RenderRewards(GameTooltip)
            break
        end
    end
    GameTooltip:Show()
end)

------------------------------------------------------------------------------
--------------------------------- DREAMSURGE ---------------------------------
------------------------------------------------------------------------------

local Celestine = Class('Celestine', Vendor, {
    id = 210608,
    sublabel = L['dreamsurge_sublabel'],
    note = L['celestine_vendor_note'],
    rewards = {
        Mount({item = 198824, id = 1671, count = '1000'}), -- Duskwing Ohuna
        Toy({item = 209858, count = '500'}), -- Dreamsurge Remnant
        Toy({item = 209944, count = '500'}), -- Friendsurge Defenders
        Pet({item = 205024, id = 3523, count = '250'}), -- Cheddar
        Pet({item = 205010, id = 3516, count = '250'}) -- Crimson Swoglet
    }
}) -- Celestine of the Harvest

ns.node.Celestine = Celestine

local RenewedMagmammoth = Class('RenewedMagmammoth', Collectible, {
    label = '{item:192807}',
    icon = 4034837,
    vignette = 5751,
    sublabel = L['dreamsurge_sublabel'],
    rewards = {
        Mount({item = 192807, id = 1645}) -- Renewed Magmammoth
    }
})

function RenewedMagmammoth.getters:note()
    return ns.tooltip
               .ItemStatus(209419, 20, L['renewed_magmammoth_note'], false)
end

ns.node.RenewedMagmammoth = RenewedMagmammoth

-------------------------------------------------------------------------------
---------------------------------- RICH SOIL ----------------------------------
-------------------------------------------------------------------------------

local RichSoil = Class('RichSoil', Node, {
    label = L['rich_soil_label'],
    icon = 4554355,
    group = ns.groups.RICH_SOIL,
    note = L['rich_soil_note']
}) -- Rich Soil

ns.node.RichSoil = RichSoil

-------------------------------------------------------------------------------
---------------------------------- CLUED IN -----------------------------------
-------------------------------------------------------------------------------

local CluedIn = Class('CluedIn', Collectible, {
    icon = 618973,
    note = L['clued_in_note'],
    rewards = {
        Achievement({
            id = 19787, -- Clued In
            criteria = {
                id = 1,
                qty = true,
                suffix = L['information_stuffed_clue']
            }
        })
    },
    group = ns.groups.CLUED_IN
})

ns.node.CluedIn = CluedIn

-------------------------------------------------------------------------------
-------------------------------- GOGGLE WOBBLE --------------------------------
-------------------------------------------------------------------------------

local GoggleWobble = Class('GoggleWobble', Collectible, {
    id = 207763,
    icon = 133023,
    note = L['goggle_wobble_note'],
    requires = ns.requirement.Spell(414539), -- Technoscryers
    group = ns.groups.GOGGLE_WOBBLE
}) -- Goggle Wobble

ns.node.GoggleWobble = GoggleWobble

-------------------------------------------------------------------------------
----------------------------- JUST ONE MORE THING -----------------------------
-------------------------------------------------------------------------------

local JustOneMoreThing = Class('JustOneMoreThing', Collectible, {
    questCount = true,
    icon = 1411833,
    note = L['just_one_more_thing_note'],
    group = ns.groups.JUST_ONE_MORE_THING
}) -- Just One More Thing

ns.node.JustOneMoreThing = JustOneMoreThing
