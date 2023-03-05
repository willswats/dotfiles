# Neovim Config

My Neovim config.

## Table of Contents

<!--toc:start-->

- [Requirements](#requirements)
  - [Formatters and Linters](#formatters-and-linters)
- [Acknowledgements](#acknowledgements)
<!--toc:end-->

## Requirements

```bash
pnpm install -g neovim
python3 -m pip install --user pynvim
cargo install fd-find ripgrep
```

- A patched nerd font.

### Formatters and Linters

```bash
pnpm i -g prettier markdownlint-cli
```

## Acknowledgements

I've used code from [LunarVim](https://github.com/lunarvim/lunarvim) throughout the config.
