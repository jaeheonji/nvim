local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- BufferLine
map("n", "<S-h>", ":BufferLineMovePrev<CR>", default_opts)
map("n", "<S-j>", ":BufferLineCyclePrev<CR>", default_opts)
map("n", "<S-k>", ":BufferLineCycleNext<CR>", default_opts)
map("n", "<S-l>", ":BufferLineMoveNext<CR>", default_opts)

-- Smart Splits

--- Tab & Window Navigations
map("n", "<C-h>", ":lua require('smart-splits').move_cursor_left()<CR>", default_opts)
map("n", "<C-j>", ":lua require('smart-splits').move_cursor_down()<CR>", default_opts)
map("n", "<C-k>", ":lua require('smart-splits').move_cursor_up()<CR>", default_opts)
map("n", "<C-l>", ":lua require('smart-splits').move_cursor_right()<CR>", default_opts)

map("n", "<C-Left>", ":lua require('smart-splits').move_cursor_left()<CR>", default_opts)
map("n", "<C-Down>", ":lua require('smart-splits').move_cursor_down()<CR>", default_opts)
map("n", "<C-Up>", ":lua require('smart-splits').move_cursor_up()<CR>", default_opts)
map("n", "<C-Right>", ":lua require('smart-splits').move_cursor_right()<CR>", default_opts)

--- Window Resize
map("n", "<A-h>", ":lua require('smart-splits').resize_left()<CR>", default_opts)
map("n", "<A-j>", ":lua require('smart-splits').resize_down()<CR>", default_opts)
map("n", "<A-k>", ":lua require('smart-splits').resize_up()<CR>", default_opts)
map("n", "<A-l>", ":lua require('smart-splits').resize_right()<CR>", default_opts)
