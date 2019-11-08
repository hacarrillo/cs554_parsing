#include <stdlib.h>
#include <stdio.h>
extern void test(long int * vars);
long int vars [1];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 2)
    {
        printf ("Usage: test a\n");
        exit(1);
    }

    vars[0] = atoi(argv[1]);
    printf("Initial State:\n");
    printf("a=%ld\n", vars[0]);
    test(vars);
    printf("Final State:\n");
    printf("a=%ld\n", vars[0]);
    
}