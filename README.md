# dotfiles

<!--toc:start-->

- [Install](#install)
  - [Neovim](#neovim)
- [Uninstall](#uninstall)
<!--toc:end-->

My dotfiles.

## Install

`git` and `stow` need to be installed.

Back up existing configurations.

Clone this repository to your home:

HTTPS:

```bash
git clone https://github.com/willswats/dotfiles.git ~/dotfiles
```

SSH:

```bash
git clone git@github.com:willswats/dotfiles.git ~/dotfiles
```

Run `stow */` to symlink all directories, or `stow foo` to symlink a specific directory.

### Neovim

`npm` or `pnpm`, `python3`, `pip` and `cargo` need to be installed.

Install dependencies:

```bash
pnpm install -g neovim # alternatively, replace this with npm
python3 -m pip install --user pynvim
cargo install fd-find ripgrep
```

## Uninstall

Run `stow -D */` to remove all symlinks, or `stow -D foo` to remove a symlink for a specific directory.
