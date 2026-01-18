return {
	{
		-- "bluz71/vim-nightfly-guicolors",
		"rose-pine/neovim",
		priority = 1000, -- make sure to load this before all the other start plugins
		variant = "dawn",
		config = function()
			-- load the colorscheme here
      -- Set a custom color for Visual mode selection after the colorscheme is loaded
      vim.cmd [[
        augroup CustomVisualHighlight
          autocmd!
          autocmd ColorScheme * highlight Visual guibg=#6e6a86 guifg=NONE
        augroup END
      ]]
      vim.cmd([[colorscheme rose-pine-moon]])
		end,
	},
}
