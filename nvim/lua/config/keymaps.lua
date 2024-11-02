-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Insert empty line and stay in normal mode
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

--- Window resizing/navigation
---
-- remove lazyvim mapping
vim.keymap.del({ "n", "t" }, "<c-h>")
vim.keymap.del({ "n", "t" }, "<c-j>")
vim.keymap.del({ "n", "t" }, "<c-k>")
vim.keymap.del({ "n", "t" }, "<c-l>")

-- add my own
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]])
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]])
vim.keymap.set("n", "<c-Right>", "<c-w>l")
vim.keymap.set("n", "<c-Up>", "<c-w>k")
vim.keymap.set("n", "<c-Left>", "<c-w>h")
vim.keymap.set("n", "<c-Down>", "<c-w>j")

-- go to user secrets
-- works only if used in .csproj file with user secrets id present
-- if folder with secret id does not exist you need to create it manually
-- 'y:e C:\\Users\\tnadvornik\\AppData\\Roaming\\Microsoft\\UserSecrets\\:h getreg\\secrets.json<CR>'
-- would love to pimp this in the future
vim.keymap.set("n", "<leader>gu", function()
  vim.cmd("/<UserSecrets")
  vim.cmd("nohl")
  vim.cmd('execute "normal! f>wyt<"')
  local regValue = vim.fn.getreg("+")
  local secret =
    string.format("C:\\Users\\tnadvornik\\AppData\\Roaming\\Microsoft\\UserSecrets\\%s\\secrets.json", regValue)
  vim.cmd.edit(secret)
end, { desc = "[G]o to [U]ser secrets" })
