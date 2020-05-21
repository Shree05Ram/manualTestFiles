#include <stdio.h>
#include <time.h>
# include <string.h>

void main () 
{
   char str[500];
   time_t t;
   time(&t);

   strcpy(str,ctime(&t));
	int i=strlen(str);

   //printf("Enter a string : ");
   //gets(str);

   printf("You entered: %s", str);
	printf("\n string length %d", i);
}
