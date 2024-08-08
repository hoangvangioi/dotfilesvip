Certainly! I've polished and reorganized your dotfiles guide for clarity and consistency. Here's a revised version:

---

# Dotfiles for Arch Linux & i3-wm

Welcome to the ultimate Arch Linux setup with i3-wm. This guide will help you install, configure, and customize your environment.

---

## System Configuration

| **Component**            | **Details**                                           |
|--------------------------|-------------------------------------------------------|
| **Operating System**     | [Arch Linux](https://archlinux.org)                  |
| **Window Manager**       | [i3-wm](https://i3wm.org)                            |
| **Terminal Emulator**    | [alacritty](https://github.com/alacritty/alacritty)  |
| **Status Bar**           | [polybar](https://github.com/polybar/polybar)        |
| **Shell**                | [zsh](https://www.zsh.org/)                          |
| **Compositor**           | [picom](https://github.com/yshui/picom)              |
| **Application Launcher** | [rofi](https://github.com/davatorium/rofi)          |
| **Notification Daemon**  | [dunst](https://github.com/dunst-project/dunst)      |

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

## Quick Start Guide

### 1. Clone the Repository

```sh
git clone https://github.com/hoangvangioi/dotfiles.git
cd dotfiles
```

### 2. Prepare the Installation Script

```sh
chmod +x install.sh
```

### 3. Run the Installation Script

```sh
./install.sh
```

### 4. Install `curl` if Needed

```sh
sudo pacman -S curl
```

### 5. Optional: Run Additional Install Script

```sh
curl -LsS https://raw.githubusercontent.com/hoangvangioi/dotfilesvip/main/install.sh | bash
```

---

## Keybinds

Below are the basic keybindings. For more keybinds, refer to the [i3](./config/i3/config) configuration file.

*Note: `Win` refers to the `Super/Mod` key.*

|        Keybind         |                 Function                 |
|-----------------------|------------------------------------------|
| `Win + Enter`          | Launch terminal (alacritty)              |
| `Win + Shift + Q`      | Close window                             |
| `Win + Q`              | Switch to stacking layout                |
| `Win + W`              | Switch to tabbed layout                  |
| `Win + E`              | Switch to default layout                 |
| `Win + R`              | Enter resize mode                        |
| `Win + T`              | Restore layout                           |
| `Win + Y`              | Save layout                              |
| `Win + A`              | Open rofi window menu                    |
| `Win + S`              | Open rofi full menu                      |
| `Win + D`              | Open rofi menu                           |
| `Win + Z`              | Open rofi bookmarks                      |
| `Win + X`              | Open rofi power menu                     |
| `Win + C`              | Run rofi screenshot script               |
| `Win + G`              | Adjust gaps settings                     |
| `Win + V`              | Set vertical orientation                 |
| `Win + H`              | Set horizontal orientation               |
| `Win + I`              | Lock screen                              |
| `Win + O`              | Show polybar                             |
| `Win + P`              | Hide polybar                             |
| `Win + B`              | Move workspace to another monitor        |
| `Win + N`              | Enable dual monitor mode                 |
| `Win + M`              | Enable single monitor mode               |
| `Win + arrows (jkl;)`  | Resize or move windows                   |
| `Win + Shift + E`      | Exit i3                                  |
| `Win + Shift + R`      | Restart i3                               |

---

## Dependencies

Ensure the following packages are installed:

| **Package** | **Purpose**                           |
|-------------|---------------------------------------|
| `git`       | For cloning the repository            |
| `curl`      | For fetching additional scripts       |
| `sudo`      | For executing commands with admin rights |

Install them using:

```sh
sudo pacman -S git curl sudo
```

---

## Contributing

We welcome contributions! If you have suggestions or improvements, please submit issues or pull requests.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Thank you for using and contributing to this dotfiles setup!

---