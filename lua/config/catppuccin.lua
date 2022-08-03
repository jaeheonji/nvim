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
            NormalFloat = { bg = cp.base },

            -- NeoTree
            NeoTreeNormal = { fg = cp.text, bg = cp.mantle },
            NeoTreeNormalNC = { fg = cp.text, bg = cp.mantle },
            NeoTreeWinSeparator = { fg = cp.base, bg = cp.base },

            -- BufferLine
            BufferLineBackground = { fg = cp.surface1 },
            BufferLineFill = { bg = cp.mantle },

            BufferLineIndicatorVisible = { bg = cp.mantle },
            BufferLineIndicatorSelected = { fg = cp.base },

            BufferLineTabClose = { fg = cp.mantle, bg = cp.red },

            BufferLineSideBarOffset = { fg = cp.red, bg = cp.mantle, style = { "bold" } },

            -- Telescope
            TelescopePromptNormal = { bg = cp.base },
            TelescopePromptBorder = { fg = cp.blue, bg = cp.base },
            TelescopePromptTitle = { fg = cp.crust, bg = cp.red, style = { "bold" } },
            TelescopePromptPrefix = { fg = cp.red },

            TelescopePreviewNormal = { bg = cp.base },
            TelescopePreviewBorder = { fg = cp.blue, bg = cp.base },
            TelescopePreviewTitle = { fg = cp.crust, bg = cp.green, style = { "bold" } },

            TelescopeResultsNormal = { bg = cp.base },
            TelescopeResultsBorder = { fg = cp.blue, bg = cp.base },
            TelescopeResultsTitle = { fg = cp.crust, bg = cp.blue, style = { "bold" } },

            -- WhichKey
            WhichKeyFloat = { bg = cp.base },

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

local colorscheme = require("core.utils").config().colorscheme
if colorscheme == "catppuccin" then
    vim.cmd([[ colorscheme catppuccin ]])
end
