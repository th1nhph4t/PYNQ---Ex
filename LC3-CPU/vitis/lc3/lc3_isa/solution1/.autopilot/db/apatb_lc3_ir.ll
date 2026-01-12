; ModuleID = 'D:/LVTN/lc3/lc3_isa/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline willreturn
define void @apatb_lc3_ir(i16 signext %IR, i16 signext %PC, i16* noalias nocapture nonnull dereferenceable(2) %PC_out, i16* noalias nocapture nonnull dereferenceable(2) %R0, i16* noalias nocapture nonnull dereferenceable(2) %R1, i16* noalias nocapture nonnull dereferenceable(2) %R2, i16* noalias nocapture nonnull dereferenceable(2) %R3, i16* noalias nocapture nonnull dereferenceable(2) %R4, i16* noalias nocapture nonnull dereferenceable(2) %R5, i16* noalias nocapture nonnull dereferenceable(2) %R6, i16* noalias nocapture nonnull dereferenceable(2) %R7, i16* noalias nocapture nonnull dereferenceable(2) %N, i16* noalias nocapture nonnull dereferenceable(2) %Z, i16* noalias nocapture nonnull dereferenceable(2) %P, i16* noalias nocapture nonnull dereferenceable(2) %n1, i16* noalias nocapture nonnull dereferenceable(2) %p1, i16* noalias nocapture nonnull dereferenceable(2) %z1) local_unnamed_addr #0 {
entry:
  %PC_out_copy = alloca i16, align 512
  %R0_copy = alloca i16, align 512
  %R1_copy = alloca i16, align 512
  %R2_copy = alloca i16, align 512
  %R3_copy = alloca i16, align 512
  %R4_copy = alloca i16, align 512
  %R5_copy = alloca i16, align 512
  %R6_copy = alloca i16, align 512
  %R7_copy = alloca i16, align 512
  %N_copy = alloca i16, align 512
  %Z_copy = alloca i16, align 512
  %P_copy = alloca i16, align 512
  %n1_copy = alloca i16, align 512
  %p1_copy = alloca i16, align 512
  %z1_copy = alloca i16, align 512
  call fastcc void @copy_in(i16* nonnull %PC_out, i16* nonnull align 512 %PC_out_copy, i16* nonnull %R0, i16* nonnull align 512 %R0_copy, i16* nonnull %R1, i16* nonnull align 512 %R1_copy, i16* nonnull %R2, i16* nonnull align 512 %R2_copy, i16* nonnull %R3, i16* nonnull align 512 %R3_copy, i16* nonnull %R4, i16* nonnull align 512 %R4_copy, i16* nonnull %R5, i16* nonnull align 512 %R5_copy, i16* nonnull %R6, i16* nonnull align 512 %R6_copy, i16* nonnull %R7, i16* nonnull align 512 %R7_copy, i16* nonnull %N, i16* nonnull align 512 %N_copy, i16* nonnull %Z, i16* nonnull align 512 %Z_copy, i16* nonnull %P, i16* nonnull align 512 %P_copy, i16* nonnull %n1, i16* nonnull align 512 %n1_copy, i16* nonnull %p1, i16* nonnull align 512 %p1_copy, i16* nonnull %z1, i16* nonnull align 512 %z1_copy)
  call void @apatb_lc3_hw(i16 %IR, i16 %PC, i16* %PC_out_copy, i16* %R0_copy, i16* %R1_copy, i16* %R2_copy, i16* %R3_copy, i16* %R4_copy, i16* %R5_copy, i16* %R6_copy, i16* %R7_copy, i16* %N_copy, i16* %Z_copy, i16* %P_copy, i16* %n1_copy, i16* %p1_copy, i16* %z1_copy)
  call void @copy_back(i16* %PC_out, i16* %PC_out_copy, i16* %R0, i16* %R0_copy, i16* %R1, i16* %R1_copy, i16* %R2, i16* %R2_copy, i16* %R3, i16* %R3_copy, i16* %R4, i16* %R4_copy, i16* %R5, i16* %R5_copy, i16* %R6, i16* %R6_copy, i16* %R7, i16* %R7_copy, i16* %N, i16* %N_copy, i16* %Z, i16* %Z_copy, i16* %P, i16* %P_copy, i16* %n1, i16* %n1_copy, i16* %p1, i16* %p1_copy, i16* %z1, i16* %z1_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in(i16* noalias readonly, i16* noalias align 512, i16* noalias readonly, i16* noalias align 512, i16* noalias readonly, i16* noalias align 512, i16* noalias readonly, i16* noalias align 512, i16* noalias readonly, i16* noalias align 512, i16* noalias readonly, i16* noalias align 512, i16* noalias readonly, i16* noalias align 512, i16* noalias readonly, i16* noalias align 512, i16* noalias readonly, i16* noalias align 512, i16* noalias readonly, i16* noalias align 512, i16* noalias readonly, i16* noalias align 512, i16* noalias readonly, i16* noalias align 512, i16* noalias readonly, i16* noalias align 512, i16* noalias readonly, i16* noalias align 512, i16* noalias readonly, i16* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %1, i16* %0)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %3, i16* %2)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %5, i16* %4)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %7, i16* %6)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %9, i16* %8)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %11, i16* %10)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %13, i16* %12)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %15, i16* %14)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %17, i16* %16)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %19, i16* %18)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %21, i16* %20)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %23, i16* %22)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %25, i16* %24)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %27, i16* %26)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %29, i16* %28)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0i16(i16* noalias align 512 %dst, i16* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq i16* %dst, null
  %1 = icmp eq i16* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %3 = load i16, i16* %src, align 2
  store i16 %3, i16* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out(i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0i16(i16* %0, i16* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %2, i16* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %4, i16* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %6, i16* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %8, i16* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %10, i16* align 512 %11)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %12, i16* align 512 %13)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %14, i16* align 512 %15)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %16, i16* align 512 %17)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %18, i16* align 512 %19)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %20, i16* align 512 %21)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %22, i16* align 512 %23)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %24, i16* align 512 %25)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %26, i16* align 512 %27)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %28, i16* align 512 %29)
  ret void
}

declare void @apatb_lc3_hw(i16, i16, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back(i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0i16(i16* %0, i16* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %2, i16* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %4, i16* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %6, i16* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %8, i16* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %10, i16* align 512 %11)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %12, i16* align 512 %13)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %14, i16* align 512 %15)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %16, i16* align 512 %17)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %18, i16* align 512 %19)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %20, i16* align 512 %21)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %22, i16* align 512 %23)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %24, i16* align 512 %25)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %26, i16* align 512 %27)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %28, i16* align 512 %29)
  ret void
}

define void @lc3_hw_stub_wrapper(i16, i16, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*) #4 {
entry:
  call void @copy_out(i16* null, i16* %2, i16* null, i16* %3, i16* null, i16* %4, i16* null, i16* %5, i16* null, i16* %6, i16* null, i16* %7, i16* null, i16* %8, i16* null, i16* %9, i16* null, i16* %10, i16* null, i16* %11, i16* null, i16* %12, i16* null, i16* %13, i16* null, i16* %14, i16* null, i16* %15, i16* null, i16* %16)
  call void @lc3_hw_stub(i16 %0, i16 %1, i16* %2, i16* %3, i16* %4, i16* %5, i16* %6, i16* %7, i16* %8, i16* %9, i16* %10, i16* %11, i16* %12, i16* %13, i16* %14, i16* %15, i16* %16)
  call void @copy_in(i16* null, i16* %2, i16* null, i16* %3, i16* null, i16* %4, i16* null, i16* %5, i16* null, i16* %6, i16* null, i16* %7, i16* null, i16* %8, i16* null, i16* %9, i16* null, i16* %10, i16* null, i16* %11, i16* null, i16* %12, i16* null, i16* %13, i16* null, i16* %14, i16* null, i16* %15, i16* null, i16* %16)
  ret void
}

declare void @lc3_hw_stub(i16, i16, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*)

attributes #0 = { noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
