return {
  "FeiyouG/commander.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    { "<leader>pp", "<cmd>Telescope commander<cr>", mode = "n", desc = "Open commander" },
  },
  opts = {
    integration = {
      telescope = {
        enable = true,
        set_plugin_name_as_cat = true,
      },
      lazy = {
        enable = true,
      },
    },
  },
}
