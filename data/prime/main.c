#include <stdlib.h>
#include <stdio.h>
extern void test(long int * vars);
long int vars [5];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 6)
    {
        printf ("Usage: test count i k range result\n");
        exit(1);
    }

    vars[2] = atoi(argv[1]);
    vars[3] = atoi(argv[2]);
    vars[4] = atoi(argv[3]);
    vars[1] = atoi(argv[4]);
    vars[0] = atoi(argv[5]);
    printf("Initial State:\n");
    printf("count=%ld\n", vars[2]);
    printf("i=%ld\n", vars[3]);
    printf("k=%ld\n", vars[4]);
    printf("range=%ld\n", vars[1]);
    printf("result=%ld\n", vars[0]);
    test(vars);
    printf("Final State:\n");
    printf("count=%ld\n", vars[2]);
    printf("i=%ld\n", vars[3]);
    printf("k=%ld\n", vars[4]);
    printf("range=%ld\n", vars[1]);
    printf("result=%ld\n", vars[0]);
    
}