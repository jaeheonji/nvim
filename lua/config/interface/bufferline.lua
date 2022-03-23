local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

local palette = require("core.colors").palette

local M = {}

local default = {
    highlights = {
        background = { guibg = palette.bgdark },
        fill = { guibg = palette.bgdarker },

        -- buffer
        buffer_selected = { gui = "bold" },
        buffer_visible = { guibg = palette.bgdark },

        -- separator
        separator = { guifg = palette.bgdark, guibg = palette.bgdark },
        separator_visible = { guifg = palette.bgdark, guibg = palette.bgdark },
        separator_selected = { guifg = palette.bgdark, guibg = palette.bgdark },

        -- close button
        close_button = { guibg = palette.bgdark },
        close_button_visible = { guibg = palette.bgdark },

        -- indicator
        indicator_selected = { guifg = palette.pink },

        -- modified
        modified = { guifg = palette.comment, guibg = palette.bgdark },
        modified_visible = { guifg = palette.comment, guibg = palette.bgdark },
        modified_selected = { guifg = palette.fg },

        -- tab
        tab_close = { guifg = palette.fg, guibg = palette.red },
    },
    options = {
        tab_size = 24,
        numbers = function(style)
            return style.ordinal
        end,
        offsets = {
            { filetype = "NvimTree", text = " 🌲 EXPLORER", text_align = "left", padding = 1 },
        },
    },
}

function M.setup()
    bufferline.setup(default)
end

return M
