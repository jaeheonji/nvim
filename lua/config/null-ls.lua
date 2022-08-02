local ok, null_ls = pcall(require, "null-ls")
if not ok then
    return
end

local settings = require("core.utils").override("null-ls", {
    sources = {
        require("null-ls").builtins.code_actions.gitsigns,
        require("null-ls").builtins.formatting.stylua,
    },
    on_attach = function(client, bufnr)
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
})

null_ls.setup(settings)
