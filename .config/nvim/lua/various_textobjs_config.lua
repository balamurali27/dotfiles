-- example: `an` for outer subword, `in` for inner subword
vim.keymap.set({ "o", "x" }, "aS", '<cmd>lua require("various-textobjs").subword(false)<CR>')
vim.keymap.set({ "o", "x" }, "iS", '<cmd>lua require("various-textobjs").subword(true)<CR>')
