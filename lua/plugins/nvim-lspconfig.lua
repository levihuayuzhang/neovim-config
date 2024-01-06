return {
    { -- https://github.com/neovim/nvim-lspconfig
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/neodev.nvim",
        },
        lazy = false,
        config = function()
            -- nvim-cmp auto completion
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            require("neodev").setup({
                lspconfig = true,
                override = function(_, library)
                    library.enabled = true
                    library.plugins = true
                    library.types = true
                end,
            })

            -- Setup language servers.
            local lspconfig = require('lspconfig')
            lspconfig.clangd.setup {
                capabilities = capabilities, -- for auto completion from cmp-nvim-lsp
                keys = {
                    { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
                },
                root_dir = function(fname)
                    return require("lspconfig.util").root_pattern(
                        "Makefile",
                        "configure.ac",
                        "configure.in",
                        "config.h.in",
                        "meson.build",
                        "meson_options.txt",
                        "build.ninja"
                    )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
                        fname
                    ) or require("lspconfig.util").find_git_ancestor(fname)
                end,
                cmd = {
                    "clangd",
                    "-j=10",
                    "--compile-commands-dir=build",
                    "--clang-tidy",
                    "--clang-tidy-checks=performance-*,bugprone-*,portability-*,modernize-*",
                    "--all-scopes-completion",
                    "--completion-style=detailed",
                    "--header-insertion=iwyu",
                    "--pch-storage=memory",
                    "--function-arg-placeholders",
                    -- "--offset-encoding=utf-16",
                    "--fallback-style=llvm",
                },
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    clangdFileStatus = true,
                },
            }
            lspconfig.rust_analyzer.setup {
                capabilities = capabilities,

                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            enable = true,
                        },
                        cargo = {
                            allFeatures = true,
                            loadOutDirsFromCheck = true,
                            runBuildScripts = true,
                        },
                        -- Add clippy lints for Rust.
                        checkOnSave = {
                            allFeatures = true,
                            command = "clippy",
                            extraArgs = { "--no-deps" },
                        },
                        procMacro = {
                            enable = true,
                            ignored = {
                                ["async-trait"] = { "async_trait" },
                                ["napi-derive"] = { "napi" },
                                ["async-recursion"] = { "async_recursion" },
                            },
                        },
                    },
                },
            }
            lspconfig.pyright.setup {
                capabilities = capabilities,
            }
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
            }

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<space>de', vim.diagnostic.open_float, { desc = 'open float diagnostic window' })
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'previous diagnostic' })
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'next diagnostic' })
            vim.keymap.set('n', '<space>dq', vim.diagnostic.setloclist, { desc = 'diagnostics selection list' })

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'buf declaration' })
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'buf definition' })
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'buffer hover' })
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'buf implementation' })
                    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = 'Workspace Add Folder' })
                    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
                        { desc = 'Workspace Remove Folder' })
                    vim.keymap.set('n', '<space>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, {})
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { desc = 'type definition' })

                    -- better lsp actions
                    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { desc = 'hover info' })
                    vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
                    vim.keymap.set("n", "<leader>pr", "<cmd>Lspsaga finder ref<CR>", { desc = "[F]inder" })
                    vim.keymap.set("n", "<c-k>", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Documentation" })
                    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename ++project<cr>", { desc = "Rename" })
                    vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
                    vim.keymap.set("n", "<leader>ot", "<cmd>Lspsaga outline<CR>", { desc = "OutLine" })
                end,
            })
        end
    }
}
