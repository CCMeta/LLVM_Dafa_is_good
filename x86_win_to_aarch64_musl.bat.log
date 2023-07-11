@echo off
set shell_string =
start cmd /k "

clang -target aarch64-linux-musl  -fuse-ld=lld -nostdinc -nostdlib -isystem 
E:\LLVM\__archs\aarch64-linux-musl-cross\aarch64-linux-musl\include -L 
E:\LLVM\__archs\aarch64-linux-musl-cross\aarch64-linux-musl\lib 
E:\LLVM\__archs\aarch64-linux-musl-cross\aarch64-linux-musl\lib\crt1.o 
E:\LLVM\__archs\aarch64-linux-musl-cross\aarch64-linux-musl\lib\crti.o 
E:\LLVM\__archs\aarch64-linux-musl-cross\aarch64-linux-musl\lib\crtn.o 
-lc -v hello.c -o shit


"