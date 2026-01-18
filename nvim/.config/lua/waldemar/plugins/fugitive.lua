return {
	"tpope/vim-fugitive",
	enter = "InsertEnter",
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>gg", vim.cmd.Git, { desc = "Activate vim fugitive"})
	end,
}
