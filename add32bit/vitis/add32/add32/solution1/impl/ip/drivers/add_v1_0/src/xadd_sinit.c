// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2.2 (64-bit)
// Tool Version Limit: 2024.02
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xadd.h"

extern XAdd_Config XAdd_ConfigTable[];

#ifdef SDT
XAdd_Config *XAdd_LookupConfig(UINTPTR BaseAddress) {
	XAdd_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XAdd_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XAdd_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XAdd_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAdd_Initialize(XAdd *InstancePtr, UINTPTR BaseAddress) {
	XAdd_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAdd_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAdd_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XAdd_Config *XAdd_LookupConfig(u16 DeviceId) {
	XAdd_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XADD_NUM_INSTANCES; Index++) {
		if (XAdd_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAdd_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAdd_Initialize(XAdd *InstancePtr, u16 DeviceId) {
	XAdd_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAdd_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAdd_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

