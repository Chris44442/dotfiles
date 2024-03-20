lvim.builtin.indentlines.active=false
lvim.builtin.bufferline.active=false
lvim.plugins = {
  {"smoka7/hop.nvim"},
  {"folke/todo-comments.nvim", opts={}},
  {"ThePrimeagen/harpoon"},
}

vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<PageUp>', '<Nop>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<PageDown>', '<Nop>', { noremap = true, silent = true})

-- disable the automatically installed snippets, the user snippets are in ./luasnippets/
lvim.builtin.luasnip.sources.friendly_snippets = false

-- autocomplete show first suggested item as ghost text
lvim.builtin.cmp.experimental.ghost_text = true

-- autocomplete confirm next item instantly with hotkey
local cmp = require("lvim.utils.modules").require_on_index "cmp"
local cmp_mapping = require("cmp.config.mapping")
lvim.builtin.cmp.mapping["<Tab>"] = cmp_mapping(function()
  cmp.select_next_item()
  cmp.confirm()
end)

-- Render Whitespaces
vim.cmd[[set list]]
vim.cmd[[set listchars=space:·]]

-- Relative line numbers
vim.cmd('set relativenumber')

-- Make editing modes more visible
lvim.builtin.lualine.sections.lualine_a = {"mode"}

-- Yank and paste from/to clipboard. You need to apt install xclip
vim.opt.clipboard = 'unnamedplus'

-- Open Lazygit with leader+g
lvim.builtin.which_key.mappings.g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" }
lvim.builtin.which_key.mappings.s.g = { "<cmd>Telescope git_commits<cr>", "Fzf Checkout Commit" }
        -- o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        -- b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        -- c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        -- C = {
        --   "<cmd>Telescope git_bcommits<cr>",
        --   "Checkout commit(for current file)",
        -- },

-- Harpoon
lvim.builtin.which_key.mappings.h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoon Menu" }
lvim.builtin.which_key.mappings.t = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add to Harpoon" }
require'harpoon'.setup {tabline = true}
vim.api.nvim_set_keymap('', '<C-h>', ":lua require('harpoon.ui').nav_file(1)<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('', '<C-t>', ":lua require('harpoon.ui').nav_file(2)<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('', '<C-n>', ":lua require('harpoon.ui').nav_file(3)<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('', '<C-s>', ":lua require('harpoon.ui').nav_file(4)<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('', '<C-m>', ":lua require('harpoon.ui').nav_file(5)<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('', '<C-w>', ":lua require('harpoon.ui').nav_file(6)<CR>", {noremap=true, silent=true})
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

-- VHDL comment
local ft = require('Comment.ft')
ft.set('vhdl', '-- %s')

-- Detach lsp client of current buffer from its language server
vim.api.nvim_set_keymap('n', '<F5>', ':lua DETACHFROMLS()<CR>', { noremap = true, silent = true })
function DETACHFROMLS()
  vim.lsp.buf_detach_client(0, vim.lsp.get_active_clients({bufnr=0})[1].id)
end

-- Autostart VHDL language server
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"},{
  pattern = {"*.vhdl", "*.vhd" },
  callback = function ()
    STARTVHDLLS()
  end
 })
function STARTVHDLLS()
  vim.lsp.start({
    name = 'vhdl_ls',
    cmd = {'vhdl_ls'},
    root_dir = vim.fs.dirname(vim.fs.find({'vhdl_ls.toml'}, { upward = true })[1]),
  })
end

        -- o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        -- b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        -- c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        -- C = {
        --   "<cmd>Telescope git_bcommits<cr>",
        --   "Checkout commit(for current file)",
        -- },
