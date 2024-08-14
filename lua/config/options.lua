local options = {
  backspace = vim.opt.backspace + { "nostop" }, -- Don't stop backspace at insert
  clipboard = "unnamedplus",                    -- Connection to the system clipboard
  cmdheight = 0,                                -- hide command line unless needed
  tabstop = 2,                                  -- Number of space in a tab
  wrap = true,                                  -- Disable wrapping of lines longer than the width of window
  relativenumber = true,
  shiftwidth = 2,
  breakindent = true,
  autoindent = true,
  linebreak = true,
  shell = "/bin/zsh",
  title = true,
  titlestring = "%<%F%=%l/%L - Irkham's Code",
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
  foldlevel = 99
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
