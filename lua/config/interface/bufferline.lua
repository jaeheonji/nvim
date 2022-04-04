local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

local M = {}

local palette = require("core.colors").palette
local transparentify = require("core.utils").transparentify

local default_settings = {
    options = {
        numbers = function(opts)
            return string.format(" %s:", opts.ordinal)
        end,

        indicator_icon = "▊",
        modified_icon = "",

        tab_size = 20,
        separator_style = { "", "" },

        offsets = {
            {
                filetype = "neo-tree",
                text = "File Explore",
                highlight = "CustomDirectory",
                padding = 1,
            },
        },
    },
    highlights = {
        fill = { guibg = transparentify(palette.bgdarker) },

        -- Buffer
        background = { guibg = transparentify(palette.bgdark) },
        buffer_visible = { guibg = transparentify(palette.bgdark) },
        buffer_selected = { guibg = transparentify(palette.bg) },

        -- Close Button
        close_button = { guibg = transparentify(palette.bgdark) },
        close_button_visible = { guibg = transparentify(palette.bgdark) },
        close_button_selected = { guibg = transparentify(palette.bg) },

        -- Indicator
        indicator_selected = { guifg = palette.pink },

        -- Tab
        tab_close = { guifg = palette.fg, guibg = palette.red },
    },
}

M.setup = function()
    bufferline.setup(default_settings)

    require("core.key-bindings").bufferline()
end

return M
