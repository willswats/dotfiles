# Remove fish greeting
set -g fish_greeting

# Set theme
fish_config theme choose "Catppuccin Mocha"

# Set alias
alias flatdel="flatpak uninstall --delete-data"
alias main="distrobox enter main -- fish"
alias docker="podman"
alias nv="nvim"
alias lg="lazygit"

# set PATH
set PATH $HOME/.cargo/bin $PATH # Set PATH for cargo
set PATH $HOME/.local/share/pnpm $PATH # Set PATH for pnpm

# node version on cd
fnm env --use-on-cd | source

