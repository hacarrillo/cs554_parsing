#include <stdlib.h>
#include <stdio.h>
extern void test(long int * vars);
long int vars [2];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 3)
    {
        printf ("Usage: test i iterations\n");
        exit(1);
    }

    vars[0] = atoi(argv[1]);
    vars[1] = atoi(argv[2]);
    printf("Initial State:\n");
    printf("i=%ld\n", vars[0]);
    printf("iterations=%ld\n", vars[1]);
    test(vars);
    printf("Final State:\n");
    printf("i=%ld\n", vars[0]);
    printf("iterations=%ld\n", vars[1]);
    
}