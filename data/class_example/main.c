#include <stdlib.h>
#include <stdio.h>
extern void ex(long int * vars);
long int vars [5];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 6)
    {
        printf ("Usage: ex a b x y z\n");
        exit(1);
    }

    vars[3] = atoi(argv[1]);
    vars[4] = atoi(argv[2]);
    vars[1] = atoi(argv[3]);
    vars[0] = atoi(argv[4]);
    vars[2] = atoi(argv[5]);
    printf("Initial State:\n");
    printf("a=%ld\n", vars[3]);
    printf("b=%ld\n", vars[4]);
    printf("x=%ld\n", vars[1]);
    printf("y=%ld\n", vars[0]);
    printf("z=%ld\n", vars[2]);
    ex(vars);
    printf("Final State:\n");
    printf("a=%ld\n", vars[3]);
    printf("b=%ld\n", vars[4]);
    printf("x=%ld\n", vars[1]);
    printf("y=%ld\n", vars[0]);
    printf("z=%ld\n", vars[2]);
    
}