return {
    { -- https://github.com/williamboman/mason.nvim
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })

            vim.keymap.set('n', '<leader>cm', '<cmd>Mason<CR>', { desc = 'Open Mason' })
        end
    },
}
