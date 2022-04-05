local M = {}

M.impatient = function()
    local present, impatient = pcall(require, "impatient")
    if present then
        impatient.enable_profile()
    end
end

M.config = function()
    local config = require("core.config")

    local present, custom_config = pcall(require, "custom")
    if present then
        config = vim.tbl_deep_extend("force", config, custom_config)
    end

    return config
end

M.transparentify = function(color)
    local transparent = M.config().transparent
    if transparent then
        return "NONE"
    else
        return color
    end
end

M.is_contain_language = function(name)
    local languages = M.config().languages
    if vim.tbl_contains(languages, name) then
        return true
    end
    return false
end

M.highlight = function(group_name, definition)
    local highlight_cmd = "hi " .. group_name
    if definition.fg then
        highlight_cmd = highlight_cmd .. " guifg=" .. definition.fg
    end

    if definition.bg then
        highlight_cmd = highlight_cmd .. " guibg=" .. definition.bg
    end

    if definition.style then
        local style = definition.style
        if type(style) == "table" then
            style = table.concat(style, ",")
        end

        highlight_cmd = highlight_cmd .. " gui=" .. style
    end

    vim.api.nvim_command(highlight_cmd)
end

return M
