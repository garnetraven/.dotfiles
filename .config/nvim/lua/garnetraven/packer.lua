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
	-- Packer
	use 'wbthomason/packer.nvim'

	-- Color Theme
	use { 
		'rose-pine/neovim',
		as = 'rose-pine',
	}

	-- LSP
	use {
		'williamboman/mason.nvim',
		run = ":MasonUpdate"
	}
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		requires = { {'nvim-lua/plenary.nvim'} } 
	}

	-- Harpoon
	use {
		'ThePrimeagen/harpoon',
		branch = "harpoon2",
		requires = { {'nvim-lua/plenary.nvim'} } 
	}

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate",
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
