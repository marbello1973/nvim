-- En tu archivo de configuración (init.lua o lua/plugins/conform.lua)
vim.pack.add({
  {
    src = "https://github.com/stevearc/conform.nvim",
    
  },
})

-- Configuración de conform.nvim
require("conform").setup({
  -- Mapeo de formateadores por tipo de archivo
  formatters_by_ft = {
    -- Lenguajes base
    lua = { "stylua" },
    python = { "isort", "black" },  -- Múltiples formateadores en secuencia
    
    -- Web development
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
    scss = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    
    -- Lenguajes compilados
    rust = { "rustfmt" },
    java = { "google-java-format" },
    kotlin = { "ktlint" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    go = { "gofumpt", "goimports" },
    
    -- Configuración
    toml = { "taplo" },
    yaml = { "yamlfmt" },
    markdown = { "prettierd", "prettier" },
    bash = { "shfmt" },
    
    -- Formateadores de limpieza (para todos los archivos)
    ["*"] = { "trim_whitespace", "trim_newlines" },
  },
  
  -- Formateo automático al guardar
  format_on_save = {
    timeout_ms = 500,        -- Timeout para formateo
    lsp_fallback = true,     -- Usar LSP si no hay formateador específico
  },
  
  -- Opciones adicionales
  notify_on_error = true,     -- Notificar si hay error
  log_level = vim.log.levels.ERROR,  -- Nivel de logging
})

-- Atajos de teclado para formateo manual
vim.keymap.set({ "n", "v" }, "<leader>f", function()
  require("conform").format({
    lsp_fallback = true,      -- Usar LSP si no hay formateador
    async = false,            -- Síncrono para feedback inmediato
    timeout_ms = 500,
  })
end, { desc = "Format code" })

-- Formateo de rango en modo visual
vim.keymap.set("v", "<leader>f", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    range = {
      start = vim.api.nvim_buf_get_mark(0, "<"),
      ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
    },
  })
end, { desc = "Format selection" })