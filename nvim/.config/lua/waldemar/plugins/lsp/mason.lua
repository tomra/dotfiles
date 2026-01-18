return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ansiblels",
				"bashls",
				"cssls",
				"emmet_ls",
				"gopls",
				"graphql",
				"html",
				"jsonls",
				"lua_ls",
				"marksman",
				"pyright",
				"ruff",
				"svelte",
				"tailwindcss",
				"terraformls",
				"ts_ls",
				"yamlls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"ansible-lint",
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d", -- js linter
				"ruff",
				"golangci-lint", -- go linter (comprehensive, includes staticcheck, errcheck, etc.)
				"gofumpt", -- go formatter (stricter gofmt)
				"goimports", -- go imports organizer
			},
		})
	end,
}
