local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    return
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
}

local settings = require("core.utils").override("lspconfig", {
    servers = {},
})

for name, options in pairs(settings.servers) do
    local server = vim.tbl_get(lspconfig, name)
    if server == nil then
        goto continue
    end

    local success, error = pcall(vim.validate, {
        capabilities = { options.capabilities, "t", true },
        settings = { options.settings, "t", true },
        handlers = { options.handlers, "t", true },
        on_attach = { options.on_attach, "f", true },
    })

    if not success then
        local msg = string.format("Error occurred while attach to %s LSP server: %s", name, error)
        vim.notify(msg, "error")
        goto continue
    end

    server.setup({
        capabilities = options.capabilities or capabilities,
        handlers = options.handlers or handlers,
        on_attach = options.on_attach,
        settings = options.settings,
    })

    ::continue::
end
