require('telescope').setup({
  defaults = {
    prompt_prefix = "> ",
    selection_caret = "> ",
    path_display = { "truncate" },
  }
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
