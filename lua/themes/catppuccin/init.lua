local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
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

M.color_palette = function()
    return require("catppuccin.api.colors").get_colors()
end

M.setup = function(transparent)
    default_settings.transparent_background = transparent
    catppuccin.setup(default_settings)
end

return M
