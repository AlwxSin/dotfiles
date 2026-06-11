local vars = require("hypr.vars")

hl.on("hyprland.start", function()
    -- Bare-essentials daemons
    hl.exec_cmd("uwsm-app -- waybar")
    hl.exec_cmd("uwsm-app -- swaync")
    hl.exec_cmd("uwsm-app -- syncthing")
    hl.exec_cmd("sh -lc 'sleep 5; keepassxc'")

    -- Apps on specific workspaces, silent mode
    hl.exec_cmd("uwsm-app -- zen-browser",  { workspace = "1 silent" })
    hl.exec_cmd("Telegram",                 { workspace = "2 silent" })
    hl.exec_cmd("gtk-launch loop.desktop",  { workspace = "2 silent" })
    hl.exec_cmd(vars.terminal,              { workspace = "3 silent" })

    -- hyprpaper & hypridle moved to systemd
end)
