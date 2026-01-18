return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{
			"antosha417/nvim-lsp-file-operations",
			config = true,
		},
	},

	config = function()
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.reference<cr>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts) -- show lsp type definitions
				--
				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Format file with LSP"
				vim.keymap.set("n", "<leader>lf", function()
					vim.lsp.buf.format({ async = true })
				end, opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "gj", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "gk", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, opts) -- jump to next diagnostic in buffer

				keymap.set("n", "<leader>td", function()
					vim.diagnostic.enable(not vim.diagnostic.is_enabled())
				end, { silent = true, noremap = true })
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config("html", {})

		vim.lsp.config("ts_ls", {})

		vim.lsp.config("cssls", {})

		vim.lsp.config("pyright", {
			settings = {
				pyright = {
					-- Using Ruff's import organizer
					disableOrganizeImports = true,
				},
				python = {
					analysis = {
						typeCheckingMode = "basic",
						autoSearchPath = true,
						useLibraryCodeForTypes = true,
						-- -- Ignore all files for analysis to exclusively use Ruff for linting
						-- ignore = { "*" },
					},
				},
			},
			filetypes = { "python" },
		})

		vim.lsp.config("ruff", {})

		-- configure prisma orm server
		vim.lsp.config("prismals", {})

		vim.lsp.config("graphql", {
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})

		vim.lsp.config("emmet_ls", {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		vim.lsp.config("gopls", {
			settings = {
				gopls = {
					-- Analysis settings
					analyses = {
						unusedparams = true,
						shadow = true,
						nilness = true,
						unusedwrite = true,
						useany = true,
					},
					-- Static check configuration
					staticcheck = true,
					-- Inlay hints
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					-- Code lens
					codelenses = {
						gc_details = true,
						generate = true,
						regenerate_cgo = true,
						test = true,
						tidy = true,
						upgrade_dependency = true,
						vendor = true,
					},
					-- Completion settings
					usePlaceholders = true,
					completeUnimported = true,
					-- Formatting (disable if using gofumpt via conform)
					gofumpt = false, -- We use conform.nvim with gofumpt
				},
			},
		})

		vim.lsp.config("terraformls", {})

		vim.lsp.config("ansiblels", {
			filetypes = { "yaml.ansible" },
		})

		vim.lsp.config("yamlls", {
			settings = {
				yaml = {
					schemas = {
						kubernetes = "*.yaml",
						["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
						["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json"] = "playbooks/*.yml",
					},
					schemaStore = {
						enable = true,
						url = "https://www.schemastore.org/api/json/catalog.json",
					},
				},
			},
			filetypes = { "yaml" },
		})

		vim.lsp.config("marksman", {
			filetypes = { "markdown" },
		})

		-- configure lua server (with special settings)
		vim.lsp.config("lua_ls", {
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
