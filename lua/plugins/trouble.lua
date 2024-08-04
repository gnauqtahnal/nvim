return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  config = function()
    require("trouble").setup()
  end,
  init = function()
    require("commander").add({
      {
        keys = { "n", "<ldeader>es" },
        cmd = "<cmd>Trouble symbols toggle pinned=true win.relative=win win.position=right<cr>",
        desc = "toggle document symbols (trouble)",
      },
      {
        keys = { "n", "<leader>ed" },
        cmd = "<cmd>Trouble lsp toggle focus=false win.relative=win win.position=right<cr>",
        desc = "toggle lsp definitions/references (trouble)",
      },
      {
        keys = { "n", "<leader>ed" },
        cmd = "<cmd>Trouble diagnostics toggle<cr>",
        desc = "toggle diagnostics (trouble)",
      },
      {
        keys = { "n", "<leader>eD" },
        cmd = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "toggle buffer diagnostics (trouble)",
      },
      {
        keys = { "n", "<leader>el" },
        cmd = "<cmd>Trouble loclist toggle<cr>",
        desc = "location list (trouble)",
      },
      {
        keys = { "n", "<leader>eq" },
        cmd = "<cmd>Trouble qflist toggle<cr>",
        desc = "quickfix list (trouble)",
      },
    })
  end,
}
