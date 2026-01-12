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
#include "xalu.h"

extern XAlu_Config XAlu_ConfigTable[];

#ifdef SDT
XAlu_Config *XAlu_LookupConfig(UINTPTR BaseAddress) {
	XAlu_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XAlu_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XAlu_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XAlu_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAlu_Initialize(XAlu *InstancePtr, UINTPTR BaseAddress) {
	XAlu_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAlu_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAlu_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XAlu_Config *XAlu_LookupConfig(u16 DeviceId) {
	XAlu_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XALU_NUM_INSTANCES; Index++) {
		if (XAlu_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAlu_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAlu_Initialize(XAlu *InstancePtr, u16 DeviceId) {
	XAlu_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAlu_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAlu_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

