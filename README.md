# dotfiles

My dotfiles.

## Table of Contents

<!--toc:start-->

- [Prerequisites](#prerequisites)
- [Install](#install)
<!--toc:end-->

## Prerequisites

- `gio`
- `git`
- `pnpm`
- `python`
- `pip`
- `cargo`

## Install

1. Run `install.sh`.

`install.sh` will:

- `gio trash` existing configs.
- symlink the configs from this repository to their locations.
- Install my Neovim config's dependencies.
- Install my Neovim configs's configured formatters and linters.
