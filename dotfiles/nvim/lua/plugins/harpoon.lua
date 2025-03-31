return {'ThePrimeagen/harpoon',
  config = function()
    vim.api.nvim_set_keymap('', '<leader>h', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {noremap=true, silent=true})
    vim.api.nvim_set_keymap('', '<leader>t', "<cmd>lua require('harpoon.mark').add_file()<CR>", {noremap=true, silent=true})
    require'harpoon'.setup {tabline = true}
    vim.api.nvim_set_keymap('', '<Tab>', ":lua require('harpoon.ui').nav_next()<CR>", {noremap=true, silent=true})
    vim.api.nvim_set_keymap('', '<S-Tab>', ":lua require('harpoon.ui').nav_prev()<CR>", {noremap=true, silent=true})
    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {command = "highlight! HarpoonInactive guibg=#NONE guifg=#999999" })
    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {command = "highlight! HarpoonNumberInactive guibg=#NONE guifg=#999999" })
    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {command = "highlight! HarpoonActive guibg=#414868" })
    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {command = "highlight! HarpoonNumberActive guibg=#414868" })
  end,
}

