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

-- Render Whitespaces
vim.cmd([[set list]])
vim.cmd([[set listchars=space:·]])

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

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
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "🔭󰭎 Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "📅 Open diagnostic [Q]uickfix list" })

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
      -- local _ = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        -- hop.hint_words({ current_line_only = false })
        hop.hint_words()
      -- vim.keymap.set('', 'f', function()
      --   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
      -- end, {remap=true})
      -- vim.keymap.set('', 't', function()
      --   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
      end, {remap=true})
    end,
  },

  {"ThePrimeagen/harpoon",
    config = function()
      vim.api.nvim_set_keymap('', '<leader>h', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {noremap=true, silent=true})
      vim.api.nvim_set_keymap('', '<leader>t', "<cmd>lua require('harpoon.mark').add_file()<CR>", {noremap=true, silent=true})
      require'harpoon'.setup {tabline = true}
      vim.api.nvim_set_keymap('n', '<Tab>', ":lua require('harpoon.ui').nav_next() <CR>", {noremap=true, silent=true})
      vim.api.nvim_set_keymap('n', '<S-Tab>', ":lua require('harpoon.ui').nav_prev() <CR>", {noremap=true, silent=true})
      -- vim.api.nvim_set_keymap('', '<C-t>', ":lua require('harpoon.ui').nav_file(2)<CR>", {noremap=true, silent=true})
      -- vim.api.nvim_set_keymap('', '<C-n>', ":lua require('harpoon.ui').nav_file(3)<CR>", {noremap=true, silent=true})
      -- vim.api.nvim_set_keymap('', '<C-s>', ":lua require('harpoon.ui').nav_file(4)<CR>", {noremap=true, silent=true})
      -- vim.api.nvim_set_keymap('', '<C-m>', ":lua require('harpoon.ui').nav_file(5)<CR>", {noremap=true, silent=true})
      -- vim.api.nvim_set_keymap('', '<C-w>', ":lua require('harpoon.ui').nav_file(6)<CR>", {noremap=true, silent=true})
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

  {"folke/which-key.nvim",
    event = "VimEnter",
    config = function() -- This is the function that runs, AFTER loading
      require("which-key").setup()
      require("which-key").register({
        ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
        ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
        ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
        ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
        ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
        ["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
      })
      require("which-key").register({
        ["<leader>h"] = { "Git [H]unk" },
      }, { mode = "v" })
    end,
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
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "🔭 Help" })
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "🔭 Keymaps" })
      vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "🔭 Files" })
      -- vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
      vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "🔭 Word" })
      vim.keymap.set("n", "<leader>st", builtin.live_grep, { desc = "🔭 Grep Workspace" })
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "🔭 Diagnostics" })
      vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "🔭 Resume" })
      vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '🔭 Recent' })
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "🔭 Buffers" })

      vim.keymap.set("n", "<leader>a", function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "🔭 Current Buffer" })

      vim.keymap.set("n", "<leader>s/", function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end, { desc = "🔭 Grep Open Files" })

      vim.keymap.set("n", "<leader>sn", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "🔭 Config" })
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
          map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
          map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
          map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
          map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
          map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
          map(
            "<leader>ws",
            require("telescope.builtin").lsp_dynamic_workspace_symbols,
            "[W]orkspace [S]ymbols"
          )
          map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

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

          -- The following autocommand is used to enable inlay hints in your
          -- code, if the language server you are using supports them
          -- This may be unwanted, since they displace some of your code
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map("<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, "[T]oggle Inlay [H]ints")
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
      {
        "L3MON4D3/LuaSnip",
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
            return
          end
          return "make install_jsregexp"
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
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
        completion = { completeopt = "menu,menuone,noinsert,preview,noselect" },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ['<Tab>'] = cmp.mapping.confirm({ select = true }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete({}),
          ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),
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

  { -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    config = function()
      -- Better Around/Inside textobjects
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup({ n_lines = 500 })
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup()

      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = vim.g.have_nerd_font })
      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end
    end,
  },

  {"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      -- ensure_installed = { "bash", "c", "rust", "diff", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
    },
    config = function(_, opts)
      local colors = require('tokyonight.colors').setup()
      vim.api.nvim_set_hl(0, '@Attribute', { fg = colors.yellow })
      vim.api.nvim_set_hl(0, '@Type', { fg = colors.blue })
      vim.api.nvim_set_hl(0, '@Type.builtin', { fg = colors.blue })
      vim.api.nvim_set_hl(0, '@Function', { fg = colors.yellow })
      vim.api.nvim_set_hl(0, '@Function.builtin', { fg = colors.yellow })
      vim.api.nvim_set_hl(0, '@Number', { fg = colors.red })
      vim.api.nvim_set_hl(0, '@Number.Float', { fg = colors.red })
      -- vim.api.nvim_set_hl(0, '@Operator', { fg = colors.white })
      vim.api.nvim_set_hl(0, '@Operator', { fg = colors.blue })
      -- vim.api.nvim_set_hl(0, '@Keyword.Operator', { fg = colors.blue })
      vim.api.nvim_set_hl(0, '@Keyword.Operator', { fg = colors.purple })
      vim.api.nvim_set_hl(0, '@Keyword.Conditional', { fg = colors.purple })
      vim.api.nvim_set_hl(0, '@Keyword.Repeat', { fg = colors.purple })
      vim.api.nvim_set_hl(0, '@Keyword.Import', { fg = colors.purple })
      vim.api.nvim_set_hl(0, '@Constant.builtin', { fg = colors.purple })
      vim.api.nvim_set_hl(0, '@Module', { fg = colors.white })
      vim.api.nvim_set_hl(0, '@Property', { fg = colors.white })
      vim.api.nvim_set_hl(0, '@Module.builtin', { fg = colors.white })

      -- Prefer git instead of curl in order to improve connectivity in some environments
      require("nvim-treesitter.install").prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup(opts)
      require('nvim-treesitter.parsers').get_parser_configs().vhdl = {
        install_info = {
          -- url = "https://github.com/alemuller/tree-sitter-vhdl.git",
          url = "https://github.com/jpt13653903/tree-sitter-vhdl",
          -- files = { 'src/parser.c' },
          files = { 'src/parser.c', 'src/scanner.c' },
          -- branch = 'main',
          -- branch = 'master',
          branch = 'develop',
          -- branch = 'experiment/anonymous_keywords',
          generate_requires_npm = false, -- if stand-alone parser without npm dependencies
          requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
        },
        filetype = 'vhdl',
      }
    end,
  },
})

