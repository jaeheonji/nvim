<h1 align="center">nvim</h1>

<div align="center">
    <a href="https://github.com/jaeheonji/nvim/pulse">
        <img alt="Last Commit" src="https://img.shields.io/github/last-commit/jaeheonji/nvim?logo=github&style=flat-square"/>
    </a>
    <a href="https://github.com/neovim/neovim">
        <img alt="Neovim" src="https://img.shields.io/badge/neovim-0.7%2B-green?style=flat-square&logo=neovim"/>
    </a>
</div>

<p align="center">
Just `nvim`, it provides a good neovim experience that is easy to use with a amazing community plugins.
</p>

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
