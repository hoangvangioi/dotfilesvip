#!/bin/bash

set -e

config_directory="$HOME/.config"
scripts_directory="/usr/local/bin"
aurhelper="yay"
date=$(date +%s)

green='\033[0;32m'
no_color='\033[0m'

system_update() {
    echo -e "${green}[*] Doing a system update...${no_color}"
    sudo pacman --noconfirm --needed -Sy dialog
    sudo pacman -Sy --noconfirm archlinux-keyring
    sudo pacman --noconfirm -Syu
    sudo pacman -S --noconfirm --needed base-devel wget git curl
}

install_yay() {
    if ! command -v "$aurhelper" &>/dev/null; then
        echo -e "${green}[*] Installing $aurhelper...${no_color}"
        git clone "https://aur.archlinux.org/${aurhelper}.git" "$HOME/.srcs/${aurhelper}"
        (cd "$HOME/.srcs/${aurhelper}" && makepkg -si --noconfirm)
    else
        echo -e "${green}[*] $aurhelper is already installed.${no_color}"
    fi
}

install_pkgs() {
    echo -e "${green}[*] Installing packages with pacman.${no_color}"
    sudo pacman -S --noconfirm --needed acpi alsa-utils base-devel curl git pulseaudio pulseaudio-alsa xorg xorg-xinit alacritty btop dunst feh firefox i3-wm libnotify nemo neofetch neovim pacman-contrib picom polybar ranger rofi scrot slop xclip zathura zathura-pdf-mupdf
}

install_aur_pkgs() {
    echo -e "${green}[*] Installing packages with yay.${no_color}"
    yay -S --noconfirm --needed i3lock i3-resurrect ffcast dhcpcd iwd ntfs-3g ntp pulsemixer vnstat light upower bibata-cursor-theme-bin

    # install i3lock-color
    git clone https://github.com/Raymo111/i3lock-color.git
    (cd i3lock-color && ./install-i3lock-color.sh)
    rm -rf i3lock-color
}

create_default_directories() {
    echo -e "${green}[*] Creating default directories.${no_color}"
    mkdir -p "$HOME"/.config
    sudo mkdir -p /usr/local/bin
    sudo mkdir -p /usr/share/themes
    mkdir -p "$HOME"/Pictures/wallpapers
}

create_backup() {
    echo -e "${green}[*] Creating backup of existing configs.${no_color}"
    for dir in alacritty btop Code dunst gtk-3.0 i3 neofetch nvim polybar ranger rofi zathura; do
        if [ -d "$config_directory/$dir" ]; then
            mv "$config_directory/$dir" "$config_directory/${dir}_$date"
            echo "$dir configs detected, backing up."
        fi
    done

    if [ -d "$scripts_directory" ]; then
        sudo mv "$scripts_directory" "$scripts_directory"_"$date"
        echo "Scripts directory detected, backing up."
    fi
}

copy_configs() {
    echo -e "${green}[*] Copying configs to $config_directory.${no_color}"
    cp -r ./config/* "$config_directory"
}

copy_scripts() {
    echo -e "${green}[*] Copying scripts to $scripts_directory.${no_color}"
    sudo cp -r ./bin/* "$scripts_directory"
}

install_fonts() {
    echo -e "${green}[*] Installing fonts with yay.${no_color}"
    yay -S --noconfirm --needed ttf-jetbrains-mono-nerd
}

copy_other_configs() {
    echo -e "${green}[*] Copying wallpapers to $HOME/Pictures/wallpapers.${no_color}"
    cp -r ./wallpapers/* "$HOME"/Pictures/wallpapers
}

install_gtk_theme() {
    echo -e "${green}[*] Installing gtk theme.${no_color}"
    wget -q https://github.com/EliverLara/Sweet/releases/download/v5.0/Sweet-Dark-v40.tar.xz
    tar xvf Sweet-Dark-v40.tar.xz
    sudo mkdir -p /usr/share/themes/Sweet-Dark-v40
    sudo cp -r ./Sweet-Dark-v40/{assets,gtk-3.0,gtk-4.0,index.theme} /usr/share/themes/Sweet-Dark-v40
    rm -rf ./Sweet-Dark-v40*
    echo -e "${green}[*] Installation complete.${no_color}"
}

install_zsh() {
    echo -e "${green}[*] Installing zsh and oh-my-zsh...${no_color}"
    "$aurhelper" -S --noconfirm --needed zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/you-should-use
    git clone https://github.com/fdellwing/zsh-bat.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-bat
    cp ./.zshrc ~/
    echo -e "${green}[*] Setting Zsh as default shell.${no_color}"
    chsh -s "$(which zsh)"
    sudo chsh -s "$(which zsh)"
}

install_ibus_bamboo() {
    echo -e "${green}[*] Installing ibus-bamboo.${no_color}"
    "$aurhelper" -S --noconfirm --needed ibus ibus-bamboo-git
    dconf load /desktop/ibus/ <"$HOME"/.config/ibus/ibus.dconf
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
    echo -e "${green}[*] Installing vsc extensions.${no_color}"
    code --install-extension zhuangtongfa.Material-theme
    code --install-extension dracula-theme.theme-dracula
    code --install-extension pkief.material-icon-theme
    code --install-extension ms-python.python
    code --install-extension ms-python.vscode-pylance
    code --install-extension visualstudioexptteam.intellicode-api-usage-examples
    code --install-extension visualstudioexptteam.vscodeintellicode
    code --install-extension zhuangtongfa.Material-theme
}

install_sddm() {
    echo -e "${green}[*] Installing sddm theme.${no_color}"
    "$aurhelper" -S --noconfirm --needed qt6-5compat qt6-declarative qt6-svg sddm
    sudo systemctl enable sddm.service
    sudo cp -r sddm-arch-theme /usr/share/sddm/themes
    echo "[Theme]
Current=sddm-arch-theme" | sudo tee /etc/sddm.conf
}
# xss-lock --transfer-sleep-lock -- i3lock --nofork

finishing() {
    echo -e "${green}[*] Finalizing setup...${no_color}"
    sudo pacman -Scc --noconfirm

    # echo -e "${green}[*] Chmoding light.${no_color}"
    # sudo chmod +s /usr/bin/light
    # echo -e "${green}[*] All Done!${no_color}"
}

cmd=(dialog --clear --separate-output --checklist "Select (with space) what script should do.\\nChecked options are required for proper installation, do not uncheck them if you do not know what you are doing." 26 86 16)
options=(1 "System update" on
    2 "Install aur helper" on
    3 "Install basic packages" on
    4 "Install basic packages (aur)" on
    5 "Create default directories" on
    6 "Create backup of existing configs (to prevent overwritting)" on
    7 "Copy configs" on
    8 "Copy scripts" on
    9 "Install fonts" on
    10 "Copy other configs (gtk theme, wallpaper, vsc configs, zsh configs)" on
    13 "Install vsc theme" on
    14 "Install gtk theme" on
    15 "Install sddm theme" on
    16 "Make Light executable, set zsh as default shell, update nvim extensions." on
)
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
    7) copy_configs ;;
    8) copy_scripts ;;
    9) install_fonts ;;
    10) copy_other_configs ;;
    11) install_additional_pkgs ;;
    12) install_emoji_fonts ;;
    13) install_vsc ;;
    14) install_gtk_theme ;;
    15) install_sddm ;;
    16) finishing ;;

    esac
done
