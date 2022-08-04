# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=x86-64 -timeline -timeline-max-iterations=3 -register-file-stats < %s | FileCheck %s

xor %rsi, %rsi
add %rcx, %rcx
add %rcx, %rcx
add %rcx, %rcx
add %rcx, %rcx
mov %esi, %ecx

# CHECK:      Iterations:        100
# CHECK-NEXT: Instructions:      600
# CHECK-NEXT: Total Cycles:      172
# CHECK-NEXT: Total uOps:        600

# CHECK:      Dispatch Width:    4
# CHECK-NEXT: uOps Per Cycle:    3.49
# CHECK-NEXT: IPC:               3.49
# CHECK-NEXT: Block RThroughput: 1.7

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      0     0.25                        xorq	%rsi, %rsi
# CHECK-NEXT:  1      1     0.33                        addq	%rcx, %rcx
# CHECK-NEXT:  1      1     0.33                        addq	%rcx, %rcx
# CHECK-NEXT:  1      1     0.33                        addq	%rcx, %rcx
# CHECK-NEXT:  1      1     0.33                        addq	%rcx, %rcx
# CHECK-NEXT:  1      1     0.33                        movl	%esi, %ecx

# CHECK:      Register File statistics:
# CHECK-NEXT: Total number of mappings created:    900
# CHECK-NEXT: Max number of mappings used:         115

# CHECK:      Resources:
# CHECK-NEXT: [0]   - SBDivider
# CHECK-NEXT: [1]   - SBFPDivider
# CHECK-NEXT: [2]   - SBPort0
# CHECK-NEXT: [3]   - SBPort1
# CHECK-NEXT: [4]   - SBPort4
# CHECK-NEXT: [5]   - SBPort5
# CHECK-NEXT: [6.0] - SBPort23
# CHECK-NEXT: [6.1] - SBPort23

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]
# CHECK-NEXT:  -      -     1.66   1.67    -     1.67    -      -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
# CHECK-NEXT:  -      -      -      -      -      -      -      -     xorq	%rsi, %rsi
# CHECK-NEXT:  -      -     0.66   0.33    -     0.01    -      -     addq	%rcx, %rcx
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     addq	%rcx, %rcx
# CHECK-NEXT:  -      -      -     0.33    -     0.67    -      -     addq	%rcx, %rcx
# CHECK-NEXT:  -      -      -     0.01    -     0.99    -      -     addq	%rcx, %rcx
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -     movl	%esi, %ecx

# CHECK:      Timeline view:
# CHECK-NEXT: Index     0123456789

# CHECK:      [0,0]     DR   .   .   xorq	%rsi, %rsi
# CHECK-NEXT: [0,1]     DeER .   .   addq	%rcx, %rcx
# CHECK-NEXT: [0,2]     D=eER.   .   addq	%rcx, %rcx
# CHECK-NEXT: [0,3]     D==eER   .   addq	%rcx, %rcx
# CHECK-NEXT: [0,4]     .D==eER  .   addq	%rcx, %rcx
# CHECK-NEXT: [0,5]     .DeE--R  .   movl	%esi, %ecx
# CHECK-NEXT: [1,0]     .D----R  .   xorq	%rsi, %rsi
# CHECK-NEXT: [1,1]     .D=eE-R  .   addq	%rcx, %rcx
# CHECK-NEXT: [1,2]     . D=eER  .   addq	%rcx, %rcx
# CHECK-NEXT: [1,3]     . D==eER .   addq	%rcx, %rcx
# CHECK-NEXT: [1,4]     . D===eER.   addq	%rcx, %rcx
# CHECK-NEXT: [1,5]     . DeE---R.   movl	%esi, %ecx
# CHECK-NEXT: [2,0]     .  D----R.   xorq	%rsi, %rsi
# CHECK-NEXT: [2,1]     .  DeE--R.   addq	%rcx, %rcx
# CHECK-NEXT: [2,2]     .  D=eE-R.   addq	%rcx, %rcx
# CHECK-NEXT: [2,3]     .  D==eER.   addq	%rcx, %rcx
# CHECK-NEXT: [2,4]     .   D==eER   addq	%rcx, %rcx
# CHECK-NEXT: [2,5]     .   DeE--R   movl	%esi, %ecx

# CHECK:      Average Wait times (based on the timeline view):
# CHECK-NEXT: [0]: Executions
# CHECK-NEXT: [1]: Average time spent waiting in a scheduler's queue
# CHECK-NEXT: [2]: Average time spent waiting in a scheduler's queue while ready
# CHECK-NEXT: [3]: Average time elapsed from WB until retire stage

# CHECK:            [0]    [1]    [2]    [3]
# CHECK-NEXT: 0.     3     0.0    0.0    2.7       xorq	%rsi, %rsi
# CHECK-NEXT: 1.     3     1.3    0.3    1.0       addq	%rcx, %rcx
# CHECK-NEXT: 2.     3     2.0    0.0    0.3       addq	%rcx, %rcx
# CHECK-NEXT: 3.     3     3.0    0.0    0.0       addq	%rcx, %rcx
# CHECK-NEXT: 4.     3     3.3    0.0    0.0       addq	%rcx, %rcx
# CHECK-NEXT: 5.     3     1.0    1.0    2.3       movl	%esi, %ecx
# CHECK-NEXT:        3     1.8    0.2    1.1       <total>
