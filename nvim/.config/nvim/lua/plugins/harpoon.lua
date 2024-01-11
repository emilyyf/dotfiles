return {
	"theprimeagen/harpoon",
	keys = {
		{ "<leader>a", function() require("harpoon.mark").add_file() end, desc = "Add current file to the list"},
		{ "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle quick menu"},
		{ "<C-h>", function() require("harpoon.ui").nav_file(1) end, desc = "Go to file 1"},
		{ "<C-j>", function() require("harpoon.ui").nav_file(2) end, desc = "Go to file 2"},
		{ "<C-k>", function() require("harpoon.ui").nav_file(3) end, desc = "Go to file 3"},
		{ "<C-l>", function() require("harpoon.ui").nav_file(4) end, desc = "Go to file 4"}
	}
}
