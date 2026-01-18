return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
			},
			indent = {
				enable = true,
				style = {
					{ fg = "#434437" },
					{ fg = "#2f4440" },
					{ fg = "#433054" },
					{ fg = "#284251" },
				},
			},
		})
	end,
}
