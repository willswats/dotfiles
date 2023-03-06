# dotfiles

My dotfiles.

## Prerequisites

Have installed:

- `git`
- `stow`

## Install

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

Run `stow */` to symlink all directories.

Run `stow foo` to symlink a specific directory.

### Neovim

Install these dependencies:

```bash
pnpm install -g neovim
python3 -m pip install --user pynvim
cargo install fd-find ripgrep
```
