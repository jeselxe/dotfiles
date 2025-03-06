vim.wo.number = true
vim.o.relativenumber = true

-- Set color scheme
vim.cmd.colorscheme "catppuccin"       

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
