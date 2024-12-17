-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

vim.o.background = "dark"

local c = require("vscode.colors").get_colors()
require("vscode").setup({
  transparent = true,
  italic_comments = true,
  underline_links = true,
  disable_nvimtree_bg = true,
  color_overrides = {
    vscLineNumber = "#FFFFFF",
  },
  group_overrides = {
    Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
  },
})
require("vscode").load()
vim.cmd.colorscheme("vscode")
