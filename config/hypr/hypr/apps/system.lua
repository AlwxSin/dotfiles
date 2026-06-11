-- Floating utility windows (Nautilus dialogs, calculator, file pickers, etc.)
local floatingClasses = "(blueberry.py|com.omarchy.Impala|com.omarchy.Wiremix|com.omarchy.Omarchy|org.gnome.NautilusPreviewer|com.gabm.satty|Omarchy|About|TUI.float)"

hl.window_rule({
    name   = "floating-utility-class",
    match  = { class = floatingClasses },
    float  = true,
    center = true,
    size   = "875 600",
})

hl.window_rule({
    name  = "floating-utility-dialog",
    match = {
        class = "(xdg-desktop-portal-gtk|sublime_text|DesktopEditors|org.gnome.Nautilus)",
        title = "^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)",
    },
    float  = true,
    center = true,
    size   = "875 600",
})

hl.window_rule({
    name  = "calculator-float",
    match = { class = "org.gnome.Calculator" },
    float = true,
})

-- Fullscreen screensaver
hl.window_rule({
    name       = "screensaver",
    match      = { class = "Screensaver" },
    fullscreen = true,
})

-- No transparency on media windows
hl.window_rule({
    name    = "no-transparency-media",
    match   = { class = "^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$" },
    opacity = "1 1",
})
