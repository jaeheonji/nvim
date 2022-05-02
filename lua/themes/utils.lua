local M = {}

local config = require("core.utils").config()

---Extract specific value of attribute from highlight group.
---@param group string The name of hightlight group.
---@param attribute string The name of attribute.
---@return string string The value of attribute.
M.extract = function(group, attribute)
    local ok, hl = pcall(vim.api.nvim_get_hl_by_name, group, true)
    if not ok then
        return ""
    end

    if attribute == "foreground" or attribute == "background" then
        return string.format("#%06X", hl[attribute])
    end

    return hl[attribute]
end

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

M.syntax = function(highlights)
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
