#!/bin/bash

# 1. Basic Setup
bash ~/dotfiles/scripts/setup_zsh.sh
bash ~/dotfiles/scripts/setup_python.sh

# 2. Add working Aliases to Zsh
echo "alias mkproj='bash /workspaces/dotfiles/scripts/new_project.sh'" >> ~/.zshrc
echo "alias maskcard='python3 /workspaces/dotfiles/scripts/mask_aadhaar.py'" >> ~/.zshrc
echo "alias quota='echo Reset: April 1st, 05:30 AM IST.'" >> ~/.zshrc

# 3. Simple Handoff (No Tmux)
echo "if [[ -t 1 ]]; then exec zsh; fi" >> ~/.bashrc

echo "✅ Nexus stable build complete."
