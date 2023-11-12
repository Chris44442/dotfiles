-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Render Whitespaces
vim.cmd[[set list]]
vim.cmd[[set listchars=space:⋅]]

-- Deactivate indentlines
lvim.builtin.indentlines.active = false

-- Annoying workaround to add vhdl commentstring, press C-F5 twice with a few seconds inbetween
lvim.builtin.treesitter.context_commentstring.config.vhdl = "-- %s"
vim.api.nvim_set_keymap('n', '<C-F5>', ':e /home/chris/.config/lvim/config.lua<CR>:bd<CR>', { noremap = true, silent = true })

-- Make editing modes more visible
lvim.builtin.lualine.sections.lualine_a = {"mode"}

-- Yank and paste from/to clipboard. You need to apt install xclip
vim.opt.clipboard = 'unnamedplus'

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


