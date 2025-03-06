-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{ "catppuccin/nvim", as = "catppuccin" },
	-- Fuzzy Finder (files, lsp, etc)
	'ThePrimeagen/git-worktree.nvim',
	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
	'nvim-telescope/telescope-symbols.nvim',
  	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
	'nvim-lualine/lualine.nvim', -- Fancier statusline
	{
	    "folke/noice.nvim",
	    config = function()
	      require("noice").setup({
		-- add any options here
		routes = {
		  {
		    filter = {
		      event = 'msg_show',
		      any = {
			{ find = '%d+L, %d+B' },
			{ find = '; after #%d+' },
			{ find = '; before #%d+' },
			{ find = '%d fewer lines' },
			{ find = '%d more lines' },
		      },
		    },
		    opts = { skip = true },
		  }
		},
	      })
	    end,
	    dependencies = {
	      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	      "MunifTanjim/nui.nvim",
	      "rcarriga/nvim-notify",
	    }
	},
})
