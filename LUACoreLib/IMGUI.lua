-- imgui.lua
local imgui = {}

function imgui.begin(title) 
    return PyImGui.begin(title)
end

function imgui.end_window() 
    return PyImGui.end_()
end

function imgui.text(text) 
    return PyImGui.text(text)
end

function imgui.checkbox(label, value)
    local clicked, new_value = PyImGui.checkbox(label, value)
    return new_value
end

function imgui.button(label)
    return PyImGui.button(label)
end

function imgui.input_text(label, value, max_length)
    local changed, new_value = PyImGui.input_text(label, value, max_length or 256)
    return new_value
end

-- Lua wrapper for the combo function
function combo(label, current_item, items)
    -- Convert the Lua table of items into a list for PyImGui
    local item_list = {}
    for i, item in ipairs(items) do
        table.insert(item_list, item)
    end

    -- Call the combo function from PyImGui and return the selected item index
    return PyImGui.combo(label, current_item, item_list)
end



return imgui
