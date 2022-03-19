local M = {}

function M.init()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        })
    end

    vim.cmd([[ packadd packer.nvim ]])
    local present, packer = pcall(require, "packer")
    if not present then
        error("Could not load packer!")
    end

    packer.init({
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    })
end

function M.load(plugins)
    local present, packer = pcall(require, "packer")
    if not present then
        error("Should be installed packer first!")
    end

    packer.startup(function(use)
        for _, plugin in pairs(plugins) do
            use(plugin)
        end
    end)
end

return M
