local ok, feline = pcall(require, "feline")
if not ok then
    return
end

local cp = require("catppuccin.palettes").get_palette()

local vi_mode = {
    ["n"] = { "NORMAL", cp.blue },
    ["no"] = { "N-PENDING", cp.blue },
    ["i"] = { "INSERT", cp.green },
    ["ic"] = { "INSERT", cp.green },
    ["t"] = { "TERMINAL", cp.green },
    ["v"] = { "VISUAL", cp.flamingo },
    ["V"] = { "V-LINE", cp.flamingo },
    -- [""] = { "V-BLOCK", cp.flamingo },
    ["R"] = { "REPLACE", cp.maroon },
    ["Rv"] = { "V-REPLACE", cp.maroon },
    ["s"] = { "SELECT", cp.maroon },
    ["S"] = { "S-LINE", cp.maroon },
    -- [""] = { "S-BLOCK", cp.maroon },
    ["c"] = { "COMMAND", cp.peach },
    ["cv"] = { "COMMAND", cp.peach },
    ["ce"] = { "COMMAND", cp.peach },
    ["r"] = { "PROMPT", cp.teal },
    ["rm"] = { "MORE", cp.teal },
    ["r?"] = { "CONFIRM", cp.mauve },
    ["!"] = { "SHELL", cp.green },
}

local empty_sep = { str = " ", hl = { bg = cp.mantle } }
local text_box = { fg = cp.text, bg = cp.surface0, style = "bold" }

local settings = require("core.utils").override("feline", {
    components = {
        active = {
            { -- Left components
                {
                    provider = " \u{f61a} ",
                    hl = function()
                        return {
                            fg = cp.mantle,
                            bg = vi_mode[vim.fn.mode()][2],
                        }
                    end,
                },
                {
                    provider = function()
                        return " " .. vi_mode[vim.fn.mode()][1] .. " "
                    end,
                    hl = text_box,
                },

                -- File
                {
                    provider = " \u{f713} ",
                    hl = { fg = cp.mantle, bg = cp.yellow },
                },
                {
                    provider = function()
                        local filename = vim.api.nvim_buf_get_name(0)
                        if filename == "" then
                            return " No Name "
                        else
                            filename = vim.fn.fnamemodify(filename, ":t")
                        end

                        return " " .. filename .. " "
                    end,
                    hl = { fg = cp.text, bg = cp.surface0, style = "bold,italic" },
                },

                -- Git
                {
                    provider = " \u{f418} ",
                    hl = { fg = cp.mantle, bg = cp.mauve },
                    enabled = function()
                        return vim.b.gitsigns_head
                    end,
                },
                {
                    provider = function()
                        return " " .. vim.b.gitsigns_head .. " "
                    end,
                    enabled = function()
                        return vim.b.gitsigns_head and vim.b.gitsigns_head ~= ""
                    end,
                    hl = text_box,
                    icon = "",
                },
                {
                    provider = "git_diff_added",
                    hl = { fg = cp.green, bg = cp.mantle },
                },
                {
                    provider = "git_diff_changed",
                    hl = { fg = cp.yellow, bg = cp.mantle },
                },
                {
                    provider = "git_diff_removed",
                    hl = { fg = cp.red, bg = cp.mantle },
                },
            },
            { -- Middle components
            },
            { -- Right components
                {
                    provider = "diagnostic_errors",
                    hl = { fg = cp.red, bg = cp.mantle },
                },
                {
                    provider = "diagnostic_warnings",
                    hl = { fg = cp.yellow, bg = cp.mantle },
                },
                {
                    provider = "diagnostic_info",
                    hl = { fg = cp.bule, bg = cp.mantle },
                },
                {
                    provider = "diagnostic_hints",
                    hl = { fg = cp.teal, bg = cp.mantle },
                },

                -- Lsp
                {
                    provider = " \u{e615} ",
                    enabled = function()
                        return not vim.tbl_isempty(vim.lsp.get_active_clients())
                    end,
                    hl = { fg = cp.mantle, bg = cp.lavender },
                    left_sep = empty_sep,
                },
                {
                    provider = function()
                        local clients = vim.lsp.get_active_clients()

                        local name
                        for _, client in pairs(clients) do
                            name = client.name
                        end

                        if name == nil then
                            return ""
                        end

                        local count = vim.tbl_count(clients)
                        if count > 1 then
                            return string.format(" %s (+%d) ", name, count - 1)
                        else
                            return string.format(" %s ", name)
                        end
                    end,
                    hl = text_box,
                },

                -- Directory
                {
                    provider = " \u{e613} ",
                    hl = { fg = cp.mantle, bg = cp.pink },
                },
                {
                    provider = function()
                        local dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                        return " " .. dir .. " "
                    end,
                    hl = text_box,
                },

                -- Position
                {
                    provider = " \u{f767} ",
                    hl = { fg = cp.mantle, bg = cp.green },
                },
                {
                    provider = {
                        name = "position",
                        opts = {
                            format = " Ln {line}, Col {col} ",
                        },
                    },
                    hl = text_box,
                },
            },
        },
        -- inactive = {},
    },
})

feline.setup(settings)
