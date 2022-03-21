local present, fold = pcall(require, "pretty-fold")
if not present then
    return
end

local M = {}

local default = {
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

function M.setup()
    fold.setup(default)

    require("pretty-fold.preview").setup({ border = "single" })
end

return M
