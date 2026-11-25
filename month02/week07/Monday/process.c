#include <stdio.h>
#include <unistd.h>

int main(void)
{
    printf("Bi process %d\n", (int)getpid());
    fflush(stdout);
    sleep(30);
    printf("duuslaa\n");
    return 0;

}