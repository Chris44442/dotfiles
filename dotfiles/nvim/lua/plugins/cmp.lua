return {'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- "hrsh7th/cmp-nvim-lsp",
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
        -- { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      },
    })
  end,
}

