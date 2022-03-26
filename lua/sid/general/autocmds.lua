vim.cmd [[
	augroup cursor
		autocmd!
		autocmd InsertLeave,WinEnter,CmdLineLeave set cursorline
		autocmd InsertEnter,WinLeave,CmdLineEnter set nocursorline
	augroup END

	augroup autoquit
		autocmd!
		autocmd FileType help,startuptime,qf,lspinfo,man nnoremap <buffer><silent> q :quit<cr>
	augroup END

	autocmd FocusGained * checktime
	autocmd TextYankPost * lua vim.highlight.on_yank()

	autocmd User PackerComplete lua require('notify')('packer: Compiled', 'success')
]]
