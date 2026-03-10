return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	branch = "harpoon2",

	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()
		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Mark file with harpoon" })
		keymap.set("n", "<leader>he", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle harpoon quick menu" })
		keymap.set("n", "<leader>hh", function()
			harpoon:list():select(1)
		end)
		keymap.set("n", "<leader>hj", function()
			harpoon:list():select(2)
		end)
		keymap.set("n", "<leader>hk", function()
			harpoon:list():select(3)
		end)
		keymap.set("n", "<leader>hl", function()
			harpoon:list():select(4)
		end)

		keymap.set("n", "<C-S-O>", function()
			harpoon.ui:next()
		end, { desc = "Go to next harpoon mark" })
		keymap.set("n", "<C-S-I>", function()
			harpoon.ui:prev()
		end, { desc = "Go to previous harpoon mark" })
	end,
}
