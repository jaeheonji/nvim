local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local options = {
    border = "single",
}

local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, options),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, options),
}

local settings = require("core.utils").override("lspconfig", {
    servers = {},
})

for k, v in pairs(settings.servers) do
    lspconfig[k].setup({
        capabilities = capabilities,
        handlers = handlers,
        on_attach = function(client, bufnr)
            if v.on_attach ~= nil then
                v.on_attach(client, bufnr)
            end
        end,
        settings = v.settings,
    })
end