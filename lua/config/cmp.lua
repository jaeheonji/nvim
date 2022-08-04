local ok, cmp = pcall(require, "cmp")
if not ok then
    return
end

local window_options = {
    border = "single",
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
}

local settings = require("core.utils").override("cmp", {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    window = {
        completion = cmp.config.window.bordered(window_options),
        documentation = cmp.config.window.bordered(window_options),
    },

    formatting = {
        -- format = require("lspkind").cmp_format({}),
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({
                mode = "symbol_text",
                maxwidth = 50,
                symbol_map = { TypeParameter = "\u{f77e}" },
            })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })

            kind.kind = " " .. strings[1] .. " "
            kind.menu = "    (" .. strings[2] .. ")"

            return kind
        end,
    },

    mapping = {
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<TAB>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
                fallback()
            end
        end, { "i", "s" }),
    },

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
    }, {
        { name = "nvim_lsp_signature_help" },
    }),
})

cmp.setup(settings)

-- load snippets
require("luasnip.loaders.from_vscode").lazy_load()
