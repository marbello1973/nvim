
-- shell
vim.opt.shell = "/usr/bin/zsh"

-- Habilitar sintaxis
vim.cmd('syntax on')

-- Mostrar números en línea
vim.opt.number = true               -- Número de líneas
vim.opt.relativenumber = true       -- Números relativos

-- Codificación de archivos
vim.opt.encoding = 'utf-8'

-- Habilitar la detección de archivos y complementos
vim.cmd('filetype plugin indent on')

-- Coincidencias mientras se escribe
vim.opt.incsearch = true

-- Ignorar mayúsculas y respetar smartcase
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Resaltar texto coincidente con la búsqueda
vim.opt.hlsearch = true

-- Guardado automático al salir del buffer
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*",
    command = "silent! update",
})

-- Habilitar portapapeles
vim.opt.clipboard = 'unnamedplus'

-- Espacios y tabulaciones
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Mejor experiencia visual
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.mouse = 'a'
vim.opt.wrap = true

-- Colores
vim.opt.termguicolors = true
vim.cmd("colorscheme habamax")


