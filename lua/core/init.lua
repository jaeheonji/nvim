local config = require("core.utils").config()

local M = {}

M.setup = function()
    -- Options
    local options = config.options

    if options.enable_default then
        require("core.options")
    end

    options.setup()

    -- Key-bindings
    local key_bindings = config.key_bindings

    if key_bindings.enable_default then
        require("core.key-bindings")
    end

    key_bindings.setup()

    -- Plugins
    local plugins = vim.list_extend(require("plugins"), config.plugins.custom)
    require("core.packer").setup(plugins)
end

M.pre_setup = function()
    config.hooks.pre_setup()
end

M.post_setup = function()
    -- Set custom diagnostics symbols
    require("core.utils").diagnostic()

    config.hooks.post_setup()
end

return M
