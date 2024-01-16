#!/usr/bin/env bash

# checkout simde repo
test -d simde || git clone https://github.com/simd-everywhere/simde

# cleanup old stuff
rm -f *.S

OPTS="-Ofast -Wall -Wextra -std=c99 -fno-omit-frame-pointer -fno-verbose-asm -DSIMDE_ENABLE_NATIVE_ALIASES"
CC="gcc"
CC="clang"

# needed for clang
OPTS="$OPTS -fno-addrsig"

# when using this, we will break gcc-8 and gcc-9
# OPTS="$OPTS -mbranch-protection=standard"

# on bsd/macos x18 is used by kernel
OPTS="$OPTS -ffixed-x18"

# needed for macos
OPTS="$OPTS -fno-omit-frame-pointer"

#T="--target=aarch64-linux-gnu"
T="--target=aarch64-freebsd-gnu"
A="-march=armv8-a"

# best results with clang -O3:
$CC $OPTS $A $T -S blake3_sse2.c  -o b3_aarch64_sse2.S  2>b3_aarch64_sse2.err
$CC $OPTS $A $T -S blake3_sse41.c -o b3_aarch64_sse41.S 2>b3_aarch64_sse41.err
