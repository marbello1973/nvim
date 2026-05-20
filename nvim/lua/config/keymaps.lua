vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Guardar (Ctrl + S) - Ahora solo guarda sin formatear automáticamente
keymap({ "n", "i", "v" }, "<C-s>", "<cmd>update<cr><esc>", { desc = "Save file" })

-- Salir (Espacio + q)
keymap("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit Neovim" })

-- Navegación ventanas
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Menú lateral (Espacio + e)
keymap("n", "<leader>e", "<cmd>NvimTreeOpen<cr>", { desc = "Explorer Menu" })

-- Formatear Manualmente (Espacio + f)
keymap("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format Document" })

-- Autocerrado Nativo
keymap("i", "{<CR>", "{<CR>}<ESC>O", opts)
keymap("i", "[<CR>", "[<CR>]<ESC>O", opts)
keymap("i", "(<CR>", "(<CR>)<ESC>O", opts)

-- Disparo Manual del Autocompletado (Ctrl + Espacio)
keymap("i", "<C-Space>", function()
  vim.lsp.completion.get()
end, { desc = "Trigger Autocomplete" })

-- Redimensionar más rápido con Alt + Shift + Flechas
keymap("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease width (fast)" })
keymap("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase width (fast)" })
keymap("n", "<S-Up>", "<cmd>resize -2<cr>", { desc = "Decrease height (fast)" })
keymap("n", "<S-Down>", "<cmd>resize +2<cr>", { desc = "Increase height (fast)" })


-- Bufferline
vim.keymap.set('n', '<leader>b', '<cmd>Bufferin<cr>', { desc = 'Toggle Bufferin' })
