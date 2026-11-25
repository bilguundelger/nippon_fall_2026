#include <stdio.h>
// IF ELSE
// (cond)

// racket <- age parametr

// 0 < age <= 13 baby
// 13 < age <= 19 teenager 
// 20 < age <= 65 adult
// 65 < age -- senior

// if (0 < age && age <= 19)
void getAgeCategory(int age)
{
    if (0 < age && age <= 13)
    {
        printf("baby\n");
    } 
    else if (13 < age && age <= 19)
    {
        printf("teenager\n");
    }
    else if (20 < age && age <= 65)
    {
        printf("adult\n");
    }
    else if (age > 65)
    {
        printf("senior\n");
    }
    else
    {
        printf("invalid age\n");
    }
}


int main(void)
{
    getAgeCategory(5);
    getAgeCategory(15);
    getAgeCategory(30);
    getAgeCategory(70);
    getAgeCategory(-1);
    getAgeCategory(1000);
    return 0;
}



{
    printf("teenager");

}