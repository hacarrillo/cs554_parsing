#include <stdlib.h>
#include <stdio.h>
extern void example39(long int * vars);
long int vars [4];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 5)
    {
        printf ("Usage: example39 a b c output\n");
        exit(1);
    }

    vars[0] = atoi(argv[1]);
    vars[1] = atoi(argv[2]);
    vars[2] = atoi(argv[3]);
    vars[3] = atoi(argv[4]);
    printf("Initial State:\n");
    printf("a=%ld\n", vars[0]);
    printf("b=%ld\n", vars[1]);
    printf("c=%ld\n", vars[2]);
    printf("output=%ld\n", vars[3]);
    example39(vars);
    printf("Final State:\n");
    printf("a=%ld\n", vars[0]);
    printf("b=%ld\n", vars[1]);
    printf("c=%ld\n", vars[2]);
    printf("output=%ld\n", vars[3]);
    
}