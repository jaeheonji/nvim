local present, nvim_tree = pcall(require, "nvim-tree")
if not present then
    return
end

local M = {}

local g = vim.g
local tree_cb = require("nvim-tree.config").nvim_tree_callback

-- vimrc

-- this option shows indent markers when folders are open
g.nvim_tree_indent_markers = 1

-- will enable file highlight for git attributes (can be used without the icons)
g.nvim_tree_git_hl = 1

-- will enable folder and file icon highlight for opened files/directories
g.nvim_tree_highlight_opened_files = 1

-- compact folders that only contain a single folder into one node in the file tree
g.nvim_tree_group_empty = 1

-- will change cwd of nvim-tree to that of new buffer's when opening nvim-tree
g.nvim_tree_respect_buf_cwd = 1

local default = {
    view = {
        width = 40,
        side = "right",
        mappings = {
            list = {
                { key = "v", cb = tree_cb("vsplit") },
                { key = "s", cb = tree_cb("split") },
            },
        },
    },
}

function M.setup()
    nvim_tree.setup(default)
end

return M
