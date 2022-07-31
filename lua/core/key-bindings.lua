local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- BufferLine
map("n", "<S-h>", ":BufferLineMovePrev<CR>", default_opts)
map("n", "<S-j>", ":BufferLineCyclePrev<CR>", default_opts)
map("n", "<S-k>", ":BufferLineCycleNext<CR>", default_opts)
map("n", "<S-l>", ":BufferLineMoveNext<CR>", default_opts)
