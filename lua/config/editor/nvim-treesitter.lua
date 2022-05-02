local present, configs = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

local M = {}

local opt = vim.opt

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

    local languages = require("core.utils").config().languages
    default_settings.ensure_installed = vim.list_extend(default_settings.ensure_installed, languages)

    configs.setup(default_settings)
end

return M
