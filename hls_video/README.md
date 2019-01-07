## hls_video


***
### How to build the project

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


***
### 

