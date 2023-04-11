/**
 * This work is released into the public domain with CC0 1.0.
 *
 * Homepage: https://github.com/BLAKE3-team/BLAKE3
 *
 * Copyright (c) 2019-2020 Samuel Neves and Jack O'Connor
 * Copyright (c) 2021-2022 Tino Reichardt
 */

#ifndef BLAKE3_H
#define	BLAKE3_H

#ifdef  _KERNEL
#include <sys/types.h>
#else
#include <stdint.h>
#include <stdlib.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define	BLAKE3_KEY_LEN		32
#define	BLAKE3_OUT_LEN		32
#define	BLAKE3_MAX_DEPTH	54
#define	BLAKE3_BLOCK_LEN	64
#define	BLAKE3_CHUNK_LEN	1024

/*
 * This struct is a private implementation detail.
 * It has to be here because it's part of BLAKE3_CTX below.
 */
typedef struct {
	uint32_t cv[8];
	uint64_t chunk_counter;
	uint8_t buf[BLAKE3_BLOCK_LEN];
	uint8_t buf_len;
	uint8_t blocks_compressed;
	uint8_t flags;
} blake3_chunk_state_t;

typedef struct {
	uint32_t key[8];
	blake3_chunk_state_t chunk;
	uint8_t cv_stack_len;

	/*
	 * The stack size is MAX_DEPTH + 1 because we do lazy merging. For
	 * example, with 7 chunks, we have 3 entries in the stack. Adding an
	 * 8th chunk requires a 4th entry, rather than merging everything down
	 * to 1, because we don't know whether more input is coming. This is
	 * different from how the reference implementation does things.
	 */
	uint8_t cv_stack[(BLAKE3_MAX_DEPTH + 1) * BLAKE3_OUT_LEN];
} BLAKE3_CTX;

/* init the context for hash operation */
void Blake3_Init(BLAKE3_CTX *ctx);

/* init the context for a MAC and/or tree hash operation */
void Blake3_InitKeyed(BLAKE3_CTX *ctx, const uint8_t key[BLAKE3_KEY_LEN]);

/* process the input bytes */
void Blake3_Update(BLAKE3_CTX *ctx, const void *input, size_t input_len);

/* finalize the hash computation and output the result */
void Blake3_Final(const BLAKE3_CTX *ctx, uint8_t *out);

/* finalize the hash computation and output the result */
void Blake3_FinalSeek(const BLAKE3_CTX *ctx, uint64_t seek, uint8_t *out,
    size_t out_len);

/* return number of supported implementations */
extern int blake3_get_impl_count(void);

/* return id of selected implementation */
extern int blake3_get_impl_id(void);

/* return name of selected implementation */
extern const char *blake3_get_impl_name(void);

/* setup id as fastest implementation */
extern void blake3_set_impl_fastest(uint32_t id);

/* set implementation by id */
extern void blake3_set_impl_id(uint32_t id);

/* set implementation by name */
extern int blake3_set_impl_name(const char *name);

/* set startup implementation */
extern void blake3_setup_impl(void);

#ifdef __cplusplus
}
#endif

#endif	/* BLAKE3_H */
