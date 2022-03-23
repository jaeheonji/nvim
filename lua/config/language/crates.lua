local present, crates = pcall(require, "crates")
if not present then
    return
end

local M = {}

function M.setup()
    crates.setup()

    -- Lazy loading for nvim-cmp
    vim.cmd([[ autocmd FileType toml lua require("cmp").setup.buffer { sources = { { name = "crates" } } } ]])
end

return M