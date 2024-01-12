-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.plugins = {
  {"smoka7/hop.nvim"},
  {"folke/todo-comments.nvim", opts={}},
  {"ThePrimeagen/harpoon"},
}

vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true})

-- Render Whitespaces
vim.cmd[[set list]]
vim.cmd[[set listchars=space:·]]

-- Deactivate indentlines
lvim.builtin.indentlines.active = false

-- Annoying workaround to add vhdl commentstring, press C-F5 twice with a few seconds inbetween
lvim.builtin.treesitter.context_commentstring.config.vhdl = "-- %s"
vim.api.nvim_set_keymap('n', '<C-F5>', ':e /home/chris/.config/lvim/config.lua<CR>:bd<CR>', { noremap = true, silent = true })

-- Make editing modes more visible
lvim.builtin.lualine.sections.lualine_a = {"mode"}

-- Yank and paste from/to clipboard. You need to apt install xclip
vim.opt.clipboard = 'unnamedplus'

-- Open Lazygit with leader+g
lvim.builtin.which_key.mappings.g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" }

-- harpoon
lvim.builtin.which_key.mappings.h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoon Menu" }
lvim.builtin.which_key.mappings.t = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add to Harpoon" }
require'harpoon'.setup {tabline = true}
vim.api.nvim_set_keymap('n', '<C-h>', ":lua require('harpoon.ui').nav_file(1)<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-t>', ":lua require('harpoon.ui').nav_file(2)<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-n>', ":lua require('harpoon.ui').nav_file(3)<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-s>', ":lua require('harpoon.ui').nav_file(4)<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-m>', ":lua require('harpoon.ui').nav_file(5)<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-w>', ":lua require('harpoon.ui').nav_file(6)<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-v>', ":lua require('harpoon.ui').nav_file(7)<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-z>', ":lua require('harpoon.ui').nav_file(8)<CR>", {noremap=true, silent=true})
lvim.builtin.bufferline.active=false
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {command = "highlight! HarpoonInactive guibg=#NONE guifg=#999999" })
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {command = "highlight! HarpoonNumberInactive guibg=#NONE guifg=#999999" })

-- Hop EasyMotion-like-plugin
require'hop'.setup { keys = 'uhetpgcasrkmidxbon'}
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})

-- Relative line numbers
vim.cmd('set relativenumber')

-- VHDL language server
function STARTVHDLLS()
  vim.lsp.start({
    name = 'vhdl_ls',
    cmd = {'vhdl_ls'},
  })
end
vim.api.nvim_set_keymap('n', '<F5>', ':lua STARTVHDLLS()<CR>', { noremap = true, silent = true })

-- :lua require("harpoon.ui").nav_file(3)                  -- navigates to file 3


-- VHDL treesitter stuff. Not working right now :(

--- local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

-- parser_config.vhdl = {
--   install_info = {
--     url = "https://github.com/jpt13653903/tree-sitter-vhdl.git",
--     files = { 'src/parser.c' },
--     branch = 'main',
--     generate_requires_npm = false, -- if stand-alone parser without npm dependencies
--     requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
--   },
--   filetype = 'vhdl', -- if filetype does not match the parser name
-- }

-- local treesitter = require('nvim-treesitter.configs')

-- treesitter.setup {
--   ensure_installed = {
--     'vhdl',
--   },
--   context_commentstring = {
--     enable = true,
--     config = {
--       vhdl = "-- %s",
--       -- other language configurations if needed
--     }
--   },
--   sync_install = false,
--   auto_install = true,

--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting = false,
--   },
-- }


