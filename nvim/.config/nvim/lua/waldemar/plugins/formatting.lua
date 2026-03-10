return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				css = { "prettier" },
        go = { "goimports", "gofumpt" }, -- runs in order: first goimports, then gofumpt
        graphql = { "prettier" },
        hcl = { "terraform_fmt" },
        html = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
				json = { "prettier" },
        lua = { "stylua" },
				markdown = { "markdownlint" },
        python = { "ruff_format" },
        terraform = { "terraform_fmt" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        yaml = { "prettier" },
			},
			-- format_on_save = {
			-- 	lsp_fallback = "fallback",
			-- 	async = false,
			-- 	timeout_ms = 1000,
			-- },
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_format = "fallback",
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
