return {
  "akinsho/bufferline.nvim",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>bb", "<cmd>BufferLineTogglePin<cr>", desc = "toggle pin" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "delete other buffers" },
    { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "delete buffers to the right" },
    { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "delete buffers to the left" },
    { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "prev buffer" },
    { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "next buffer" },
    { "<leader>bP", "<cmd>BufferLineMovePrev<cr>", desc = "move buffer prev" },
    { "<leader>bN", "<cmd>BufferLineMoveNext<cr>", desc = "move buffer next" },
  },
  opts = {
    options = {
      themable = true,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
      diagnostics = "nvim_lsp",
      -- separator_style = { "", "" },
      separator_style = { "", "" },
      -- separator_style = "thin",
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
    },
  },
}
