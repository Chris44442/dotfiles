function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.api.nvim_set_hl(0, "Normal", { bg = "#222222", fg = "#e0e0e0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#222222", fg = "#e0e0e0" })
end

ColorMyPencils()
