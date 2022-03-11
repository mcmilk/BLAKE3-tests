
/**
 * This work is released into the public domain with CC0 1.0.
 *
 * Copyright (c) 2021-2022 Tino Reichardt
 */

#include <errno.h>
#include <string.h>

#include "blake3_impl.h"

static const blake3_impl_ops_t *const blake3_impls[] = {
	&blake3_generic_impl,
#if defined(__aarch64__)
	&blake3_sse2_impl,
	&blake3_sse41_impl,
#endif
#if defined(__PPC64__)
	&blake3_sse2_impl,
	&blake3_sse41_impl,
#endif
#if defined(__x86_64) && defined(HAVE_SSE2)
	&blake3_sse2_impl,
#endif
#if defined(__x86_64) && defined(HAVE_SSE4_1)
	&blake3_sse41_impl,
#endif
#if defined(__x86_64) && defined(HAVE_SSE4_1) && defined(HAVE_AVX2)
	&blake3_avx2_impl,
#endif
#if defined(__x86_64) && defined(HAVE_AVX512F) && defined(HAVE_AVX512VL)
	&blake3_avx512_impl,
#endif
};

/*
 * these wo seem to make some stress :/
 *
 * #if defined(__x86_64) && defined(HAVE_SSE4_1) && defined(HAVE_AVX2)
 *	&blake3_avx2_impl,
 * #endif
 * #if defined(__x86_64) && defined(HAVE_AVX512F) && defined(HAVE_AVX512VL)
 *	&blake3_avx512_impl,
 * #endif
 */

/* this pointer holds current ops for implementation */
static const blake3_impl_ops_t *blake3_selected_impls = &blake3_generic_impl;

/* special implementation selections */
#define	IMPL_FASTEST	(UINT32_MAX)
#define	IMPL_CYCLE	(UINT32_MAX-1)
#define	IMPL_USER	(UINT32_MAX-2)
static uint32_t icp_blake3_impl = IMPL_FASTEST;

#define	BLAKE3_IMPL_NAME_MAX	16

/* id of fastest implementation */
static uint32_t blake3_fastest_impl = 0;

/* currently used implementation */
static uint32_t blake3_current_impl = 0;

/* return number of supported implementations */
int
blake3_get_impl_count(void)
{
	static int impls = 0;
	int i;

	if (impls)
		return (impls);

	for (i = 0; i < (int)ARRAY_SIZE(blake3_impls); i++)
		if (blake3_impls[i]->is_supported()) impls++;

	return (impls);
}

/* return id of selected implementation */
int
blake3_get_impl_id(void)
{
	return (blake3_current_impl);
}

/* return name of selected implementation */
const char *
blake3_get_impl_name(void)
{
	return (blake3_selected_impls->name);
}

/* setup id as fastest implementation */
void
blake3_set_impl_fastest(uint32_t id)
{
	blake3_fastest_impl = id;
}

/* set implementation by id */
void
blake3_set_impl_id(uint32_t id)
{
	int i;
	uint32_t impl;

	/* select fastest */
	if (id == IMPL_FASTEST) {
		blake3_current_impl = blake3_fastest_impl;
		blake3_selected_impls = blake3_impls[blake3_current_impl];
		return;
	}

	/* select next or first */
	if (id == IMPL_CYCLE) {
		impl = (++blake3_current_impl) % blake3_get_impl_count();
		blake3_current_impl = impl;
		blake3_selected_impls = blake3_impls[impl];
		return;
	}

	/* 0..N for the real impl */
	for (i = 0, impl = 0; i < (int)ARRAY_SIZE(blake3_impls); i++) {
		if (!blake3_impls[i]->is_supported()) continue;
		if (impl == id) {
			blake3_current_impl = id;
			blake3_selected_impls = blake3_impls[id];
			return;
		}
		impl++;
	}
}

/* set implementation by name */
int
blake3_set_impl_name(const char *name)
{
	int i, impl;

	if (strcmp(name, "fastest") == 0) {
		icp_blake3_impl = IMPL_FASTEST;
		blake3_set_impl_id(IMPL_FASTEST);
		return (0);
	} else if (strcmp(name, "cycle") == 0) {
		icp_blake3_impl = IMPL_CYCLE;
		blake3_set_impl_id(IMPL_CYCLE);
		return (0);
	}

	icp_blake3_impl = IMPL_USER;
	for (i = 0, impl = 0; i < (int)ARRAY_SIZE(blake3_impls); i++) {
		if (!blake3_impls[i]->is_supported()) continue;
		if (strcmp(name, blake3_impls[i]->name) == 0) {
			blake3_selected_impls = blake3_impls[impl];
			blake3_current_impl = impl;
			return (0);
		}
		impl++;
	}

	return (-EINVAL);
}

/* setup implementation */
void
blake3_setup_impl(void)
{
	switch (icp_blake3_impl) {
	case IMPL_FASTEST:
		blake3_set_impl_id(IMPL_FASTEST);
		break;
	case IMPL_CYCLE:
		blake3_set_impl_id(IMPL_CYCLE);
		break;
	default:
		blake3_set_impl_id(blake3_current_impl);
		break;
	}
}

/* return selected implementation */
const blake3_impl_ops_t *
blake3_impl_get_ops(void)
{
	/* each call to ops will cycle */
	if (icp_blake3_impl == IMPL_CYCLE)
		blake3_set_impl_id(IMPL_CYCLE);

	return (blake3_selected_impls);
}
