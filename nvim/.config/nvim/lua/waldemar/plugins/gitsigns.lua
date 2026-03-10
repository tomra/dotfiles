return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			-- current_line_blame = true,
			attach_to_untracked = false,
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
        vim.keymap.set("n", "<leader>te", gs.toggle_deleted, { desc = "Toggle deleted lines preview", buffer = bufnr})
        vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle blameline inline", buffer = bufnr})
			end,
		})
	end,
}
