#include <stdio.h>
#include <string.h>
#include "check.h"

void ex01(void)
{
    int x = 5;
    int *p = &x;
    *p = 10;
    printf("%d\n", x);
    printf("%p\n", (void *)&x);
    printf("%p\n", (void *)&p);
}

int countSpaces(char characters[])
{
    int counter = 0;
    int charLength = strlen(characters);
    for (int i = 0; i < charLength; i++)
    {
        if (characters[i] == ' '){
            counter = counter + 1;

        }
    }
    return counter;

}
void clamp(int* x, int lo, int hi)
{
    if (*x < lo) 
    {
        *x = lo;
    } else if (*x > hi) 
    {
        *x = hi;
    }
}
void order(int *a, int *b) 
{
    if (*a > *b) 
    {
        int temp = *a;
        *a = *b;
        *b = temp;
    }
}



int main(void)
{
    checkInt(countSpaces("GET / HTTP/1.1"), 2);
    checkInt(countSpaces("abc"), 0);
    checkInt(countSpaces("a b c d"), 3);
    ex01();
    int v = 120; 
    clamp(&v, 0, 100); 
    checkInt(v, 100);
    int w = -5;  
    clamp(&w, 0, 100); 
    checkInt(w, 0);
    int z = 50;  
    clamp(&z, 0, 100); 
    checkInt(z, 50);
    int a = 5, b = 3; 
    order(&a, &b); 
    checkInt(a, 3); 
    checkInt(b, 5);
    return 0;
}