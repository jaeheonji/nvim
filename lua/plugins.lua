return {
    -- Packer can manage itself
    { "wbthomason/packer.nvim" },

    -- Common plugins
    { "lewis6991/impatient.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },

    -- Dracula for Vim
    {
        "dracula/vim",
        after = "packer.nvim",
        config = function()
            vim.cmd([[ colorscheme dracula ]])
        end,
    }
}
