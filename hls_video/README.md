# hls_video

- Video processing using Vivado HLS IP

***

## How to build the project

### Generate HLS IP

```shell-session
# Generate IP
$ vivado_hls -f build_hls_pattern_gen_axis.tcl

# Extract IP
$ mkdir -p hls/ip/petten_gen_axis
$ unzip _vhls/solution1/impl/ip/xilinx_com_hls_petten_gen_axis_1_0.zip \
-d hls/ip/petten_gen_axis
```

- Implementation result:

```text
#=== Post-Implementation Resource usage ===
SLICE:           48
LUT:            124
FF:             111
DSP:              0
BRAM:             0
SRL:              0
#=== Final timing ===
CP required:    6.700
CP achieved post-synthesis:    4.477
CP achieved post-implementation:    4.840
Timing met
```

### Generate Vivado project, SW, and BOOT.bin

```shell-session
# Get DVI2RGB/RGB2DVI IPs from Digilent's git (commit 18d7d68)
$ git clone https://github.com/Digilent/vivado-library.git

# Create Vivado project
$ vivado -mode batch -source create_vivado_project.tcl

# Make SDK app to initialize PS
$ xsct create_boot_bin.tcl
```

## Run

- Copy BOOT.bin into SD Card and power up the board
