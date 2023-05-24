vim.opt.tabstop=2
vim.opt.shiftwidth=2

-- Create a new todo list on next line with indentation (as it's the first item of the new list / sublist)
vim.keymap.set("n", "<leader>n", "o<tab>- [ ] ")

-- Add new todo item on next line of an existing list (no explicit indentation as it is just another item on existing list)
vim.keymap.set("n", "<leader>a", "o- [ ] ")

-- Complete markup todo item on line
vim.keymap.set("n", "<leader>c", "0f[lrx")

-- Uncomplete markup todo item on line (note empty space at end)
vim.keymap.set("n", "<leader>u", "0f[lr ")
