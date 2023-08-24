#include "hello.h"

int main(int argc, char **argv)
{
    test();
    return 0;
}

int test()
{
    int i = 1;
    int* p_i = &i;
    printf("---------------i=%d------------\r\n", i);
    printf("---------------p_i=%p------------\r\n", p_i);
    // int i2 = 2;
    // int* p_i2 = &i2;
    *p_i = 3;
    printf("---------------i=%d------------\r\n", i);
    printf("---------------p_i=%p------------\r\n", p_i);
    printf("---------------------------\r\n");
    printf("[CCMETA] mother fucker test of windows compile\r\n");
    printf("---------------------------\r\n");
    return 0;
}
