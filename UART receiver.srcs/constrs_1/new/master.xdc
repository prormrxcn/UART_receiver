## Clock Signal (100 MHz on Basys 3)
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Reset Button (BtnC on Basys 3)
set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## UART RX (USB-UART port, Pin B18 on Basys 3)
set_property PACKAGE_PIN B18 [get_ports rx]
set_property IOSTANDARD LVCMOS33 [get_ports rx]

## Data Valid LED
set_property PACKAGE_PIN L1 [get_ports data_ready]
set_property IOSTANDARD LVCMOS33 [get_ports data_ready]

## LED Outputs (8 LEDs on Basys 3)
set_property PACKAGE_PIN U16 [get_ports {data_out[0]}]
set_property PACKAGE_PIN E19 [get_ports {data_out[1]}]
set_property PACKAGE_PIN U19 [get_ports {data_out[2]}]
set_property PACKAGE_PIN V19 [get_ports {data_out[3]}]
set_property PACKAGE_PIN W18 [get_ports {data_out[4]}]
set_property PACKAGE_PIN U15 [get_ports {data_out[5]}]
set_property PACKAGE_PIN U14 [get_ports {data_out[6]}]
set_property PACKAGE_PIN V14 [get_ports {data_out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[*]}]