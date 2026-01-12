// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xlc3.h"

extern XLc3_Config XLc3_ConfigTable[];

#ifdef SDT
XLc3_Config *XLc3_LookupConfig(UINTPTR BaseAddress) {
	XLc3_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XLc3_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XLc3_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XLc3_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XLc3_Initialize(XLc3 *InstancePtr, UINTPTR BaseAddress) {
	XLc3_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XLc3_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XLc3_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XLc3_Config *XLc3_LookupConfig(u16 DeviceId) {
	XLc3_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XLC3_NUM_INSTANCES; Index++) {
		if (XLc3_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XLc3_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XLc3_Initialize(XLc3 *InstancePtr, u16 DeviceId) {
	XLc3_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XLc3_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XLc3_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

