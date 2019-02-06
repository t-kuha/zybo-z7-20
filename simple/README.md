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
$ petalinux-create -t project -s z7_20
$ petalinux-build -p z7_20
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
$ sdscc ../src/hello_world.c -c -o hello_world.o -sds-pf ../_platform_init/z7_20/export/z7_20 -sds-sys-config linux -target-os linux
$ sdscc hello_world.o -o hello_world.elf -sds-pf ../_platform_init/z7_20/export/z7_20 -sds-sys-config linux -target-os linux
```

- Copy prebuilt data

```bash
$ mkdir pfm_files/prebuilt

# system.bit file should be renamed to bitstream.bit
$ cp _prj_init/_sds/p0/vpl/system.bit    pfm_files/prebuilt/bitstream.bit
# system.hdf file should be renamed to <platform>.hdf
$ cp _prj_init/_sds/p0/vpl/system.hdf    pfm_files/prebuilt/z7_20.hdf
$ cp _prj_init/_sds/.llvm/partitions.xml pfm_files/prebuilt
$ cp _prj_init/_sds/.llvm/apsys_0.xml    pfm_files/prebuilt
$ cp _prj_init/_sds/swstubs/portinfo.c   pfm_files/prebuilt
$ cp _prj_init/_sds/swstubs/portinfo.h   pfm_files/prebuilt
```

### Create final platform (with pre-built HW)

- Use xsct in SDx directory (not the one in XSDK directory)

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

## Run conformance test

- Copy source code of comformance test from _< SDX installation directory >/samples/platforms/Conformance_

```bash
# Build comformance test
$ make PLATFORM=../platform/z7_20 OS=LINUX PLATFORM_TYPE=ZYNQ
```

- Run built project

```bash
root@z7_20:~# /run/media/mmcblk0p1/ConformanceTest.elf
Starting allocation tests from 65536 to 67108864 with increment 524288
done
Starting datamover tests....
Running test <axi_dma_simple, ACP, sds_alloc>
    using Index=1/114687, data size=64-7340032, Allocation=SDS Alloc, Unvalidated
 Complete
Running test <zero_copy, ACP, sds_alloc>
    using Index=1/262143, data size=64-16777216, Allocation=SDS Alloc, Unvalidated
 Complete
Running test <axi_dma_sg, ACP, malloc>
    using Index=1/262143, data size=64-16777216, Allocation=User new, Unvalidated
 Complete
Running test <axi_dma_sg, ACP, sds_alloc>
    using Index=1/262143, data size=64-16777216, Allocation=SDS Alloc, Unvalidated
 Complete
Running test <axi_dma_simple, HP, sds_alloc>
    using Index=1/114687, data size=64-7340032, Allocation=SDS Alloc, Unvalidated
 Complete
Running test <axi_dma_simple, HP, sds_alloc_noncacheable>
    using Index=1/114687, data size=64-7340032, Allocation=SDS Alloc (non-cacheable), Unvalidated
 Complete
Running test <zero_copy, HP, sds_alloc>
    using Index=1/262143, data size=64-16777216, Allocation=SDS Alloc, Unvalidated
 Complete
Running test <zero_copy, HP, sds_alloc_noncacheable>
    using Index=1/262143, data size=64-16777216, Allocation=SDS Alloc (non-cacheable), Unvalidated
 Complete
Running test <axi_dma_sg, HP, malloc>
    using Index=1/262143, data size=64-16777216, Allocation=User new, Unvalidated
 Complete
Running test <axi_dma_sg, HP, sds_alloc>
    using Index=1/262143, data size=64-16777216, Allocation=SDS Alloc, Unvalidated
 Complete
Running test <axi_dma_sg, HP, sds_alloc_noncacheable>
    using Index=1/262143, data size=64-16777216, Allocation=SDS Alloc (non-cacheable), Unvalidated
 Complete
Running test <axi_fifo, NONE, NONE>
    using Index=1/31, data size=64-2048, Allocation=User new, Unvalidated
 Complete
Datamover Testing complete.
Testing clocks
Clock tests complete.
Test passed
```

***

## Reference

- UG1146: "SDSoC Environment Platform Development Guide"
- UG1144: "PetaLinux Tools Documentation"
