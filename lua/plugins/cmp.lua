return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    -- "saadparwaiz1/cmp_luasnip",
    -- "lukas-reineke/cmp-rg",
    -- "tzachar/fuzzy.nvim",
    -- "tzachar/cmp-fuzzy-buffer",
    -- "tzachar/cmp-fuzzy-path",
    -- "roobert/tailwindcss-colorizer-cmp.nvim",
    "onsails/lspkind.nvim",
    {

      "luckasRanarison/tailwind-tools.nvim",
      name = "tailwind-tools",
      build = ":UpdateRemotePlugins",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        "neovim/nvim-lspconfig",
      },
      opts = {
        extension = {
          patterns = {
            javascript = { "clsx%(([^)]+)%)" },
            javascriptreact = { "clsx%(([^)]+)%)" },
            typescript = { "clsx%(([^)]+)%)" },
            typescriptreact = { "clsx%(([^)]+)%)" },
          },
        },
      },
    },
    -- "lukas-reineke/cmp-under-comparator",
  },
  config = function()
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        -- ["<C-Space>"] = cmp.mapping.complete(),
        ["<Esc>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-h>"] = cmp.mapping.close_docs(),
        ["<C-l>"] = cmp.mapping.open_docs(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      -- experimental = {
      --   ghost_text = {
      --     hl_group = "CmpGhostText",
      --   },
      -- },
      sorting = defaults.sorting,
      formatting = {
        format = require("lspkind").cmp_format({
          before = require("tailwind-tools.cmp").lspkind_format,
        }),
      },
    })
  end,
}
