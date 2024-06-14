local opt = vim.opt -- for concisenss

-- encode
opt.fileencoding = "utf-8"

-- line number
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- cursor line
opt.cursorline = true

-- corsor keep move with scroll 8 interval
opt.scrolloff = 8
opt.sidescrolloff = 8

-- whithspace render to dot
-- opt.list = true
-- opt.listchars = "space:·"

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard & hit
opt.clipboard:append("unnamedplus")
opt.mouse = "a"
opt.completeopt = { "menu", "menuone", "noselect" }

-- split windows
opt.splitright = true
opt.splitbelow = true

-- disable backup file
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.wildmenu = true

opt.iskeyword:append("-")
