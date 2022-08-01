local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
    return
end

local cp = require("catppuccin.palettes").get_palette()

local settings = require("core.utils").override("catppuccin", {
    integrations = {
        neotree = { enabled = true },
        telescope = false,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        }
    },
    custom_highlights = {
        Folded = { fg = cp.overlay0, bg = cp.surface0 },

        -- NeoTree
        NeoTreeNormal = { fg = cp.text, bg = cp.mantle },
        NeoTreeNormalNC = { fg = cp.text, bg = cp.mantle },
        NeoTreeWinSeparator = { fg = cp.mantle, bg = cp.mantle },

        -- BufferLine
        BufferLineBackground = { fg = cp.surface1 },
        BufferLineFill = { bg = cp.mantle },

        BufferLineIndicatorVisible = { bg = cp.mantle },
        BufferLineIndicatorSelected = { fg = cp.base },

        BufferLineTabClose = { fg = cp.mantle, bg = cp.red },

        -- Telescope
        TelescopePromptNormal = { bg = cp.surface0 },
        TelescopePromptBorder = { fg = cp.surface0, bg = cp.surface0 },
        TelescopePromptTitle = { fg = cp.crust, bg = cp.red },
        TelescopePromptPrefix = { fg = cp.red },

        TelescopePreviewNormal = { bg = cp.mantle },
        TelescopePreviewBorder = { fg = cp.mantle, bg = cp.mantle },
        TelescopePreviewTitle = { fg = cp.crust, bg = cp.green },

        TelescopeResultsNormal = { bg = cp.mantle },
        TelescopeResultsBorder = { fg = cp.mantle, bg = cp.mantle },
        TelescopeResultsTitle = { fg = cp.crust, bg = cp.blue },
    }
})

catppuccin.setup(settings)

local colorscheme = require("core.utils").config().colorscheme
if colorscheme == "catppuccin" then
    vim.cmd([[ colorscheme catppuccin ]])
end
