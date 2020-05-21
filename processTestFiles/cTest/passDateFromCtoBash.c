# include <stdio.h>
# include <string.h>
# include <stdlib.h>

void main()
{
	int i=10;
	char buff[30], *base="./dateFromC.sh \"`date`\"";
	
	sprintf(buff, "%s %d",base,i);
	system(buff);
}
