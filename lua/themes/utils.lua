local M = {}

local config = require("core.utils").config()

M.hl = function(group, color)
    local style = color.style and "gui=" .. color.style or "gui=NONE"
    local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
    local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
    local sp = color.sp and "guisp=" .. color.sp or ""
    local blend = color.blend and "blend=" .. color.blend or ""
    local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp .. " " .. blend

    vim.cmd(hl)
    if color.link then
        vim.cmd("highlight! link " .. group .. " " .. color.link)
    end
end

M.syntax = function(theme_name)
    local modname = string.format("themes.%s.highlights", theme_name)
    local ok, highlights = pcall(require, modname)
    if not ok then
        return
    end

    for group, colors in pairs(highlights) do
        M.hl(group, colors)
    end
end

M.tp = function(color)
    local transparent = config.themes.transparent
    if transparent then
        return "NONE"
    end

    return color
end

return M
