# Remove fish greeting
set -g fish_greeting

# Set alias
alias flatdel="flatpak uninstall --delete-data"
alias main="distrobox enter main -- fish"
alias key="keychain --quiet --agents ssh id_ed25519"
alias docker="podman"

# set PATH
set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/.local/share/pnpm $PATH

# Set theme
fish_config theme choose "Catppuccin Mocha"

# node version on cd
fnm env --use-on-cd | source

# keychain
begin
    set -l HOSTNAME (hostname)
    if test -f ~/.keychain/$HOSTNAME-fish
        source ~/.keychain/$HOSTNAME-fish
    end
end
