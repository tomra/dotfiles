return {
	{
		"nvim-treesitter/nvim-treesitter",
		-- event = { "BufReadPre", "BufNewFile" },
    lazy = false,
		build = ":TSUpdate",
		dependencies = {
      "OXY2DEV/markview.nvim",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
		config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
			  	"bash",
			  	"css",
			  	"diff",
			  	"dockerfile",
			  	"gitignore",
			  	"graphql",
          "hcl",
			  	"html",
			  	"javascript",
			  	"jq",
			  	"json",
			  	"lua",
			  	"markdown",
			  	"puppet",
			  	"python",
          "regex",
			  	"ruby",
			  	"rust",
			  	"terraform",
			  	"typescript",
			  	"vim",
			  	"yaml",
			  },
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
      require("nvim-ts-autotag").setup()
    end,
	},
}
