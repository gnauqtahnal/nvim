return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "frappe",
    background = {
      light = "frappe",
      dark = "frappe",
    },
    no_italic = true,
    no_bold = true,
    no_underline = true,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
  end,
}
