-- Default Configurations
return {
    -- Set colorscheme
    colorscheme = {
        name = "catppuccin",
        transparency = false,
    },

    -- Set vim options
    -- https://neovim.io/doc/user/options.html
    options = {
        -- Whether to use default options
        -- you can find out default in `lua/core/options.lua`
        enable_default = true,

        -- User custom options
        setup = function()
            -- example:
            -- vim.g.catppuccin_flavour = "macchiato"
        end,
    },

    -- Set vim key-bindings
    key_bindings = {
        -- you can find out default in `lua/core/key-bindings.lua`
        enable_default = true,

        -- User custom key-bindings
        setup = function()
            -- example:
            -- vim.api.nvim_set_keymap(...)
        end,
    },

    -- Set plugin configurations
    plugins = {
        custom = {
            -- example:
            -- "nvim-lua/plenary.nvim"
        },
        override = {
            -- example:
            -- ["lspconfig"] = { ... },
        },
    },

    -- Set custom hook functions
    hooks = {
        pre_setup = function() end,
        post_setup = function() end,
    },
}
