local map = vim.keymap.set
local hide = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>w', ':w<cr>', hide)
map('n', '<leader>q', ':q<cr>', hide)

map('n', '<C-A-v>', ':vsplit<cr>', hide)
map('n', '<C-A-h>', ':split<cr>', hide)

map('n', '<C-h>', '<C-W>h', hide)
map('n', '<C-j>', '<C-W>j', hide)
map('n', '<C-k>', '<C-W>k', hide)
map('n', '<C-l>', '<C-W>l', hide)

map('n', '<A-h>', '<C-W><', hide)
map('n', '<A-j>', '<C-W>+', hide)
map('n', '<A-k>', '<C-W>-', hide)
map('n', '<A-l>', '<C-W>>', hide)

map('v', '<', '<gv', hide)
map('v', '>', '>gv', hide)

map('n', '<leader>e', ':Neotree focus reveal<cr>', hide)
map('n', '<leader>o', ':Neotree toggle<cr>', hide)

map('n', '<A-[>', ':BufferLineCyclePrev<cr>', hide)
map('n', '<A-]>', ':BufferLineCycleNext<cr>', hide)
map('n', '<leader>bp', ':BufferLinePick<cr>', hide)
map('n', '<leader>bc', ':BufferLinePickClose<cr>', hide)

map('n', '<leader>tf', ':Telescope find_files<cr>', hide)
map('n', '<leader>td', ':Telescope diagnostics<cr>', hide)
map('n', '<leader>tw', ':Telescope grep_string<cr>', hide)
map('n', '<leader>th', ':Telescope help_tags<cr>', hide)

map('n', '<leader>f', ':lua vim.lsp.buf.format()<cr>', hide)
map('n', '<leader>h', ':lua vim.lsp.buf.hover()<cr>', hide)
map('n', '<F2>', ':lua vim.lsp.buf.rename()<cr>', hide)
map('n', '<leader>ld', ':lua vim.lsp.buf.definition()<cr>', hide)
map('n', '<leader>lr', ':lua vim.lsp.buf.references()<cr>', hide)
map('n', '<leader>la', ':lua vim.lsp.buf.code_action()<cr>', hide)
map('n', '<leader>lt', ':TroubleToggle<cr>', hide)

map('n', '<leader>cp', ':CccPick<cr>', hide)

map('n', '<leader>bd', ':BufDel<cr>', hide)

map('n', '<leader>nn', ':lua vim.wo.relativenumber = not vim.wo.relativenumber<cr>', hide)

map('t', '<esc>', [[<C-\><C-n>]], hide)
map('t', 'jk', [[<C-\><C-n>]], hide)
map('n', '<leader>tt', ":ToggleTerm<cr>", hide)

map('n', '<leader>bb', ":DapToggleBreakpoint<cr>", hide)
map('n', '<F5>', ":DapContinue<cr>", hide)
map('n', '<F6>', ":DapStepInto<cr>", hide)
map('n', '<F7>', ":DapStepOver<cr>", hide)
map('n', '<F8>', ":DapTerminate<cr>", hide)
