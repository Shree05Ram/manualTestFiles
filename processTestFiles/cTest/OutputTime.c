#include<stdio.h>
#include<time.h>

void main()
{
    time_t t;   // not a primitive datatype Ref:https://www.geeksforgeeks.org/time-h-header-file-in-c-with-examples/
    time(&t);

    printf("Date and Time is: %s", ctime(&t));
}
