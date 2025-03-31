vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"

vim.diagnostic.config({ virtual_text = true })

-- Render Whitespaces
vim.cmd([[set list]])
vim.cmd([[set listchars=space:·]])

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

-- Prevent the annoying auto comments
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic List" })

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<PageUp>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<PageDown>", "<Nop>", { noremap = true, silent = true })

-- try these for a bit, not optimal but w/e
vim.api.nvim_set_keymap("n", "k", "q", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "q", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "j", ":w<CR>", { noremap = true, silent = true })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  {"smoka7/hop.nvim",
    config = function()
      require'hop'.setup { keys = 'uhetpgcasrkmidxbon'}
      local hop = require('hop')
      vim.keymap.set('', 'f', function()
        hop.hint_words()
      end, {remap=true})
    end,
  },

  {"ThePrimeagen/harpoon",
    config = function()
      vim.api.nvim_set_keymap('', '<leader>h', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {noremap=true, silent=true})
      vim.api.nvim_set_keymap('', '<leader>t', "<cmd>lua require('harpoon.mark').add_file()<CR>", {noremap=true, silent=true})
      require'harpoon'.setup {tabline = true}
      vim.api.nvim_set_keymap('', '<Tab>', ":lua require('harpoon.ui').nav_next()<CR>", {noremap=true, silent=true})
      vim.api.nvim_set_keymap('', '<S-Tab>', ":lua require('harpoon.ui').nav_prev()<CR>", {noremap=true, silent=true})
      vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {command = "highlight! HarpoonInactive guibg=#NONE guifg=#999999" })
      vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {command = "highlight! HarpoonNumberInactive guibg=#NONE guifg=#999999" })
      vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {command = "highlight! HarpoonActive guibg=#414868" })
      vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {command = "highlight! HarpoonNumberActive guibg=#414868" })
    end,
  },

  {"kdheepak/lazygit.nvim",
  -- lazygit was not found on path, had to put it in .cargo/bin/ as a workaround
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = { "nvim-lua/plenary.nvim", },
  keys = {{ "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" }}
  },

  {"lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  {
'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  },

  {"nvim-telescope/telescope.nvim",
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
  },

  {"neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },

      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end
          map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
          map("gr", require("telescope.builtin").lsp_references, "Goto References")
          map("<leader>r", vim.lsp.buf.rename, "Rename")
          map("K", vim.lsp.buf.hover, "Hover Documentation")

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup =
              vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
              end,
            })
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
      local servers = {
        rust_analyzer = {},
        rust_hdl = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
              diagnostics = {
                globals = {'vim'},
              }
            },
          },
        },
      }

      require("mason").setup()
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua",
      })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },

  {"hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      luasnip.config.setup({})
      local s = luasnip.snippet
      local t = luasnip.text_node
      local i = luasnip.insert_node
      luasnip.add_snippets("vhdl", {
        s("if", { t({"if reset then","  "}), i(0), t({"","end if;"}) }),
        s("others", { t("(others => '0')") }),
        s("for", { t({"for i in 0 to 15 loop", "  "}) , i(0), t({"","end loop;"}) }),
        s("case", { t({"case "}), i(0,"var"), t({" is", "  when cond1 =>", "  when others =>", "end case;"})}),
        s("process", { t({"process(all) begin", "  if rising_edge(clk) then", "    "}), i(0,""), t({"","  end if;", "end process;"}) }),
        s("std_logic_vector", { t({"std_logic_vector("}), i(0,"31"), t({" downto 0);"})}),
        s("unsigned", { t({"unsigned("}), i(0,"31"), t({" downto 0);"})}),
        s("integer", { t({"integer range 0 to "}), i(0,"255"), t({";"})}),
      })

      cmp.setup({
        experimental = { ghost_text = true },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = {
            border = 'rounded',
            scrollbar = '║',
          },
          documentation = {
            border = 'rounded',
            scrollbar = '',
          },
        },
        completion = {
          completeopt = "menu,menuone,noinsert,preview,noselect",
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.confirm({ select = true }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        },
      })
    end,
  },

  {"folke/tokyonight.nvim",
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("tokyonight-night")
      vim.cmd.hi("Comment gui=none")
    end,
  },

  {"echasnovski/mini.nvim", -- Collection of various small independent plugins/modules
    config = function()
      require("mini.ai").setup({ n_lines = 500 }) -- more vim motions e.g. yiq or ci
      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = vim.g.have_nerd_font })
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end
    end,
  },

  {"nvim-treesitter/nvim-treesitter",
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

      -- Prefer git instead of curl in order to improve connectivity in some environments
      require("nvim-treesitter.install").prefer_git = true
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
})

