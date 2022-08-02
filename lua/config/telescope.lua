local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

local actions = require("telescope.actions")

local settings = require("core.utils").override("telescope", {
    defaults = {
        -- ripgrep remove indentation
        -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#ripgrep-remove-indentation
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        layout_config = {
            prompt_position = "top",
            height = 0.8,
            width = 0.8,

            horizontal = {
                preview_width = 0.55,
                results_width = 0.8,
            },
        },
        mappings = {
            i = { ["<ESC>"] = actions.close },
        },
    },
    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
        },
    },
})

telescope.setup(settings)
