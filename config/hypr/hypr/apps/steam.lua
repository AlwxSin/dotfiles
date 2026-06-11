-- Float Steam
hl.window_rule({
    name    = "steam-float",
    match   = { class = "steam" },
    float   = true,
    opacity = "1 1",
})

hl.window_rule({
    name  = "steam-main",
    match = { class = "steam", title = "Steam" },
    center = true,
    size   = "1100 700",
})

hl.window_rule({
    name  = "steam-friends-list",
    match = { class = "steam", title = "Friends List" },
    size  = "460 800",
})

hl.window_rule({
    name           = "steam-idleinhibit",
    match          = { class = "steam" },
    idle_inhibit   = "fullscreen",
})
