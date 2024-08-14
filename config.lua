-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

reload("config.options")

-- start general pojok code
vim.opt.shortmess:append("c")                         -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append("-")                         -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })       -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use
vim.opt.title = true
vim.opt.titlestring = "%<%F%=%l/%L - Irkham's Code"
-- end general pojok code
vim.g.codeium_enabled = true
-- keymaps
-- add by pojok code

lvim.keys.visual_mode["J"] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_mode["K"] = ":move '<-2<CR>gv-gv"
lvim.keys.visual_mode["<A-j>"] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_mode["<A-Down>"] = ":move '>+1<CR>gv-gv"
lvim.keys.visual_mode["<A-k>"] = ":move '<-2<CR>gv-gv"
lvim.keys.visual_mode["<A-Up>"] = ":move '<-2<CR>gv-gv"
lvim.keys.visual_mode["<S-Down>"] = ":'<,'>t'><cr>"

lvim.keys.insert_mode["<S-Down>"] = "<cmd>t.<cr>"
lvim.keys.insert_mode["<S-Up>"] = "<cmd>t -1<cr>"
lvim.keys.insert_mode["<M-Down>"] = "<cmd>m+<cr>"
lvim.keys.insert_mode["<M-Up>"] = "<cmd>m-2<cr>"
lvim.keys.insert_mode["<C-s>"] = "<cmd>w<cr>"
lvim.keys.insert_mode["<C-l>"] = "<cmd>LiveServer start<cr>"
lvim.keys.normal_mode["<S-Down>"] = "<cmd>t.<cr>"
lvim.keys.normal_mode["<S-Up>"] = "<cmd>t -1<cr>"
lvim.keys.normal_mode["<M-J>"] = "<cmd>t.<cr>"
lvim.keys.normal_mode["<M-K>"] = "<cmd>t -1<cr>"
lvim.keys.normal_mode["<M-Down>"] = "<cmd>m+<cr>"
lvim.keys.normal_mode["<M-Up>"] = "<cmd>m-2<cr>"
lvim.keys.normal_mode["<M-j>"] = "<cmd>m+<cr>"
lvim.keys.normal_mode["<M-k>"] = "<cmd>m-2<cr>"
lvim.keys.normal_mode["<C-s>"] = "<cmd>w<cr>"
lvim.keys.normal_mode["q"] = "<cmd>q<cr>"
-- end pojok cod
-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
-- lvim.format_on_save = {

--   pattern = { "*.php", "*.js", "*.ts", "*.css", "*.scss", "*.html", "*.json" }
-- }
lvim.format_on_save.timeout = 5000
lvim.colorscheme = "default"
lvim.transparent_window = false
lvim.lsp.null_ls.setup.timeout_ms = 5000

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("i", "JK", "<ESC>")
-- lvim.builtin.lualine.style = "default" -- or "none"
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { "branch" }
lvim.builtin.lualine.sections.lualine_c = { "diff", "filename" }
lvim.builtin.nvimtree.setup.view.relativenumber = true
lvim.builtin.nvimtree.setup.view.number = true
lvim.builtin.nvimtree.setup.filters.custom = {}
lvim.builtin.nvimtree.setup.view.adaptive_size = false
lvim.builtin.project.manual_mode = true
lvim.builtin.nvimtree.active = true
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"
lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=10 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=10 direction=horizontal<cr>", "Split horizontal" },
}
lvim.builtin.breadcrumbs.active = false

-- added by irkham
lvim.plugins = {
  { "ellisonleao/gruvbox.nvim" },
  { "mg979/vim-visual-multi" },
  {
    "CRAG666/code_runner.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("config.coderunner")
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("config.colorizer")
    end,
  },
  {
    "andrewferrier/wrapping.nvim",
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      vim.keymap.set("i", "<C-a>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
    end,
  },
  { "rebelot/kanagawa.nvim" },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      -- see below for full list of optional dependencies 👇
    },
  },
  {
    "epwalsh/pomo.nvim",
    version = "*", -- Recommended, use latest release instead of latest commit
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat" },
    dependencies = {
      -- Optional, but highly recommended if you want to use the "Default" timer
      "rcarriga/nvim-notify",
    },
    opts = {
      -- See below for full list of options 👇
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      })
    end,
  },
  {
    "sainnhe/everforest",
  },
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  {
    "nanozuki/tabby.nvim",
    -- event = 'VimEnter', -- if you want lazy load, see below
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      -- configs...
    end,
  },
  { "StanAngeloff/php.vim" },
  { "phpactor/phpactor",           branch = "master", ft = "php", build = "composer install --no-dev -o" },
  { "vim-php/tagbar-phpctags.vim" },
  { "rafamadriz/friendly-snippets" },
  { "lunarvim/horizon.nvim" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
}
require("luasnip/loaders/from_vscode").load({
  paths = { "~/.local/share/lunarvim/site/pack/packer/start/friendly-snippets" },
})
require("luasnip.loaders.from_lua").load({ paths = "~/.config/lvim/snippets" })
-- alpha-config.lua
lvim.builtin.alpha.dashboard.section.header.val = {
  [[   ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣴⣶⣶⣶⣶⣶⠶⣶⣤⣤⣀⠀⠀⠀⠀⠀⠀ ]],
  [[ ⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⠁⠀⢀⠈⢿⢀⣀⠀⠹⣿⣿⣿⣦⣄⠀⠀⠀ ]],
  [[ ⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⠿⠀⠀⣟⡇⢘⣾⣽⠀⠀⡏⠉⠙⢛⣿⣷⡖⠀ ]],
  [[ ⠀⠀⠀⠀⠀⣾⣿⣿⡿⠿⠷⠶⠤⠙⠒⠀⠒⢻⣿⣿⡷⠋⠀⠴⠞⠋⠁⢙⣿⣄ ]],
  [[ ⠀⠀⠀⠀⢸⣿⣿⣯⣤⣤⣤⣤⣤⡄⠀⠀⠀⠀⠉⢹⡄⠀⠀⠀⠛⠛⠋⠉⠹⡇ ]],
  [[ ⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⣀⣠⣤⣤⣤⣤⣤⣤⣤⣼⣇⣀⣀⣀⣛⣛⣒⣲⢾⡷ ]],
  [[ ⢀⠤⠒⠒⢼⣿⣿⠶⠞⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⣼⠃ ]],
  [[ ⢮⠀⠀⠀⠀⣿⣿⣆⠀⠀⠻⣿⡿⠛⠉⠉⠁⠀⠉⠉⠛⠿⣿⣿⠟⠁⠀⣼⠃⠀ ]],
  [[ ⠈⠓⠶⣶⣾⣿⣿⣿⣧⡀⠀⠈⠒⢤⣀⣀⡀⠀⠀⣀⣀⡠⠚⠁⠀⢀⡼⠃⠀⠀ ]],
  [[ ⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣷⣤⣤⣤⣤⣭⣭⣭⣭⣭⣥⣤⣤⣤⣴⣟⠁    ]],
  [[                                ]],
}

local function footer()
  return "Irkham's Code"
end

lvim.builtin.alpha.dashboard.section.footer.val = footer()
-- override cmp
local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local luasnip = require("luasnip")
local cmp = require("cmp")
lvim.builtin.cmp.mapping = {
  ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
  ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
  ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
  ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  ["<C-y>"] = cmp.config.disable,
  ["<C-e>"] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  ["<CR>"] = cmp.mapping.confirm({ select = true }),
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expandable() then
      luasnip.expand()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif check_backspace() then
      fallback()
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),

  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
}
-- end override cmp

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "stylua", filetype = { "lua" } },
  {
    command = "prettier",
    extra_args = { "--plugin=@prettier/plugin-php" },
    filetypes = { "php" },
  },
  { name = "phpcbf",    filetypes = { "php" } },
})

-- lsp installer
lvim.lsp.installer.setup.ensure_installed = {
  "jsonls",
  "lua_ls",
  "html",
  "cssls",
  "emmet_ls",
  "tailwindcss",
  "intelephense",
}
lvim.builtin.treesitter.ensure_installed = {
  "php",
}

require("lvim.lsp.manager").setup("tailwindcss")
require("lvim.lsp.manager").setup("emmet_ls")
require("lvim.lsp.manager").setup("eslint")
require("lvim.lsp.manager").setup("lua_ls")
require("lvim.lsp.manager").setup("intelephense")
require("lvim.lsp.manager").setup("phpactor")

local colors = {
  color2 = "#0f1419",
  color3 = "#ffee99",
  color4 = "#e6e1cf",
  color5 = "#14191f",
  color13 = "#b8cc52",
  color10 = "#36a3d9",
  color8 = "#f07178",
  color9 = "#3e4b59",
}

lvim.builtin.lualine.options.theme = {
  normal = {
    c = { fg = colors.color8, bg = colors.color2 },
    a = { fg = colors.color5, bg = colors.color13, gui = "bold" },
    b = { fg = colors.color4, bg = colors.color5 },
  },
  insert = {
    a = { fg = colors.color2, bg = colors.color13, gui = "bold" },
    b = { fg = colors.color4, bg = colors.color5 },
  },
  visual = {
    a = { fg = colors.color2, bg = colors.color3, gui = "bold" },
    b = { fg = colors.color4, bg = colors.color5 },
  },
  replace = {
    a = { fg = colors.color2, bg = colors.color8, gui = "bold" },
    b = { fg = colors.color4, bg = colors.color5 },
  },
  inactive = {
    c = { fg = colors.color4, bg = colors.color2 },
    a = { fg = colors.color4, bg = colors.color5, gui = "bold" },
    b = { fg = colors.color4, bg = colors.color5 },
  },
}

lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "intelephense"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- lvim.builtin.which_key.mappings["P"] = {
--   name = "PHP",
--   i = { "<cmd>PhpactorImportClass<cr>", "Import Class" },
--   e = { "<cmd>PhpactorClassExpand<cr>", "Expand Class" },
--   u = { "<cmd>PhpactorImportMissingClasses<cr>", "Import Missing Classes" },
--   r = { "<cmd>PhpactorReloadFile<cr>", "Reload File" },
--   t = { "<cmd>PhpactorTransform<cr>", "Transform" },
-- }

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "phpcs", filetypes = { "php" } },
-- }

local null_ls = require("null-ls")

-- local sources = {
-- 	null_ls.builtins.formatting.prettier,
-- 	null_ls.builtins.formatting.eslint_d,
-- 	null_ls.builtins.formatting.stylua,
-- 	null_ls.builtins.diagnostics.eslint_d,
-- 	null_ls.builtins.code_actions.eslint_d,

-- }

-- null_ls.register({ sources = sources })

-- enable html snippet in php files
require("luasnip").filetype_extend("php", { "html" })
