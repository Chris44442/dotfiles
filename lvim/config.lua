-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- Define the custom highlight group
-- vim.cmd("highlight MyVhdlHighlightGroup guifg=#FF0000")  -- Set the foreground color to red
  -- require"nvim-treesitter.highlight".set_custom_captures {
    -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
    -- ["foo.bar"] = "Identifier",
  -- }
-- Render Whitespaces
vim.cmd[[set list]]
vim.cmd[[set listchars=space:⋅]]

vim.cmd('set number')
vim.cmd('set relativenumber')

-- vhdl language server
function startvhdlls()
  vim.lsp.start({
    name = 'vhdl_ls',
    cmd = {'vhdl_ls'},
  })
end
vim.api.nvim_set_keymap('n', '<F5>', ':lua startvhdlls()<CR>', { noremap = true, silent = true })


-- Enable clipboard support
-- lvim.builtin.terminal.copy_sync = true

-- Map yank to copy to clipboard in normal and visual modes
-- vim.api.nvim_set_keymap('n', 'y', '\"+y', { noremap = true })
-- vim.api.nvim_set_keymap('v', 'y', '\"+y', { noremap = true })
-- vim.keymap.set("n", "<leader>y", "\"+y")
-- vim.keymap.set("v", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")


-- vim.cmd('hi TSKeywordFunction guifg=#edc898')
-- vim.cmd('hi TSKeyword guifg=#edc898')
-- vim.cmd('hi Function guifg=#edc898')
-- vim.cmd('hi TSVariable guifg=#edc898')



-- local lsp_started = false
-- function toggleVHDLLanguageServer()
--   if lsp_started then
--     vim.lsp.stop_client(vim.lsp.get_active_clients())
--     lsp_started = false
--   else
--     vim.lsp.start({
--       name = 'vhdl_ls',
--       cmd = {'vhdl_ls'},
--     })
--     lsp_started = true
--   end
-- end
-- vim.api.nvim_set_keymap('n', '<F5>', ':lua toggleVHDLLanguageServer()<CR>', { noremap = true, silent = true })

