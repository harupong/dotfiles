-- https://www.lazyvim.org/plugins/colorscheme#catppuccin
return {
  {
    "catppuccin/nvim",
    priority = 1000,
    lazy = true,
  },
  -- Configure LazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
