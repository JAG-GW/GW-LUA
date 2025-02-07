-- imgui.lua
local imgui = {}

function imgui.show_tooltip(text)
    local py_imgui = require("py_imgui")
    py_imgui.show_tooltip(text)
end

function imgui.toggle_button(label, v, width, height)
    local py_imgui = require("py_imgui")
    return py_imgui.toggle_button(label, v, width, height)
end

function imgui.floating_button(x, y, caption, width, height)
    local py_imgui = require("py_imgui")
    return py_imgui.floating_button(x, y, caption, width, height)
end

function imgui.table(title, headers, data)
    local py_imgui = require("py_imgui")
    py_imgui.table(title, headers, data)
end

function imgui.DrawTextWithTitle(title, text_content, lines_visible)
    local py_imgui = require("py_imgui")
    py_imgui.DrawTextWithTitle(title, text_content, lines_visible)
end

return imgui
