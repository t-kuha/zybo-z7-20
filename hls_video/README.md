# hls_video

***

## How to build the project

- First, build HLS IP:

```bash
# In batch mode
$ vivado_hls -f build_hls_pattern_gen_axis.tcl
```

- Extract _hls_petten_gen_axis/solution1/impl/ip/xilinx_com_hls_petten_gen_axis_1_0.zip_ into _hls/ip/petten_gen_axis_

- Then, generate Vivado project, SW, and BOOT.bin

```bash
# Get DVI2RGB/RGB2DVI IPs from Digilent's git
$ git clone https://github.com/Digilent/vivado-library.git
$ cd vivado-library
$ git checkout 69dbafb
$ cd ..

# Create Vivado project
$ vivado -mode batch -source create_vivado_project.tcl

# Make SDK app to initialize PS
$ source create_boot_bin.tcl
```

## Run

- Copy BOOT.bin into SD Card and power up the board