# Setting
set PRJ_DIR     _vivado
set PRJ_NAME    z7_hls_video
set BD_NAME     ${PRJ_NAME}
set SRC_DIR     src
set XSDK_DIR    _sdk
set NUM_JOBS    4

# Remove existing directory
file delete -force ${PRJ_DIR}

# Create project
create_project ${PRJ_NAME} ${PRJ_DIR} -part xc7z020clg400-1
set_property board_part digilentinc.com:zybo-z7-20:part0:1.0 [current_project]

# Add constraint
add_files -fileset constrs_1 -norecurse ${SRC_DIR}/Zybo-Z7-Master.xdc
import_files -fileset constrs_1 ${SRC_DIR}/Zybo-Z7-Master.xdc

# Add IP repo
set IP_REPOS  [ format "hls/ip vivado-library" ] 
set_property  ip_repo_paths ${IP_REPOS} [current_project]
update_ip_catalog

# Create block design
source ${SRC_DIR}/bd.tcl

# Set top-level source
make_wrapper -files [get_files ${PRJ_DIR}/${PRJ_NAME}.srcs/sources_1/bd/${BD_NAME}/${BD_NAME}.bd] -top
add_files -norecurse ${PRJ_DIR}/${PRJ_NAME}.srcs/sources_1/bd/${BD_NAME}/hdl/${BD_NAME}_wrapper.v
set_property top ${BD_NAME}_wrapper [current_fileset]
update_compile_order -fileset sources_1

# Generate block design
regenerate_bd_layout
# validate_bd_design
save_bd_design
generate_target all [get_files  ${PRJ_DIR}/${PRJ_NAME}.srcs/sources_1/bd/${BD_NAME}/${BD_NAME}.bd]

# Generate bitstream
update_compile_order -fileset sources_1

reset_run synth_1
launch_runs synth_1 -jobs ${NUM_JOBS}
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs ${NUM_JOBS}
wait_on_run impl_1

# Report utilization & clock after implementation
open_run impl_1
report_utilization -name utilization_1
report_clocks

# Export HW for SDK
file mkdir ${XSDK_DIR}
# Copy bitstream
file copy -force ${PRJ_DIR}/${PRJ_NAME}.runs/impl_1/${PRJ_NAME}_wrapper.sysdef ${XSDK_DIR}/${PRJ_NAME}_wrapper.hdf
# Do not copy bitstream
# write_hwdef -force  -file D:/Users/kuriharat/Documents/google_cloud/zybo_z7_tpg/vivado/zybo_z7_tpg.sdk/zybo_z7_tpg_wrapper.hdf
# launch_sdk -workspace $XSDK_DIR -hwspec $XSDK_DIR/${PRJ_NAME}_wrapper.hdf


# Finish - close project
close_project
