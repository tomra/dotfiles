return {
	"mbbill/undotree",
	event = "InsertEnter",
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
	end,
}
