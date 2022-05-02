local M = {}

M.get_colors = function()
    return require("themes.dracula.colors")
end

M.setup = function()
    vim.cmd("colorscheme dracula")

    local highlights = require("themes.dracula.highlights")
    require("themes.utils").syntax(highlights)
end

return M
