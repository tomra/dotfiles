return {
	"ntpeters/vim-better-whitespace",
	config = function()
		vim.g.better_whitespace_enabled = 1
		vim.g.better_whitespace_filetypes_blacklist =
			{ "diff", "git", "gitcommit", "unite", "qf", "help", "markdown", "fugitive", "alpha", "dashboard" }

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>w", ":ToggleWhitespace<CR>")
	end,
}
