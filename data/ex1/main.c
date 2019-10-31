#include <stdlib.h>
#include <stdio.h>
extern void ex1(long int * vars);
long int vars [2];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 3)
    {
        printf ("Usage: ex1 a b\n");
        exit(1);
    }

    vars[1] = atoi(argv[1]);
    vars[0] = atoi(argv[2]);
    printf("Initial State:\n");
    printf("a=%ld\n", vars[1]);
    printf("b=%ld\n", vars[0]);
    ex1(vars);
    printf("Final State:\n");
    printf("a=%ld\n", vars[1]);
    printf("b=%ld\n", vars[0]);
    
}