return {
  "nvim-telescope/telescope.nvim",
  lazy = "VeryLazy",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("fzf")
  end,
  init = function()
    require("commander").add({
      {
        keys = { "n", "<leader>ff" },
        cmd = "<cmd>Telescope find_files theme=dropdown<cr>",
        desc = "find files (telescope)",
      },
      {
        keys = { "n", "<leader>fw" },
        cmd = "<cmd>Telescope grep_string theme=dropdown<cr>",
        desc = "grep string (telescope)",
      },
      {
        keys = { "n", "<leader>fg" },
        cmd = "<cmd>Telescope live_grep theme=dropdown<cr>",
        desc = "live grep (telescope)",
      },
      {
        keys = { "n", "<leader>fb" },
        cmd = "<cmd>Telescope find_buffers theme=dropdown<cr>",
        desc = "find buffers (telescope)",
      },
    })
  end,
}
