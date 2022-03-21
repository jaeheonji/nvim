local present, configs = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

local M = {}

local opt = vim.opt

local default = {
    ensure_installed = {},

    -- Install languages synchronously
    sync_install = true,

    highlight = { enable = true }
}

function M.setup()
    -- Tree-sitter based folding
    opt.foldmethod = "expr"
    opt.foldexpr = "nvim_treesitter#foldexpr()"
    opt.foldcolumn = "auto"
    opt.foldlevelstart = 1

    local languages = require("core.utils").config().languages
    default.ensure_installed = vim.list_extend(default.ensure_installed, languages)

    configs.setup(default)
end

return M
