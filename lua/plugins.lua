local utils = require("core.utils")
local config = utils.config()

local support_language = {
    rust = utils.is_contain_language("rust"),
}

return {
    -- Packer can manage itself
    { "wbthomason/packer.nvim" },

    -- Common Plugins
    { "lewis6991/impatient.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },

    -- Dracula theme
    {
        "dracula/vim",
        as = "dracula",
        config = function()
            vim.cmd([[ colorscheme dracula ]])
            require("core.colors").init()
        end,
    },

    -- Editor
    { "andymass/vim-matchup" },
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
        "kyazdani42/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
        config = function()
            require("config.interface.nvim-tree").setup()
            require("core.colors").nvim_tree()
        end,
    },
    {
        "akinsho/bufferline.nvim",
        event = "BufWinEnter",
        config = function()
            require("config.interface.bufferline").setup()
        end,
        setup = function()
            require("core.key-bindings").bufferline()
        end,
    },
    {
        "feline-nvim/feline.nvim",
        requires = {
            {
                "SmiteshP/nvim-gps",
                config = function()
                    require("config.nvim-lsp.gps").setup()
                end,
            },
        },
        config = function()
            require("config.interface.feline").setup()
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
    {
        "kevinhwang91/nvim-hlslens",
        event = "BufRead",
        config = function()
            require("core.colors").hlslens()
        end,
    },
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
            require("core.key-bindings").smart_splits()
        end,
    },
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
        config = function()
            require("config.utils.telescope").setup()
            require("core.colors").telescope()
        end,
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require("config.utils.fidget").setup()
            require("core.colors").fidget()
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
    {
        "max397574/better-escape.nvim",
        event = "BufRead",
        config = function()
            require("config.utils.better-escape").setup()
        end,
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function()
            require("config.utils.zen-mode").setup()
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
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("config.nvim-lsp.cmp").setup()
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
            require("core.colors").which_key()
        end,
    },
}
