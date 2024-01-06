return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.clangd.cmd = {
        "clangd",
        "-j=10",
        "--compile-commands-dir=build",
        "--background-index",
        "--clang-tidy",
        "--clang-tidy-checks=performance-*,bugprone-*,portability-*,modernize-*",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
      }
    end,
  },
}
