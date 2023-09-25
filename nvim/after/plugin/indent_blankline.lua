vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#222222 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1d1d1d gui=nocombine]]

require("indent_blankline").setup {
  char = "",
  char_highlight_list = {
        "IndentBlanklineIndent1",
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
        "IndentBlanklineIndent2",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent1",
        "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent2",
  },
  show_trailing_blankline_indent = false,
}
