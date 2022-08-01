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
            { "famiu/bufdelete.nvim", cmd = "Bdelete" },
        },
        override = {
            ["lspconfig"] = {
                servers = {
                    sumneko_lua = {
                        on_attach = function(client)
                            client.resolved_capabilities.document_formatting = false
                        end,
                        settings = {
                            Lua = {
                                diagnostics = { globals = { "vim" } },
                                telemetry = { enable = false },
                            },
                        },
                    },
                },
            },

            ["null-ls"] = {
                sources = {
                    require("null-ls").builtins.code_actions.gitsigns,
                    require("null-ls").builtins.formatting.stylua,
                },
            },
        },
    },
}
