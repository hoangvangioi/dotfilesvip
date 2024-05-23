#!/bin/bash

config_directory="$HOME/.config"
scripts_directory="/usr/local/bin"

green='\033[0;32m'
no_color='\033[0m'
date=$(date +%s)

sudo pacman --noconfirm --needed -Sy dialog

system_update(){
    echo -e "${green}[*] Doing a system update, cause stuff may break if it's not the latest version...${no_color}"
    sudo pacman -Sy --noconfirm archlinux-keyring
    sudo pacman --noconfirm -Syu
    sudo pacman -S --noconfirm --needed base-devel wget git curl
}

install_aur_helper(){ 
    if ! command -v "$aurhelper" &> /dev/null
    then
    echo -e "${green}[*] It seems that you don't have $aurhelper installed, I'll install that for you before continuing.${no_color}"
    git clone https://aur.archlinux.org/"$aurhelper".git "$HOME"/.srcs/"$aurhelper"
    (cd "$HOME"/.srcs/"$aurhelper"/ && makepkg -si)
    else
    echo -e "${green}[*] It seems that you already have $aurhelper installed, skipping.${no_color}"
    fi
}

install_pkgs(){
    echo -e "${green}[*] Installing packages with pacman.${no_color}"
    sudo pacman -S --noconfirm --needed acpi alsa-utils base-devel curl git pulseaudio pulseaudio-alsa xorg xorg-xinit alacritty btop dunst feh firefox i3-wm libnotify light nemo neofetch neovim pacman-contrib picom polybar ranger rofi scrot slop xclip zathura zathura-pdf-mupdf
}

install_aur_pkgs(){
    echo -e "${green}[*] Installing packages with $aurhelper.${no_color}"
    "$aurhelper" -S --noconfirm --needed i3lock-color i3-resurrect ffcast dhcpcd iwd ntfs-3g ntp pulsemixer vnstat
}

create_default_directories(){
    echo -e "${green}[*] Copying configs to $config_directory.${no_color}"
    mkdir -p "$HOME"/.config
    sudo mkdir -p /usr/local/bin
    sudo mkdir -p /usr/share/themes
    mkdir -p "$HOME"/Pictures/wallpapers
}

create_backup(){
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
    
    [ -f /etc/fonts/local.conf ] && sudo mv /etc/fonts/local.conf /etc/fonts/local.conf_"$date" && echo "Fonts configs detected, backing up."
}

copy_configs(){
    echo -e "${green}[*] Copying configs to $config_directory.${no_color}"
    cp -r ./config/* "$config_directory"
}

copy_scripts(){
    echo -e "${green}[*] Copying scripts to $scripts_directory.${no_color}"
    sudo cp -r ./bin/* "$scripts_directory"
}

install_fonts(){
    echo -e "${green}[*] Installing fonts with $aurhelper.${no_color}"
    "$aurhelper" -S --noconfirm --needed ttf-jetbrains-mono-nerd
}

copy_other_configs(){
    echo -e "${green}[*] Copying wallpapers to ""$HOME""/Pictures/wallpapers.${no_color}"
    cp -r ./wallpapers/* "$HOME"/Pictures/wallpapers
}

install_gtk_theme(){
    echo -e "${green}[*] Installing gtk theme.${no_color}"
    echo -e "${green}[*] Copying gtk theme to /usr/share/themes.${no_color}"
    sudo cp -r ./Sweet-Dark-v40  /usr/share/themes/
    mkdir -p "$HOME"/.config/gtk-4.0
    sudo cp -r ./Sweet-Dark-v40/gtk-4.0/* "$HOME"/.config/gtk-4.0
}

install_zsh(){
    echo -e "${green}[*] Installing zsh.${no_color}"    
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-completions.git "${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}"/plugins/zsh-completions
    git clone https://github.com/marlonrichert/zsh-autocomplete.git "${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}"/plugins/zsh-autocomplete
    cp ./uysal.zsh-theme "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/themes
    cp ./.zshrc "$HOME"
}

install_vsc(){
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

install_sddm(){
    echo -e "${green}[*] Installing sddm theme.${no_color}"
    "$aurhelper" -S --noconfirm --needed qt5-graphicaleffects qt5-quickcontrols2 qt5-svg sddm
    sudo systemctl enable sddm.service
    sudo cp -r ./sugar-candy/ /usr/share/sddm/themes/sugar-candy
    echo "[Theme]
    Current=sugar-candy" | sudo tee /etc/sddm.conf
}

finishing(){
    echo -e "${green}[*] Chmoding light.${no_color}"
    sudo chmod +s /usr/bin/light
    echo -e "${green}[*] Setting Zsh as default shell.${no_color}"
    chsh -s /bin/zsh
    sudo chsh -s /bin/zsh
    echo -e "${green}[*] Updating nvim extensions.${no_color}"
    nvim +PackerSync
}

cmd=(dialog --clear --title "Aur helper" --menu "Firstly, select the aur helper you want to install (or have already installed)." 10 50 16)
options=(1 "yay" 2 "paru")
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

case $choices in
    1) aurhelper="yay";;
    2) aurhelper="paru";;
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

for choice in $choices
do
    case $choice in
        1) system_update;;
        2) install_aur_helper;;
        3) install_pkgs;;
        4) install_aur_pkgs;;
        5) create_default_directories;;
        6) create_backup;;
        7) copy_configs;;
        8) copy_scripts;;
        9) install_fonts;;
        10) copy_other_configs;;
        11) install_additional_pkgs;;
        12) install_emoji_fonts;;
        13) install_vsc;;
        14) install_gtk_theme;;
        15) install_sddm;;
        16) finishing;;

    esac
done



# yay bibata-cursor-theme-bin
