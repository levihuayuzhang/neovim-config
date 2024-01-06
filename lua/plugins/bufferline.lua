return {
    {
        "akinsho/bufferline.nvim",
        -- tag = "*",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup {}
        end,
    },
}
