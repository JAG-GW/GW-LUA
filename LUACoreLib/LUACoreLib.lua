-- SwitchMode
function SwitchMode(mode)
    if mode == "hard" then
        Party.SetHardMode() 
    elseif mode == "normal" then
        Party.SetNormalMode()
    end
end

return {
    SwitchMode = SwitchMode,
}
