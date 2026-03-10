return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
    keymap.set(
      "n",
      "<leader>xx",
      "<cmd>TroubleToggle<cr>",
      { silent = true, noremap = true, desc = "Trouble: toggle diagnostics window" }
    )
    keymap.set(
      "n",
      "<leader>xw",
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      { silent = true, noremap = true, desc = "Trouble: workspace mode" }
    )
    keymap.set(
      "n",
      "<leader>xd",
      "<cmd>TroubleToggle document_diagnostics<cr>",
      { silent = true, noremap = true, desc = "Trouble: document mode" }
    )

    -- Different from <leader>x? scheme, instead similar to LSP's gr (go to refs)
    keymap.set(
      "n",
      "gR",
      "<cmd>TroubleToggle lsp_references<cr>",
      { silent = true, noremap = true, desc = "Trouble: LSP references" }
    )
	end,
}


