#!/bin/bash
bash ~/dotfiles/scripts/setup_zsh.sh
bash ~/dotfiles/scripts/setup_tmux.sh
bash ~/dotfiles/scripts/setup_python.sh
echo '======================================' >> ~/.zshrc
echo '   🚀 CODESPACE HARDWARE STATUS 🚀   ' >> ~/.zshrc
echo '======================================' >> ~/.zshrc
echo "🧠 CPU Cores: $(nproc)" >> ~/.zshrc
echo "🐏 Total RAM: $(free -h | awk '/^Mem:/ {print $2}')" >> ~/.zshrc
echo "alias quota='echo Reset: April 1st, 05:30 AM IST.'" >> ~/.zshrc
echo "alias mkproj='bash ~/dotfiles/scripts/new_project.sh'" >> ~/.zshrc
if ! grep -q "tmux new-session" ~/.bashrc; then
  echo 'if [ -z "$TMUX" ] && [ -n "$PS1" ]; then exec tmux new-session -A -s nexus; fi' >> ~/.bashrc
fi
