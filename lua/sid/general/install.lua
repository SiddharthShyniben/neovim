local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- ui
	use 'folke/tokyonight.nvim'
	use {
		'startup-nvim/startup.nvim',
		requires = {'nvim-lua/plenary.nvim'}
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
