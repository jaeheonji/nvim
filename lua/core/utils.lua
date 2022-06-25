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

M.get_language_server = function(name)
    local language = M.config().language
    local server = vim.tbl_get(language.server, name)

    if server == nil then
        return false, nil
    end

    return true, server
end

return M
