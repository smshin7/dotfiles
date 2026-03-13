-- =========================
-- Bootstrap lazy.nvim
-- =========================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =========================
-- Basic Settings
-- =========================
vim.g.mapleader = ","

vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true

-- =========================
-- Plugins
-- =========================
require("keymaps")
require("lazy").setup({

  -- Theme
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- File Explorer (NERDTree replacement)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<F2>", ":NvimTreeToggle<CR>")
    end,
  },

  -- Telescope (fzf replacement)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep)
    end,
  },

  -- Treesitter (syntax highlighting replacement)
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "ruby",
          "javascript",
          "typescript",
          "lua",
          "html",
          "css",
          "json",
        },
        auto_install = true,
        highlight = { enable = true },
      })
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Ruby LSP
      vim.lsp.enable("ruby_lsp")

      -- TypeScript / JavaScript
      vim.lsp.enable("ts_ls")
    end,
  },

  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = {
          { name = "nvim_lsp" },
        },
      })
    end,
  },

  -- Git
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Copilot
  {
    "github/copilot.vim",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- Add any specific configuration options here
    },
  },

  -- Commenting
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Surround
  {
    "kylechui/nvim-surround",
    config = true,
  },

  -- Statusline (airline replacement)
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end,
  },

  -- Rails support
  {
    "tpope/vim-rails",
  },
  {
    "thoughtbot/vim-rspec",
  },
  {
    "h3pei/rspec.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("rspec").setup({
        -- File format to allow rspec to run
        allowed_file_format = function(filename)
          return vim.endswith(filename, "_spec.rb")
        end,

        -- RSpec formatter. "progress", "p", "documentation" and "d" can be specified.
        -- If none of the above, use "progress".
        formatter = "progress",

        -- Whether or not to focus on a window when `ShowLastSpecResult` command executed.
        focus_on_last_spec_result_window = true,

        -- Whether or not to open the quickfix window when the spec fails.
        open_quickfix_when_spec_failed = true,

        -- File path to save the last spec result.
        last_result_path = vim.fn.stdpath("data") .. "/" .. "rspec_last_result",

        -- File path to save the last failed spec result.
        last_failed_result_path = vim.fn.stdpath("data") .. "/" .. "rspec_last_failed_result",

        -- Command to open the file to jump to.
        -- Examples of other alternatives: vsplit, split, tabedit
        jump_command = "edit",

        -- Directories to ignore when jumping with the RSpecJump command
        --
        -- For example, suppose you want to jump from "src/foo/bar.rb" to "spec/foo/bar_spec.rb".
        --
        -- However, rspec.nvim would by default try to find "spec/src/foo/bar_spec.rb" and return an error saying it cannot be found.
        -- In this case, you would want to treat the "src/" directory as equivalent to the "app/" in Rails or the "lib/" directory in a gem.
        --
        -- So you can specify the following for the ignored_dirs_on_jump option, which will give you the expected jumps.
        -- ```
        -- ignored_dirs_on_jump = { "src" }
        -- ```
        ignored_dirs_on_jump = {},
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>rn", ":RSpecNearest<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>rf", ":RSpecCurrentFile<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>rr", ":RSpecRerun<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>rF", ":RSpecOnlyFailures<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>rs", ":RSpecShowLastResult<CR>", { noremap = true, silent = true })
    end,
  },
})
