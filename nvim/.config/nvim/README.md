# Neovim Config

My Neovim config.

<!--toc:start-->

- [Dependencies](#dependencies)
<!--toc:end-->

## Dependencies

`npm` or `pnpm`, `python3`, `pip` and `cargo` need to be installed to install the dependencies.

Install dependencies:

```bash
pnpm install -g neovim # alternatively, replace this with npm
python3 -m pip install --user pynvim
cargo install fd-find ripgrep
```

`trash-cli` is used in `nvim-tree`.
