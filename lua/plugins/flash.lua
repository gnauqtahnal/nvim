return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>ss",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "goto string (flash)",
    },
    {
      "<leader>sS",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "select with treesitter (flash)",
    },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    {
      "<leader>sR",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "select with treesitter visual mode (flash)",
    },
    {
      "<leader>st",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "toggle flash search (flash)",
    },
  },
}
