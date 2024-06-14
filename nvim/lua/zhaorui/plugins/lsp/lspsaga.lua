-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	move_in_sage = { prev = "<C-k>", next = "<C-j>" },
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	definition = {
		keys = {
			edit = "<CR>",
		},
	},
})
