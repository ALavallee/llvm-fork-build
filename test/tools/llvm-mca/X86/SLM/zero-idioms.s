# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=slm -timeline -register-file-stats -iterations=1 < %s | FileCheck %s

subl  %eax, %eax
subq  %rax, %rax
xorl  %eax, %eax
xorq  %rax, %rax

pcmpgtb   %mm2, %mm2
pcmpgtd   %mm2, %mm2
# pcmpgtq   %mm2, %mm2 # invalid operand for instruction
pcmpgtw   %mm2, %mm2

pcmpgtb   %xmm2, %xmm2
pcmpgtd   %xmm2, %xmm2
pcmpgtq   %xmm2, %xmm2
pcmpgtw   %xmm2, %xmm2

psubb   %mm2, %mm2
psubd   %mm2, %mm2
psubq   %mm2, %mm2
psubw   %mm2, %mm2
psubb   %xmm2, %xmm2
psubd   %xmm2, %xmm2
psubq   %xmm2, %xmm2
psubw   %xmm2, %xmm2

psubsb   %mm2, %mm2
psubsw   %mm2, %mm2
psubsb   %xmm2, %xmm2
psubsw   %xmm2, %xmm2

psubusb   %mm2, %mm2
psubusw   %mm2, %mm2
psubusb   %xmm2, %xmm2
psubusw   %xmm2, %xmm2

andnps  %xmm0, %xmm0
andnpd  %xmm1, %xmm1
pandn   %mm2, %mm2
pandn   %xmm2, %xmm2
vpandn  %xmm3, %xmm3, %xmm3

xorps  %xmm0, %xmm0
xorpd  %xmm1, %xmm1
pxor   %mm2, %mm2
pxor   %xmm2, %xmm2

# CHECK:      Iterations:        1
# CHECK-NEXT: Instructions:      36
# CHECK-NEXT: Total Cycles:      29
# CHECK-NEXT: Total uOps:        38

# CHECK:      Dispatch Width:    2
# CHECK-NEXT: uOps Per Cycle:    1.31
# CHECK-NEXT: IPC:               1.24
# CHECK-NEXT: Block RThroughput: 23.0

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      1     0.50                        subl	%eax, %eax
# CHECK-NEXT:  1      1     0.50                        subq	%rax, %rax
# CHECK-NEXT:  1      1     0.50                        xorl	%eax, %eax
# CHECK-NEXT:  1      1     0.50                        xorq	%rax, %rax
# CHECK-NEXT:  1      1     0.50                        pcmpgtb	%mm2, %mm2
# CHECK-NEXT:  1      1     0.50                        pcmpgtd	%mm2, %mm2
# CHECK-NEXT:  1      1     0.50                        pcmpgtw	%mm2, %mm2
# CHECK-NEXT:  1      1     0.50                        pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT:  1      1     0.50                        pcmpgtd	%xmm2, %xmm2
# CHECK-NEXT:  1      1     0.50                        pcmpgtq	%xmm2, %xmm2
# CHECK-NEXT:  1      1     0.50                        pcmpgtw	%xmm2, %xmm2
# CHECK-NEXT:  1      1     0.50                        psubb	%mm2, %mm2
# CHECK-NEXT:  1      1     0.50                        psubd	%mm2, %mm2
# CHECK-NEXT:  2      4     4.00                        psubq	%mm2, %mm2
# CHECK-NEXT:  1      1     0.50                        psubw	%mm2, %mm2
# CHECK-NEXT:  1      1     0.50                        psubb	%xmm2, %xmm2
# CHECK-NEXT:  1      1     0.50                        psubd	%xmm2, %xmm2
# CHECK-NEXT:  2      4     4.00                        psubq	%xmm2, %xmm2
# CHECK-NEXT:  1      1     0.50                        psubw	%xmm2, %xmm2
# CHECK-NEXT:  1      1     0.50                        psubsb	%mm2, %mm2
# CHECK-NEXT:  1      1     0.50                        psubsw	%mm2, %mm2
# CHECK-NEXT:  1      1     0.50                        psubsb	%xmm2, %xmm2
# CHECK-NEXT:  1      1     0.50                        psubsw	%xmm2, %xmm2
# CHECK-NEXT:  1      1     0.50                        psubusb	%mm2, %mm2
# CHECK-NEXT:  1      1     0.50                        psubusw	%mm2, %mm2
# CHECK-NEXT:  1      1     0.50                        psubusb	%xmm2, %xmm2
# CHECK-NEXT:  1      1     0.50                        psubusw	%xmm2, %xmm2
# CHECK-NEXT:  1      1     0.50                        andnps	%xmm0, %xmm0
# CHECK-NEXT:  1      1     0.50                        andnpd	%xmm1, %xmm1
# CHECK-NEXT:  1      1     0.50                        pandn	%mm2, %mm2
# CHECK-NEXT:  1      1     0.50                        pandn	%xmm2, %xmm2
# CHECK-NEXT:  1      1     0.50                        vpandn	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      1     0.50                        xorps	%xmm0, %xmm0
# CHECK-NEXT:  1      1     0.50                        xorpd	%xmm1, %xmm1
# CHECK-NEXT:  1      1     0.50                        pxor	%mm2, %mm2
# CHECK-NEXT:  1      1     0.50                        pxor	%xmm2, %xmm2

# CHECK:      Register File statistics:
# CHECK-NEXT: Total number of mappings created:    35
# CHECK-NEXT: Max number of mappings used:         18

# CHECK:      Resources:
# CHECK-NEXT: [0]   - SLMDivider
# CHECK-NEXT: [1]   - SLMFPDivider
# CHECK-NEXT: [2]   - SLMFPMultiplier
# CHECK-NEXT: [3]   - SLM_FPC_RSV0
# CHECK-NEXT: [4]   - SLM_FPC_RSV1
# CHECK-NEXT: [5]   - SLM_IEC_RSV0
# CHECK-NEXT: [6]   - SLM_IEC_RSV1
# CHECK-NEXT: [7]   - SLM_MEC_RSV

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]
# CHECK-NEXT:  -      -      -     23.00  23.00  2.00   2.00    -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    Instructions:
# CHECK-NEXT:  -      -      -      -      -      -     1.00    -     subl	%eax, %eax
# CHECK-NEXT:  -      -      -      -      -      -     1.00    -     subq	%rax, %rax
# CHECK-NEXT:  -      -      -      -      -     1.00    -      -     xorl	%eax, %eax
# CHECK-NEXT:  -      -      -      -      -     1.00    -      -     xorq	%rax, %rax
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     pcmpgtb	%mm2, %mm2
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     pcmpgtd	%mm2, %mm2
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     pcmpgtw	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     pcmpgtd	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     pcmpgtq	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     pcmpgtw	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     psubb	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     psubd	%mm2, %mm2
# CHECK-NEXT:  -      -      -     8.00    -      -      -      -     psubq	%mm2, %mm2
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     psubw	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     psubb	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     psubd	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -     8.00    -      -      -     psubq	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     psubw	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     psubsb	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     psubsw	%mm2, %mm2
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     psubsb	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     psubsw	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     psubusb	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     psubusw	%mm2, %mm2
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     psubusb	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     psubusw	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     andnps	%xmm0, %xmm0
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     andnpd	%xmm1, %xmm1
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     pandn	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     pandn	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     vpandn	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     xorps	%xmm0, %xmm0
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     xorpd	%xmm1, %xmm1
# CHECK-NEXT:  -      -      -      -     1.00    -      -      -     pxor	%mm2, %mm2
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     pxor	%xmm2, %xmm2

# CHECK:      Timeline view:
# CHECK-NEXT:                     0123456789
# CHECK-NEXT: Index     0123456789          012345678

# CHECK:      [0,0]     DeER .    .    .    .    .  .   subl	%eax, %eax
# CHECK-NEXT: [0,1]     D=eER.    .    .    .    .  .   subq	%rax, %rax
# CHECK-NEXT: [0,2]     .DeER.    .    .    .    .  .   xorl	%eax, %eax
# CHECK-NEXT: [0,3]     .D=eER    .    .    .    .  .   xorq	%rax, %rax
# CHECK-NEXT: [0,4]     . DeER    .    .    .    .  .   pcmpgtb	%mm2, %mm2
# CHECK-NEXT: [0,5]     . D=eER   .    .    .    .  .   pcmpgtd	%mm2, %mm2
# CHECK-NEXT: [0,6]     .  D=eER  .    .    .    .  .   pcmpgtw	%mm2, %mm2
# CHECK-NEXT: [0,7]     .  DeE-R  .    .    .    .  .   pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT: [0,8]     .   DeER  .    .    .    .  .   pcmpgtd	%xmm2, %xmm2
# CHECK-NEXT: [0,9]     .   D=eER .    .    .    .  .   pcmpgtq	%xmm2, %xmm2
# CHECK-NEXT: [0,10]    .    D=eER.    .    .    .  .   pcmpgtw	%xmm2, %xmm2
# CHECK-NEXT: [0,11]    .    DeE-R.    .    .    .  .   psubb	%mm2, %mm2
# CHECK-NEXT: [0,12]    .    .DeER.    .    .    .  .   psubd	%mm2, %mm2
# CHECK-NEXT: [0,13]    .    . DeeeeER .    .    .  .   psubq	%mm2, %mm2
# CHECK-NEXT: [0,14]    .    .  D=======eER .    .  .   psubw	%mm2, %mm2
# CHECK-NEXT: [0,15]    .    .  DeE-------R .    .  .   psubb	%xmm2, %xmm2
# CHECK-NEXT: [0,16]    .    .   DeE------R .    .  .   psubd	%xmm2, %xmm2
# CHECK-NEXT: [0,17]    .    .    DeeeeE--R .    .  .   psubq	%xmm2, %xmm2
# CHECK-NEXT: [0,18]    .    .    .D=====eER.    .  .   psubw	%xmm2, %xmm2
# CHECK-NEXT: [0,19]    .    .    .D======eER    .  .   psubsb	%mm2, %mm2
# CHECK-NEXT: [0,20]    .    .    . D======eER   .  .   psubsw	%mm2, %mm2
# CHECK-NEXT: [0,21]    .    .    . D======eER   .  .   psubsb	%xmm2, %xmm2
# CHECK-NEXT: [0,22]    .    .    .  D======eER  .  .   psubsw	%xmm2, %xmm2
# CHECK-NEXT: [0,23]    .    .    .  D======eER  .  .   psubusb	%mm2, %mm2
# CHECK-NEXT: [0,24]    .    .    .   D======eER .  .   psubusw	%mm2, %mm2
# CHECK-NEXT: [0,25]    .    .    .   D======eER .  .   psubusb	%xmm2, %xmm2
# CHECK-NEXT: [0,26]    .    .    .    D======eER.  .   psubusw	%xmm2, %xmm2
# CHECK-NEXT: [0,27]    .    .    .    D======eER.  .   andnps	%xmm0, %xmm0
# CHECK-NEXT: [0,28]    .    .    .    .D======eER  .   andnpd	%xmm1, %xmm1
# CHECK-NEXT: [0,29]    .    .    .    .D======eER  .   pandn	%mm2, %mm2
# CHECK-NEXT: [0,30]    .    .    .    . D======eER .   pandn	%xmm2, %xmm2
# CHECK-NEXT: [0,31]    .    .    .    . D======eER .   vpandn	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,32]    .    .    .    .  D======eER.   xorps	%xmm0, %xmm0
# CHECK-NEXT: [0,33]    .    .    .    .  D======eER.   xorpd	%xmm1, %xmm1
# CHECK-NEXT: [0,34]    .    .    .    .   D======eER   pxor	%mm2, %mm2
# CHECK-NEXT: [0,35]    .    .    .    .   D======eER   pxor	%xmm2, %xmm2

# CHECK:      Average Wait times (based on the timeline view):
# CHECK-NEXT: [0]: Executions
# CHECK-NEXT: [1]: Average time spent waiting in a scheduler's queue
# CHECK-NEXT: [2]: Average time spent waiting in a scheduler's queue while ready
# CHECK-NEXT: [3]: Average time elapsed from WB until retire stage

# CHECK:            [0]    [1]    [2]    [3]
# CHECK-NEXT: 0.     1     1.0    1.0    0.0       subl	%eax, %eax
# CHECK-NEXT: 1.     1     2.0    0.0    0.0       subq	%rax, %rax
# CHECK-NEXT: 2.     1     1.0    1.0    0.0       xorl	%eax, %eax
# CHECK-NEXT: 3.     1     2.0    0.0    0.0       xorq	%rax, %rax
# CHECK-NEXT: 4.     1     1.0    1.0    0.0       pcmpgtb	%mm2, %mm2
# CHECK-NEXT: 5.     1     2.0    0.0    0.0       pcmpgtd	%mm2, %mm2
# CHECK-NEXT: 6.     1     2.0    0.0    0.0       pcmpgtw	%mm2, %mm2
# CHECK-NEXT: 7.     1     1.0    1.0    1.0       pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT: 8.     1     1.0    0.0    0.0       pcmpgtd	%xmm2, %xmm2
# CHECK-NEXT: 9.     1     2.0    0.0    0.0       pcmpgtq	%xmm2, %xmm2
# CHECK-NEXT: 10.    1     2.0    0.0    0.0       pcmpgtw	%xmm2, %xmm2
# CHECK-NEXT: 11.    1     1.0    0.0    1.0       psubb	%mm2, %mm2
# CHECK-NEXT: 12.    1     1.0    0.0    0.0       psubd	%mm2, %mm2
# CHECK-NEXT: 13.    1     1.0    0.0    0.0       psubq	%mm2, %mm2
# CHECK-NEXT: 14.    1     8.0    4.0    0.0       psubw	%mm2, %mm2
# CHECK-NEXT: 15.    1     1.0    1.0    7.0       psubb	%xmm2, %xmm2
# CHECK-NEXT: 16.    1     1.0    0.0    6.0       psubd	%xmm2, %xmm2
# CHECK-NEXT: 17.    1     1.0    0.0    2.0       psubq	%xmm2, %xmm2
# CHECK-NEXT: 18.    1     6.0    2.0    0.0       psubw	%xmm2, %xmm2
# CHECK-NEXT: 19.    1     7.0    1.0    0.0       psubsb	%mm2, %mm2
# CHECK-NEXT: 20.    1     7.0    0.0    0.0       psubsw	%mm2, %mm2
# CHECK-NEXT: 21.    1     7.0    1.0    0.0       psubsb	%xmm2, %xmm2
# CHECK-NEXT: 22.    1     7.0    0.0    0.0       psubsw	%xmm2, %xmm2
# CHECK-NEXT: 23.    1     7.0    0.0    0.0       psubusb	%mm2, %mm2
# CHECK-NEXT: 24.    1     7.0    0.0    0.0       psubusw	%mm2, %mm2
# CHECK-NEXT: 25.    1     7.0    0.0    0.0       psubusb	%xmm2, %xmm2
# CHECK-NEXT: 26.    1     7.0    0.0    0.0       psubusw	%xmm2, %xmm2
# CHECK-NEXT: 27.    1     7.0    7.0    0.0       andnps	%xmm0, %xmm0
# CHECK-NEXT: 28.    1     7.0    7.0    0.0       andnpd	%xmm1, %xmm1
# CHECK-NEXT: 29.    1     7.0    1.0    0.0       pandn	%mm2, %mm2
# CHECK-NEXT: 30.    1     7.0    1.0    0.0       pandn	%xmm2, %xmm2
# CHECK-NEXT: 31.    1     7.0    7.0    0.0       vpandn	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 32.    1     7.0    7.0    0.0       xorps	%xmm0, %xmm0
# CHECK-NEXT: 33.    1     7.0    7.0    0.0       xorpd	%xmm1, %xmm1
# CHECK-NEXT: 34.    1     7.0    2.0    0.0       pxor	%mm2, %mm2
# CHECK-NEXT: 35.    1     7.0    7.0    0.0       pxor	%xmm2, %xmm2
# CHECK-NEXT:        1     4.3    1.6    0.5       <total>
