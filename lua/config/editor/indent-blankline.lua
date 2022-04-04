local present, indent = pcall(require, "indent_blankline")
if not present then
    return
end

local M = {}

local default_settings = {
    space_char_blankline = " ",
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = true,
    show_first_indent_level = false,

    filetype_exclude = {
        "help",
        "git",
        "markdown",
        "text",
        "terminal",
        "lspinfo",
        "packer",
        "dashboard",
    },
    buftype_exclude = {
        "terminal",
        "nofile",
    },
}

M.setup = function()
    -- vim.opt.list = true
    -- vim.opt.listchars:append("space:⋅")

    indent.setup(default_settings)
end

return M
