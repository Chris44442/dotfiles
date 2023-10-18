local highlight = {
    "GreyOne",
    "GreyTwo",
}
local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "GreyOne", { bg = "#222222" })
    vim.api.nvim_set_hl(0, "GreyTwo", { bg = "#1d1d1d" })
end)

require("ibl").setup {
    indent = { highlight = highlight, char = "" },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
}
