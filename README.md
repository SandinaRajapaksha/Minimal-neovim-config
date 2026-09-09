![banner](public/banner.png)
![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-%23FCC624.svg?style=for-the-badge&logo=linux&logoColor=black)

# nvim-exp — minimal Neovim config

Leader is `<Space>` (`<LocalLeader>` is `\`). Colorscheme is `cyberdream`.

Managed with [lazy.nvim](https://github.com/folke/lazy.nvim) (auto-checks for updates, fallback install colorscheme `habamax`).

## Plugins

| Plugin | What it's used for |
| ------ | ------------------ |
| [scottmckendry/cyberdream.nvim](https://github.com/scottmckendry/cyberdream.nvim) | Colorscheme (loaded eagerly, `priority = 1000`, set in `init.lua`) |
| [nvim-mini/mini.nvim](https://github.com/nvim-mini/mini.nvim) | `mini.pairs`, `mini.tabline`, `mini.files`, `mini.git`, `mini.move`, `mini.starter` (dashboard), `mini.indentscope` (`▏`, blue `#5ea1ff`) |
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) + `plenary.nvim` | Fuzzy finder |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting (`lazy = false`, `:TSUpdate`) |
| [saghen/blink.cmp](https://github.com/Saghen/blink.cmp) `v1.*` + `friendly-snippets` | Completion (`default` preset, sources `lsp`/`path`/`snippets`/`buffer`, Rust fuzzy `prefer_rust_with_warning`, Nerd Font `mono`) |
| [mason-org/mason.nvim](https://github.com/mason-org/mason.nvim) + `mason-lspconfig.nvim` + `nvim-lspconfig` | LSP installer/manager. Ensured: `lua_ls`, `rust_analyzer`, `clangd`, `eslint`, `pyre` (`automatic_enable = true`). Custom `lua_ls`: `vim` as global |
| [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | Format-on-save (`BufWritePre`, 500ms, `lsp_format = "fallback"`). `lua: stylua`, `python: isort + black`, `javascript: prettierd/prettier`, `c: clangd-format` |
| [folke/flash.nvim](https://github.com/folke/flash.nvim) | Jump navigation (`VeryLazy`) |
| [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git gutters |
| [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) + `nvim-web-devicons` | Statusline (`theme = auto`) |
| [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Floating terminal (`size = 20`, `border = curved`) |
| [folke/which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints (triggers on `<leader>` in `n,v`, `VeryLazy`) |

## Structure

```
init.lua                 # leader, requires config.*, sets colorscheme
lazy.lua                 # (root bootstrap, unused) — actual spec is lua/config/lazy.lua
lua/config/
  options.lua            # options
  keymaps.lua            # core keymaps
  autocmds.lua           # yank highlight
  lazy.lua               # lazy.nvim bootstrap + { import = "plugins" }
lua/plugins/
  blink-cmp.lua  conform.lua  cyberdream.lua  flash.lua
  gitsigns.lua   lualine.lua  mason.lua       mini.lua
  telescope.lua  toggleterm.lua  treesitter.lua  which-key.lua
```

## Options (`lua/config/options.lua`)

`number` + `relativenumber`, `tabstop/shiftwidth = 4` + `expandtab`, `nowrap`, `ignorecase` + `smartcase`, `termguicolors`, `clipboard = unnamedplus`, `scrolloff = 10`, `timeoutlen = 290`.

Autocmd: highlight on yank (`TextYankPost`).

## Keymaps

Core (`lua/config/keymaps.lua`):

| Mode | Key | Action |
| ---- | --- | ------ |
| n | `<leader>w` | `:w` Save |
| n | `<leader>q` | `:q` Quit |
| i | `jk` | `<Esc>` |
| n,v | `<leader>l` | `$` end of line |
| n | `<leader>h` | `^` start of line |
| n | `H` | Prev buffer |
| n | `L` | Next buffer |

Plugin keys:

| Plugin | Key | Action |
| ------ | --- | ------ |
| mini.files | `<leader>e` | `MiniFiles.open()` |
| telescope | `<leader><leader>` | `find_files` |
| telescope | `<leader>ff` | `live_grep` |
| flash | `s` (n,x,o) | `flash.jump()` |
| flash | `S` (n,x,o) | `flash.treesitter()` |
| flash | `r` (o) | `flash.remote()` |
| flash | `R` (o,x) | `flash.treesitter_search()` |
| flash | `<C-s>` (c) | `flash.toggle()` |
| toggleterm | `<C-/>` / `<C-_>` (n,i,t) | `ToggleTerm` |
| which-key | `<leader>?` | Buffer-local keymaps |
| blink.cmp | `<C-space>` / `<C-e>` / `<CR>` / `<Tab>` / `<S-Tab>` / `<Up/Down>` / `<C-j/k>` / `<C-b/f>` | show docs / hide / accept / snippet fwd/bwd / select next-prev / scroll docs |

## Requirements

- Neovim >= 0.11 (uses `vim.lsp.config`, `vim.uv`)
- `git`, a Nerd Font, `ripgrep` (for Telescope `live_grep`)
- LSP servers installed via Mason + formatters (`stylua`, `isort`, `black`, `prettierd`/`prettier`, `clang-format`) as needed

## Install

```sh
# backup old config, then:
git clone <this-repo> ~/.config/nvim
nvim  # lazy.nvim bootstraps + installs plugins automatically
```

