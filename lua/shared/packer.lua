-- packer
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.cmd [[packadd packer.nvim]]
vim.cmd('colorscheme rose-pine')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('vim-scripts/Tabmerge')

  use('nvim-lua/plenary.nvim')
  use('hrsh7th/nvim-cmp')

  use({
      "jackMort/ChatGPT.nvim",
      config = function()
          require("chatgpt").setup({
              chat = {
                  -- FIXME keymaps dont seem to work
                  -- keymaps = {
                  --     close = { "<Space><Esc>" },
                  --     yank_last = "<Leader>y",
                  --     yank_last_code = "<Leader>k",
                  --     scroll_up = "<C-u>",
                  --     scroll_down = "<C-d>",
                  --     new_session = "N",
                  --     cycle_windows = "<Tab>",
                  --     cycle_modes = "<C-f>",
                  --     select_session = "<Space>",
                  --     rename_session = "r",
                  --     delete_session = "d",
                  --     draft_message = "<C-d>",
                  --     toggle_settings = "<Leader>o",
                  --     toggle_message_role = "<C-r>",
                  --     toggle_system_role_open = "<C-s>"
                  -- }
              }
          })
      end,
      requires = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim"
      }
  })

  use {
      'numToStr/Comment.nvim',
      config = function()
		  require('Comment').setup({
              mappings = {
                  extra = false
              }
          })
	  end
  }

  -- neater keymaps
  use('b0o/mapx.nvim')

  -- lsp
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {                                      -- Optional
		  'williamboman/mason.nvim',
		  run = function()
			  pcall(vim.cmd, 'MasonUpdate')
		  end,
	  },
	  {'williamboman/mason-lspconfig.nvim'}, -- Optional

	  -- Autocompletion
	  {'hrsh7th/nvim-cmp'},         -- Required
	  {'hrsh7th/cmp-nvim-lsp'},     -- Required
	  {'hrsh7th/cmp-buffer'},       -- Optional
	  {'hrsh7th/cmp-path'},         -- Optional
	  {'saadparwaiz1/cmp_luasnip'}, -- Optional
	  {'hrsh7th/cmp-nvim-lua'},     -- Optional

	  -- Snippets
	  {'L3MON4D3/LuaSnip'},             -- Required
	  {'rafamadriz/friendly-snippets'}, -- Optional
  }
}
end)

