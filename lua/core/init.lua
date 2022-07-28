local opt = vim.opt

local config = require("core.utils").config()

local M = {}

M.setup = function()
    local options = config.options

    if options.enable_default then
        require("core.options")
    end

    options.setup()
end

return M
