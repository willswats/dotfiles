# nvim

My Neovim Config.

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

A nerd font needs to be installed for the icons to appear, I use `Hack`.

### Formatters and Linters

```bash
pnpm i -g prettier markdownlint-cli
```

## Installation

Copy the `nvim` directory to `~/.config`

## Acknowledgements

I've used code from [LunarVim](https://github.com/lunarvim/lunarvim) throughout the config.
