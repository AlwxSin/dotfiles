mkdir -p "${XDG_DATA_HOME:-${HOME}/.local/share}/dbus-1/services"
cat > "${XDG_DATA_HOME:-${HOME}/.local/share}/dbus-1/services/org.freedesktop.secrets.service" <<EOF
[D-BUS Service]
Name=org.freedesktop.secrets
Exec=/usr/bin/keepassxc
EOF
