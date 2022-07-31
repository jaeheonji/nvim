local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    return
end

local settings = require("core.utils").override("nvim-treesitter", {
    -- A list of parser names, or "all"
    ensure_installed = { "lua" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    highlight = {
        enable = true,
    },
})

treesitter.setup(settings)
