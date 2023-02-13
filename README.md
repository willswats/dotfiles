# Neovim Config

My Neovim Config.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Acknowledgements](#acknowledgements)

## Prerequisites

```bash
pnpm install -g neovim
python3 -m pip install --user pynvim
cargo install fd-find ripgrep
```

### Formatters & Linters

```bash
pnpm i -g prettier markdownlint-cli
```

## Installation

HTTPS:

```bash
git clone https://github.com/willswats/neovim-config.git ~/.config/nvim
```

SSH:

```bash
git clone git@github.com:willswats/neovim-config.git ~/.config/nvim
```

## Acknowledgements

I've used code from [LunarVim](https://github.com/lunarvim/lunarvim)
throughout the config.
