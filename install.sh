# Alacritty
gio trash ~/.config/alacritty
mkdir -p ~/.config/alacritty
ln -s "$(pwd)/alacritty/alacritty.yml" ~/.config/alacritty
git clone https://github.com/catppuccin/alacritty.git ~/.config/alacritty/catppuccin

# Neovim
gio trash ~/.config/nvim
ln -s "$(pwd)/nvim" ~/.config/
pnpm install -g neovim
python3 -m pip install --user pynvim
cargo install fd-find ripgrep
pnpm i -g prettier markdownlint-cli

# fish
gio trash ~/.config/fish
mkdir -p ~/.config/fish
ln -s "$(pwd)/fish/config.fish" ~/.config/fish/

# autostart
gio trash ~/.config/autostart/rclone
gio trash ~/.config/autostart/OpenTabletDriver.Daemon
mkdir -p ~/.config/autostart
ln -s "$(pwd)/autostart/rclone" ~/.config/autostart/
ln -s "$(pwd)/autostart/OpenTabletDriver.Daemon" ~/.config/autostart/

# bookmarks
gio trash ~/.config/gtk-3.0/bookmarks
mkdir -p ~/.config/gtk-3.0
ln -s "$(pwd)/gtk-3.0/bookmarks" ~/.config/gtk-3.0/

# fonts
gio trash ~/.local/share/fonts
ln -s "$(pwd)/fonts" ~/.local/share/
