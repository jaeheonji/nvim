local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
    return
end
local settings = require("core.utils").override("indent-blankline", {
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = true,
    show_first_indent_level = false,

    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
})

indent_blankline.setup(settings)
