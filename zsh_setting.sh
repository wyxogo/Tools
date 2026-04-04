#!/bin/bash

# 1. Check and install Zsh (must be done first)
if ! command -v zsh &> /dev/null; then
    echo "Zsh is not installed. Installing..."
    sudo apt update
    sudo apt install -y zsh
fi

# 2. Prepare plugin directory
ZSH_PLUGIN_DIR="$HOME/.zsh/plugins"
mkdir -p "$ZSH_PLUGIN_DIR"

# Helper function to clone plugins with depth=1 for speed
install_plugin() {
    local repo_url=$1
    local plugin_dir=$2
    local plugin_name=$(basename "$plugin_dir")
    
    if [ ! -d "$plugin_dir" ]; then
        echo "Cloning $plugin_name..."
        git clone --depth=1 "$repo_url" "$plugin_dir"
    else
        echo "$plugin_name already exists. Skipping clone."
    fi
}

install_plugin "https://github.com/zsh-users/zsh-autosuggestions.git" "$ZSH_PLUGIN_DIR/zsh-autosuggestions"
install_plugin "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting"

# 3. Backup and safely append to .zshrc
ZSHRC="$HOME/.zshrc"
if [ -f "$ZSHRC" ]; then
    # Only backup if a backup doesn't already exist to prevent overwriting the original backup
    if [ ! -f "${ZSHRC}_bak" ]; then
        cp "$ZSHRC" "${ZSHRC}_bak"
        echo "Backed up original .zshrc to .zshrc_bak"
    fi
else
    touch "$ZSHRC"
fi

# Check if our custom settings marker is already present
if grep -q "# --- CUSTOM ZSH SETTINGS ---" "$ZSHRC"; then
    echo "Custom settings already exist in .zshrc. Skipping append."
else
    echo "Appending settings to .zshrc..."
    
    # Use a Here Document to neatly append multi-line configurations
    cat << 'EOF' >> "$ZSHRC"

# --- CUSTOM ZSH SETTINGS ---

# Plugins
source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# AutoSuggestions History settings
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=5000
export SAVEHIST=5000

# AutoSuggestions History options
setopt INC_APPEND_HISTORY  # Append history to the history file immediately
setopt SHARE_HISTORY       # Share history across all active terminal sessions
setopt EXTENDED_HISTORY    # Write the history file in the ":start:elapsed; command" format
setopt HIST_IGNORE_DUPS    # Do not record an event that was just recorded again

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tat='tmux attach -t'
alias tls='tmux ls'
alias tnt='tmux new -t'
alias ca='conda activate'
alias gc='git clone'

# Color Prompt
autoload -U colors && colors
setopt prompt_subst
PROMPT='❰%{$fg[green]%}%n%{$reset_color%}|%{$fg[yellow]%}%1~%{$reset_color%}%{$fg[blue]%}$(git branch --show-current 2>/dev/null | xargs -I branch echo "(branch)")%{$reset_color%}❱ '

# --- END CUSTOM ZSH SETTINGS ---
EOF
fi

# 4. Switch default shell to Zsh
current_shell=$(echo $SHELL | awk -F/ '{print $NF}')
if [ "$current_shell" != "zsh" ]; then
    echo "Switching default shell to Zsh..."
    chsh -s "$(command -v zsh)"
    echo "Please log out and log back in, or run 'zsh' to start."
fi
