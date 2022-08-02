return {
    -- Packer can manage itself
    { "wbthomason/packer.nvim" },

    { "lewis6991/impatient.nvim" },

    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },

    {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("config.catppuccin")
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "MunifTanjim/nui.nvim",
        },
        cmd = "Neotree",
        config = function()
            require("config.neo-tree")
        end,
    },

    {
        "akinsho/bufferline.nvim",
        tag = "v2.*",
        config = function()
            require("config.bufferline")
        end,
    },

    {
        "feline-nvim/feline.nvim",
        -- branch = "0.5-compat",
        config = function()
            require("config.feline")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("config.nvim-treesitter")
        end,
    },

    {
        "windwp/nvim-autopairs",
        event = "BufWinEnter",
        config = function()
            require("config.nvim-autopairs")
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufWinEnter",
        config = function()
            require("config.indent-blankline")
        end,
    },

    {
        "anuvyklack/pretty-fold.nvim",
        event = "BufWinEnter",
        config = function()
            require("config.pretty-fold")
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "BufWinEnter",
        config = function()
            require("config.gitsigns")
        end,
    },

    {
        "williamboman/mason.nvim",
        config = function()
            require("config.mason")
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
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind-nvim",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("config.cmp")
            require("config.nvim-lspconfig")
        end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("config.null-ls")
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {
            "nvim-telescope/telescope-ui-select.nvim",
        },
        cmd = "Telescope",
        config = function()
            require("config.telescope")
        end,
    },

    {
        "numToStr/Comment.nvim",
        keys = { "gc", "gb", "g<", "g>" },
        config = function()
            require("config.comment")
        end,
    },

    {
        "mrjones2014/smart-splits.nvim",
        config = function()
            require("config.smart-splits")
        end,
    },

    {
        "folke/which-key.nvim",
        -- cmd = "WhichKey",
        config = function()
            require("config.which-key")
        end,
    },

    { "famiu/bufdelete.nvim", cmd = "Bdelete" },
}
