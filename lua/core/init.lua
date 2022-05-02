local M = {}

M.setup = function()
    -- Load core modules
    local modules = {
        { name = "core.options", init = false },
        { name = "core.key-bindings", init = true },
        { name = "core.packer", init = true },
        { name = "themes", init = true },
    }

    for _, module in ipairs(modules) do
        local ok, callback = pcall(require, module.name)
        if not ok then
            error("Could not be loaded '" .. module.name .. "'\n" .. callback)
        end

        -- Initialize the core modules
        if module.init then
            callback.init()
        end
    end
end

return M
