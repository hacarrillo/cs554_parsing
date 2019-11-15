#include <stdlib.h>
#include <stdio.h>
extern void test(long int * vars);
long int vars [4];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 5)
    {
        printf ("Usage: test c i iterations total\n");
        exit(1);
    }

    vars[1] = atoi(argv[1]);
    vars[3] = atoi(argv[2]);
    vars[2] = atoi(argv[3]);
    vars[0] = atoi(argv[4]);
    printf("Initial State:\n");
    printf("c=%ld\n", vars[1]);
    printf("i=%ld\n", vars[3]);
    printf("iterations=%ld\n", vars[2]);
    printf("total=%ld\n", vars[0]);
    test(vars);
    printf("Final State:\n");
    printf("c=%ld\n", vars[1]);
    printf("i=%ld\n", vars[3]);
    printf("iterations=%ld\n", vars[2]);
    printf("total=%ld\n", vars[0]);
    
}