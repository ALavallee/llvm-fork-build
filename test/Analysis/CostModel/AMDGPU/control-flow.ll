; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt -cost-model -analyze -mtriple=amdgcn-unknown-amdhsa < %s | FileCheck  --check-prefixes=ALL %s
; RUN: opt -cost-model -cost-kind=code-size -analyze -mtriple=amdgcn-unknown-amdhsa < %s | FileCheck --check-prefixes=ALL-SIZE %s
; END.

define amdgpu_kernel void @test_br_cost(i32 addrspace(1)* %vaddr, i32 %b) #0 {
; ALL-LABEL: 'test_br_cost'
; ALL-NEXT:  Cost Model: Found an estimated cost of 7 for instruction: br i1 undef, label %bb1, label %bb2
; ALL-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: br label %bb2
; ALL-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %phi = phi i32 [ %b, %bb0 ], [ undef, %bb1 ]
; ALL-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; ALL-SIZE-LABEL: 'test_br_cost'
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 5 for instruction: br i1 undef, label %bb1, label %bb2
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: br label %bb2
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %phi = phi i32 [ %b, %bb0 ], [ undef, %bb1 ]
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
bb0:
  br i1 undef, label %bb1, label %bb2

bb1:
  br label %bb2

bb2:
  %phi = phi i32 [ %b, %bb0 ], [ undef, %bb1 ]
  ret void
}

define amdgpu_kernel void @test_switch_cost(i32 %a) #0 {
; ALL-LABEL: 'test_switch_cost'
; ALL-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: switch i32 %a, label %default [
; ALL-NEXT:    i32 0, label %case0
; ALL-NEXT:    i32 1, label %case1
; ALL-NEXT:    ]
; ALL-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
; ALL-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
; ALL-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; ALL-SIZE-LABEL: 'test_switch_cost'
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 18 for instruction: switch i32 %a, label %default [
; ALL-SIZE-NEXT:    i32 0, label %case0
; ALL-SIZE-NEXT:    i32 1, label %case1
; ALL-SIZE-NEXT:    ]
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
; ALL-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
entry:
  switch i32 %a, label %default [
  i32 0, label %case0
  i32 1, label %case1
  ]

case0:
  ret void

case1:
  ret void

default:
  ret void
}
