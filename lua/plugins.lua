local utils = require("core.utils")

return {
    -- Packer can manage itself
    { "wbthomason/packer.nvim" },

    -- Common Plugins
    { "lewis6991/impatient.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },

    -- Lush for Neovim themes
    { "rktjmp/lush.nvim" },
    {
        "dracula/vim",
        as = "dracula",
        config = function()
            vim.cmd([[ colorscheme dracula ]])
        end,
    },

    -- Editor
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("config.editor.nvim-treesitter").setup()
        end,
    },
    {
        "anuvyklack/pretty-fold.nvim",
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
        "kyazdani42/nvim-tree.lua",
        cmd = { "NvimTreeToggle" },
        config = function()
            require("config.interface.nvim-tree").setup()
        end,
    },
    {
        "akinsho/bufferline.nvim",
        event = "BufWinEnter",
        config = function()
            require("config.interface.bufferline").setup()
        end,
    },

    -- Utility
    { "kevinhwang91/nvim-hlslens", event = "BufRead" },
    { "famiu/bufdelete.nvim", cmd = "Bdelete" },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
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
        cmd = "Telescope",
        requires = { "nvim-telescope/telescope-ui-select.nvim" },
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
        "folke/todo-comments.nvim",
        cmd = { "TodoLocList", "TodoTelescope", "TodoQuickFix" },
        config = function()
            require("config.utils.todo-comments").setup()
        end,
    },

    -- LSP (Language Server Protocol)
    { "neovim/nvim-lspconfig" },
    { "ray-x/lsp_signature.nvim" },
    {
        "williamboman/nvim-lsp-installer",
        config = function()
            require("config.nvim-lsp.installer").setup()
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("config.nvim-lsp.null-ls").setup()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind-nvim",
        },
        config = function()
            require("config.nvim-lsp.nvim-cmp").setup()
        end,
    },

    -- Language Extensions
    {
        "simrat39/rust-tools.nvim",
        opt = true,
        disable = not utils.is_contain_language("rust"),
    },
    {
        "saecki/crates.nvim",
        opt = true,
        disable = not utils.is_contain_language("rust"),
        event = { "BufRead Cargo.tom" },
        config = function()
            require("config.language.crates").setup()
        end,
    },

    -- Keyboard Bindings
    {
        "folke/which-key.nvim",
        event = "BufWinEnter",
        config = function()
            require("config.which-key").setup()
        end,
    },
}
