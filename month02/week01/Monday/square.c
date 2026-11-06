#include <stdio.h>
// integer 32bits -> buhel too
// number -> number
// int -> int
// return -> utga butsaah
int square(int x) 
{
    return x * x;
}
// double / float -> butarhai too
// 
int main(void) 
{
    printf("%d\n", square(7));
    printf("%d\n", square(-3));
    return 0;
}

