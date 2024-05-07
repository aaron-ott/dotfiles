-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<leader>k", "<C-u>", { desc = "Down a half-page or so" })
map("n", "<leader>j", "<C-d>", { desc = "Up a half-page or so" })
