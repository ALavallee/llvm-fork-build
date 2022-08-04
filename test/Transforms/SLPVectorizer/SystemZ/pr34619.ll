; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -mtriple=systemz-unknown -mcpu=z13 -slp-vectorizer -S < %s | FileCheck %s

@bar = external global [4 x [4 x i32]], align 4
@dct_luma = external global [4 x [4 x i32]], align 4

define void @foo() local_unnamed_addr {
; CHECK-LABEL: @foo(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[ADD277:%.*]] = add nsw i32 undef, undef
; CHECK-NEXT:    store i32 [[ADD277]], i32* getelementptr inbounds ([4 x [4 x i32]], [4 x [4 x i32]]* @bar, i64 0, i64 3, i64 1), align 4
; CHECK-NEXT:    [[TMP0:%.*]] = load i32, i32* getelementptr inbounds ([4 x [4 x i32]], [4 x [4 x i32]]* @bar, i64 0, i64 3, i64 0), align 4
; CHECK-NEXT:    [[ARRAYIDX372:%.*]] = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* @dct_luma, i64 0, i64 3, i64 0
; CHECK-NEXT:    [[ARRAYIDX372_1:%.*]] = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* @dct_luma, i64 0, i64 3, i64 1
; CHECK-NEXT:    [[ARRAYIDX372_2:%.*]] = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* @dct_luma, i64 0, i64 3, i64 2
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i32>, <2 x i32>* bitcast (i32* getelementptr inbounds ([4 x [4 x i32]], [4 x [4 x i32]]* @bar, i64 0, i64 3, i64 2) to <2 x i32>*), align 4
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <4 x i32> poison, i32 [[TMP0]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = insertelement <4 x i32> [[TMP2]], i32 [[ADD277]], i32 1
; CHECK-NEXT:    [[TMP4:%.*]] = shufflevector <2 x i32> [[TMP1]], <2 x i32> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
; CHECK-NEXT:    [[TMP5:%.*]] = shufflevector <4 x i32> [[TMP3]], <4 x i32> [[TMP4]], <4 x i32> <i32 0, i32 1, i32 4, i32 5>
; CHECK-NEXT:    [[TMP6:%.*]] = add nsw <4 x i32> poison, [[TMP5]]
; CHECK-NEXT:    [[TMP7:%.*]] = ashr <4 x i32> [[TMP6]], <i32 6, i32 6, i32 6, i32 6>
; CHECK-NEXT:    [[ARRAYIDX372_3:%.*]] = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* @dct_luma, i64 0, i64 3, i64 3
; CHECK-NEXT:    [[TMP8:%.*]] = bitcast i32* [[ARRAYIDX372]] to <4 x i32>*
; CHECK-NEXT:    store <4 x i32> [[TMP7]], <4 x i32>* [[TMP8]], align 4
; CHECK-NEXT:    unreachable
;
entry:
  %add277 = add nsw i32 undef, undef
  store i32 %add277, i32* getelementptr inbounds ([4 x [4 x i32]], [4 x [4 x i32]]* @bar, i64 0, i64 3, i64 1), align 4
  %0 = load i32, i32* getelementptr inbounds ([4 x [4 x i32]], [4 x [4 x i32]]* @bar, i64 0, i64 3, i64 0), align 4
  %sub355 = add nsw i32 undef, %0
  %shr.i = ashr i32 %sub355, 6
  %arrayidx372 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* @dct_luma, i64 0, i64 3, i64 0
  store i32 %shr.i, i32* %arrayidx372, align 4
  %sub355.1 = add nsw i32 undef, %add277
  %shr.i.1 = ashr i32 %sub355.1, 6
  %arrayidx372.1 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* @dct_luma, i64 0, i64 3, i64 1
  store i32 %shr.i.1, i32* %arrayidx372.1, align 4
  %1 = load i32, i32* getelementptr inbounds ([4 x [4 x i32]], [4 x [4 x i32]]* @bar, i64 0, i64 3, i64 2), align 4
  %sub355.2 = add nsw i32 undef, %1
  %shr.i.2 = ashr i32 %sub355.2, 6
  %arrayidx372.2 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* @dct_luma, i64 0, i64 3, i64 2
  store i32 %shr.i.2, i32* %arrayidx372.2, align 4
  %2 = load i32, i32* getelementptr inbounds ([4 x [4 x i32]], [4 x [4 x i32]]* @bar, i64 0, i64 3, i64 3), align 4
  %sub355.3 = add nsw i32 undef, %2
  %shr.i.3 = ashr i32 %sub355.3, 6
  %arrayidx372.3 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* @dct_luma, i64 0, i64 3, i64 3
  store i32 %shr.i.3, i32* %arrayidx372.3, align 4
  unreachable
}
