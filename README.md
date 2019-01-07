# zybo-z7-20
Xilinx SDSoC / HLS projects for Zybo Z7-20 board (https://store.digilentinc.com/zybo-z7-zynq-7000-arm-fpga-soc-development-board/)


***
### simple: simple SDSoC platform


***
### How to create platform

```bash
$ cd simple

# Create Vivado project
$ vivado -mode batch -source create_vivado_project.tcl

# Build PetaLinux
$ cd petalinux
$ petalinux-build --project z7_20
```

- Generate platform

    - Open SDSoC GUI

    - 

***
### How to create Petalinux project

- Refer to 

    - UG1146: "SDSoC Environment Platform Development Guide"

    - UG1144: "PetaLinux Tools Documentation"


```bash
cd petalinux

export PRJ_NAME=z7_20

# Create project
petalinux-create --type project --name ${PRJ_NAME} --template zynq
petalinux-config --project ${PRJ_NAME} --get-hw-description

# Modify kernel & rootfs settings
petalinux-config --project ${PRJ_NAME} -c kernel
petalinux-config --project ${PRJ_NAME} -c rootfs

# Add sds_lib
petalinux-create --project ${PRJ_NAME} -t apps --template install --name sdslib --enable

# Build project
petalinux-build --project ${PRJ_NAME}
```
