return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "show buffer keymaps (which-key)",
    },
  },
  config = function()
    local which_key = require("which-key")

    which_key.setup()

    which_key.add({
      { "<leader>e", group = "neotree/trouble" },
      { "<leader>l", group = "lsp" },
      { "<leader>f", group = "telescope" },
      { "<leader>s", group = "flash" },
      { "<leader>b", group = "buffer" },
      { "[", group = "prev" },
      { "]", group = "next" },
      { "gs", group = "surround" },
      { "z", group = "fold" },
    })
  end,
}
