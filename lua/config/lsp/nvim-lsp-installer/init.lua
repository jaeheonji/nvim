local ok, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
    return
end

local M = {}

local extends = require("config.lsp.nvim-lsp-installer.extends")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

M.setup = function()
    extends.setup_diagnostic()

    local servers = {}

    local language = require("core.utils").config().language
    for _, items in pairs(language.server) do
        servers = vim.list_extend(servers, items)
    end

    nvim_lsp_installer.setup({
        ensure_installed = servers,
        automatic_installation = true,
    })

    local lspconfig = require("lspconfig")
    for _, server in pairs(servers) do
        local opts = {
            capabilities = capabilities,
            on_attach = extends.on_attach,
            flags = { debounce_text_changes = 150 },
        }

        if extends.enhance_server_opts[server] then
            -- Enhance the default opts with the server-specific ones
            extends.enhance_server_opts[server](opts)
        end

        if server == "rust_analyzer" then
            local available, rust_tools = pcall(require, "rust-tools")
            if available then
                rust_tools.setup({
                    server = opts,
                    tools = { hover_actions = { auto_focus = true, border = "single" } },
                })

                goto skip
            end
        elseif server == "tsserver" then
            local available, typescript = pcall(require, "typescript")
            if available then
                typescript.setup({
                    server = opts,
                })

                goto skip
            end
        end

        lspconfig[server].setup(opts)

        ::skip::
    end
end

return M
