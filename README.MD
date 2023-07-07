# LLVM_Dafa_is_good

- static lib: gcc -c hello.c && ar -crs libhello.a hello.o
- dynamic lib: gcc -c hello.c && gcc hello.o -shared -fPIC -o libhello.so
- link lib: gcc main.c -L. -lhello -o main