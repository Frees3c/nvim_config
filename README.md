>  WiP:
>
>
> TODO// fix auto commands, finish setting up auto formatting, fix indenting, list key mappings.

# My config for Neovim init.lua

## Install:

**Install packer**:
[Packer.nvim](https://github.com/wbthomason/packer.nvim)

To get started, first clone this repository to somewhere on your packpath, e.g.:

```bash
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Lsp
Install a supported language server, tab completion is supported:
		:LspInstall <Language server>

```
:LspInstall python lua diagnostics bash json html yaml vim css php ruby

```

## Formatters and Linters

**Python**
```
pip3 install --user flake8

```

**Lua**
```
luarocks install --server=https://luarocks.org/dev luaformatter

```

Yaml, Json, Javascript, HTML, CSS
```
npm install -g prettier

```
Markdown
```
pandoc

```

