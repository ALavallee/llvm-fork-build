; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; Check memory cost model action for a load of an unusually sized integer
; follow by and a trunc to a register sized integer gives a cost of 1 rather
; than the expanded cost if it is not.

; RUN: opt -cost-model -cost-kind=code-size -analyze -mtriple=amdgcn-unknown-amdhsa < %s | FileCheck %s --check-prefix=CHECK

; Check that cost is 1 for unusual load to register sized load.
define i32 @loadUnusualIntegerWithTrunc(i128* %ptr) {
; CHECK-LABEL: 'loadUnusualIntegerWithTrunc'
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %out = load i128, i128* %ptr, align 4
; CHECK-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %trunc = trunc i128 %out to i32
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret i32 %trunc
;
  %out = load i128, i128* %ptr
  %trunc = trunc i128 %out to i32
  ret i32 %trunc
}

define i128 @loadUnusualInteger(i128* %ptr) {
; CHECK-LABEL: 'loadUnusualInteger'
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %out = load i128, i128* %ptr, align 4
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret i128 %out
;
  %out = load i128, i128* %ptr
  ret i128 %out
}
