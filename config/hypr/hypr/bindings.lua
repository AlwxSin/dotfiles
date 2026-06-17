local vars = require("hypr.vars")
local mod  = vars.mainMod

-- Basic bindings
hl.bind(mod .. " + Q",     hl.dsp.exec_cmd(vars.terminal))
hl.bind(mod .. " + C",     hl.dsp.window.close())
hl.bind(mod .. " + M",     hl.dsp.exec_cmd("uwsm stop"))
hl.bind(mod .. " + E",     hl.dsp.exec_cmd(vars.fileManager))
hl.bind(mod .. " + V",     hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + space", hl.dsp.exec_cmd(vars.menu))
hl.bind(mod .. " + P",     hl.dsp.window.pseudo()) -- dwindle pseudotile
hl.bind(mod .. " + D",     hl.dsp.layout("togglesplit"))

hl.bind(mod .. " + SHIFT + CTRL + L", hl.dsp.exec_cmd("hyprctl switchxkblayout all 0 && hyprlock"))
hl.bind(mod .. " + SHIFT + R",        hl.dsp.exec_cmd("hyprctl reload"))

-- Move focus with mainMod + hjkl
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Swap window with mainMod + SHIFT + hjkl
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "left" }), { desc = "Swap window to the left" })
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "right" }), { desc = "Swap window to the right" })
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "up" }), { desc = "Swap window up" })
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "down" }), { desc = "Swap window down" })

-- Workspaces 1..10 (10 maps to key 0)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mod .. " + grave",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + grave", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move window with mainMod + LMB drag (replaces bindm)
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

-- Resize active window via "-"/"=" keys (code:20 / code:21)
hl.bind(mod .. " + code:20",         hl.dsp.window.resize({ x = -100, y = 0,   relative = true }), { desc = "Expand window left" })
hl.bind(mod .. " + code:21",         hl.dsp.window.resize({ x = 100,  y = 0,   relative = true }), { desc = "Shrink window left" })
hl.bind(mod .. " + SHIFT + code:20", hl.dsp.window.resize({ x = 0,    y = -100, relative = true }), { desc = "Shrink window up" })
hl.bind(mod .. " + SHIFT + code:21", hl.dsp.window.resize({ x = 0,    y = 100,  relative = true }), { desc = "Expand window down" })

-- Switch keyboard layouts (Alt L → us, Alt R → ru)
hl.bind("ALT_L", hl.dsp.exec_cmd("hyprctl switchxkblayout all 0"))
hl.bind("ALT_R", hl.dsp.exec_cmd("hyprctl switchxkblayout all 1"))

-- Media keys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("pamixer --increase=5 --unmute"), { repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("pamixer --decrease=5 --unmute"), { repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("pamixer --toggle-mute"))

hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set +10%"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(
    "sh -c 'cur=$(brightnessctl get); if [ \"$cur\" -le 50 ]; then brightnessctl set 10-; else brightnessctl set 10%-; fi'"
), { repeating = true })

-- Apple AirPods play/pause (bindl → locked screen)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Screenshots (grimblast + satty)
-- S            → active window → clipboard
-- CTRL+S       → region        → clipboard
-- SHIFT+S      → active window → satty → clipboard
-- CTRL+SHIFT+S → region        → satty → clipboard
hl.bind(mod .. " + S",                hl.dsp.exec_cmd("grimblast --notify --freeze copy active"))
hl.bind(mod .. " + CTRL + S",         hl.dsp.exec_cmd("grimblast --notify --freeze copy area"))
hl.bind(mod .. " + SHIFT + S",        hl.dsp.exec_cmd("sh -c 'grimblast --freeze save active - | satty --filename - --early-exit --copy-command wl-copy'"))
hl.bind(mod .. " + CTRL + SHIFT + S", hl.dsp.exec_cmd("sh -c 'grimblast --freeze save area - | satty --filename - --early-exit --copy-command wl-copy'"))
