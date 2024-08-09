#!/bin/bash

set -e
set -x

config_directory="$HOME/.config"
scripts_directory="/usr/local/bin"
date=$(date +%s)

green='\033[0;32m'
no_color='\033[0m'

sudo pacman -S --noconfirm --needed dialog

system_update() {
    echo -e "${green}[*] Updating system...${no_color}"
    sudo pacman -Sy --noconfirm archlinux-keyring
    sudo pacman --noconfirm -Syu
    sudo pacman -S --noconfirm --needed base-devel wget git curl
}

install_yay() {
    if ! command -v yay &>/dev/null; then
        echo -e "${green}[*] Installing yay...${no_color}"
        git clone "https://aur.archlinux.org/yay.git" "$HOME/.srcs/yay"
        (cd "$HOME/.srcs/yay" && makepkg -si --noconfirm)
    else
        echo -e "${green}[*] yay is already installed.${no_color}"
    fi
}

install_pkgs() {
    echo -e "${green}[*] Installing packages with pacman...${no_color}"
    sudo pacman -S --noconfirm --needed acpi alsa-utils base-devel curl git \
        pulseaudio pulseaudio-alsa xorg xorg-xinit alacritty btop dunst feh firefox \
        i3-wm libnotify nemo neofetch bc xf86-video-intel bluez bluez-utils \
        pulseaudio-bluetooth bluez-libs openvpn networkmanager-openvpn networkmanager \
        network-manager-applet
}

install_aur_pkgs() {
    echo -e "${green}[*] Installing packages with yay...${no_color}"
    yay -S --noconfirm --needed i3lock i3-resurrect ffcast dhcpcd iwd ntfs-3g \
        ntp pulsemixer vnstat light upower maim redshift spotify playerctl \
        ttf-jetbrains-mono-nerd neovim polybar ranger rofi zathura zathura-pdf-mupdf \
        visual-studio-code-bin

    echo -e "${green}[*] Installing i3lock-color...${no_color}"
    git clone https://github.com/Raymo111/i3lock-color.git
    (cd i3lock-color && ./install-i3lock-color.sh)
    rm -rf i3lock-color
}

create_default_directories() {
    echo -e "${green}[*] Creating default directories...${no_color}"
    mkdir -p "$HOME/.config" "$HOME/Pictures/wallpapers"
    sudo mkdir -p /usr/local/bin /usr/share/themes
}

create_backup() {
    echo -e "${green}[*] Creating backup of existing configs...${no_color}"
    for dir in alacritty btop Code dunst gtk-3.0 i3 neofetch nvim polybar ranger rofi zathura; do
        if [ -d "$config_directory/$dir" ]; then
            mv "$config_directory/$dir" "$config_directory/${dir}_$date"
            echo "$dir configs backed up."
        fi
    done

    if [ -d "$scripts_directory" ]; then
        sudo mv "$scripts_directory" "$scripts_directory"_"$date"
        echo "Scripts directory backed up."
    fi
}

copy_files() {
    echo -e "${green}[*] Copying files...${no_color}"
    # [ -d "config" ] && 
    cp -r config/* "$config_directory"
    # [ -d "bin" ] && {
        sudo cp -r bin/* "$scripts_directory"
        sudo chmod +x "$scripts_directory"/*
    # }
    [ -d "wallpapers" ] && 
    cp -r wallpapers/* "$HOME/Pictures/wallpapers"
}

install_gtk_theme() {
    echo -e "${green}[*] Installing GTK theme...${no_color}"
    yay -S --noconfirm --needed bibata-cursor-theme-bin
    wget -q https://github.com/EliverLara/Sweet/releases/download/v5.0/Sweet-Dark-v40.tar.xz
    tar xvf Sweet-Dark-v40.tar.xz
    sudo mkdir -p /usr/share/themes/Sweet-Dark-v40
    sudo cp -r ./Sweet-Dark-v40/{assets,gtk-3.0,gtk-4.0,index.theme} /usr/share/themes/Sweet-Dark-v40
    rm -rf ./Sweet-Dark-v40*
    echo -e "${green}[*] Installation complete.${no_color}"
}

install_zsh() {
    echo -e "${green}[*] Installing zsh and oh-my-zsh...${no_color}"
    yay -S --noconfirm --needed zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/you-should-use
    git clone https://github.com/fdellwing/zsh-bat.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-bat
    cp ./.zshrc ~/
    echo -e "${green}[*] Setting Zsh as default shell...${no_color}"
    chsh -s "$(which zsh)"
    sudo chsh -s "$(which zsh)"
}

install_ibus_bamboo() {
    echo -e "${green}[*] Installing ibus-bamboo...${no_color}"
    yay -S --noconfirm --needed ibus ibus-bamboo-git
    dconf load /desktop/ibus/ <"$HOME/.config/ibus/ibus.dconf"
    sudo tee -a /etc/profile <<END

# Ibus bamboo
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT4_IM_MODULE=ibus
export CLUTTER_IM_MODULE=ibus
export GLFW_IM_MODULE=ibus

if ! pgrep -x "ibus-daemon" > /dev/null; then
    ibus-daemon -drx > /var/log/ibus-daemon.log 2>&1 &
fi
END
}

install_vsc() {
    echo -e "${green}[*] Installing VSCode extensions...${no_color}"
    code --install-extension zhuangtongfa.Material-theme
    code --install-extension dracula-theme.theme-dracula
    code --install-extension pkief.material-icon-theme
    code --install-extension visualstudioexptteam.intellicode-api-usage-examples
    code --install-extension visualstudioexptteam.vscodeintellicode
}

install_sddm() {
    echo -e "${green}[*] Installing SDDM theme...${no_color}"
    yay -S --noconfirm --needed qt6-5compat qt6-declarative qt6-svg sddm
    sudo systemctl enable sddm.service
    sudo cp -r sddm-arch-theme /usr/share/sddm/themes
    echo "[Theme]
Current=sddm-arch-theme" | sudo tee /etc/sddm.conf
}

cmd=(dialog --clear --separate-output --checklist "Select tasks to perform (press space to select).\\n\
Checked options are required for proper installation.\\nDo not uncheck if you are unsure." 21 80 15)


options=(1 "System update" on
    2 "Install yay (AUR helper)" on
    3 "Install basic packages" off
    4 "Install AUR packages" off
    5 "Create default directories" off
    6 "Create backup of existing configs" off
    7 "Copy configs and scripts" off
    8 "Install GTK theme" off
    9 "Install Zsh and plugins" off
    10 "Install Ibus Bamboo" off
    11 "Install VSCode extensions" off
    12 "Install SDDM theme" off)

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

clear

for choice in $choices; do
    case $choice in
    1) system_update ;;
    2) install_yay ;;
    3) install_pkgs ;;
    4) install_aur_pkgs ;;
    5) create_default_directories ;;
    6) create_backup ;;
    7) copy_files ;;
    8) install_gtk_theme ;;
    9) install_zsh ;;
    10) install_ibus_bamboo ;;
    11) install_vsc ;;
    12) install_sddm ;;
    esac
done

echo -e "${green}[*] Setup complete.${no_color}"
