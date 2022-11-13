local kmap = vim.keymap
local kmap = vim.keymap
-- vim.keymap.set({ 'n', 'x' }, " ", "")
vim.keymap.set('n', '<leader>w', ':w<CR>',{noremap = true})

-- Escape with jk
kmap.set('i', 'jk', '<Esc>')

-- Do not yank with x
kmap.set('n', 'x', '"_x')

-- Increment/Decrement with +-
kmap.set('n', '+', '<C-a>')
kmap.set('n', '-', '<C-x>')

-- Also delete current character when backwards word deletion
kmap.set('n', 'db', 'dvb')

-- Select All
kmap.set('n', '<C-a>', 'gg<S-v>G')

-- Copy all
kmap.set('n', '<C-c>', '<cmd> %y+ <CR>')

-- Do not yank with x
kmap.set('n', 'x', '"_x')

-- Increment/Decrement with +-
kmap.set('n', '+', '<C-a>')
kmap.set('n', '-', '<C-x>')

-- Also delete current character when backwards word deletion
kmap.set('n', 'db', 'dvb')

-- Select All
kmap.set('n', '<C-a>', 'gg<S-v>G')

-- Copy all
kmap.set('n', '<C-c>', '<cmd> %y+ <CR>')

-- New tab
kmap.set('n', '<leader>te', ':tabedit<CR>')
kmap.set('n', '<leader>sh', ':split<CR><C-w>w')
kmap.set('n', '<leader>ss', ':vsplit<CR><C-w>w')

-- Move through windows
kmap.set('n', '<Space>', '<C-w>w') 
kmap.set('', '<leader>wh', '<C-w>h')
kmap.set('', '<leader>wk', '<C-w>k')
kmap.set('', '<leader>wj', '<C-w>j')
kmap.set('', '<leader>wl', '<C-w>l')

-- Resize windows 
-- kmap.set('n', '<leader><S-h>', '<C-w><')
-- kmap.set('n', '<leader><S-h>', '<C-w>>')
-- kmap.set('n', '<leader><S-h', '<C-w>+')
-- kmap.set('n', '<C-w><down>', '<C-w>-')
--

-- Packer
kmap.set('n', '<leader>pi', ':PackerInstall<CR>')
kmap.set('n', '<leader>ps', ':PackerSync<CR>')
kmap.set('n', '<leader>pc', ':PackerCompile<CR>')

-- Increase status bar height
kmap.set('n', '<leader>ee', 'vim.opt.cmdheight=3')
