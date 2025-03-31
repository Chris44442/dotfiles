return {'kdheepak/lazygit.nvim', -- if lazygit not found on path, putting it in .cargo/bin/ did work for some reason
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = { "nvim-lua/plenary.nvim", },
  keys = {{ "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" }}
}
