; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-- -mcpu=x86-64 | FileCheck %s

declare float @llvm.pow.f32(float, float)
declare <4 x float> @llvm.pow.v4f32(<4 x float>, <4 x float>)

declare double @llvm.pow.f64(double, double)
declare <2 x double> @llvm.pow.v2f64(<2 x double>, <2 x double>)

declare x86_fp80 @llvm.pow.f80(x86_fp80, x86_fp80)

define float @pow_f32_one_fourth_fmf_ieee(float %x) nounwind {
; CHECK-LABEL: pow_f32_one_fourth_fmf_ieee:
; CHECK:       # %bb.0:
; CHECK-NEXT:    rsqrtss %xmm0, %xmm1
; CHECK-NEXT:    movaps %xmm0, %xmm3
; CHECK-NEXT:    mulss %xmm1, %xmm3
; CHECK-NEXT:    movss {{.*#+}} xmm2 = mem[0],zero,zero,zero
; CHECK-NEXT:    movaps %xmm3, %xmm4
; CHECK-NEXT:    mulss %xmm2, %xmm4
; CHECK-NEXT:    mulss %xmm1, %xmm3
; CHECK-NEXT:    movss {{.*#+}} xmm5 = mem[0],zero,zero,zero
; CHECK-NEXT:    addss %xmm5, %xmm3
; CHECK-NEXT:    mulss %xmm4, %xmm3
; CHECK-NEXT:    movaps {{.*#+}} xmm1 = [NaN,NaN,NaN,NaN]
; CHECK-NEXT:    andps %xmm1, %xmm0
; CHECK-NEXT:    movss {{.*#+}} xmm4 = mem[0],zero,zero,zero
; CHECK-NEXT:    cmpltss %xmm4, %xmm0
; CHECK-NEXT:    andnps %xmm3, %xmm0
; CHECK-NEXT:    xorps %xmm3, %xmm3
; CHECK-NEXT:    rsqrtss %xmm0, %xmm3
; CHECK-NEXT:    andps %xmm0, %xmm1
; CHECK-NEXT:    mulss %xmm3, %xmm0
; CHECK-NEXT:    mulss %xmm0, %xmm2
; CHECK-NEXT:    mulss %xmm3, %xmm0
; CHECK-NEXT:    addss %xmm5, %xmm0
; CHECK-NEXT:    mulss %xmm2, %xmm0
; CHECK-NEXT:    cmpltss %xmm4, %xmm1
; CHECK-NEXT:    andnps %xmm0, %xmm1
; CHECK-NEXT:    movaps %xmm1, %xmm0
; CHECK-NEXT:    retq
  %r = call nsz ninf afn float @llvm.pow.f32(float %x, float 2.5e-01)
  ret float %r
}

define float @pow_f32_one_fourth_fmf_daz(float %x) #0 {
; CHECK-LABEL: pow_f32_one_fourth_fmf_daz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    rsqrtss %xmm0, %xmm1
; CHECK-NEXT:    movaps %xmm0, %xmm2
; CHECK-NEXT:    mulss %xmm1, %xmm2
; CHECK-NEXT:    movss {{.*#+}} xmm3 = mem[0],zero,zero,zero
; CHECK-NEXT:    movaps %xmm2, %xmm4
; CHECK-NEXT:    mulss %xmm3, %xmm4
; CHECK-NEXT:    mulss %xmm1, %xmm2
; CHECK-NEXT:    movss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; CHECK-NEXT:    addss %xmm1, %xmm2
; CHECK-NEXT:    mulss %xmm4, %xmm2
; CHECK-NEXT:    xorps %xmm4, %xmm4
; CHECK-NEXT:    cmpeqss %xmm4, %xmm0
; CHECK-NEXT:    andnps %xmm2, %xmm0
; CHECK-NEXT:    xorps %xmm2, %xmm2
; CHECK-NEXT:    rsqrtss %xmm0, %xmm2
; CHECK-NEXT:    movaps %xmm0, %xmm5
; CHECK-NEXT:    mulss %xmm2, %xmm5
; CHECK-NEXT:    mulss %xmm5, %xmm3
; CHECK-NEXT:    mulss %xmm2, %xmm5
; CHECK-NEXT:    addss %xmm1, %xmm5
; CHECK-NEXT:    mulss %xmm3, %xmm5
; CHECK-NEXT:    cmpeqss %xmm4, %xmm0
; CHECK-NEXT:    andnps %xmm5, %xmm0
; CHECK-NEXT:    retq
  %r = call nsz ninf afn float @llvm.pow.f32(float %x, float 2.5e-01)
  ret float %r
}

define double @pow_f64_one_fourth_fmf(double %x) nounwind {
; CHECK-LABEL: pow_f64_one_fourth_fmf:
; CHECK:       # %bb.0:
; CHECK-NEXT:    sqrtsd %xmm0, %xmm0
; CHECK-NEXT:    sqrtsd %xmm0, %xmm0
; CHECK-NEXT:    retq
  %r = call nsz ninf afn double @llvm.pow.f64(double %x, double 2.5e-01)
  ret double %r
}

define <4 x float> @pow_v4f32_one_fourth_fmf(<4 x float> %x) nounwind {
; CHECK-LABEL: pow_v4f32_one_fourth_fmf:
; CHECK:       # %bb.0:
; CHECK-NEXT:    rsqrtps %xmm0, %xmm1
; CHECK-NEXT:    movaps %xmm0, %xmm2
; CHECK-NEXT:    mulps %xmm1, %xmm2
; CHECK-NEXT:    movaps {{.*#+}} xmm3 = [-5.0E-1,-5.0E-1,-5.0E-1,-5.0E-1]
; CHECK-NEXT:    movaps %xmm2, %xmm4
; CHECK-NEXT:    mulps %xmm3, %xmm4
; CHECK-NEXT:    mulps %xmm1, %xmm2
; CHECK-NEXT:    movaps {{.*#+}} xmm5 = [-3.0E+0,-3.0E+0,-3.0E+0,-3.0E+0]
; CHECK-NEXT:    addps %xmm5, %xmm2
; CHECK-NEXT:    mulps %xmm4, %xmm2
; CHECK-NEXT:    movaps {{.*#+}} xmm4 = [NaN,NaN,NaN,NaN]
; CHECK-NEXT:    andps %xmm4, %xmm0
; CHECK-NEXT:    movaps {{.*#+}} xmm1 = [1.17549435E-38,1.17549435E-38,1.17549435E-38,1.17549435E-38]
; CHECK-NEXT:    movaps %xmm1, %xmm6
; CHECK-NEXT:    cmpleps %xmm0, %xmm6
; CHECK-NEXT:    andps %xmm2, %xmm6
; CHECK-NEXT:    rsqrtps %xmm6, %xmm0
; CHECK-NEXT:    movaps %xmm6, %xmm2
; CHECK-NEXT:    mulps %xmm0, %xmm2
; CHECK-NEXT:    mulps %xmm2, %xmm3
; CHECK-NEXT:    mulps %xmm0, %xmm2
; CHECK-NEXT:    addps %xmm5, %xmm2
; CHECK-NEXT:    mulps %xmm3, %xmm2
; CHECK-NEXT:    andps %xmm4, %xmm6
; CHECK-NEXT:    cmpleps %xmm6, %xmm1
; CHECK-NEXT:    andps %xmm2, %xmm1
; CHECK-NEXT:    movaps %xmm1, %xmm0
; CHECK-NEXT:    retq
  %r = call fast <4 x float> @llvm.pow.v4f32(<4 x float> %x, <4 x float> <float 2.5e-1, float 2.5e-1, float 2.5e-01, float 2.5e-01>)
  ret <4 x float> %r
}

define <2 x double> @pow_v2f64_one_fourth_fmf(<2 x double> %x) nounwind {
; CHECK-LABEL: pow_v2f64_one_fourth_fmf:
; CHECK:       # %bb.0:
; CHECK-NEXT:    sqrtpd %xmm0, %xmm0
; CHECK-NEXT:    sqrtpd %xmm0, %xmm0
; CHECK-NEXT:    retq
  %r = call fast <2 x double> @llvm.pow.v2f64(<2 x double> %x, <2 x double> <double 2.5e-1, double 2.5e-1>)
  ret <2 x double> %r
}

define float @pow_f32_one_fourth_not_enough_fmf(float %x) nounwind {
; CHECK-LABEL: pow_f32_one_fourth_not_enough_fmf:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; CHECK-NEXT:    jmp powf@PLT # TAILCALL
  %r = call afn ninf float @llvm.pow.f32(float %x, float 2.5e-01)
  ret float %r
}

define double @pow_f64_one_fourth_not_enough_fmf(double %x) nounwind {
; CHECK-LABEL: pow_f64_one_fourth_not_enough_fmf:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movsd {{.*#+}} xmm1 = mem[0],zero
; CHECK-NEXT:    jmp pow@PLT # TAILCALL
  %r = call nsz ninf double @llvm.pow.f64(double %x, double 2.5e-01)
  ret double %r
}

define <4 x float> @pow_v4f32_one_fourth_not_enough_fmf(<4 x float> %x) nounwind {
; CHECK-LABEL: pow_v4f32_one_fourth_not_enough_fmf:
; CHECK:       # %bb.0:
; CHECK-NEXT:    subq $56, %rsp
; CHECK-NEXT:    movaps %xmm0, {{[-0-9]+}}(%r{{[sb]}}p) # 16-byte Spill
; CHECK-NEXT:    shufps {{.*#+}} xmm0 = xmm0[3,3,3,3]
; CHECK-NEXT:    movss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; CHECK-NEXT:    callq powf@PLT
; CHECK-NEXT:    movaps %xmm0, (%rsp) # 16-byte Spill
; CHECK-NEXT:    movaps {{[-0-9]+}}(%r{{[sb]}}p), %xmm0 # 16-byte Reload
; CHECK-NEXT:    movhlps {{.*#+}} xmm0 = xmm0[1,1]
; CHECK-NEXT:    movss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; CHECK-NEXT:    callq powf@PLT
; CHECK-NEXT:    unpcklps (%rsp), %xmm0 # 16-byte Folded Reload
; CHECK-NEXT:    # xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
; CHECK-NEXT:    movaps %xmm0, (%rsp) # 16-byte Spill
; CHECK-NEXT:    movaps {{[-0-9]+}}(%r{{[sb]}}p), %xmm0 # 16-byte Reload
; CHECK-NEXT:    movss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; CHECK-NEXT:    callq powf@PLT
; CHECK-NEXT:    movaps %xmm0, {{[-0-9]+}}(%r{{[sb]}}p) # 16-byte Spill
; CHECK-NEXT:    movaps {{[-0-9]+}}(%r{{[sb]}}p), %xmm0 # 16-byte Reload
; CHECK-NEXT:    shufps {{.*#+}} xmm0 = xmm0[1,1,1,1]
; CHECK-NEXT:    movss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; CHECK-NEXT:    callq powf@PLT
; CHECK-NEXT:    movaps {{[-0-9]+}}(%r{{[sb]}}p), %xmm1 # 16-byte Reload
; CHECK-NEXT:    unpcklps {{.*#+}} xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
; CHECK-NEXT:    unpcklpd (%rsp), %xmm1 # 16-byte Folded Reload
; CHECK-NEXT:    # xmm1 = xmm1[0],mem[0]
; CHECK-NEXT:    movaps %xmm1, %xmm0
; CHECK-NEXT:    addq $56, %rsp
; CHECK-NEXT:    retq
  %r = call afn nsz <4 x float> @llvm.pow.v4f32(<4 x float> %x, <4 x float> <float 2.5e-1, float 2.5e-1, float 2.5e-01, float 2.5e-01>)
  ret <4 x float> %r
}

define <2 x double> @pow_v2f64_one_fourth_not_enough_fmf(<2 x double> %x) nounwind {
; CHECK-LABEL: pow_v2f64_one_fourth_not_enough_fmf:
; CHECK:       # %bb.0:
; CHECK-NEXT:    subq $40, %rsp
; CHECK-NEXT:    movaps %xmm0, (%rsp) # 16-byte Spill
; CHECK-NEXT:    movsd {{.*#+}} xmm1 = mem[0],zero
; CHECK-NEXT:    callq pow@PLT
; CHECK-NEXT:    movaps %xmm0, {{[-0-9]+}}(%r{{[sb]}}p) # 16-byte Spill
; CHECK-NEXT:    movaps (%rsp), %xmm0 # 16-byte Reload
; CHECK-NEXT:    movhlps {{.*#+}} xmm0 = xmm0[1,1]
; CHECK-NEXT:    movsd {{.*#+}} xmm1 = mem[0],zero
; CHECK-NEXT:    callq pow@PLT
; CHECK-NEXT:    movaps {{[-0-9]+}}(%r{{[sb]}}p), %xmm1 # 16-byte Reload
; CHECK-NEXT:    movlhps {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; CHECK-NEXT:    movaps %xmm1, %xmm0
; CHECK-NEXT:    addq $40, %rsp
; CHECK-NEXT:    retq
  %r = call nsz nnan reassoc <2 x double> @llvm.pow.v2f64(<2 x double> %x, <2 x double> <double 2.5e-1, double 2.5e-1>)
  ret <2 x double> %r
}

define float @pow_f32_one_third_fmf(float %x) nounwind {
; CHECK-LABEL: pow_f32_one_third_fmf:
; CHECK:       # %bb.0:
; CHECK-NEXT:    jmp cbrtf@PLT # TAILCALL
  %one = uitofp i32 1 to float
  %three = uitofp i32 3 to float
  %exp = fdiv float %one, %three
  %r = call nsz nnan ninf afn float @llvm.pow.f32(float %x, float %exp)
  ret float %r
}

define double @pow_f64_one_third_fmf(double %x) nounwind {
; CHECK-LABEL: pow_f64_one_third_fmf:
; CHECK:       # %bb.0:
; CHECK-NEXT:    jmp cbrt@PLT # TAILCALL
  %one = uitofp i32 1 to double
  %three = uitofp i32 3 to double
  %exp = fdiv double %one, %three
  %r = call nsz nnan ninf afn double @llvm.pow.f64(double %x, double %exp)
  ret double %r
}

; TODO: We could turn this into cbrtl, but currently we only handle float/double types.

define x86_fp80 @pow_f80_one_third_fmf(x86_fp80 %x) nounwind {
; CHECK-LABEL: pow_f80_one_third_fmf:
; CHECK:       # %bb.0:
; CHECK-NEXT:    subq $40, %rsp
; CHECK-NEXT:    fldt {{[0-9]+}}(%rsp)
; CHECK-NEXT:    fldt {{\.?LCPI[0-9]+_[0-9]+}}(%rip)
; CHECK-NEXT:    fstpt {{[0-9]+}}(%rsp)
; CHECK-NEXT:    fstpt (%rsp)
; CHECK-NEXT:    callq powl@PLT
; CHECK-NEXT:    addq $40, %rsp
; CHECK-NEXT:    retq
  %one = uitofp i32 1 to x86_fp80
  %three = uitofp i32 3 to x86_fp80
  %exp = fdiv x86_fp80 %one, %three
  %r = call nsz nnan ninf afn x86_fp80 @llvm.pow.f80(x86_fp80 %x, x86_fp80 %exp)
  ret x86_fp80 %r
}

; We might want to allow this. The exact hex value for 1/3 as a double is 0x3fd5555555555555.

define double @pow_f64_not_exactly_one_third_fmf(double %x) nounwind {
; CHECK-LABEL: pow_f64_not_exactly_one_third_fmf:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movsd {{.*#+}} xmm1 = mem[0],zero
; CHECK-NEXT:    jmp pow@PLT # TAILCALL
  %r = call nsz nnan ninf afn double @llvm.pow.f64(double %x, double 0x3fd5555555555556)
  ret double %r
}

; We require all 4 of nsz, ninf, nnan, afn.

define double @pow_f64_not_enough_fmf(double %x) nounwind {
; CHECK-LABEL: pow_f64_not_enough_fmf:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movsd {{.*#+}} xmm1 = mem[0],zero
; CHECK-NEXT:    jmp pow@PLT # TAILCALL
  %r = call nsz ninf afn double @llvm.pow.f64(double %x, double 0x3fd5555555555555)
  ret double %r
}

attributes #0 = { nounwind "denormal-fp-math"="ieee,preserve-sign" }
