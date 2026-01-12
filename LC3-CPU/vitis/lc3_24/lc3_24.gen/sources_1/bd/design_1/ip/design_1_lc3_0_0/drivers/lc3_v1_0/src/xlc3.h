// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XLC3_H
#define XLC3_H

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
#include "xlc3_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XLc3_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XLc3;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XLc3_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XLc3_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XLc3_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XLc3_ReadReg(BaseAddress, RegOffset) \
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
#ifdef SDT
int XLc3_Initialize(XLc3 *InstancePtr, UINTPTR BaseAddress);
XLc3_Config* XLc3_LookupConfig(UINTPTR BaseAddress);
#else
int XLc3_Initialize(XLc3 *InstancePtr, u16 DeviceId);
XLc3_Config* XLc3_LookupConfig(u16 DeviceId);
#endif
int XLc3_CfgInitialize(XLc3 *InstancePtr, XLc3_Config *ConfigPtr);
#else
int XLc3_Initialize(XLc3 *InstancePtr, const char* InstanceName);
int XLc3_Release(XLc3 *InstancePtr);
#endif


void XLc3_Set_IR(XLc3 *InstancePtr, u32 Data);
u32 XLc3_Get_IR(XLc3 *InstancePtr);
void XLc3_Set_PC(XLc3 *InstancePtr, u32 Data);
u32 XLc3_Get_PC(XLc3 *InstancePtr);
u32 XLc3_Get_PC_out(XLc3 *InstancePtr);
u32 XLc3_Get_PC_out_vld(XLc3 *InstancePtr);
u32 XLc3_Get_R0(XLc3 *InstancePtr);
u32 XLc3_Get_R0_vld(XLc3 *InstancePtr);
u32 XLc3_Get_R1(XLc3 *InstancePtr);
u32 XLc3_Get_R1_vld(XLc3 *InstancePtr);
u32 XLc3_Get_R2(XLc3 *InstancePtr);
u32 XLc3_Get_R2_vld(XLc3 *InstancePtr);
u32 XLc3_Get_R3(XLc3 *InstancePtr);
u32 XLc3_Get_R3_vld(XLc3 *InstancePtr);
u32 XLc3_Get_R4(XLc3 *InstancePtr);
u32 XLc3_Get_R4_vld(XLc3 *InstancePtr);
u32 XLc3_Get_R5(XLc3 *InstancePtr);
u32 XLc3_Get_R5_vld(XLc3 *InstancePtr);
u32 XLc3_Get_R6(XLc3 *InstancePtr);
u32 XLc3_Get_R6_vld(XLc3 *InstancePtr);
u32 XLc3_Get_R7(XLc3 *InstancePtr);
u32 XLc3_Get_R7_vld(XLc3 *InstancePtr);
u32 XLc3_Get_N(XLc3 *InstancePtr);
u32 XLc3_Get_N_vld(XLc3 *InstancePtr);
u32 XLc3_Get_Z(XLc3 *InstancePtr);
u32 XLc3_Get_Z_vld(XLc3 *InstancePtr);
u32 XLc3_Get_P(XLc3 *InstancePtr);
u32 XLc3_Get_P_vld(XLc3 *InstancePtr);
u32 XLc3_Get_n1(XLc3 *InstancePtr);
u32 XLc3_Get_n1_vld(XLc3 *InstancePtr);
u32 XLc3_Get_p1(XLc3 *InstancePtr);
u32 XLc3_Get_p1_vld(XLc3 *InstancePtr);
u32 XLc3_Get_z1(XLc3 *InstancePtr);
u32 XLc3_Get_z1_vld(XLc3 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
