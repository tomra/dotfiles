return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	-- version = "*",
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						separator = true,
						text_alin = "center",
					},
				},
				numbers = "ordinal",
				mode = "buffers",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function()
					return " "
				end,
				modified_icon = "●",
				separator_style = "thin",
			},
		})
		-- set keymaps
		vim.keymap.set("n", "<leader>bl", ":BufferLinePick<CR>", { desc = "Toggle Bufferline Picker" })
	end,
}
