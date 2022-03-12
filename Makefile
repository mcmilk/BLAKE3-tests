
CC	= gcc
CFLAGS	= -I. -W -O3 -Wall -pipe

OBJS	= blake3.o blake3_generic.o blake3_impl.o
PROGS	= blake3 blake3_test

# SSE2 SSE41 AVX2 AVX512
OBJS	+= blake3_x86-64.o
CFLAGS	+= -DHAVE_SSE2
OBJS	+= asm/blake3_sse2.o
CFLAGS	+= -DHAVE_SSE4_1
OBJS	+= asm/blake3_sse41.o
CFLAGS	+= -DHAVE_AVX2
OBJS	+= asm/blake3_avx2.o
CFLAGS	+= -DHAVE_AVX512F -DHAVE_AVX512VL
OBJS	+= asm/blake3_avx512.o

# Aarch64
OBJS	+= asm/b3_aarch64_sse2.o
OBJS	+= asm/b3_aarch64_sse41.o

# PPC64
OBJS	+= asm/b3_ppc64le_sse2.o
OBJS	+= asm/b3_ppc64le_sse41.o
OBJS	+= asm/b3_ppc64_sse2.o
OBJS	+= asm/b3_ppc64_sse41.o

all:
	make clean
	make $(PROGS)

blake3: $(OBJS) main.o
	$(CC) $(CFLAGS) -o $@ main.o $(OBJS)

blake3_test: $(OBJS) blake3_test.o
	$(CC) $(CFLAGS) -o $@ blake3_test.o $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.S
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -f $(PROGS) $(OBJS) main.o blake3_test.o
