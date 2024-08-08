# Dotfiles for Arch Linux & i3-wm

Welcome to the ultimate Arch Linux setup with i3-wm. This guide will help you install, configure, and customize your environment.

---

## System Configuration

| **Component**            | **Details**                                           |
|--------------------------|-------------------------------------------------------|
| **Operating System**     | [Arch Linux](https://archlinux.org)                   |
| **Window Manager**       | [i3-wm](https://i3wm.org)                             |
| **Terminal Emulator**    | [Alacritty](https://github.com/alacritty/alacritty)   |
| **Status Bar**           | [Polybar](https://github.com/polybar/polybar)         |
| **Shell**                | [Zsh](https://www.zsh.org/)                           |
| **Application Launcher** | [Rofi](https://github.com/davatorium/rofi)            |
| **Notification Daemon**  | [Dunst](https://github.com/dunst-project/dunst)       |
| **Text Editor**          | [Neovim](https://neovim.io)                           |
| **Display Manager**      | [SDDM](https://github.com/sddm/sddm)                  |
| **Code Editor**          | [Visual Studio Code](https://code.visualstudio.com/)  |
| **Input Method**         | [IBus](https://github.com/ibus/ibus)                  |
| **System Info**          | [Neofetch](https://github.com/dylanaraps/neofetch)    |
| **System Monitor**       | [btop](https://github.com/aristocratos/btop)          |

---

## Showcase

**See the environment in action:**

| **Feature**                  | **Screenshot**                                        |
|------------------------------|-------------------------------------------------------|
| **neofetch**                 | ![](https://github.com/keyitdev/screenshots/blob/master/dotfiles/v3/screenshots/1.png?raw=true) |
| **vsc, ncmpcpp, & cavaz**    | ![](https://github.com/keyitdev/screenshots/blob/master/dotfiles/v3/screenshots/2.png?raw=true) |
| **rofi & dunst**             | ![](https://github.com/keyitdev/screenshots/blob/master/dotfiles/v3/screenshots/3.png?raw=true) |
| **nemo, nvim, & ranger**     | ![](https://github.com/keyitdev/screenshots/blob/master/dotfiles/v3/screenshots/4.png?raw=true) |
| **i3lock-color**             | ![](https://github.com/keyitdev/screenshots/blob/master/dotfiles/v3/screenshots/5.png?raw=true) |
| **sddm**                     | ![](https://github.com/keyitdev/screenshots/blob/master/dotfiles/v3/screenshots/6.png?raw=true) |

---

## Installation

You can choose one of the following methods to install:

### Git-Based Installation

1. **Clone the Repository**

    ```sh
    git clone https://github.com/hoangvangioi/dotfiles.git
    cd dotfiles
    ```

2. **Run the Installation Script**

    ```sh
    chmod +x install.sh
    ./install.sh
    ```
    > **Note:** This method requires `git`. Install it with `sudo pacman -S git`.

### Curl-Based Installation

1. **Run the Installation Script**

    ```sh
    curl -LsS https://raw.githubusercontent.com/hoangvangioi/dotfilesvip/main/install.sh | bash
    ```
    > **Note:** This method requires `curl`. Install it with `sudo pacman -S curl`.

---

## Keybindings

Below are the basic keybindings. For more keybindings, refer to the [i3 configuration file](./config/i3/config).

*Note: `Win` refers to the `Super/Mod` key.*

|        Keybinding         |                 Function                 |
|---------------------------|------------------------------------------|
| `Win + Enter`             | Launch terminal (alacritty)              |
| `Win + Shift + Q`         | Close window                             |
| `Win + Q`                 | Switch to stacking layout                |
| `Win + W`                 | Switch to tabbed layout                  |
| `Win + E`                 | Switch to default layout                 |
| `Win + R`                 | Enter resize mode                        |
| `Win + T`                 | Restore layout                           |
| `Win + Y`                 | Save layout                              |
| `Win + A`                 | Open rofi window menu                    |
| `Win + S`                 | Open rofi full menu                      |
| `Win + D`                 | Open rofi menu                           |
| `Win + Z`                 | Open rofi bookmarks                      |
| `Win + X`                 | Open rofi power menu                     |
| `Win + C`                 | Run rofi screenshot script               |
| `Win + G`                 | Adjust gaps settings                     |
| `Win + V`                 | Set vertical orientation                 |
| `Win + H`                 | Set horizontal orientation               |
| `Win + I`                 | Lock screen                              |
| `Win + O`                 | Show polybar                             |
| `Win + P`                 | Hide polybar                             |
| `Win + B`                 | Move workspace to another monitor        |
| `Win + N`                 | Enable dual monitor mode                 |
| `Win + M`                 | Enable single monitor mode               |
| `Win + Arrow keys (jkl;)` | Resize or move windows                   |
| `Win + Shift + E`         | Exit i3                                  |
| `Win + Shift + R`         | Restart i3                               |

---

## Contributing

We welcome contributions! If you have suggestions or improvements, please submit issues or pull requests.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Thank you for using and contributing to this dotfiles setup!
