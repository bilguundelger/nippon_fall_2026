#include <stdio.h>

// (define numbers (cons 3 (cons 4 (cons empty))))
int sumOddTo(int limit)
{
    int sum = 0;
    for (int i = 1; i < limit; ++i)
    {
        if (i % 2 == 1)
        {
            sum += i;
        }
    }
    return sum;
}
int main(void)
{
    // 1 2 4 5 - array
    int numbers[4] = {1, 2, 4, 5};
    printf("%d ", numbers[2]); 
    // scores 70, 82, 95, 63, 88

    int scores[5] = {70, 82, 95, 63, 88};
    printf("%d \n", scores[4]);
    printf("%d \n", scores[2]);
    printf("%d \n", scores[0]);
    // array value change
    // 63 -> 85
    printf("Before change %d \n", scores[3]);
    scores[3] = 85;
    printf("After change %d \n", scores[3]);
    // print all value of arrays
    char englishAlphabet[26] = {'a', 'b', 'c', 'd', 'e', 'f', 'g',
        'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
        't', 'u', 'v', 'w', 'x', 'y', 'z'};
        
    for (int i = 0; i < 26; i++)
    {
        printf("%c ", englishAlphabet[i]); 
    }
    printf("\n");
    for (int i = 1; i <= 26; i++)
    {
        if (i == 1)
        {
            printf("1st letter: %c\n", englishAlphabet[0]);
        }
        else if (i == 2)
        {
            printf("2nd letter: %c\n", englishAlphabet[1]);
        }
        else if (i == 3)
        {
            printf("3rd letter: %c\n", englishAlphabet[2]);
        }
        else
        {
            printf("%dth letter: %c\n", i, englishAlphabet[i - 1]);
        }
    }
    int size = sizeof(englishAlphabet);
    printf("%d\n", size);
    // make it length of 10 array
    // fill with 1 to 10
    // use for loop and sizeof to numbers 1-20 change it 
    // into contains only even numbers like this 
    // [1, 2, 3, 4, ...] -- [2, 4, 6, ...]
    

    int tenNumbers[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int tenNumbersSize = sizeof(tenNumbers) / sizeof(tenNumbers[0]);

    printf("Before:\n");
    for (int i = 0; i < tenNumbersSize; i++)
    {
        printf("%d \n", tenNumbers[i]);
    }

    for (int i = 0; i < tenNumbersSize; i++)
    {
        tenNumbers[i] = (i + 1) * 2; 
    }

    printf("After:\n");
    for (int i = 0; i < tenNumbersSize; i++)
    {
        printf("%d \n", tenNumbers[i]);
    }
    printf("%d \n", sumOddTo(100));
    

    return 0;
}


    
    




    
    

    





    


