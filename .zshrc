# --- CONFIGURAZIONE ZSH NORD THEME ---

# Attiva i colori
autoload -U colors && colors

# Cronologia Comandi
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt histignorealldups sharehistory

# --- AUTOCOMPLETAMENTO AVANZATO (Menu) ---
# Questo è quello che fa apparire il menu selezionabile con TAB
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# --- TASTI (Home, End, Canc) ---
bindkey -e
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

# --- ALIAS UTILI (Scorciatoie) ---
alias ll='ls -lh'
alias la='ls -la'
alias grep='grep --color=auto'
alias cp='cp -i' # Chiede conferma prima di sovrascrivere
alias mv='mv -i'
alias rm='rm -i' # Chiede conferma prima di cancellare
alias c='clear'

# Scorciatoie per Yay
alias y='yay'
alias ys='yay -S'
alias yr='yay -Rns'

# Scorciatoie Editor
alias v='nvim' # Se usi neovim, altrimenti metti nano
alias nano='nano'

# Sostituisci neofetch con fastfetch
alias neofetch='fastfetch'
alias rice='fastfetch'
alias fetch='fastfetch'

# --- ATTIVAZIONE PLUGINS ---
# Assicurati di averli installati: sudo pacman -S zsh-syntax-highlighting zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- AVVIO STARSHIP (Prompt col Teschio) ---
eval "$(starship init zsh)"

# --- Per copiare il rice nel DOTFILE per il commit su GIT ---
function update-rice() {
    echo "🗑️  Pulisco vecchie config nel repo..."
    # Rimuoviamo le cartelle vecchie dal backup per evitare duplicati
    rm -rf ~/dotfiles/.config/hypr
    rm -rf ~/dotfiles/.config/waybar
    rm -rf ~/dotfiles/.config/kitty
    rm -rf ~/dotfiles/.config/wofi
    rm -rf ~/dotfiles/.config/swaync
    rm -rf ~/dotfiles/.config/cava
    rm -rf ~/dotfiles/.config/fastfetch  # <--- CORRETTO (era neofetch)

    echo "📂 Copio le nuove configurazioni..."
    # Copiamo i file aggiornati dal sistema al backup
    \cp -f ~/.zshrc ~/dotfiles/
    \cp -rf ~/.config/hypr ~/dotfiles/.config/
    \cp -rf ~/.config/waybar ~/dotfiles/.config/
    \cp -rf ~/.config/kitty ~/dotfiles/.config/
    \cp -rf ~/.config/wofi ~/dotfiles/.config/
    \cp -rf ~/.config/swaync ~/dotfiles/.config/
    \cp -rf ~/.config/cava ~/dotfiles/.config/
    \cp -rf ~/.config/fastfetch ~/dotfiles/.config/  # <--- CORRETTO
    \cp -f ~/.config/starship.toml ~/dotfiles/.config/
    
    echo "✅ Fatto! Ora vai in ~/dotfiles e fai git push."
}

# -- Comandi per modificare il buffer audio
alias proaudio="pw-metadata -n settings 0 clock.force-quantum 256"
alias chillvideo="pw-metadata -n settings 0 clock.force-quantum 1024"
