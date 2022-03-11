/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License (the "License").
 * You may not use this file except in compliance with the License.
 *
 * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
 * or http://www.opensolaris.org/os/licensing.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */

/*
 * Copyright (c) 2021-2022 Tino Reichardt <milky-zfs@mcmilk.de>
 */

#include "blake3_impl.h"

static const blake3_impl_ops_t *const blake3_impls[] = {
	&blake3_generic_impl,
#if defined(__aarch64__) || defined(__PPC64__)
	&blake3_sse2_impl,
	&blake3_sse41_impl,
#endif
#if defined(__x86_64)
	&blake3_sse2_impl,
	&blake3_sse41_impl,
	&blake3_avx2_impl,
	&blake3_avx512_impl,
#endif
};

/* this pointer holds current ops for implementation */
static const blake3_impl_ops_t *blake3_selected_impl = &blake3_generic_impl;

/* special implementation selections */
#define	IMPL_FASTEST	(UINT32_MAX)
#define	IMPL_CYCLE	(UINT32_MAX-1)
#define	IMPL_USER	(UINT32_MAX-2)
#define	IMPL_PARAM	(UINT32_MAX-3)
static uint32_t icp_blake3_impl = IMPL_FASTEST;

#define	BLAKE3_IMPL_NAME_MAX	16

/* id of fastest implementation */
static uint32_t blake3_fastest_id = 0;

/* currently used id */
static uint32_t blake3_current_id = 0;

/* id of module parameter (-1 == unused) */
static int blake3_param_id = -1;

/* return number of supported implementations */
int
blake3_get_impl_count(void)
{
	static int impls = 0;
	int i;

	if (impls)
		return (impls);

	for (i = 0; i < (int)ARRAY_SIZE(blake3_impls); i++) {
		if (!blake3_impls[i]->is_supported()) continue;
		impls++;
	}

	return (impls);
}

/* return id of selected implementation */
int
blake3_get_impl_id(void)
{
	return (blake3_current_id);
}

/* return name of selected implementation */
const char *
blake3_get_impl_name(void)
{
	return (blake3_selected_impl->name);
}

/* setup id as fastest implementation */
void
blake3_set_impl_fastest(uint32_t id)
{
	blake3_fastest_id = id;
}

/* set implementation by id */
void
blake3_set_impl_id(uint32_t id)
{
	int i, cid;

	/* select fastest */
	if (id == IMPL_FASTEST)
		id = blake3_fastest_id;

	/* select next or first */
	if (id == IMPL_CYCLE)
		id = (++blake3_current_id) % blake3_get_impl_count();

	/* 0..N for the real impl */
	for (i = 0, cid = 0; i < (int)ARRAY_SIZE(blake3_impls); i++) {
		if (!blake3_impls[i]->is_supported()) continue;
		if (cid == (int)id) {
			blake3_current_id = cid;
			blake3_selected_impl = blake3_impls[i];
			return;
		}
		cid++;
	}
}

/* set implementation by name */
int
blake3_set_impl_name(const char *name)
{
	int i, cid;

	if (strcmp(name, "fastest") == 0) {
		icp_blake3_impl = IMPL_FASTEST;
		blake3_set_impl_id(IMPL_FASTEST);
		return (0);
	} else if (strcmp(name, "cycle") == 0) {
		icp_blake3_impl = IMPL_CYCLE;
		blake3_set_impl_id(IMPL_CYCLE);
		return (0);
	}

	for (i = 0, cid = 0; i < (int)ARRAY_SIZE(blake3_impls); i++) {
		if (!blake3_impls[i]->is_supported()) continue;
		if (strcmp(name, blake3_impls[i]->name) == 0) {
			if (icp_blake3_impl == IMPL_PARAM) {
				blake3_param_id = cid;
				return (0);
			}
			blake3_selected_impl = blake3_impls[i];
			blake3_current_id = cid;
			return (0);
		}
		cid++;
	}

	return (-EINVAL);
}

/* setup implementation */
void
blake3_setup_impl(void)
{
	switch (icp_blake3_impl) {
	case IMPL_PARAM:
		blake3_set_impl_id(blake3_param_id);
		icp_blake3_impl = IMPL_USER;
		break;
	case IMPL_FASTEST:
		blake3_set_impl_id(IMPL_FASTEST);
		break;
	case IMPL_CYCLE:
		blake3_set_impl_id(IMPL_CYCLE);
		break;
	default:
		blake3_set_impl_id(blake3_current_id);
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

	return (blake3_selected_impl);
}
