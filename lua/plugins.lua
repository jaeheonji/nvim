local utils = require("core.utils")
local config = utils.config()

local support_language = {
    rust = utils.get_language_server("rust"),
    typescript = utils.get_language_server("typescript"),
}

return {
    -- Packer can manage itself
    { "wbthomason/packer.nvim" },

    -- Common Plugins
    { "lewis6991/impatient.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },

    -- Color Scheme
    { "catppuccin/nvim", as = "catppuccin" },
    { "dracula/vim", as = "dracula" },

    -- Editor
    { "mg979/vim-visual-multi" },
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("config.editor.nvim-treesitter").setup()
        end,
    },
    {
        "anuvyklack/pretty-fold.nvim",
        requires = {
            "anuvyklack/fold-preview.nvim",
            "anuvyklack/nvim-keymap-amend",
        },
        config = function()
            require("config.editor.pretty-fold").setup()
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("config.editor.nvim-autopairs").setup()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function()
            require("config.editor.indent-blankline").setup()
        end,
    },

    -- Basic Interface
    {
        "goolord/alpha-nvim",
        config = function()
            require("config.interface.alpha").setup()
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { "MunifTanjim/nui.nvim" },
        cmd = "Neotree",
        config = function()
            require("config.interface.neo-tree").setup()
        end,
    },
    {
        "akinsho/bufferline.nvim",
        config = function()
            require("config.interface.bufferline").setup()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("config.interface.lualine").setup()
        end,
    },
    {
        "stevearc/dressing.nvim",
        config = function()
            require("config.interface.dressing").setup()
        end,
    },
    {
        "CosmicNvim/cosmic-ui",
        requires = { "MunifTanjim/nui.nvim" },
        config = function()
            require("config.interface.cosmic-ui").setup()
        end,
    },

    -- Utility
    { "famiu/bufdelete.nvim", cmd = "Bdelete" },
    { "kevinhwang91/nvim-hlslens", event = "BufRead" },
    {
        "luukvbaal/stabilize.nvim",
        config = function()
            require("config.utils.stabilize").setup()
        end,
    },
    {
        "mrjones2014/smart-splits.nvim",
        opt = not config.use_smart_split,
        disable = not config.use_smart_split,
        config = function()
            require("config.utils.smart-splits").setup()
        end,
    },
    {
        "sindrets/winshift.nvim",
        event = "BufWinEnter",
        config = function()
            require("config.utils.winshift").setup()
        end,
    },
    {
        "s1n7ax/nvim-window-picker",
        config = function()
            require("config.utils.window-picker").setup()
        end,
    },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        setup = function()
            require("config.utils.symbols-outline").setup()
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufWinEnter",
        config = function()
            require("config.utils.gitsigns").setup()
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("config.utils.comment").setup()
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("config.utils.telescope").setup()
        end,
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require("config.utils.fidget").setup()
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        config = function()
            require("config.utils.trouble").setup()
        end,
    },
    {
        "mrjones2014/legendary.nvim",
        event = "BufWinEnter",
        config = function()
            require("config.utils.legendary").setup()
        end,
    },
    {
        "mvllow/modes.nvim",
        event = "BufRead",
        config = function()
            require("config.utils.modes").setup()
        end,
    },

    -- LSP (Language Server Protocol)
    { "ray-x/lsp_signature.nvim" },
    {
        "williamboman/nvim-lsp-installer",
        requires = { "neovim/nvim-lspconfig" },
        config = function()
            require("config.lsp.nvim-lsp-installer").setup()
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("config.lsp.null-ls").setup()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        requires = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind-nvim",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("config.lsp.nvim-cmp").setup()
        end,
    },

    -- Language Extensions
    {
        "simrat39/rust-tools.nvim",
        opt = not support_language.rust,
        disable = not support_language.rust,
    },
    {
        "saecki/crates.nvim",
        opt = not support_language.rust,
        disable = not support_language.rust,
        event = { "BufRead Cargo.toml" },
        config = function()
            require("config.language.crates").setup()
        end,
    },
    {
        "jose-elias-alvarez/typescript.nvim",
        opt = not support_language.typescript,
        disable = not support_language.typescript,
    },

    -- Keyboard Bindings
    {
        "folke/which-key.nvim",
        after = "legendary.nvim",
        event = "BufWinEnter",
        config = function()
            require("config.which-key").setup()
        end,
    },
}
