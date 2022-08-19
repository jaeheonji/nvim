local map = vim.keymap.set
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

-- WhichKey
local ok, wkey = pcall(require, "which-key")
if not ok then
    return
end

wkey.register({
    ["/"] = { "<CMD>Telescope live_grep<CR>", "Search" },
    ["<space>"] = { "<CMD>Telescope project<CR>", "Search project" },
    q = {
        name = "quit/session",
        q = { "<CMD>wqa<CR>", "Quit neovim" },
        Q = { "<CMD>qa!<CR>", "Quit neovim without saving" },
    },
    f = {
        name = "file",
        f = { "<CMD>Telescope find_files<CR>", "Find file" },
        s = { "<CMD>w<CR>", "Save file" },
        S = { "<CMD>wa<CR>", "Save all file" },
        d = { "<CMD>Telescope file_browser<CR>", "Find directory" },
    },
    o = {
        name = "open",
        p = { "<CMD>Neotree toggle<CR>", "Project sidebar" },
        P = { "<CMD>Neotree reveal<CR>", "Find file in project sidebar" },
    },
    b = {
        name = "buffer",
        e = { "<CMD>ene<CR>", "New empty buffer" },
        k = { "<CMD>Bdelete<CR>", "Kill buffer" },
        K = { "", "Kill all buffer" },
    },
    w = {
        name = "windows",
        s = { "<CMD>vsplit<CR>", "Split window vertically" },
        S = { "<CMD>split<CR>", "Split window horizontally" },
        c = { "<CMD>close<CR>", "Close window" },
    },
    t = {
        name = "tabs",
        n = { "<CMD>tabnew<CR>", "Open a new tab page" },
        c = { "<CMD>tabclose<CR>", "Close tab page" },
        ["]"] = { "<CMD>tabn<CR>", "Go to next tab page" },
        ["["] = { "<CMD>tabp<CR>", "Go to previous tab page" },
    },
    g = {
        name = "git",
    },
    c = {
        name = "code",
        a = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "LSP Execute code action" },
        h = { "<CMD>lua vim.lsp.buf.hover()<CR>", "LSP Hover" },
        j = { "<CMD>lua vim.lsp.buf.declaration()<CR>", "LSP Find declaration" },
        s = { "<CMD>lua vim.lsp.buf.signature_help()<CR>", "LSP Signature help" },
        r = { "<CMD>lua vim.lsp.buf.rename()<CR>", "LSP Rename" },
        f = { "<CMD>lua vim.lsp.buf.formatting()<CR>", "LSP Formatting" },

        x = { "<CMD>lua vim.diagnostic.open_float({ border = 'single' })<CR>", "List errors" },
        d = { "<CMD>lua vim.lsp.buf.definition()<CR>", "Jump to definition" },
        i = { "<CMD>lua vim.lsp.buf.implementation()<CR>", "Find implementations" },

        R = {
            function()
                require("telescope.builtin").lsp_references(require("telescope.themes").get_ivy())
            end,
            "References tree",
        },
    },
}, { mode = "n", prefix = "<SPACE>", noremap = true, silent = true })
