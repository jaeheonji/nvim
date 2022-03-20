return {
    -- Packer can manage itself
    { "wbthomason/packer.nvim" },

    -- Common plugins
    { "lewis6991/impatient.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },

    -- Lush for Neovim themes
    { "rktjmp/lush.nvim" },
    {
        "dracula/vim",
        as = "dracula",
        config = function() vim.cmd([[ colorscheme dracula ]]) end
    },

    -- Syntax
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function() require("config.nvim-treesitter").setup() end
    },
    {
        "anuvyklack/pretty-fold.nvim",
        config = function() require("config.pretty-fold").setup() end
    },
    {
        "windwp/nvim-autopairs",
        config = function() require("config.nvim-autopairs").setup() end
    },

    -- User Interface & Experience
    { "kevinhwang91/nvim-hlslens", event = "BufRead" },
    { "famiu/bufdelete.nvim", cmd = "Bdelete" },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function() require("config.indent-blankline").setup() end
    },
    {
        "kyazdani42/nvim-tree.lua",
        opt = true,
        cmd = { "NvimTreeToggle" },
        config = function() require("config.nvim-tree").setup() end
    },
    {
        "numToStr/Comment.nvim",
        config = function() require("config.comment").setup() end
    },

    -- Language Server
    { "neovim/nvim-lspconfig" },
    {
        "williamboman/nvim-lsp-installer",
        config = function() require("config.nvim-lsp-installer").setup() end
    },
    --[[ {
        "ray-x/lsp_signature.nvim",
        config = function() require("lsp_signature").setup({ bind = true, handler_opts = { border = "single" } }) end
    }, ]]
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
        config = function() require("config.nvim-cmp").setup() end
    },

    -- Keyboard Bindings
    {
        "folke/which-key.nvim",
        event = "BufWinEnter",
        config = function() require("config.which-key").setup() end
    },
}
