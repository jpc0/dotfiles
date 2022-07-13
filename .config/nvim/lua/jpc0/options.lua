vim.opt.syntax = "ON"
vim.opt.exrc = true
vim.opt.guicursor = ""
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.smarttab = true
vim.opt.backup = false
vim.opt.undodir = os.getenv( "HOME" ) .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.incsearch = true
vim.opt.autochdir = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 2
vim.opt.updatetime = 50
vim.opt.clipboard = "unnamedplus"

-- CMP stuff
vim.opt.completeopt = {"menuone", "menu", "noselect"}

