local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
	use 'wbthomason/packer.nvim'

	---ui [[
	use 'folke/tokyonight.nvim'
	use {
		'startup-nvim/startup.nvim',
		requires = {'nvim-lua/plenary.nvim'}
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons'}
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	use 'norcalli/nvim-colorizer.lua'
	use 'beauwilliams/focus.nvim'
	use 'nathom/filetype.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'rcarriga/nvim-notify'
	---ui ]]

	---editing [[
	use 'github/copilot.vim'

	use 'tpope/vim-surround'
	use 'tpope/vim-repeat'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-speeddating'
	use 'tpope/vim-rhubarb'
	use 'tpope/vim-ragtag'
	use 'tpope/vim-endwise'

	use 'steelsojka/pears.nvim'
	---editing ]]

	if packer_bootstrap then
		require('packer').sync()
	end
end, config = {
	display = {
		non_interactive = true
	}
}})
