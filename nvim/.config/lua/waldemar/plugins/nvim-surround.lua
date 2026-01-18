-- https://github.com/kylechui/nvim-surround
-- Surround selections, add quotes, etc.
return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  opts = {
    keymaps = {
      visual_line = false,
      visual = 'Z',
    },
  },
}
