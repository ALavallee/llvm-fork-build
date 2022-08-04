; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -passes=ipsccp -S %s | FileCheck %s

declare noalias i8* @malloc(i64)

; Make sure we can eliminate `%tmp17 = icmp ult i32 %tmp10, 3`.

declare void @use(i1)

define internal i32* @spam(i32* %arg) {
; CHECK-LABEL: @spam(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    [[TMP:%.*]] = call i8* @malloc(i64 10368)
; CHECK-NEXT:    [[TMP1:%.*]] = bitcast i8* [[TMP]] to i32*
; CHECK-NEXT:    [[TMP4:%.*]] = getelementptr inbounds i32, i32* [[ARG:%.*]], i32 0
; CHECK-NEXT:    [[TMP5:%.*]] = load i32, i32* [[TMP4]], align 8
; CHECK-NEXT:    [[TMP6:%.*]] = add i32 [[TMP5]], 1
; CHECK-NEXT:    [[TMP7:%.*]] = getelementptr inbounds i32, i32* [[ARG]], i32 1
; CHECK-NEXT:    [[TMP10:%.*]] = icmp ne i32* [[TMP7]], null
; CHECK-NEXT:    br i1 [[TMP10]], label [[BB17:%.*]], label [[BB13:%.*]]
; CHECK:       bb13:
; CHECK-NEXT:    [[TMP14:%.*]] = getelementptr inbounds i32, i32* [[ARG]], i32 2
; CHECK-NEXT:    [[TMP15:%.*]] = load i32, i32* [[TMP14]], align 8
; CHECK-NEXT:    [[TMP16:%.*]] = add i32 [[TMP15]], 1
; CHECK-NEXT:    br label [[BB30:%.*]]
; CHECK:       bb17:
; CHECK-NEXT:    [[TMP18:%.*]] = icmp eq i32 [[TMP6]], [[TMP5]]
; CHECK-NEXT:    [[TMP19:%.*]] = getelementptr inbounds i32, i32* [[ARG]], i32 3
; CHECK-NEXT:    [[TMP20:%.*]] = load i32, i32* [[TMP19]], align 8
; CHECK-NEXT:    br i1 [[TMP18]], label [[BB30]], label [[BB13]]
; CHECK:       bb30:
; CHECK-NEXT:    ret i32* [[TMP1]]
;
bb:
  %tmp = call i8* @malloc(i64 10368)
  %tmp1 = bitcast i8* %tmp to i32*
  %tmp4 = getelementptr inbounds i32, i32* %arg, i32 0
  %tmp5 = load i32, i32* %tmp4, align 8
  %tmp6 = add i32 %tmp5, 1
  %tmp7 = getelementptr inbounds i32, i32* %arg, i32 1
  %tmp10 = icmp ne i32* %tmp7, null
  br i1 %tmp10, label %bb17, label %bb13

bb13:
  %tmp14 = getelementptr inbounds i32, i32* %arg, i32 2
  %tmp15 = load i32, i32* %tmp14, align 8
  %tmp16 = add i32 %tmp15, 1
  br label %bb30

bb17:
  %tmp18 = icmp eq i32 %tmp6, %tmp5
  %tmp19 = getelementptr inbounds i32, i32* %arg, i32 3
  %tmp20 = load i32, i32* %tmp19, align 8
  br i1 %tmp18, label %bb30, label %bb13

bb30:
  ret i32* %tmp1
}

define void @spam.1(i32* %arg) {
bb:
  %tmp = alloca i8*, align 8
  %tmp4 = call i32* @spam(i32* %arg)
  br label %bb6

bb6:                                              ; preds = %bb5
  %tmp7 = getelementptr inbounds i32, i32* %tmp4, i32 1
  %tmp10 = load i32, i32* %tmp7, align 8
  %tmp11 = icmp ne i32 %tmp10, 0
  br i1 %tmp11, label %bb6, label %bb15

bb15:                                             ; preds = %bb12
  %tmp17 = icmp ult i32 %tmp10, 3
  call void @use(i1 %tmp17)
  br i1 %tmp17, label %bb6, label %bb24

bb24:
  ret void
}
