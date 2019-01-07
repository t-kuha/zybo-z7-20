# Create BOOT.bin (for standalone)
# 
# Usage: In Xilinx Software Command Line Tool, run the following command:
#           source create_boot_bin.tcl
# 
# Need to install board files in <SDK Installation Path>/data/boards/board_files
#
# Reference: UG1208
# 

set XSDK_DIR    sdk
set PRJ_NAME    z7_hls_video

set SCRIPT_DIR [ file dirname [ file normalize [ info script ] ] ]

cd ${SCRIPT_DIR}

setws ${SCRIPT_DIR}/${XSDK_DIR}

# Create BSP
createhw -name bsp -hwspec ${XSDK_DIR}/${PRJ_NAME}_wrapper.hdf

# Create FSBL
createapp -name fsbl -app {Zynq FSBL} -hwproject bsp -proc ps7_cortexa9_0 -os standalone

# Create application
createapp -name hello_world -app {Hello World} -hwproject bsp -proc ps7_cortexa9_0 -os standalone


# Build in release mode
configapp -app fsbl build-config release
configapp -app hello_world build-config release

projects -build

# Generate BOOT.bin
exec bootgen -arch zynq -image src/boot_bin_standalone.bif -w -o BOOT.bin
exec bootgen -arch zynq -image src/boot_bin_linux.bif -w -o BOOT_LINUX.bin