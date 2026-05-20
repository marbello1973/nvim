vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
    build = ":TSUpdate",
  },
})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    -- Lenguajes base
    'lua',           -- Configuración de Neovim
    'vim',           -- Scripts de Vim
    'vimdoc',        -- Documentación de Vim/Neovim
    
    -- Lenguajes web
    'javascript',    -- JavaScript
    'typescript',    -- TypeScript
    'html',          -- HTML
    'css',           -- CSS
    'json',          -- JSON
    'toml',          -- TOML (configuración)
    
    -- Lenguajes de programación general
    'python',        -- Python
    'rust',          -- Rust
    'java',          -- Java
    'kotlin',        -- Kotlin
    
    -- Opcionales (recomendados)
    'bash',          -- Scripts de shell
    'markdown',      -- Documentación
    'markdown_inline', -- Markdown inline
    'yaml',          -- YAML (configuración)
    'c',             -- C
    'cpp',           -- C++
    'go',            -- Go
    'ruby',          -- Ruby
    'php',           -- PHP
  },
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})

vim.api.nvim_create_autocmd('PackChanged', {
  desc = 'Handle nvim-treesitter updates',
  group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
  callback = function(event)
    if event.data.kind == 'update' and event.data.spec.name == 'nvim-treesitter' then
      vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
      ---@diagnostic disable-next-line: param-type-mismatch
      local ok = pcall(vim.cmd, 'TSUpdate')
      if ok then
        vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
      else
        vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARN)
      end
    end
  end,
})