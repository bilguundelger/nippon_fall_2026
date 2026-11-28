#include <stdio.h>
#include "check.h"

int bubbleSort(int a[], int n)
{
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
                swaps++;
            }
        }
    }
    return swaps;
}

int is_sorted(int a[], int n)
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

/* count_inversions : int[] int -> int */

int count_inversions(int a[], int n)
{
    int inversions = 0;

    for (int i = 0; i < n - 1; i++)
    {
        for (int j = i + 1; j < n; j++)
        {
            if (a[i] > a[j])
            {
                inversions++;
            }
        }
    }
    return inversions;
}

/* insertion_sort : int[] int -> int */

int insertion_sort(int a[], int n)
{
    int swaps = 0;

    for (int i = 1; i < n; i++)
    {
        int key = a[i];
        int j = i - 1;

        while (j >= 0 && a[j] > key)
        {
            a[j + 1] = a[j];
            j--;
            swaps++;
        }

        a[j + 1] = key;
    }

    return swaps;
}

/* median : int[] int -> int */

int median(int a[], int n)
{
    bubbleSort(a, n);
    return a[n / 2];
}

int main(void)
{
    int c[5] = {5, 2, 8, 1, 9};
    int d[3] = {7, 7, 1};

    int a[6] = {5, 2, 8, 1, 9, 3};
    int b[6] = {5, 2, 8, 1, 9, 3};
    int s[3] = {1, 2, 3};

    checkInt(median(c, 5), 5);
    checkInt(median(d, 3), 7);

    checkInt(insertion_sort(b, 6), 7);
    checkInt(is_sorted(b, 6), 1);

    checkInt(count_inversions(a, 6), 7);
    checkInt(count_inversions(s, 3), 0);

    printf("Median of c: %d\n", c[2]);
    printf("Median of d: %d\n", d[1]);
    printf("Insertion sort shifts: %d\n", 7);
    printf("Is b sorted? %d\n", is_sorted(b, 6));
    printf("Inversions in a: %d\n", count_inversions(a, 6));
    printf("Inversions in s: %d\n", count_inversions(s, 3));

    printf("\nSorted b: ");
    for (int i = 0; i < 6; i++)
    {
        printf("%d ", b[i]);
    }

    printf("\n");

    return 0;
}