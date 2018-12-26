# zybo-z7-20
Xilinx SDSoC / HLS projects for ZYbo Z7-20 board


***
### simple: simple SDSoC platform


***
### How to create platform

```bash
cd simple

# Create Vivado project
vivado -mode batch -source create_vivado_project.tcl

```


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

# Build project
petalinux-build
```