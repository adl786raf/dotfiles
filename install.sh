#!/bin/bash

# 1. Install Tools
bash ~/dotfiles/scripts/setup_zsh.sh
bash ~/dotfiles/scripts/setup_tmux.sh
bash ~/dotfiles/scripts/setup_python.sh

# 2. Hardware Banner (Only adding to Zsh now)
BANNER='
echo -e "\e[1;36m======================================\e[0m"
echo -e "\e[1;32m   🚀 CODESPACE HARDWARE STATUS 🚀   \e[0m"
echo -e "\e[1;36m======================================\e[0m"
echo -e "🧠 \e[1;33mCPU Cores:\e[0m  $(nproc)"
echo -e "🐏 \e[1;33mTotal RAM:\e[0m  $(free -h | awk '\''/^Mem:/ {print $2}'\'')"
echo -e "💾 \e[1;33mDisk Space:\e[0m $(df -h / | awk '\''NR==2 {print $4 " free out of " $2}'\'')"
echo -e "\e[1;36m======================================\e[0m"
'
if ! grep -q "HARDWARE STATUS" ~/.zshrc; then echo "$BANNER" >> ~/.zshrc; fi

# 3. Add Global Aliases to Zsh
echo "alias quota='echo \"Reset: 1st of the month, 05:30 AM IST. Check usage: https://github.com/settings/billing\"'" >> ~/.zshrc
echo "alias mkproj='bash ~/dotfiles/scripts/new_project.sh'" >> ~/.zshrc
echo "alias maskcard='python3 ~/dotfiles/scripts/mask_aadhaar.py'" >> ~/.zshrc

# 4. THE MAGIC HANDOFF: Make Bash auto-launch Tmux
if ! grep -q "tmux new-session" ~/.bashrc; then
    echo 'if [ -z "$TMUX" ] && [ -n "$PS1" ]; then exec tmux new-session -A -s nexus; fi' >> ~/.bashrc
fi

echo "✅ Dotfiles: Environment setup complete."
