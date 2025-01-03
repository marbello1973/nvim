local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
-- insert packer plugins

-- Temas 
use "folke/tokyonight.nvim"

use "nvim-lualine/lualine.nvim"

-- nvim tree for sider & telescope
use "nvim-tree/nvim-tree.lua"
use "nvim-tree/nvim-web-devicons"
use "nvim-treesitter/nvim-treesitter"

use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    requires = {{"nvim-lua/plenary.nvim"}}
}

-- lsp
use {
    "williamboman/mason.nvim", 
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "glepnir/lspsaga.nvim", branch = "main", -- for window like vscode
    "jose-elias-alvarez/typescript.nvim",
    "onsails/lspkind.nvim"
}

use {"akinsho/toggleterm.nvim", tag = '*'}
use "windwp/nvim-autopairs"
use "windwp/nvim-ts-autotag"

-- completions
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  use "saadparwaiz1/cmp_luasnip"

if packer_bootstrap then
    require('packer').sync()
  end
end)



