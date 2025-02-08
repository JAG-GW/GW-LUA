local Party = {}

function party_instance()
    return PyParty.PyParty()
end

function GetPartyID()
    return party_instance().party_id
end

function GetPartyLeaderID()
    local players = GetPlayers()
    local leader = players[1]
    return Players.GetAgentIDByLoginNumber(leader.login_number)
end

function GetOwnPartyNumber()
    for i = 1, #GetPlayers() do
        local player_id = Players.GetAgentIDByLoginNumber(GetPlayers()[i].login_number)
        if player_id == Player.GetAgentID() then
            return i - 1
        end
    end
    return -1
end

function GetPlayers()
    return party_instance().players
end

function GetHeroes()
    return party_instance().heroes
end

function GetHenchmen()
    return party_instance().henchmen
end

function IsHardModeUnlocked()
    return party_instance().is_hard_mode_unlocked
end

function IsHardMode()
    return party_instance().is_in_hard_mode
end

function IsNormalMode()
    return not IsHardMode()
end

function GetPartySize()
    return party_instance().party_size
end

function GetPlayerCount()
    return party_instance().party_player_count
end

function GetHeroCount()
    return party_instance().party_hero_count
end

function GetHenchmanCount()
    return party_instance().party_henchman_count
end

function IsPartyDefeated()
    return party_instance().is_party_defeated
end

function IsPartyLoaded()
    return party_instance().is_party_loaded
end

function IsPartyLeader()
    return party_instance().is_party_leader
end

function SetTickasToggle(enable)
    party_instance().tick:SetTickToggle(enable)
end

function IsAllTicked()
    return party_instance().tick:IsTicked()
end

function IsPlayerTicked(login_number)
    return party_instance():GetIsPlayerTicked(login_number)
end

function SetTicked(ticked)
    party_instance().tick:SetTicked(ticked)
end

function ToggleTicked()
    local login_number = Players.GetLoginNumberByAgentID(Player.GetAgentID())
    local party_number = Players.GetPartyNumberFromLoginNumber(login_number)

    if IsPlayerTicked(party_number) then
        SetTicked(false)
    else
        SetTicked(true)
    end
end

function SetHardMode()
    if IsHardModeUnlocked() and IsNormalMode() then
        party_instance().SetHardMode(true)
    end
end

function SetNormalMode()
    if IsHardMode() then
        party_instance().SetHardMode(false)
    end
end

function SearchParty(search_type, advertisement)
    return party_instance().SearchParty(search_type, advertisement)
end

function SearchPartyCancel()
    party_instance().SearchPartyCancel()
end

function SearchPartyReply(accept)
    return party_instance().SearchPartyReply(accept)
end

function RespondToPartyRequest(party_id, accept)
    return party_instance().RespondToPartyRequest(party_id, accept)
end

function ReturnToOutpost()
    party_instance().ReturnToOutpost()
end

function LeaveParty()
    party_instance().LeaveParty()
end

local Players = {}
function Players.GetAgentIDByLoginNumber(login_number)
    return party_instance().GetAgentIDByLoginNumber(login_number)
end

function Players.GetPlayerNameByLoginNumber(login_number)
    return party_instance().GetPlayerNameByLoginNumber(login_number)
end

function Players.GetPartyNumberFromLoginNumber(login_number)
    local players = GetPlayers()
    for index, player in ipairs(players) do
        if player.login_number == login_number then
            return index - 1
        end
    end
    return -1
end

function Players.GetLoginNumberByAgentID(agent_id)
    local players = GetPlayers()
    for _, player in ipairs(players) do
        local player_id = Players.GetAgentIDByLoginNumber(player.login_number)
        if agent_id == player_id then
            return player.login_number
        end
    end
    return 0
end

function Players.InvitePlayer(agent_id_or_name)
    if type(agent_id_or_name) == "number" then
        party_instance().InvitePlayer(agent_id_or_name)
    elseif type(agent_id_or_name) == "string" then
        Player.SendChatCommand("invite " .. agent_id_or_name)
    else
        error("Invalid argument type. Must be number (ID) or string (name).")
    end
end

function Players.KickPlayer(login_number)
    party_instance().KickPlayer(login_number)
end

local Heroes = {}
function Heroes.GetHeroAgentIDByPartyPosition(hero_position)
    return party_instance().GetHeroAgentID(hero_position)
end

function Heroes.GetHeroIDByAgentID(agent_id)
    local heroes = GetHeroes()
    for _, hero in ipairs(heroes) do
        if hero.agent_id == agent_id then
            return hero.hero_id:GetID()
        end
    end
end

function Heroes.GetHeroIDByPartyPosition(hero_position)
    local heroes = GetHeroes()
    for index, hero in ipairs(heroes) do
        if index - 1 == hero_position then
            return hero.hero_id:GetID()
        end
    end
end

function Heroes.GetHeroIdByName(hero_name)
    local hero = PyParty.Hero(hero_name)
    return hero:GetId()
end

function Heroes.GetHeroNameById(hero_id)
    local hero = PyParty.Hero(hero_id)
    return hero:GetName()
end

function Heroes.GetNameByAgentID(agent_id)
    local heroes = GetHeroes()
    for _, hero in ipairs(heroes) do
        if hero.agent_id == agent_id then
            return hero.hero_id:GetName()
        end
    end
end

function Heroes.AddHero(hero_id)
    party_instance().AddHero(hero_id)
end

function Heroes.AddHeroByName(hero_name)
    local hero = PyParty.Hero(hero_name)
    party_instance().AddHero(hero:GetID())
end

function Heroes.KickHero(hero_id)
    party_instance().KickHero(hero_id)
end

function Heroes.KickHeroByName(hero_name)
    local hero = PyParty.Hero(hero_name)
    party_instance().KickHero(hero:GetID())
end

function Heroes.KickAllHeroes()
    party_instance().KickAllHeroes()
end

function Heroes.FlagHero(hero_id, x, y)
    party_instance().FlagHero(hero_id, x, y)
end

function Heroes.FlagAllHeroes(x, y)
    party_instance().FlagAllHeroes(x, y)
end

function Heroes.UnflagHero(hero_id)
    party_instance().UnflagHero(hero_id)
end

function Heroes.UnflagAllHeroes()
    party_instance().UnflagAllHeroes()
end

function Heroes.IsHeroFlagged(hero_party_number)
    return party_instance().IsHeroFlagged(hero_party_number)
end

function Heroes.IsAllFlagged()
    return party_instance().IsAllFlagged()
end

function Heroes.GetAllFlag()
    return party_instance().GetAllFlagX(), party_instance().GetAllFlagY()
end

function Heroes.SetHeroBehavior(hero_agent_id, behavior)
    party_instance().SetHeroBehavior(hero_agent_id, behavior)
end

local Henchmen = {}
function Henchmen.AddHenchman(henchman_id)
    party_instance().AddHenchman(henchman_id)
end

function Henchmen.KickHenchman(henchman_id)
    party_instance().KickHenchman(henchman_id)
end

local Pets = {}
function Pets.SetPetBehavior(behavior, lock_target_id)
    party_instance().SetPetBehavior(behavior, lock_target_id)
end

function Pets.GetPetInfo(owner_id)
    return party_instance().GetPetInfo(owner_id)
end

return Party
