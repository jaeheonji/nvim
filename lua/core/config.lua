-- Default Configurations
return {
    -- Set colorscheme
    colorscheme = "catppuccin",

    -- Set vim options
    -- https://neovim.io/doc/user/options.html
    options = {
        -- Whether to use default options
        -- you can find out default in `lua/core/options.lua`
        enable_default = true,

        -- Set custom options
        setup = function()
            -- example:
            -- vim.opt.number = true
        end
    },
}
