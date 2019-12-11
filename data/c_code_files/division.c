#include <stdio.h>

main()  
{
int dividend, divisor, result, rest;

dividend = 50000000000000000;
divisor =  5;

result = 0;
rest = dividend;
while (rest >= divisor) {
  rest = rest - divisor;
  result++;
}
printf("result = %d " , result);
printf("rest = %d " , rest);                                         
} 
