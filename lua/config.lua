
local opt = vim.opt

-- Keybinds
vim.g.mapleader = ' '
vim.g.localleader = ' '
--vim.g.have_nerd_font = true -- enable nerd font extended icon set



-- Options Settings
opt.number = true -- print line numbers
opt.relativenumber = true -- relative line numbers
opt.mouse = 'a' -- allow mouse to be used in certain situations
opt.ignorecase = true -- ignore capital letters during searches
opt.smartcase = true -- only match search terms if the search has a capital letter
opt.hlsearch = false -- highlight previous search terms
opt.wrap = true -- wrap lines that extend beyond buffer width
opt.breakindent = true -- indent lines that get wrapped
opt.tabstop = 2 -- how many spaces large a tab should be
opt.shiftwidth = 2 -- how far to shift text with << and >>
opt.expandtab = true -- turns tabs into spaces
opt.smartindent = true
opt.termguicolors = true -- enables hexadecimal colors beyond term256
opt.ruler = false
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.showmode = false -- don't show mode since it's already in the status line
opt.clipboard = 'unnamedplus' -- sync clipboard between OS and Neovim
opt.signcolumn = 'yes'
-- control where new splits are created
opt.splitright = true
opt.splitbelow = true
-- display whitespace chars
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- preview substitutions as you type
opt.inccommand = 'split'
-- show which line cursor is on
opt.cursorline = true
-- set minimum number of lines to keep above/below current line
opt.scrolloff = 10

-- [[ Keymaps ]]--
-- highlight text on search, clear on escape
opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>ce', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>cq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Drag highlighted text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Drag selection down', silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Drag selection up', silent = true })

--[[
vim.keymap.set('n', '<leader>bh', vim.cmd('BufferlineCyclePrev'), { desc = 'Move to the previous bufferline tab' })
vim.keymap.set('n', '<leader>bl', vim.cmd('BufferlineCycleNext'), { desc = 'Move to the next bufferline tab' })
]]--


-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


require('lazyinit')
