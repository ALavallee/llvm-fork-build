; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+f -verify-machineinstrs < %s \
; RUN:   -target-abi=ilp32f | FileCheck -check-prefix=RV32IF %s
; RUN: llc -mtriple=riscv64 -mattr=+f -verify-machineinstrs < %s \
; RUN:   -target-abi=lp64f | FileCheck -check-prefix=RV64IF %s
; RUN: llc -mtriple=riscv32 -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=RV32I %s
; RUN: llc -mtriple=riscv64 -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=RV64I %s

define i32 @fcmp_false(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_false:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    li a0, 0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_false:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    li a0, 0
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_false:
; RV32I:       # %bb.0:
; RV32I-NEXT:    li a0, 0
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_false:
; RV64I:       # %bb.0:
; RV64I-NEXT:    li a0, 0
; RV64I-NEXT:    ret
  %1 = fcmp false float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_oeq(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_oeq:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    feq.s a0, fa0, fa1
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_oeq:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    feq.s a0, fa0, fa1
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_oeq:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __eqsf2@plt
; RV32I-NEXT:    seqz a0, a0
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_oeq:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __eqsf2@plt
; RV64I-NEXT:    seqz a0, a0
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = fcmp oeq float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ogt(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_ogt:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    flt.s a0, fa1, fa0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_ogt:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    flt.s a0, fa1, fa0
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_ogt:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __gtsf2@plt
; RV32I-NEXT:    sgtz a0, a0
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_ogt:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __gtsf2@plt
; RV64I-NEXT:    sgtz a0, a0
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = fcmp ogt float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_oge(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_oge:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fle.s a0, fa1, fa0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_oge:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fle.s a0, fa1, fa0
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_oge:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __gesf2@plt
; RV32I-NEXT:    li a1, -1
; RV32I-NEXT:    slt a0, a1, a0
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_oge:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __gesf2@plt
; RV64I-NEXT:    li a1, -1
; RV64I-NEXT:    slt a0, a1, a0
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = fcmp oge float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_olt(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_olt:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    flt.s a0, fa0, fa1
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_olt:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    flt.s a0, fa0, fa1
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_olt:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __ltsf2@plt
; RV32I-NEXT:    slti a0, a0, 0
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_olt:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __ltsf2@plt
; RV64I-NEXT:    slti a0, a0, 0
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = fcmp olt float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ole(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_ole:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fle.s a0, fa0, fa1
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_ole:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fle.s a0, fa0, fa1
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_ole:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __lesf2@plt
; RV32I-NEXT:    slti a0, a0, 1
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_ole:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __lesf2@plt
; RV64I-NEXT:    slti a0, a0, 1
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = fcmp ole float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_one(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_one:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    flt.s a0, fa0, fa1
; RV32IF-NEXT:    flt.s a1, fa1, fa0
; RV32IF-NEXT:    or a0, a1, a0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_one:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    flt.s a0, fa0, fa1
; RV64IF-NEXT:    flt.s a1, fa1, fa0
; RV64IF-NEXT:    or a0, a1, a0
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_one:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s1, 4(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s2, 0(sp) # 4-byte Folded Spill
; RV32I-NEXT:    mv s0, a1
; RV32I-NEXT:    mv s1, a0
; RV32I-NEXT:    call __eqsf2@plt
; RV32I-NEXT:    snez s2, a0
; RV32I-NEXT:    mv a0, s1
; RV32I-NEXT:    mv a1, s0
; RV32I-NEXT:    call __unordsf2@plt
; RV32I-NEXT:    seqz a0, a0
; RV32I-NEXT:    and a0, a0, s2
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s1, 4(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s2, 0(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_one:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -32
; RV64I-NEXT:    sd ra, 24(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s0, 16(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s1, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s2, 0(sp) # 8-byte Folded Spill
; RV64I-NEXT:    mv s0, a1
; RV64I-NEXT:    mv s1, a0
; RV64I-NEXT:    call __eqsf2@plt
; RV64I-NEXT:    snez s2, a0
; RV64I-NEXT:    mv a0, s1
; RV64I-NEXT:    mv a1, s0
; RV64I-NEXT:    call __unordsf2@plt
; RV64I-NEXT:    seqz a0, a0
; RV64I-NEXT:    and a0, a0, s2
; RV64I-NEXT:    ld ra, 24(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s0, 16(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s1, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s2, 0(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 32
; RV64I-NEXT:    ret
  %1 = fcmp one float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ord(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_ord:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    feq.s a0, fa1, fa1
; RV32IF-NEXT:    feq.s a1, fa0, fa0
; RV32IF-NEXT:    and a0, a1, a0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_ord:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    feq.s a0, fa1, fa1
; RV64IF-NEXT:    feq.s a1, fa0, fa0
; RV64IF-NEXT:    and a0, a1, a0
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_ord:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __unordsf2@plt
; RV32I-NEXT:    seqz a0, a0
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_ord:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __unordsf2@plt
; RV64I-NEXT:    seqz a0, a0
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = fcmp ord float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ueq(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_ueq:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    flt.s a0, fa0, fa1
; RV32IF-NEXT:    flt.s a1, fa1, fa0
; RV32IF-NEXT:    or a0, a1, a0
; RV32IF-NEXT:    xori a0, a0, 1
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_ueq:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    flt.s a0, fa0, fa1
; RV64IF-NEXT:    flt.s a1, fa1, fa0
; RV64IF-NEXT:    or a0, a1, a0
; RV64IF-NEXT:    xori a0, a0, 1
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_ueq:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s0, 8(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s1, 4(sp) # 4-byte Folded Spill
; RV32I-NEXT:    sw s2, 0(sp) # 4-byte Folded Spill
; RV32I-NEXT:    mv s0, a1
; RV32I-NEXT:    mv s1, a0
; RV32I-NEXT:    call __eqsf2@plt
; RV32I-NEXT:    seqz s2, a0
; RV32I-NEXT:    mv a0, s1
; RV32I-NEXT:    mv a1, s0
; RV32I-NEXT:    call __unordsf2@plt
; RV32I-NEXT:    snez a0, a0
; RV32I-NEXT:    or a0, a0, s2
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s0, 8(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s1, 4(sp) # 4-byte Folded Reload
; RV32I-NEXT:    lw s2, 0(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_ueq:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -32
; RV64I-NEXT:    sd ra, 24(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s0, 16(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s1, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    sd s2, 0(sp) # 8-byte Folded Spill
; RV64I-NEXT:    mv s0, a1
; RV64I-NEXT:    mv s1, a0
; RV64I-NEXT:    call __eqsf2@plt
; RV64I-NEXT:    seqz s2, a0
; RV64I-NEXT:    mv a0, s1
; RV64I-NEXT:    mv a1, s0
; RV64I-NEXT:    call __unordsf2@plt
; RV64I-NEXT:    snez a0, a0
; RV64I-NEXT:    or a0, a0, s2
; RV64I-NEXT:    ld ra, 24(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s0, 16(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s1, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    ld s2, 0(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 32
; RV64I-NEXT:    ret
  %1 = fcmp ueq float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ugt(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_ugt:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fle.s a0, fa0, fa1
; RV32IF-NEXT:    xori a0, a0, 1
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_ugt:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fle.s a0, fa0, fa1
; RV64IF-NEXT:    xori a0, a0, 1
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_ugt:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __lesf2@plt
; RV32I-NEXT:    sgtz a0, a0
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_ugt:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __lesf2@plt
; RV64I-NEXT:    sgtz a0, a0
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = fcmp ugt float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_uge(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_uge:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    flt.s a0, fa0, fa1
; RV32IF-NEXT:    xori a0, a0, 1
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_uge:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    flt.s a0, fa0, fa1
; RV64IF-NEXT:    xori a0, a0, 1
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_uge:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __ltsf2@plt
; RV32I-NEXT:    li a1, -1
; RV32I-NEXT:    slt a0, a1, a0
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_uge:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __ltsf2@plt
; RV64I-NEXT:    li a1, -1
; RV64I-NEXT:    slt a0, a1, a0
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = fcmp uge float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ult(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_ult:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fle.s a0, fa1, fa0
; RV32IF-NEXT:    xori a0, a0, 1
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_ult:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fle.s a0, fa1, fa0
; RV64IF-NEXT:    xori a0, a0, 1
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_ult:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __gesf2@plt
; RV32I-NEXT:    slti a0, a0, 0
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_ult:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __gesf2@plt
; RV64I-NEXT:    slti a0, a0, 0
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = fcmp ult float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ule(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_ule:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    flt.s a0, fa1, fa0
; RV32IF-NEXT:    xori a0, a0, 1
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_ule:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    flt.s a0, fa1, fa0
; RV64IF-NEXT:    xori a0, a0, 1
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_ule:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __gtsf2@plt
; RV32I-NEXT:    slti a0, a0, 1
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_ule:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __gtsf2@plt
; RV64I-NEXT:    slti a0, a0, 1
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = fcmp ule float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_une(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_une:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    feq.s a0, fa0, fa1
; RV32IF-NEXT:    xori a0, a0, 1
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_une:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    feq.s a0, fa0, fa1
; RV64IF-NEXT:    xori a0, a0, 1
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_une:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __nesf2@plt
; RV32I-NEXT:    snez a0, a0
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_une:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __nesf2@plt
; RV64I-NEXT:    snez a0, a0
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = fcmp une float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_uno(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_uno:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    feq.s a0, fa1, fa1
; RV32IF-NEXT:    feq.s a1, fa0, fa0
; RV32IF-NEXT:    and a0, a1, a0
; RV32IF-NEXT:    xori a0, a0, 1
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_uno:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    feq.s a0, fa1, fa1
; RV64IF-NEXT:    feq.s a1, fa0, fa0
; RV64IF-NEXT:    and a0, a1, a0
; RV64IF-NEXT:    xori a0, a0, 1
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_uno:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp) # 4-byte Folded Spill
; RV32I-NEXT:    call __unordsf2@plt
; RV32I-NEXT:    snez a0, a0
; RV32I-NEXT:    lw ra, 12(sp) # 4-byte Folded Reload
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_uno:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi sp, sp, -16
; RV64I-NEXT:    sd ra, 8(sp) # 8-byte Folded Spill
; RV64I-NEXT:    call __unordsf2@plt
; RV64I-NEXT:    snez a0, a0
; RV64I-NEXT:    ld ra, 8(sp) # 8-byte Folded Reload
; RV64I-NEXT:    addi sp, sp, 16
; RV64I-NEXT:    ret
  %1 = fcmp uno float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_true(float %a, float %b) nounwind {
; RV32IF-LABEL: fcmp_true:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    li a0, 1
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fcmp_true:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    li a0, 1
; RV64IF-NEXT:    ret
;
; RV32I-LABEL: fcmp_true:
; RV32I:       # %bb.0:
; RV32I-NEXT:    li a0, 1
; RV32I-NEXT:    ret
;
; RV64I-LABEL: fcmp_true:
; RV64I:       # %bb.0:
; RV64I-NEXT:    li a0, 1
; RV64I-NEXT:    ret
  %1 = fcmp true float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}
