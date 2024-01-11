return {
	"folke/zen-mode.nvim",
	keys = {
		{
			"<leader>zm",
			":ZenMode<cr>",
			desc = "Open default zen-mode"
		},
		{
			"<leader>zz",
			function()
				require("zen-mode").setup {
					window = {
						width = 90,
						options = {}
					},
				}
				require("zen-mode").toggle()
				vim.wo.wrap = false
				vim.wo.number = true
				vim.wo.rnu = true
			end,
			desc = "Open zen-mode withouth word wrap and 90 width"
		},
		{
			"<leader>zZ",
			function()
				require("zen-mode").setup {
					window = {
						width = 80,
						options = {}
					},
				}
				require("zen-mode").toggle()
				vim.wo.wrap = false
				vim.wo.number = false
				vim.wo.rnu = false
				vim.opt.colorcolumn = "0"
			end,
			desc = "Open cleanest zen-mode"
		}
	}
}
