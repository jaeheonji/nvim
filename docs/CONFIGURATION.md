# Example of User Configuration

```lua
local g = vim.g

local RefreshGuiFont = function()
    vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

local ResizeGuiFont = function(delta)
    g.gui_font_size = g.gui_font_size + delta
    RefreshGuiFont()
end

local ResetGuiFont = function()
    g.gui_font_size = g.gui_font_default_size
    RefreshGuiFont()
end

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

            if g.neovide then
                g.neovide_cursor_vfx_mode = "torpedo"

                g.gui_font_default_size = 9
                g.gui_font_size = g.gui_font_default_size
                g.gui_font_face = "JetBrainsMono Nerd Font"

                RefreshGuiFont()
            end
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
            local default_opts = { noremap = true, silent = true }
            local map = vim.keymap.set

            if g.neovide then
                map("n", "<C-]>", function()
                    ResizeGuiFont(1)
                end, default_opts)
                map("n", "<C-[>", function()
                    ResizeGuiFont(-1)
                end, default_opts)

                map({ "n", "v" }, "<C-c>", '"+y', default_opts)
                map({ "n" }, "<C-v>", '"+p', default_opts)
            end
        end,
    },

    -- Set plugin configurations
    plugins = {
        custom = {
            { -- fidget.nvim
                "j-hui/fidget.nvim",
                after = "nvim-lspconfig",
                config = function()
                    require("fidget").setup({ window = { blend = 0 } })
                end,
            },
            { -- rust-tools.nvim
                "simrat39/rust-tools.nvim",
                ft = { "rust" },
                config = function()
                    require("rust-tools").setup({
                        tools = {
                            hover_actions = {
                                border = "single",
                                auto_focus = true,
                            },
                        },
                        server = {
                            capabilities = require("cmp_nvim_lsp").update_capabilities(
                                vim.lsp.protocol.make_client_capabilities()
                            ),
                            handlers = {
                                ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
                                ["textDocument/signatureHelp"] = vim.lsp.with(
                                    vim.lsp.handlers.signature_help,
                                    { border = "single" }
                                ),
                            },
                            on_attach = function(_, buf)
                                vim.api.nvim_buf_set_option(buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")
                                vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
                                vim.api.nvim_buf_set_option(buf, "tagfunc", "v:lua.vim.lsp.tagfunc")
                            end,
                        },
                    })
                end,
            },
            { -- crates.nvim
                "saecki/crates.nvim",
                tag = "v0.2.1",
                event = { "BufRead Cargo.toml" },
                config = function()
                    require("crates").setup()

                    vim.api.nvim_create_autocmd("BufRead", {
                        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
                        pattern = "Cargo.toml",
                        callback = function()
                            require("cmp").setup.buffer({ sources = { { name = "crates" } } })
                        end,
                    })
                end,
            },
        },
        override = {
            ["nvim-treesitter"] = {
                ensure_installed = { "lua", "rust", "go", "fish" },
            },
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
                    gopls = {},
                    golangci_lint_ls = {},
                },
            },
            ["null-ls"] = {
                sources = {
                    "code_actions.gitsigns",
                    "formatting.stylua",
                },
            },
        },
    },

    -- Set custom hook functions
    hooks = {
        pre_setup = function() end,
        post_setup = function()
            -- Auto installation of LSP
            local function ensure_installed(packages)
                local ok, registry = pcall(require, "mason-registry")
                if not ok then
                    return
                end

                for _, name in ipairs(packages) do
                    local package = registry.get_package(name)
                    if package:is_installed() == false then
                        package:install()
                    end
                end
            end

            ensure_installed({ "stylua", "lua-language-server", "rust-analyzer", "gopls", "golangci-lint-langserver" })
        end,
    },
}
```
