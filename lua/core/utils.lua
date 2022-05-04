local M = {}

M.impatient = function()
    local ok, impatient = pcall(require, "impatient")
    if ok then
        impatient.enable_profile()
    end
end

M.config = function()
    local config = require("core.config")

    local ok, custom_config = pcall(require, "custom")
    if ok then
        config = vim.tbl_deep_extend("force", config, custom_config)
    end

    return config
end

M.is_contain_language = function(name)
    local languages = M.config().languages
    if vim.tbl_contains(languages, name) then
        return true
    end
    return false
end

return M
