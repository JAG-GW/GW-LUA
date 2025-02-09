-- LUACoreLib.lua
local LUACoreLib = {}

function SwitchMode(mode)
    print("Switching Mode to", mode)
    if mode == "hard" then
        Party.SetHardMode()
    elseif mode == "normal" then
        Party.SetNormalMode()
    end
end

-- EnterChallenge
function EnterChallenge()
    local map_instance = Map.map_instance()
    if map_instance then
        map_instance:EnterChallenge()
    else
        print("Error: map_instance is nil!")
    end
end

-- CancelChallenge
function CancelChallenge()
    local map_instance = Map.map_instance()
    if map_instance then
        map_instance:CancelChallenge()
    else
        print("Error: map_instance is nil!")
    end
end

return LUACoreLib
