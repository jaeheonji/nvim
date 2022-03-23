local present, alpha = pcall(require, "alpha")
if not present then
    return
end

local M = {}

function M.setup()
    local config = require("alpha.themes.theta").config
    alpha.setup(config)
end

return M
