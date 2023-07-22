-- Motion Keymaps
vim.keymap.set({"n", "o", "x"}, "w", function() require("spider").motion("w") end, { desc = "Spider-w" })
vim.keymap.set({"n", "o", "x"}, "e", function() require("spider").motion("e") end, { desc = "Spider-e" })
vim.keymap.set({"n", "o", "x"}, "b", function() require("spider").motion("b") end, { desc = "Spider-b" })
vim.keymap.set({"n", "o", "x"}, "ge", function() require("spider").motion("ge") end, { desc = "Spider-ge" })

---	Operator-pending maps
vim.keymap.set({"n"}, "dw", "de", {remap = true, desc = "Spider-dw"})
vim.keymap.set({"n"}, "cw", "ce", {remap = true, desc = "Spider-cw"})

-- Insert mode maps
vim.keymap.set("i", "<C-w>", "<Esc>caS", { remap = true })


-- default values
require("spider").setup({
	skipInsignificantPunctuation = false
})
