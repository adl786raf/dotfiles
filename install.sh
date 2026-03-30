#!/bin/bash

BANNER='
# --- Codespace Hardware Status Banner ---
echo -e "\e[1;36m======================================\e[0m"
echo -e "\e[1;32m   🚀 CODESPACE HARDWARE STATUS 🚀   \e[0m"
echo -e "\e[1;36m======================================\e[0m"
echo -e "🧠 \e[1;33mCPU Cores:\e[0m  $(nproc)"
echo -e "🐏 \e[1;33mTotal RAM:\e[0m  $(free -h | awk '\''/^Mem:/ {print $2}'\'')"
echo -e "💾 \e[1;33mDisk Space:\e[0m $(df -h / | awk '\''NR==2 {print $4 " free out of " $2}'\'')"
echo -e "\e[1;36m======================================\e[0m"
'

if ! grep -q "HARDWARE STATUS" ~/.bashrc; then
    echo "$BANNER" >> ~/.bashrc
fi

# Link Python Setup
bash ~/dotfiles/scripts/setup_python.sh

# Add Global Aliases
echo "alias quota='echo \"Reset: 1st of the month, 05:30 AM IST. Check exact usage here: https://github.com/settings/billing\"'" >> ~/.bashrc
echo "alias mkproj='bash ~/dotfiles/scripts/new_project.sh'" >> ~/.bashrc
echo "alias maskcard='python3 ~/dotfiles/scripts/mask_aadhaar.py'" >> ~/.bashrc

echo "✅ Dotfiles: Environment setup complete."
