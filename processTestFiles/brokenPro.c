# include <stdio.h>
# include <unistd.h>
# include <stdlib.h>
void main()
{
	int i=0, x, sleepTime;
	char buff[30], *base=" ./brokenProOutput.sh \"`date`\"";

	scanf("%d",&x);

	sleepTime=x*60;

	while(i<sleepTime)
        {
                sleep(10);
                i=i+10;

                sprintf(buff, "%s %d",base,i);          //Generate cmd with required inputs                                                         
                system(buff);                           //Execute cmd

                printf("%d \n",i);
        }
	
}
