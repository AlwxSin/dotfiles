-- Hyprland 0.55+ Lua config. See https://wiki.hypr.land/Configuring/Start/

local vars = require("hypr.vars")

------------------
---- MONITORS ----
------------------

hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = "auto", vrr = 1 })
hl.monitor({ output = vars.extMonitorRight, mode = "preferred", position = "auto-left", scale = 1.25, vrr = 1 })
hl.monitor({ output = vars.extMonitorLeft, mode = "preferred", position = "auto-left", scale = 1.25, vrr = 1 })

-------------------
---- MY PROGRAMS --
-------------------

hl.env("TERMINAL", vars.terminal)

----------------------
---- SUB-MODULES -----
----------------------

require("hypr.envs")
require("hypr.apps")
require("hypr.autostart")
require("hypr.looknfeel")
require("hypr.input")
require("hypr.bindings")
require("hypr.windows")
