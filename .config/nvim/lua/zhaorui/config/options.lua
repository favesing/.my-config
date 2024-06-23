
-- encoding
vim.opt.encoding = "utf-8"	-- set encoding

-- indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true	-- convert tabs to spaces
vim.opt.autoindent = true	-- auto indentation
vim.opt.smartindent = true
vim.opt.list = true	-- show tab characters and trailing whitespace
vim.opt.listchars = "tab:»\\ ,extends:›,precedes:‹,nbsp:·,trail:·" -- show tab characters and trailing whitespace

-- line & cursor
vim.opt.number = true	-- enable line number
vim.opt.relativenumber = true	-- relative line numbers
vim.opt.wrap = false -- line wrapping
vim.opt.cursorline = true -- cursor line
vim.opt.scrolloff = 8	-- corsor keep move with scroll 8 interval
vim.opt.sidescrolloff = 8 -- corsor keep move with scroll 8 interval

-- searching
vim.opt.ignorecase = true 	-- ignore case when searching
vim.opt.smartcase = true	-- unless capital letter in search
vim.opt.incsearch = true	-- incrementally highlight searches as you type
vim.opt.hlsearch = false	-- do not highlight all matches on previous search pattern

-- apper
vim.opt.termguicolors = true -- enable true color support
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.backspace = "indent,eol,start"

-- clipboard & hit
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.splitright = true
vim.opt.splitbelow = true

-- disable backup file
vim.opt.backup = false	-- do not keep a backup file
vim.opt.writebackup = false
vim.opt.swapfile = false -- do not use a swap file for the buffer
vim.opt.wildmenu = true

vim.opt.iskeyword:append("-")
