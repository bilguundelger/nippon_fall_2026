#include <stdio.h>
#include <math.h> 
#include <stdbool.h>


void check_int(int actual, int expected);
void check_double(double actual, double expected);
double apply_discount(double price, double discount_percent);
char to_upper_case(char c);


   



void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASS: expected %d, got %d\n", expected, actual);
    } else {
        printf("FAIL: expected %d, got %d\n", expected, actual);
    }
}


void check_double(double actual, double expected) {
    if (fabs(actual - expected) < 0.001) {
        printf("PASS: expected %.3f, got %.3f\n", expected, actual);
    } else {
        printf("FAIL: expected %.3f, got %.3f\n", expected, actual);
    }
}

double apply_discount(double price, double discount_percent) {
    return price * (1.0 - discount_percent);
}

char to_upper_case(char c) {
    
    if (c >= 'a' && c <= 'z') {
        return c - 32;
    }
    return c;
}

bool is_negative(int number)
{
   return number > 0;
}

bool is_positive(int number)
{
    return number > 0;
    
}

bool is_positive_and_even(int n)
{
    return (n > 0) && (n % 2 == 0);
}
int round_down_to_ten(int n) {
    return (n / 10) * 10;
}





bool at_least_two_positive(int a, int b, int c) {
    return (a > 0 && b > 0) || (a > 0 && c > 0) || (b > 0 && c > 0);
}
bool at_least_two_positive(int a, int b, int c)
{
    return ((a > 0) + (b > 0) + (c > 0)) >= 2;
}
    















