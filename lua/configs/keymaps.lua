local keymap = function(mode, lhs, rhs, opts)
  local ok, commander = pcall(require, "commander")
  if ok then
    commander.add({ keys = { mode, lhs }, cmd = rhs, desc = opts.desc })
  else
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr><esc>")

keymap("n", "<C-<>", "<C-w><")
keymap("n", "<C->>", "<C-w>>")
keymap("n", "<C-+>", "<C-w>+")
keymap("n", "<C-_>", "<C-w>-")
