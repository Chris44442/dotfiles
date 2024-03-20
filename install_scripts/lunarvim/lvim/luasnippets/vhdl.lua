return {
    s("if", { t({"if reset then","  "}), i(0), t({"","end if;"}) }),
    s("others", { t("(others => '0')") }),
    s("for", { t({"for i in 0 to 15 loop", "  "}) , i(0), t({"","end loop;"}) }),
    s("case", { t({"case "}), i(0,"var"), t({" is", "  when cond1 =>", "  when others =>", "end case;"})}),

    s("ieee", { t({"library ieee;", "use ieee.std_logic_1164.all;", "use ieee.numeric_std.all;", ""})}),
    s("entity", { t({"entity top is port(", "  clk : in  std_logic;" , "  adr : out std_logic_vector(31 downto 0)" ,");", "end entity;", ""}) }),
    s("architecture", { t({"architecture rtl of top is", "  signal clk : std_logic;" , "begin" ,"", "end architecture;", ""}) }),
    -- s("process", { t({"process(all) begin", "  if rising_edge(clk) then", "  ", "  end if;", "end process;"}) }),
    s("process", { t({"process(all) begin", "  if rising_edge(clk) then", "    "}), i(0,""), t({"","  end if;", "end process;"}) }),

    s("std_logic_vector", { t({"std_logic_vector("}), i(0,"31"), t({" downto 0)"})}),
    s("unsigned", { t({"unsigned("}), i(0,"31"), t({" downto 0)"})}),
    s("integer", { t({"integer range 0 to "}), i(0,"255")}),
}

