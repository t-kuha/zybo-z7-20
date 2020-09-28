// ==============================================================
// File generated on Fri Apr 05 10:23:22 +0900 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XPWM_RGB_H
#define XPWM_RGB_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xpwm_rgb_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Axil_ctl_BaseAddress;
} XPwm_rgb_Config;
#endif

typedef struct {
    u32 Axil_ctl_BaseAddress;
    u32 IsReady;
} XPwm_rgb;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XPwm_rgb_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XPwm_rgb_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XPwm_rgb_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XPwm_rgb_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XPwm_rgb_Initialize(XPwm_rgb *InstancePtr, u16 DeviceId);
XPwm_rgb_Config* XPwm_rgb_LookupConfig(u16 DeviceId);
int XPwm_rgb_CfgInitialize(XPwm_rgb *InstancePtr, XPwm_rgb_Config *ConfigPtr);
#else
int XPwm_rgb_Initialize(XPwm_rgb *InstancePtr, const char* InstanceName);
int XPwm_rgb_Release(XPwm_rgb *InstancePtr);
#endif

void XPwm_rgb_Start(XPwm_rgb *InstancePtr);
u32 XPwm_rgb_IsDone(XPwm_rgb *InstancePtr);
u32 XPwm_rgb_IsIdle(XPwm_rgb *InstancePtr);
u32 XPwm_rgb_IsReady(XPwm_rgb *InstancePtr);
void XPwm_rgb_EnableAutoRestart(XPwm_rgb *InstancePtr);
void XPwm_rgb_DisableAutoRestart(XPwm_rgb *InstancePtr);

void XPwm_rgb_Set_duty_r(XPwm_rgb *InstancePtr, u32 Data);
u32 XPwm_rgb_Get_duty_r(XPwm_rgb *InstancePtr);
void XPwm_rgb_Set_duty_g(XPwm_rgb *InstancePtr, u32 Data);
u32 XPwm_rgb_Get_duty_g(XPwm_rgb *InstancePtr);
void XPwm_rgb_Set_duty_b(XPwm_rgb *InstancePtr, u32 Data);
u32 XPwm_rgb_Get_duty_b(XPwm_rgb *InstancePtr);

void XPwm_rgb_InterruptGlobalEnable(XPwm_rgb *InstancePtr);
void XPwm_rgb_InterruptGlobalDisable(XPwm_rgb *InstancePtr);
void XPwm_rgb_InterruptEnable(XPwm_rgb *InstancePtr, u32 Mask);
void XPwm_rgb_InterruptDisable(XPwm_rgb *InstancePtr, u32 Mask);
void XPwm_rgb_InterruptClear(XPwm_rgb *InstancePtr, u32 Mask);
u32 XPwm_rgb_InterruptGetEnabled(XPwm_rgb *InstancePtr);
u32 XPwm_rgb_InterruptGetStatus(XPwm_rgb *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
