local vars = require("hypr.vars")

-- Window rules
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
    name           = "magic-from-hypr",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "drag-issues",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})


-- No screenshare for sensitive apps
hl.window_rule({
    name             = "no-screen-share",
    match            = { class = "(org.keepassxc.KeePassXC|org.telegram.desktop)" },
    no_screen_share  = true,
})

-- Workspace → monitor pinning
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.workspace_rule({ workspace = "1", monitor = vars.extMonitorLeft })
hl.workspace_rule({ workspace = "2", monitor = vars.extMonitorLeft })
hl.workspace_rule({ workspace = "3", monitor = vars.extMonitorRight })
hl.workspace_rule({ workspace = "4", monitor = vars.extMonitorRight })
hl.workspace_rule({ workspace = "5", monitor = vars.extMonitorRight })
hl.workspace_rule({ workspace = "6", monitor = "0" })
