# 💀 Arch Linux Hyprland - Nord Skull Rice

> A dark, minimal, and gothic setup based on the **Nord Color Palette**.
> Inspired by the *Fontanelle Cemetery* aesthetic (Naples).

<!-- HERO IMAGE -->
<p align="center">
  <img src="https://github.com/user-attachments/assets/375c285e-7fa8-4dbf-a9ec-9655668e5a34" alt="Hero Desktop" width="100%">
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/18bb8a44-6853-4ff2-b10c-acae503d65c5" alt="Hero Desktop" width="100%">
</p>

## 🧩 The Rice

This setup focuses on consistency. Every component (from the shell to the browser) has been tweaked to match the **Nord Dark** theme with specific blur effects and rounded corners.

| Component | Tech Stack | Notes |
| :--- | :--- | :--- |
| **OS** | Arch Linux | BTW |
| **Compositor** | Wayland + Hyprland | With heavy blur & animations |
| **Shell** | Zsh | With **Starship** prompt (Skull symbol) |
| **Terminal** | Kitty | Padding + Blur + Nord colors |
| **Bar** | Waybar | Custom modules & Tooltips |
| **Launcher** | Wofi | Transparent with blur effect |
| **Notifications** | SwayNC | Tokyio-night theme + Media player |
| **Lockscreen** | Hyprlock | Blurred screenshot background + PAM fix |
| **Idle Daemon** | Hypridle | Auto-lock & Screen off logic |
| **File Manager** | Thunar | Tokyo-night Theme + Custom Thumbnails |
| **Browser** | Firefox | Custom `userChrome.css` (Transparent Header) |
| **Visualizer** | Cava | Nord Gradient config |
| **Display Manager** | SDDM | Sugar Candy Theme (Nordized) |

## 📸 Gallery

<p align="center">
  <!-- Wofi / Launcher -->
  <img src="https://github.com/user-attachments/assets/7a9210d0-9f21-4c2d-b4b6-9ea7abe4dad9" width="48%" alt="Wofi Launcher" />
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
yay -S hyprland waybar kitty wofi swaync hyprlock hypridle tokyonight-gtk-theme-git sddm-sugar-candy-git 
       zsh starship ttf-jetbrains-mono-nerd nwg-look dropbox thunar-dropbox libappindicator-gtk3
       vesktop cava thunar-archive-plugin bemoji wl-clipboard pavucontrol fastfetch 
       wtype noto-fonts-emoji piper libratbag wl-clipboard cliphist xpad
```

Pro Audio Tools (Optional)
```bash
yay -S ardour qpwgraph wine-staging yabridge yabridgectl \
       lsp-plugins x42-plugins calf guitarix
```


### 2. Clone & Copy

Clone this repository and copy the config files to your local folder. Backup your existing configs first!

```bash
git clone https://github.com/antanidoom/hyprland-nordskull-rice.git
cd dotfiles
cp -r .config/* ~/.config/
cp .zshrc ~/
```

### 3. Copy the configs from this repo to the system folders for SDDM:

```bash
# Config File
sudo cp ~/dotfiles/sddm/sddm.conf /etc/sddm.conf

# Theme Config (Colors & Fonts)
sudo cp ~/dotfiles/sddm/sugar-candy-theme.conf /usr/share/sddm/themes/sugar-candy/theme.conf

# Background Image
sudo cp ~/dotfiles/wallpapers/fontanelle.png /usr/share/sddm/themes/sugar-candy/wall_nord.png
```

## ⌨️ Keybindings (Cheatsheet)

| Key | Action |
| :--- | :--- |
| `SUPER` + `ENTER` | Open **Kitty** Terminal |
| `SUPER` + `SPACE` | Open **Wofi** App Launcher |
| `SUPER` + `Q` | Close active window |
| `SUPER` + `E` | Open **Thunar** File Manager |
| `SUPER` + `B` | Open **Firefox** |
| `SUPER` + `P` | Media Play/Pause (Spotify) |
| `SUPER` + `M` | Lock/Suspend/Logout/Shutdown Menu |
| `SUPER` + `V` | Floating Window Mode |
| `SUPER` + `O` | Psuedo-tiling Window Mode |
| `SUPER` + `J` | Split-tiling Window Mode |
| `SUPER` + `S` | Special Workspace |
| `SUPER` + `.` | Open Emoji Picker (**Bemoji**) |
| `SUPER` + `0 to 9` | Open new to workspace |
| `SUPER` + `SHIFT` + `0 to 9` | Move windows to workspace |
| `SUPER` + `LMB` | Move windows |
| `SUPER` + `RMB` | Re-size windows |


## 🛠️ Custom Scripts

- **Floating Network Manager:** Clicking the WiFi icon on Waybar opens `nmtui` in a floating, blurred Kitty window instead of the standard menu.
- **Audio Latency Switcher**: A custom Waybar module to toggle between **Chill Mode** (1024 samples, low CPU) and **Pro Mode** (256 samples, low latency for recording). Click the icon to switch.    

## 🎸 Pro Audio Setup

This rice is configured for low-latency audio recording and mixing on Arch.

 - Engine: PipeWire (configured as JACK server).

 - DAW: Ardour 8.

 - Plugins:

   - Native Linux plugins (LSP, Calf, Guitarix).

   - Windows VST3 plugins (Neural DSP, etc.) bridged via Yabridge & Wine Staging.

 - Routing: Managed visually via qpwgraph.
