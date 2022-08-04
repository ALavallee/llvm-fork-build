; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+experimental-zbf -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV32ZBF

declare i32 @llvm.riscv.bfp.i32(i32 %a, i32 %b)

define i32 @bfp32(i32 %a, i32 %b) nounwind {
; RV32ZBF-LABEL: bfp32:
; RV32ZBF:       # %bb.0:
; RV32ZBF-NEXT:    bfp a0, a0, a1
; RV32ZBF-NEXT:    ret
  %tmp = call i32 @llvm.riscv.bfp.i32(i32 %a, i32 %b)
 ret i32 %tmp
}
