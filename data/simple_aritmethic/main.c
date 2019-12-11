#include <stdlib.h>
#include <stdio.h>
extern void test(long int * vars);
long int vars [0];
int main (int argc, char ** argv)
{
    int i;
    if (argc != 1)
    {
        printf ("Usage: test \n");
        exit(1);
    }

    printf("Initial State:\n");
    test(vars);
    printf("Final State:\n");
    
}