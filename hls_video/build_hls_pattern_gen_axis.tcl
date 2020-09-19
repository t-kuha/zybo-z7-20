# 
# Generate Pettern Generator IP
# 
open_project _vhls
set_top petten_gen_axis
add_files hls/src/petten_gen_axis/hls.cpp
open_solution "solution1"
set_part {xc7z020clg400-1} -tool vivado
create_clock -period 6.7 -name default
#source directives.tcl
#csim_design
csynth_design
#cosim_design
export_design -flow impl -rtl verilog -format ip_catalog
close_solution
close_project
exit
