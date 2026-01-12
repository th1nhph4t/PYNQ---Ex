# Buttons (Bank 44) - v?n 3.3V
set_property PACKAGE_PIN AH14 [get_ports {a[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[0]}]

set_property PACKAGE_PIN AG14 [get_ports {a[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {a[1]}]

set_property PACKAGE_PIN AE14 [get_ports {b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[0]}]

set_property PACKAGE_PIN AE15 [get_ports {b[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[1]}]

# LEDs (Bank 66 - HP) -> dùng 1.8V
set_property PACKAGE_PIN B5 [get_ports {sum[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sum[0]}]

set_property PACKAGE_PIN A6 [get_ports {sum[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sum[1]}]

set_property PACKAGE_PIN B8 [get_ports {sum[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sum[2]}]
