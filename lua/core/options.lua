local opt = vim.opt

opt.mouse = "a"
opt.termguicolors = true

opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.backup = false
opt.writebackup = false

opt.timeoutlen = 300
opt.updatetime = 250

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true

opt.number = true
opt.relativenumber = true
opt.linebreak = true

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true

opt.ignorecase = true
opt.smartcase = true

-- for symbols-outline
vim.g.symbols_outline = {
    auto_preview = false,
    width = 15,
}

-- for minimap.vim
vim.g.minimap_width = 15
vim.g.minimap_highlight_range = 1
vim.g.minimap_highlight_search = 1
vim.g.minimap_git_colors = 1
