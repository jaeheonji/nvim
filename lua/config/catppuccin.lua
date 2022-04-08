local present, catppuccin = pcall(require, "catppuccin")
if not present then
    return
end

local M = {}

local default_settings = {
    transparent_background = true,
    term_colors = true,
    integrations = {
        lsp_trouble = true,
        which_key = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },
    },
}

M.setup = function()
    catppuccin.setup(default_settings)

    vim.cmd([[ colorscheme catppuccin ]])
end

return M
