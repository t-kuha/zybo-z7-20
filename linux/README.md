# linux

***

## Build hardware

```shell-session
# Get Digilent IP
$ git clone https://github.com/Digilent/vivado-library.git

# This will create HW definition file (_system.hdf)
$ vivado -mode batch -source create_vivado_project.tcl
```

***

## Build PetaLinux

```shell-session
$ export PRJ=petalinux

$ petalinux-config -p ${PRJ}
$ petalinux-build -p ${PRJ}

# Generate SDK (optional)
$ petalinux-build --sdk -p ${PRJ}
```

## Generate BOOT.bin

- BOOT.BIN is in ``${PRJ}/images/linux/``

```shell-session
$ bootgen -arch zynq -image src/boot_bin_linux.bif -w -o BOOT.bin
# or ...
$ petalinux-package -p ${PRJ} --boot --format BIN \
--fsbl ${PRJ}/images/linux/zynq_fsbl.elf \
--u-boot ${PRJ}/images/linux/u-boot.elf \
--fpga ${PRJ}/project-spec/hw-description/z7_20_wrapper.bit
# or ...
# --fpga _vivado/z7_20.runs/impl_1/z7_20_wrapper.bit
```

***

## Run

- Copy BOOT.bin & image.ub into 1st partition of SD card
- Power-up the board

***

## Simulation in QEMU

```shell-session
# Collect prebuilt image
$ cd ${PRJ}
$ petalinux-package --prebuilt

# Run Linux Kernel on QEMU
$ petalinux-boot --qemu --kernel
```

***

## Create project from scratch

```shell-session
$ export PRJ=petalinux
$ petalinux-create -t project -n ${PRJ} --template zynq
$ petalinux-config -p ${PRJ} --get-hw-description=.

# Configuration
$ petalinux-config -p ${PRJ} -c kernel
$ petalinux-config -p ${PRJ} -c u-boot
$ petalinux-config -p ${PRJ} -c rootfs

# Build
$ petalinux-build -p ${PRJ}

# Generate SDK (optional)
$ petalinux-build -p ${PRJ} --sdk
```

***

## Tips

- How to add libsdslib*.so

```shell-session
$ petalinux-create -p ${PRJ} -t apps --template install --name sdslib --enable
$ rm ${PRJ}/project-spec/meta-user/recipes-apps/sdslib/files/sdslib
$ cp -R ${XILINX_SDX}/target/aarch32-linux/lib/libsds_lib*.so \
${PRJ}/project-spec/meta-user/recipes-apps/sdslib/files
$ cp src/sdslib.bb ${PRJ}/project-spec/meta-user/recipes-apps/sdslib/sdslib.bb
```
