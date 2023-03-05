# dotfiles

My dotfiles.

## Table of Contents

<!--toc:start-->

- [Prerequisites](#prerequisites)
- [Install](#install)
<!--toc:end-->

## Prerequisites

These must be installed:

- `gio`
- `git`
- `pnpm`
- `python`
- `pip`
- `cargo`

## Install

1. Run `install.sh`.

`install.sh` will:

1. `gio trash` existing conflicting directories and files.
2. symlink all directories and files from this repository to their locations.
3. Install my Neovim config's dependencies.
4. Install my Neovim config's configured formatters and linters.
