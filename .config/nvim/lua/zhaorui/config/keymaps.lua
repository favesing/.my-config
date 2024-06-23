-- set leader key to space
vim.g.mapleader = " "

-- save, quit
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>Q", ":qa!<cr>")

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<cr>")

-- windows resize
vim.keymap.set("n", "<leader><left>", 	":vertical resize +10<cr>")
vim.keymap.set("n", "<leader><right>", 	":vertical resize -10<cr>")
vim.keymap.set("n", "<leader><up>", 	":resize +10<cr>")
vim.keymap.set("n", "<leader><down>", 	":resize -10<cr>")

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<cr>") -- close current split window

-- window tabs
vim.keymap.set("n", "<leader>to", ":tabnew<cr>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<cr>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<cr>") --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<cr>") --  go to previous tab

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")
vim.keymap.set("n", "<leader>b", ":b#<cr>")

-- move a blocks of text up/down with K/J in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- map Ctrl-c to Escape
vim.keymap.set("i", "<C-c>", "<Esc>")

----------------------
-- Plugin Keybinds
----------------------

-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- nvim-tree NvimTreeFindFileToggle NvimTreeToggle
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>")

-- markdown preview
vim.keymap.set("n", "<leader>mp", "<cmd>:MarkdownPreviewToggle<cr>")

-- nvim-comment
vim.keymap.set({"n", "v"}, "<leader>/", ":CommentToggle<cr>")

-- vim-maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<cr>")

-- format code using LSP
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)


