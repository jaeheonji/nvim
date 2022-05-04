local ok, fold = pcall(require, "pretty-fold")
if not ok then
    return
end

local M = {}

local default_settings = {
    fill_char = " ",
    sections = {
        left = {
            " ⚡ ",
            "content",
        },
        right = {
            " ",
            "number_of_folded_lines",
            ": ",
            "percentage",
            " ",
            function(config)
                return config.fill_char:rep(3)
            end,
        },
    },
}

M.setup = function()
    fold.setup(default_settings)

    require("pretty-fold.preview").setup({ border = "single" })
end

return M
