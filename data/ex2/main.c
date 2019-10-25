#include <stdlib.h>
#include <stdio.h>
extern void ex2(long int * vars);
long int vars [3];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 4)
    {
        printf ("Usage: ex2 x y z\n");
        exit(1);
    }

    vars[0] = atoi(argv[1]);
    vars[1] = atoi(argv[2]);
    vars[2] = atoi(argv[3]);
    printf("Initial State:\n");
    printf("x=%ld\n", vars[0]);
    printf("y=%ld\n", vars[1]);
    printf("z=%ld\n", vars[2]);
    ex2(vars);
    printf("Final State:\n");
    printf("x=%ld\n", vars[0]);
    printf("y=%ld\n", vars[1]);
    printf("z=%ld\n", vars[2]);
    
}