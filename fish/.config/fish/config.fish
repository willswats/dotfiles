# Remove fish greeting
set -g fish_greeting

# Set alias
alias flatdel="flatpak uninstall --delete-data"
alias main="distrobox enter main -- fish"
alias docker="podman"

# set PATH
set PATH $HOME/.cargo/bin $PATH # Set PATH for cargo
set PATH $HOME/.local/share/pnpm $PATH # Set PATH for pnpm

# Set theme
fish_config theme choose "Catppuccin Mocha"

# node version on cd
fnm env --use-on-cd | source

