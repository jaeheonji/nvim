local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
    return
end

local cp = require("catppuccin.palettes").get_palette()

local settings = require("core.utils").override("catppuccin", {
    integrations = {
        neotree = { enabled = true },
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
    }
})

catppuccin.setup(settings)

local colorscheme = require("core.utils").config().colorscheme
if colorscheme == "catppuccin" then
    vim.cmd([[ colorscheme catppuccin ]])
end
