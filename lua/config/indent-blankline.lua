local present, indent = pcall(require, "indent_blankline")
if not present then
    return
end

local M = {}

local default = {
    space_char_blankline = " ",
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

function M.setup()
    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")

    indent.setup(default)
end

return M
