local themes = require('telescope.themes')

require'telescope'.setup {
	defaults = {
		winblend = 20,
		prompt_prefix = ' ',
		selection_prefix = ' ',
		multi_icon = ' ',
		path_display = {'smart'},
		get_status_text = function()
			return ''
		end,
		layout_strategy = 'flex',
		mappings = {
			i = {
				['<esc>'] = require('telescope.actions').close,
				['jk'] = require('telescope.actions').close,
			},
		}
	},
	pickers = {
		live_grep = {
			file_ignore_patterns = {
				'vendor/*',
				'node_modules',
				'%.jpg',
				'%.jpeg',
				'%.png',
				'%.svg',
				'%.otf',
				'%.ttf',
			},
			preview_title = '~ Location Preview ~ ',
			prompt_title = '~ Find String ~',
			results_title = '~ Occurrences ~',
		},
		find_files = {
			preview_title = '~ File Preview ~ ',
			prompt_title = '~ Find File ~',
			results_title = '~ Results ~',
		}
	}
}

vim.cmd[[
	command! EditConf lua require('telescope.builtin').find_files({cwd = '~/.config/nvim', prompt_title = '~ Configuration ~'})
]]

vim.cmd[[
	hi TelescopeTitle guibg=#bb9af7 guifg=#1f2335
	hi TelescopeBorder guifg=#bb9af7
]]
