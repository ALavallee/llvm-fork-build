; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=amdgcn-- -verify-machineinstrs | FileCheck %s --check-prefix=SI
; RUN: llc < %s -mtriple=amdgcn-- -mcpu=tonga -mattr=-flat-for-global -verify-machineinstrs | FileCheck %s --check-prefix=VI

declare i16 @llvm.bswap.i16(i16) nounwind readnone
declare <2 x i16> @llvm.bswap.v2i16(<2 x i16>) nounwind readnone
declare <3 x i16> @llvm.bswap.v3i16(<3 x i16>) nounwind readnone
declare <4 x i16> @llvm.bswap.v4i16(<4 x i16>) nounwind readnone
declare i32 @llvm.bswap.i32(i32) nounwind readnone
declare <2 x i32> @llvm.bswap.v2i32(<2 x i32>) nounwind readnone
declare <4 x i32> @llvm.bswap.v4i32(<4 x i32>) nounwind readnone
declare <8 x i32> @llvm.bswap.v8i32(<8 x i32>) nounwind readnone
declare i64 @llvm.bswap.i64(i64) nounwind readnone
declare <2 x i64> @llvm.bswap.v2i64(<2 x i64>) nounwind readnone
declare <4 x i64> @llvm.bswap.v4i64(<4 x i64>) nounwind readnone
declare i48 @llvm.bswap.i48(i48) #1

define amdgpu_kernel void @test_bswap_i32(i32 addrspace(1)* %out, i32 addrspace(1)* %in) nounwind {
; SI-LABEL: test_bswap_i32:
; SI:       ; %bb.0:
; SI-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x9
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    s_load_dword s4, s[2:3], 0x0
; SI-NEXT:    s_mov_b32 s3, 0xf000
; SI-NEXT:    s_mov_b32 s2, -1
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v0, s4, s4, 8
; SI-NEXT:    v_alignbit_b32 v1, s4, s4, 24
; SI-NEXT:    s_mov_b32 s4, 0xff00ff
; SI-NEXT:    v_bfi_b32 v0, s4, v1, v0
; SI-NEXT:    buffer_store_dword v0, off, s[0:3], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: test_bswap_i32:
; VI:       ; %bb.0:
; VI-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; VI-NEXT:    v_mov_b32_e32 v0, 0x10203
; VI-NEXT:    s_mov_b32 s7, 0xf000
; VI-NEXT:    s_mov_b32 s6, -1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_load_dword s2, s[2:3], 0x0
; VI-NEXT:    s_mov_b32 s4, s0
; VI-NEXT:    s_mov_b32 s5, s1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_perm_b32 v0, 0, s2, v0
; VI-NEXT:    buffer_store_dword v0, off, s[4:7], 0
; VI-NEXT:    s_endpgm
  %val = load i32, i32 addrspace(1)* %in, align 4
  %bswap = call i32 @llvm.bswap.i32(i32 %val) nounwind readnone
  store i32 %bswap, i32 addrspace(1)* %out, align 4
  ret void
}

define amdgpu_kernel void @test_bswap_v2i32(<2 x i32> addrspace(1)* %out, <2 x i32> addrspace(1)* %in) nounwind {
; SI-LABEL: test_bswap_v2i32:
; SI:       ; %bb.0:
; SI-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x9
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    s_load_dwordx2 s[4:5], s[2:3], 0x0
; SI-NEXT:    s_mov_b32 s3, 0xf000
; SI-NEXT:    s_mov_b32 s2, -1
; SI-NEXT:    s_mov_b32 s6, 0xff00ff
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v0, s5, s5, 8
; SI-NEXT:    v_alignbit_b32 v1, s5, s5, 24
; SI-NEXT:    v_alignbit_b32 v2, s4, s4, 8
; SI-NEXT:    v_alignbit_b32 v3, s4, s4, 24
; SI-NEXT:    v_bfi_b32 v1, s6, v1, v0
; SI-NEXT:    v_bfi_b32 v0, s6, v3, v2
; SI-NEXT:    buffer_store_dwordx2 v[0:1], off, s[0:3], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: test_bswap_v2i32:
; VI:       ; %bb.0:
; VI-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; VI-NEXT:    v_mov_b32_e32 v0, 0x10203
; VI-NEXT:    s_mov_b32 s7, 0xf000
; VI-NEXT:    s_mov_b32 s6, -1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_load_dwordx2 s[2:3], s[2:3], 0x0
; VI-NEXT:    s_mov_b32 s4, s0
; VI-NEXT:    s_mov_b32 s5, s1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_perm_b32 v1, 0, s3, v0
; VI-NEXT:    v_perm_b32 v0, 0, s2, v0
; VI-NEXT:    buffer_store_dwordx2 v[0:1], off, s[4:7], 0
; VI-NEXT:    s_endpgm
  %val = load <2 x i32>, <2 x i32> addrspace(1)* %in, align 8
  %bswap = call <2 x i32> @llvm.bswap.v2i32(<2 x i32> %val) nounwind readnone
  store <2 x i32> %bswap, <2 x i32> addrspace(1)* %out, align 8
  ret void
}

define amdgpu_kernel void @test_bswap_v4i32(<4 x i32> addrspace(1)* %out, <4 x i32> addrspace(1)* %in) nounwind {
; SI-LABEL: test_bswap_v4i32:
; SI:       ; %bb.0:
; SI-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x9
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    s_load_dwordx4 s[4:7], s[2:3], 0x0
; SI-NEXT:    s_mov_b32 s3, 0xf000
; SI-NEXT:    s_mov_b32 s2, -1
; SI-NEXT:    s_mov_b32 s8, 0xff00ff
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v0, s7, s7, 8
; SI-NEXT:    v_alignbit_b32 v1, s7, s7, 24
; SI-NEXT:    v_alignbit_b32 v2, s6, s6, 8
; SI-NEXT:    v_alignbit_b32 v4, s6, s6, 24
; SI-NEXT:    v_alignbit_b32 v5, s5, s5, 8
; SI-NEXT:    v_alignbit_b32 v6, s5, s5, 24
; SI-NEXT:    v_alignbit_b32 v7, s4, s4, 8
; SI-NEXT:    v_alignbit_b32 v8, s4, s4, 24
; SI-NEXT:    v_bfi_b32 v3, s8, v1, v0
; SI-NEXT:    v_bfi_b32 v2, s8, v4, v2
; SI-NEXT:    v_bfi_b32 v1, s8, v6, v5
; SI-NEXT:    v_bfi_b32 v0, s8, v8, v7
; SI-NEXT:    buffer_store_dwordx4 v[0:3], off, s[0:3], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: test_bswap_v4i32:
; VI:       ; %bb.0:
; VI-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; VI-NEXT:    v_mov_b32_e32 v0, 0x10203
; VI-NEXT:    s_mov_b32 s7, 0xf000
; VI-NEXT:    s_mov_b32 s6, -1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_load_dwordx4 s[8:11], s[2:3], 0x0
; VI-NEXT:    s_mov_b32 s4, s0
; VI-NEXT:    s_mov_b32 s5, s1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_perm_b32 v3, 0, s11, v0
; VI-NEXT:    v_perm_b32 v2, 0, s10, v0
; VI-NEXT:    v_perm_b32 v1, 0, s9, v0
; VI-NEXT:    v_perm_b32 v0, 0, s8, v0
; VI-NEXT:    buffer_store_dwordx4 v[0:3], off, s[4:7], 0
; VI-NEXT:    s_endpgm
  %val = load <4 x i32>, <4 x i32> addrspace(1)* %in, align 16
  %bswap = call <4 x i32> @llvm.bswap.v4i32(<4 x i32> %val) nounwind readnone
  store <4 x i32> %bswap, <4 x i32> addrspace(1)* %out, align 16
  ret void
}

define amdgpu_kernel void @test_bswap_v8i32(<8 x i32> addrspace(1)* %out, <8 x i32> addrspace(1)* %in) nounwind {
; SI-LABEL: test_bswap_v8i32:
; SI:       ; %bb.0:
; SI-NEXT:    s_load_dwordx4 s[8:11], s[0:1], 0x9
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    s_load_dwordx8 s[0:7], s[10:11], 0x0
; SI-NEXT:    s_mov_b32 s11, 0xf000
; SI-NEXT:    s_mov_b32 s10, -1
; SI-NEXT:    s_mov_b32 s12, 0xff00ff
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v0, s3, s3, 8
; SI-NEXT:    v_alignbit_b32 v1, s3, s3, 24
; SI-NEXT:    v_alignbit_b32 v2, s2, s2, 8
; SI-NEXT:    v_alignbit_b32 v4, s2, s2, 24
; SI-NEXT:    v_alignbit_b32 v5, s1, s1, 8
; SI-NEXT:    v_alignbit_b32 v6, s1, s1, 24
; SI-NEXT:    v_alignbit_b32 v7, s0, s0, 8
; SI-NEXT:    v_alignbit_b32 v8, s0, s0, 24
; SI-NEXT:    v_alignbit_b32 v9, s7, s7, 8
; SI-NEXT:    v_alignbit_b32 v10, s7, s7, 24
; SI-NEXT:    v_alignbit_b32 v11, s6, s6, 8
; SI-NEXT:    v_alignbit_b32 v12, s6, s6, 24
; SI-NEXT:    v_alignbit_b32 v13, s5, s5, 8
; SI-NEXT:    v_alignbit_b32 v14, s5, s5, 24
; SI-NEXT:    v_alignbit_b32 v15, s4, s4, 8
; SI-NEXT:    v_alignbit_b32 v16, s4, s4, 24
; SI-NEXT:    v_bfi_b32 v3, s12, v1, v0
; SI-NEXT:    v_bfi_b32 v2, s12, v4, v2
; SI-NEXT:    v_bfi_b32 v1, s12, v6, v5
; SI-NEXT:    v_bfi_b32 v0, s12, v8, v7
; SI-NEXT:    v_bfi_b32 v7, s12, v10, v9
; SI-NEXT:    v_bfi_b32 v6, s12, v12, v11
; SI-NEXT:    v_bfi_b32 v5, s12, v14, v13
; SI-NEXT:    v_bfi_b32 v4, s12, v16, v15
; SI-NEXT:    buffer_store_dwordx4 v[4:7], off, s[8:11], 0 offset:16
; SI-NEXT:    buffer_store_dwordx4 v[0:3], off, s[8:11], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: test_bswap_v8i32:
; VI:       ; %bb.0:
; VI-NEXT:    s_load_dwordx4 s[8:11], s[0:1], 0x24
; VI-NEXT:    v_mov_b32_e32 v4, 0x10203
; VI-NEXT:    s_mov_b32 s15, 0xf000
; VI-NEXT:    s_mov_b32 s14, -1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_load_dwordx8 s[0:7], s[10:11], 0x0
; VI-NEXT:    s_mov_b32 s12, s8
; VI-NEXT:    s_mov_b32 s13, s9
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_perm_b32 v3, 0, s3, v4
; VI-NEXT:    v_perm_b32 v2, 0, s2, v4
; VI-NEXT:    v_perm_b32 v1, 0, s1, v4
; VI-NEXT:    v_perm_b32 v0, 0, s0, v4
; VI-NEXT:    v_perm_b32 v7, 0, s7, v4
; VI-NEXT:    v_perm_b32 v6, 0, s6, v4
; VI-NEXT:    v_perm_b32 v5, 0, s5, v4
; VI-NEXT:    v_perm_b32 v4, 0, s4, v4
; VI-NEXT:    buffer_store_dwordx4 v[4:7], off, s[12:15], 0 offset:16
; VI-NEXT:    buffer_store_dwordx4 v[0:3], off, s[12:15], 0
; VI-NEXT:    s_endpgm
  %val = load <8 x i32>, <8 x i32> addrspace(1)* %in, align 32
  %bswap = call <8 x i32> @llvm.bswap.v8i32(<8 x i32> %val) nounwind readnone
  store <8 x i32> %bswap, <8 x i32> addrspace(1)* %out, align 32
  ret void
}

define amdgpu_kernel void @test_bswap_i64(i64 addrspace(1)* %out, i64 addrspace(1)* %in) nounwind {
; SI-LABEL: test_bswap_i64:
; SI:       ; %bb.0:
; SI-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x9
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    s_load_dwordx2 s[4:5], s[2:3], 0x0
; SI-NEXT:    s_mov_b32 s3, 0xf000
; SI-NEXT:    s_mov_b32 s2, -1
; SI-NEXT:    s_mov_b32 s6, 0xff00ff
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v0, s4, s4, 8
; SI-NEXT:    v_alignbit_b32 v1, s4, s4, 24
; SI-NEXT:    v_alignbit_b32 v2, s5, s5, 8
; SI-NEXT:    v_alignbit_b32 v3, s5, s5, 24
; SI-NEXT:    v_bfi_b32 v1, s6, v1, v0
; SI-NEXT:    v_bfi_b32 v0, s6, v3, v2
; SI-NEXT:    buffer_store_dwordx2 v[0:1], off, s[0:3], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: test_bswap_i64:
; VI:       ; %bb.0:
; VI-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; VI-NEXT:    v_mov_b32_e32 v0, 0x10203
; VI-NEXT:    s_mov_b32 s7, 0xf000
; VI-NEXT:    s_mov_b32 s6, -1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_load_dwordx2 s[2:3], s[2:3], 0x0
; VI-NEXT:    s_mov_b32 s4, s0
; VI-NEXT:    s_mov_b32 s5, s1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_perm_b32 v1, 0, s2, v0
; VI-NEXT:    v_perm_b32 v0, 0, s3, v0
; VI-NEXT:    buffer_store_dwordx2 v[0:1], off, s[4:7], 0
; VI-NEXT:    s_endpgm
  %val = load i64, i64 addrspace(1)* %in, align 8
  %bswap = call i64 @llvm.bswap.i64(i64 %val) nounwind readnone
  store i64 %bswap, i64 addrspace(1)* %out, align 8
  ret void
}

define amdgpu_kernel void @test_bswap_v2i64(<2 x i64> addrspace(1)* %out, <2 x i64> addrspace(1)* %in) nounwind {
; SI-LABEL: test_bswap_v2i64:
; SI:       ; %bb.0:
; SI-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x9
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    s_load_dwordx4 s[4:7], s[2:3], 0x0
; SI-NEXT:    s_mov_b32 s3, 0xf000
; SI-NEXT:    s_mov_b32 s2, -1
; SI-NEXT:    s_mov_b32 s8, 0xff00ff
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v0, s6, s6, 8
; SI-NEXT:    v_alignbit_b32 v1, s6, s6, 24
; SI-NEXT:    v_alignbit_b32 v2, s7, s7, 8
; SI-NEXT:    v_alignbit_b32 v4, s7, s7, 24
; SI-NEXT:    v_alignbit_b32 v5, s4, s4, 8
; SI-NEXT:    v_alignbit_b32 v6, s4, s4, 24
; SI-NEXT:    v_alignbit_b32 v7, s5, s5, 8
; SI-NEXT:    v_alignbit_b32 v8, s5, s5, 24
; SI-NEXT:    v_bfi_b32 v3, s8, v1, v0
; SI-NEXT:    v_bfi_b32 v2, s8, v4, v2
; SI-NEXT:    v_bfi_b32 v1, s8, v6, v5
; SI-NEXT:    v_bfi_b32 v0, s8, v8, v7
; SI-NEXT:    buffer_store_dwordx4 v[0:3], off, s[0:3], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: test_bswap_v2i64:
; VI:       ; %bb.0:
; VI-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; VI-NEXT:    v_mov_b32_e32 v0, 0x10203
; VI-NEXT:    s_mov_b32 s7, 0xf000
; VI-NEXT:    s_mov_b32 s6, -1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_load_dwordx4 s[8:11], s[2:3], 0x0
; VI-NEXT:    s_mov_b32 s4, s0
; VI-NEXT:    s_mov_b32 s5, s1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_perm_b32 v3, 0, s10, v0
; VI-NEXT:    v_perm_b32 v2, 0, s11, v0
; VI-NEXT:    v_perm_b32 v1, 0, s8, v0
; VI-NEXT:    v_perm_b32 v0, 0, s9, v0
; VI-NEXT:    buffer_store_dwordx4 v[0:3], off, s[4:7], 0
; VI-NEXT:    s_endpgm
  %val = load <2 x i64>, <2 x i64> addrspace(1)* %in, align 16
  %bswap = call <2 x i64> @llvm.bswap.v2i64(<2 x i64> %val) nounwind readnone
  store <2 x i64> %bswap, <2 x i64> addrspace(1)* %out, align 16
  ret void
}

define amdgpu_kernel void @test_bswap_v4i64(<4 x i64> addrspace(1)* %out, <4 x i64> addrspace(1)* %in) nounwind {
; SI-LABEL: test_bswap_v4i64:
; SI:       ; %bb.0:
; SI-NEXT:    s_load_dwordx4 s[8:11], s[0:1], 0x9
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    s_load_dwordx8 s[0:7], s[10:11], 0x0
; SI-NEXT:    s_mov_b32 s11, 0xf000
; SI-NEXT:    s_mov_b32 s10, -1
; SI-NEXT:    s_mov_b32 s12, 0xff00ff
; SI-NEXT:    s_waitcnt lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v0, s2, s2, 8
; SI-NEXT:    v_alignbit_b32 v1, s2, s2, 24
; SI-NEXT:    v_alignbit_b32 v2, s3, s3, 8
; SI-NEXT:    v_alignbit_b32 v4, s3, s3, 24
; SI-NEXT:    v_alignbit_b32 v5, s0, s0, 8
; SI-NEXT:    v_alignbit_b32 v6, s0, s0, 24
; SI-NEXT:    v_alignbit_b32 v7, s1, s1, 8
; SI-NEXT:    v_alignbit_b32 v8, s1, s1, 24
; SI-NEXT:    v_alignbit_b32 v9, s6, s6, 8
; SI-NEXT:    v_alignbit_b32 v10, s6, s6, 24
; SI-NEXT:    v_alignbit_b32 v11, s7, s7, 8
; SI-NEXT:    v_alignbit_b32 v12, s7, s7, 24
; SI-NEXT:    v_alignbit_b32 v13, s4, s4, 8
; SI-NEXT:    v_alignbit_b32 v14, s4, s4, 24
; SI-NEXT:    v_alignbit_b32 v15, s5, s5, 8
; SI-NEXT:    v_alignbit_b32 v16, s5, s5, 24
; SI-NEXT:    v_bfi_b32 v3, s12, v1, v0
; SI-NEXT:    v_bfi_b32 v2, s12, v4, v2
; SI-NEXT:    v_bfi_b32 v1, s12, v6, v5
; SI-NEXT:    v_bfi_b32 v0, s12, v8, v7
; SI-NEXT:    v_bfi_b32 v7, s12, v10, v9
; SI-NEXT:    v_bfi_b32 v6, s12, v12, v11
; SI-NEXT:    v_bfi_b32 v5, s12, v14, v13
; SI-NEXT:    v_bfi_b32 v4, s12, v16, v15
; SI-NEXT:    buffer_store_dwordx4 v[4:7], off, s[8:11], 0 offset:16
; SI-NEXT:    buffer_store_dwordx4 v[0:3], off, s[8:11], 0
; SI-NEXT:    s_endpgm
;
; VI-LABEL: test_bswap_v4i64:
; VI:       ; %bb.0:
; VI-NEXT:    s_load_dwordx4 s[8:11], s[0:1], 0x24
; VI-NEXT:    v_mov_b32_e32 v4, 0x10203
; VI-NEXT:    s_mov_b32 s15, 0xf000
; VI-NEXT:    s_mov_b32 s14, -1
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    s_load_dwordx8 s[0:7], s[10:11], 0x0
; VI-NEXT:    s_mov_b32 s12, s8
; VI-NEXT:    s_mov_b32 s13, s9
; VI-NEXT:    s_waitcnt lgkmcnt(0)
; VI-NEXT:    v_perm_b32 v3, 0, s2, v4
; VI-NEXT:    v_perm_b32 v2, 0, s3, v4
; VI-NEXT:    v_perm_b32 v1, 0, s0, v4
; VI-NEXT:    v_perm_b32 v0, 0, s1, v4
; VI-NEXT:    v_perm_b32 v7, 0, s6, v4
; VI-NEXT:    v_perm_b32 v6, 0, s7, v4
; VI-NEXT:    v_perm_b32 v5, 0, s4, v4
; VI-NEXT:    v_perm_b32 v4, 0, s5, v4
; VI-NEXT:    buffer_store_dwordx4 v[4:7], off, s[12:15], 0 offset:16
; VI-NEXT:    buffer_store_dwordx4 v[0:3], off, s[12:15], 0
; VI-NEXT:    s_endpgm
  %val = load <4 x i64>, <4 x i64> addrspace(1)* %in, align 32
  %bswap = call <4 x i64> @llvm.bswap.v4i64(<4 x i64> %val) nounwind readnone
  store <4 x i64> %bswap, <4 x i64> addrspace(1)* %out, align 32
  ret void
}

define float @missing_truncate_promote_bswap(i32 %arg) {
; SI-LABEL: missing_truncate_promote_bswap:
; SI:       ; %bb.0: ; %bb
; SI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v1, v0, v0, 8
; SI-NEXT:    v_alignbit_b32 v0, v0, v0, 24
; SI-NEXT:    s_mov_b32 s4, 0xff00ff
; SI-NEXT:    v_bfi_b32 v0, s4, v0, v1
; SI-NEXT:    v_lshrrev_b32_e32 v0, 16, v0
; SI-NEXT:    v_cvt_f32_f16_e32 v0, v0
; SI-NEXT:    s_setpc_b64 s[30:31]
;
; VI-LABEL: missing_truncate_promote_bswap:
; VI:       ; %bb.0: ; %bb
; VI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; VI-NEXT:    s_mov_b32 s4, 0xc0c0001
; VI-NEXT:    v_perm_b32 v0, 0, v0, s4
; VI-NEXT:    v_cvt_f32_f16_e32 v0, v0
; VI-NEXT:    s_setpc_b64 s[30:31]
bb:
  %tmp = trunc i32 %arg to i16
  %tmp1 = call i16 @llvm.bswap.i16(i16 %tmp)
  %tmp2 = bitcast i16 %tmp1 to half
  %tmp3 = fpext half %tmp2 to float
  ret float %tmp3
}

define i16 @v_bswap_i16(i16 %src) {
; SI-LABEL: v_bswap_i16:
; SI:       ; %bb.0:
; SI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v1, v0, v0, 8
; SI-NEXT:    v_alignbit_b32 v0, v0, v0, 24
; SI-NEXT:    s_mov_b32 s4, 0xff00ff
; SI-NEXT:    v_bfi_b32 v0, s4, v0, v1
; SI-NEXT:    v_lshrrev_b32_e32 v0, 16, v0
; SI-NEXT:    s_setpc_b64 s[30:31]
;
; VI-LABEL: v_bswap_i16:
; VI:       ; %bb.0:
; VI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; VI-NEXT:    s_mov_b32 s4, 0xc0c0001
; VI-NEXT:    v_perm_b32 v0, 0, v0, s4
; VI-NEXT:    s_setpc_b64 s[30:31]
  %bswap = call i16 @llvm.bswap.i16(i16 %src)
  ret i16 %bswap
}

define i32 @v_bswap_i16_zext_to_i32(i16 %src) {
; SI-LABEL: v_bswap_i16_zext_to_i32:
; SI:       ; %bb.0:
; SI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v1, v0, v0, 8
; SI-NEXT:    v_alignbit_b32 v0, v0, v0, 24
; SI-NEXT:    s_mov_b32 s4, 0xff00ff
; SI-NEXT:    v_bfi_b32 v0, s4, v0, v1
; SI-NEXT:    v_lshrrev_b32_e32 v0, 16, v0
; SI-NEXT:    s_setpc_b64 s[30:31]
;
; VI-LABEL: v_bswap_i16_zext_to_i32:
; VI:       ; %bb.0:
; VI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; VI-NEXT:    s_mov_b32 s4, 0xc0c0001
; VI-NEXT:    v_perm_b32 v0, 0, v0, s4
; VI-NEXT:    s_setpc_b64 s[30:31]
  %bswap = call i16 @llvm.bswap.i16(i16 %src)
  %zext = zext i16 %bswap to i32
  ret i32 %zext
}

define i32 @v_bswap_i16_sext_to_i32(i16 %src) {
; SI-LABEL: v_bswap_i16_sext_to_i32:
; SI:       ; %bb.0:
; SI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v1, v0, v0, 8
; SI-NEXT:    v_alignbit_b32 v0, v0, v0, 24
; SI-NEXT:    s_mov_b32 s4, 0xff00ff
; SI-NEXT:    v_bfi_b32 v0, s4, v0, v1
; SI-NEXT:    v_ashrrev_i32_e32 v0, 16, v0
; SI-NEXT:    s_setpc_b64 s[30:31]
;
; VI-LABEL: v_bswap_i16_sext_to_i32:
; VI:       ; %bb.0:
; VI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; VI-NEXT:    s_mov_b32 s4, 0xc0c0001
; VI-NEXT:    v_perm_b32 v0, 0, v0, s4
; VI-NEXT:    v_bfe_i32 v0, v0, 0, 16
; VI-NEXT:    s_setpc_b64 s[30:31]
  %bswap = call i16 @llvm.bswap.i16(i16 %src)
  %zext = sext i16 %bswap to i32
  ret i32 %zext
}

define <2 x i16> @v_bswap_v2i16(<2 x i16> %src) {
; SI-LABEL: v_bswap_v2i16:
; SI:       ; %bb.0:
; SI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v2, v1, v1, 8
; SI-NEXT:    v_alignbit_b32 v1, v1, v1, 24
; SI-NEXT:    s_mov_b32 s4, 0xff00ff
; SI-NEXT:    v_alignbit_b32 v3, v0, v0, 8
; SI-NEXT:    v_alignbit_b32 v0, v0, v0, 24
; SI-NEXT:    v_bfi_b32 v1, s4, v1, v2
; SI-NEXT:    v_bfi_b32 v0, s4, v0, v3
; SI-NEXT:    v_and_b32_e32 v1, 0xffff0000, v1
; SI-NEXT:    v_lshrrev_b32_e32 v0, 16, v0
; SI-NEXT:    v_or_b32_e32 v0, v0, v1
; SI-NEXT:    v_lshrrev_b32_e32 v1, 16, v0
; SI-NEXT:    s_setpc_b64 s[30:31]
;
; VI-LABEL: v_bswap_v2i16:
; VI:       ; %bb.0:
; VI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; VI-NEXT:    s_mov_b32 s4, 0x2030001
; VI-NEXT:    v_perm_b32 v0, 0, v0, s4
; VI-NEXT:    s_setpc_b64 s[30:31]
  %bswap = call <2 x i16> @llvm.bswap.v2i16(<2 x i16> %src)
  ret <2 x i16> %bswap
}

define <3 x i16> @v_bswap_v3i16(<3 x i16> %src) {
; SI-LABEL: v_bswap_v3i16:
; SI:       ; %bb.0:
; SI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v3, v1, v1, 8
; SI-NEXT:    v_alignbit_b32 v1, v1, v1, 24
; SI-NEXT:    s_mov_b32 s4, 0xff00ff
; SI-NEXT:    v_alignbit_b32 v4, v0, v0, 8
; SI-NEXT:    v_alignbit_b32 v0, v0, v0, 24
; SI-NEXT:    v_alignbit_b32 v5, v2, v2, 8
; SI-NEXT:    v_alignbit_b32 v2, v2, v2, 24
; SI-NEXT:    v_bfi_b32 v1, s4, v1, v3
; SI-NEXT:    v_bfi_b32 v0, s4, v0, v4
; SI-NEXT:    v_bfi_b32 v2, s4, v2, v5
; SI-NEXT:    v_and_b32_e32 v3, 0xffff0000, v1
; SI-NEXT:    v_lshrrev_b32_e32 v0, 16, v0
; SI-NEXT:    v_lshrrev_b32_e32 v2, 16, v2
; SI-NEXT:    v_or_b32_e32 v0, v0, v3
; SI-NEXT:    v_alignbit_b32 v1, v2, v1, 16
; SI-NEXT:    s_setpc_b64 s[30:31]
;
; VI-LABEL: v_bswap_v3i16:
; VI:       ; %bb.0:
; VI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; VI-NEXT:    s_mov_b32 s4, 0x2030001
; VI-NEXT:    v_perm_b32 v0, 0, v0, s4
; VI-NEXT:    v_perm_b32 v1, 0, v1, s4
; VI-NEXT:    s_setpc_b64 s[30:31]
  %bswap = call <3 x i16> @llvm.bswap.v3i16(<3 x i16> %src)
  ret <3 x i16> %bswap
}

define <4 x i16> @v_bswap_v4i16(<4 x i16> %src) {
; SI-LABEL: v_bswap_v4i16:
; SI:       ; %bb.0:
; SI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v4, v1, v1, 8
; SI-NEXT:    v_alignbit_b32 v1, v1, v1, 24
; SI-NEXT:    s_mov_b32 s4, 0xff00ff
; SI-NEXT:    s_mov_b32 s5, 0xffff0000
; SI-NEXT:    v_alignbit_b32 v5, v0, v0, 8
; SI-NEXT:    v_alignbit_b32 v0, v0, v0, 24
; SI-NEXT:    v_alignbit_b32 v6, v3, v3, 8
; SI-NEXT:    v_alignbit_b32 v3, v3, v3, 24
; SI-NEXT:    v_alignbit_b32 v7, v2, v2, 8
; SI-NEXT:    v_alignbit_b32 v2, v2, v2, 24
; SI-NEXT:    v_bfi_b32 v1, s4, v1, v4
; SI-NEXT:    v_bfi_b32 v0, s4, v0, v5
; SI-NEXT:    v_bfi_b32 v3, s4, v3, v6
; SI-NEXT:    v_bfi_b32 v2, s4, v2, v7
; SI-NEXT:    v_and_b32_e32 v4, s5, v1
; SI-NEXT:    v_lshrrev_b32_e32 v0, 16, v0
; SI-NEXT:    v_and_b32_e32 v3, s5, v3
; SI-NEXT:    v_lshrrev_b32_e32 v2, 16, v2
; SI-NEXT:    v_or_b32_e32 v0, v0, v4
; SI-NEXT:    v_or_b32_e32 v2, v2, v3
; SI-NEXT:    v_alignbit_b32 v1, v2, v1, 16
; SI-NEXT:    v_lshrrev_b32_e32 v3, 16, v2
; SI-NEXT:    s_setpc_b64 s[30:31]
;
; VI-LABEL: v_bswap_v4i16:
; VI:       ; %bb.0:
; VI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; VI-NEXT:    s_mov_b32 s4, 0x2030001
; VI-NEXT:    v_perm_b32 v0, 0, v0, s4
; VI-NEXT:    v_perm_b32 v1, 0, v1, s4
; VI-NEXT:    s_setpc_b64 s[30:31]
  %bswap = call <4 x i16> @llvm.bswap.v4i16(<4 x i16> %src)
  ret <4 x i16> %bswap
}

define i64 @v_bswap_i48(i64 %src) {
; SI-LABEL: v_bswap_i48:
; SI:       ; %bb.0:
; SI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; SI-NEXT:    v_alignbit_b32 v2, v0, v0, 8
; SI-NEXT:    v_alignbit_b32 v0, v0, v0, 24
; SI-NEXT:    s_mov_b32 s4, 0xff00ff
; SI-NEXT:    v_alignbit_b32 v3, v1, v1, 8
; SI-NEXT:    v_alignbit_b32 v1, v1, v1, 24
; SI-NEXT:    v_bfi_b32 v2, s4, v0, v2
; SI-NEXT:    v_bfi_b32 v0, s4, v1, v3
; SI-NEXT:    v_alignbit_b32 v0, v2, v0, 16
; SI-NEXT:    v_lshrrev_b32_e32 v1, 16, v2
; SI-NEXT:    s_setpc_b64 s[30:31]
;
; VI-LABEL: v_bswap_i48:
; VI:       ; %bb.0:
; VI-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; VI-NEXT:    s_mov_b32 s4, 0x10203
; VI-NEXT:    v_perm_b32 v2, 0, v0, s4
; VI-NEXT:    v_perm_b32 v0, 0, v1, s4
; VI-NEXT:    v_alignbit_b32 v0, v2, v0, 16
; VI-NEXT:    v_lshrrev_b32_e32 v1, 16, v2
; VI-NEXT:    s_setpc_b64 s[30:31]
  %trunc = trunc i64 %src to i48
  %bswap = call i48 @llvm.bswap.i48(i48 %trunc)
  %zext = zext i48 %bswap to i64
  ret i64 %zext
}
