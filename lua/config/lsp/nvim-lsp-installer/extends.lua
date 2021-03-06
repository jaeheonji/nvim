local M = {}

M.setup_diagnostic = function()
    local signs = { Error = [[📛]], Warn = [[👎]], Hint = [[🤔]], Info = [[🤖]] }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({
        severity_sort = true,
        virtual_text = { prefix = "😈" },
    })
end

M.on_attach = function(client, bufnr, disable_formatting)
    if disable_formatting then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end

    -- Key-bindings for LSP
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

    -- Setup LSP Signiture plguins
    local ok, lsp_signature = pcall(require, "lsp_signature")
    if ok then
        lsp_signature.on_attach({
            bind = true,
            handler_opts = { border = "single" },
        }, bufnr)
    end
end

M.handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
}

M.enhance_server_opts = {
    ["sumneko_lua"] = function(opts)
        opts.handlers = M.handlers
        opts.settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                telemetry = { enable = false },
            },
        }
        opts.on_attach = function(client, bufnr)
            M.on_attach(client, bufnr, true)
        end
    end,
    ["tsserver"] = function(opts)
        opts.handlers = M.handlers
        opts.on_attach = function(client, bufnr)
            M.on_attach(client, bufnr, true)
        end
    end,
}

return M
