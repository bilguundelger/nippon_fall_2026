#include <stdio.h>

int main(void
{
    int x = 0;
    printf("%d\n", x); // 0
    printf("%p\n", (void *)&x); // which address on RAM
    return 0; 
}