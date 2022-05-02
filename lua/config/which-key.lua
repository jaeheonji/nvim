local present, which_key = pcall(require, "which-key")
if not present then
    return
end

local M = {}

-- Plugin Configurations
local default_settings = {
    layout = { align = "center", spacing = 10 },
    window = { winblend = 20 },
    triggers_blacklist = {
        i = { "j", "k", "i" },
        v = { "j", "k" },
    },
}

-- NORMAL mode
local normal = {
    ["?"] = { "<CMD>Telescope help_tags<CR>", "Find Help" },
    q = { "<CMD>q!<CR>", "Quit" },
    Q = { "<CMD>qa!<CR>", "Quit Editor" },
    c = {
        "<CMD>lua require('Comment.api').toggle_current_linewise()<CR>",
        "Comment current line with linewise",
    },
    C = {
        "<CMD>lua require('Comment.api').toggle_current_blockwise()<CR>",
        "Comment current line with blockwise",
    },
    f = {
        name = "Files",
        f = { "<CMD>Telescope find_files<CR>", "Find Files" },
        s = { "<CMD>w!<CR>", "Save current buffer" },
        S = { "<CMD>wa!<CR>", "Save all buffers" },
        w = { "<CMD>Telescope live_grep<CR>", "Find words in all files" },
        t = { "<CMD>TodoTelescope<CR>", "Find Todo in all files" },
    },
    b = {
        name = "Buffers",
        d = { "<CMD>Bdelete<CR>", "Delete current buffer" },
        D = { "<CMD>Bdelete!<CR>", "Delete current buffer (force)" },
        b = { "<CMD>Telescope buffers<CR>", "Find all buffers" },
    },
    w = {
        name = "Windows",
        s = { "<CMD>split<CR>", "Split window horizontal" },
        v = { "<CMD>vsplit<CR>", "Split window vertical" },
        d = { "<CMD>close<CR>", "Close current window" },
    },
    v = {
        name = "Views",
        e = { "<CMD>Neotree toggle<CR>", "Explorer" },
        s = { "<CMD>SymbolsOutline<CR>", "Outline" },
        t = { "<CMD>TroubleToggle<CR>", "Diagnostics" },
        z = { "<CMD>ZenMode<CR>", "ZenMode" },
    },
    l = {
        name = "LSP",

        a = { "<CMD>lua require('cosmic-ui').code_actions()<CR>", "Code Action" },
        n = { "<CMD>lua require('cosmic-ui').rename()<CR>", "Rename" },

        e = { "<CMD>lua vim.diagnostic.open_float({ border = 'single' })<CR>", "Diagnostic" },

        d = { "<CMD>lua vim.lsp.buf.definition()<CR>", "Definition" },
        D = { "<CMD>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
        i = { "<CMD>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
        h = { "<CMD>lua vim.lsp.buf.hover()<CR>", "Hover" },
        t = { "<CMD>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
        s = { "<CMD>lua vim.lsp.buf.signature_help()<CR>", "Signature" },

        r = { "<CMD>Telescope lsp_references theme=dropdown<CR>", "References" },
    },
}

-- VISUAL mode
local visual = {
    c = {
        "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
        "Comment multiline with linewise",
    },
    C = {
        "<ESC><CMD>lua require('Comment.api').toggle_blockwise_op(vim.fn.visualmode())<CR>",
        "Comment multiline line with blockwise",
    },
}

M.setup = function()
    which_key.setup(default_settings)

    which_key.register(normal, { mode = "n", prefix = "<SPACE>", noremap = true, silent = true })
    which_key.register(visual, { mode = "v", prefix = "<SPACE>", noremap = true, silent = true })
end

return M
