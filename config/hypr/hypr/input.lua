hl.config({
    input = {
        kb_layout         = "us,ru",
        kb_variant        = "",
        kb_model          = "",
        kb_options        = "",
        kb_rules          = "",

        follow_mouse      = 1,
        sensitivity       = 0, -- -1.0 ... 1.0
        repeat_rate       = 50,
        repeat_delay      = 200,
        numlock_by_default = true,

        touchpad = {
            natural_scroll = false,
            -- clickfinger_behavior = true,
        },
    },
})

-- Per-device configs
hl.device({
    name      = "mx-keys-keyboard",
    kb_layout = "us,ru",
    -- kb_options = "grp:lalt_toggle",
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- Scroll nicely in the terminal
hl.window_rule({
    name  = "nice-scroll-alacritty-kitty",
    match = { class = "(Alacritty|kitty)" },
    scroll_touchpad = 1.5,
})

hl.window_rule({
    name  = "nice-scroll-ghostty",
    match = { class = "com.mitchellh.ghostty" },
    scroll_touchpad = 0.2,
})
