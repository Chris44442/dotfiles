return {'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  opts = {
    ensure_installed = {"vhdl"},
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
  config = function(_, opts)
    local purple = "#9d7cd8"
    local yellow = "#e0af68"
    local blue = "#7aa2f7"
    local red = "#f7768e"
    local white = "#c0caf5"
    -- local green = "#73daca"
    -- local light_green = "#9ece6a"
    -- vim.api.nvim_set_hl(0, '@character', { fg = light_green  })
    -- vim.api.nvim_set_hl(0, '@Attribute', { fg = colors.red })
    -- vim.api.nvim_set_hl(0, '@Attribute.builtin', { fg = colors.red })
  --   vim.api.nvim_set_hl(0, '@type', { fg = colors.blue })
  --   vim.api.nvim_set_hl(0, '@Keyword.Type', { fg = colors.blue })
  --   vim.api.nvim_set_hl(0, '@Type.builtin', { fg = colors.blue })
    vim.api.nvim_set_hl(0, '@type.builtin', { fg = blue })
    vim.api.nvim_set_hl(0, '@type', { fg = blue })
    vim.api.nvim_set_hl(0, '@type.definition', { fg = white })
    vim.api.nvim_set_hl(0, '@constant', { fg = white })
    vim.api.nvim_set_hl(0, '@label', { fg = white })
    -- vim.api.nvim_set_hl(0, '@Attribute.builtin', { fg = colors.red })
    vim.api.nvim_set_hl(0, '@property', { fg = white })
    -- vim.api.nvim_set_hl(0, '@Function', { fg = colors.yellow })
    vim.api.nvim_set_hl(0, '@module', { fg = white })
    vim.api.nvim_set_hl(0, '@Function', { fg = yellow })
    vim.api.nvim_set_hl(0, '@Function.builtin', { fg = yellow})
    vim.api.nvim_set_hl(0, '@Function.method', { fg = yellow})
    vim.api.nvim_set_hl(0, '@number.integer', { fg = red })
    vim.api.nvim_set_hl(0, '@number', { fg = red })
    vim.api.nvim_set_hl(0, '@Number.Float', { fg = red })
  --   vim.api.nvim_set_hl(0, '@Operator', { fg = colors.white })
    vim.api.nvim_set_hl(0, '@Keyword.Operator', { fg = purple })
    -- vim.api.nvim_set_hl(0, '@Keyword.Conditional', { fg = colors.purple })
    vim.api.nvim_set_hl(0, '@Keyword.Conditional', { fg = purple })
    vim.api.nvim_set_hl(0, '@Keyword.repeat', { fg = purple })
    vim.api.nvim_set_hl(0, '@keyword.import', { fg = purple })
    vim.api.nvim_set_hl(0, '@module.builtin', { fg = purple })
    vim.api.nvim_set_hl(0, '@constant.builtin', { fg = purple })
    vim.api.nvim_set_hl(0, '@constructor', { fg = purple })
    -- vim.api.nvim_set_hl(0, '@character.special', { fg = light_green  })
  --   vim.api.nvim_set_hl(0, '@Keyword.Repeat', { fg = colors.purple })
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter.configs").setup(opts)
  end,
}

