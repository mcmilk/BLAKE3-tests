
/**
 * This work is released into the public domain with CC0 1.0.
 *
 * Copyright (c) 2021-2022 Tino Reichardt
 */

#include "blake3_impl.h"

#define kfpu_begin()
#define kfpu_end()

static inline boolean_t
kfpu_allowed(void) {
	return (1);
}

#if defined(__x86_64) || defined(__powerpc__) || defined(__aarch64__) || defined(__sparc__)

extern void _blake3_compress_in_place_sse2(uint32_t cv[8],
    const uint8_t block[BLAKE3_BLOCK_LEN], uint8_t block_len,
    uint64_t counter, uint8_t flags);

extern void _blake3_compress_xof_sse2(const uint32_t cv[8],
    const uint8_t block[BLAKE3_BLOCK_LEN], uint8_t block_len,
    uint64_t counter, uint8_t flags, uint8_t out[64]);

extern void _blake3_hash_many_sse2(const uint8_t * const *inputs,
    size_t num_inputs, size_t blocks, const uint32_t key[8],
    uint64_t counter, boolean_t increment_counter, uint8_t flags,
    uint8_t flags_start, uint8_t flags_end, uint8_t *out);

static void blake3_compress_in_place_sse2(uint32_t cv[8],
    const uint8_t block[BLAKE3_BLOCK_LEN], uint8_t block_len,
    uint64_t counter, uint8_t flags) {
	kfpu_begin();
	_blake3_compress_in_place_sse2(cv, block, block_len, counter, flags);
	kfpu_end();
}

static void blake3_compress_xof_sse2(const uint32_t cv[8],
    const uint8_t block[BLAKE3_BLOCK_LEN], uint8_t block_len,
    uint64_t counter, uint8_t flags, uint8_t out[64]) {
	kfpu_begin();
	_blake3_compress_xof_sse2(cv, block, block_len, counter, flags, out);
	kfpu_end();
}

static void blake3_hash_many_sse2(const uint8_t * const *inputs,
    size_t num_inputs, size_t blocks, const uint32_t key[8],
    uint64_t counter, boolean_t increment_counter, uint8_t flags,
    uint8_t flags_start, uint8_t flags_end, uint8_t *out) {
	kfpu_begin();
	_blake3_hash_many_sse2(inputs, num_inputs, blocks, key, counter,
	    increment_counter, flags, flags_start, flags_end, out);
	kfpu_end();
}

static boolean_t blake3_is_sse2_supported(void)
{
#if defined(__x86_64)
	return (kfpu_allowed() && zfs_sse2_available());
#else
	return (kfpu_allowed());
#endif
}

const blake3_impl_ops_t blake3_sse2_impl = {
	.compress_in_place = blake3_compress_in_place_sse2,
	.compress_xof = blake3_compress_xof_sse2,
	.hash_many = blake3_hash_many_sse2,
	.is_supported = blake3_is_sse2_supported,
	.degree = 4,
	.name = "sse2"
};
#endif

#if defined(__x86_64) || defined(__powerpc__) || defined(__aarch64__) || defined(__sparc__)

extern void _blake3_compress_in_place_sse41(uint32_t cv[8],
    const uint8_t block[BLAKE3_BLOCK_LEN], uint8_t block_len,
    uint64_t counter, uint8_t flags);

extern void _blake3_compress_xof_sse41(const uint32_t cv[8],
    const uint8_t block[BLAKE3_BLOCK_LEN], uint8_t block_len,
    uint64_t counter, uint8_t flags, uint8_t out[64]);

extern void _blake3_hash_many_sse41(const uint8_t * const *inputs,
    size_t num_inputs, size_t blocks, const uint32_t key[8],
    uint64_t counter, boolean_t increment_counter, uint8_t flags,
    uint8_t flags_start, uint8_t flags_end, uint8_t *out);

static void blake3_compress_in_place_sse41(uint32_t cv[8],
    const uint8_t block[BLAKE3_BLOCK_LEN], uint8_t block_len,
    uint64_t counter, uint8_t flags) {
	kfpu_begin();
	_blake3_compress_in_place_sse41(cv, block, block_len, counter, flags);
	kfpu_end();
}

static void blake3_compress_xof_sse41(const uint32_t cv[8],
    const uint8_t block[BLAKE3_BLOCK_LEN], uint8_t block_len,
    uint64_t counter, uint8_t flags, uint8_t out[64]) {
	kfpu_begin();
	_blake3_compress_xof_sse41(cv, block, block_len, counter, flags, out);
	kfpu_end();
}

static void blake3_hash_many_sse41(const uint8_t * const *inputs,
    size_t num_inputs, size_t blocks, const uint32_t key[8],
    uint64_t counter, boolean_t increment_counter, uint8_t flags,
    uint8_t flags_start, uint8_t flags_end, uint8_t *out) {
	kfpu_begin();
	_blake3_hash_many_sse41(inputs, num_inputs, blocks, key, counter,
	    increment_counter, flags, flags_start, flags_end, out);
	kfpu_end();
}

static boolean_t blake3_is_sse41_supported(void)
{
#if defined(__x86_64)
	return (kfpu_allowed() && zfs_sse4_1_available());
#else
	return (kfpu_allowed());
#endif
}

const blake3_impl_ops_t blake3_sse41_impl = {
	.compress_in_place = blake3_compress_in_place_sse41,
	.compress_xof = blake3_compress_xof_sse41,
	.hash_many = blake3_hash_many_sse41,
	.is_supported = blake3_is_sse41_supported,
	.degree = 4,
	.name = "sse41"
};
#endif

#if defined(__x86_64)
extern void _blake3_hash_many_avx2(const uint8_t * const *inputs,
    size_t num_inputs, size_t blocks, const uint32_t key[8],
    uint64_t counter, boolean_t increment_counter, uint8_t flags,
    uint8_t flags_start, uint8_t flags_end, uint8_t *out);

static void blake3_hash_many_avx2(const uint8_t * const *inputs,
    size_t num_inputs, size_t blocks, const uint32_t key[8],
    uint64_t counter, boolean_t increment_counter, uint8_t flags,
    uint8_t flags_start, uint8_t flags_end, uint8_t *out) {
	kfpu_begin();
	_blake3_hash_many_avx2(inputs, num_inputs, blocks, key, counter,
	    increment_counter, flags, flags_start, flags_end, out);
	kfpu_end();
}

static boolean_t blake3_is_avx2_supported(void)
{
#if defined(__x86_64)
	return (kfpu_allowed() && zfs_sse4_1_available() && zfs_avx2_available());
#else
	return (kfpu_allowed());
#endif
}

const blake3_impl_ops_t blake3_avx2_impl = {
	.compress_in_place = blake3_compress_in_place_sse41,
	.compress_xof = blake3_compress_xof_sse41,
	.hash_many = blake3_hash_many_avx2,
	.is_supported = blake3_is_avx2_supported,
	.degree = 8,
	.name = "avx2"
};
#endif

#if defined(__x86_64)
extern void _blake3_compress_in_place_avx512(uint32_t cv[8],
    const uint8_t block[BLAKE3_BLOCK_LEN], uint8_t block_len,
    uint64_t counter, uint8_t flags);

extern void _blake3_compress_xof_avx512(const uint32_t cv[8],
    const uint8_t block[BLAKE3_BLOCK_LEN], uint8_t block_len,
    uint64_t counter, uint8_t flags, uint8_t out[64]);

extern void _blake3_hash_many_avx512(const uint8_t * const *inputs,
    size_t num_inputs, size_t blocks, const uint32_t key[8],
    uint64_t counter, boolean_t increment_counter, uint8_t flags,
    uint8_t flags_start, uint8_t flags_end, uint8_t *out);

static void blake3_compress_in_place_avx512(uint32_t cv[8],
    const uint8_t block[BLAKE3_BLOCK_LEN], uint8_t block_len,
    uint64_t counter, uint8_t flags) {
	kfpu_begin();
	_blake3_compress_in_place_avx512(cv, block, block_len, counter, flags);
	kfpu_end();
}

static void blake3_compress_xof_avx512(const uint32_t cv[8],
    const uint8_t block[BLAKE3_BLOCK_LEN], uint8_t block_len,
    uint64_t counter, uint8_t flags, uint8_t out[64]) {
	kfpu_begin();
	_blake3_compress_xof_avx512(cv, block, block_len, counter, flags, out);
	kfpu_end();
}

static void blake3_hash_many_avx512(const uint8_t * const *inputs,
    size_t num_inputs, size_t blocks, const uint32_t key[8],
    uint64_t counter, boolean_t increment_counter, uint8_t flags,
    uint8_t flags_start, uint8_t flags_end, uint8_t *out) {
	kfpu_begin();
	_blake3_hash_many_avx512(inputs, num_inputs, blocks, key, counter,
	    increment_counter, flags, flags_start, flags_end, out);
	kfpu_end();
}

static boolean_t blake3_is_avx512_supported(void)
{
	return (kfpu_allowed() && zfs_avx512f_available() &&
	    zfs_avx512vl_available());
}

const blake3_impl_ops_t blake3_avx512_impl = {
	.compress_in_place = blake3_compress_in_place_avx512,
	.compress_xof = blake3_compress_xof_avx512,
	.hash_many = blake3_hash_many_avx512,
	.is_supported = blake3_is_avx512_supported,
	.degree = 16,
	.name = "avx512"
};
#endif
