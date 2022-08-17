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
Just <code>nvim</code>. It is an simple and extensible neovim config with awesome community plugins.
</p>

## :art: Screenshots

|                                                                                                                     |                                                                                                                    |                                                                                                                         |
|---------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| ![dashboard](https://user-images.githubusercontent.com/32578710/183421790-1235045f-1e72-4011-97c8-b03e0a0670ae.png) | ![windows](https://user-images.githubusercontent.com/32578710/183421918-7bbf2495-67dd-4df6-afcb-1bb6217678e1.png)  | ![whichkey](https://user-images.githubusercontent.com/32578710/183421998-de34ad24-2583-4a46-b955-b7a0799b4749.png)      |
| ![telescope](https://user-images.githubusercontent.com/32578710/183422041-6808945d-a7bd-417b-8fb9-347fde848794.png) | ![nvim-cmp](https://user-images.githubusercontent.com/32578710/183422079-c26cb953-d5d4-4b5c-bac4-2fd124f35d7a.png) | ![lsp-reference](https://user-images.githubusercontent.com/32578710/183422115-0e549755-0d89-4f2a-a23a-707f484914f5.png) |

## :wrench: Requirments

* [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
* [Neovim 0.7+](https://github.com/neovim/neovim)
* Plugin Requirements:
    * [ripgrep](https://github.com/BurntSushi/ripgrep) (live grep for `telescope`)
    * `curl` or `wget` (for `mason`)

> Note the screenshots used **JetBrainsMono Nerd Font**.

## :rocket: Installation

```bash
git clone https://github.com/jaeheonji/nvim $HOME/.config/nvim && nvim
```

## :sparkles: Features

* Soothing pastel theme by [catppuccin](https://github.com/catppuccin/nvim)
* Dashboard with [alpha-nvim](https://github.com/goolord/alpha-nvim)
* Buffer & Tab line with [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
* Neovim LSP with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) and [mason.nvim](https://github.com/williamboman/mason.nvim)
* Autocompletion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* Diagnositcs, code actions and more with [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
* Statusline with [feline.nvim](https://github.com/feline-nvim/feline.nvim)
* File browse with [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
* Fuzzy find with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
* Popup suggestions and key binding with [which-key.nvim](https://github.com/folke/which-key.nvim)
* Git integration for buffers with [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
* Syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* Autopair with [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
* Powerful commenting with [comment.nvim](https://github.com/numToStr/Comment.nvim)

A list of all plugins can be found [here](./docs/PLUGINS.md).
