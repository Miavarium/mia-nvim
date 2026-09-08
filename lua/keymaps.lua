--- =========
--- KEYMAPS
--- =========
vim.g.mapleader = " " -- Space for leader
vim.g.maplocalleader = " " -- Space for local leader
local map = vim.keymap.set

-- Better movement in wrapped text
map("n", "j", function()
  return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
map("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

map("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Easier saving
map("n", "<S-w>", ":w<cr>", {desc = "Save file"})
map("n", "<S-q>", ":wq<cr>", {desc = "Save and quit file"})

map("n", "<C-p>", ":@:<cr>", {desc = "Repeat last command line"})

-- Telescope commands
map('n', '<leader>tf', ':Telescope find_files<cr>', { desc = "Telescope] Find files" })
map('n', '<leader>tg', ':Telescope live_grep<cr>', { desc = "[Telescope] Live grep" })
map('n', '<leader>tb', ':Telescope buffers<cr>', { desc = "[Telescope] List buffers" })
map('n', '<leader>th', ':Telescope help_tags<cr>', { desc = "[Telescope] Navigate help" })

map('n', '<leader>m', ':Mason<cr>', {desc = "Mason"})

-- Better search
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })


--map("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
--map({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

-- Buffers
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- Shift lines around (really cool :D)
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Make sure indents on visual mode are reselected automagically
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- PWD into copy paste
map("n", "<leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

-- Toggle Diagnostics
map("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })


