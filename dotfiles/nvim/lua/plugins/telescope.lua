return {'nvim-telescope/telescope.nvim',
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "fzf Help" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "fzf Keymaps" })
    vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "fzf Files"})
    vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "fzf Telescope Builtins" })
    vim.keymap.set("n", "<leader>st", builtin.live_grep, { desc = "fzf Grep Workspace" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "fzf Diagnostics" })
    vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "fzf Resume" })
    vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = 'fzf Recent' })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "fzf Buffers" })
    vim.keymap.set("n", "<leader>a", builtin.current_buffer_fuzzy_find, { desc = 'fzf Current Buffer' })
    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "fzf Config" })
  end,
}

