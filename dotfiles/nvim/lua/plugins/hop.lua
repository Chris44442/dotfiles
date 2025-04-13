return {'smoka7/hop.nvim',
  config = function()
    require'hop'.setup { keys = 'uhetpgcasrkmidxbon'}
    local hop = require('hop')
    vim.keymap.set('', 'f', function()
      hop.hint_words()
    end, {remap=true})
  end,
}

