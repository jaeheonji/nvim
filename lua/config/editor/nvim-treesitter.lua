local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
    return
end

local opt = vim.opt

local M = {}

local default_settings = {
    ensure_installed = {},

    -- Install languages synchronously
    sync_install = true,

    highlight = { enable = true },

    matchup = { enable = true },
}

M.setup = function()
    -- Tree-sitter based folding
    opt.foldmethod = "expr"
    opt.foldexpr = "nvim_treesitter#foldexpr()"
    opt.foldcolumn = "auto"
    opt.foldlevelstart = 1

    local tree_sitter = require("core.utils").config().language.tree_sitter
    default_settings.ensure_installed = vim.list_extend(default_settings.ensure_installed, tree_sitter)

    configs.setup(default_settings)
end

return M
