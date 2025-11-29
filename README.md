# 💀 Arch Linux Hyprland - Nord Skull Rice

> A dark, minimal, and gothic setup based on the **Nord Color Palette**.
> Inspired by the *Fontanelle Cemetery* aesthetic (Naples).

<!-- HERO IMAGE -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/7a9210d0-9f21-4c2d-b4b6-9ea7abe4dad9" alt="Hero Desktop" width="100%">
</p>

## 🧩 The Rice

This setup focuses on consistency. Every component (from the shell to the browser) has been tweaked to match the **Nord Dark** theme with specific blur effects and rounded corners.

| Component | Tech Stack | Notes |
| :--- | :--- | :--- |
| **OS** | Arch Linux | BTW |
| **WM** | Hyprland | With heavy blur & animations |
| **Shell** | Zsh | With **Starship** prompt (Skull symbol) |
| **Terminal** | Kitty | Padding + Blur + Nord colors |
| **Bar** | Waybar | Custom modules & Tooltips |
| **Launcher** | Wofi | Transparent with blur effect |
| **Notifications** | SwayNC | Nord theme + Media player |
| **Lockscreen** | Hyprlock | Blurred screenshot background + PAM fix |
| **Idle Daemon** | Hypridle | Auto-lock & Screen off logic |
| **File Manager** | Thunar | Nordic Theme + Custom Thumbnails |
| **Browser** | Firefox | Custom `userChrome.css` (Transparent Header) |
| **Visualizer** | Cava | Nord Gradient config |
| **Display Manager** | SDDM | Sugar Candy Theme (Nordized) |

## 📸 Gallery

<p align="center">
  <!-- Wofi / Launcher -->
  <img src="https://github.com/user-attachments/assets/18bb8a44-6853-4ff2-b10c-acae503d65c5" width="48%" alt="Wofi Launcher" />
  <!-- Firefox -->
  <img src="https://github.com/user-attachments/assets/f3d0bf24-c98d-4551-94f7-0ad25953d53c" width="48%" alt="Firefox Nord" />
</p>

<p align="center">
  <!-- SwayNC Notifications -->
  <img src="https://github.com/user-attachments/assets/7483684d-d130-4ff3-9c5f-7ac48077b47a" width="48%" alt="Notification Center" />
  <!-- Lockscreen -->
  <img src="https://github.com/user-attachments/assets/6ad59dce-455a-4737-8ab1-5f75c3f0165f" width="48%" alt="Hyprlock" />
</p>

## 🚀 Installation

### 1. Dependencies
You need the following packages (Official Repos + AUR):

```bash
yay -S hyprland waybar kitty wofi swaync hyprlock hypridle \
       zsh starship ttf-jetbrains-mono-nerd nwg-look \
       nordic-theme papirus-icon-theme-nordic-git-folders \
       vesktop cava fastfetch thunar-archive-plugin
```

### 2. Clone & Copy

Clone this repository and copy the config files to your local folder. Backup your existing configs first!
code Bash

```bash
git clone https://github.com/antanidoom/dotfiles.git
cd dotfiles
cp -r .config/* ~/.config/
cp .zshrc ~/
```
## ⌨️ Keybindings (Cheatsheet)

| Key | Action |
| :--- | :--- |
| `SUPER` + `ENTER` | Open **Kitty** Terminal |
| `SUPER` + `R` | Open **Wofi** App Launcher |
| `SUPER` + `Q` | Close active window |
| `SUPER` + `E` | Open **Thunar** File Manager |
| `SUPER` + `B` | Open **Firefox** |
| `SUPER` + `P` | Media Play/Pause (Spotify) |
| `SUPER` + `.` | Open Emoji Picker (**Bemoji**) |

## 🛠️ Custom Scripts

- **Floating Network Manager:** Clicking the WiFi icon on Waybar opens `nmtui` in a floating, blurred Kitty window instead of the standard menu.

## ❤️ Credits

- **Colors:** [Nord Theme](https://www.nordtheme.com/)
- **Icons:** [Papirus Nord](https://github.com/Adapta-Project/Papirus-Nord)
- **Firefox CSS:** Custom tweaks based on Nord Firefox.
