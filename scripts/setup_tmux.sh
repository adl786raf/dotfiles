#!/bin/bash

echo "🪟 Setting up Tmux..."
sudo apt-get install -y tmux --quiet

# Tell Tmux to always use Zsh!
echo "set-option -g default-shell $(which zsh)" > ~/.tmux.conf

# Enable mouse scrolling (super helpful on a phone touchscreen)
echo "set -g mouse on" >> ~/.tmux.conf

echo "✅ Tmux configured!"
