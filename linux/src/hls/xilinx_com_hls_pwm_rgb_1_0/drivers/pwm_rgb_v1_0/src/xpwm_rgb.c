// ==============================================================
// File generated on Fri Apr 05 10:23:22 +0900 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xpwm_rgb.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XPwm_rgb_CfgInitialize(XPwm_rgb *InstancePtr, XPwm_rgb_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Axil_ctl_BaseAddress = ConfigPtr->Axil_ctl_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XPwm_rgb_Start(XPwm_rgb *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPwm_rgb_ReadReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_AP_CTRL) & 0x80;
    XPwm_rgb_WriteReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XPwm_rgb_IsDone(XPwm_rgb *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPwm_rgb_ReadReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XPwm_rgb_IsIdle(XPwm_rgb *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPwm_rgb_ReadReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XPwm_rgb_IsReady(XPwm_rgb *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPwm_rgb_ReadReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XPwm_rgb_EnableAutoRestart(XPwm_rgb *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPwm_rgb_WriteReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_AP_CTRL, 0x80);
}

void XPwm_rgb_DisableAutoRestart(XPwm_rgb *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPwm_rgb_WriteReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_AP_CTRL, 0);
}

void XPwm_rgb_Set_duty_r(XPwm_rgb *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPwm_rgb_WriteReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_DUTY_R_DATA, Data);
}

u32 XPwm_rgb_Get_duty_r(XPwm_rgb *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPwm_rgb_ReadReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_DUTY_R_DATA);
    return Data;
}

void XPwm_rgb_Set_duty_g(XPwm_rgb *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPwm_rgb_WriteReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_DUTY_G_DATA, Data);
}

u32 XPwm_rgb_Get_duty_g(XPwm_rgb *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPwm_rgb_ReadReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_DUTY_G_DATA);
    return Data;
}

void XPwm_rgb_Set_duty_b(XPwm_rgb *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPwm_rgb_WriteReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_DUTY_B_DATA, Data);
}

u32 XPwm_rgb_Get_duty_b(XPwm_rgb *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPwm_rgb_ReadReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_DUTY_B_DATA);
    return Data;
}

void XPwm_rgb_InterruptGlobalEnable(XPwm_rgb *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPwm_rgb_WriteReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_GIE, 1);
}

void XPwm_rgb_InterruptGlobalDisable(XPwm_rgb *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPwm_rgb_WriteReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_GIE, 0);
}

void XPwm_rgb_InterruptEnable(XPwm_rgb *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XPwm_rgb_ReadReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_IER);
    XPwm_rgb_WriteReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_IER, Register | Mask);
}

void XPwm_rgb_InterruptDisable(XPwm_rgb *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XPwm_rgb_ReadReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_IER);
    XPwm_rgb_WriteReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_IER, Register & (~Mask));
}

void XPwm_rgb_InterruptClear(XPwm_rgb *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPwm_rgb_WriteReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_ISR, Mask);
}

u32 XPwm_rgb_InterruptGetEnabled(XPwm_rgb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XPwm_rgb_ReadReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_IER);
}

u32 XPwm_rgb_InterruptGetStatus(XPwm_rgb *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XPwm_rgb_ReadReg(InstancePtr->Axil_ctl_BaseAddress, XPWM_RGB_AXIL_CTL_ADDR_ISR);
}

