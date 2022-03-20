local M = {}

function M.impatient()
    local present, impatient = pcall(require, "impatient")
    if present then
        impatient.enable_profile()
    end
end

function M.config()
    local config = require("core.config").config
    return config
end

function M.is_contain_language(name)
    local languages = M.config().languages
    if vim.tbl_contains(languages, name) then
        return true
    end
    return false
end

return M
