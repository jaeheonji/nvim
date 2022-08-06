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
        event = "BufWinEnter",
        tag = "v2.*",
        config = function()
            require("config.bufferline")
        end,
    },

    {
        "feline-nvim/feline.nvim",
        event = "BufWinEnter",
        config = function()
            require("config.feline")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        run = ":TSUpdate",
        config = function()
            require("config.nvim-treesitter")
        end,
    },

    {
        "windwp/nvim-autopairs",
        event = "BufRead",
        config = function()
            require("config.nvim-autopairs")
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        after = "nvim-treesitter",
        config = function()
            require("config.indent-blankline")
        end,
    },

    {
        "anuvyklack/pretty-fold.nvim",
        event = "BufRead",
        config = function()
            require("config.pretty-fold")
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = function()
            require("config.gitsigns")
        end,
    },

    {
        "williamboman/mason.nvim",
        after = "cmp-nvim-lsp",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        config = function()
            require("config.mason")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        after = "mason.nvim",
        config = function()
            require("config.nvim-lspconfig")
        end,
    },

    {
        "rafamadriz/friendly-snippets",
        event = "InsertEnter",
    },

    {
        "hrsh7th/nvim-cmp",
        after = "friendly-snippets",
        requires = {
            { "L3MON4D3/LuaSnip", after = "nvim-cmp" },
            { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
            { "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" },

            { "onsails/lspkind-nvim", after = "cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lsp-signature-help", after = "cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" },

            { "hrsh7th/cmp-path", after = "nvim-cmp" },
            { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
        },
        config = function()
            require("config.cmp")
        end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufRead",
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
        config = function()
            require("config.which-key")
        end,
    },

    {
        "goolord/alpha-nvim",
        config = function()
            require("config.alpha")
        end,
    },

    { "famiu/bufdelete.nvim", cmd = "Bdelete" },
}
