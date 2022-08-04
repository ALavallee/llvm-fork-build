; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -max-registers-for-gc-values=256 -verify-machineinstrs < %s | FileCheck %s

target datalayout = "e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-win64"

declare void @foo()
declare void @bar(i64)

define void @test(i8 addrspace(1)* %b) gc "statepoint-example" {
; CHECK-LABEL: test:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    pushq %rbp
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    pushq %r15
; CHECK-NEXT:    .cfi_def_cfa_offset 24
; CHECK-NEXT:    pushq %r14
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    pushq %r13
; CHECK-NEXT:    .cfi_def_cfa_offset 40
; CHECK-NEXT:    pushq %r12
; CHECK-NEXT:    .cfi_def_cfa_offset 48
; CHECK-NEXT:    pushq %rbx
; CHECK-NEXT:    .cfi_def_cfa_offset 56
; CHECK-NEXT:    subq $24, %rsp
; CHECK-NEXT:    .cfi_def_cfa_offset 80
; CHECK-NEXT:    .cfi_offset %rbx, -56
; CHECK-NEXT:    .cfi_offset %r12, -48
; CHECK-NEXT:    .cfi_offset %r13, -40
; CHECK-NEXT:    .cfi_offset %r14, -32
; CHECK-NEXT:    .cfi_offset %r15, -24
; CHECK-NEXT:    .cfi_offset %rbp, -16
; CHECK-NEXT:    movq (%rdi), %r14
; CHECK-NEXT:    movq 8(%rdi), %rax
; CHECK-NEXT:    movq %rax, {{[-0-9]+}}(%r{{[sb]}}p) # 8-byte Spill
; CHECK-NEXT:    movq 16(%rdi), %r15
; CHECK-NEXT:    movq 24(%rdi), %r12
; CHECK-NEXT:    movq 32(%rdi), %r13
; CHECK-NEXT:    movq 40(%rdi), %rbx
; CHECK-NEXT:    movq 48(%rdi), %rbp
; CHECK-NEXT:    movq %r14, {{[-0-9]+}}(%r{{[sb]}}p) # 8-byte Spill
; CHECK-NEXT:    callq foo@PLT # 8-byte Folded Reload
; CHECK-NEXT:  .Ltmp0:
; CHECK-NEXT:    movq {{[-0-9]+}}(%r{{[sb]}}p), %r14 # 8-byte Reload
; CHECK-NEXT:    movq %rbp, %rdi
; CHECK-NEXT:    callq bar@PLT
; CHECK-NEXT:    movq %rbx, %rdi
; CHECK-NEXT:    callq bar@PLT
; CHECK-NEXT:    movq %r13, %rdi
; CHECK-NEXT:    callq bar@PLT
; CHECK-NEXT:    movq %r12, %rdi
; CHECK-NEXT:    callq bar@PLT
; CHECK-NEXT:    movq %r15, %rdi
; CHECK-NEXT:    callq bar@PLT
; CHECK-NEXT:    movq {{[-0-9]+}}(%r{{[sb]}}p), %rdi # 8-byte Reload
; CHECK-NEXT:    callq bar@PLT
; CHECK-NEXT:    addq $24, %rsp
; CHECK-NEXT:    .cfi_def_cfa_offset 56
; CHECK-NEXT:    popq %rbx
; CHECK-NEXT:    .cfi_def_cfa_offset 48
; CHECK-NEXT:    popq %r12
; CHECK-NEXT:    .cfi_def_cfa_offset 40
; CHECK-NEXT:    popq %r13
; CHECK-NEXT:    .cfi_def_cfa_offset 32
; CHECK-NEXT:    popq %r14
; CHECK-NEXT:    .cfi_def_cfa_offset 24
; CHECK-NEXT:    popq %r15
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    popq %rbp
; CHECK-NEXT:    .cfi_def_cfa_offset 8
; CHECK-NEXT:    retq
entry:
  %p.64.p = bitcast i8 addrspace(1)* %b to i8 addrspace(1)* addrspace(1)*
  %p = load i8 addrspace(1)*, i8 addrspace(1)* addrspace(1)* %p.64.p
  %p.64 = bitcast i8 addrspace(1)* %b to i64 addrspace(1)*
  %a6.ptr = getelementptr i64, i64 addrspace(1)* %p.64, i64 1
  %a6 = load i64, i64 addrspace(1)* %a6.ptr
  %a5.ptr = getelementptr i64, i64 addrspace(1)* %p.64, i64 2
  %a5 = load i64, i64 addrspace(1)* %a5.ptr
  %a4.ptr = getelementptr i64, i64 addrspace(1)* %p.64, i64 3
  %a4 = load i64, i64 addrspace(1)* %a4.ptr
  %a3.ptr = getelementptr i64, i64 addrspace(1)* %p.64, i64 4
  %a3 = load i64, i64 addrspace(1)* %a3.ptr
  %a2.ptr = getelementptr i64, i64 addrspace(1)* %p.64, i64 5
  %a2 = load i64, i64 addrspace(1)* %a2.ptr
  %a1.ptr = getelementptr i64, i64 addrspace(1)* %p.64, i64 6
  %a1 = load i64, i64 addrspace(1)* %a1.ptr
  %token = call token (i64, i32, void ()*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 0, i32 0, void ()* @foo, i32 0, i32 0, i32 0, i32 0) ["deopt" (i8 addrspace(1)* %p)]
  call void @bar(i64 %a1)
  call void @bar(i64 %a2)
  call void @bar(i64 %a3)
  call void @bar(i64 %a4)
  call void @bar(i64 %a5)
  call void @bar(i64 %a6)
  ret void
}

declare token @llvm.experimental.gc.statepoint.p0f_isVoidf(i64, i32, void ()*, i32, i32, ...)
declare i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token, i32, i32)

