/**
 * This work is released into the public domain with CC0 1.0.
 *
 * Copyright (c) 2021-2023 Tino Reichardt
 *
 * Latest version: https://github.com/mcmilk/BLAKE3-tests
 */

#include <assert.h>
#include <errno.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#ifdef __linux__
#include <alloca.h>
#endif

#include "blake3.h"
#include "get_cycles.h"

#define HASH_MODE 0
#define KEYED_HASH_MODE 1
#define DERIVE_KEY_MODE 2

#define BUFSIZE 16 * 1024

static void hex_char_value(uint8_t c, uint8_t *value, bool *valid) {
  if ('0' <= c && c <= '9') {
    *value = c - '0';
    *valid = true;
  } else if ('a' <= c && c <= 'f') {
    *value = 10 + c - 'a';
    *valid = true;
  } else {
    *valid = false;
  }
}

static int parse_key(char *hex_key, uint8_t out[BLAKE3_KEY_LEN]) {
  size_t hex_len = strlen(hex_key);
  if (hex_len != 64) {
    fprintf(stderr, "Expected a 64-char hexadecimal key, got %zu chars.\n",
            hex_len);
    return 1;
  }
  for (size_t i = 0; i < 64; i++) {
    uint8_t value;
    bool valid;
    hex_char_value(hex_key[i], &value, &valid);
    if (!valid) {
      fprintf(stderr, "Invalid hex char.\n");
      return 1;
    }
    if (i % 2 == 0) {
      out[i / 2] = 0;
      value <<= 4;
    }
    out[i / 2] += value;
  }
  return 0;
}

int main(int argc, char **argv) {
  size_t out_len = BLAKE3_OUT_LEN;
  uint8_t *key = alloca(BLAKE3_KEY_LEN);
  uint8_t mode = HASH_MODE;
  uint8_t *buf, *B = alloca(BUFSIZE);

  //blake3_set_impl_name("generic");
  blake3_set_impl_name("sse2");
  //blake3_set_impl_name("sse41");
  printf("GET current: %s\n", blake3_get_impl_name());

  while (argc > 1) {
    if (argc <= 2) {
      fprintf(stderr, "Odd number of arguments.\n");
      return 1;
    }
    if (strcmp("--length", argv[1]) == 0) {
      char *endptr = NULL;
      errno = 0;
      unsigned long long out_len_ll = strtoull(argv[2], &endptr, 10);
      if (errno != 0 || out_len > SIZE_MAX || endptr == argv[2] ||
          *endptr != 0) {
        fprintf(stderr, "Bad length argument.\n");
        return 1;
      }
      out_len = (size_t)out_len_ll;
    } else if (strcmp("--keyed", argv[1]) == 0) {
      mode = KEYED_HASH_MODE;
      int ret = parse_key(argv[2], key);
      if (ret != 0) {
        return ret;
      }
    } else {
      fprintf(stderr, "Unknown flag.\n");
      return 1;
    }
    argc -= 2;
    argv += 2;
  }

  {
    cycles_t start, stop;

    BLAKE3_CTX *hasher = alloca(sizeof(BLAKE3_CTX));
    start = get_cycles();
    switch (mode) {
    case HASH_MODE:
      Blake3_Init(hasher);
      break;
    case KEYED_HASH_MODE:
      Blake3_InitKeyed(hasher, key);
      break;
    default:
      abort();
    }

    buf = B;
    while (1) {
      size_t n = fread(buf, 1, BUFSIZE, stdin);
      if (n == 0) {
        break;
      }
      Blake3_Update(hasher, buf, n);
    }

    Blake3_Final(hasher, buf);
    stop = get_cycles();
    for (size_t i = 0; i < out_len; i++) {
      printf("%02x", buf[i]);
    }
    printf(" cycles=%llu\n", (long long unsigned)(stop - start));
  }
  printf("  -\n");

  return 0;
}
