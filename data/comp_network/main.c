#include <stdlib.h>
#include <stdio.h>
extern void comp_network(long int * vars);
long int vars [13];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 14)
    {
        printf ("Usage: comp_network output t w0 w1 w10 w2 w3 w4 w5 w6 w7 w8 w9\n");
        exit(1);
    }

    vars[12] = atoi(argv[1]);
    vars[2] = atoi(argv[2]);
    vars[0] = atoi(argv[3]);
    vars[1] = atoi(argv[4]);
    vars[11] = atoi(argv[5]);
    vars[3] = atoi(argv[6]);
    vars[4] = atoi(argv[7]);
    vars[5] = atoi(argv[8]);
    vars[6] = atoi(argv[9]);
    vars[7] = atoi(argv[10]);
    vars[8] = atoi(argv[11]);
    vars[9] = atoi(argv[12]);
    vars[10] = atoi(argv[13]);
    printf("Initial State:\n");
    printf("output=%ld\n", vars[12]);
    printf("t=%ld\n", vars[2]);
    printf("w0=%ld\n", vars[0]);
    printf("w1=%ld\n", vars[1]);
    printf("w10=%ld\n", vars[11]);
    printf("w2=%ld\n", vars[3]);
    printf("w3=%ld\n", vars[4]);
    printf("w4=%ld\n", vars[5]);
    printf("w5=%ld\n", vars[6]);
    printf("w6=%ld\n", vars[7]);
    printf("w7=%ld\n", vars[8]);
    printf("w8=%ld\n", vars[9]);
    printf("w9=%ld\n", vars[10]);
    comp_network(vars);
    printf("Final State:\n");
    printf("output=%ld\n", vars[12]);
    printf("t=%ld\n", vars[2]);
    printf("w0=%ld\n", vars[0]);
    printf("w1=%ld\n", vars[1]);
    printf("w10=%ld\n", vars[11]);
    printf("w2=%ld\n", vars[3]);
    printf("w3=%ld\n", vars[4]);
    printf("w4=%ld\n", vars[5]);
    printf("w5=%ld\n", vars[6]);
    printf("w6=%ld\n", vars[7]);
    printf("w7=%ld\n", vars[8]);
    printf("w8=%ld\n", vars[9]);
    printf("w9=%ld\n", vars[10]);
    
}