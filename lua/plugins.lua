return {
    -- Packer can manage itself
    { "wbthomason/packer.nvim" },

    { "lewis6991/impatient.nvim" },

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
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
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
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("config.bufferline")
        end,
    },

    {
        "feline-nvim/feline.nvim",
        branch = "0.5-compat",
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
        config = function()
            require("config.nvim-autopairs")
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("config.indent-blankline")
        end,
    },

    {
        "anuvyklack/pretty-fold.nvim",
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
}
