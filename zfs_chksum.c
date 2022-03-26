
#include <sys/types.h>
#include <time.h>

#include "blake3.h"

#define	SEC				1
#define	MILLISEC			1000
#define	NANOSEC				1000000000

#define	MSEC2NSEC(m)	((time_t)(m) * (NANOSEC / MILLISEC))
#define	NSEC2MSEC(n)	((n) / (NANOSEC / MILLISEC))

static time_t gethrtime(void)
{
	struct timespec ts;

	//int clock_gettime(clockid_t clock_id, struct timespec *tp);
	clock_gettime(CLOCK_MONOTONIC_RAW, &ts);

	return (time_t)((ts.tv_sec * NSEC_PER_SEC) + ts.tv_nsec);
}

static kstat_t *chksum_kstat = NULL;

typedef struct {
	const char *name;
	const char *impl;
	uint64_t bs1k;
	uint64_t bs4k;
	uint64_t bs16k;
	uint64_t bs64k;
	uint64_t bs256k;
	uint64_t bs1m;
	uint64_t bs4m;
	zio_cksum_salt_t salt;
	zio_checksum_t *(func);
	zio_checksum_tmpl_init_t *(init);
	zio_checksum_tmpl_free_t *(free);
} chksum_stat_t;

static int chksum_stat_cnt = 0;
static chksum_stat_t *chksum_stat_data = 0;

/*
 * i3-1005G1 test output:
 *
 * implementation     1k      4k     16k     64k    256k      1m      4m
 * fletcher-4       5421   15001   26468   32555   34720   32801   18847
 * edonr-generic    1196    1602    1761    1749    1762    1759    1751
 * skein-generic     546     591     608     615     619     612     616
 * sha256-generic    246     270     274     274     277     275     276
 * sha256-avx        262     296     304     307     307     307     306
 * sha256-sha-ni     769    1072    1172    1220    1219    1232    1228
 * sha256-openssl    240     300     316     314     304     285     276
 * sha512-generic    333     374     385     392     391     393     392
 * sha512-openssl    353     441     467     476     472     467     426
 * sha512-avx        362     444     473     475     479     476     478
 * sha512-avx2       394     500     530     538     543     545     542
 * blake3-generic    308     313     313     313     312     313     312
 * blake3-sse2       402    1289    1423    1446    1432    1458    1413
 * blake3-sse41      427    1470    1625    1704    1679    1607    1629
 * blake3-avx2       428    1920    3095    3343    3356    3318    3204
 * blake3-avx512     473    2687    4905    5836    5844    5643    5374
 */
static int
chksum_stat_kstat_headers(char *buf, size_t size)
{
	ssize_t off = 0;

	off += snprintf(buf + off, size, "%-23s", "implementation");
	off += snprintf(buf + off, size - off, "%8s", "1k");
	off += snprintf(buf + off, size - off, "%8s", "4k");
	off += snprintf(buf + off, size - off, "%8s", "16k");
	off += snprintf(buf + off, size - off, "%8s", "64k");
	off += snprintf(buf + off, size - off, "%8s", "256k");
	off += snprintf(buf + off, size - off, "%8s", "1m");
	(void) snprintf(buf + off, size - off, "%8s\n", "4m");

	return (0);
}

static int
chksum_stat_kstat_data(char *buf, size_t size, void *data)
{
	chksum_stat_t *cs;
	ssize_t off = 0;
	char b[24];

	cs = (chksum_stat_t *)data;
	snprintf(b, 23, "%s-%s", cs->name, cs->impl);
	off += snprintf(buf + off, size - off, "%-23s", b);
	off += snprintf(buf + off, size - off, "%8llu",
	    (u_longlong_t)cs->bs1k);
	off += snprintf(buf + off, size - off, "%8llu",
	    (u_longlong_t)cs->bs4k);
	off += snprintf(buf + off, size - off, "%8llu",
	    (u_longlong_t)cs->bs16k);
	off += snprintf(buf + off, size - off, "%8llu",
	    (u_longlong_t)cs->bs64k);
	off += snprintf(buf + off, size - off, "%8llu",
	    (u_longlong_t)cs->bs256k);
	off += snprintf(buf + off, size - off, "%8llu",
	    (u_longlong_t)cs->bs1m);
	(void) snprintf(buf + off, size - off, "%8llu\n",
	    (u_longlong_t)cs->bs4m);

	return (0);
}

static void *
chksum_stat_kstat_addr(kstat_t *ksp, loff_t n)
{
	if (n < chksum_stat_cnt)
		ksp->ks_private = (void *)(chksum_stat_data + n);
	else
		ksp->ks_private = NULL;

	return (ksp->ks_private);
}

static void
chksum_run(chksum_stat_t *cs, abd_t *abd, void *ctx, int round,
    uint64_t *result)
{
	time_t start;
	uint64_t run_bw, run_time_ns, run_count = 0, size = 0;
	uint32_t l, loops = 0;
	zio_cksum_t zcp;

	switch (round) {
	case 1: /* 1k */
		size = 1<<10; loops = 128; break;
	case 2: /* 2k */
		size = 1<<12; loops = 64; break;
	case 3: /* 4k */
		size = 1<<14; loops = 32; break;
	case 4: /* 16k */
		size = 1<<16; loops = 16; break;
	case 5: /* 256k */
		size = 1<<18; loops = 8; break;
	case 6: /* 1m */
		size = 1<<20; loops = 4; break;
	case 7: /* 4m */
		size = 1<<22; loops = 1; break;
	}

	//kpreempt_disable();
	start = gethrtime();
	do {
		for (l = 0; l < loops; l++, run_count++)
			cs->func(abd, size, ctx, &zcp);

		run_time_ns = gethrtime() - start;
	} while (run_time_ns < MSEC2NSEC(1));
	//kpreempt_enable();

	run_bw = size * run_count * NANOSEC;
	run_bw /= run_time_ns;	/* B/s */
	*result = run_bw/1024/1024; /* MiB/s */
}

static void
chksum_benchit(chksum_stat_t *cs)
{
	abd_t *abd;
	void *ctx = 0;
	void *salt = &cs->salt.zcs_bytes;

	/* allocate test memory via default abd interface */
	abd = abd_alloc_linear(1<<22, B_FALSE);
	memset(salt, 0, sizeof (cs->salt.zcs_bytes));
	if (cs->init) {
		ctx = cs->init(&cs->salt);
	}

	chksum_run(cs, abd, ctx, 1, &cs->bs1k);
	chksum_run(cs, abd, ctx, 2, &cs->bs4k);
	chksum_run(cs, abd, ctx, 3, &cs->bs16k);
	chksum_run(cs, abd, ctx, 4, &cs->bs64k);
	chksum_run(cs, abd, ctx, 5, &cs->bs256k);
	chksum_run(cs, abd, ctx, 6, &cs->bs1m);
	chksum_run(cs, abd, ctx, 7, &cs->bs4m);

	/* free up temp memory */
	if (cs->free) {
		cs->free(ctx);
	}
	abd_free(abd);
}

/*
 * Initialize and benchmark all supported implementations.
 */
static void
chksum_benchmark(void)
{
	chksum_stat_t *cs;
	int cbid = 0, id;
	uint64_t max = 0;

	/* space for the benchmark times */
	chksum_stat_cnt = 5;
	chksum_stat_cnt += blake3_get_impl_count();
	chksum_stat_data = (chksum_stat_t *)kmem_zalloc(
	    sizeof (chksum_stat_t) * chksum_stat_cnt, KM_SLEEP);

	/* fletcher-4 */
	fletcher_4_init();
	cs = &chksum_stat_data[cbid++];
	cs->init = 0;
	cs->func = abd_fletcher_4_native;
	cs->free = 0;
	cs->name = "fletcher";
	cs->impl = "4";
	chksum_benchit(cs);

	/* edonr */
	cs = &chksum_stat_data[cbid++];
	cs->init = abd_checksum_edonr_tmpl_init;
	cs->func = abd_checksum_edonr_native;
	cs->free = abd_checksum_edonr_tmpl_free;
	cs->name = "edonr";
	cs->impl = "generic";
	chksum_benchit(cs);

	/* skein */
	cs = &chksum_stat_data[cbid++];
	cs->init = abd_checksum_skein_tmpl_init;
	cs->func = abd_checksum_skein_native;
	cs->free = abd_checksum_skein_tmpl_free;
	cs->name = "skein";
	cs->impl = "generic";
	chksum_benchit(cs);

	/* sha256 */
	cs = &chksum_stat_data[cbid++];
	cs->init = 0;
	cs->func = abd_checksum_SHA256;
	cs->free = 0;
	cs->name = "sha256";
	cs->impl = "generic";
	chksum_benchit(cs);

	/* sha512 */
	cs = &chksum_stat_data[cbid++];
	cs->init = 0;
	cs->func = abd_checksum_SHA512_native;
	cs->free = 0;
	cs->name = "sha512";
	cs->impl = "generic";
	chksum_benchit(cs);

	/* blake3 */
	for (id = 0; id < blake3_get_impl_count(); id++) {
		blake3_set_impl_id(id);
		cs = &chksum_stat_data[cbid++];
		cs->init = abd_checksum_blake3_tmpl_init;
		cs->func = abd_checksum_blake3_native;
		cs->free = abd_checksum_blake3_tmpl_free;
		cs->name = "blake3";
		cs->impl = blake3_get_impl_name();
		chksum_benchit(cs);
		if (cs->bs256k > max) {
			max = cs->bs256k;
			blake3_set_impl_fastest(id);
		}
	}
}
