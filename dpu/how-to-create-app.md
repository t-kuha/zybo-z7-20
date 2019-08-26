# How to create application

## Environment

- SDK/PetaLinux: 2018.3
- DNNDK: v3.1

***

## MNIST

- Generate calibration images

```shell-session
$ cd app_mnist
$ python generate_images.py
```

- Generate .dcf file

```shell-session
$ dlet -f ../_vivado/z7_20.srcs/sources_1/bd/z7_20/hw_handoff/z7_20.hwh
```

- Compress model

```shell-session
$ decent_q quantize \
--input_frozen_graph freeze/frozen_graph.pb \
--input_nodes images_in \
--output_nodes dense_1/BiasAdd \
--input_shapes ?,28,28,1 \
--input_fn graph_input_fn.calib_input
```

- Compile model

```shell-session
$ dnnc-dpu1.4.0 \
--parser=tensorflow \
--frozen_pb=quantize_results/deploy_model.pb \
--dcf=<.dcf file generated above> \
--cpu_arch=arm32 \
--output_dir=deploy \
--net_name=mnist \
--save_kernel \
--mode=normal
```

- Make .elf

```shell-session
# Create symbplic link to dputils
$ cd ../src/_pkgs/lib/
$ ln -s libdputils.so.3.3 libdputils.so
$ cd ../../../app_mnist/

# Build
$ arm-linux-gnueabihf-g++ main.cpp \
-I../src/_pkgs/include -I../libs/include \
-L../src/_pkgs/lib -L../libs/lib \
-ldputils -lhineon -ln2cube \
-lopencv_core -lopencv_imgproc -lopencv_imgcodecs \
-ltbb -lz  -ljpeg -lwebp -lpng16 -ltiff -llzma \
deploy/dpu_mnist.elf -o app_mnist.elf
```

- Run the .elf file
