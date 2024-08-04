return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ComformInfo" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        c = { "clang-format" },
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
      init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
      end,
    })

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })

    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
  end,
  init = function()
    require("commander").add({
      {
        keys = { "n", "<leader>lf" },
        cmd = function()
          require("conform").format({ async = true, lsp_fallback = true }, function(err)
            if not err then
              local mode = vim.api.nvim_get_mode().mode
              if vim.startswith(string.lower(mode), "v") then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
              end
            end
          end)
        end,
        desc = "lsp format (conform)",
      },
    })
  end,
}
