local ok, null_ls = pcall(require, "null-ls")
if not ok then
    return
end

local M = {}

local utils = require("core.utils")

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics

local sources = {
    completion.spell,
    code_actions.gitsigns,
}

M.setup = function()
    -- Lua
    if utils.is_contain_language("lua") then
        sources = vim.list_extend(sources, {
            formatting.stylua.with({
                extra_args = { "--indent-type", "Spaces" },
            }),
        })
    end

    -- Javascript/Typescript
    if utils.is_contain_language("typescript") then
        local dynamic_command = function(params)
            local command_resolver = require("null-ls.helpers.command_resolver")

            return command_resolver.from_node_modules(params)
                or command_resolver.from_yarn_pnp(params)
                or vim.fn.executable(params.command) == 1 and params.command
        end

        sources = vim.list_extend(sources, {
            formatting.prettier.with({
                dynamic_command = dynamic_command,
            }),
            diagnostics.eslint.with({
                dynamic_command = dynamic_command,
            }),
            code_actions.eslint.with({
                dynamic_command = dynamic_command,
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
