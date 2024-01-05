return {
    { -- https://github.com/williamboman/mason-lspconfig.nvim
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "rust_analyzer",
                    "clangd",
                    "cmake",
                    "neocmake",
                    "dockerls",
                    "docker_compose_language_service",
                    "golangci_lint_ls",
                    "gopls",
                    "java_language_server",
                    "ltex",
                    "marksman",
                    "opencl_ls",
                    "pyright",
                    "sqlls",
                    "lemminx",
                    "yamlls",
                    "lua_ls",
                }
            })
        end
    },
}
