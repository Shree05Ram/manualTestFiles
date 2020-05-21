# include <stdio.h>
# include <stdlib.h>
# include <unistd.h>

void main()
{
	int i=0;
	char buff[30], *base=" ./45minOutput.sh \"`date`\"";
	while(i<2700)	//45 minutes
	{
		sleep(10);
		i=i+10;

		sprintf(buff, "%s %d",base,i);		//Generate cmd with required inputs 
		system(buff);				//Execute cmd

		printf("%d \n",i);
	}
}
