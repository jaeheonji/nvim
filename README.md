<h1 align="center">nvim</h1>

<div align="center">
    <p>
        <a href="https://github.com/jaeheonji/nvim/pulse">
            <img alt="Last Commit" src="https://img.shields.io/github/last-commit/jaeheonji/nvim?logo=github&style=flat-square"/>
        </a>
        <a href="https://github.com/neovim/neovim">
            <img alt="Neovim" src="https://img.shields.io/badge/neovim-0.7%2B-green?style=flat-square&logo=neovim"/>
        </a>
    
</div>

<p align="center">
Just <code>nvim</code>, it provides a good neovim experience that is easy to use with a amazing community plugins.


## Screenshots

|                                                                                                                     |                                                                                                                     |                                                                                                                     |
|---------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| ![example01](https://user-images.githubusercontent.com/32578710/167192342-38865597-ed46-480b-8f30-9211ead925f9.png) | ![example02](https://user-images.githubusercontent.com/32578710/167192639-99e241a7-7f4e-4bd6-b1ca-18a69ae28cad.png) | ![example03](https://user-images.githubusercontent.com/32578710/167192657-186790cf-dd7d-435f-8929-08cbc5888ebf.png) |

## Requirements

* [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
* [Neovim 0.7+](https://github.com/neovim/neovim)
* Plugin Requirements:
    * [ripgrep](https://github.com/BurntSushi/ripgrep) (live grep for `telescope`)
    * `curl` or `wget` (`nvim-lsp-installer`)

## Installation

**Clone the repository**

```bash
git clone https://github.com/jaeheonji/nvim $HOME/.config/nvim
```

And simply run `nvim` and the plugin will be installed automatically.

## Configuration

Copy default config file to `lua/custom.lua`

```bash
# pwd: $HOME/.config/nvim
cp lua/core/config.lua lua/custom.lua
```

current config file supports the following options:

```lua
-- Default Configurations
return {
    themes = {
        -- The name of theme
        -- Currently, supports two themes ('dracula', 'catppuccin')
        name = "catppuccin",

        -- Transparent the background of the theme
        transparent = true,
    },

    -- Use the smart-split plugin instead of the default key-binding
    use_smart_split = true,

    -- Language Support
    -- This options affects Treesitter and LSP
    languages = { "lua" },
}
```

## Plugins

<details><summary>Common</summary>

* [packer.nvim](https://github.com/wbthomason/packer.nvim) - A use-package inspired plugin manager for Neovim
* [impatient.nvim](https://github.com/lewis6991/impatient.nvim) - Improve startup time for Neovim
* [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - plenary: full; complete; entire; absolute; unqualified
* [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - lua `fork` of vim-web-devicons for neovim
* [which-key.nvim](https://github.com/folke/which-key.nvim) - Create key bindings that stick

</details>
<details><summary>Color Scheme</summary>

* [Dracula](https://github.com/dracula/vim) - Dark theme for Vim
* [Catppuccin](https://github.com/catppuccin/nvim) - Soothing pastel theme for NeoVim

</details>
<details><summary>Editing Supports</summary>

* [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - Indent guides for Neovim
* [Pretty Fold](https://github.com/anuvyklack/pretty-fold.nvim) - Foldtext customization and folded region preview in Neovim
* [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autopairs for neovim written by lua
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter configurations and abstraction layer for Neovim
* [vim-visual-multi](https://github.com/mg979/vim-visual-multi) - Multiple cursors plugin for vim/neovim

</details>
<details><summary>Interface</summary>

* [α alpha-nvim](https://github.com/goolord/alpha-nvim) - A lua powered greeter like vim-startify / dashboard-nvim
* [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - A snazzy bufferline for Neovim
* [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - A blazing fast and easy to configure neovim statusline plugin written in pure lua
* [Neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) - Neovim plugin to manage the file system and other tree like structures
* [Cosmic-UI](https://github.com/CosmicNvim/cosmic-ui) - Cosmic-UI is a simple wrapper around specific vim functionality
* [Dressing.nvim](https://github.com/stevearc/dressing.nvim) - Neovim plugin to improve the default vim.ui interfaces

</details>
<details><summary>Utility</summary>

* [bufdelete.nvim](https://github.com/famiu/bufdelete.nvim) - Delete Neovim buffers without losing window layout
* [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens) - Hlsearch Lens for Neovim
* [stabilize.nvim](https://github.com/luukvbaal/stabilize.nvim) - Neovim plugin to stabilize window open/close events
* [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim) - Smart, directional Neovim split resizing and navigation
* [nvim-window-picker](https://github.com/s1n7ax/nvim-window-picker) - This plugins prompts the user to pick a window and returns the window id of the picked window
* [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim) - A tree like view for symbols in Neovim using the Language Server Protocol
* [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration for buffers
* [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Smart and powerful comment plugin for neovim
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Find, Filter, Preview, Pick. All lua, all the time
* [fidget.nvim](https://github.com/j-hui/fidget.nvim) - Standalone UI for nvim-lsp progress
* [trouble.nvim](https://github.com/folke/trouble.nvim) - A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
* [legendary.nvim](https://github.com/mrjones2014/legendary.nvim) - A legend for your keymaps, commands, and autocmds, with which-key.nvim integration
* [modes.nvim](https://github.com/mvllow/modes.nvim) - Prismatic line decorations for the adventurous vim user

</details>
<details><summary>LSP</summary>

* [lspconfig](https://github.com/neovim/nvim-lspconfig) - Quickstart configurations for the Nvim LSP client
* [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) - Neovim plugin that allows you to seamlessly manage LSP servers with `:LspInstall`
* [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) - LSP signature hint as you type
* [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion plugin for neovim coded in Lua
* [lspkind-nvim](https://github.com/onsails/lspkind.nvim) - vscode-like pictograms for neovim lsp completion items
* [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Set of preconfigured snippets for different languages

</details>
<details><summary>Languages</summary>

* Rust
    * [rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim) - Tools for better development in rust using neovim's builtin lsp
    * [crates.nvim](https://github.com/Saecki/crates.nvim) - A neovim plugin that helps managing crates.io dependencies

</details>
