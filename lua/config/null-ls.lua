local ok, null_ls = pcall(require, "null-ls")
if not ok then
    return
end

local settings = require("core.utils").override("null-ls", {
    sources = {},
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

local sources = {}
for _, s in pairs(settings.sources) do
    if type(s) == "string" then
        local builtins = vim.split(s, "%.")
        if builtins == nil then
            goto continue
        end

        local source = vim.tbl_get(null_ls.builtins, unpack(builtins))
        if source ~= nil then
            table.insert(sources, source)
        end
    else
        table.insert(sources, s)
    end

    ::continue::
end

settings.sources = sources

null_ls.setup(settings)
