local Map = {}

function GetInstance()
    return PyMap.PyMap()
end

function IsReady()
    return GetInstance().is_map_ready
end

function IsOutpostMap()
    return GetInstance().instance_type:GetName() == "Outpost"
end

function IsExplorableMap()
    return GetInstance().instance_type:GetName() == "Explorable"
end

function IsLoading()
    return GetInstance().instance_type:GetName() == "Loading"
end

function GetName(mapid)
    if mapid == nil then
        map_id = GetID()
    else
        map_id = mapid
    end

    if explorables[map_id] then
        return explorables[map_id]
    end

    local map_id_instance = PyMap.MapID(map_id)
    return map_id_instance:GetName()
end

function GetID()
    return GetInstance().map_id:ToInt()
end

function GetOutpostIDList()
    local map_id_instance = PyMap.MapID(GetID())
    return map_id_instance:GetOutpostIDs()
end

function GetOutpostNameList()
    local map_id_instance = PyMap.MapID(GetID())
    return map_id_instance:GetOutpostNames()
end

function GetIDByName(name)
    if explorable_name_to_id[name] then
        return explorable_name_to_id[name]
    end

    local outpost_ids = GetOutpostIDList()
    local outpost_names = GetOutpostNameList()
    local outpost_name_to_id = {}
    for i, id in pairs(outpost_ids) do
        outpost_name_to_id[outpost_names[i]] = id
    end

    return outpost_name_to_id[name] or 0
end

function GetExplorableIDList()
    local ids = {}
    for id, _ in pairs(explorables) do
        table.insert(ids, id)
    end
    return ids
end

function GetExplorableNameList()
    local names = {}
    for _, name in pairs(explorables) do
        table.insert(names, name)
    end
    return names
end

function GoTo(map_id)
    GetInstance():Travel(map_id)
end

function GoToDistrict(map_id, district, district_number)
    GetInstance():Travel(map_id, district, district_number)
end

function GetUptime()
    return GetInstance().instance_time
end

function GetPartyLimit()
    return GetInstance().max_party_size
end

function IsInCutscene()
    return GetInstance().is_in_cinematic
end

function SkipCutscene()
    GetInstance():SkipCinematic()
end

function CanEnterChallenge()
    return GetInstance().has_enter_button
end

function CancelChallenge()
    GetInstance():CancelEnterChallenge()
end

function CanBeVanquished()
    return GetInstance().is_vanquishable_area
end

function GetDefeatedFoes()
    return GetInstance().foes_killed
end

function GetRemainingFoes()
    return GetInstance().foes_to_kill
end

function GetCampaignInfo()
    local campaign = GetInstance().campaign
    return campaign:ToInt(), campaign:GetName()
end

function GetContinentInfo()
    local continent = GetInstance().continent
    return continent:ToInt(), continent:GetName()
end

function GetRegionTypeInfo()
    local region_type = GetInstance().region_type
    return region_type:ToInt(), region_type:GetName()
end

function GetCurrentDistrict()
    return GetInstance().district
end

function GetRegionInfo()
    local region = GetInstance().server_region
    return region:ToInt(), region:GetName()
end

function GetLanguageInfo()
    local language = GetInstance().language
    return language:ToInt(), language:GetName()
end

function GetRegionFromDistrict(district)
    local region = GetInstance():RegionFromDistrict(district)
    return region:ToInt(), region:GetName()
end

function GetLanguageFromDistrict(district)
    local language = GetInstance():LanguageFromDistrict(district)
    return language:ToInt(), language:GetName()
end

function IsUnlocked(mapid)
    if mapid == nil then
        map_id = GetID()
    else
        map_id = mapid
    end

    local map_id_instance = PyMap.MapID(map_id)
    return map_id_instance:GetIsMapUnlocked(map_id_instance.map_id:ToInt())
end

function GetPlayerCount()
    return GetInstance().amount_of_players_in_instance
end

return Map
