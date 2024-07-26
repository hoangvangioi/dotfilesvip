# Dotfiles 

## [Watch on Youtube](https://youtu.be/tSreyGcCMB4) <img alt="" align="right" src="https://img.shields.io/github/forks/keyitdev/dotfiles?color=bf616a&labelColor=1b1b25&style=for-the-badge"/> <img alt="" align="right" src="https://img.shields.io/github/stars/keyitdev/dotfiles?color=dd864a&labelColor=1b1b25&style=for-the-badge"/>

### [Showcase](#showcase) · [Manual installation](#manual-installation) · [Detailed info](#detailed-information) · [Troubleshooting](#troubleshooting) · [Contributions](#contributions)

The **Arch Linux** & **i3wm** dotfiles! 

## Information

<img src="https://github.com/keyitdev/screenshots/blob/master/dotfiles/v3/screenshots/1.png?raw=true" alt="Rice Showcase" align="right" width="400px">

- **OS:** [Arch Linux](https://archlinux.org)
- **WM:** [i3-wm](https://i3wm.org)
- **Terminal:** [alacritty](https://github.com/alacritty/alacritty)
- **Bar:** [polybar](https://github.com/polybar/polybar)
- **Shell:** [zsh](https://www.zsh.org/)
- **Compositor:** [picom](https://github.com/yshui/picom)
- **Application Launcher:** [rofi](https://github.com/davatorium/rofi)
- **Notification Deamon:** [dunst](https://github.com/dunst-project/dunst)

## Automatic installation

```sh
git clone https://www.github.com/keyitdev/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
```
> Warning: Remember to always read the scripts you run from the internet first.

> Note: Last time I tested the installation script on 31 July 2023, Everything worked fine.

## Showcase

### neofetch 

![](https://github.com/keyitdev/screenshots/blob/master/dotfiles/v3/screenshots/1.png?raw=true)

### vsc & ncmpcpp & cava

![](https://github.com/keyitdev/screenshots/blob/master/dotfiles/v3/screenshots/2.png?raw=true)

### rofi & dunst

![](https://github.com/keyitdev/screenshots/blob/master/dotfiles/v3/screenshots/3.png?raw=true)

<details>
<summary><h3>More screenshots</h3></summary>

### nemo & nvim & ranger

![](https://github.com/keyitdev/screenshots/blob/master/dotfiles/v3/screenshots/4.png?raw=true)

### i3lock-color

![](https://github.com/keyitdev/screenshots/blob/master/dotfiles/v3/screenshots/5.png?raw=true)

### sddm

![](https://github.com/keyitdev/screenshots/blob/master/dotfiles/v3/screenshots/6.png?raw=true)

</details>
    
## Detailed information

### Dependencies

**Base:** acpi alsa-utils base-devel curl git pulseaudio pulseaudio-alsa xorg xorg-xinit 

**Required:** alacritty btop code dunst feh ffcast firefox i3-gaps i3lock-color i3-resurrect libnotify light mpc mpd ncmpcpp nemo neofetch neovim oh-my-zsh-git pacman-contrib papirus-icon-theme picom polybar ranger rofi scrot slop xclip zathura zathura-pdf-mupdf zsh

**Sddm:** qt5-graphicaleffects qt5-quickcontrols2 qt5-svg sddm

**Emoji:** fonts: noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra

### Used programs

- **Music Player:** [mpd](https://github.com/MusicPlayerDaemon/MPD) & [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp)
- **Editor:** [neovim](https://github.com/neovim/neovim) / [vscode](https://github.com/microsoft/vscode)
- **Lockscreen:** [i3lock-color](https://github.com/Raymo111/i3lock-color)
- **Display Manager:** [sddm](https://github.com/sddm/sddm)
- **File manager:** [ranger](https://github.com/ranger/ranger) / [nemo](https://github.com/linuxmint/nemo)
- **Pdf reader:** [zathura](https://github.com/pwmt/zathura)
- **Monitor of Resources:** [btop](https://github.com/aristocratos/btop)

### Used themes

- **Shell Framework:** [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
- **Vscode Theme:** [One dark pro](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme)
- **Neovim Theme:** [AstroNvim](https://github.com/kabinspace/AstroVim)
- **Icons:** [Papirus dark](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- **GTK Theme:** [Rose Pine](https://github.com/Fausto-Korpsvart/Rose-Pine-GTK-Theme)
- **Display Manager Theme:** [Sddm-flower-theme](https://github.com/keyitdev/sddm-flower-theme)
	
### Fonts
	
- **Icons:** [Feather](https://github.com/AT-UI/feather-font/blob/master/src/fonts/feather.ttf)
- **Interface Font:** [Open sans](https://fonts.google.com/specimen/Open+Sans#standard-styles)
- **Monospace Font:** [Roboto mono](https://fonts.google.com/specimen/Roboto+Mono#standard-styles)
- **Polybar Font:** [Iosevka nerd font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Iosevka)
  
### Keybinds

These are the basic keybinds. Read through the [i3](./config/i3/config) config for more keybinds.

Note: `Win` refers to the `Super/Mod` key.

|        Keybind         |                 Function                 |
| ---------------------- | ---------------------------------------- |
| `Win + Enter`          | Launch terminal (alacritty)              |
| `Win + Shift + Q`      | Close window                             |
| `Win + Q`              | Stacking layout                          |
| `Win + W`              | Tabbed layout                            |
| `Win + E`              | Default layout                           |
| `Win + R`              | Resize mode                              |
| `Win + T`              | Restore layout                           |
| `Win + Y`              | Save layout                              |
| `Win + A`              | Rofi open windows menu                   |
| `Win + S`              | Rofi full menu                           |
| `Win + D`              | Rofi menu                                |
| `Win + Z`              | Rofi bookmarks                           |
| `Win + X`              | Rofi powermenu                           |
| `Win + C`              | Rofi screenshot script                   |
| `Win + G`              | Gaps settings                            |
| `Win + V`              | Set vertical orientation                 |
| `Win + H`              | Set horizontal orientation               |
| `Win + I`              | Lock screen                              |
| `Win + O`              | Show polybar                             |
| `Win + P`              | Hide polybar                             |
| `Win + B`              | Move workspace to another monitor        |
| `Win + N`              | Dual monitor mode                        |
| `Win + M`              | Single monitor mode                      |
| `Win + arrows (jkl;)`  | Resizing, moving windows                 |
| `Win + Shift + E`      | Exit i3                                  |
| `Win + Shift + R`      | Restart i3                               |

### Colors

|        Color           | Hex code |PNG |        Color           | Hex code |PNG|
| ---------------------- | -------- |- | ---------------------- | -------- |-|
|  background            | #1b1b25  |![#1b1b25](https://placehold.co/15x15/1b1b25/1b1b25.png) |  red                   | #cb5760  |![#cb5760](https://placehold.co/15x15/cb5760/cb5760.png)|
|  background 2          | #282A36  |![#282A36](https://placehold.co/15x15/282A36/282A36.png) |  green                 | #999f63  |![#999f63](https://placehold.co/15x15/999f63/999f63.png)|
|  background 3          | #16161e  |![#16161e](https://placehold.co/15x15/16161e/16161e.png) |  yellow                | #d4a067  |![#d4a067](https://placehold.co/15x15/d4a067/d4a067.png)|
|  border                | #343746  |![#343746](https://placehold.co/15x15/343746/343746.png) |  blue                  | #6c90a8  |![#6c90a8](https://placehold.co/15x15/6c90a8/6c90a8.png)|
|  foreground            | #dedede  |![#dedede](https://placehold.co/15x15/dedede/dedede.png) |  purple                | #776690  |![#776690](https://placehold.co/15x15/776690/776690.png)|
|  white                 | #eeffff  |![#eeffff](https://placehold.co/15x15/eeffff/eeffff.png) |  cyan                  | #528a9b  |![#528a9b](https://placehold.co/15x15/528a9b/528a9b.png)|
|  gray                  | #727480  |![#727480](https://placehold.co/15x15/727480/727480.png) |   pink                  | #ffa8c5  |![#ffa8c5](https://placehold.co/15x15/ffa8c5/ffa8c5.png)|
|  black                 | #15121c  |![#15121c](https://placehold.co/15x15/15121c/15121c.png) |  orange                | #c87c3e  |![#c87c3e](https://placehold.co/15x15/c87c3e/c87c3e.png)|

## Troubleshooting

1. Some polybar modules are not working?

    - Try changing the variables. 
    - Open the polybar configuration `"$HOME"/.config/polybar/config.ini`. 
    - Found `; Change it for yourself` line. 
    - Follow the commands that are written below the `; Change it for yourself` line.

2. MPD not working?
    
    - Check if any other program is using port 6600 (http://127.0.0.1:6600/).

3. Everything is lagging? Screen is tearing?

    - Edit picom config.
    - This can be hard to solve, because if picom does not work, the whole screen may be frozen or even dark. So first try to kill the picom process.
    - (Blindly) click `Win+Enter`.
    - (Blindly) type `killall picom`.
    - (Blindly) press `Enter`.
    - (Blindly) click `Win+Shift+R`.
    - Open picom configuration `"$HOME"/.config/picom/picom.conf`. 
    - Change picom backend from `backend = "glx";` to `backend = "xrender";`.

# https://catalins.tech/zsh-plugins/
# https://commandmasters.com/commands/polybar-msg-common/#:~:text=polybar-msg%20cmd%20toggle%20Motivation%3A%20Toggling%20between%20hidden%20and,it%20is%20visible%2C%20this%20command%20will%20hide%20it.