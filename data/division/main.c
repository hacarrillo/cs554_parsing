#include <stdlib.h>
#include <stdio.h>
extern void test(long int * vars);
long int vars [6];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 7)
    {
        printf ("Usage: test dividend divisor neg quotient result sign\n");
        exit(1);
    }

    vars[2] = atoi(argv[1]);
    vars[3] = atoi(argv[2]);
    vars[1] = atoi(argv[3]);
    vars[0] = atoi(argv[4]);
    vars[5] = atoi(argv[5]);
    vars[4] = atoi(argv[6]);
    printf("Initial State:\n");
    printf("dividend=%ld\n", vars[2]);
    printf("divisor=%ld\n", vars[3]);
    printf("neg=%ld\n", vars[1]);
    printf("quotient=%ld\n", vars[0]);
    printf("result=%ld\n", vars[5]);
    printf("sign=%ld\n", vars[4]);
    test(vars);
    printf("Final State:\n");
    printf("dividend=%ld\n", vars[2]);
    printf("divisor=%ld\n", vars[3]);
    printf("neg=%ld\n", vars[1]);
    printf("quotient=%ld\n", vars[0]);
    printf("result=%ld\n", vars[5]);
    printf("sign=%ld\n", vars[4]);
    
}