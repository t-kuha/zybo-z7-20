// ==============================================================
// File generated on Fri Apr 05 10:23:22 +0900 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xpwm_rgb.h"

extern XPwm_rgb_Config XPwm_rgb_ConfigTable[];

XPwm_rgb_Config *XPwm_rgb_LookupConfig(u16 DeviceId) {
	XPwm_rgb_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XPWM_RGB_NUM_INSTANCES; Index++) {
		if (XPwm_rgb_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XPwm_rgb_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XPwm_rgb_Initialize(XPwm_rgb *InstancePtr, u16 DeviceId) {
	XPwm_rgb_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XPwm_rgb_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XPwm_rgb_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

