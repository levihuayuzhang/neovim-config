return {
    { -- https://github.com/neovim/nvim-lspconfig
        "neovim/nvim-lspconfig",
        config = function()
            -- Setup language servers.
            local lspconfig = require('lspconfig')
            lspconfig.clangd.setup {
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
                    "--fallback-style=llvm",
                },
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    clangdFileStatus = true,
                },
            }
            lspconfig.rust_analyzer.setup {
                -- Server-specific settings. See `:help lspconfig-setup`
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
            lspconfig.pyright.setup {}
            lspconfig.lua_ls.setup {}

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
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'signaure help' })
                    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, {})
                    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, {})
                    vim.keymap.set('n', '<space>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, {})
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { desc = 'type definition' })
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { desc = 'buf rename' })
                    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { desc = 'code action' })
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'buf references' })
                    vim.keymap.set('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                    end, {})
                end,
            })
        end
    }
}
