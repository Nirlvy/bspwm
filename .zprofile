export LIBVA_DRIVER_NAME=nvidia
export XDG_SESSION_TYPE=wayland
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1
export QT_SCREEN_SCALE_FACTORS=1

export EDITOR='nvim'
export BROWSER='microsoft-edge-stable'
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_QPA_PLATFORM=wayland
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

mkdir -p "$HOME"/.local/share/keyrings