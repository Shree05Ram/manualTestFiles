# include <stdio.h>
# include <stdlib.h>
# include <unistd.h>

void main ()
{
	int i=0;
        char buff[30], *base=" ./splChar.sh \"`date`\"";
	while(1)
	{
                sleep(10);
                i=i+10;

                sprintf(buff, "%s %d",base,i);          //Generate cmd with required inputs                                                         
                system(buff);                           //Execute cmd

                printf("%d \n",i);	
	}
}
