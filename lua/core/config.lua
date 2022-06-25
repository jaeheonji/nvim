-- Default Configurations
return {
    themes = {
        -- The name of theme
        -- Currently, supports two themes ('dracula', 'catppuccin')
        name = "catppuccin",

        -- Transparent the background of the theme
        transparent = true,
    },

    -- Use the smart-split plugin instead of the default key-binding
    use_smart_split = true,

    -- Language Support
    language = {
        tree_sitter = { "lua" },
        server = {
            lua = { "sumneko_lua" },
        },
    },
}
