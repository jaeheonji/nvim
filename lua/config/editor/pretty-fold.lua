local ok, fold = pcall(require, "pretty-fold")
if not ok then
    return
end

local M = {}

local default_settings = {
    keep_indentation = false,
    fill_char = "━",
    sections = {
        left = {
            "━ ",
            function()
                return string.rep("*", vim.v.foldlevel)
            end,
            " ━┫",
            "content",
            "┣",
        },
        right = {
            "┫ ",
            "number_of_folded_lines",
            ": ",
            "percentage",
            " ┣━━",
        },
    },
}

M.setup = function()
    fold.setup(default_settings)

    require("fold-preview").setup({ border = "single" })
end

return M
