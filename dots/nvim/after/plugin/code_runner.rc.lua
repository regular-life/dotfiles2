require('code_runner').setup({
  -- put here the commands by filetype
  filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python3 -u $fileName",
		typescript = "deno run",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
--		cpp = "cd $dir && st -c $(g++ $fileName -o $fileNameWithoutExt -std=c++20 && $dir/$fileNameWithoutExt)"
 			cpp = "alacritty -e sh -c \"g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt && read\""
	},
	startinsert=true,
})
vim.keymap.set('n', '<leader>cc', ':RunCode<CR>', { noremap = true, silent = false })
