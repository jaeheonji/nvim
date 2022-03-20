local M = {}

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

function M.init()
    map("i", "ii", "<ESC>", default_opts) 

    -- Tab & Window Navigations
    map("n", "s", "<C-w>", default_opts)
    map("n", "<C-h>", "<C-w>h", default_opts)
    map("n", "<C-j>", "<C-w>j", default_opts)
    map("n", "<C-k>", "<C-w>k", default_opts)
    map("n", "<C-l>", "<C-w>l", default_opts)

    map("n", "<C-Left>", "<C-w>h", default_opts)
    map("n", "<C-Down>", "<C-w>j", default_opts)
    map("n", "<C-Up>", "<C-w>k", default_opts)
    map("n", "<C-Right>", "<C-w>l", default_opts)

    map("n", "<C-p>", ":tabprevious<CR>", default_opts)
    map("n", "<C-n>", ":tabnext<CR>", default_opts)

    -- Window Resize
    map("n", "<M-l>", ":vert res +10<CR>", default_opts)
    map("n", "<M-h>", ":vert res -10<CR>", default_opts)
    map("n", "<M-k>", ":res +10<CR>", default_opts)
    map("n", "<M-j>", ":res -10<CR>", default_opts)
end

return M
