local criteria = {
    ["Human"] = 108571,
    ["Dwarf"] = 108572,
    ["NightElf"] = 108573,
    ["Gnome"] = 108574,
    ["Draenei"] = 108575,
    ["Worgen"] = 108576,
    ["VoidElf"] = 108577,
    ["LightforgedDraenei"] = 108578,
    ["DarkIronDwarf"] = 108579,
    ["KulTiran"] = 108580,
    ["Mechagnome"] = 108581,
    ["Orc"] = 108582,
    ["Scourge"] = 108583, -- Undead
    ["Tauren"] = 108584,
    ["Troll"] = 108585,
    ["BloodElf"] = 108586,
    ["Goblin"] = 108587,
    ["Nightborne"] = 108588,
    ["HighmountainTauren"] = 108589,
    ["MagharOrc"] = 108590,
    ["ZandalariTroll"] = 108591,
    ["Vulpera"] = 108592,
    ["Pandaren"] = 108593,
    ["Dracthyr"] = 108594,
    ["Earthen"] = 108595,
    ["Harronir"] = 108596 -- Haranir
}

local achievementName = select(2, GetAchievementInfo(61081))

local function Green(t) return string.format("|c%s%s|r", "FF00FF00", t) end
local function Red(t) return string.format("|c%s%s|r", "FFFF0000", t) end
local function Yellow(t) return string.format("|c%s%s|r", "FFFFFF00", t) end

local function OnTooltipSetUnit(tooltip)

    local currentMapID = C_Map.GetBestMapForUnit("player")
    if currentMapID ~= 2541 then return end

    local unit = select(2, tooltip:GetUnit())
    if not UnitExists(unit) then return end
    if not UnitIsPlayer(unit) then return end

    local race, raceKey = UnitRace(unit)

    local criteriaID = criteria[raceKey]
    if not criteriaID then return end

    local achievementString = Yellow("[" .. achievementName .. "]")
    local completed = select(3, GetAchievementCriteriaInfoByID(61081, criteriaID))
    local raceString = completed and Green(race) or Red(race)

    tooltip:AddLine(" ")
    tooltip:AddLine(string.format("%s|cFFFFFFFF:|r %s", achievementString, raceString))
    tooltip:Show()
end

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Unit, OnTooltipSetUnit)
