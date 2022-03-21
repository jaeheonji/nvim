local present, null_ls = pcall(require, "null-ls")
if not present then
    return
end

local M = {}

local utils = require("core.utils")

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion

local sources = {
    completion.spell,
    code_actions.gitsigns,
}

function M.setup()
    -- Lua
    if utils.is_contain_language("lua") then
        sources = vim.list_extend(sources, {
            formatting.stylua.with({
                extra_args = { "--indent-type", "Spaces" },
            }),
        })
    end

    null_ls.setup({
        sources = sources,
        on_attach = function(client)
            if client.resolved_capabilities.document_formatting then
                vim.cmd([[
                augroup LspFormatting
                    autocmd! * <buffer>
                    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
                augroup END
                ]])
            end
        end,
    })
end

return M
