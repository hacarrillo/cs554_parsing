#include <stdlib.h>
#include <stdio.h>
extern void p4(long int * vars);
long int vars [1];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 2)
    {
        printf ("Usage: p4 output\n");
        exit(1);
    }

    vars[0] = atoi(argv[1]);
    printf("Initial State:\n");
    printf("output=%ld\n", vars[0]);
    p4(vars);
    printf("Final State:\n");
    printf("output=%ld\n", vars[0]);
    
}