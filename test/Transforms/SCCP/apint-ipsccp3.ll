; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=ipsccp -S | FileCheck %s

@G = internal global i66 undef


define void @foo() {
; CHECK-LABEL: @foo(
; CHECK-NEXT:    [[X:%.*]] = load i66, i66* @G
; CHECK-NEXT:    store i66 [[X]], i66* @G
; CHECK-NEXT:    ret void
;
  %X = load i66, i66* @G
  store i66 %X, i66* @G
  ret void
}

define i66 @bar() {
; CHECK-LABEL: @bar(
; CHECK-NEXT:    [[V:%.*]] = load i66, i66* @G
; CHECK-NEXT:    [[C:%.*]] = icmp eq i66 [[V]], 17
; CHECK-NEXT:    br i1 [[C]], label [[T:%.*]], label [[F:%.*]]
; CHECK:       T:
; CHECK-NEXT:    store i66 17, i66* @G
; CHECK-NEXT:    ret i66 17
; CHECK:       F:
; CHECK-NEXT:    store i66 123, i66* @G
; CHECK-NEXT:    ret i66 0
;
  %V = load i66, i66* @G
  %C = icmp eq i66 %V, 17
  br i1 %C, label %T, label %F
T:
  store i66 17, i66* @G
  ret i66 %V
F:
  store i66 123, i66* @G
  ret i66 0
}
