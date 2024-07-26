#!/bin/bash

config_directory="$HOME/.config"
scripts_directory="/usr/local/bin"

green='\033[0;32m'
no_color='\033[0m'
date=$(date +%s)

sudo pacman --noconfirm --needed -Sy dialog

system_update() {
    echo -e "${green}[*] Doing a system update, cause stuff may break if it's not the latest version...${no_color}"
    sudo pacman -Sy --noconfirm archlinux-keyring
    sudo pacman --noconfirm -Syu
    sudo pacman -S --noconfirm --needed base-devel wget git curl
}

install_aur_helper() {
    if ! command -v "$aurhelper" &>/dev/null; then
        echo -e "${green}[*] It seems that you don't have $aurhelper installed, I'll install that for you before continuing.${no_color}"
        git clone https://aur.archlinux.org/"$aurhelper".git "$HOME"/.srcs/"$aurhelper"
        (cd "$HOME"/.srcs/"$aurhelper"/ && makepkg -si)
    else
        echo -e "${green}[*] It seems that you already have $aurhelper installed, skipping.${no_color}"
    fi
}
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

install_pkgs() {
    echo -e "${green}[*] Installing packages with pacman.${no_color}"
    sudo pacman -S --noconfirm --needed acpi alsa-utils base-devel curl git pulseaudio pulseaudio-alsa xorg xorg-xinit alacritty btop dunst feh firefox i3-wm libnotify nemo neofetch neovim pacman-contrib picom polybar ranger rofi scrot slop xclip zathura zathura-pdf-mupdf
}

install_aur_pkgs() {
    echo -e "${green}[*] Installing packages with $aurhelper.${no_color}"
    "$aurhelper" -S --noconfirm --needed i3-resurrect ffcast dhcpcd iwd ntfs-3g ntp pulsemixer vnstat light
}

create_default_directories() {
    echo -e "${green}[*] Copying configs to $config_directory.${no_color}"
    mkdir -p "$HOME"/.config
    sudo mkdir -p /usr/local/bin
    sudo mkdir -p /usr/share/themes
    mkdir -p "$HOME"/Pictures/wallpapers
}

create_backup() {
    echo -e "${green}[*] Creating backup of existing configs.${no_color}"
    [ -d "$config_directory"/alacritty ] && mv "$config_directory"/alacritty "$config_directory"/alacritty_"$date" && echo "alacritty configs detected, backing up."
    [ -d "$config_directory"/btop ] && mv "$config_directory"/btop "$config_directory"/btop_"$date" && echo "btop configs detected, backing up."
    [ -d "$config_directory"/dunst ] && mv "$config_directory"/dunst "$config_directory"/dunst_"$date" && echo "dunst configs detected, backing up."
    [ -d "$config_directory"/gtk-3.0 ] && mv "$config_directory"/gtk-3.0 "$config_directory"/gtk-3.0_"$date" && echo "gtk-3.0 configs detected, backing up."
    [ -d "$config_directory"/i3 ] && mv "$config_directory"/i3 "$config_directory"/i3_"$date" && echo "i3 configs detected, backing up."
    [ -d "$config_directory"/neofetch ] && mv "$config_directory"/neofetch "$config_directory"/neofetch_"$date" && echo "neofetch configs detected, backing up."
    [ -d "$config_directory"/nvim ] && mv "$config_directory"/nvim "$config_directory"/nvim_"$date" && echo "nvim configs detected, backing up."
    [ -d "$config_directory"/polybar ] && mv "$config_directory"/polybar "$config_directory"/polybar_"$date" && echo "polybar configs detected, backing up."
    [ -d "$config_directory"/ranger ] && mv "$config_directory"/ranger "$config_directory"/ranger_"$date" && echo "ranger configs detected, backing up."
    [ -d "$config_directory"/rofi ] && mv "$config_directory"/rofi "$config_directory"/rofi_"$date" && echo "rofi configs detected, backing up."
    [ -d "$config_directory"/zathura ] && mv "$config_directory"/zathura "$config_directory"/zathura_"$date" && echo "zathura configs detected, backing up."

    [ -d "$scripts_directory" ] && sudo mv "$scripts_directory" "$scripts_directory"_"$date" && echo "scripts ($scripts_directory) detected, backing up."
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
    echo -e "${green}[*] Installing fonts with $aurhelper.${no_color}"
    "$aurhelper" -S --noconfirm --needed ttf-jetbrains-mono-nerd
}

copy_other_configs() {
    echo -e "${green}[*] Copying wallpapers to ""$HOME""/Pictures/wallpapers.${no_color}"
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
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
    git clone https://github.com/fdellwing/zsh-bat.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat
    cp ./others/.zshrc ~/.zshrc
    echo -e "${green}[*] Setting Zsh as default shell.${no_color}"
    chsh -s $(which zsh)
    sudo chsh -s $(which zsh)
}

install_ibus_bamboo() {
    echo -e "${green}[*] Installing ibus-bamboo.${no_color}"
    "$aurhelper" -S --noconfirm --needed ibus ibus-bamboo-git
    dconf load /desktop/ibus/ <$HOME/.config/ibus/ibus.dconf
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
    echo -e "${green}[*] Copying vsc configs.${no_color}"
    cp ./vsc/settings.json "$HOME"/.config/Code\ -\ OSS/User
}

install_sddm() {
    echo -e "${green}[*] Installing sddm theme.${no_color}"
    "$aurhelper" -S --noconfirm --needed qt6-5compat qt6-declarative qt6-svg sddm
    sudo systemctl enable sddm.service
    sudo cp -r sddm-arch-theme /usr/share/sddm/themes
    echo "[Theme]
Current=sddm-arch-theme" | sudo tee /etc/sddm.conf
}

finishing() {
    echo -e "${green}[*] Chmoding light.${no_color}"
    sudo chmod +s /usr/bin/light

    echo -e "${green}[*] Updating nvim extensions.${no_color}"
    nvim +PackerSync
}

cmd=(dialog --clear --title "Aur helper" --menu "Firstly, select the aur helper you want to install (or have already installed)." 10 50 16)
options=(1 "yay" 2 "paru")
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

case $choices in
1) aurhelper="yay" ;;
2) aurhelper="paru" ;;
esac

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
    2) install_aur_helper ;;
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

zsh

# yay bibata-cursor-theme-bin

install_gtk_theme

install_zsh

install_ibus_bamboo

install_sddm