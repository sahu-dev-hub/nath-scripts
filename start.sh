#!/data/data/com.termux/files/usr/bin/bash

echo -e "\033[0;32mDesktop start ho raha hai... 🚀\033[0m"

while true; do

    pkill -9 -f "termux.x11"  &>/dev/null
    pkill -9 -f "xfce4"       &>/dev/null
    pkill -9 -f "Xwayland"    &>/dev/null
    pkill -9 -f "dbus"        &>/dev/null
    pkill -9 -f "proot"       &>/dev/null

    rm -rf /data/data/com.termux/files/usr/tmp/.X1-lock      &>/dev/null
    rm -rf /data/data/com.termux/files/usr/tmp/.X11-unix/X1  &>/dev/null

    sleep 1

    termux-x11 :1 -ac &>/dev/null &

    sleep 1

    am start -n com.termux.x11/com.termux.x11.MainActivity &>/dev/null

    ubuntu <<'EOF'
        export DISPLAY=:1
        export PULSE_SERVER=127.0.0.1

        # D-Bus start karo (XFCE ke liye zaruri hai)
        eval $(dbus-launch --sh-syntax)

        # XFCE desktop launch karo
        startxfce4 >/dev/null 2>&1

        exit
EOF

    sleep 1

done
