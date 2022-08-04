; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-linux        | FileCheck %s
; RUN: llc < %s -mtriple=x86_64-linux-gnux32 | FileCheck %s
; RUN: llc < %s -mtriple=x86_64-nacl         | FileCheck %s
; RUN: llc < %s -mtriple=x86_64-win32        | FileCheck %s --check-prefix=WIN32

define i64 @test2(i64 %a) {
; CHECK-LABEL: test2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    leaq (,%rdi,4), %rax
; CHECK-NEXT:    orq %rdi, %rax
; CHECK-NEXT:    retq
;
; WIN32-LABEL: test2:
; WIN32:       # %bb.0:
; WIN32-NEXT:    leaq (,%rcx,4), %rax
; WIN32-NEXT:    orq %rcx, %rax
; WIN32-NEXT:    retq
  %tmp2 = shl i64 %a, 2
	%tmp3 = or i64 %tmp2, %a
  ret i64 %tmp3
}

define i32 @test(i32 %a) {
; CHECK-LABEL: test:
; CHECK:       # %bb.0:
; CHECK-NEXT:    # kill: def $edi killed $edi def $rdi
; CHECK-NEXT:    leal (%rdi,%rdi,2), %eax
; CHECK-NEXT:    retq
;
; WIN32-LABEL: test:
; WIN32:       # %bb.0:
; WIN32-NEXT:    # kill: def $ecx killed $ecx def $rcx
; WIN32-NEXT:    leal (%rcx,%rcx,2), %eax
; WIN32-NEXT:    retq
  %tmp2 = mul i32 %a, 3
  ret i32 %tmp2
}

define i64 @test3(i64 %a) {
; CHECK-LABEL: test3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    leaq (,%rdi,8), %rax
; CHECK-NEXT:    retq
;
; WIN32-LABEL: test3:
; WIN32:       # %bb.0:
; WIN32-NEXT:    leaq (,%rcx,8), %rax
; WIN32-NEXT:    retq
  %tmp2 = shl i64 %a, 3
  ret i64 %tmp2
}

