return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({})

		local keymap = vim.keymap

		keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "Toggle outline lspsaga" })
		keymap.set("n", "<leader>hd", "<cmd>Lspsage hover_doc<cr>", { desc = "Toggle hover doc lspsaga" })
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
}
