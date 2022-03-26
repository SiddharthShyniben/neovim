local quotes = {
	"Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.\n\n- Brian Kernighan",
	"If you don't fail at least 90% of the time, you're not aiming high enough.\n\n- Alan Kay",
	"Always code as if the person who ends up maintaining your code is a violent psychopath who knows where you live.\n\n- John Woods",
	"Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.",
	"If you don't make mistakes, you're not working on hard enough problems.\n\n- Frank Wilczek",
	"Use tracer bullets to find the target.\n\nTracer bullets let you home in on your target by trying things and seeing how close they land.",
	"Always design for concurrency.\n\nAllow for concurrency, and you'll design cleaner interfaces with fewer assumptions.",
	"Test your software, or your users will.\n\nTest ruthlessly. Don't make your users find bugs for you.",
	"Don't live with broken windows.\n\nFix bad designs, wrong decisions, and poor code when you see them.",
	"Keep knowledge in plain text.\n\nPlain text won't become obsolete. It helps leverage your work and simplifies debugging and testing.",
	"Use a single editor well.\n\nThe editor should be an extension of your hand; make sure your editor is configurable, extensible, and programmable.",
	"Crash early.\n\nA dead program normally does a lot less damage than a crippled one.",
	"Design to test.\n\nStart thinking about testing before you write a line of code.",
	"Work with a user to think like a user.\n\nIt's the best way to gain insight into how the system will really be used.",
	"Test early. Test often. Test automatically.\n\nTests that run with every build are much more effective than test plans that sit on a shelf.",
	"Use saboteurs to test your testing.\n\nIntroduce bugs on purpose in a separate copy of the source to verify that testing will catch them.",
	"There's an old story about the person who wished his computer were as easy to use as his telephone. That wish has come true, since I no longer know how to use my telephone.\n\n- Bjarne Stroustrup",
	'There are only two industries that refer to their customers as "users".\n\n- Edward Tufte',
	"Easy things should be easy and hard things should be possible.\n\n- Larry Wall",
	"They did not know it was impossible, so they did it!\n\n- Mark Twain",
	"If debugging is the process of removing bugs, then programming must be the process of putting them in.\n\n- Edsger W. Dijkstra",
	"The average user doesn't give a damn what happens, as long as (1) it works and (2) it's fast.\n\n- Daniel J. Bernstein",
}

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
			-- local text = vim.fn.system 'fortune -s'
			local text = quotes[math.random(#quotes)]
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
