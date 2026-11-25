#include <stdio.h>

struct student {
    char name[20];
    int quiz;
    int project;
};

// 1. Оноо тооцох функц
double final_score(struct student s) {
    return 0.4 * s.quiz + 0.6 * s.project;
}

// Сурагчдын массив
struct student group[4] = {
    {"Aki", 80, 90}, 
    {"Sora", 60, 60}, 
    {"Mina", 95, 91}, 
    {"Ren", 45, 55}
};

// 2. Тэнцсэн сурагчдын тоог олох функц
int count_passing_students(struct student students[], int size) {
    int counter = 0;
    for (int i = 0; i < size; i++) {
        double finalScore = final_score(students[i]);
        if (finalScore >= 60) {
            counter = counter + 1;
        }
    }
    return counter;
}

// 3. Эцсийн оноо хамгийн их сурагчийн индексийг олох функц
int best_index(struct student a[], int n) {
    int best = 0;
    for (int i = 1; i < n; i++) {
        if (final_score(a[i]) > final_score(a[best])) {
            best = i;
        }
    }
    return best;
}

// 4. Дундаж оноог олох функц
double average_final(struct student students[], int size) {
    double total = 0.0;
    for (int i = 0; i < size; i++) {
        total = total + final_score(students[i]);
    }
    return total / size;
}

// 5. Үсгэн үнэлгээг тодорхойлох функц (letter_grade)
char letter_grade(double n) {
    if (n >= 90) return 'A';
    else if (n >= 80) return 'B';
    else if (n >= 70) return 'C';
    else if (n >= 60) return 'D';
    else return 'F';
}

// 6. Сурагчийн мэдээллийг хэвлэх функц (print_student)
void print_student(struct student s) {
    printf("%s %.1f %c\n", s.name, final_score(s), letter_grade(final_score(s)));
}

// Туслах шалгах функцүүд
void check_double(double actual, double expected) {
    double diff = actual - expected;
    if (diff < 0.001 && diff > -0.001) {
        printf("PASS\n");
    } else {
        printf("FAIL: %f гарсан, %f хүлээсэн\n", actual, expected);
    }
}

void check_int(int actual, int expected) {
    if (actual == expected) {
        printf("PASS\n");
    } else {
        printf("FAIL: %d гарсан, %d хүлээсэн\n", actual, expected);
    }
}

int main(void) {
    // Туршилтууд
    check_double(final_score(group[0]), 86.0);
    check_double(final_score(group[2]), 92.6);
    check_int(count_passing_students(group, 4), 3);
    check_int(best_index(group, 4), 2);
    check_double(average_final(group, 4), 72.4);
    for (int i = 0; i < 4; i++) {
        print_student(group[i]);
    }
    
    return 0;
}