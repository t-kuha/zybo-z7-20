# Application Acceleration Platform

- Vitis Application Acceleration Platform

***

## Clock settings

- Default clock is No.0 (100 MHz)

| No. | Speed [MHz] |
|----:|------------:|
|   0 |         100 |
|   1 |          50 |
|   2 |         150 |
|   3 |         200 |

***

## Create hardware

```shell-session
$ vivado -mode batch -source create_xsa.tcl
```

## Create Linux

- Create PetaLinux project

```shell-session
$ export PRJ=petalinux
$ petalinux-create -t project -n ${PRJ} --template zynq
$ petalinux-config -p ${PRJ} --get-hw-description=.
$ petalinux-config -p ${PRJ} -c u-boot
```

- Add following content to _petalinux/project-spec/meta-user/conf/user-rootfsconfig_

```text
CONFIG_xrt
CONFIG_xrt-dev
CONFIG_zocl
CONFIG_opencl-clhpp-dev
CONFIG_opencl-headers-dev
CONFIG_packagegroup-petalinux-opencv
```

- Edit device tree (_petalinux/project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi_)

```text
&amba {
    zyxclmm_drm {
        compatible = "xlnx,zocl";
        status = "okay";
    };
};
```

- Build

```shell-session
$ petalinux-config -p ${PRJ} -c kernel
$ petalinux-config -p ${PRJ} -c rootfs
$ petalinux-build -p ${PRJ}

# Generate SDK
$ petalinux-build -p ${PRJ} --sdk
```

## Generate platform

```shell-session
$ xsct create_pfm.tcl
```

- Now, the platform is in ``_pfm/sd_blk_accel/export``

***

## Vector Add application

- Run

```shell-session
root@sd_blk_accel:/media/card# ./sd-blk-app.exe binary_container_1.xclbin 
[drm] Pid 1252 opened device
[drm] Pid 1252 closed device
[drm] Pid 1252 opened device
Loading: 'binary_container_1.xclbin'
[drm] The XCLBIN already loaded. Don't need to reload.
[drm] Reconfiguration not supported
TEST PASSED
[drm] Pid 1252 closed device
```

***

## Reference

- UG1393: Vitis Unified Software Platform Documentation - Application Acceleration Development (v2019.2)
