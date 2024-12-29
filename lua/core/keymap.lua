-- Alias
local default_opts = { noremap = true, silent = true }

vim.g.mapleader = " " -- Tecla líder

-- Mapeos generales

-- Guardar archivo 
vim.keymap.set('n', '<C-s>', ':w!<CR>', default_opts) 
  
-- moverse entre ventanas
vim.keymap.set('n', '<C-h>', '<C-w>h', default_opts) -- moverse izquierda
vim.keymap.set('n', '<C-j>', '<C-w>j', default_opts) -- moverse inferior
vim.keymap.set('n', '<C-k>', '<C-w>k', default_opts) -- moverse superior
vim.keymap.set('n', '<C-l>', '<C-w>l', default_opts) -- moverse derecha

-- moverse entre pestañas 
vim.keymap.set('n', '<S-l>', ':tabNext<CR>', default_opts)
vim.keymap.set('n', '<S-h>', ':tabprevious<CR>', default_opts)


