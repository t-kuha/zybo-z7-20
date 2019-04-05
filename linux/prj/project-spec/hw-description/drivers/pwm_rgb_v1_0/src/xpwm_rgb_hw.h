// ==============================================================
// File generated on Fri Apr 05 10:23:22 +0900 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// AXIL_CTL
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - Channel 0 (ap_done)
//        bit 1  - Channel 1 (ap_ready)
//        others - reserved
// 0x10 : Data signal of duty_r
//        bit 7~0 - duty_r[7:0] (Read/Write)
//        others  - reserved
// 0x14 : reserved
// 0x18 : Data signal of duty_g
//        bit 7~0 - duty_g[7:0] (Read/Write)
//        others  - reserved
// 0x1c : reserved
// 0x20 : Data signal of duty_b
//        bit 7~0 - duty_b[7:0] (Read/Write)
//        others  - reserved
// 0x24 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XPWM_RGB_AXIL_CTL_ADDR_AP_CTRL     0x00
#define XPWM_RGB_AXIL_CTL_ADDR_GIE         0x04
#define XPWM_RGB_AXIL_CTL_ADDR_IER         0x08
#define XPWM_RGB_AXIL_CTL_ADDR_ISR         0x0c
#define XPWM_RGB_AXIL_CTL_ADDR_DUTY_R_DATA 0x10
#define XPWM_RGB_AXIL_CTL_BITS_DUTY_R_DATA 8
#define XPWM_RGB_AXIL_CTL_ADDR_DUTY_G_DATA 0x18
#define XPWM_RGB_AXIL_CTL_BITS_DUTY_G_DATA 8
#define XPWM_RGB_AXIL_CTL_ADDR_DUTY_B_DATA 0x20
#define XPWM_RGB_AXIL_CTL_BITS_DUTY_B_DATA 8

