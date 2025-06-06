-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local ADDON_NAME, ns = ...
local L = ns.locale
local Class = ns.Class
local Group = ns.Group
local IsInstance = ns.IsInstance
local Requirement = ns.requirement.Requirement

-------------------------------------------------------------------------------
------------------------------------ NODE -------------------------------------
-------------------------------------------------------------------------------

--[[

Base class for all displayed nodes.

    label (string): Tooltip title for this node
    sublabel (string): Oneline string to display under label
    group (Group): Options group for this node (display, scale, alpha)
    fgroup (string): A category of nodes that should be focused together
    icon (string|number): The icon texture to display
    alpha (float): The default alpha value for this type
    scale (float): The default scale value for this type
    minimap (bool): Should the node be displayed on the minimap
    parent (int|int[]): Parent map IDs to display the node on
    quest (int|int[]): Quest IDs that cause this node to disappear
    questAny (boolean): Hide node if *any* quests are true (default *all*)
    questCount (boolean): Display completed quest count as rlabel
    questDeps (int|int[]): Quest IDs that must be true to appear
    requires (str|Requirement[]): Requirements to interact or unlock
    rewards (Reward[]): Array of rewards for this node
--]]

local Node = Class('Node', nil, {
    label = UNKNOWN,
    minimap = true,
    alpha = 1,
    scale = 1,
    icon = 'default',
    group = ns.groups.MISC
})

function Node:Initialize(attrs)
    -- assign all attributes
    if attrs then for k, v in pairs(attrs) do self[k] = v end end

    -- normalize table values
    self.quest = ns.AsTable(self.quest)
    self.questDeps = ns.AsTable(self.questDeps)
    self.parent = ns.AsIDTable(self.parent)
    self.requires = ns.AsTable(self.requires, Requirement)
    self.group = ns.AsTable(self.group, Group)
    self.vignette = ns.AsTable(self.vignette)

    -- ensure proper group(s) is/are assigned
    for _, group in pairs(self.group) do
        if not IsInstance(group, Group) then
            error('group attribute must be a Group class instance: ' .. group)
        end
    end
end

--[[
Return the associated texture, scale and alpha value to pass to HandyNotes
for this node.
--]]

function Node:GetDisplayInfo(mapID, minimap)
    local icon = ns.GetIconPath(self.icon)
    local scale = self.scale * self.group[1]:GetScale(mapID) -- Get scale/alpha form first (main) group
    local alpha = self.alpha * self.group[1]:GetAlpha(mapID)

    if not minimap and WorldMapFrame.isMaximized and
        ns:GetOpt('maximized_enlarged') then
        scale = scale * 1.3 -- enlarge on maximized world map
    end

    return icon, scale, alpha
end

--[[
Return the glow POI for this node. If the node is hovered or focused, a green
glow is applyed to help highlight the node.
--]]

function Node:GetGlow(mapID, minimap, focused)
    if self.glow then
        local _, scale, alpha = self:GetDisplayInfo(mapID, minimap)
        self.glow.alpha = alpha
        self.glow.scale = scale
        if focused then
            self.glow.r, self.glow.g, self.glow.b = 0, 1, 0
        elseif self.OnClick then
            self.glow.r, self.glow.g, self.glow.b = 0, 0, 1
        else
            self.glow.r, self.glow.g, self.glow.b = 1, 1, 0
        end
        return self.glow
    end
end

--[[
Return the "collected" status of this node. A node is collected if all
associated rewards have been obtained (achievements, toys, pets, mounts).
--]]

function Node:IsCollected(type)
    for reward in self:IterateRewards() do
        if (not type or ns.IsInstance(reward, type)) and reward:IsEnabled() then
            if reward:IsObtainable() and not reward:IsObtained() then
                return false
            end
        end
    end
    return true
end

--[[
Return the "completed" state of this node. A node is completed if any or all
associated quests have been completed. The behavior of any vs all is switched
with the `questAny` attribute (default: all).

This method can also be overridden to check for some other form of completion,
such as an achievement criteria.

This method is *not* called if the "Show completed" setting is enabled.
--]]

function Node:IsCompleted()
    if self.quest and self.questAny then
        -- Completed if *any* attached quest ids are true
        for i, quest in ipairs(self.quest) do
            if C_QuestLog.IsQuestFlaggedCompleted(quest) then
                return true
            end
        end
    elseif self.quest then
        -- Completed only if *all* attached quest ids are true
        for i, quest in ipairs(self.quest) do
            if not C_QuestLog.IsQuestFlaggedCompleted(quest) then
                return false
            end
        end
        return true
    end
    return false
end

--[[
Return true if this node should be displayed.
--]]

function Node:IsEnabled()
    -- Check prerequisites
    if not self:PrerequisiteCompleted() then return false end

    -- Check completed state
    if self.group == ns.groups.QUEST or not ns:GetOpt('show_completed_nodes') then
        if self:IsCompleted() then return false end
    end

    -- Check faction
    if self.faction then
        if ns:GetOpt('ignore_faction_restrictions') then return true end
        if self.faction ~= ns.faction then return false end
    end

    -- Check class
    if self.class then
        if ns:GetOpt('ignore_class_restrictions') then return true end
        if self.class ~= ns.class then return false end
    end

    return true
end

--[[
Iterate over rewards that are enabled for this character.
--]]

function Node:IterateRewards()
    local index, reward = 0, nil
    return function()
        if not (self.rewards and #self.rewards) then return end
        repeat
            index = index + 1
            if index > #self.rewards then return end
            reward = self.rewards[index]
        until reward and reward:IsEnabled()
        return reward
    end
end

--[[
Return the prerequisite state of this node. A node has its prerequisites met if
all quests defined in the `questDeps` attribute are completed. This method can
be overridden to check for other prerequisite criteria.
--]]

function Node:PrerequisiteCompleted()
    -- Prerequisite not met if any dependent quest ids are false
    if not self.questDeps then return true end
    for i, quest in ipairs(self.questDeps) do
        if not C_QuestLog.IsQuestFlaggedCompleted(quest) then
            return false
        end
    end
    return true
end

--[[
Prepare this node for display by fetching localization information for anything
referenced in the text attributes of this node. This method is called when a
world map containing this node is opened.
--]]

function Node:Prepare()
    -- verify chosen icon exists
    if type(self.icon) == 'string' and ns.icons[self.icon] == nil then
        error('unknown icon: ' .. self.icon)
    end

    -- initialize glow POI (if glow icon available)

    if not self.glow then
        local icon = ns.GetGlowPath(self.icon)
        if icon then self.glow = ns.poi.Glow({icon = icon}) end
    end

    ns.PrepareLinks(self.label)
    ns.PrepareLinks(self.sublabel)
    ns.PrepareLinks(self.location)
    ns.PrepareLinks(self.note)
    ns.PrepareLinks(self.rlabel)

    if self.requires then
        for i, req in ipairs(self.requires) do
            if IsInstance(req, Requirement) then
                ns.PrepareLinks(req:GetText())
            else
                ns.PrepareLinks(req)
            end
        end
    end

    if self.rewards then
        for i, reward in ipairs(self.rewards) do reward:Prepare() end
    end
end

--[[
Render this node onto the given tooltip. Many features are optional depending
on the attributes set on this specific node, such as setting an `rlabel` or
`sublabel` value.
--]]

function Node:Render(tooltip, focusable)
    -- render the label text with NPC names resolved
    tooltip:SetText(ns.RenderLinks(self.label, true))

    local color, text
    local rlabel = self.rlabel or ''

    if self.questCount and self.quest and #self.quest then
        -- set rlabel to a (completed / total) display for quest ids
        local count = 0
        for i, quest in ipairs(self.quest) do
            if C_QuestLog.IsQuestFlaggedCompleted(quest) then
                count = count + 1
            end
        end
        color = (count == #self.quest) and ns.status.Green or ns.status.Gray
        rlabel = rlabel .. ' ' .. color(tostring(count) .. '/' .. #self.quest)
    end

    if self.faction then
        rlabel = rlabel .. ' ' ..
                     ns.GetIconLink(self.faction:lower(), 16, 1, -1)
    end

    if focusable then
        -- add an rlabel hint to use left-mouse to focus the node
        local focus = ns.GetIconLink('left_mouse', 12) ..
                          ns.status.Gray(L['focus'])
        rlabel = (#rlabel > 0) and focus .. ' ' .. rlabel or focus
    end

    if self.OnClick then
        local click = ns.GetIconLink('left_mouse', 12)
        rlabel = click .. ' ' .. ns.status.Gray(self.clabel) or click
    end

    -- render top-right label text
    if #rlabel > 0 then
        local rtext = _G[tooltip:GetName() .. 'TextRight1']
        rtext:SetTextColor(1, 1, 1)
        rtext:SetText(ns.RenderLinks(rlabel, true))
        rtext:Show()
    end

    -- optional text directly under sublabel/label for development notes
    if self.devnote and ns:GetOpt('development') then
        tooltip:AddLine(ns.RenderLinks(self.devnote), 1, 0, 1)
    end
    -- optional text directly under sublabel/label for development notes
    if self.areaPOI and ns:GetOpt('development') then
        tooltip:AddLine(ns.RenderLinks('Poi ID: ' .. self.areaPOI), 0.58, 0.43,
            0.84)
    end

    -- optional text directly under label
    if self.sublabel then
        tooltip:AddLine(ns.RenderLinks(self.sublabel, true), 1, 1, 1)
    end

    -- display item, spell or other requirements
    if self.requires then
        for i, req in ipairs(self.requires) do
            if IsInstance(req, Requirement) then
                color = req:IsMet() and ns.color.White or ns.color.Red
                text = color(L['requires'] .. ' ' .. req:GetText())
            else
                text = ns.color.Red(L['requires'] .. ' ' .. req)
            end
            tooltip:AddLine(ns.RenderLinks(text, true))
        end
    end

    -- additional text for the node to describe where the object or
    -- rare can be found
    if self.location and ns:GetOpt('show_notes') then
        if self.requires or self.sublabel then
            GameTooltip_AddBlankLineToTooltip(tooltip)
        end
        tooltip:AddLine(ns.RenderLinks(self.location), 1, 1, 1, true)
    end

    -- adds text if the node spawns in a specific rotation
    if self.interval then
        if self.requires or self.sublabel or self.location then
            GameTooltip_AddBlankLineToTooltip(tooltip)
        end
        tooltip:AddLine(ns.RenderLinks(self.interval:GetText()), 1, 1, 1, true)
    end

    -- additional text for the node to describe how to interact with the
    -- object or summon the rare
    if self.note and ns:GetOpt('show_notes') then
        if self.requires or self.sublabel or self.location or self.interval then
            GameTooltip_AddBlankLineToTooltip(tooltip)
        end
        tooltip:AddLine(ns.RenderLinks(self.note), 1, 1, 1, true)
    end

    -- all rewards (achievements, pets, mounts, toys, quests) that can be
    -- collected or completed from this node
    if self.rewards and ns:GetOpt('show_loot') then
        self:RenderRewards(tooltip)
    end

    if self.spellID then
        local spell = Spell:CreateFromSpellID(self.spellID)
        self.cancelSpellDataCallback = spell:ContinueWithCancelOnSpellLoad(
            function()
                GameTooltip_AddBlankLineToTooltip(tooltip)
                EmbeddedItemTooltip_SetSpellWithTextureByID(tooltip.ItemTooltip,
                    self.spellID, spell:GetSpellTexture())
                self.cancelSpellDataCallback = nil
            end);
    end
end

function Node:RenderRewards(tooltip)
    local firstAchieve, firstOther = true, true
    for reward in self:IterateRewards() do
        -- Add a blank line between achievements and other rewards
        local isAchieve = ns.IsInstance(reward, ns.reward.Achievement)
        local isSpacer = ns.IsInstance(reward, ns.reward.Spacer)
        if isAchieve and firstAchieve then
            tooltip:AddLine(' ')
            firstAchieve = false
        elseif not (isAchieve or isSpacer) and firstOther then
            tooltip:AddLine(' ')
            firstOther = false
        end

        reward:Render(tooltip)
    end
end

function Node:Unrender(tooltip)
    if self.cancelSpellDataCallback then
        self.cancelSpellDataCallback()
        self.cancelSpellDataCallback = nil
    end
end

-------------------------------------------------------------------------------
--------------------------------- COLLECTIBLE ---------------------------------
-------------------------------------------------------------------------------

local Collectible = Class('Collectible', Node)

function Collectible.getters:label()
    if self.id then return ('{npc:%d}'):format(self.id) end
    if self.item then return ('{item:%d}'):format(self.item) end
    for reward in self:IterateRewards() do
        if IsInstance(reward, ns.reward.Achievement) then
            return GetAchievementCriteriaInfoByID(reward.id,
                reward.criteria[1].id) or UNKNOWN
        end
    end
    return UNKNOWN
end

function Collectible:IsCompleted()
    if self:IsCollected() then return true end
    return Node.IsCompleted(self)
end

-------------------------------------------------------------------------------
------------------------------------ INTRO ------------------------------------
-------------------------------------------------------------------------------

local Intro = Class('Intro', Node, {
    icon = 'quest_ay',
    scale = 3,
    group = ns.groups.QUEST,
    minimap = false
})

function Intro:Initialize(attrs)
    Node.Initialize(self, attrs)
    if self.quest then
        C_QuestLog.GetTitleForQuestID(self.quest[1]) -- fetch info from server
    end
end

function Intro.getters:label()
    if self.quest then
        return C_QuestLog.GetTitleForQuestID(self.quest[1]) or UNKNOWN
    end
    return UNKNOWN
end

-------------------------------------------------------------------------------
------------------------------------ ITEM -------------------------------------
-------------------------------------------------------------------------------

local Item = Class('Item', Node, {icon = 454046})

function Item:Initialize(attrs)
    Node.Initialize(self, attrs)
    if not self.id then error('id required for Item nodes') end

    if not self.icon then
        self.icon = 454046 -- temp loading icon
        local item = _G.Item:CreateFromItemID(self.id)
        if not item:IsItemEmpty() then
            item:ContinueOnItemLoad(function()
                self.icon = item:GetItemIcon()
            end)
        end
    end
end

function Item:IsCompleted()
    if ns.PlayerHasItem(self.id) then return true end
    return Node.IsCompleted(self)
end

function Item:Render(tooltip, focusable)
    Node.Render(self, tooltip, focusable)
    GameTooltip_AddBlankLineToTooltip(tooltip)
    EmbeddedItemTooltip_SetItemByID(tooltip.ItemTooltip, self.id)
end

function Item.getters:label() return ('{item:%d}'):format(self.id) end

-------------------------------------------------------------------------------
------------------------------------- NPC -------------------------------------
-------------------------------------------------------------------------------

local NPC = Class('NPC', Node)

function NPC:Initialize(attrs)
    Node.Initialize(self, attrs)
    if not self.id then error('id required for NPC nodes') end
end

function NPC.getters:label() return ('{npc:%d}'):format(self.id) end

-------------------------------------------------------------------------------
---------------------------------- PETBATTLE ----------------------------------
-------------------------------------------------------------------------------

local PetBattle = Class('PetBattle', NPC, {
    icon = 'paw_y',
    scale = 1.2,
    group = ns.groups.PETBATTLE
})

-------------------------------------------------------------------------------
------------------------------------ QUEST ------------------------------------
-------------------------------------------------------------------------------

local Quest = Class('Quest', Node,
    {note = AVAILABLE_QUEST, group = ns.groups.QUEST})

function Quest:Initialize(attrs)
    Node.Initialize(self, attrs)
    C_QuestLog.GetTitleForQuestID(self.quest[1]) -- fetch info from server
end

function Quest.getters:icon() return self.daily and 'quest_ab' or 'quest_ay' end

function Quest.getters:label()
    return C_QuestLog.GetTitleForQuestID(self.quest[1]) or UNKNOWN
end

-------------------------------------------------------------------------------
------------------------------------ RARE -------------------------------------
-------------------------------------------------------------------------------

local Rare = Class('Rare', NPC, {scale = 1.2, group = ns.groups.RARE})

function Rare.getters:icon()
    if self:IsCollected() then
        return 'skull_w'
    elseif not self:IsCollected(ns.reward.Reputation) then
        return 'skull_p'
    else
        return 'skull_b'
    end
end

function Rare.getters:label()
    local label = NPC.getters.label(self)
    if ns:GetOpt('show_npc_id') then
        label = label .. ' (' .. ns.color.White(self.id) .. ')'
    end
    return label
end

function Rare:IsEnabled()
    if ns:GetOpt('hide_done_rares') and self:IsCollected() then return false end
    return NPC.IsEnabled(self)
end

-------------------------------------------------------------------------------
------------------------------- SKYRIDING RACE --------------------------------
-------------------------------------------------------------------------------

local SkyridingRace = Class('SkyridingRace', Collectible,
    {icon = 1100022, group = ns.groups.SKYRIDING_RACE})

local SKYRIDING_RACE_TYPES = {
    [1] = {type = 'normal', label = L['sr_normal']},
    [2] = {type = 'advanced', label = L['sr_advanced']},
    [3] = {type = 'reverse', label = L['sr_reverse']},
    [4] = {type = 'challenge', label = L['sr_challenge']},
    [5] = {type = 'reverseChallenge', label = L['sr_reverse_challenge']},
    [6] = {type = 'stormRace', label = L['sr_storm_race']}
}

-- DRAGONFLIGHT ONLY: Storm Races were unlocked once a player had the
-- Algarian Stormrider mount from [Heroic Edition: Algarian Stormrider]
function SkyridingRace.CanAddRace(raceType)
    if raceType == 'stormRace' then
        local unlocked = select(4, GetAchievementInfo(19027))
        return unlocked and true or false
    end
    return true
end

function SkyridingRace.getters:sublabel()
    local hasRaceType = false
    local note = L['sr_best_time']
    local txt = L['sr_your_best_time']
    for _, race in ipairs(SKYRIDING_RACE_TYPES) do
        if self[race.type] then
            local currencyID = self[race.type][1]
            local label = race.label
            local time = currencyID and
                             C_CurrencyInfo.GetCurrencyInfo(currencyID).quantity or
                             0

            txt = txt .. '\n' .. format(note, label, time / 1000)
            hasRaceType = true
        end
    end
    return hasRaceType and txt or nil
end

function SkyridingRace.getters:note()
    local hasRaceType = false
    local Silver = ns.color.Silver
    local Gold = ns.color.Gold
    local note = L['sr_target_time']
    local txt = L['sr_your_target_time']
    for _, race in ipairs(SKYRIDING_RACE_TYPES) do
        if self[race.type] then
            local label = race.label
            -- SILVER
            local hasSilverTime = false
            local sTime = self[race.type][2]
            if sTime ~= nil and sTime ~= 0 then
                sTime = Silver(sTime)
                hasSilverTime = true
            end
            -- GOLD
            local hasGoldTime = false
            local gTime = self[race.type][3]
            if gTime ~= nil and gTime ~= 0 then
                gTime = Gold(gTime)
                hasGoldTime = true
            end
            if hasSilverTime and hasGoldTime then
                if self.CanAddRace(race.type) then
                    txt = txt .. '\n' .. format(note, label, sTime, gTime)
                    hasRaceType = true
                end
            end
        end
    end
    txt = txt .. '\n\n' .. L['sr_bronze']
    return hasRaceType and txt or nil
end

-------------------------------------------------------------------------------
---------------------------------- TREASURE -----------------------------------
-------------------------------------------------------------------------------

local Treasure = Class('Treasure', Node, {
    icon = 'chest_gy',
    scale = 1.3,
    group = ns.groups.TREASURE
})

function Treasure.getters:label()
    for reward in self:IterateRewards() do
        if IsInstance(reward, ns.reward.Achievement) then
            return GetAchievementCriteriaInfoByID(reward.id,
                reward.criteria[1].id) or UNKNOWN
        end
    end
    return UNKNOWN
end

function Treasure:IsEnabled()
    if ns:GetOpt('hide_done_treasures') and self:IsCollected() then
        return false
    end
    return Node.IsEnabled(self)
end

-------------------------------------------------------------------------------
----------------------------------- VENDOR ------------------------------------
-------------------------------------------------------------------------------

local Vendor = Class('Vendor', Collectible,
    {icon = 'bag', scale = 1.35, group = ns.groups.VENDOR})

-------------------------------------------------------------------------------
------------------------------- Interval Class --------------------------------
-------------------------------------------------------------------------------

local Interval = Class('Interval')

function Interval:Initialize(attrs)
    if attrs then for k, v in pairs(attrs) do self[k] = v end end

    local region_initial = {
        [1] = self.initial.us,
        [2] = self.initial.kr or self.initial.tw,
        [3] = self.initial.eu,
        [4] = self.initial.cn
    } -- https://warcraft.wiki.gg/wiki/API_GetCurrentRegion

    if self.id then
        self.SpawnTime = self.id * self.offset +
                             (region_initial[GetCurrentRegion()] or
                                 self.initial.us)
    end
end

function Interval:Next()
    if not (self.id and self.initial and self.interval) then return false end
    local CurrentTime = GetServerTime()
    local SpawnTime = self.SpawnTime

    local NextSpawn = SpawnTime +
                          math.ceil((CurrentTime - SpawnTime) / self.interval) *
                          self.interval
    local TimeLeft = NextSpawn - CurrentTime

    return NextSpawn, TimeLeft
end

function Interval:GetText()
    local TimeFormat = ns:GetOpt('use_standard_time') and self.format_12hrs or
                           self.format_24hrs

    local NextSpawn, TimeLeft = self:Next()

    local SpawnsIn = TimeLeft <= 60 and L['now'] or
                         SecondsToTime(TimeLeft, true, true)

    if self.yellow and self.green then
        local color = ns.color.Orange
        if TimeLeft < self.yellow then color = ns.color.Yellow end
        if TimeLeft < self.green then color = ns.color.Green end
        SpawnsIn = color(SpawnsIn)
    end

    local text = format('%s (%s)', SpawnsIn, date(TimeFormat, NextSpawn))
    if self.text then text = format(self.text, text) end
    ns.PrepareLinks(text)
    return text
end

-------------------------------------------------------------------------------

ns.node = {
    Collectible = Collectible,
    SkyridingRace = SkyridingRace,
    Intro = Intro,
    Item = Item,
    Node = Node,
    NPC = NPC,
    PetBattle = PetBattle,
    Quest = Quest,
    Rare = Rare,
    Treasure = Treasure,
    Vendor = Vendor
}

ns.Interval = Interval
