#include <stdio.h>

struct student 
{
    char name[20];
    int quiz;
    int project;
};


double final_score(struct student s) 
{
    return 0.4 * s.quiz + 0.6 * s.project;
}


struct student group[4] = 
{
    {"Aki", 80, 90}, 
    {"Sora", 60, 60}, 
    {"Mina", 95, 91}, 
    {"Ren", 45, 55}
};


int count_passing_students(struct student students[], int size) 
{
    int counter = 0;
    for (int i = 0; i < size; i++) {
        double finalScore = final_score(students[i]);
        if (finalScore >= 60) 
        {
            counter = counter + 1;
        }
    }
    return counter;
}


int best_index(struct student a[], int n) 
{
    int best = 0;
    for (int i = 1; i < n; i++) 
    {
        if (final_score(a[i]) > final_score(a[best])) 
        {
            best = i;
        }
    }
    return best;
}


double average_final(struct student students[], int size) 
{
    double total = 0.0;
    for (int i = 0; i < size; i++) {
        total = total + final_score(students[i]);
    }
    return total / size;
}


char letter_grade(double n) 
{
    if (n >= 90) return 'A';
    else if (n >= 80) return 'B';
    else if (n >= 70) return 'C';
    else if (n >= 60) return 'D';
    else return 'F';
}


void print_student(struct student s) 
{
    printf("%s %.1f %c\n", s.name, final_score(s), letter_grade(final_score(s)));
}


void check_double(double actual, double expected) 
{
    double diff = actual - expected;
    if (diff < 0.001 && diff > -0.001) {
        printf("PASS\n");
    } else {
        printf("FAIL: %f гарсан, %f хүлээсэн\n", actual, expected);
    }
}



void check_int(int actual, int expected) 
{
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: expected %d, got %d\n", expected, actual);
    }
}


// Exercise 1: 

int count_grade(struct student group[], int size, char target_grade) {
    int count = 0;
    for (int i = 0; i < size; i++) 
    {
        char grade = letter_grade(final_score(group[i]));
        if (grade == target_grade) 
        {
            count++;
        }
    }
    return count;
}

// Exercise 2
int second_max(int a[], int n) 
{
    int max1, max2;
    if (a[1] > a[0]) 
    {
        max1 = a[1];
        max2 = a[0];
    } else 
    {
        max1 = a[0];
        max2 = a[1];
    }
    for (int i = 2; i < n; i++) 
    {
        if (a[i] > max1) 
        {
            max2 = max1;
            max1 = a[i];
        } else if (a[i] > max2) 
        {
            max2 = a[i];
        }
    }
    return max2;
}

// Exercise 3:
int count_in_range(int a[], int n, int lo, int hi) 
{
    int c = 0;
    for (int i = 0; i < n; i++) 
    {
        if (a[i] >= lo && a[i] <= hi)
         {
            c = c + 1;
        }
    }
    return c;
}





int main(void) 
{
    
    check_double(final_score(group[0]), 86.0);
    check_double(final_score(group[2]), 92.6);
    check_int(count_passing_students(group, 4), 3);
    check_int(best_index(group, 4), 2);
    check_double(average_final(group, 4), 72.4);
    for (int i = 0; i < 4; i++) {
        print_student(group[i]);
    }
    check_int(count_grade(group, 4, 'A'), 1);
    check_int(count_grade(group, 4, 'F'), 1);
    check_int(count_grade(group, 4, 'C'), 0);
    int scores[5] = {70, 82, 95, 63, 88};
    int b[6] = {5, 2, 7, 2, 9, 1};

    
    check_int(second_max(scores, 5), 88);
    check_int(second_max(b, 6), 7);
    
    check_int(count_in_range(scores, 5, 80, 90), 2);
    check_int(count_in_range(scores, 5, 0, 100), 5);
    
    return 0;
}




