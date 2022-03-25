local present, which_key = pcall(require, "which-key")
if not present then
    return
end

local M = {}

-- Plugin Configurations
local default = {
    layout = { align = "center", spacing = 10 },
    window = { winblend = 20 },
    triggers_blacklist = {
        i = { "j", "k", "i" },
        v = { "j", "k" },
    },
}

-- NORMAL mode
local normal = {
    ["?"] = { "<CMD>Telescope help_tags theme=dropdown<CR>", "find-help-tags" },
    ["/"] = { "<CMD>HopPattern<CR>", "hop-pattern" },
    [":"] = { "<CMD>HopLine<CR>", "hop-line" },
    ["1"] = { "1gt", "window-1" },
    ["2"] = { "2gt", "window-2" },
    ["3"] = { "2gt", "window-3" },
    ["4"] = { "2gt", "window-4" },
    ["5"] = { "2gt", "window-5" },
    ["6"] = { "2gt", "window-6" },
    ["7"] = { "2gt", "window-7" },
    ["8"] = { "2gt", "window-8" },
    ["9"] = { "2gt", "window-9" },
    f = {
        name = "Files",
        f = { "<CMD>Telescope find_files theme=dropdown<CR>", "find-files" },
        b = { "<CMD>Telescope marks<CR>", "find-bookmars" },
        o = { "<CMD>NvimTreeFindFile<CR>", "find-file-in-file-tree" },
        s = { "<CMD>w<CR>", "save-file" },
        S = { "<CMD>wa<CR>", "save-all-files" },
        r = { "<CMD>lua require('spectre').open()<CR>", "search-and-replace" },
        w = { "<CMD>Telescope live_grep theme=dropdown<CR>", "find-words" },
        h = { "<CMD>Telescope oldfiles theme=dropdown<CR>", "open-file-history" },
    },
    t = {
        name = "Toggles",
        t = { "<CMD>NvimTreeToggle<CR>", "file-tree" },
        s = { "<CMD>SymbolsOutline<CR>", "symbols-outline" },
        d = { "<CMD>TroubleToggle<CR>", "diagnostic-lists" },
        z = { "<CMD>ZenMode<CR>", "zen-mode" },
    },
    q = {
        name = "Quit",
        q = { "<CMD>q<CR>", "quit" },
        a = { "<CMD>qa!<CR>", "quit-without-saving" },
    },
    c = {
        name = "Comments/Todo",
        c = { '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>', "toggle-linewise-current-line" },
        b = { '<CMD>lua require("Comment.api").toggle_current_blockwise()<CR>', "toggle-blockwise-current-line" },
        t = {
            name = "Todo",
            l = { "<CMD>TodoLocList<CR>", "todo-list" },
            t = { "<CMD>TodoTelescope theme=dropdown<CR>", "todo-telescope" },
            q = { "<CMD>TodoQuickFix<CR>", "todo-quick-fix" },
        },
    },
    l = {
        name = "LSP",
        a = { "<CMD>lua require('cosmic-ui').code_actions()<CR>", "code-action" },
        n = { "<CMD>lua require('cosmic-ui').rename()<CR>", "rename" },

        d = { "<CMD>lua vim.lsp.buf.definition()<CR>", "definition" },
        D = { "<CMD>lua vim.lsp.buf.declaration()<CR>", "declaration" },
        e = { "<CMD>lua vim.diagnostic.open_float({ border = 'single' })<CR>", "diagnostic" },
        i = { "<CMD>lua vim.lsp.buf.implementation()<CR>", "implementation" },
        r = { "<CMD>Telescope lsp_references theme=dropdown<CR>", "references" },

        h = { "<CMD>lua vim.lsp.buf.hover()<CR>", "hover" },
        s = { "<CMD>lua vim.lsp.buf.signature_help()<CR>", "signature-help" },
        t = { "<CMD>lua vim.lsp.buf.type_definition()<CR>", "type-definition" },
    },
    b = {
        name = "Buffers",
        d = { "<CMD>Bdelete<CR>", "delete-buffer" },
        D = { "<CMD>Bdelete!<CR>", "delete-buffer-without-saving" },
        b = { "<CMD>Telescope buffers theme=dropdown<CR>", "find-buffers" },
    },
    w = {
        name = "Windows",
        s = { "<CMD>split<CR>", "split-horizontal" },
        v = { "<CMD>vsplit<CR>", "split-vertical" },
        d = { "<CMD>close<CR>", "delete-window" },
    },
}

-- VISUAL mode
local visual = {
    c = {
        name = "Comments",
        c = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "toggle-linewise" },
        b = {
            '<ESC><CMD>lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<CR>',
            "toggle-blockwise",
        },
    },
}

function M.setup()
    which_key.setup(default)

    which_key.register(normal, { mode = "n", prefix = "<SPACE>", noremap = true, silent = true })
    which_key.register(visual, { mode = "x", prefix = "<SPACE>", noremap = true, silent = true })
end

return M
