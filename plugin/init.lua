-- generate compile_commands.json for c/c++ project

local function generateCompileCommands()
	vim.cmd('silent! !(make fclean)')
	local cmd = "(make 2>&1 -wn | egrep 'gcc|clang|clang\\+\\+|g\\+\\+.*' > /tmp/compile_commandsNEOVIM.json)"
	vim.cmd("silent! !" .. cmd)
	if vim.v.shell_error == 0 then
		local f = io.open("/tmp/compile_commandsNEOVIM.json", "r")
		if f == nil then
			print("Make failed")
			return
		end
		local str = f:read("*a")
		local current_dir = vim.fn.getcwd()
		local file = io.open(current_dir .. "/compile_commands.json", "w")
		file:write("[\n")
		for line in str:gmatch("[^\r\n]+") do
			local filename = line:match("[^%s]+$")
			local command = line:sub(1, #line - #filename)
			local json = string.format("\t{\n\t\t\"directory\": \"%s\",\n\t\t\"command\": \"%s\",\n\t\t\"file\": \"%s\"\n\t},\n", current_dir, command, filename)
			file:write(json)
		end
		file:write("]")
		f:close()
		file:close()
		vim.cmd('silent! LspRestart')
		print("compile_commands.json generated, LSP restarted")
	else
		print("Make failed")
	end
end

vim.api.nvim_create_user_command('Gcompilecommands', function()
	generateCompileCommands()

end, {})
