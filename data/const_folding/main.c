#include <stdlib.h>
#include <stdio.h>
extern void ex(long int * vars);
long int vars [1];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 2)
    {
        printf ("Usage: ex a\n");
        exit(1);
    }

    vars[0] = atoi(argv[1]);
    printf("Initial State:\n");
    printf("a=%ld\n", vars[0]);
    ex(vars);
    printf("Final State:\n");
    printf("a=%ld\n", vars[0]);
    
}