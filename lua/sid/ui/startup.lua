function split (inputstr, sep)
	local t = {}

	for str in string.gmatch(inputstr, '([^'..sep..']+)') do
		table.insert(t, str)
	end

	return t
end

require('startup').setup {
	quote = {
		type = 'text',
		content = function()
			local text = vim.fn.system 'fortune -s'
			local _, lineCount = string.gsub(text, '\n', '')
			local height = math.floor((vim.o.lines / 2) - lineCount) - 1
			print(height)

			local out = text

			for i = 0, height, 1 do
				out = ' \n ' .. out
			end

			return split(out .. '\n', '\n')
		end,
		align = 'center',
		highlight = 'Keyword'
	},
	options = {
		after = function ()
			vim.cmd [[setlocal nornu ls=0 noru cc= nocuc nocul]]
		end,
		cursor_column = 0.5
	},
	parts = {'quote'}
}
