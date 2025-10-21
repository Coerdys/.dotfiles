dnf copr enable erikreider/SwayNotificationCenter -y
dnf copr enable solopasha/hyprland -y
dnf copr enable errornointernet/packages -y
dnf copr enable tofik/nwg-shell -y

dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

dnf install hyprpolkitagent -y
dnf install hyprlock -y
dnf install hypridle -y
dnf install hyprland -y
dnf install swww -y
dnf install lsd -y
dnf install nextcloud-client -y
dnf install waybar -y
dnf install helix -y
dnf install zsh -y
dnf install fastfetch -y
dnf install kitty -y
dnf install swaync -y
dnf install nwg-shell -y
dnf install fzf -y
dnf install pamixer -y
dnf install pavucontrol -y
dnf install ulauncher -y
dnf install hyprland-qtutils -y
dnf install keepassxc -y
dnf install walker -y
