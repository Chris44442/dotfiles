-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Render Whitespaces
vim.cmd[[set list]]
vim.cmd[[set listchars=space:⋅]]

-- Deactivate indentlines
lvim.builtin.indentlines.active = false

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

