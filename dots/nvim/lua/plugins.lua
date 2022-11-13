status, packer = pcall(require, 'packer')
if not status then
	print("Packer not installed.")
	return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'folke/tokyonight.nvim',
		config = "vim.cmd [[colorscheme tokyonight-night]]"
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
  end
	}
	use {
		"windwp/nvim-autopairs",
			config = function() require("nvim-autopairs").setup {} end
	}
	use "neovim/nvim-lspconfig"
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use "hrsh7th/nvim-cmp"
	use "onsails/lspkind.nvim"
	use "L3MON4D3/LuaSnip"
	use "rafamadriz/friendly-snippets"
	use "saadparwaiz1/cmp_luasnip"
	use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }
	-- use "andweeb/presence.nvim"
	use "terrortylor/nvim-comment"
end)




