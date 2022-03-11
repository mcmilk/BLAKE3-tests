
dd if=/dev/zero bs=1M count=1  2>2 |./blake3 >1M
dd if=/dev/zero bs=1  count=1M 2>2 |./blake3 >1b
