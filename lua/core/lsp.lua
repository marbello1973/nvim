vim.lsp.enable({
    "luals",
    "rust-analyzer",
    "ts_ls",
    "cssls",
    "html",
    "jdtls",
})

vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
        },
        numhl = {
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})
