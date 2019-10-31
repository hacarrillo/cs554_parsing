#include <stdlib.h>
#include <stdio.h>
extern void ex1(long int * vars);
long int vars [16];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 17)
    {
        printf ("Usage: ex1 a b c denominator discriminant guess last_guess n numerator1 numerator2 quotient r1 r2 remainder roots sqrt_discriminant\n");
        exit(1);
    }

    vars[2] = atoi(argv[1]);
    vars[1] = atoi(argv[2]);
    vars[3] = atoi(argv[3]);
    vars[11] = atoi(argv[4]);
    vars[0] = atoi(argv[5]);
    vars[8] = atoi(argv[6]);
    vars[7] = atoi(argv[7]);
    vars[6] = atoi(argv[8]);
    vars[12] = atoi(argv[9]);
    vars[14] = atoi(argv[10]);
    vars[9] = atoi(argv[11]);
    vars[13] = atoi(argv[12]);
    vars[15] = atoi(argv[13]);
    vars[10] = atoi(argv[14]);
    vars[4] = atoi(argv[15]);
    vars[5] = atoi(argv[16]);
    printf("Initial State:\n");
    printf("a=%ld\n", vars[2]);
    printf("b=%ld\n", vars[1]);
    printf("c=%ld\n", vars[3]);
    printf("denominator=%ld\n", vars[11]);
    printf("discriminant=%ld\n", vars[0]);
    printf("guess=%ld\n", vars[8]);
    printf("last_guess=%ld\n", vars[7]);
    printf("n=%ld\n", vars[6]);
    printf("numerator1=%ld\n", vars[12]);
    printf("numerator2=%ld\n", vars[14]);
    printf("quotient=%ld\n", vars[9]);
    printf("r1=%ld\n", vars[13]);
    printf("r2=%ld\n", vars[15]);
    printf("remainder=%ld\n", vars[10]);
    printf("roots=%ld\n", vars[4]);
    printf("sqrt_discriminant=%ld\n", vars[5]);
    ex1(vars);
    printf("Final State:\n");
    printf("a=%ld\n", vars[2]);
    printf("b=%ld\n", vars[1]);
    printf("c=%ld\n", vars[3]);
    printf("denominator=%ld\n", vars[11]);
    printf("discriminant=%ld\n", vars[0]);
    printf("guess=%ld\n", vars[8]);
    printf("last_guess=%ld\n", vars[7]);
    printf("n=%ld\n", vars[6]);
    printf("numerator1=%ld\n", vars[12]);
    printf("numerator2=%ld\n", vars[14]);
    printf("quotient=%ld\n", vars[9]);
    printf("r1=%ld\n", vars[13]);
    printf("r2=%ld\n", vars[15]);
    printf("remainder=%ld\n", vars[10]);
    printf("roots=%ld\n", vars[4]);
    printf("sqrt_discriminant=%ld\n", vars[5]);
    
}