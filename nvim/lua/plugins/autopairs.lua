vim.pack.add({ 
    { src = "https://github.com/windwp/nvim-autopairs" } 
})

require("nvim-autopairs").setup({
  check_ts = true, -- Usar Treesitter para verificar el contexto
  ts_config = {
    lua = { "string" }, -- No añadir pares en strings de Lua
    javascript = { "template_string" },
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  fast_wrap = {
    map = "<M-e>", -- Alt + e para envolver palabra actual
    chars = { "{", "[", "(", '"', "'" },
    pattern = [=[[%'%"%>%]%)%}%,]]=],
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "Search",
    highlight_grey = "Comment",
  },
})




