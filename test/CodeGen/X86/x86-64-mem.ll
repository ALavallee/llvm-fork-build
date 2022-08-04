; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-apple-darwin | FileCheck %s --check-prefix=DARWIN
; RUN: llc < %s -mtriple=x86_64-pc-linux -relocation-model=static | FileCheck %s --check-prefix=LINUX

@ptr = external global i32*		; <i32**> [#uses=1]
@src = external global [0 x i32]		; <[0 x i32]*> [#uses=1]
@dst = external global [0 x i32]		; <[0 x i32]*> [#uses=1]
@lptr = internal global i32* null		; <i32**> [#uses=1]
@ldst = internal global [500 x i32] zeroinitializer, align 32		; <[500 x i32]*> [#uses=1]
@lsrc = internal global [500 x i32] zeroinitializer, align 32		; <[500 x i32]*> [#uses=0]
@bsrc = internal global [500000 x i32] zeroinitializer, align 32		; <[500000 x i32]*> [#uses=0]
@bdst = internal global [500000 x i32] zeroinitializer, align 32		; <[500000 x i32]*> [#uses=0]

define void @test1() nounwind {
; DARWIN-LABEL: test1:
; DARWIN:       ## %bb.0:
; DARWIN-NEXT:    movq _src@GOTPCREL(%rip), %rax
; DARWIN-NEXT:    movl (%rax), %eax
; DARWIN-NEXT:    movq _dst@GOTPCREL(%rip), %rcx
; DARWIN-NEXT:    movl %eax, (%rcx)
; DARWIN-NEXT:    retq
;
; LINUX-LABEL: test1:
; LINUX:       # %bb.0:
; LINUX-NEXT:    movq src@GOTPCREL(%rip), %rax
; LINUX-NEXT:    movl (%rax), %eax
; LINUX-NEXT:    movq dst@GOTPCREL(%rip), %rcx
; LINUX-NEXT:    movl %eax, (%rcx)
; LINUX-NEXT:    retq
	%tmp = load i32, i32* getelementptr ([0 x i32], [0 x i32]* @src, i32 0, i32 0)		; <i32> [#uses=1]
	store i32 %tmp, i32* getelementptr ([0 x i32], [0 x i32]* @dst, i32 0, i32 0)
	ret void
}

define void @test2() nounwind {
; DARWIN-LABEL: test2:
; DARWIN:       ## %bb.0:
; DARWIN-NEXT:    movq _dst@GOTPCREL(%rip), %rax
; DARWIN-NEXT:    movq _ptr@GOTPCREL(%rip), %rcx
; DARWIN-NEXT:    movq %rax, (%rcx)
; DARWIN-NEXT:    retq
;
; LINUX-LABEL: test2:
; LINUX:       # %bb.0:
; LINUX-NEXT:    movq dst@GOTPCREL(%rip), %rax
; LINUX-NEXT:    movq ptr@GOTPCREL(%rip), %rcx
; LINUX-NEXT:    movq %rax, (%rcx)
; LINUX-NEXT:    retq
	store i32* getelementptr ([0 x i32], [0 x i32]* @dst, i32 0, i32 0), i32** @ptr
	ret void
}

define void @test3() nounwind {
; DARWIN-LABEL: test3:
; DARWIN:       ## %bb.0:
; DARWIN-NEXT:    leaq _ldst(%rip), %rax
; DARWIN-NEXT:    movq %rax, _lptr(%rip)
; DARWIN-NEXT:    retq
;
; LINUX-LABEL: test3:
; LINUX:       # %bb.0:
; LINUX-NEXT:    movq $ldst, lptr(%rip)
; LINUX-NEXT:    retq
	store i32* getelementptr ([500 x i32], [500 x i32]* @ldst, i32 0, i32 0), i32** @lptr
	br label %return

return:		; preds = %0
	ret void
}
