# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2.2 (64-bit)
# Tool Version Limit: 2024.02
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
# 
# ==============================================================
cmake_minimum_required(VERSION 3.15)
project(ALU)
find_package(common)
collector_create (PROJECT_LIB_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}")
collect (PROJECT_LIB_SOURCES xalu.c)
collect (PROJECT_LIB_SOURCES xalu_sinit.c)
collect (PROJECT_LIB_SOURCES xalu_linux.c)
collect (PROJECT_LIB_SOURCES xalu_g.c)
collector_list (_sources PROJECT_LIB_SOURCES)
collector_create (PROJECT_LIB_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}")
collect (PROJECT_LIB_HEADERS xalu.h)
collect (PROJECT_LIB_HEADERS xalu_hw.h)
collector_list (_headers PROJECT_LIB_HEADERS)
file(COPY ${_headers} DESTINATION ${CMAKE_BINARY_DIR}/include)
include_directories(${CMAKE_BINARY_DIR}/include)
add_library(ALU STATIC ${_sources})
set_target_properties(ALU PROPERTIES LINKER_LANGUAGE C)

