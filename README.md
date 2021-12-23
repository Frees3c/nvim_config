# My config for Neovim 0.5 init.lua

> WiP:
>
> TODO//
>
> - ## Make a better README.md

## Install

**Install [Packer.nvim](https://github.com/wbthomason/packer.nvim)**

To get started, first clone this repository to somewhere on your
packpath, e.g.:

``` bash
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Lsp

Install a supported language server, tab completion is supported:

``` bash
:LspInstall <Language Server>

# Languages used in this config 
:LspInstall pyright, tsserver, gopls, rust_analyzer, lua, diagnostics, bash, json, html, yamlls, vim, ltex, css, php, ruby, latex, clangd, dockerls
```

## Install efm-langserver

`go get github.com/mattn/efm-langserver`

------------------------------------------------------------------------

## Formatters and Linters

### Python

``` bash
pip3 install --user flake8
pip3 install --user black
```

### Lua

`npm install -g lua-fmt`

### Yaml, Json, Javascript, HTML, CSS

`npm install -g typescript typescript-language-server eslint_d prettier`

### Markdown

``` bash
apt/pacman -S pandoc
npm install -g markdownlint-cli
# for mac os :
brew install markdownlint-cli

```

### PHP

``` bash
  npm install -g intelephense
```

------------------------------------------------------------------------

## Screenshots

**Telescope.nvim**:
[![Telescope](Screenshots/telescope.png)](Screenshots/telescope.png)

**Neovim**:
[![screen-shot](Screenshots/screenshot.png)](Screenshots/screenshot.png)
