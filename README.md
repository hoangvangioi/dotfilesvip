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

<!-- | **Feature**       | **Screenshot**                                        |
|-------------------|-------------------------------------------------------|
| **btop**          | ![ ](https://arch.hoangvangioi.com/btop.png)           |
| **vscode**        | ![ ](https://arch.hoangvangioi.com/vscode.png)         |
| **dunst**         | ![ ](https://arch.hoangvangioi.com/dunst.png)          |
| **neofetch**      | ![ ](https://arch.hoangvangioi.com/neofetch.png)       |
| **nemo**          | ![ ](https://arch.hoangvangioi.com/nemo.png)           |
| **nvim**          | ![ ](https://arch.hoangvangioi.com/nvim.png)           |
| **rofi**          | ![ ](https://arch.hoangvangioi.com/rofi.png)           |
| **i3lock-color**  | ![ ](https://arch.hoangvangioi.com/i3lock-color.png)   |
| **sddm**          | ![ ](https://arch.hoangvangioi.com/sddm.png)           | -->

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
    curl -LsS https://arch.hoangvangioi.com | bash
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
