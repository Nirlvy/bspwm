# vscode登陆相关
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

mkdir -p "$HOME"/.local/share/keyrings

# export AWT_TOOLKIT=MToolkit
# export _JAVA_AWT_WM_NONREPARENTING=1
