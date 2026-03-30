#!/bin/bash

echo "🐚 Setting up Zsh & Oh My Zsh..."

# 1. Install Zsh
sudo apt-get update -y --quiet
sudo apt-get install -y zsh --quiet

# 2. Install Oh My Zsh silently
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    CHSH=yes RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 3. Change the Default Theme
# This finds "robbyrussell" in the .zshrc file and replaces it with "ys"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/g' ~/.zshrc

# 4. Set Zsh as default
sudo chsh -s $(which zsh) $(whoami)

echo "✅ Zsh installed and theme set!"
