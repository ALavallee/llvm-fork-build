; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; All of these ands and shifts should be folded into rlw[i]nm instructions
; RUN: llc < %s -verify-machineinstrs -mtriple=ppc32-- | FileCheck %s

define i32 @test1(i32 %X, i32 %Y) {
; CHECK-LABEL: test1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    rlwnm 3, 3, 4, 25, 31
; CHECK-NEXT:    blr
entry:
	%tmp = trunc i32 %Y to i8		; <i8> [#uses=2]
	%tmp1 = shl i32 %X, %Y		; <i32> [#uses=1]
	%tmp2 = sub i32 32, %Y		; <i8> [#uses=1]
	%tmp3 = lshr i32 %X, %tmp2		; <i32> [#uses=1]
	%tmp4 = or i32 %tmp1, %tmp3		; <i32> [#uses=1]
	%tmp6 = and i32 %tmp4, 127		; <i32> [#uses=1]
	ret i32 %tmp6
}

define i32 @test2(i32 %X) {
; CHECK-LABEL: test2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    rlwinm 3, 3, 5, 25, 31
; CHECK-NEXT:    blr
entry:
	%tmp1 = lshr i32 %X, 27		; <i32> [#uses=1]
	%tmp2 = shl i32 %X, 5		; <i32> [#uses=1]
	%tmp2.masked = and i32 %tmp2, 96		; <i32> [#uses=1]
	%tmp5 = or i32 %tmp1, %tmp2.masked		; <i32> [#uses=1]
	ret i32 %tmp5
}
