local M = {}

function M.init()
    vim.opt.background = "dark"
    vim.g.colors_name = "dracula"

    package.loaded["colors.dracula"] = nil
    require("lush")(require("colors.dracula"))
end

return M
