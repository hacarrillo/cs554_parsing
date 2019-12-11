#include <stdlib.h>
#include <stdio.h>
extern void ex(long int * vars);
long int vars [2];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 3)
    {
        printf ("Usage: ex x y\n");
        exit(1);
    }

    vars[1] = atoi(argv[1]);
    vars[0] = atoi(argv[2]);
    printf("Initial State:\n");
    printf("x=%ld\n", vars[1]);
    printf("y=%ld\n", vars[0]);
    ex(vars);
    printf("Final State:\n");
    printf("x=%ld\n", vars[1]);
    printf("y=%ld\n", vars[0]);
    
}