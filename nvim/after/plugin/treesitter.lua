require'nvim-treesitter.configs'.setup {
--  ensure_installed = { "rust", "cpp", "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query" },
 ensure_installed = { "rust", "toml", "c", "lua", "vim", "vimdoc", "query", "verilog" },
 sync_install = false,
 auto_install = true,
 highlight = {
   enable = false,
   additional_vim_regex_highlighting = false,
 },
}
