#!/bin/bash

symlink_directory() {
gio trash ~/.$1
ln -s "$(pwd)/.$1" ~/.$1
}

symlink_file_to_directory() {
gio trash ~/.$1
mkdir -p ~/.$2
ln -s "$(pwd)/.$1" ~/.$2
}

symlink_directory "config/alacritty" 
symlink_directory "config/nvim" 
symlink_directory "config/fish" 
symlink_directory "local/share/fonts" 
symlink_file_to_directory "config/autostart/rclone" "config/autostart/"
symlink_file_to_directory "config/autostart/OpenTabletDriver.Daemon" "config/autostart/"
symlink_file_to_directory "config/gtk-3.0/bookmarks" "config/gtk-3.0/" 
