/**
 * Input;
 * a = 7
 * b = 2
 * 
 *  Output;
 * 3
 * 1
 * 3.5
 * 4
 * 123
 * * Input:
 * score = 50
 * score = score + 10
 * Output:
 * 60
 * Input:
 * x = 0.1 + 0.2
 * Output:
 * 0.3000000000000004
 */

 #include <stdio.h>

 int main(void)
 {
    int a = 7;
    int b = 2;
    printf("%d\n", a / b);
    printf("%d\n", a % b);
    printf("%.1f\n", 7.0 / 2);
    printf("%d\n", 1234 % 10);
    printf("%d\n", 1234 / 10);

    int score = 50;
    score = score + 10;
    printf("%d\n", score);

    double x = 0.1 + 0.2;
    printf("%.17f\n", x);

     return 0;

 }

 