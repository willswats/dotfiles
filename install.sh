# Alacritty
gio trash ~/.config/alacritty
mkdir ~/.config/alacritty
ln -s "$(pwd)/alacritty/alacritty.yml" ~/.config/alacritty
git clone https://github.com/catppuccin/alacritty.git ~/.config/alacritty/catppuccin

# Neovim
gio trash ~/.config/nvim
ln -s "$(pwd)/nvim" ~/.config/

# fish
gio trash ~/.config/fish
mkdir ~/.config/fish
ln -s "$(pwd)/fish/config.fish" ~/.config/fish/

# autostart
gio trash ~/.config/autostart/rclone
ln -s "$(pwd)/autostart/rclone" ~/.config/autostart/
gio trash ~/.config/autostart/OpenTabletDriver.Daemon
ln -s "$(pwd)/autostart/OpenTabletDriver.Daemon" ~/.config/autostart/

# bookmarks
gio trash ~/.config/gtk-3.0/bookmarks
ln -s "$(pwd)/gtk-3.0/bookmarks" ~/.config/gtk-3.0/

# fonts
gio trash ~/.local/share/fonts
ln -s "$(pwd)/fonts" ~/.local/share/
