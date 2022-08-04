; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=sse2 | FileCheck %s --check-prefix=SSE
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=avx  | FileCheck %s --check-prefix=AVX

; First, check the generic pattern for any 2 vector constants. Then, check special cases where
; the constants are all off-by-one. Finally, check the extra special cases where the constants
; include 0 or -1.
; Each minimal select test is repeated with a more typical pattern that includes a compare to
; generate the condition value.

; TODO: If we don't have blendv, this can definitely be improved. There's also a selection of
; chips where it makes sense to transform the general case blendv to 2 bit-ops. That should be
; a uarch-specfic transform. At some point (Ryzen?), the implementation should catch up to the
; architecture, so blendv is as fast as a single bit-op.

define <4 x i32> @sel_C1_or_C2_vec(<4 x i1> %cond) {
; SSE-LABEL: sel_C1_or_C2_vec:
; SSE:       # %bb.0:
; SSE-NEXT:    pslld $31, %xmm0
; SSE-NEXT:    psrad $31, %xmm0
; SSE-NEXT:    movdqa %xmm0, %xmm1
; SSE-NEXT:    pandn {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm1
; SSE-NEXT:    pand {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; SSE-NEXT:    por %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: sel_C1_or_C2_vec:
; AVX:       # %bb.0:
; AVX-NEXT:    vpslld $31, %xmm0, %xmm0
; AVX-NEXT:    vmovaps {{.*#+}} xmm1 = [42,0,4294967294,4294967295]
; AVX-NEXT:    vblendvps %xmm0, {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm1, %xmm0
; AVX-NEXT:    retq
  %add = select <4 x i1> %cond, <4 x i32> <i32 3000, i32 1, i32 -1, i32 0>, <4 x i32> <i32 42, i32 0, i32 -2, i32 -1>
  ret <4 x i32> %add
}

define <4 x i32> @cmp_sel_C1_or_C2_vec(<4 x i32> %x, <4 x i32> %y) {
; SSE-LABEL: cmp_sel_C1_or_C2_vec:
; SSE:       # %bb.0:
; SSE-NEXT:    pcmpeqd %xmm1, %xmm0
; SSE-NEXT:    movdqa %xmm0, %xmm1
; SSE-NEXT:    pandn {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm1
; SSE-NEXT:    pand {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; SSE-NEXT:    por %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: cmp_sel_C1_or_C2_vec:
; AVX:       # %bb.0:
; AVX-NEXT:    vpcmpeqd %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vmovaps {{.*#+}} xmm1 = [42,0,4294967294,4294967295]
; AVX-NEXT:    vblendvps %xmm0, {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm1, %xmm0
; AVX-NEXT:    retq
  %cond = icmp eq <4 x i32> %x, %y
  %add = select <4 x i1> %cond, <4 x i32> <i32 3000, i32 1, i32 -1, i32 0>, <4 x i32> <i32 42, i32 0, i32 -2, i32 -1>
  ret <4 x i32> %add
}

define <4 x i32> @sel_Cplus1_or_C_vec(<4 x i1> %cond) {
; SSE-LABEL: sel_Cplus1_or_C_vec:
; SSE:       # %bb.0:
; SSE-NEXT:    pand {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; SSE-NEXT:    paddd {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: sel_Cplus1_or_C_vec:
; AVX:       # %bb.0:
; AVX-NEXT:    vpand {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0, %xmm0
; AVX-NEXT:    vpaddd {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0, %xmm0
; AVX-NEXT:    retq
  %add = select <4 x i1> %cond, <4 x i32> <i32 43, i32 1, i32 -1, i32 0>, <4 x i32> <i32 42, i32 0, i32 -2, i32 -1>
  ret <4 x i32> %add
}

define <4 x i32> @cmp_sel_Cplus1_or_C_vec(<4 x i32> %x, <4 x i32> %y) {
; SSE-LABEL: cmp_sel_Cplus1_or_C_vec:
; SSE:       # %bb.0:
; SSE-NEXT:    pcmpeqd %xmm1, %xmm0
; SSE-NEXT:    movdqa {{.*#+}} xmm1 = [42,0,4294967294,4294967295]
; SSE-NEXT:    psubd %xmm0, %xmm1
; SSE-NEXT:    movdqa %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: cmp_sel_Cplus1_or_C_vec:
; AVX:       # %bb.0:
; AVX-NEXT:    vpcmpeqd %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vmovdqa {{.*#+}} xmm1 = [42,0,4294967294,4294967295]
; AVX-NEXT:    vpsubd %xmm0, %xmm1, %xmm0
; AVX-NEXT:    retq
  %cond = icmp eq <4 x i32> %x, %y
  %add = select <4 x i1> %cond, <4 x i32> <i32 43, i32 1, i32 -1, i32 0>, <4 x i32> <i32 42, i32 0, i32 -2, i32 -1>
  ret <4 x i32> %add
}

define <4 x i32> @sel_Cminus1_or_C_vec(<4 x i1> %cond) {
; SSE-LABEL: sel_Cminus1_or_C_vec:
; SSE:       # %bb.0:
; SSE-NEXT:    pslld $31, %xmm0
; SSE-NEXT:    psrad $31, %xmm0
; SSE-NEXT:    paddd {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: sel_Cminus1_or_C_vec:
; AVX:       # %bb.0:
; AVX-NEXT:    vpslld $31, %xmm0, %xmm0
; AVX-NEXT:    vpsrad $31, %xmm0, %xmm0
; AVX-NEXT:    vpaddd {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0, %xmm0
; AVX-NEXT:    retq
  %add = select <4 x i1> %cond, <4 x i32> <i32 43, i32 1, i32 -1, i32 0>, <4 x i32> <i32 44, i32 2, i32 0, i32 1>
  ret <4 x i32> %add
}

define <4 x i32> @cmp_sel_Cminus1_or_C_vec(<4 x i32> %x, <4 x i32> %y) {
; SSE-LABEL: cmp_sel_Cminus1_or_C_vec:
; SSE:       # %bb.0:
; SSE-NEXT:    pcmpeqd %xmm1, %xmm0
; SSE-NEXT:    paddd {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: cmp_sel_Cminus1_or_C_vec:
; AVX:       # %bb.0:
; AVX-NEXT:    vpcmpeqd %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vpaddd {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0, %xmm0
; AVX-NEXT:    retq
  %cond = icmp eq <4 x i32> %x, %y
  %add = select <4 x i1> %cond, <4 x i32> <i32 43, i32 1, i32 -1, i32 0>, <4 x i32> <i32 44, i32 2, i32 0, i32 1>
  ret <4 x i32> %add
}

define <4 x i32> @sel_minus1_or_0_vec(<4 x i1> %cond) {
; SSE-LABEL: sel_minus1_or_0_vec:
; SSE:       # %bb.0:
; SSE-NEXT:    pslld $31, %xmm0
; SSE-NEXT:    psrad $31, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: sel_minus1_or_0_vec:
; AVX:       # %bb.0:
; AVX-NEXT:    vpslld $31, %xmm0, %xmm0
; AVX-NEXT:    vpsrad $31, %xmm0, %xmm0
; AVX-NEXT:    retq
  %add = select <4 x i1> %cond, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, <4 x i32> <i32 0, i32 0, i32 0, i32 0>
  ret <4 x i32> %add
}

define <4 x i32> @cmp_sel_minus1_or_0_vec(<4 x i32> %x, <4 x i32> %y) {
; SSE-LABEL: cmp_sel_minus1_or_0_vec:
; SSE:       # %bb.0:
; SSE-NEXT:    pcmpeqd %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: cmp_sel_minus1_or_0_vec:
; AVX:       # %bb.0:
; AVX-NEXT:    vpcmpeqd %xmm1, %xmm0, %xmm0
; AVX-NEXT:    retq
  %cond = icmp eq <4 x i32> %x, %y
  %add = select <4 x i1> %cond, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>, <4 x i32> <i32 0, i32 0, i32 0, i32 0>
  ret <4 x i32> %add
}

define <4 x i32> @sel_0_or_minus1_vec(<4 x i1> %cond) {
; SSE-LABEL: sel_0_or_minus1_vec:
; SSE:       # %bb.0:
; SSE-NEXT:    pand {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; SSE-NEXT:    pcmpeqd %xmm1, %xmm1
; SSE-NEXT:    paddd %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: sel_0_or_minus1_vec:
; AVX:       # %bb.0:
; AVX-NEXT:    vpand {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0, %xmm0
; AVX-NEXT:    vpcmpeqd %xmm1, %xmm1, %xmm1
; AVX-NEXT:    vpaddd %xmm1, %xmm0, %xmm0
; AVX-NEXT:    retq
  %add = select <4 x i1> %cond, <4 x i32> <i32 0, i32 0, i32 0, i32 0>, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>
  ret <4 x i32> %add
}

define <4 x i32> @cmp_sel_0_or_minus1_vec(<4 x i32> %x, <4 x i32> %y) {
; SSE-LABEL: cmp_sel_0_or_minus1_vec:
; SSE:       # %bb.0:
; SSE-NEXT:    pcmpeqd %xmm1, %xmm0
; SSE-NEXT:    pcmpeqd %xmm1, %xmm1
; SSE-NEXT:    pxor %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: cmp_sel_0_or_minus1_vec:
; AVX:       # %bb.0:
; AVX-NEXT:    vpcmpeqd %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vpcmpeqd %xmm1, %xmm1, %xmm1
; AVX-NEXT:    vpxor %xmm1, %xmm0, %xmm0
; AVX-NEXT:    retq
  %cond = icmp eq <4 x i32> %x, %y
  %add = select <4 x i1> %cond, <4 x i32> <i32 0, i32 0, i32 0, i32 0>, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>
  ret <4 x i32> %add
}

define <4 x i32> @sel_1_or_0_vec(<4 x i1> %cond) {
; SSE-LABEL: sel_1_or_0_vec:
; SSE:       # %bb.0:
; SSE-NEXT:    andps {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: sel_1_or_0_vec:
; AVX:       # %bb.0:
; AVX-NEXT:    vandps {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0, %xmm0
; AVX-NEXT:    retq
  %add = select <4 x i1> %cond, <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32> <i32 0, i32 0, i32 0, i32 0>
  ret <4 x i32> %add
}

define <4 x i32> @cmp_sel_1_or_0_vec(<4 x i32> %x, <4 x i32> %y) {
; SSE-LABEL: cmp_sel_1_or_0_vec:
; SSE:       # %bb.0:
; SSE-NEXT:    pcmpeqd %xmm1, %xmm0
; SSE-NEXT:    psrld $31, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: cmp_sel_1_or_0_vec:
; AVX:       # %bb.0:
; AVX-NEXT:    vpcmpeqd %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vpsrld $31, %xmm0, %xmm0
; AVX-NEXT:    retq
  %cond = icmp eq <4 x i32> %x, %y
  %add = select <4 x i1> %cond, <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32> <i32 0, i32 0, i32 0, i32 0>
  ret <4 x i32> %add
}

define <4 x i32> @sel_0_or_1_vec(<4 x i1> %cond) {
; SSE-LABEL: sel_0_or_1_vec:
; SSE:       # %bb.0:
; SSE-NEXT:    andnps {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: sel_0_or_1_vec:
; AVX:       # %bb.0:
; AVX-NEXT:    vandnps {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0, %xmm0
; AVX-NEXT:    retq
  %add = select <4 x i1> %cond, <4 x i32> <i32 0, i32 0, i32 0, i32 0>, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  ret <4 x i32> %add
}

define <4 x i32> @cmp_sel_0_or_1_vec(<4 x i32> %x, <4 x i32> %y) {
; SSE-LABEL: cmp_sel_0_or_1_vec:
; SSE:       # %bb.0:
; SSE-NEXT:    pcmpeqd %xmm1, %xmm0
; SSE-NEXT:    pandn {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: cmp_sel_0_or_1_vec:
; AVX:       # %bb.0:
; AVX-NEXT:    vpcmpeqd %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vpandn {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0, %xmm0
; AVX-NEXT:    retq
  %cond = icmp eq <4 x i32> %x, %y
  %add = select <4 x i1> %cond, <4 x i32> <i32 0, i32 0, i32 0, i32 0>, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  ret <4 x i32> %add
}

; https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=21167
define <2 x i37> @ossfuzz21167(<2 x i37> %x, <2 x i37> %y) {
; SSE-LABEL: ossfuzz21167:
; SSE:       # %bb.0: # %BB
; SSE-NEXT:    xorps %xmm0, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: ossfuzz21167:
; AVX:       # %bb.0: # %BB
; AVX-NEXT:    vxorps %xmm0, %xmm0, %xmm0
; AVX-NEXT:    retq
BB:
  %c0 = icmp sgt <2 x i37> %y, zeroinitializer
  %xor_x = xor <2 x i37> undef, undef
  %smax96 = select <2 x i1> %c0, <2 x i37> %xor_x, <2 x i37> zeroinitializer
  ret <2 x i37> %smax96
}

; PR53401

define i32 @wrong_min_signbits(<2 x i16> %x) {
; SSE-LABEL: wrong_min_signbits:
; SSE:       # %bb.0:
; SSE-NEXT:    pxor %xmm1, %xmm1
; SSE-NEXT:    pcmpeqw %xmm0, %xmm1
; SSE-NEXT:    movdqa {{.*#+}} xmm0 = [1,0,0,0]
; SSE-NEXT:    pandn %xmm0, %xmm1
; SSE-NEXT:    psllw $15, %xmm1
; SSE-NEXT:    psraw $15, %xmm1
; SSE-NEXT:    movdqa %xmm1, %xmm2
; SSE-NEXT:    pandn %xmm0, %xmm2
; SSE-NEXT:    pand {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm1
; SSE-NEXT:    por %xmm2, %xmm1
; SSE-NEXT:    movd %xmm1, %eax
; SSE-NEXT:    retq
;
; AVX-LABEL: wrong_min_signbits:
; AVX:       # %bb.0:
; AVX-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; AVX-NEXT:    vpcmpeqw %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vmovdqa {{.*#+}} xmm1 = [1,0,0,0]
; AVX-NEXT:    vpandn %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vpsllw $15, %xmm0, %xmm0
; AVX-NEXT:    vpsraw $15, %xmm0, %xmm0
; AVX-NEXT:    vpblendvb %xmm0, {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm1, %xmm0
; AVX-NEXT:    vmovd %xmm0, %eax
; AVX-NEXT:    retq
  %true_true = icmp ne <2 x i16> %x, zeroinitializer
  %true_false = and <2 x i1> %true_true, <i1 true, i1 false>
  %sel = select <2 x i1> %true_false, <2 x i16> <i16 2, i16 0>, <2 x i16> <i16 1, i16 0>
  %t1 = bitcast <2 x i16> %sel to i32
  ret i32 %t1
}
