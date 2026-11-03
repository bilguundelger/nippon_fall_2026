#include <stdio.h>
#include <stdbool.h>

void printGreeting(int times)
{
    for (int i = 0; i < times; i++) 
    {
        printf("Сайн уу!\n");
    }

}

void printEvenNumbers(int limit)
{
    for (int i = 0; i <= limit; i += 2) 
    {
        printf("%d ", i);
    }
    printf("\n");

}



void printLetters(char from, char to)
{

    
    for (char c = from; c <= to; c++) 
    {
        printf("%c ", c);
    }
    printf("\n");

}


void printStarLine(int n)
{
    for (int i = 0; i < n; i++)
    {
        printf("*"); 
    }
    printf("\n");    
}


void printCountDownBy(int from, int step)
{
   
    for (int i = from; i > 0; i -= step)
    {
        printf("%d ", i);
    }
    printf("\n"); 
}

void printTriangle(int height)
{

    for (int i = 1; i <= height; i++)
    
        
        for (int j = 0; j < i; j++)
        {
            printf("*");
        }
        
}


void printFizzBuzz(int n)
{
    for (int i = 1; i <= n; i++)
    {
        
        if (i % 3 == 0 && i % 5 == 0)
        {
            printf("FizzBuzz\n");
        }
        
        else if (i % 3 == 0)
        {
            printf("Fizz\n");
        }
        
        else if (i % 5 == 0)
        {
            printf("Buzz\n");
        }
        
        else
        {
            printf("%d\n", i);
        }
    }
}


void printClockHours(int startHour, int count)
{
    for (int i = 0; i < count; i++)
    {
       
        int currentHour = (startHour + i - 1) % 24 + 1;
        
        printf("%d ", currentHour);
    }
    printf("\n");
}
void printSpaces(int n)
{
    for (int i = 0; i < n; i++)
    {
        printf(" ");
    }
}

void printPyramid(int height)
{
    for (int i = 1; i <= height; i++)
    {
        printSpaces(height - i);
        printStarLine(2 * i - 1);
    }
}

void printMonthCalendar(int firstWeekday, int daysInMonth)
{
    printf("Ня Да Мя Лх Пү Ба Бя\n");
    for (int i = 0; i < firstWeekday; i++)
    {
        printf("   "); 
    }
    for (int day = 1; day <= daysInMonth; day++)
    {
        printf("%2d ", day);
        if ((firstWeekday + day) % 7 == 0)
        {
            printf("\n");
        }
    }
    printf("\n");
}




int main(void)
{
    printGreeting(3);
    printEvenNumbers(10);
    printLetters('a', 'f');
    printStarLine(5);
    printCountDownBy(20, 5);
    printFizzBuzz(15);
    printClockHours(22, 5);
    printPyramid(4);
    printMonthCalendar(6, 30);
    printMonthCalendar(0, 28);
    printMonthCalendar(5, 31);
    
    


    return 0;
}