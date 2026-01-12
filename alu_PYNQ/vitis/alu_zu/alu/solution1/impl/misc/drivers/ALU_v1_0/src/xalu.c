// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2.2 (64-bit)
// Tool Version Limit: 2024.02
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xalu.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XAlu_CfgInitialize(XAlu *InstancePtr, XAlu_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAlu_Set_a(XAlu *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlu_WriteReg(InstancePtr->Control_BaseAddress, XALU_CONTROL_ADDR_A_DATA, Data);
}

u32 XAlu_Get_a(XAlu *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlu_ReadReg(InstancePtr->Control_BaseAddress, XALU_CONTROL_ADDR_A_DATA);
    return Data;
}

void XAlu_Set_b(XAlu *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlu_WriteReg(InstancePtr->Control_BaseAddress, XALU_CONTROL_ADDR_B_DATA, Data);
}

u32 XAlu_Get_b(XAlu *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlu_ReadReg(InstancePtr->Control_BaseAddress, XALU_CONTROL_ADDR_B_DATA);
    return Data;
}

void XAlu_Set_op(XAlu *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAlu_WriteReg(InstancePtr->Control_BaseAddress, XALU_CONTROL_ADDR_OP_DATA, Data);
}

u32 XAlu_Get_op(XAlu *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlu_ReadReg(InstancePtr->Control_BaseAddress, XALU_CONTROL_ADDR_OP_DATA);
    return Data;
}

u32 XAlu_Get_result(XAlu *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlu_ReadReg(InstancePtr->Control_BaseAddress, XALU_CONTROL_ADDR_RESULT_DATA);
    return Data;
}

u32 XAlu_Get_result_vld(XAlu *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAlu_ReadReg(InstancePtr->Control_BaseAddress, XALU_CONTROL_ADDR_RESULT_CTRL);
    return Data & 0x1;
}

