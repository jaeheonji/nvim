local M = {}

function M.on_attach(client, bufnr, disable_formatting)
    if disable_formatting then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end

    -- keybindings for LSP
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
end


M.enhance_server_opts = {
    ["sumneko_lua"] = function(opts)
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
}

return M
