#include <stdlib.h>
#include <stdio.h>
extern void test(long int * vars);
long int vars [6];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 7)
    {
        printf ("Usage: test iteration length r x y z\n");
        exit(1);
    }

    vars[2] = atoi(argv[1]);
    vars[4] = atoi(argv[2]);
    vars[3] = atoi(argv[3]);
    vars[0] = atoi(argv[4]);
    vars[1] = atoi(argv[5]);
    vars[5] = atoi(argv[6]);
    printf("Initial State:\n");
    printf("iteration=%ld\n", vars[2]);
    printf("length=%ld\n", vars[4]);
    printf("r=%ld\n", vars[3]);
    printf("x=%ld\n", vars[0]);
    printf("y=%ld\n", vars[1]);
    printf("z=%ld\n", vars[5]);
    test(vars);
    printf("Final State:\n");
    printf("iteration=%ld\n", vars[2]);
    printf("length=%ld\n", vars[4]);
    printf("r=%ld\n", vars[3]);
    printf("x=%ld\n", vars[0]);
    printf("y=%ld\n", vars[1]);
    printf("z=%ld\n", vars[5]);
    
}