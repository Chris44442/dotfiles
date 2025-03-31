return {'folke/flash.nvim',
  event = "VeryLazy",
  opts = {
    labels = "aoeuhtnsmkwjgpcr",
    search = { mode = "fuzzy", },
    modes = { char = { enabled = false, }, },
    label = { uppercase = false, },
  },
  keys = { { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" }, },
}

