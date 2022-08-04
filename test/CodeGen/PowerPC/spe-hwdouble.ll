; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs < %s -mtriple=powerpc-unknown-linux-gnu \
; RUN:          -mattr=+spe | FileCheck %s

define i32 @test_dasmconst(double %x) #0 {
; CHECK-LABEL: test_dasmconst:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    stwu 1, -16(1)
; CHECK-NEXT:    evmergelo 3, 3, 4
; CHECK-NEXT:    evstdd 3, 8(1)
; CHECK-NEXT:    #APP
; CHECK-NEXT:    efdctsi 3, 3
; CHECK-NEXT:    #NO_APP
; CHECK-NEXT:    addi 1, 1, 16
; CHECK-NEXT:    blr
entry:
  %x.addr = alloca double, align 8
  store double %x, double* %x.addr, align 8
  %0 = load double, double* %x.addr, align 8
  %1 = call i32 asm sideeffect "efdctsi $0, $1", "=d,d"(double %0)
  ret i32 %1
}
attributes #0 = { nounwind }
