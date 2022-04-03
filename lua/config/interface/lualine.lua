local present, lualine = pcall(require, "lualine")
if not present then
    return
end

local colors = require("core.colors")

local M = {}

local spacer = {
    function()
        return " "
    end,
    padding = 0,
}

local function location()
    local cursor = vim.api.nvim_win_get_cursor(0)
    return "Ln " .. cursor[1] .. ", Col " .. cursor[2]
end

local function treesitter_status()
    local b = vim.api.nvim_get_current_buf()
    if next(vim.treesitter.highlighter.active[b]) then
        return "綠TS"
    end
    return ""
end

local function lsp_client_names()
    local clients = {}

    for _, client in pairs(vim.lsp.buf_get_clients(0)) do
        if client.name ~= "null-ls" then
            clients[#clients + 1] = client.name
        end
    end

    return table.concat(clients, " ")
end

local default = {
    options = {
        theme = colors.lualine,
        component_separators = "",
        section_separators = "",
    },
    sections = {
        lualine_a = { spacer },
        lualine_b = {},
        lualine_c = {
            spacer,
            { "branch", icon = "", color = { fg = colors.palette.pink } },
            { "filetype" },
            {
                "diagnostics",
                diagnostics_color = {
                    error = { fg = colors.palette.red },
                    warn = { fg = colors.palette.orange },
                    info = { fg = colors.palette.cyan },
                    hint = { fg = colors.palette.yellow },
                },
                symbols = { error = " ", warn = " ", info = " ", hint = " " },
                update_in_insert = true,
            },
        },

        lualine_x = {
            { lsp_client_names, icon = " " },
            { location },
            { "encoding" },
            { "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
            { treesitter_status, color = { fg = colors.palette.green } },
            spacer,
        },
        lualine_y = {},
        lualine_z = { spacer },
    },
    inactive_sections = {
        lualine_a = { spacer },
        lualine_b = {},
        lualine_c = {
            spacer,
            { "branch", icon = "", color = { fg = colors.palette.pink } },
            { "filetype" },
        },

        lualine_x = {
            { location },
            { "encoding" },
            { "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
            { treesitter_status, color = { fg = colors.palette.green } },
            spacer,
        },
        lualine_y = {},
        lualine_z = { spacer },
    },
    extensions = {
        {
            filetypes = { "neo-tree" },
            sections = {
                lualine_c = {
                    {
                        function()
                            return "Neo Tree"
                        end,
                        icon = "פּ",
                        color = { fg = colors.palette.pink, gui = "bold,italic" },
                    },
                },
            },
        },
    },
}

function M.setup()
    lualine.setup(default)
end

return M
