; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+v -riscv-v-vector-bits-min=128 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK
; RUN: llc -mtriple=riscv64 -mattr=+v -riscv-v-vector-bits-min=128 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK

define <2 x i16> @vwmulsu_v2i16(<2 x i8>* %x, <2 x i8>* %y) {
; CHECK-LABEL: vwmulsu_v2i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e8, mf8, ta, mu
; CHECK-NEXT:    vle8.v v9, (a0)
; CHECK-NEXT:    vle8.v v10, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v10, v9
; CHECK-NEXT:    ret
  %a = load <2 x i8>, <2 x i8>* %x
  %b = load <2 x i8>, <2 x i8>* %y
  %c = zext <2 x i8> %a to <2 x i16>
  %d = sext <2 x i8> %b to <2 x i16>
  %e = mul <2 x i16> %c, %d
  ret <2 x i16> %e
}

define <2 x i16> @vwmulsu_v2i16_swap(<2 x i8>* %x, <2 x i8>* %y) {
; CHECK-LABEL: vwmulsu_v2i16_swap:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e8, mf8, ta, mu
; CHECK-NEXT:    vle8.v v9, (a0)
; CHECK-NEXT:    vle8.v v10, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v9, v10
; CHECK-NEXT:    ret
  %a = load <2 x i8>, <2 x i8>* %x
  %b = load <2 x i8>, <2 x i8>* %y
  %c = sext <2 x i8> %a to <2 x i16>
  %d = zext <2 x i8> %b to <2 x i16>
  %e = mul <2 x i16> %c, %d
  ret <2 x i16> %e
}

define <4 x i16> @vwmulsu_v4i16(<4 x i8>* %x, <4 x i8>* %y) {
; CHECK-LABEL: vwmulsu_v4i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; CHECK-NEXT:    vle8.v v9, (a0)
; CHECK-NEXT:    vle8.v v10, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v10, v9
; CHECK-NEXT:    ret
  %a = load <4 x i8>, <4 x i8>* %x
  %b = load <4 x i8>, <4 x i8>* %y
  %c = zext <4 x i8> %a to <4 x i16>
  %d = sext <4 x i8> %b to <4 x i16>
  %e = mul <4 x i16> %c, %d
  ret <4 x i16> %e
}

define <2 x i32> @vwmulsu_v2i32(<2 x i16>* %x, <2 x i16>* %y) {
; CHECK-LABEL: vwmulsu_v2i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e16, mf4, ta, mu
; CHECK-NEXT:    vle16.v v9, (a0)
; CHECK-NEXT:    vle16.v v10, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v10, v9
; CHECK-NEXT:    ret
  %a = load <2 x i16>, <2 x i16>* %x
  %b = load <2 x i16>, <2 x i16>* %y
  %c = zext <2 x i16> %a to <2 x i32>
  %d = sext <2 x i16> %b to <2 x i32>
  %e = mul <2 x i32> %c, %d
  ret <2 x i32> %e
}

define <8 x i16> @vwmulsu_v8i16(<8 x i8>* %x, <8 x i8>* %y) {
; CHECK-LABEL: vwmulsu_v8i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; CHECK-NEXT:    vle8.v v9, (a0)
; CHECK-NEXT:    vle8.v v10, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v10, v9
; CHECK-NEXT:    ret
  %a = load <8 x i8>, <8 x i8>* %x
  %b = load <8 x i8>, <8 x i8>* %y
  %c = zext <8 x i8> %a to <8 x i16>
  %d = sext <8 x i8> %b to <8 x i16>
  %e = mul <8 x i16> %c, %d
  ret <8 x i16> %e
}

define <4 x i32> @vwmulsu_v4i32(<4 x i16>* %x, <4 x i16>* %y) {
; CHECK-LABEL: vwmulsu_v4i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; CHECK-NEXT:    vle16.v v9, (a0)
; CHECK-NEXT:    vle16.v v10, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v10, v9
; CHECK-NEXT:    ret
  %a = load <4 x i16>, <4 x i16>* %x
  %b = load <4 x i16>, <4 x i16>* %y
  %c = zext <4 x i16> %a to <4 x i32>
  %d = sext <4 x i16> %b to <4 x i32>
  %e = mul <4 x i32> %c, %d
  ret <4 x i32> %e
}

define <2 x i64> @vwmulsu_v2i64(<2 x i32>* %x, <2 x i32>* %y) {
; CHECK-LABEL: vwmulsu_v2i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    vle32.v v10, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v10, v9
; CHECK-NEXT:    ret
  %a = load <2 x i32>, <2 x i32>* %x
  %b = load <2 x i32>, <2 x i32>* %y
  %c = zext <2 x i32> %a to <2 x i64>
  %d = sext <2 x i32> %b to <2 x i64>
  %e = mul <2 x i64> %c, %d
  ret <2 x i64> %e
}

define <16 x i16> @vwmulsu_v16i16(<16 x i8>* %x, <16 x i8>* %y) {
; CHECK-LABEL: vwmulsu_v16i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e8, m1, ta, mu
; CHECK-NEXT:    vle8.v v10, (a0)
; CHECK-NEXT:    vle8.v v11, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v11, v10
; CHECK-NEXT:    ret
  %a = load <16 x i8>, <16 x i8>* %x
  %b = load <16 x i8>, <16 x i8>* %y
  %c = zext <16 x i8> %a to <16 x i16>
  %d = sext <16 x i8> %b to <16 x i16>
  %e = mul <16 x i16> %c, %d
  ret <16 x i16> %e
}

define <8 x i32> @vwmulsu_v8i32(<8 x i16>* %x, <8 x i16>* %y) {
; CHECK-LABEL: vwmulsu_v8i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e16, m1, ta, mu
; CHECK-NEXT:    vle16.v v10, (a0)
; CHECK-NEXT:    vle16.v v11, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v11, v10
; CHECK-NEXT:    ret
  %a = load <8 x i16>, <8 x i16>* %x
  %b = load <8 x i16>, <8 x i16>* %y
  %c = zext <8 x i16> %a to <8 x i32>
  %d = sext <8 x i16> %b to <8 x i32>
  %e = mul <8 x i32> %c, %d
  ret <8 x i32> %e
}

define <4 x i64> @vwmulsu_v4i64(<4 x i32>* %x, <4 x i32>* %y) {
; CHECK-LABEL: vwmulsu_v4i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; CHECK-NEXT:    vle32.v v10, (a0)
; CHECK-NEXT:    vle32.v v11, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v11, v10
; CHECK-NEXT:    ret
  %a = load <4 x i32>, <4 x i32>* %x
  %b = load <4 x i32>, <4 x i32>* %y
  %c = zext <4 x i32> %a to <4 x i64>
  %d = sext <4 x i32> %b to <4 x i64>
  %e = mul <4 x i64> %c, %d
  ret <4 x i64> %e
}

define <32 x i16> @vwmulsu_v32i16(<32 x i8>* %x, <32 x i8>* %y) {
; CHECK-LABEL: vwmulsu_v32i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a2, 32
; CHECK-NEXT:    vsetvli zero, a2, e8, m2, ta, mu
; CHECK-NEXT:    vle8.v v12, (a0)
; CHECK-NEXT:    vle8.v v14, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v14, v12
; CHECK-NEXT:    ret
  %a = load <32 x i8>, <32 x i8>* %x
  %b = load <32 x i8>, <32 x i8>* %y
  %c = zext <32 x i8> %a to <32 x i16>
  %d = sext <32 x i8> %b to <32 x i16>
  %e = mul <32 x i16> %c, %d
  ret <32 x i16> %e
}

define <16 x i32> @vwmulsu_v16i32(<16 x i16>* %x, <16 x i16>* %y) {
; CHECK-LABEL: vwmulsu_v16i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e16, m2, ta, mu
; CHECK-NEXT:    vle16.v v12, (a0)
; CHECK-NEXT:    vle16.v v14, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v14, v12
; CHECK-NEXT:    ret
  %a = load <16 x i16>, <16 x i16>* %x
  %b = load <16 x i16>, <16 x i16>* %y
  %c = zext <16 x i16> %a to <16 x i32>
  %d = sext <16 x i16> %b to <16 x i32>
  %e = mul <16 x i32> %c, %d
  ret <16 x i32> %e
}

define <8 x  i64> @vwmulsu_v8i64(<8 x  i32>* %x, <8 x  i32>* %y) {
; CHECK-LABEL: vwmulsu_v8i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, mu
; CHECK-NEXT:    vle32.v v12, (a0)
; CHECK-NEXT:    vle32.v v14, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v14, v12
; CHECK-NEXT:    ret
  %a = load <8 x  i32>, <8 x  i32>* %x
  %b = load <8 x  i32>, <8 x  i32>* %y
  %c = zext <8 x  i32> %a to <8 x  i64>
  %d = sext <8 x  i32> %b to <8 x  i64>
  %e = mul <8 x  i64> %c, %d
  ret <8 x  i64> %e
}

define <64 x i16> @vwmulsu_v64i16(<64 x i8>* %x, <64 x i8>* %y) {
; CHECK-LABEL: vwmulsu_v64i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a2, 64
; CHECK-NEXT:    vsetvli zero, a2, e8, m4, ta, mu
; CHECK-NEXT:    vle8.v v16, (a0)
; CHECK-NEXT:    vle8.v v20, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v20, v16
; CHECK-NEXT:    ret
  %a = load <64 x i8>, <64 x i8>* %x
  %b = load <64 x i8>, <64 x i8>* %y
  %c = zext <64 x i8> %a to <64 x i16>
  %d = sext <64 x i8> %b to <64 x i16>
  %e = mul <64 x i16> %c, %d
  ret <64 x i16> %e
}

define <32 x i32> @vwmulsu_v32i32(<32 x i16>* %x, <32 x i16>* %y) {
; CHECK-LABEL: vwmulsu_v32i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a2, 32
; CHECK-NEXT:    vsetvli zero, a2, e16, m4, ta, mu
; CHECK-NEXT:    vle16.v v16, (a0)
; CHECK-NEXT:    vle16.v v20, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v20, v16
; CHECK-NEXT:    ret
  %a = load <32 x i16>, <32 x i16>* %x
  %b = load <32 x i16>, <32 x i16>* %y
  %c = zext <32 x i16> %a to <32 x i32>
  %d = sext <32 x i16> %b to <32 x i32>
  %e = mul <32 x i32> %c, %d
  ret <32 x i32> %e
}

define <16 x i64> @vwmulsu_v16i64(<16 x i32>* %x, <16 x i32>* %y) {
; CHECK-LABEL: vwmulsu_v16i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e32, m4, ta, mu
; CHECK-NEXT:    vle32.v v16, (a0)
; CHECK-NEXT:    vle32.v v20, (a1)
; CHECK-NEXT:    vwmulsu.vv v8, v20, v16
; CHECK-NEXT:    ret
  %a = load <16 x i32>, <16 x i32>* %x
  %b = load <16 x i32>, <16 x i32>* %y
  %c = zext <16 x i32> %a to <16 x i64>
  %d = sext <16 x i32> %b to <16 x i64>
  %e = mul <16 x i64> %c, %d
  ret <16 x i64> %e
}

define <128 x i16> @vwmulsu_v128i16(<128 x i8>* %x, <128 x i8>* %y) {
; CHECK-LABEL: vwmulsu_v128i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a2, a2, 3
; CHECK-NEXT:    sub sp, sp, a2
; CHECK-NEXT:    li a2, 128
; CHECK-NEXT:    vsetvli zero, a2, e8, m8, ta, mu
; CHECK-NEXT:    vle8.v v16, (a0)
; CHECK-NEXT:    vle8.v v24, (a1)
; CHECK-NEXT:    li a0, 64
; CHECK-NEXT:    vsetvli zero, a0, e8, m8, ta, mu
; CHECK-NEXT:    vslidedown.vx v8, v16, a0
; CHECK-NEXT:    addi a1, sp, 16
; CHECK-NEXT:    vs8r.v v8, (a1) # Unknown-size Folded Spill
; CHECK-NEXT:    vslidedown.vx v0, v24, a0
; CHECK-NEXT:    vsetvli zero, a0, e8, m4, ta, mu
; CHECK-NEXT:    vwmulsu.vv v8, v24, v16
; CHECK-NEXT:    addi a0, sp, 16
; CHECK-NEXT:    vl8re8.v v24, (a0) # Unknown-size Folded Reload
; CHECK-NEXT:    vwmulsu.vv v16, v0, v24
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 3
; CHECK-NEXT:    add sp, sp, a0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
  %a = load <128 x i8>, <128 x i8>* %x
  %b = load <128 x i8>, <128 x i8>* %y
  %c = zext <128 x i8> %a to <128 x i16>
  %d = sext <128 x i8> %b to <128 x i16>
  %e = mul <128 x i16> %c, %d
  ret <128 x i16> %e
}

define <64 x i32> @vwmulsu_v64i32(<64 x i16>* %x, <64 x i16>* %y) {
; CHECK-LABEL: vwmulsu_v64i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a2, a2, 3
; CHECK-NEXT:    sub sp, sp, a2
; CHECK-NEXT:    li a2, 64
; CHECK-NEXT:    vsetvli zero, a2, e16, m8, ta, mu
; CHECK-NEXT:    vle16.v v16, (a0)
; CHECK-NEXT:    vle16.v v24, (a1)
; CHECK-NEXT:    li a0, 32
; CHECK-NEXT:    vsetvli zero, a0, e16, m8, ta, mu
; CHECK-NEXT:    vslidedown.vx v8, v16, a0
; CHECK-NEXT:    addi a1, sp, 16
; CHECK-NEXT:    vs8r.v v8, (a1) # Unknown-size Folded Spill
; CHECK-NEXT:    vslidedown.vx v0, v24, a0
; CHECK-NEXT:    vsetvli zero, a0, e16, m4, ta, mu
; CHECK-NEXT:    vwmulsu.vv v8, v24, v16
; CHECK-NEXT:    addi a0, sp, 16
; CHECK-NEXT:    vl8re8.v v24, (a0) # Unknown-size Folded Reload
; CHECK-NEXT:    vwmulsu.vv v16, v0, v24
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 3
; CHECK-NEXT:    add sp, sp, a0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
  %a = load <64 x i16>, <64 x i16>* %x
  %b = load <64 x i16>, <64 x i16>* %y
  %c = zext <64 x i16> %a to <64 x i32>
  %d = sext <64 x i16> %b to <64 x i32>
  %e = mul <64 x i32> %c, %d
  ret <64 x i32> %e
}

define <32 x i64> @vwmulsu_v32i64(<32 x i32>* %x, <32 x i32>* %y) {
; CHECK-LABEL: vwmulsu_v32i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi sp, sp, -16
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    csrr a2, vlenb
; CHECK-NEXT:    slli a2, a2, 3
; CHECK-NEXT:    sub sp, sp, a2
; CHECK-NEXT:    li a2, 32
; CHECK-NEXT:    vsetvli zero, a2, e32, m8, ta, mu
; CHECK-NEXT:    vle32.v v16, (a0)
; CHECK-NEXT:    vle32.v v24, (a1)
; CHECK-NEXT:    vsetivli zero, 16, e32, m8, ta, mu
; CHECK-NEXT:    vslidedown.vi v8, v16, 16
; CHECK-NEXT:    addi a0, sp, 16
; CHECK-NEXT:    vs8r.v v8, (a0) # Unknown-size Folded Spill
; CHECK-NEXT:    vslidedown.vi v0, v24, 16
; CHECK-NEXT:    vsetivli zero, 16, e32, m4, ta, mu
; CHECK-NEXT:    vwmulsu.vv v8, v24, v16
; CHECK-NEXT:    addi a0, sp, 16
; CHECK-NEXT:    vl8re8.v v24, (a0) # Unknown-size Folded Reload
; CHECK-NEXT:    vwmulsu.vv v16, v0, v24
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    slli a0, a0, 3
; CHECK-NEXT:    add sp, sp, a0
; CHECK-NEXT:    addi sp, sp, 16
; CHECK-NEXT:    ret
  %a = load <32 x i32>, <32 x i32>* %x
  %b = load <32 x i32>, <32 x i32>* %y
  %c = zext <32 x i32> %a to <32 x i64>
  %d = sext <32 x i32> %b to <32 x i64>
  %e = mul <32 x i64> %c, %d
  ret <32 x i64> %e
}

define <2 x i32> @vwmulsu_v2i32_v2i8(<2 x i8>* %x, <2 x i8>* %y) {
; CHECK-LABEL: vwmulsu_v2i32_v2i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e8, mf8, ta, mu
; CHECK-NEXT:    vle8.v v8, (a0)
; CHECK-NEXT:    vle8.v v9, (a1)
; CHECK-NEXT:    vsetvli zero, zero, e16, mf4, ta, mu
; CHECK-NEXT:    vzext.vf2 v10, v8
; CHECK-NEXT:    vsext.vf2 v11, v9
; CHECK-NEXT:    vwmulsu.vv v8, v11, v10
; CHECK-NEXT:    ret
  %a = load <2 x i8>, <2 x i8>* %x
  %b = load <2 x i8>, <2 x i8>* %y
  %c = zext <2 x i8> %a to <2 x i32>
  %d = sext <2 x i8> %b to <2 x i32>
  %e = mul <2 x i32> %c, %d
  ret <2 x i32> %e
}

define <4 x i32> @vwmulsu_v4i32_v4i8_v4i16(<4 x i8>* %x, <4 x i16>* %y) {
; CHECK-LABEL: vwmulsu_v4i32_v4i8_v4i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; CHECK-NEXT:    vle8.v v8, (a0)
; CHECK-NEXT:    vle16.v v9, (a1)
; CHECK-NEXT:    vsetvli zero, zero, e16, mf2, ta, mu
; CHECK-NEXT:    vzext.vf2 v10, v8
; CHECK-NEXT:    vwmulsu.vv v8, v9, v10
; CHECK-NEXT:    ret
  %a = load <4 x i8>, <4 x i8>* %x
  %b = load <4 x i16>, <4 x i16>* %y
  %c = zext <4 x i8> %a to <4 x i32>
  %d = sext <4 x i16> %b to <4 x i32>
  %e = mul <4 x i32> %c, %d
  ret <4 x i32> %e
}

define <4 x i64> @vwmulsu_v4i64_v4i32_v4i8(<4 x i32>* %x, <4 x i8>* %y) {
; CHECK-LABEL: vwmulsu_v4i64_v4i32_v4i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; CHECK-NEXT:    vle8.v v8, (a1)
; CHECK-NEXT:    vle32.v v10, (a0)
; CHECK-NEXT:    vsext.vf4 v11, v8
; CHECK-NEXT:    vwmulsu.vv v8, v11, v10
; CHECK-NEXT:    ret
  %a = load <4 x i32>, <4 x i32>* %x
  %b = load <4 x i8>, <4 x i8>* %y
  %c = zext <4 x i32> %a to <4 x i64>
  %d = sext <4 x i8> %b to <4 x i64>
  %e = mul <4 x i64> %c, %d
  ret <4 x i64> %e
}

define <2 x i16> @vwmulsu_vx_v2i16(<2 x i8>* %x, i8 %y) {
; CHECK-LABEL: vwmulsu_vx_v2i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e8, mf8, ta, mu
; CHECK-NEXT:    vle8.v v9, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v9, a1
; CHECK-NEXT:    ret
  %a = load <2 x i8>, <2 x i8>* %x
  %b = insertelement <2 x i8> poison, i8 %y, i32 0
  %c = shufflevector <2 x i8> %b, <2 x i8> poison, <2 x i32> zeroinitializer
  %d = sext <2 x i8> %a to <2 x i16>
  %e = zext <2 x i8> %c to <2 x i16>
  %f = mul <2 x i16> %d, %e
  ret <2 x i16> %f
}

define <2 x i16> @vwmulsu_vx_v2i16_swap(<2 x i8>* %x, i8 %y) {
; CHECK-LABEL: vwmulsu_vx_v2i16_swap:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e8, mf8, ta, mu
; CHECK-NEXT:    vle8.v v9, (a0)
; CHECK-NEXT:    vmv.v.x v10, a1
; CHECK-NEXT:    vwmulsu.vv v8, v10, v9
; CHECK-NEXT:    ret
  %a = load <2 x i8>, <2 x i8>* %x
  %b = insertelement <2 x i8> poison, i8 %y, i32 0
  %c = shufflevector <2 x i8> %b, <2 x i8> poison, <2 x i32> zeroinitializer
  %d = zext <2 x i8> %a to <2 x i16>
  %e = sext <2 x i8> %c to <2 x i16>
  %f = mul <2 x i16> %d, %e
  ret <2 x i16> %f
}

define <4 x i16> @vwmulsu_vx_v4i16(<4 x i8>* %x, i8 %y) {
; CHECK-LABEL: vwmulsu_vx_v4i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; CHECK-NEXT:    vle8.v v9, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v9, a1
; CHECK-NEXT:    ret
  %a = load <4 x i8>, <4 x i8>* %x
  %b = insertelement <4 x i8> poison, i8 %y, i32 0
  %c = shufflevector <4 x i8> %b, <4 x i8> poison, <4 x i32> zeroinitializer
  %d = sext <4 x i8> %a to <4 x i16>
  %e = zext <4 x i8> %c to <4 x i16>
  %f = mul <4 x i16> %d, %e
  ret <4 x i16> %f
}

define <2 x i32> @vwmulsu_vx_v2i32(<2 x i16>* %x, i16 %y) {
; CHECK-LABEL: vwmulsu_vx_v2i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e16, mf4, ta, mu
; CHECK-NEXT:    vle16.v v9, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v9, a1
; CHECK-NEXT:    ret
  %a = load <2 x i16>, <2 x i16>* %x
  %b = insertelement <2 x i16> poison, i16 %y, i32 0
  %c = shufflevector <2 x i16> %b, <2 x i16> poison, <2 x i32> zeroinitializer
  %d = sext <2 x i16> %a to <2 x i32>
  %e = zext <2 x i16> %c to <2 x i32>
  %f = mul <2 x i32> %d, %e
  ret <2 x i32> %f
}

define <8 x i16> @vwmulsu_vx_v8i16(<8 x i8>* %x, i8 %y) {
; CHECK-LABEL: vwmulsu_vx_v8i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; CHECK-NEXT:    vle8.v v9, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v9, a1
; CHECK-NEXT:    ret
  %a = load <8 x i8>, <8 x i8>* %x
  %b = insertelement <8 x i8> poison, i8 %y, i32 0
  %c = shufflevector <8 x i8> %b, <8 x i8> poison, <8 x i32> zeroinitializer
  %d = sext <8 x i8> %a to <8 x i16>
  %e = zext <8 x i8> %c to <8 x i16>
  %f = mul <8 x i16> %d, %e
  ret <8 x i16> %f
}

define <4 x i32> @vwmulsu_vx_v4i32(<4 x i16>* %x, i16 %y) {
; CHECK-LABEL: vwmulsu_vx_v4i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; CHECK-NEXT:    vle16.v v9, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v9, a1
; CHECK-NEXT:    ret
  %a = load <4 x i16>, <4 x i16>* %x
  %b = insertelement <4 x i16> poison, i16 %y, i32 0
  %c = shufflevector <4 x i16> %b, <4 x i16> poison, <4 x i32> zeroinitializer
  %d = sext <4 x i16> %a to <4 x i32>
  %e = zext <4 x i16> %c to <4 x i32>
  %f = mul <4 x i32> %d, %e
  ret <4 x i32> %f
}

define <2 x i64> @vwmulsu_vx_v2i64(<2 x i32>* %x, i32 %y) {
; CHECK-LABEL: vwmulsu_vx_v2i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; CHECK-NEXT:    vle32.v v9, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v9, a1
; CHECK-NEXT:    ret
  %a = load <2 x i32>, <2 x i32>* %x
  %b = insertelement <2 x i32> poison, i32 %y, i64 0
  %c = shufflevector <2 x i32> %b, <2 x i32> poison, <2 x i32> zeroinitializer
  %d = sext <2 x i32> %a to <2 x i64>
  %e = zext <2 x i32> %c to <2 x i64>
  %f = mul <2 x i64> %d, %e
  ret <2 x i64> %f
}

define <16 x i16> @vwmulsu_vx_v16i16(<16 x i8>* %x, i8 %y) {
; CHECK-LABEL: vwmulsu_vx_v16i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e8, m1, ta, mu
; CHECK-NEXT:    vle8.v v10, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v10, a1
; CHECK-NEXT:    ret
  %a = load <16 x i8>, <16 x i8>* %x
  %b = insertelement <16 x i8> poison, i8 %y, i32 0
  %c = shufflevector <16 x i8> %b, <16 x i8> poison, <16 x i32> zeroinitializer
  %d = sext <16 x i8> %a to <16 x i16>
  %e = zext <16 x i8> %c to <16 x i16>
  %f = mul <16 x i16> %d, %e
  ret <16 x i16> %f
}

define <8 x i32> @vwmulsu_vx_v8i32(<8 x i16>* %x, i16 %y) {
; CHECK-LABEL: vwmulsu_vx_v8i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e16, m1, ta, mu
; CHECK-NEXT:    vle16.v v10, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v10, a1
; CHECK-NEXT:    ret
  %a = load <8 x i16>, <8 x i16>* %x
  %b = insertelement <8 x i16> poison, i16 %y, i32 0
  %c = shufflevector <8 x i16> %b, <8 x i16> poison, <8 x i32> zeroinitializer
  %d = sext <8 x i16> %a to <8 x i32>
  %e = zext <8 x i16> %c to <8 x i32>
  %f = mul <8 x i32> %d, %e
  ret <8 x i32> %f
}

define <4 x i64> @vwmulsu_vx_v4i64(<4 x i32>* %x, i32 %y) {
; CHECK-LABEL: vwmulsu_vx_v4i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; CHECK-NEXT:    vle32.v v10, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v10, a1
; CHECK-NEXT:    ret
  %a = load <4 x i32>, <4 x i32>* %x
  %b = insertelement <4 x i32> poison, i32 %y, i64 0
  %c = shufflevector <4 x i32> %b, <4 x i32> poison, <4 x i32> zeroinitializer
  %d = sext <4 x i32> %a to <4 x i64>
  %e = zext <4 x i32> %c to <4 x i64>
  %f = mul <4 x i64> %d, %e
  ret <4 x i64> %f
}

define <32 x i16> @vwmulsu_vx_v32i16(<32 x i8>* %x, i8 %y) {
; CHECK-LABEL: vwmulsu_vx_v32i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a2, 32
; CHECK-NEXT:    vsetvli zero, a2, e8, m2, ta, mu
; CHECK-NEXT:    vle8.v v12, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v12, a1
; CHECK-NEXT:    ret
  %a = load <32 x i8>, <32 x i8>* %x
  %b = insertelement <32 x i8> poison, i8 %y, i32 0
  %c = shufflevector <32 x i8> %b, <32 x i8> poison, <32 x i32> zeroinitializer
  %d = sext <32 x i8> %a to <32 x i16>
  %e = zext <32 x i8> %c to <32 x i16>
  %f = mul <32 x i16> %d, %e
  ret <32 x i16> %f
}

define <16 x i32> @vwmulsu_vx_v16i32(<16 x i16>* %x, i16 %y) {
; CHECK-LABEL: vwmulsu_vx_v16i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e16, m2, ta, mu
; CHECK-NEXT:    vle16.v v12, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v12, a1
; CHECK-NEXT:    ret
  %a = load <16 x i16>, <16 x i16>* %x
  %b = insertelement <16 x i16> poison, i16 %y, i32 0
  %c = shufflevector <16 x i16> %b, <16 x i16> poison, <16 x i32> zeroinitializer
  %d = sext <16 x i16> %a to <16 x i32>
  %e = zext <16 x i16> %c to <16 x i32>
  %f = mul <16 x i32> %d, %e
  ret <16 x i32> %f
}

define <8 x i64> @vwmulsu_vx_v8i64(<8 x i32>* %x, i32 %y) {
; CHECK-LABEL: vwmulsu_vx_v8i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, mu
; CHECK-NEXT:    vle32.v v12, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v12, a1
; CHECK-NEXT:    ret
  %a = load <8 x i32>, <8 x i32>* %x
  %b = insertelement <8 x i32> poison, i32 %y, i64 0
  %c = shufflevector <8 x i32> %b, <8 x i32> poison, <8 x i32> zeroinitializer
  %d = sext <8 x i32> %a to <8 x i64>
  %e = zext <8 x i32> %c to <8 x i64>
  %f = mul <8 x i64> %d, %e
  ret <8 x i64> %f
}

define <64 x i16> @vwmulsu_vx_v64i16(<64 x i8>* %x, i8 %y) {
; CHECK-LABEL: vwmulsu_vx_v64i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a2, 64
; CHECK-NEXT:    vsetvli zero, a2, e8, m4, ta, mu
; CHECK-NEXT:    vle8.v v16, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v16, a1
; CHECK-NEXT:    ret
  %a = load <64 x i8>, <64 x i8>* %x
  %b = insertelement <64 x i8> poison, i8 %y, i32 0
  %c = shufflevector <64 x i8> %b, <64 x i8> poison, <64 x i32> zeroinitializer
  %d = sext <64 x i8> %a to <64 x i16>
  %e = zext <64 x i8> %c to <64 x i16>
  %f = mul <64 x i16> %d, %e
  ret <64 x i16> %f
}

define <32 x i32> @vwmulsu_vx_v32i32(<32 x i16>* %x, i16 %y) {
; CHECK-LABEL: vwmulsu_vx_v32i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a2, 32
; CHECK-NEXT:    vsetvli zero, a2, e16, m4, ta, mu
; CHECK-NEXT:    vle16.v v16, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v16, a1
; CHECK-NEXT:    ret
  %a = load <32 x i16>, <32 x i16>* %x
  %b = insertelement <32 x i16> poison, i16 %y, i32 0
  %c = shufflevector <32 x i16> %b, <32 x i16> poison, <32 x i32> zeroinitializer
  %d = sext <32 x i16> %a to <32 x i32>
  %e = zext <32 x i16> %c to <32 x i32>
  %f = mul <32 x i32> %d, %e
  ret <32 x i32> %f
}

define <16 x i64> @vwmulsu_vx_v16i64(<16 x i32>* %x, i32 %y) {
; CHECK-LABEL: vwmulsu_vx_v16i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e32, m4, ta, mu
; CHECK-NEXT:    vle32.v v16, (a0)
; CHECK-NEXT:    vwmulsu.vx v8, v16, a1
; CHECK-NEXT:    ret
  %a = load <16 x i32>, <16 x i32>* %x
  %b = insertelement <16 x i32> poison, i32 %y, i64 0
  %c = shufflevector <16 x i32> %b, <16 x i32> poison, <16 x i32> zeroinitializer
  %d = sext <16 x i32> %a to <16 x i64>
  %e = zext <16 x i32> %c to <16 x i64>
  %f = mul <16 x i64> %d, %e
  ret <16 x i64> %f
}
