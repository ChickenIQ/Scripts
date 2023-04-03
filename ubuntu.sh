#!/bin/bash

# Packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install neovim btop fish docker.io docker-compose docker-clean fzf -y
sudo apt purge snapd -y
sudo apt autoremove -y

# Shell
sudo chsh $USER -s /usr/bin/fish
sudo chmod -x /etc/update-motd.d/*
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
curl -sS https://starship.rs/install.sh | sudo sh -s -- -y

echo -e '# Disable welcome message
		set fish_greeting

		# Environment variables
		export EDITOR='nvim'

		# Aliases
		alias vim="nvim"
		alias sudo="sudo "
		alias svim="sudo -e"
		alias sv="sudo -e"
		alias v="nvim"
		alias ls="ls -a"
		alias tree="tree -a -I .git"
		starship init fish | source' > ~/.config/fish/config.fish

# Supress ssh login message
sudo touch ~/.hushlogin
