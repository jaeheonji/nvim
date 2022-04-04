local present, installer = pcall(require, "nvim-lsp-installer")
if not present then
    return
end

local M = {}

local extends = require("config.lsp.nvim-lsp-installer.extends")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local available_lsp = {
    lua = { "sumneko_lua" },
    rust = { "rust_analyzer" },
    python = { "pylsp", "pyright" },
}

function M.setup()
    extends.setup_diagnostic()

    local servers = {}
    local names = vim.tbl_keys(available_lsp)

    local languages = require("core.utils").config().languages
    for _, language in pairs(languages) do
        if vim.tbl_contains(names, language) then
            servers = vim.list_extend(servers, available_lsp[language])
        end
    end

    for _, name in pairs(servers) do
        local server_is_found, server = installer.get_server(name)
        if server_is_found then
            -- Install LSP server
            if not server:is_installed() then
                print("Installing " .. name)
                server:install()
            end

            -- Setup LSP
            server:on_ready(function()
                local opts = {
                    capabilities = capabilities,
                    on_attach = extends.on_attach,
                    flags = { debounce_text_changes = 150 },
                }

                if extends.enhance_server_opts[name] then
                    -- Enhance the default opts with the server-specific ones
                    extends.enhance_server_opts[name](opts)
                end

                if server.name == "rust_analyzer" then
                    -- Initialize the LSP via rust-tools instead
                    local available, rust_tools = pcall(require, "rust-tools")
                    if available then
                        rust_tools.setup({
                            tools = { hover_actions = { auto_focus = true, border = "single" } },
                            server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
                        })
                        server:attach_buffers()
                    else
                        server:setup(opts)
                    end
                else
                    server:setup(opts)
                end
            end)
        end
    end
end

return M
