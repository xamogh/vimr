local k = vim.api.nvim_set_keymap
local o = {noremap = true, silent=true}

k("", "<Space>", "<Nop>", o)
k("i", "jj", "<ESC>", o)
k("n", "<D-e>", ":NvimTreeToggle<CR>", {silent = true})

k("n", "<C-h>", "<C-w>h", o)
k("n", "<C-j>", "<C-w>j", o)
k("n", "<C-k>", "<C-w>k", o)
k("n", "<C-l>", "<C-w>l", o)


k("n", "<Up>", ":resize -2<CR>", o)
k("n", "<Down>", ":resize +2<CR>", o)
k("n", "<Left>", ":vertical resize -2<CR>", o)
k("n", "<Right>", ":vertical resize +2<CR>", o)

k("n", "<S-l>", ":bnext<CR>", o)
k("n", "<S-h>", ":bprevious<CR>", o)

k("v", "<", "<gv", o)
k("v", ">", ">gv", o)

vim.cmd[[
  inoremap " ""<left>
  inoremap ' ''<left>
  inoremap ` ``<left>
  inoremap ( ()<left>
  inoremap [ []<left>
  inoremap { {}<left>
  inoremap {<CR> {<CR>}<ESC>O
  inoremap {;<CR> {<CR>};<ESC>O
]]

vim.cmd [[packadd packer.nvim]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd[[
  colorscheme solarized
  set background=light
]]

vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.guifont = "MesloLGS NF:h22"
vim.opt.smartindent = true
vim.opt.showmode = false



-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'altercation/vim-colors-solarized'
  use 'tpope/vim-surround'
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

  -- Post-install/update hook with neovim command
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)



