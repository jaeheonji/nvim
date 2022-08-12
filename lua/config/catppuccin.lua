local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
    return
end

local colorscheme = require("core.utils").config().colorscheme
local cp = require("catppuccin.palettes").get_palette()

local base = colorscheme.transparency and "NONE" or cp.base

local settings = require("core.utils").override("catppuccin", {
    transparent_background = colorscheme.transparency,
    integrations = {
        neotree = { enabled = true },
        telescope = false,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },
        which_key = true,

        native_lsp = {
            virtual_text = {
                errors = {},
                hints = {},
                warnings = {},
                information = {},
            },
        },
    },
    highlight_overrides = {
        mocha = {
            VertSplit = { fg = cp.surface1 },
            Folded = { fg = cp.overlay0, bg = cp.surface0 },
            NormalFloat = { bg = base },

            -- NeoTree
            NeoTreeNormal = { fg = cp.text, bg = cp.mantle },
            NeoTreeNormalNC = { fg = cp.text, bg = cp.mantle },
            NeoTreeWinSeparator = { fg = cp.base, bg = cp.base },

            -- BufferLine
            BufferLineBackground = { fg = cp.surface1, bg = cp.mantle },
            BufferLineBackcrust = { bg = cp.mantle },
            BufferLineBufferVisible = { bg = cp.mantle },
            BufferLineBufferSelected = { bg = cp.base },
            -- tab
            BufferLineTab = { bg = cp.mantle },
            BufferLineTabSelected = { bg = cp.base },
            BufferLineTabClose = { fg = cp.mantle, bg = cp.red },
            -- indicator
            BufferLineIndicatorVisible = { bg = cp.mantle },
            BufferLineIndicatorSelected = { fg = cp.base, bg = cp.base },
            -- separator
            BufferLineSeparator = { bg = cp.mantle },
            BufferLineSeparatorVisible = { bg = cp.mantle },
            BufferLineSeparatorSelected = { bg = cp.base },
            -- button
            BufferLineCloseButton = { bg = cp.mantle },
            BufferLineCloseButtonVisible = { bg = cp.mantle },
            BufferLineCloseButtonSelected = { bg = cp.base },

            BufferLineFill = { bg = cp.mantle },
            BufferLineSideBarOffset = { fg = cp.red, bg = cp.mantle, style = { "bold" } },

            -- Telescope
            TelescopePromptNormal = { bg = base },
            TelescopePromptBorder = { fg = cp.blue, bg = base },
            TelescopePromptTitle = { fg = cp.crust, bg = cp.red, style = { "bold" } },
            TelescopePromptPrefix = { fg = cp.red },

            TelescopePreviewNormal = { bg = base },
            TelescopePreviewBorder = { fg = cp.blue, bg = base },
            TelescopePreviewTitle = { fg = cp.crust, bg = cp.green, style = { "bold" } },

            TelescopeResultsNormal = { bg = base },
            TelescopeResultsBorder = { fg = cp.blue, bg = base },
            TelescopeResultsTitle = { fg = cp.crust, bg = cp.blue, style = { "bold" } },

            -- WhichKey
            WhichKeyFloat = { bg = base },

            -- Alpha
            AlphaHeaderBanner = { fg = cp.blue },
            AlphaHeaderText = { fg = cp.subtext0 },

            AlphaButtonShortcut = { fg = cp.base, bg = cp.blue, style = { "bold" } },
            AlphaButtonDescription = { fg = cp.subtext0 },

            AlphaFooterPlugins = { fg = cp.subtext0 },
            AlphaFooterVersion = { fg = cp.subtext0 },
        },
    },
})

catppuccin.setup(settings)

if colorscheme.name == "catppuccin" then
    vim.cmd([[ colorscheme catppuccin ]])
end
