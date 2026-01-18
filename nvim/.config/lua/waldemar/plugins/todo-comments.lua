return {
	"folke/todo-comments.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	opts = {
		keywords = {
			-- concatenation hacks to avoid being detected here
			FIX = {
				icon = " ",
				color = "error",
				alt = { "F" .. "IXME", "F" .. "IXIT", "B" .. "UG", "B" .. "UGS" },
			},
			WARN = {
				icon = " ",
				color = "warning",
				alt = { "W" .. "ARNING", "W" .. "ARNINGS", "A" .. "TTENTION" },
			},
			["T" .. "ODO"] = {
				icon = " ",
				color = "info",
				alt = { "T" .. "ODOS", "I" .. "SSUE", "I" .. "SSUES" },
			},
			["N" .. "OTE"] = {
				icon = "󰎞 ",
				color = "hint",
				alt = { "N" .. "OTES", "I" .. "NFO", "I" .. "NFOS", "H" .. "INT", "H" .. "INTS" },
			},
		},
		merge_keywords = false, -- use only keywords listed above, don't include defaults
		highlight = {
			before = "",
			keyword = "wide_bg",
			after = "fg",
			-- Listing the pattern twice is a workaround. The trailing : shall be optional,
			-- which should work with e.g. :\? or :\= or :\{,1} or some other vim regex magic,
			-- but of course it does not. So let's just pass a table with both
			-- variants and move on with our live.
			pattern = { [[<(KEYWORDS)>:]], [[<(KEYWORDS)>]] }, -- vim syntax
			comments_only = true, -- uses treesitter to match keywords in comments only
		},
		search = {
			pattern = [[\b(KEYWORDS):?\b]], -- ripgrep regex
		},
	},
}
