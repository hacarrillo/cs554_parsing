#include <stdlib.h>
#include <stdio.h>
extern void p2(long int * vars);
long int vars [4];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 5)
    {
        printf ("Usage: p2 m output w z\n");
        exit(1);
    }

    vars[2] = atoi(argv[1]);
    vars[3] = atoi(argv[2]);
    vars[0] = atoi(argv[3]);
    vars[1] = atoi(argv[4]);
    printf("Initial State:\n");
    printf("m=%ld\n", vars[2]);
    printf("output=%ld\n", vars[3]);
    printf("w=%ld\n", vars[0]);
    printf("z=%ld\n", vars[1]);
    p2(vars);
    printf("Final State:\n");
    printf("m=%ld\n", vars[2]);
    printf("output=%ld\n", vars[3]);
    printf("w=%ld\n", vars[0]);
    printf("z=%ld\n", vars[1]);
    
}