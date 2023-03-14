# dotfiles

<!--toc:start-->

- [Install](#install)
  - [Specific Installs](#specific-installs)
- [Uninstall](#uninstall)
<!--toc:end-->

My dotfiles.

## Install

`git` and `stow` need to be installed.

Back up existing configurations.

Clone this repository to your home:

HTTPS:

```bash
git clone https://github.com/willswats/dotfiles.git ~/.dotfiles
```

SSH:

```bash
git clone git@github.com:willswats/dotfiles.git ~/.dotfiles
```

Run `stow */` to symlink all directories, or `stow foo` to symlink a specific directory.

## Uninstall

Run `stow -D */` to remove all symlinks, or `stow -D foo` to remove a symlink for a specific directory.

## Specific Installs

### i3

Get wallpaper:

```bash
mkdir -p ~/Pictures/Wallpapers
wget --content-disposition https://raw.githubusercontent.com/catppuccin/wallpapers/main/minimalistic/tetris.png -O ~/Pictures/Wallpapers/tetris.png
```

### Neovim

- `pnpm`, `python3`, `pip` and `cargo` need to be installed.
- `trash-cli` is used in `nvim-tree`.

Install dependencies:

```bash
pnpm install -g neovim
python3 -m pip install --user pynvim
cargo install fd-find ripgrep
```

Install formatters and linters:

```bash
pnpm i -g prettier
pnpm i -g markdownlint-cli
```
