vim.opt.termguicolors = true

require('rose-pine').setup({
	dark_variant = 'moon',
	disable_background = true,
	highlight_group = {
		Visual = { bg = "none" },
	}
})

vim.cmd("colorscheme rose-pine")
