return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ '<C-p>', function() require('telescope.builtin').git_files() end, desc = "List git files" },
		{ '<leader>fs', function()
				require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
			end, desc = "Grep search" },
		{ '<leader>ff', function() require('telescope.builtin').find_files() end, desc = "List files"  },
		{ '<leader>fg', function() require('telescope.builtin').live_grep() end, desc = "Live grep search" },
		{ '<leader>fb', function() require('telescope.builtin').buffers() end, desc = "List open buffers" },
		{ '<leader>fh', function() require('telescope.builtin').help_tags() end, desc = "List help tags" },
	}
}
