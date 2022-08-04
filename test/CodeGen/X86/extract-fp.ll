; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-- -mattr=+sse2  | FileCheck %s

define float @ext_fadd_v4f32(<4 x float> %x) {
; CHECK-LABEL: ext_fadd_v4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movhlps {{.*#+}} xmm0 = xmm0[1,1]
; CHECK-NEXT:    addss {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; CHECK-NEXT:    retq
  %bo = fadd <4 x float> %x, <float 1.0, float 2.0, float 3.0, float 42.0>
  %ext = extractelement <4 x float> %bo, i32 2
  ret float %ext
}

define float @ext_fsub_v4f32(<4 x float> %x) {
; CHECK-LABEL: ext_fsub_v4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    shufps {{.*#+}} xmm0 = xmm0[1,1,1,1]
; CHECK-NEXT:    movss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; CHECK-NEXT:    subss %xmm0, %xmm1
; CHECK-NEXT:    movaps %xmm1, %xmm0
; CHECK-NEXT:    retq
  %bo = fsub <4 x float> <float 1.0, float 2.0, float 3.0, float 42.0>, %x
  %ext = extractelement <4 x float> %bo, i32 1
  ret float %ext
}

define float @ext_fmul_v4f32(<4 x float> %x) {
; CHECK-LABEL: ext_fmul_v4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    shufps {{.*#+}} xmm0 = xmm0[3,3,3,3]
; CHECK-NEXT:    mulss {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; CHECK-NEXT:    retq
  %bo = fmul <4 x float> %x, <float 1.0, float 2.0, float 3.0, float 42.0>
  %ext = extractelement <4 x float> %bo, i32 3
  ret float %ext
}

; X / 1.0 --> X

define float @ext_fdiv_v4f32(<4 x float> %x) {
; CHECK-LABEL: ext_fdiv_v4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    retq
  %bo = fdiv <4 x float> %x, <float 1.0, float 2.0, float 3.0, float 42.0>
  %ext = extractelement <4 x float> %bo, i32 0
  ret float %ext
}

define float @ext_fdiv_v4f32_constant_op0(<4 x float> %x) {
; CHECK-LABEL: ext_fdiv_v4f32_constant_op0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    shufps {{.*#+}} xmm0 = xmm0[1,1,1,1]
; CHECK-NEXT:    movss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; CHECK-NEXT:    divss %xmm0, %xmm1
; CHECK-NEXT:    movaps %xmm1, %xmm0
; CHECK-NEXT:    retq
  %bo = fdiv <4 x float> <float 1.0, float 2.0, float 3.0, float 42.0>, %x
  %ext = extractelement <4 x float> %bo, i32 1
  ret float %ext
}

define float @ext_frem_v4f32(<4 x float> %x) {
; CHECK-LABEL: ext_frem_v4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movhlps {{.*#+}} xmm0 = xmm0[1,1]
; CHECK-NEXT:    movss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; CHECK-NEXT:    jmp fmodf@PLT # TAILCALL
  %bo = frem <4 x float> %x, <float 1.0, float 2.0, float 3.0, float 42.0>
  %ext = extractelement <4 x float> %bo, i32 2
  ret float %ext
}

define float @ext_frem_v4f32_constant_op0(<4 x float> %x) {
; CHECK-LABEL: ext_frem_v4f32_constant_op0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movaps %xmm0, %xmm1
; CHECK-NEXT:    shufps {{.*#+}} xmm1 = xmm1[1,1],xmm0[1,1]
; CHECK-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; CHECK-NEXT:    jmp fmodf@PLT # TAILCALL
  %bo = frem <4 x float> <float 1.0, float 2.0, float 3.0, float 42.0>, %x
  %ext = extractelement <4 x float> %bo, i32 1
  ret float %ext
}

define float @ext_maxnum_v4f32(<4 x float> %x) nounwind {
; CHECK-LABEL: ext_maxnum_v4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movhlps {{.*#+}} xmm0 = xmm0[1,1]
; CHECK-NEXT:    maxss {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; CHECK-NEXT:    retq
  %v = call <4 x float> @llvm.maxnum.v4f32(<4 x float> %x, <4 x float> <float 0.0, float 1.0, float 2.0, float 3.0>)
  %r = extractelement <4 x float> %v, i32 2
  ret float %r
}

define double @ext_minnum_v2f64(<2 x double> %x) nounwind {
; CHECK-LABEL: ext_minnum_v2f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    unpckhpd {{.*#+}} xmm0 = xmm0[1,1]
; CHECK-NEXT:    minsd {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; CHECK-NEXT:    retq
  %v = call <2 x double> @llvm.minnum.v2f64(<2 x double> <double 0.0, double 1.0>, <2 x double> %x)
  %r = extractelement <2 x double> %v, i32 1
  ret double %r
}

;define double @ext_maximum_v4f64(<2 x double> %x) nounwind {
;  %v = call <2 x double> @llvm.maximum.v2f64(<2 x double> %x, <2 x double> <double 42.0, double 43.0>)
;  %r = extractelement <2 x double> %v, i32 1
;  ret double %r
;}

;define float @ext_minimum_v4f32(<4 x float> %x) nounwind {
;  %v = call <4 x float> @llvm.minimum.v4f32(<4 x float> %x, <4 x float> <float 0.0, float 1.0, float 2.0, float 42.0>)
;  %r = extractelement <4 x float> %v, i32 1
;  ret float %r
;}

declare <4 x float> @llvm.maxnum.v4f32(<4 x float>, <4 x float>)
declare <2 x double> @llvm.minnum.v2f64(<2 x double>, <2 x double>)
