local ok, bufferline = pcall(require, "bufferline")
if not ok then
    return
end


local cp = require("catppuccin.palettes").get_palette()
local highlights = require("catppuccin.groups.integrations.bufferline").get({
    custom = {
        mocha = {
            -- buffers
            background = { fg = cp.surface1, bg = cp.mantle },
            buffer_visible = { bg = cp.mantle },
            buffer_selected = { bg = cp.base },

            -- tab
            tab = { bg = cp.mantle },
            tab_selected = { bg = cp.base },
            tab_close = { fg = cp.mantle, bg = cp.red },

            -- indicator
            indicator_selected = { fg = cp.base, bg = cp.base },

            -- separator
            separator = { fg = cp.mantle, bg = cp.mantle },
            separator_visible = { fg = cp.mantle, bg = cp.mantle },
            separator_selected = { fg = cp.base, bg = cp.base },

            -- buttons
            close_button = { bg = cp.mantle },
            close_button_visible = { bg = cp.mantle },
            close_button_selected = { fg = cp.red, bg = cp.base },

            -- fill
            fill = { bg = cp.mantle },
        },
    },
})

local settings = require("core.utils").override("bufferline", {
    options = {
        buffer_close_icon = "\u{f00d}",
        offsets = {
            {
                filetype = "neo-tree",
                text = "🐱 File Explorer",
                highlight = "BufferLineSideBarOffset",
            },
        },
    },
    highlights = highlights,
})

bufferline.setup(settings)
