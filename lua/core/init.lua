local M = {}

function M.setup()
    -- Load core modules
    local modules = {
        "core.options"        
    }
    
    for _, module in ipairs(modules) do
        local ok, callback = pcall(require, module)
        if not ok then
            error("Could not be loaded '" .. module .. "'\n" .. callback)
        end
    end

    -- Initialize the packer
    local packer = require("core.packer")
    packer.init()

    local plugins = require("plugins")
    packer.load(plugins)

    require("colors").init()
end

return M
