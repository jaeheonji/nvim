local config = require("core.utils").config()

local M = {}

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

M.init = function()
    if not config.use_smart_split then
        -- Tab & Window Navigations
        map("n", "<C-h>", "<C-w>h", default_opts)
        map("n", "<C-j>", "<C-w>j", default_opts)
        map("n", "<C-k>", "<C-w>k", default_opts)
        map("n", "<C-l>", "<C-w>l", default_opts)

        map("n", "<C-Left>", "<C-w>h", default_opts)
        map("n", "<C-Down>", "<C-w>j", default_opts)
        map("n", "<C-Up>", "<C-w>k", default_opts)
        map("n", "<C-Right>", "<C-w>l", default_opts)

        -- Window Resize
        map("n", "<A-l>", ":vert res +10<CR>", default_opts)
        map("n", "<A-h>", ":vert res -10<CR>", default_opts)
        map("n", "<A-k>", ":res +10<CR>", default_opts)
        map("n", "<A-j>", ":res -10<CR>", default_opts)
    end
end

M.bufferline = function()
    map("n", "<S-h>", ":BufferLineMovePrev<CR>", default_opts)
    map("n", "<S-j>", ":BufferLineCyclePrev<CR>", default_opts)
    map("n", "<S-k>", ":BufferLineCycleNext<CR>", default_opts)
    map("n", "<S-l>", ":BufferLineMoveNext<CR>", default_opts)
end

M.smart_splits = function()
    map("n", "<C-h>", ":lua require('smart-splits').move_cursor_left()<CR>", default_opts)
    map("n", "<C-j>", ":lua require('smart-splits').move_cursor_down()<CR>", default_opts)
    map("n", "<C-k>", ":lua require('smart-splits').move_cursor_up()<CR>", default_opts)
    map("n", "<C-l>", ":lua require('smart-splits').move_cursor_right()<CR>", default_opts)

    map("n", "<A-h>", ":lua require('smart-splits').resize_left()<CR>", default_opts)
    map("n", "<A-j>", ":lua require('smart-splits').resize_down()<CR>", default_opts)
    map("n", "<A-k>", ":lua require('smart-splits').resize_up()<CR>", default_opts)
    map("n", "<A-l>", ":lua require('smart-splits').resize_right()<CR>", default_opts)
end

return M
