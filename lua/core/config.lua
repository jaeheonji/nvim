local M = {}

-- Default Configurations
M.config = {
    -- Transparent the background of the theme
    transparent = true,

    -- Use the smart-split plugin instead of the default key-binding
    use_smart_split = true,

    -- Language Support
    -- This options affects Treesitter and LSP
    languages = { "lua" },
}

return M
