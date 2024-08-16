return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    },
  },
  keys = {
    {
      "<leader>ff",
      "<cmd>Telescope find_files theme=dropdown<cr>",
      mode = "n",
      desc = "find files (telescope)",
    },
    {
      "<leader>fw",
      "<cmd>Telescope grep_string theme=dropdown<cr>",
      mode = "n",
      desc = "grep string (telescope)",
    },
    {
      "<leader>fg",
      "<cmd>Telescope live_grep theme=dropdown<cr>",
      mode = "n",
      desc = "live grep (telescope)",
    },
    {
      "<leader>fb",
      "<cmd>Telescope find_buffers theme=dropdown<cr>",
      mode = "n",
      desc = "find buffers (telescope)",
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
}
