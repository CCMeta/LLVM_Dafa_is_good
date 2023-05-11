#!/bin/sh

ARCH=aarch64
# or ARCH=x86_64 etc.
GCCVERSION=11

# Scrt1.o for dynamic PIE
# rcrt1.o for static PIE
# crt1.o for no PIE
LIB_PREFIX=/lib/aarch64-linux-musl-cross/aarch64-linux-musl/lib
# GNU_LIB_PREFIX=/usr/lib/gcc-cross/aarch64-linux-gnu/11

if echo " $@" | fgrep -q -- ' -static'; then
  # DYNLINKER=''
  if echo " $@" | fgrep -q -- ' -static-pie'; then
    CRT_1=${LIB_PREFIX}/rcrt1.o
  else
    CRT_1=${LIB_PREFIX}/crt1.o
  fi
else
  # DYNLINKER="-Wl,-dynamic-linker,/lib/aarch64-linux-musl-cross/aarch64-linux-musl/lib/libc.so"
  if echo " $@" | fgrep -q -- ' -pie'; then
    CRT_1=${LIB_PREFIX}/Scrt1.o
  else
    CRT_1=${LIB_PREFIX}/crt1.o
  fi
fi

exec clang -target aarch64-linux-musl -fuse-ld=lld -nostdinc -nostdlib \
    -isystem /lib/aarch64-linux-musl-cross/aarch64-linux-musl/include \
    -L ${LIB_PREFIX} $CRT_1 ${LIB_PREFIX}/crti.o \
    -lc ${LIB_PREFIX}/crtn.o \
    "$@" -v -o shit

# Not use DYNLINKER  if use  this is error showing.
# -lc ${GNU_LIB_PREFIX}/libgcc.a ${LIB_PREFIX}/crtn.o  why must add GNU libgcc???? wtf
# -nostdlib++ -nodefaultlibs -nostartfiles

# ````/usr/bin/ld: unrecognised emulation mode: aarch64linux````     ->   -fuse-ld=lld