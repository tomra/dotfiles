return {
	"numToStr/FTerm.nvim",
	config = function()
		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
		keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
}
