return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},

			pickers = {
				find_files = {
					hidden = true,

					-- find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" },
				},
				grep_string = {
					additional_args = { "--hidden" },
				},
				live_grep = {
					additional_args = {"--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--trim" ,"--hidden", "--sort=path", "-u", "--glob", "!.git/", "--glob", "!.ansible/",  "--glob", "!*dashboards*", "--glob", "!*external*"},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "[S]earch [F]iles" }) -- find files within current working directory, respects .gitignore
		keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "[S]earch by [G]rep" }) -- find string in current working directory as you type
		keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "[S]earch current [W]ord" }) -- find string under cursor in current working directory
		keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "[S]earch [B]uffer" }) -- list open buffers in current neovim instance
		keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "[S]earch [H]elp" }) -- list available help tags
		keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Search [G]it [F]iles" }) -- find git files
		keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "[S]earch [D]iagnostics" })
		keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "[S]earch [T]odo comments in Telescope"})
	end,
}
