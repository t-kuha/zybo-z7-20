# DPU for Zybo Z7-20

- DPU: v3.0
- Vivado/PetaLinux: 2018.3

## Prerequisite

- DPU TRD design (190809)
  - Download _zcu102-dpu-trd-2019-1-190809.zip_ from [Xilinx website](https://www.xilinx.com/products/design-tools/ai-inference/ai-developer-hub.html#edge)

- DNNDK (v3.1; 190809)
  - Download _xilinx_dnndk_v3.1_190809.tar.gz_ also from [Xilinx website](https://www.xilinx.com/products/design-tools/ai-inference/ai-developer-hub.html#edge)

- Extract source

```shell-session
# IP
$ unzip zcu102-dpu-trd-2019-1-190809.zip
$ cp -R zcu102-dpu-trd-2019-1-timer/pl/srcs/dpu_ip src/_dpu_ip

# Kernel module
$ cd zcu102-dpu-trd-2019-1-timer/apu/dpu_petalinux_bsp
$ petalinux-create -t project -s xilinx-dpu-trd-zcu102-v2019.1.bsp
$ cp -R zcu102-dpu-trd-2019-1/project-spec/meta-user/recipes-modules/dpu ../../../src

# Library
$ tar xf xilinx_dnndk_v3.1_190809.tar.gz
$ cp -R xilinx_dnndk_v3/ZedBoard/pkgs src/_pkgs
```

***

## Build HW (Generate bitstream)

```shell-session
$ vivado -mode batch -source create_vivado_project.tcl
```

***

## Create PetaLinux project

- Create project (usually can be skipped to "petalinux-build")

```shell-session
$ export PRJ_NAME=prj
$ petalinux-create -t project -n ${PRJ_NAME} --template zynq
$ petalinux-config -p ${PRJ_NAME} --get-hw-description=.

# Kernel config
$ petalinux-config -p ${PRJ_NAME} -c kernel

# u-boot config
$ petalinux-config -p ${PRJ_NAME} -c u-boot

# rootfs config
$ petalinux-config -p ${PRJ_NAME} -c rootfs
$ cp -R src/dpu/* prj/project-spec/meta-user/recipes-modules/dpu/

# Add DNNDK files
$ petalinux-create -p ${PRJ_NAME} -t apps --template install --name dnndk --enable
$ rm prj/project-spec/meta-user/recipes-apps/dnndk/files/dnndk
$ cp -R src/_pkgs/bin prj/project-spec/meta-user/recipes-apps/dnndk/files/
$ cp -R src/_pkgs/lib prj/project-spec/meta-user/recipes-apps/dnndk/files/
# Then edit dnndk.bb

# Add DPU driver (Kernel module)
$ petalinux-create -p ${PRJ_NAME} -t modules --name dpu --enable
$ cp -R src/_dpu/* prj/project-spec/meta-user/recipes-modules/dpu/

# Build
$ petalinux-build -p ${PRJ_NAME}

# Generate SDK (optional)
$ petalinux-build --sdk -p ${PRJ_NAME}
```

- Generate BOOT.bin

```shell-session
$ petalinux-package -p ${PRJ_NAME} --boot --format BIN \
--fsbl ${PRJ_NAME}/images/linux/zynq_fsbl.elf \
--u-boot ${PRJ_NAME}/images/linux/u-boot.elf \
--fpga _vivado/z7_20.runs/impl_1/z7_20_wrapper.bit
```

- Or...

```shell-session
$ petalinux-package -p ${PRJ_NAME} --boot --format BIN \
--fsbl ${PRJ_NAME}/images/linux/zynq_fsbl.elf \
--u-boot ${PRJ_NAME}/images/linux/u-boot.elf \
--fpga ${PRJ_NAME}/components/plnx_workspace/device-tree/device-tree/z7_20_wrapper.bit
```

***

## Reference

- [DPU for Convolutional Neural Network v3.0 - DPU IP Product Guide](https://www.xilinx.com/support/documentation/ip_documentation/dpu/v3_0/pg338-dpu.pdf)
- [Device trees of DPU](https://forums.xilinx.com/t5/Deephi-DNNDK/Device-trees-of-DPU/m-p/953420)
