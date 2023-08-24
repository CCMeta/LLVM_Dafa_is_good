# LLVM_Dafa_is_good

- static lib

```console
gcc -c hello.c && ar -crs libhello.a hello.o
```

- dynamic lib

```console
gcc -c hello.c && gcc hello.o -shared -fPIC -o libhello.so
```

- link lib

```console
gcc main.c -L. -lhello -o main
```
