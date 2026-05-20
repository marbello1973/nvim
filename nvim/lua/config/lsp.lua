vim.lsp.enable({
    'lua_ls',
    'rust_analyzer',
    'kotlin_language_server',
    'jdtls',
    'toml_language_server',
    'ts_ls',
    'kotlin_lsp'
})

-- CONFIGURACIÓN DE DIAGNÓSTICOS
vim.diagnostic.config({
  virtual_lines = true,
})


-- LspAttach
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local client_id = ev.data.client_id
    local client = assert(vim.lsp.get_client_by_id(client_id))
    local bopts = { noremap = true, silent = true, buffer = ev.buf }

    -- FORZAR DISPARO EN CADA TECLA
    local chars = {}
    for i = 32, 126 do table.insert(chars, string.char(i)) end
    if client.server_capabilities.completionProvider then
      client.server_capabilities.completionProvider.triggerCharacters = chars
    end

    -- COMPLETADO NATIVO (v0.12+)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client_id, ev.buf, { autotrigger = true })
    end

    -- SUGERENCIAS EN LÍNEA
    if client:supports_method('textDocument/inlineCompletion') then
      vim.lsp.inline_completion.enable(true, { bufnr = ev.buf })
    end

    -- INLAY HINTS
    if client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
    end

    -- Atajos LSP
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bopts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, bopts)
  end,
})




-- -- ICONOS MODERNOS PARA DIAGNÓSTICOS
-- local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋽 " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
--
--
--
-- -- CONFIGURACIÓN DE DIAGNÓSTICOS
-- vim.diagnostic.config({
--   virtual_lines = true,
--   virtual_text = {
--     prefix = '●',
--     spacing = 4,
--     format = function(diagnostic)
--       local msg = diagnostic.message
--       if msg:find("expected SEMICOLON") then return "Falta el punto y coma ;" end
--       if msg:find("expected") then msg = msg:gsub("expected", "Se esperaba") end
--       if msg:find("unresolved reference") then msg = msg:gsub("unresolved reference", "Referencia no resuelta") end
--       if msg:find("not found") then msg = msg:gsub("not found", "no encontrado") end
--       return msg
--     end,
--   },
--   signs = true,
--   underline = true,
--   update_in_insert = false,
--   severity_sort = true,
-- })
--
