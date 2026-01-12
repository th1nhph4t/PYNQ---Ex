// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xlc3.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XLc3_CfgInitialize(XLc3 *InstancePtr, XLc3_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XLc3_Set_IR(XLc3 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLc3_WriteReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_IR_DATA, Data);
}

u32 XLc3_Get_IR(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_IR_DATA);
    return Data;
}

void XLc3_Set_PC(XLc3 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLc3_WriteReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_PC_DATA, Data);
}

u32 XLc3_Get_PC(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_PC_DATA);
    return Data;
}

u32 XLc3_Get_PC_out(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_PC_OUT_DATA);
    return Data;
}

u32 XLc3_Get_PC_out_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_PC_OUT_CTRL);
    return Data & 0x1;
}

u32 XLc3_Get_R0(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R0_DATA);
    return Data;
}

u32 XLc3_Get_R0_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R0_CTRL);
    return Data & 0x1;
}

u32 XLc3_Get_R1(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R1_DATA);
    return Data;
}

u32 XLc3_Get_R1_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R1_CTRL);
    return Data & 0x1;
}

u32 XLc3_Get_R2(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R2_DATA);
    return Data;
}

u32 XLc3_Get_R2_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R2_CTRL);
    return Data & 0x1;
}

u32 XLc3_Get_R3(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R3_DATA);
    return Data;
}

u32 XLc3_Get_R3_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R3_CTRL);
    return Data & 0x1;
}

u32 XLc3_Get_R4(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R4_DATA);
    return Data;
}

u32 XLc3_Get_R4_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R4_CTRL);
    return Data & 0x1;
}

u32 XLc3_Get_R5(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R5_DATA);
    return Data;
}

u32 XLc3_Get_R5_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R5_CTRL);
    return Data & 0x1;
}

u32 XLc3_Get_R6(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R6_DATA);
    return Data;
}

u32 XLc3_Get_R6_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R6_CTRL);
    return Data & 0x1;
}

u32 XLc3_Get_R7(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R7_DATA);
    return Data;
}

u32 XLc3_Get_R7_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_R7_CTRL);
    return Data & 0x1;
}

u32 XLc3_Get_N(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_N_DATA);
    return Data;
}

u32 XLc3_Get_N_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_N_CTRL);
    return Data & 0x1;
}

u32 XLc3_Get_Z(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_Z_DATA);
    return Data;
}

u32 XLc3_Get_Z_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_Z_CTRL);
    return Data & 0x1;
}

u32 XLc3_Get_P(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_P_DATA);
    return Data;
}

u32 XLc3_Get_P_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_P_CTRL);
    return Data & 0x1;
}

u32 XLc3_Get_n1(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_N1_DATA);
    return Data;
}

u32 XLc3_Get_n1_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_N1_CTRL);
    return Data & 0x1;
}

u32 XLc3_Get_p1(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_P1_DATA);
    return Data;
}

u32 XLc3_Get_p1_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_P1_CTRL);
    return Data & 0x1;
}

u32 XLc3_Get_z1(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_Z1_DATA);
    return Data;
}

u32 XLc3_Get_z1_vld(XLc3 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLc3_ReadReg(InstancePtr->Control_BaseAddress, XLC3_CONTROL_ADDR_Z1_CTRL);
    return Data & 0x1;
}

