# Fonts
rm JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
mkdir -p ~/.local/share/fonts/JetBrainsMonoNerd
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMonoNerd
rm JetBrainsMono.zip

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

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
