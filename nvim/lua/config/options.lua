vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- Configuración recomendada para Autocompletado Nativo v0.12
opt.completeopt = { "menuone", "noselect", "noinsert", "popup", "fuzzy" } -- Añadido "fuzzy" para mejor filtrado

-- Indentación de 4 espacios
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

-- Otras opciones
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.termguicolors = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.signcolumn = "yes"  -- Corregido: eliminado "mejora"

-- Nuevas opciones útiles para Neovim 0.12
opt.splitright = true    -- Splits verticales a la derecha
opt.splitbelow = true    -- Splits horizontales abajo
opt.wrap = false         -- No wrap de líneas largas
opt.scrolloff = 8        -- Mantener contexto al scroll
opt.sidescrolloff = 8    -- Mantener contexto horizontal
opt.cul = true           -- Resaltar línea actual (cursorline)
opt.showmode = false     -- No mostrar modo (ya lo muestra la UI)
opt.hlsearch = true      -- Resaltar búsquedas
opt.incsearch = true     -- Búsqueda incremental
opt.ignorecase = true    -- Ignorar mayúsculas en búsqueda
opt.smartcase = true     -- Si hay mayúsculas, respetarlas
opt.backup = false       -- Sin backups
opt.swapfile = false     -- Sin swapfiles
opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undo"
opt.undofile = true      -- Persistencia de deshacer
