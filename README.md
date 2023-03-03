# Neovim Config

My Neovim config.

## Table of Contents

<!--toc:start-->

- [Prerequisites](#prerequisites)
  - [Formatters and Linters](#formatters-and-linters)
- [Installation](#installation)
- [Acknowledgements](#acknowledgements)
<!--toc:end-->

## Prerequisites

```bash
pnpm install -g neovim
python3 -m pip install --user pynvim
cargo install fd-find ripgrep
```

- A nerd font

### Formatters and Linters

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

I've used code from [LunarVim](https://github.com/lunarvim/lunarvim) throughout the config.
