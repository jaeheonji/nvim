local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local settings = require("core.utils").override("lspconfig", {
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
})

for k, v in pairs(settings.servers) do
    lspconfig[k].setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            if v.on_attach ~= nil then
                v.on_attach(client, bufnr)
            end
        end,
        settings = v.settings,
    })
end
