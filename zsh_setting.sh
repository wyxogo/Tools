#!/bin/zsh

# Auto complete plugin
autosuggestions_dir="$HOME/.zsh/plugins/zsh-autosuggestions"
if [ ! -d "$autosuggestions_dir" ]; then
  echo "Cloning zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$autosuggestions_dir"
else
  echo "zsh-autosuggestions already exists. Skipping clone."
fi

# Syntax highlighting plugin
highlighting_dir="$HOME/.zsh/plugins/zsh-syntax-highlighting"
if [ ! -d "$highlighting_dir" ]; then
  echo "Cloning zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$highlighting_dir"
else
  echo "zsh-syntax-highlighting already exists. Skipping clone."
fi

if [ -f $HOME/.zshrc ]; then
    mv $HOME/.zshrc $HOME/.zshrc_bak
fi

echo "" > $HOME/.zshrc

# add to $HOME/.zshrc
if grep -q "zsh-autosuggestions.zsh" "$HOME/.zshrc"; then
  echo "zsh-autosuggestions already enabled in $HOME/.zshrc. Skipping addition."
else
  echo "Enabling zsh-autosuggestions in $HOME/.zshrc..."
  echo "source $autosuggestions_dir/zsh-autosuggestions.zsh" >> "$HOME/.zshrc"
fi

if grep -q "zsh-syntax-highlighting.zsh" "$HOME/.zshrc"; then
  echo "zsh-syntax-highlighting already enabled in $HOME/.zshrc. Skipping addition."
else
  echo "Enabling zsh-syntax-highlighting in $HOME/.zshrc..."
  echo "source $highlighting_dir/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
fi

if grep -q "some more aliases" "$HOME/.zshrc"; then
  echo "Some more aliases already enabled in $HOME/.zshrc. Skipping addition."
else
  echo "Enabling some more aliases in $HOME/.zshrc..."
  echo "# some more aliases" >> $HOME/.zshrc
  echo "alias ll='ls -alF'" >> $HOME/.zshrc
  echo "alias la='ls -A'" >> $HOME/.zshrc
  echo "alias l='ls -CF'" >> $HOME/.zshrc
fi

echo "# Color Prompt" >> $HOME/.zshrc
echo "autoload -U colors && colors" >> $HOME/.zshrc
echo "" >> $HOME/.zshrc
echo "# Refresh Prompt" >> $HOME/.zshrc
echo "setopt prompt_subst" >> $HOME/.zshrc
echo "" >> $HOME/.zshrc
echo "# Setting Prompt" >> $HOME/.zshrc
echo "PROMPT='❰%{\$fg[green]%}%n%{\$reset_color%}|%{\$fg[yellow]%}%1~%{\$reset_color%}%{\$fg[blue]%}\$(git branch --show-current 2>/dev/null | xargs -I branch echo \"(branch)\")%{\$reset_color%}❱ '" >> $HOME/.zshrc

echo "" >> $HOME/.zshrc
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> $HOME/.zshrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> $HOME/.zshrc
echo "" >> $HOME/.zshrc

# check zsh
if ! command -v zsh &> /dev/null; then
    echo "Zsh is not installed. Installing..."
    sudo apt install -y zsh
fi

# get default shell
current_shell=$(echo $SHELL | awk -F/ '{print $NF}')

# checck default shell
if [ "$(basename "$current_shell")" != "zsh" ]; then
    # zsh shell
    echo "Switching default shell to Zsh..."
    chsh -s "$(command -v zsh)"
fi
