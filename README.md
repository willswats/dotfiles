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

### Specific Installs

- [Neovim](./nvim/.config/nvim/README.md)

## Uninstall

Run `stow -D */` to remove all symlinks, or `stow -D foo` to remove a symlink for a specific directory.
