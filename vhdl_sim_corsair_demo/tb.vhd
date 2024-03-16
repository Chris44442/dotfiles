
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library vunit_lib;
context vunit_lib.vunit_context;

entity corsair_tb is
  generic (runner_cfg : string);
end entity;

architecture sim of corsair_tb is
  constant PERIOD : time := 10 ns;
  signal clk : std_logic := '0';
  signal reset : std_logic := '1';
  signal raddr : std_logic_vector(15 downto 0) := 16x"0";
  signal ren : std_logic := '0';
  signal rdata : std_logic_vector(31 downto 0);
begin

clk <= not clk after PERIOD/2;

process begin
  test_runner_setup(runner, runner_cfg);
  wait for 5*PERIOD;
  reset <= '0';
  report "Hello world!";
  wait for 20*PERIOD;
  wait until falling_edge(clk);
  raddr <= 16x"0";
  ren <= '1';
  wait until falling_edge(clk);
  raddr <= 16x"4";
  wait until falling_edge(clk);
  raddr <= 16x"8";
  wait until falling_edge(clk);
  raddr <= 16x"C";
  wait until falling_edge(clk);
  raddr <= 16x"10";
  wait until falling_edge(clk);
  raddr <= 16x"14";
  wait until falling_edge(clk);
  raddr <= 16x"0";
  ren <= '0';
  wait for 10*PERIOD;
  test_runner_cleanup(runner); -- Simulation ends here
end process;

regs: entity work.regs port map (
  clk => clk,
  rst => reset,
  csr_header_header_name_in => 32x"A111",
  csr_data0_data0_name_in => 32x"B222",
  csr_data1_data1_name_in => 32x"C333",
  csr_data2_data1_name_in => 32x"D444",
  csr_trailer_data1_name_in => 32x"E555",
  waddr => (others => '0'),
  wdata => (others => '0'),
  wen => '0',
  wstrb => (others => '0'),
  raddr => raddr,
  ren => ren,
  rdata => rdata,
  rvalid => open
);

end architecture;

