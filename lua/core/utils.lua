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

return M
