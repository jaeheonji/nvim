local M = {}

local config = require("core.utils").config()

M.init = function()
    local themes = config.themes
    local modname = string.format("themes.%s", themes.name)

    local ok, theme = pcall(require, modname)
    if not ok then
        error("Unsupported themes: " .. themes.name)
        return
    else
        theme.setup(themes.transparent)
    end

    vim.cmd("colorscheme " .. themes.name)
    require("themes.utils").syntax(themes.name)
end

M.get = function(integration)
    local theme_name = config.themes.name
    local modname = string.format("themes.%s.integrations.%s", theme_name, integration)

    local ok, settings = pcall(require, modname)
    if not ok then
        error("Unsupported integrations: " .. integration)
        return
    end

    return settings
end

return M
