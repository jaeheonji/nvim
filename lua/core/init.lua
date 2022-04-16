local M = {}

M.setup = function()
    -- Load core modules
    local modules = {
        "core.options",
        "core.key-bindings",
    }

    for _, module in ipairs(modules) do
        local ok, callback = pcall(require, module)
        if not ok then
            error("Could not be loaded '" .. module .. "'\n" .. callback)
        end
    end

    -- Initialize defualt key bindings
    require("core.key-bindings").init()

    -- Initialize the packer
    local packer = require("core.packer")
    packer.init()

    local plugins = require("plugins")
    packer.load(plugins)

    -- Initialize themes
    require("themes").init()
end

return M
