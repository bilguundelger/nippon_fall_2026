#include <stdio.h>
#include <ctype.h>
#include "check.h"

/* count_upper : char[] -> int   'A'–'Z' хоорондох тэмдэгтийн тоо */

int countUpper(char s[])
{
    int count = 0;
    for (int i = 0; s[i] != '\0'; i++)
    {
        if (s[i] >= 'A' && s[i] <= 'Z')
        {
            count++;
        }
    }
    return count;
}

/* index_of_char : char[] char -> int   эхний байр, олдоогүй бол -1 */
int indexOfChar(char s[], char c)
{
    for (int i = 0; s[i] != '\0'; i++)
    {
        if (s[i] == c)
        { 
            return i;
        }
    }
    return -1;

}
void toLower(char s[]) {
    for (int i = 0; s[i] != '\0'; i++) 
    {
        s[i] = tolower(s[i]); 
    }
}
int isSorted(int a[], int n) 
{
    for (int i = 0; i < n - 1; i++)
    {
        if (a[i] > a[i + 1])
        {
            return 0;
        }
    }
    return 1;
}
int bubbleSort(int a[], int n) {
    int swaps = 0;
    for (int i = 0; i < n - 1; i++) 
    {
        for (int j = 0; j < n - 1 - i; j++) 
        {
            if (a[j] > a[j + 1]) 
            {
                int t = a[j];
                a[j] = a[j + 1];
                a[j + 1] = t;
                swaps = swaps + 1;
            }
        }
    }
    return swaps;
}

int selectionSort(int a[], int n) 
{
    int swaps = 0;
    for (int i = 0; i < n - 1; i++) 
    {
        int m = i;
        for (int j = i + 1; j < n; j++) 
        {
            if (a[j] < a[m]) 
            {
                m = j;
            }
        }
        if (m != i) 
        {
            int t = a[i];
            a[i] = a[m];
            a[m] = t;
            swaps = swaps + 1;
        }
    }
    return swaps;
}

void printBars(int a[], int n)
{
    for (int i = 0; i < n; i++)
    {
        printf("%3d: ", a[i]);
        for (int j = 0; j < a[i] / 10; j++)
        {
            printf("*");
        }
        printf("\n");
    }
}



int main(void)
{
    int s[] = {1, 2, 3};
    int u[] = {3, 1, 2};
    printf("--- countUpper ---\n");
    checkInt(countUpper("Hello World"), 2);
    checkInt(countUpper("abc"), 0);
    checkInt(countUpper("ABC"), 3);
    printf("--- indexOfChar ---\n");
    checkInt(indexOfChar("banana", 'n'), 2);
    checkInt(indexOfChar("abc", 'z'), -1);
    checkInt(indexOfChar("", 'a'), -1);
    printf("--- tolower ---\n");
    char a[] = "HeLLo"; toLower(a); checkString(a, "hello");
    char b[] = "ABC";   toLower(b); checkString(b, "abc");
    printf("--- isSorted ---\n");
    checkInt(isSorted(s, 3), 1);
    checkInt(isSorted(u, 3), 0);
    printf("--- bubbleSort ---\n");
    int arr[6] = {5, 2, 8, 1, 9, 3};
    checkInt(bubbleSort(arr, 6), 7);
    checkInt(isSorted(arr, 6), 1);
    checkInt(arr[0], 1);
    checkInt(arr[5], 9);
    printf("--- selectionSort ---\n");
    int b_arr[6] = {5, 2, 8, 1, 9, 3};
    checkInt(selectionSort(b_arr, 6), 7);
    checkInt(isSorted(b_arr, 6), 1);
    int r[4] = {4, 3, 2, 1};
    checkInt(selectionSort(r, 4), 6);
    printf("--- 3B: scores ---\n");
    int scores[5] = {70, 82, 95, 63, 88};
    bubbleSort(scores, 5);
    printBars(scores, 5);

    return 0;
}