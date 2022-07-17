local M = {}

local config = require("core.utils").config()

local default_settings = {
    transparent_background = config.themes.transparent,
    term_colors = true,
    integrations = {
        lsp_trouble = true,
        which_key = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },
        bufferline = false,
    },
}

M.setup = function()
    local ok, catppuccin = pcall(require, "catppuccin")
    if not ok then
        return
    end

    catppuccin.setup(default_settings)

    vim.cmd("colorscheme catppuccin")

    local highlights = require("themes.catppuccin.highlights")
    require("themes.utils").syntax(highlights)
end

return M
