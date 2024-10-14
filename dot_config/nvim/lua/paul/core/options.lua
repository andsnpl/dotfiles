vim.g.netrw_liststyle = 3

local opt = vim.opt

-- Editor
opt.relativenumber = true
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.backspace = "indent,eol,start"
opt.wrap = false
opt.scrolloff = 4

-- Search
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Splits
opt.splitright = true
opt.splitbelow = true

-- System integration
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.swapfile = false
