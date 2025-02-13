-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------
vim.keymap.set('n', '<Space>wq', ':wq<CR>', opts)
vim.keymap.set('n', '<Space>qq', ':q!<CR>', opts)
vim.keymap.set('n', '<A-m>'    , ':NvimTreeToggle<CR>', opts)

vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', '<A-h>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<A-l>', ':vertical resize +2<CR>', opts)
-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-----------------
-- Input mode --
-----------------
vim.keymap.set('i', 'kj', '<Esc>', opts)
