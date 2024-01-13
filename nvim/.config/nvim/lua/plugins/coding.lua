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
			{ "<C-a>", function()
				require("dial.map").manipulate("increment", "normal")
			end },
			{ "<C-x>", function()
				require("dial.map").manipulate("decrement", "normal")
			end },
			{ "g<C-a>", function()
				require("dial.map").manipulate("increment", "gnormal")
			end },
			{ "g<C-x>", function()
				require("dial.map").manipulate("decrement", "gnormal")
			end },
		}
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		keys = {
			{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
				{ silent = true, noremap = true } },
			desc = "Open trouble window"
		}
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c",
					"cpp",
					"rust",
					"elixir",
					"javascript",
					"typescript",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"markdown",
					"markdown_inline",
					"html" },
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		enabled = true,
		opts = { mode = "cursor", max_lines = 3 },
		keys = {
			{
				"<leader>ut",
				function()
					require("treesitter-context").toggle()
				end,
				desc = "Toggle Treesitter Context",
			},
		},
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Autocompletion
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lua',

			-- Snippets
			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets',
		},
		config = function()
			local lsp = require("lsp-zero")

			lsp.preset("recommended")

			lsp.ensure_installed({
				'tsserver',
				'rust_analyzer',
			})

			-- Fix Undefined global 'vim'
			lsp.configure('lua-language-server', {
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' }
						}
					}
				}
			})

			local cmp = require('cmp')
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			local cmp_mappings = lsp.defaults.cmp_mappings({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			})

			cmp_mappings['<Tab>'] = nil
			cmp_mappings['<S-Tab>'] = nil

			lsp.setup_nvim_cmp({
				mapping = cmp_mappings
			})

			lsp.set_preferences({
				suggest_lsp_servers = false,
				sign_icons = {
					error = 'E',
					warn = 'W',
					hint = 'H',
					info = 'I'
				}
			})

			lsp.on_attach(function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
				vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
				vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
				vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
				vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
				vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
				vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
				vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
				vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
				vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
			end)

			lsp.setup()

			vim.diagnostic.config({
				virtual_text = true
			})
		end
	},
}
