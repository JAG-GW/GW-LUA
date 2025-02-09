local LUACoreLib = require("LUACoreLib")  -- Load the dependency
local MapIDTester = {}

local enabled = false
local switch_mode_hm = false
local switch_mode_nm = false

function MapIDTester.render()
    PyImGui.begin("Extended Lua UI")

    -- Player Information
    PyImGui.text("Player Information")
    local player_id = Player.GetAgentID()
    local player_name = Agent.GetName(player_id)
    PyImGui.text("Player ID: " .. player_id)
    PyImGui.text("Name: " .. player_name)
    PyImGui.separator()

    -- Map Information
    PyImGui.text("Map Information")
    local map_id = Map.GetMapID()
    local map_name = Map.GetMapName(map_id)
    PyImGui.text("Map ID: " .. map_id)
    PyImGui.text("Map Name: " .. map_name)
    PyImGui.separator()

    -- Checkbox 
    local previous_state = enabled
    enabled = PyImGui.checkbox("Enable Feature", enabled)

    PyImGui.text("Feature Enabled: " .. tostring(enabled))
    
    if enabled and not previous_state then
        print("Checkbox clicked! Calling EnterChallenge()...")  -- Debugging
        EnterChallenge()
    end

    -- Switch Mode Checkboxes
    local new_switch_mode_hm = PyImGui.checkbox("Hard Mode", switch_mode_hm)
    local new_switch_mode_nm = PyImGui.checkbox("Normal Mode", switch_mode_nm)
    
    if new_switch_mode_hm and not switch_mode_hm then
        switch_mode_hm = true
        switch_mode_nm = false  -- Uncheck Normal Mode
        print("Switching to Hard Mode")
        SwitchMode("hard")
    elseif new_switch_mode_nm and not switch_mode_nm then
        switch_mode_nm = true
        switch_mode_hm = false  -- Uncheck Hard Mode
        print("Switching to Normal Mode")
        SwitchMode("normal")
    end
    
    PyImGui["end"]()
end

return MapIDTester