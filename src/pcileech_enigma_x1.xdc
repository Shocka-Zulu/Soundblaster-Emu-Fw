set_property PACKAGE_PIN V20  [get_ports ft601_be[0]]
set_property PACKAGE_PIN V19  [get_ports ft601_be[1]]
set_property PACKAGE_PIN W20  [get_ports ft601_be[2]]
set_property PACKAGE_PIN AB20 [get_ports ft601_be[3]]
set_property PACKAGE_PIN H20  [get_ports ft601_data[0]]
set_property PACKAGE_PIN H22  [get_ports ft601_data[1]]
set_property PACKAGE_PIN J21  [get_ports ft601_data[2]]
set_property PACKAGE_PIN J22  [get_ports ft601_data[3]]
set_property PACKAGE_PIN K21  [get_ports ft601_data[4]]
set_property PACKAGE_PIN K22  [get_ports ft601_data[5]]
set_property PACKAGE_PIN L21  [get_ports ft601_data[6]]
set_property PACKAGE_PIN N18  [get_ports ft601_data[7]]
set_property PACKAGE_PIN M18  [get_ports ft601_data[8]]
set_property PACKAGE_PIN L20  [get_ports ft601_data[9]]
set_property PACKAGE_PIN L19  [get_ports ft601_data[10]]
set_property PACKAGE_PIN M20  [get_ports ft601_data[11]]
set_property PACKAGE_PIN M22  [get_ports ft601_data[12]]
set_property PACKAGE_PIN M21  [get_ports ft601_data[13]]
set_property PACKAGE_PIN N22  [get_ports ft601_data[14]]
set_property PACKAGE_PIN N20  [get_ports ft601_data[15]]
set_property PACKAGE_PIN P15  [get_ports ft601_data[16]]
set_property PACKAGE_PIN T21  [get_ports ft601_data[17]]
set_property PACKAGE_PIN R16  [get_ports ft601_data[18]]
# OLD  ft601_data[19]
#set_property PACKAGE_PIN T20  [get_ports ft601_data[19]]
# NEW  ft601_data[19]
set_property PACKAGE_PIN T18  [get_ports ft601_data[19]]
set_property PACKAGE_PIN U17  [get_ports ft601_data[20]]
set_property PACKAGE_PIN U20  [get_ports ft601_data[21]]
set_property PACKAGE_PIN U21  [get_ports ft601_data[22]]
set_property PACKAGE_PIN V22  [get_ports ft601_data[23]]
set_property PACKAGE_PIN W22  [get_ports ft601_data[24]]
set_property PACKAGE_PIN W21  [get_ports ft601_data[25]]
set_property PACKAGE_PIN Y22  [get_ports ft601_data[26]]
set_property PACKAGE_PIN Y21  [get_ports ft601_data[27]]
set_property PACKAGE_PIN AB22 [get_ports ft601_data[28]]
set_property PACKAGE_PIN AA21 [get_ports ft601_data[29]]
set_property PACKAGE_PIN AB21 [get_ports ft601_data[30]]
set_property PACKAGE_PIN AA20 [get_ports ft601_data[31]]
set_property PACKAGE_PIN W17  [get_ports ft601_oe_n]
set_property PACKAGE_PIN P16  [get_ports ft601_rd_n]
set_property PACKAGE_PIN AA18 [get_ports ft601_rxf_n]
set_property PACKAGE_PIN AB18 [get_ports ft601_siwu_n]
set_property PACKAGE_PIN AA19 [get_ports ft601_txe_n]
set_property PACKAGE_PIN W19  [get_ports ft601_wr_n]
set_property PACKAGE_PIN N13  [get_ports ft601_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_txe_n ft601_rxf_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {{ft601_be[*]} {ft601_data[*]}}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft601_wr_n ft601_rd_n ft601_oe_n ft601_siwu_n ft601_rst_n}]
set_property SLEW FAST [get_ports {{ft601_be[*]} {ft601_data[*]}}]
set_property SLEW FAST [get_ports {ft601_wr_n ft601_rd_n ft601_oe_n ft601_siwu_n ft601_rst_n}]

set_property PACKAGE_PIN G21 [get_ports user_ld1_n]
set_property PACKAGE_PIN G22 [get_ports user_ld2_n]
set_property PACKAGE_PIN F19 [get_ports user_sw1_n]
set_property PACKAGE_PIN F20 [get_ports user_sw2_n]
set_property IOSTANDARD LVCMOS33 [get_ports {user_ld1_n user_ld2_n user_sw1_n user_sw2_n}]

# SYSCLK
set_property PACKAGE_PIN J19 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name net_clk -waveform {0.000 5.000} [get_ports clk]

# FT601 CLK
create_clock -period 10.000 -name net_ft601_clk -waveform {0.000 5.000} [get_ports ft601_clk]
set_property IOSTANDARD LVCMOS33 [get_ports ft601_clk]
set_property PACKAGE_PIN K18 [get_ports ft601_clk]

set_input_delay -clock [get_clocks net_ft601_clk] -min 6.5 [get_ports {ft601_data[*]}]
set_input_delay -clock [get_clocks net_ft601_clk] -max 7.0 [get_ports {ft601_data[*]}]
set_input_delay -clock [get_clocks net_ft601_clk] -min 6.5 [get_ports ft601_rxf_n]
set_input_delay -clock [get_clocks net_ft601_clk] -max 7.0 [get_ports ft601_rxf_n]
set_input_delay -clock [get_clocks net_ft601_clk] -min 6.5 [get_ports ft601_txe_n]
set_input_delay -clock [get_clocks net_ft601_clk] -max 7.0 [get_ports ft601_txe_n]

set_output_delay -clock [get_clocks net_ft601_clk] -max 1.0 [get_ports {ft601_wr_n ft601_rd_n ft601_oe_n}]
set_output_delay -clock [get_clocks net_ft601_clk] -min 4.8 [get_ports {ft601_wr_n ft601_rd_n ft601_oe_n}]
set_output_delay -clock [get_clocks net_ft601_clk] -max 1.0 [get_ports {{ft601_be[*]} {ft601_data[*]}}]
set_output_delay -clock [get_clocks net_ft601_clk] -min 4.8 [get_ports {{ft601_be[*]} {ft601_data[*]}}]

set_property IOB TRUE [get_cells i_pcileech_com/i_pcileech_ft601/FT601_OE_N_reg]
set_property IOB TRUE [get_cells i_pcileech_com/i_pcileech_ft601/FT601_RD_N_reg]
set_property IOB TRUE [get_cells i_pcileech_com/i_pcileech_ft601/FT601_WR_N_reg]
set_property IOB TRUE [get_cells i_pcileech_com/i_pcileech_ft601/FT601_DATA_OUT_reg[0][*]]

set_multicycle_path 2 -from [get_pins i_pcileech_com/i_pcileech_ft601/OE_reg/C] -to [get_ports {{ft601_be[*]} {ft601_data[*]}}]
set_false_path -from [get_pins {tickcount64_reg[*]/C}]
set_false_path -from [get_pins {i_pcileech_fifo/_pcie_core_config_reg[*]/C}]
set_false_path -from [get_pins i_pcileech_pcie_a7/i_pcie_7x_0/inst/inst/user_lnk_up_int_reg/C] -to [get_pins {i_pcileech_fifo/_cmd_tx_din_reg[16]/D}]
set_false_path -from [get_pins i_pcileech_pcie_a7/i_pcie_7x_0/inst/inst/user_reset_out_reg/C]

#PCIe signals
set_property PACKAGE_PIN A13 [get_ports pcie_present]
set_property PACKAGE_PIN C13 [get_ports pcie_perst_n]
set_property PACKAGE_PIN B13 [get_ports pcie_wake_n]
set_property IOSTANDARD LVCMOS33 [get_ports pcie_present]
set_property IOSTANDARD LVCMOS33 [get_ports pcie_perst_n]
set_property IOSTANDARD LVCMOS33 [get_ports pcie_wake_n]

set_property PACKAGE_PIN C9 [get_ports {pcie_rx_n[0]}]
set_property PACKAGE_PIN D9 [get_ports {pcie_rx_p[0]}]
set_property PACKAGE_PIN C7 [get_ports {pcie_tx_n[0]}]
set_property PACKAGE_PIN D7 [get_ports {pcie_tx_p[0]}]

set_property PACKAGE_PIN E10 [get_ports pcie_clk_n]
set_property PACKAGE_PIN F10 [get_ports pcie_clk_p]

create_clock -name pcie_sys_clk_p -period 10.0 [get_nets pcie_clk_p]

set_property CFGBVS Vcco [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 66 [current_design]