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

M.is_contain_language = function(name)
    local languages = M.config().languages
    if vim.tbl_contains(languages, name) then
        return true
    end
    return false
end

return M
