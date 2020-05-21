#include <stdio.h>
#include <unistd.h>
void main()
{
	int i=0,sleepTime=180;
	while(i<sleepTime)
	{
		sleep(10);
		i=i+10;
		printf("%d \n",i);
	}
}
