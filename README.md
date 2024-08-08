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

- **Run the Installation Script**

    ```sh
    curl -LsS https://raw.githubusercontent.com/hoangvangioi/dotfilesvip/main/install.sh | bash
    ```
    > **Note:** This method requires `curl`. Install it with `sudo pacman -S curl`.

---

## Contributing

We welcome contributions! If you have suggestions or improvements, please submit issues or pull requests.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Thank you for using and contributing to this dotfiles setup!
