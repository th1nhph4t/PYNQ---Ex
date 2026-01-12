# 1 "lc3.cpp"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 396 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "F:/Vitis_HLS/2023.2/common/technology/autopilot\\etc/autopilot_ssdm_op.h" 1
# 105 "F:/Vitis_HLS/2023.2/common/technology/autopilot\\etc/autopilot_ssdm_op.h"
extern "C" {






    void _ssdm_op_IfRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_IfWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_StreamRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_StreamWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned _ssdm_StreamSize(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_ReadReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Read(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_WriteReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Write(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbReadReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_CanReadReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbWriteReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_CanWriteReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));




    void _ssdm_op_MemShiftRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_PrintNone(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_PrintInt(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_PrintDouble(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_Wait(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Poll(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_Return(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_op_SpecSynModule(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecTopModule(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProcessDecl(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProcessDef(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPort(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecConnection(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecChannel(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecSensitive(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecModuleInst(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPortMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecReset(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPlatform(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecClockDomain(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPowerDomain(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    int _ssdm_op_SpecRegionBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    int _ssdm_op_SpecRegionEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecLoopName(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecLoopTripCount(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    int _ssdm_op_SpecStateBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    int _ssdm_op_SpecStateEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecInterface(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPipeline(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecDataflowPipeline(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_op_SpecLatency(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecParallel(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProtocol(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecOccurrence(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecResource(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecResourceLimit(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecCHCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecFUCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecIFCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecIPCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecMemCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecExt(...) __attribute__ ((nothrow)) __attribute__((overloadable));




    void _ssdm_SpecArrayDimSize(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_RegionBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_RegionEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_Unroll(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_UnrollRegion(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_InlineAll(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineLoop(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_Inline(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineSelf(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineRegion(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecArrayMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecArrayPartition(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecArrayReshape(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecStream(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecStable(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecStableContent(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecBindPort(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPipoDepth(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecExpr(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecExprBalance(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecDependence(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecLoopMerge(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecLoopFlatten(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecLoopRewind(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecFuncInstantiation(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecFuncBuffer(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecFuncExtract(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecConstant(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_DataPack(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecDataPack(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecBitsMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecLicense(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void __xilinx_ip_top(...) __attribute__ ((nothrow)) __attribute__((overloadable));


}
# 2 "<built-in>" 2
# 1 "lc3.cpp" 2
__attribute__((sdx_kernel("lc3", 0))) void lc3(short IR, short PC, short& PC_out, short& R0, short& R1, short& R2, short& R3, short& R4, short& R5, short& R6, short& R7,short& N, short& Z, short& P, short& n1, short& p1, short& z1) {
#line 15 "D:/LVTN/lc3/lc3_isa/solution1/csynth.tcl"
#pragma HLSDIRECTIVE TOP name=lc3
# 1 "lc3.cpp"

#line 7 "D:/LVTN/lc3/lc3_isa/solution1/directives.tcl"
#pragma HLSDIRECTIVE TOP name=lc3
# 1 "lc3.cpp"

#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE s_axilite port=IR
#pragma HLS INTERFACE s_axilite port=PC
#pragma HLS INTERFACE s_axilite port=PC_out
#pragma HLS INTERFACE s_axilite port=R0
#pragma HLS INTERFACE s_axilite port=R1
#pragma HLS INTERFACE s_axilite port=R2
#pragma HLS INTERFACE s_axilite port=R3
#pragma HLS INTERFACE s_axilite port=R4
#pragma HLS INTERFACE s_axilite port=R5
#pragma HLS INTERFACE s_axilite port=R6
#pragma HLS INTERFACE s_axilite port=R7
#pragma HLS INTERFACE s_axilite port=n1
#pragma HLS INTERFACE s_axilite port=z1
#pragma HLS INTERFACE s_axilite port=p1
#pragma HLS INTERFACE s_axilite port=N
#pragma HLS INTERFACE s_axilite port=Z
#pragma HLS INTERFACE s_axilite port=P

 static short reg[8];
 static short memory[65536];
 static int n;
 static int p;
 static int z;
 int OP;
 int PC1;
 int dr;
 int sr1;
 int sr2;
 int IR5;
 int pc_offset9;
 int pc_offset11;
 int pc_offset6;
 int imm5;
 int bit11;


 OP = (IR >> 12) & 0xf;



 switch (OP) {
  case 1:
   PC = PC + 1;
   imm5 = (IR & 0x1F);
   dr = (IR >> 9) & 0x7;
   sr1 = (IR >> 6) & 0x7;
   sr2 = (IR & 0x7);
   IR5 = (IR >> 5) & 0x1;
   if (IR5 == 1)
    reg[dr] = reg[sr1] + imm5;

   else
    reg[dr] = reg[sr1] + reg[sr2];

           if (reg[dr] == 0){
            z = 1;
            n = 0;
            p = 0;
           }else if(reg[dr] > 0){
            z = 0;
            n = 0;
            p = 1;
           }else {
            z = 0;
            n = 1;
            p = 0;
           }

   break;
  case 5:
   PC = PC + 1;
   imm5 = (IR & 0x1F);
      dr = (IR >> 9) & 0x7;
      sr1 = (IR >> 6) & 0x7;
      sr2 = (IR & 0x7);
      IR5 = (IR >> 5) & 0x1;
   if (IR5 == 1)
    reg[dr] = reg[sr1] & imm5;

   else
    reg[dr] = reg[sr1] & reg[sr2];

           if (reg[dr] == 0){
            z = 1;
            n = 0;
            p = 0;
           }else if(reg[dr] > 0){
            z = 0;
            n = 0;
            p = 1;
           }else {
            z = 0;
            n = 1;
            p = 0;
           }

   break;
  case 9:
   PC = PC + 1;
   dr = (IR >> 9) & 0x7;
   sr1 = (IR >> 6) & 0x7;
   reg[dr] = ~reg[sr1];

           if (reg[dr] == 0){
            z = 1;
            n = 0;
            p = 0;
           }else if(reg[dr] > 0){
            z = 0;
            n = 0;
            p = 1;
           }else {
            z = 0;
            n = 1;
            p = 0;
           }

   break;
  case 2:
   PC = PC + 1;
   dr = (IR >> 9) & 0x7;
   pc_offset9 = IR & 0x1FF;
   reg[dr] = memory[PC + 1 + pc_offset9];

           if (reg[dr] == 0){
            z = 1;
            n = 0;
            p = 0;
           }else if(reg[dr] > 0){
            z = 0;
            n = 0;
            p = 1;
           }else {
            z = 0;
            n = 1;
            p = 0;
           }

   break;
  case 10:
   PC = PC + 1;
   dr = (IR >> 9) & 0x7;
   pc_offset9 = IR & 0x1FF;
   reg[dr] = memory[memory[PC + 1 + pc_offset9]];

           if (reg[dr] == 0){
            z = 1;
            n = 0;
            p = 0;
           }else if(reg[dr] > 0){
            z = 0;
            n = 0;
            p = 1;
           }else {
            z = 0;
            n = 1;
            p = 0;
           }

   break;
  case 6:
   PC = PC + 1;
   dr = (IR >> 9) & 0x7;
   sr1 = (IR >> 6) & 0x7;
   pc_offset6 = (IR & 0x3F);
   reg[dr] = memory[reg[sr1] + pc_offset6];

           if (reg[dr] == 0){
            z = 1;
            n = 0;
            p = 0;
           }else if(reg[dr] > 0){
            z = 0;
            n = 0;
            p = 1;
           }else {
            z = 0;
            n = 1;
            p = 0;
           }

   break;
  case 14:
   PC = PC + 1;
   dr = (IR >> 9) & 0x7;
   pc_offset9 = (IR & 0x1FF);
   reg[dr] = PC + pc_offset9;

           if (reg[dr] == 0){
            z = 1;
            n = 0;
            p = 0;
           }else if(reg[dr] > 0){
            z = 0;
            n = 0;
            p = 1;
           }else {
            z = 0;
            n = 1;
            p = 0;
           }

   break;
  case 3:
   PC = PC + 1;
   sr1 = (IR >> 9) & 0x7;
   pc_offset9 = IR & 0x1FF;
   memory[PC + 1 + pc_offset9] = reg[sr1];

   break;
  case 11:
   PC = PC + 1;
   sr1 = (IR >> 9) & 0x7;
   pc_offset9 = IR & 0x1FF;
   memory[memory[PC + 1 + pc_offset9]] = reg[sr1];

   break;
  case 7:
   PC = PC + 1;
   sr1 = (IR >>9) & 0x7;
   dr = (IR >> 6) & 0x7;
   pc_offset6 = IR & 0x3F;
   memory[reg[dr] + pc_offset6] = reg[sr1];

   break;
  case 12:
   sr1 = (IR >> 6) & 0x7;
   PC1 = reg[sr1];
   break;
  case 4:
   reg [7] = PC;
   sr1 = (IR >> 6) & 0x7;
   bit11 = (IR >> 11) & 0x1;
   pc_offset11 = IR & 0x7FF;
   if (bit11 == 1)
    PC1 = PC + pc_offset11;
   else
    PC1 = reg[sr1];
   break;
  case 0:
   pc_offset9 = IR & 0x1FF;

   n1 = (IR >> 11) & 0x1;
   z1 = (IR >> 10) & 0x1;
   p1 = (IR >> 9) & 0x1;
   N = n & n1;
   P = p & p1;
   Z = z & z1;
   if (N == 1 || P == 1 || Z == 1)
    PC1 = PC + pc_offset9;
   else
    PC1 = PC + 1;
   break;


  default:
   break;

 }
   R0 = reg[0];
     R1 = reg[1];
     R2 = reg[2];
     R3 = reg[3];
     R4 = reg[4];
     R5 = reg[5];
     R6 = reg[6];
     R7 = reg[7];

     if (OP == 12 || OP == 4 || OP == 0)
      PC_out = PC1;

     else
      PC_out = PC;


}
