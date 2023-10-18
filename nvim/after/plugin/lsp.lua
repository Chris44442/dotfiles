
-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup()


local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = 'E'})
sign({name = 'DiagnosticSignWarn', text = 'W'})
sign({name = 'DiagnosticSignHint', text = 'H'})
sign({name = 'DiagnosticSignInfo', text = 'I'})

vim.diagnostic.config({
    virtual_text = { prefix = '', spacing = 3 },
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])








vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
 --   ['<C-p>'] = cmp.mapping.select_prev_item(),
 --   ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
--     ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--     ['<Tab>'] = cmp.mapping.select_next_item(),
--     ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-e>'] = cmp.mapping.close(),
--     ['<CR>'] = cmp.mapping.confirm({
--       behavior = cmp.ConfirmBehavior.Insert,
--       select = true,
--     })
  },
  -- Installed sources:
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip
    { name = 'calc'},                               -- source for math calculation
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})


--local lsp = require("lsp-zero")
--
--lsp.preset("recommended")
--
--lsp.ensure_installed({
--	'lua_ls',
--	'rust_analyzer',
--})
--
--lsp.configure('lua_ls', {
--  cmd = { 'lua-language-server' },
--  settings = {
--    Lua = {
--      runtime = {
--        version = 'LuaJIT',
--        path = vim.split(package.path, ';'),
--      },
--      diagnostics = {
--        globals = { 'vim' },
--      },
--      workspace = {
--        library = {
--          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--        },
--      },
--    },
--  },
--})
--
--local cmp = require('cmp')
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp.defaults.cmp_mappings({
--	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--	['<C-y>'] = cmp.mapping.confirm({ select = true }),
--	["<C-Space>"] = cmp.mapping.complete(),
--})
--
--lsp.set_preferences({
--	sign_icons = { }
--})
--
--lsp.setup_nvim_cmp({
--	mapping = cmp_mappings
--})
--
--
--lsp.on_attach(function(client, bufnr)
--	local opts = {buffer = bufnr, remap = false}
--
--        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--        vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--end)
--
--lsp.setup()
