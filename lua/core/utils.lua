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

M.override = function(plugin, default_settings)
    local settings = M.config().plugins.override[plugin]
    if settings == nil then
        return default_settings
    end

    return vim.tbl_deep_extend("force", default_settings, settings)
end

M.diagnostic = function()
    local signs = { Error = "\u{f146}", Warn = "\u{f14a}", Hint = "\u{f0fd}", Info = "\u{f14d}" }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

return M
