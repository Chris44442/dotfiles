local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require 'lazy'.setup({
  require 'plugins/tokyonight',
  require 'plugins/telescope',
  require 'plugins/which-key',
  require 'plugins/treesitter',
  require 'plugins/harpoon',
  require 'plugins/lazygit',
  require 'plugins/gitsigns',
  require 'plugins/lspconfig',
  require 'plugins/cmp',
  --require 'plugins/flash',
  require 'plugins/hop',
  require 'plugins/colorizer',
  require 'plugins/mini',
})
