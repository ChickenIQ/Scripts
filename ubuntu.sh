#!/bin/sh

# Packages
sudo apt update -y
sudo apt upgrade -y
sudo apt install neovim btop fish docker.io docker-compose docker-clean fzf nala -y
sudo apt purge snapd -y
sudo apt autoremove -y

# Shell
sudo chsh $USER -s /usr/bin/fish
sudo chmod -x /etc/update-motd.d/*
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish 
fish -c fisher install jorgebucaran/fisher
fish -c fisher install PatrickF1/fzf.fish
curl -sS https://starship.rs/install.sh | sudo sh -s -- -y

touch ~/.config/fish/config.fish
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
	starship init fish | source
	
	# Binds
	bind \e\[3\;5~ kill-word
	bind \b backward-kill-path-component
	bind \e\[1\;5H beginning-of-line
	bind \e\[1\;5F end-of-line' > ~/.config/fish/config.fish

# Supress ssh login message
sudo touch ~/.hushlogin
