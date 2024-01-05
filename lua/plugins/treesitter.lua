-- https://github.com/nvim-treesitter/nvim-treesitter

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            'windwp/nvim-ts-autotag',
            'axelvc/template-string.nvim',
        },
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "c",
                    "rust",
                    "c",
                    "cpp",
                    "java",
                    "lua",
                    "vim",
                    "javascript",
                    'typescript',
                    'tsx',
                    "css",
                    "html",
                    'json',
                    'graphql',
                    'regex',
                    'markdown',
                    'markdown_inline',
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                autotag = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<enter>',
                        node_incremental = '<enter>',
                        scope_incremental = false,
                        node_decremental = '<bs>',
                    },
                },
                indent = { enable = true },
            })

            require('template-string').setup {}
        end,
    },
}
