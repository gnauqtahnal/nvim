vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:1"
vim.opt.mouse = "a"
vim.opt.conceallevel = 2
vim.opt.scrolloff = 9999
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = false
vim.opt.updatetime = 100
vim.opt.splitkeep = "cursor"
vim.opt.wrap = false

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

require("configs")
