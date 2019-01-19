# simple

- Simple SDSoC platform for Zybo Z7-20 board

***

## How to create platform

### Create HW in Vivado

```bash
# Create Vivado project
$ vivado -mode batch -source create_vivado_project.tcl
```

### Build PetaLinux

```bash
$ cd petalinux
$ petalinux-build --project z7_20
```

### Generate platform (w/o prebuilt data)

```bash
# Create directory for platform components
$ mkdir pfm_files/boot pfm_files/image

# Copy necessary output products
$ cp petalinux/z7_20/images/linux/u-boot.elf      pfm_files/boot
$ cp petalinux/z7_20/images/linux/zynq_fsbl.elf   pfm_files/boot
$ cp petalinux/z7_20/images/linux/image.ub        pfm_files/image

# Make sure to use xsct in SDx (not SDK)
$ xsct create_sdsoc_pfm.tcl
```

### Build pre-built HW

- Build _hello_world_

```bash
$ mkdir _prj_init
$ cd _prj_init
$ sdscc ../src/hello_world.c -c -o hello_world.o -sds-pf ../platform/u96_base/export/u96_base -sds-sys-config linux -target-os linux
$ sdscc hello_world.o -o hello_world.elf -sds-pf ../platform/u96_base/export/u96_base -sds-sys-config linux -target-os linux
```

- Copy prebuilt data

```bash
$ mkdir pfm_files/prebuilt

# system.bit file should be renamed to bitstream.bit
$ cp _prj_init/_sds/p0/vpl/system.bit    pfm_files/prebuilt/bitstream.bit
# system.hdf file should be renamed to <platform>.hdf
$ cp _prj_init/_sds/p0/vpl/system.hdf    pfm_files/prebuilt/u96_base.hdf
$ cp _prj_init/_sds/.llvm/partitions.xml pfm_files/prebuilt
$ cp _prj_init/_sds/.llvm/apsys_0.xml    pfm_files/prebuilt
$ cp _prj_init/_sds/swstubs/portinfo.c   pfm_files/prebuilt
$ cp _prj_init/_sds/swstubs/portinfo.h   pfm_files/prebuilt
```

### Create final platform (with pre-built HW)

```bash
$ xsct create_sdsoc_pfm.tcl
```

***

### How to create Petalinux project

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

***

## Reference

  - UG1146: "SDSoC Environment Platform Development Guide"
  - UG1144: "PetaLinux Tools Documentation"
