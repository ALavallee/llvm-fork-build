; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt -cost-model -analyze -mtriple=amdgcn-unknown-amdhsa < %s | FileCheck -check-prefixes=SLOW16 %s
; RUN: opt -cost-model -analyze -mtriple=amdgcn-unknown-amdhsa -mcpu=gfx900 < %s | FileCheck -check-prefixes=FAST16 %s
; RUN: opt -cost-model -cost-kind=code-size -analyze -mtriple=amdgcn-unknown-amdhsa < %s | FileCheck -check-prefixes=SLOW16-SIZE %s
; RUN: opt -cost-model -cost-kind=code-size -analyze -mtriple=amdgcn-unknown-amdhsa -mcpu=gfx900 < %s | FileCheck -check-prefixes=FAST16-SIZE %s
; END.

define amdgpu_kernel void @or() #0 {
; SLOW16-LABEL: 'or'
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = or i8 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8 = or <2 x i8> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i8 = or <3 x i8> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8 = or <4 x i8> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = or i16 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i16 = or <2 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i16 = or <3 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i16 = or <4 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = or i32 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32 = or <2 x i32> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32 = or <3 x i32> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32 = or <4 x i32> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = or i64 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2i64 = or <2 x i64> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3i64 = or <3 x i64> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4i64 = or <4 x i64> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; FAST16-LABEL: 'or'
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = or i8 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8 = or <2 x i8> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i8 = or <3 x i8> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8 = or <4 x i8> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = or i16 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v2i16 = or <2 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v3i16 = or <3 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v4i16 = or <4 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = or i32 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32 = or <2 x i32> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32 = or <3 x i32> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32 = or <4 x i32> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = or i64 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2i64 = or <2 x i64> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3i64 = or <3 x i64> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4i64 = or <4 x i64> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; SLOW16-SIZE-LABEL: 'or'
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = or i8 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8 = or <2 x i8> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i8 = or <3 x i8> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8 = or <4 x i8> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = or i16 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i16 = or <2 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i16 = or <3 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i16 = or <4 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = or i32 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32 = or <2 x i32> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32 = or <3 x i32> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32 = or <4 x i32> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = or i64 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2i64 = or <2 x i64> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3i64 = or <3 x i64> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4i64 = or <4 x i64> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
; FAST16-SIZE-LABEL: 'or'
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = or i8 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8 = or <2 x i8> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i8 = or <3 x i8> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8 = or <4 x i8> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = or i16 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v2i16 = or <2 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v3i16 = or <3 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v4i16 = or <4 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = or i32 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32 = or <2 x i32> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32 = or <3 x i32> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32 = or <4 x i32> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = or i64 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2i64 = or <2 x i64> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3i64 = or <3 x i64> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4i64 = or <4 x i64> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %i8 = or i8 undef, undef
  %v2i8 = or <2 x i8> undef, undef
  %v3i8 = or <3 x i8> undef, undef
  %v4i8 = or <4 x i8> undef, undef
  %i16 = or i16 undef, undef
  %v2i16 = or <2 x i16> undef, undef
  %v3i16 = or <3 x i16> undef, undef
  %v4i16 = or <4 x i16> undef, undef
  %i32 = or i32 undef, undef
  %v2i32 = or <2 x i32> undef, undef
  %v3i32 = or <3 x i32> undef, undef
  %v4i32 = or <4 x i32> undef, undef
  %i64 = or i64 undef, undef
  %v2i64 = or <2 x i64> undef, undef
  %v3i64 = or <3 x i64> undef, undef
  %v4i64 = or <4 x i64> undef, undef
  ret void
}

define amdgpu_kernel void @xor() #0 {
; SLOW16-LABEL: 'xor'
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = xor i8 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8 = xor <2 x i8> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i8 = xor <3 x i8> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8 = xor <4 x i8> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = xor i16 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i16 = xor <2 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i16 = xor <3 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i16 = xor <4 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = xor i32 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32 = xor <2 x i32> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32 = xor <3 x i32> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32 = xor <4 x i32> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = xor i64 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2i64 = xor <2 x i64> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3i64 = xor <3 x i64> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4i64 = xor <4 x i64> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; FAST16-LABEL: 'xor'
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = xor i8 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8 = xor <2 x i8> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i8 = xor <3 x i8> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8 = xor <4 x i8> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = xor i16 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v2i16 = xor <2 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v3i16 = xor <3 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v4i16 = xor <4 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = xor i32 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32 = xor <2 x i32> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32 = xor <3 x i32> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32 = xor <4 x i32> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = xor i64 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2i64 = xor <2 x i64> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3i64 = xor <3 x i64> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4i64 = xor <4 x i64> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; SLOW16-SIZE-LABEL: 'xor'
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = xor i8 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8 = xor <2 x i8> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i8 = xor <3 x i8> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8 = xor <4 x i8> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = xor i16 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i16 = xor <2 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i16 = xor <3 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i16 = xor <4 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = xor i32 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32 = xor <2 x i32> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32 = xor <3 x i32> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32 = xor <4 x i32> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = xor i64 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2i64 = xor <2 x i64> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3i64 = xor <3 x i64> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4i64 = xor <4 x i64> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
; FAST16-SIZE-LABEL: 'xor'
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = xor i8 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8 = xor <2 x i8> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i8 = xor <3 x i8> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8 = xor <4 x i8> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = xor i16 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v2i16 = xor <2 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v3i16 = xor <3 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v4i16 = xor <4 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = xor i32 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32 = xor <2 x i32> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32 = xor <3 x i32> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32 = xor <4 x i32> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = xor i64 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2i64 = xor <2 x i64> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3i64 = xor <3 x i64> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4i64 = xor <4 x i64> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %i8 = xor i8 undef, undef
  %v2i8 = xor <2 x i8> undef, undef
  %v3i8 = xor <3 x i8> undef, undef
  %v4i8 = xor <4 x i8> undef, undef
  %i16 = xor i16 undef, undef
  %v2i16 = xor <2 x i16> undef, undef
  %v3i16 = xor <3 x i16> undef, undef
  %v4i16 = xor <4 x i16> undef, undef
  %i32 = xor i32 undef, undef
  %v2i32 = xor <2 x i32> undef, undef
  %v3i32 = xor <3 x i32> undef, undef
  %v4i32 = xor <4 x i32> undef, undef
  %i64 = xor i64 undef, undef
  %v2i64 = xor <2 x i64> undef, undef
  %v3i64 = xor <3 x i64> undef, undef
  %v4i64 = xor <4 x i64> undef, undef
  ret void
}

define amdgpu_kernel void @and() #0 {
; SLOW16-LABEL: 'and'
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = and i8 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8 = and <2 x i8> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i8 = and <3 x i8> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8 = and <4 x i8> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = and i16 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i16 = and <2 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i16 = and <3 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i16 = and <4 x i16> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = and i32 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32 = and <2 x i32> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32 = and <3 x i32> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32 = and <4 x i32> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = and i64 undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2i64 = and <2 x i64> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3i64 = and <3 x i64> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4i64 = and <4 x i64> undef, undef
; SLOW16-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; FAST16-LABEL: 'and'
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = and i8 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8 = and <2 x i8> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i8 = and <3 x i8> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8 = and <4 x i8> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = and i16 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v2i16 = and <2 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v3i16 = and <3 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v4i16 = and <4 x i16> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = and i32 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32 = and <2 x i32> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32 = and <3 x i32> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32 = and <4 x i32> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = and i64 undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2i64 = and <2 x i64> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3i64 = and <3 x i64> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4i64 = and <4 x i64> undef, undef
; FAST16-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; SLOW16-SIZE-LABEL: 'and'
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = and i8 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8 = and <2 x i8> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i8 = and <3 x i8> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8 = and <4 x i8> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = and i16 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i16 = and <2 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i16 = and <3 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i16 = and <4 x i16> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = and i32 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32 = and <2 x i32> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32 = and <3 x i32> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32 = and <4 x i32> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = and i64 undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2i64 = and <2 x i64> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3i64 = and <3 x i64> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4i64 = and <4 x i64> undef, undef
; SLOW16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
; FAST16-SIZE-LABEL: 'and'
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i8 = and i8 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i8 = and <2 x i8> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3i8 = and <3 x i8> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i8 = and <4 x i8> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i16 = and i16 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v2i16 = and <2 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v3i16 = and <3 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v4i16 = and <4 x i16> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %i32 = and i32 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2i32 = and <2 x i32> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3i32 = and <3 x i32> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4i32 = and <4 x i32> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %i64 = and i64 undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2i64 = and <2 x i64> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3i64 = and <3 x i64> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4i64 = and <4 x i64> undef, undef
; FAST16-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %i8 = and i8 undef, undef
  %v2i8 = and <2 x i8> undef, undef
  %v3i8 = and <3 x i8> undef, undef
  %v4i8 = and <4 x i8> undef, undef
  %i16 = and i16 undef, undef
  %v2i16 = and <2 x i16> undef, undef
  %v3i16 = and <3 x i16> undef, undef
  %v4i16 = and <4 x i16> undef, undef
  %i32 = and i32 undef, undef
  %v2i32 = and <2 x i32> undef, undef
  %v3i32 = and <3 x i32> undef, undef
  %v4i32 = and <4 x i32> undef, undef
  %i64 = and i64 undef, undef
  %v2i64 = and <2 x i64> undef, undef
  %v3i64 = and <3 x i64> undef, undef
  %v4i64 = and <4 x i64> undef, undef
  ret void
}

attributes #0 = { nounwind }
