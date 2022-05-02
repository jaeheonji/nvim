local M = {}

local config = require("core.utils").config()

M.init = function()
    local themes = config.themes
    local modname = string.format("themes.%s", themes.name)

    local ok, theme = pcall(require, modname)
    if not ok then
        error("Unsupported themes: " .. themes.name)
        return
    end

    theme.setup()
end

return M
