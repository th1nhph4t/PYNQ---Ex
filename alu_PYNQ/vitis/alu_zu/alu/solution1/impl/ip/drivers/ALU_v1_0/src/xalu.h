// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2.2 (64-bit)
// Tool Version Limit: 2024.02
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XALU_H
#define XALU_H

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
#include "xalu_hw.h"

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
} XAlu_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XAlu;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XAlu_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XAlu_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XAlu_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XAlu_ReadReg(BaseAddress, RegOffset) \
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
int XAlu_Initialize(XAlu *InstancePtr, UINTPTR BaseAddress);
XAlu_Config* XAlu_LookupConfig(UINTPTR BaseAddress);
#else
int XAlu_Initialize(XAlu *InstancePtr, u16 DeviceId);
XAlu_Config* XAlu_LookupConfig(u16 DeviceId);
#endif
int XAlu_CfgInitialize(XAlu *InstancePtr, XAlu_Config *ConfigPtr);
#else
int XAlu_Initialize(XAlu *InstancePtr, const char* InstanceName);
int XAlu_Release(XAlu *InstancePtr);
#endif


void XAlu_Set_a(XAlu *InstancePtr, u32 Data);
u32 XAlu_Get_a(XAlu *InstancePtr);
void XAlu_Set_b(XAlu *InstancePtr, u32 Data);
u32 XAlu_Get_b(XAlu *InstancePtr);
void XAlu_Set_op(XAlu *InstancePtr, u32 Data);
u32 XAlu_Get_op(XAlu *InstancePtr);
u32 XAlu_Get_result(XAlu *InstancePtr);
u32 XAlu_Get_result_vld(XAlu *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
