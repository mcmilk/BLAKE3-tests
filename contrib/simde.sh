#!/usr/bin/env bash

# checkout simde repo
test -d simde || git clone https://github.com/simd-everywhere/simde

# cleanup old stuff
rm -f *.S

# bsd/macos: -ffixed-x18
# macos:     -fno-omit-frame-pointer
OPTS="-Ofast -Wall -Wextra -std=c99 -fno-omit-frame-pointer -fno-verbose-asm -DSIMDE_ENABLE_NATIVE_ALIASES -fno-addrsig -ffixed-x18 -mbranch-protection=standard"

CC="gcc13"
CC="clang14"

T="--target=aarch64-freebsd-gnu"
#T="--target=aarch64-linux-gnu"
A="-march=armv8-a"

# best results with clang -O3:
$CC $OPTS $A $T -S blake3_sse2.c  -o b3_aarch64_sse2.S  2>b3_aarch64_sse2.err
$CC $OPTS $A $T -S blake3_sse41.c -o b3_aarch64_sse41.S 2>b3_aarch64_sse41.err

# avx2 does not bring speed ups on that arch
#clang $OPTS $A $T -S blake3_avx2.c -o b3_aarch64_avx2.S   2>b3_aarch64_avx2.err
