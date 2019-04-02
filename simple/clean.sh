#!/bin/sh

rm -rf _vivado
rm -rf .Xil

# SDSoC platform
rm -rf _platform_init
rm -rf _platform_final

# Initial SDSoC project for prebuilt HW
rm -rf _prj_init

# Files for platform
rm -rf pfm_files/boot
rm -rf pfm_files/image
rm -rf pfm_files/prebuilt

# PetaLinux files
rm -rf petalinux/z7_20/images/
rm -rf petalinux/z7_20/build/

rm -f *.log
rm -f *.jou
rm -f petalinux/*.dsa
