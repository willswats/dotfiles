# Neovim Config

My Neovim config.

<!--toc:start-->

- [Dependencies](#dependencies)
<!--toc:end-->

## Dependencies

`npm`, `python3`, `pip` and `cargo` need to be installed to install the dependencies.

Install dependencies:

```bash
npm install -g neovim
python3 -m pip install --user pynvim
cargo install fd-find ripgrep
```

`trash-cli` is used in `nvim-tree`.

## Formatters & Linters

```bash
npm i -g prettier
npm i -g markdownlint-cli
```
