local present, cmp = pcall(require, "cmp")
if not present then
    return
end

local M = {}

local luasnip = require("luasnip")
local lspkind = require("lspkind")

local default = {
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,

            before = function(entry, item)
                item.menu = ({
                    nvim_lsp = "[LSP]",
                    look = "[Dict]",
                    buffer = "[Buffer]",
                })[entry.source.name]

                return item
            end,
        }),
    },

    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = {
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },

    sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" } }, { { name = "buffer" } }),
}

function M.setup()
    cmp.setup(default)

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    })

    -- Loading Snippets
    require("luasnip.loaders.from_vscode").lazy_load()
end

return M
