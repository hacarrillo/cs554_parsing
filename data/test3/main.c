#include <stdlib.h>
#include <stdio.h>
extern void p3(long int * vars);
long int vars [1];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 2)
    {
        printf ("Usage: p3 e\n");
        exit(1);
    }

    vars[0] = atoi(argv[1]);
    printf("Initial State:\n");
    printf("e=%ld\n", vars[0]);
    p3(vars);
    printf("Final State:\n");
    printf("e=%ld\n", vars[0]);
    
}