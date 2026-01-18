return {
	"mfussenegger/nvim-lint",
	-- event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
      ansible = { "ansible_lint" },
      bash = { "shellcheck" },
      go = { "golangcilint" },
			javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      markdown = { "markdownlint" },
      python = { "ruff" },
      shell = { "shellcheck" },
      svelte = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ml", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
