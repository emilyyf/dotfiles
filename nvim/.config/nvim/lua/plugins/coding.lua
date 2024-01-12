return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{ "<leader>re", function() require('refactoring').refactor('Extract Function') end },
			{ "<leader>rf", function() require('refactoring').refactor('Extract Function To File') end },
			-- Extract function supports only visual mode
			{ "<leader>rv", function() require('refactoring').refactor('Extract Variable') end },
			-- Extract variable supports only visual mode
			{ "<leader>rI", function() require('refactoring').refactor('Inline Function') end },
			-- Inline func supports only normal
			{ "<leader>ri", function() require('refactoring').refactor('Inline Variable') end },
			-- Inline var supports both normal and visual mode
			{ "<leader>rb", function() require('refactoring').refactor('Extract Block') end },
			{ "<leader>rbf", function()
				require(
					'refactoring').refactor('Extract Block To File')
			end }
			-- Extract block supports only normal mode
		},
		config = function()
			require("refactoring").setup()
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		keys = {
			{ "<leader>rn", ":IncRename " }
		},
		config = function()
			require("inc_rename").setup()
		end,
	},
	{
		"monaqa/dial.nvim",
		keys = {
			{"<C-a>", function()
				require("dial.map").manipulate("increment", "normal")
			end},
			{"<C-x>", function()
				require("dial.map").manipulate("decrement", "normal")
			end},
			{"g<C-a>", function()
				require("dial.map").manipulate("increment", "gnormal")
			end},
			{"g<C-x>", function()
				require("dial.map").manipulate("decrement", "gnormal")
			end},
		}
	},
}
