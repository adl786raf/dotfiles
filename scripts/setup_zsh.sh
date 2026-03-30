#!/bin/bash

echo "🐚 Setting up Zsh & Oh My Zsh with Plugins..."

# 1. Install Zsh
sudo apt-get update -y --quiet
sudo apt-get install -y zsh --quiet

# 2. Install Oh My Zsh silently
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    CHSH=yes RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 3. Download the Plugins into Oh My Zsh
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions --quiet
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting --quiet

# 4. Configure .zshrc (Theme & Plugins)
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/g' ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

# 5. Set Zsh as default
sudo chsh -s $(which zsh) $(whoami)

echo "✅ Zsh, Themes, and Plugins installed successfully!"
